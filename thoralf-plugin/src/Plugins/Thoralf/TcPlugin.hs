{-# LANGUAGE MultiWayIf, TypeFamilies, TypeInType, NamedFieldPuns #-}

module Plugins.Thoralf.TcPlugin
    ( ThoralfState(..)
    , mkThoralfInit
    , thoralfStop
    , thoralfSolver
    , thoralfPlugin
    , isEqCt
    ) where

import Prelude hiding (showList)
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import Data.List ((\\))
import Data.List.Split (split, onSublist, dropBlanks)
import Control.Monad (when)
import qualified SimpleSMT as SMT
import SimpleSMT (Logger(..))
import System.IO.Error (catchIOError)
import Data.IORef (IORef)
import GHC.Corroborate hiding (tracePlugin)
import GHC.Corroborate.Divulge (divulgeClass)
import Plugins.Print
    (DebugCts(..), Indent(..), pprSolverCallCount, pprCtsStepProblem, pprCtsStepSolution)

import ThoralfPlugin.Extract (maybeExtractTyEq, maybeExtractTyDisEq)
import qualified ThoralfPlugin.Extract as Ex(extractEq, extractDisEq)
import ThoralfPlugin.Convert
    (ExtractEq(..), EncodingData(..), ConvCts(..), convert, justReadSExpr)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Print.SMT (isSilencedTalk)
import Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..), DebugSmtTalk(..), DebugSmtRecv(..), TraceSmtTalk(..)
    , tracePlugin, traceSmt, pprConvCtsStep, pprAsSmtCommentCts, pprSmtStep
    )

data ThoralfState =
    ThoralfState
        { smtSolverRef :: IORef (SMT.Solver, Int)
        , theoryEncoding :: TheoryEncoding
        , disEqClass :: Class
        , extract :: ExtractEq
        }

thoralfPlugin
    :: DebugCts
    -> DebugSmt
    -> PkgModuleName
    -> TcPluginM TheoryEncoding
    -> TcPlugin
thoralfPlugin dbgPlugin dbgSmt pkgModuleName seed =
    TcPlugin
        { tcPluginInit = mkThoralfInit pkgModuleName seed dbgSmt
        , tcPluginSolve = thoralfSolver dbgPlugin dbgSmt
        , tcPluginStop = thoralfStop
        }

-- TODO: Contribute upstream to SimpleSMT to avoid matching on string prefixes.
solverWithLevel :: TraceSmtTalk -> IO SMT.Solver
solverWithLevel (TraceSmtTalk dbg)
    | isSilencedTalk dbg = grabSMTsolver Nothing
    | otherwise = do
        logger@Logger{logMessage = logMsg} <- SMT.newLogger 0
        let logger' = logger{logMessage = \s -> do
            let sends = split (dropBlanks $ onSublist "[send->] ") s
            let recvs = split (dropBlanks $ onSublist "[<-recv] ") s
            let errs = split (dropBlanks $ onSublist "[stderr] ") s

            let dbgArrow = traceArrow dbg
            let dbgSend = traceSend dbg

            let dbgRecvCheckSat =
                    case traceRecv dbg of
                        DebugSmtRecvSome{traceCheckSat = b} -> b
                        _ -> False

            let dbgRecvSuccess =
                    case traceRecv dbg of
                        DebugSmtRecvSome{traceSuccess = b} -> b
                        _ -> False

            let dbgRecvAll = DebugSmtRecvAll True == traceRecv dbg

            case (recvs, sends, errs) of
                (_, "[send->] " : [msg], _) ->
                    if | dbgSend && dbgArrow -> logMsg s
                        | dbgSend -> logMsg msg
                        | otherwise -> return ()

                -- NOTE: :print-success can print success | unsupported | error _.
                ("[<-recv] " : msgContent, _, _) ->
                    case msgContent of
                        [msg@"sat"] ->
                            if | dbgRecvCheckSat && dbgArrow -> logMsg s
                                | dbgRecvCheckSat -> logMsg msg
                                | otherwise -> return ()

                        [msg@"unsat"] ->
                            if | dbgRecvCheckSat && dbgArrow -> logMsg s
                                | dbgRecvCheckSat -> logMsg msg
                                | otherwise -> return ()

                        [msg@"success"] ->
                            if | dbgRecvSuccess && dbgArrow -> logMsg s
                                | dbgRecvSuccess -> logMsg msg
                                | otherwise -> return ()

                        [msg@"unsupported"] ->
                            if | dbgRecvSuccess && dbgArrow -> logMsg s
                                | dbgRecvSuccess -> logMsg msg
                                | otherwise -> return ()

                        "error" : _ ->
                            if | dbgRecvSuccess && dbgArrow -> logMsg s
                                | dbgRecvSuccess -> logMsg $ drop (length "[<-recv] error ") s
                                | otherwise -> return ()

                        _msgs ->
                            if | dbgRecvAll && dbgArrow -> logMsg s
                                | dbgRecvAll -> logMsg s
                                | otherwise -> return ()

                (_, _, "[stderr] " : _) ->
                    when (traceErr dbg) $ logMsg s

                (_, _, _) ->
                    when (traceOther dbg) $ logMsg s
            }

        grabSMTsolver (Just logger')

grabSMTsolver :: Maybe SMT.Logger -> IO SMT.Solver
grabSMTsolver =
    -- NOTE: If you don't want the s-expressions pretty printed then substitute
    -- SMT.showsSExpr for SMT.ppSExpr.
    SMT.newSolver "z3" ["-smt2", "-in"] SMT.ppSExpr

mkThoralfInit
    :: PkgModuleName
    -> TcPluginM TheoryEncoding
    -> DebugSmt
    -> TcPluginM ThoralfState
mkThoralfInit
    PkgModuleName{moduleName = disEqName, pkgName}
    seed
    DebugSmt{traceSmtTalk} = do

    theoryEncoding <- seed
    Found _ disEqModule <- findImportedModule disEqName (Just pkgName)
    disEq <- divulgeClass disEqModule "DisEquality"

    z3Solver <- tcPluginIO $ do
        z3Solver <- solverWithLevel traceSmtTalk
        SMT.push z3Solver
        return z3Solver

    smtSolverRef <- unsafeTcPluginTcM $ newMutVar (z3Solver, 0)

    -- TODO: Rename refresh now that I'm calling it at initialization.
    _ <- refresh theoryEncoding smtSolverRef traceSmtTalk

    return
        ThoralfState
            { smtSolverRef = smtSolverRef
            , theoryEncoding = theoryEncoding
            , disEqClass = disEq
            , extract = ExtractEq Ex.extractEq Ex.extractDisEq
            }

thoralfStop :: ThoralfState -> TcPluginM ()
thoralfStop ThoralfState{smtSolverRef} = do
    (solver, _) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
    _ <- tcPluginIO (SMT.stop solver)
    return ()

thoralfSolver
    :: DebugCts
    -> DebugSmt
    -> ThoralfState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
thoralfSolver
    dbgPlugin@DebugCts{traceCallCount}
    dbgSmt
    ThoralfState
        { smtSolverRef
        , theoryEncoding
        , disEqClass
        , extract
        }
    gs' ds' ws' = do
    (smt, calls) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
    _ <- tracePlugin
            dbgPlugin
            (pprSolverCallCount traceCallCount "ghc-tcplugin-thoralf" iIndent calls)

    -- Preprocessing
    let filt = filter $ isEqCt disEqClass
    let gs = filt gs'
    let ds = filt ds'
    let ws = filt ws'
    logCtsProblem (Just constraintAsIs) gs' ds' ws'
    logCtsProblem (Just constraintFiltered) gs ds ws

    -- Define reused functions
    let hideError = flip catchIOError (const $ return SMT.Sat)
    let pop = SMT.pop smt
    let noSolving = return $ TcPluginOk [] []
    let convertor = convert extract (EncodingData disEqClass theoryEncoding)

    let gsConvCts = convertor gs
    let wsConvCts = convertor $ ws ++ ds
    tcPluginTrace "thoralf-solve gsConvCts" $ ppr gsConvCts
    tcPluginTrace "thoralf-solve wsConvCts" $ ppr wsConvCts
    case (gsConvCts, wsConvCts) of
        (Just gCCs@(ConvCts gExprs decs1), Just wCCs@(ConvCts wExprs decs2)) -> do
            let step = ConvCtsStep gCCs wCCs
            logConvCts step
            logSmtComments step
            logSmtCts step

            givenCheck <- tcPluginIO $ hideError $ do
                SMT.push smt
                traverse_ (SMT.ackCommand smt) decs1
                traverse_ (SMT.assert smt . fst) gExprs
                SMT.check smt

            tcPluginTrace "thoralf-solve decls" $ ppr ds'
            tcPluginTrace "thoralf-solve decls filtered" $ ppr ds
            tcPluginTrace "thoralf-solve givens" $ ppr gs'
            tcPluginTrace "thoralf-solve givens filtered" $ ppr gs
            tcPluginTrace "thoralf-solve wanteds" $ ppr ws'
            tcPluginTrace "thoralf-solve wanteds filtered" $ ppr ws
            tcPluginTrace "thoralf-solve simplified given sexprs" $ ppr gExprs
            case givenCheck of
                SMT.Unknown -> tcPluginIO pop >> noSolving

                SMT.Unsat -> do
                    tcPluginIO $ putStrLn "Inconsistent Givens" >> pop
                    return $ TcPluginContradiction []

                SMT.Sat -> do
                    wantedCheck <- tcPluginIO $ hideError $ do
                        traverse_ (SMT.ackCommand smt) (decs2 \\ decs1)
                        SMT.assert smt (smtWanted wExprs)
                        SMT.check smt

                    case wantedCheck of
                        SMT.Unsat -> do
                            tcPluginIO pop

                            let solvedCts = mapMaybe (addEvTerm . snd) wExprs
                            let ok = TcPluginOk solvedCts []
                            tcPluginTrace "thoralf-solve simplified wanteds" $ ppr solvedCts
                            logCtsSolution ok
                            return ok

                        SMT.Unknown -> tcPluginIO pop >> noSolving

                        SMT.Sat -> tcPluginIO pop >> noSolving

        _ -> tcPluginIO (putStrLn "Parse Failed") >> noSolving

    where
        iIndent@(Indent i) = Indent 1
        tab = showString $ replicate (2 * i) ' '

        jIndent = iIndent + 1

        constraintAsIs = (tab . showString "[constraints-as-is]") ""
        constraintFiltered = (tab . showString "[constraints-filtered]") ""

        logCtsProblem msg gs ds ws =
            sequence_
            $ tracePlugin dbgPlugin
            <$> pprCtsStepProblem dbgPlugin "cts-problem" jIndent msg gs ds ws

        logCtsSolution x =
            sequence_
            $ tracePlugin dbgPlugin
            <$> pprCtsStepSolution dbgPlugin "cts-solution" jIndent x

        logConvCts step =
            sequence_
            $ tracePlugin dbgPlugin
            <$> pprConvCtsStep jIndent dbgSmt step

        logSmtComments step =
            sequence_
            $ traceSmt dbgSmt <$> pprAsSmtCommentCts dbgSmt step

        logSmtCts step =
            sequence_
            $ traceSmt dbgSmt <$> pprSmtStep dbgSmt jIndent step

        smtWanted ws = foldl SMT.or (justReadSExpr "false") (map (SMT.not . fst) ws)

-- TODO: Rename refresh now that I'm calling it at initialization.
refresh
    :: TheoryEncoding
    -> IORef (SMT.Solver, Int)
    -> TraceSmtTalk
    -> TcPluginM ()
refresh encoding smtSolverRef debug = do
    (solver, n) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
    _ <- tcPluginIO $ SMT.stop solver
    let decs = startDecs encoding

    z3Solver <- tcPluginIO $ do
        z3Solver <- solverWithLevel debug
        SMT.ackCommand z3Solver typeDataType
        traverse_ (SMT.ackCommand z3Solver . justReadSExpr) decs
        SMT.push z3Solver
        return z3Solver

    unsafeTcPluginTcM $ writeMutVar smtSolverRef (z3Solver, n + 1)
    where
        typeDataType =
            justReadSExpr
                -- WARNING: As one long line to avoid problems with CPP and string gaps.
                "(declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))"

isEqCt :: Class -> Ct -> Bool
isEqCt diseq ct = case (maybeExtractTyEq ct, maybeExtractTyDisEq diseq ct) of
    (Nothing, Nothing) -> False
    _ -> True

-- * Solver Helper Functions
--------------------------------------------------------------------------------

-- Note: We assume the use of addEvTerm is non-failing.
-- That is, we assume (length $ mapMaybe addEvTerm wCts) == length wCts.

addEvTerm :: Ct -> Maybe (EvTerm, Ct)
addEvTerm ct = do
    ((t1, t2), ct') <- maybeExtractTyEq ct
    -- We never have a wanted disequality.
    return (makeEqEvidence "thoralf" (t1,t2), ct')

-- | Make EvTerms for any two types.  Give the types inside a Predtree of the
-- form (EqPred NomEq t1 t2)
makeEqEvidence :: String -> (Type, Type) -> EvTerm
makeEqEvidence s' (t1, t2) = evByFiat s' t1 t2
