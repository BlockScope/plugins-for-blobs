{-# LANGUAGE MultiWayIf, NamedFieldPuns, ParallelListComp, TypeFamilies, TypeInType #-}

module Plugins.Thoralf.TcPlugin
    ( ThoralfState(..)
    , mkThoralfInit
    , thoralfStop
    , thoralfSolver
    , thoralfPlugin
    , isEqCt
    ) where

import Prelude hiding (showList, cycle)
import Data.Set (Set)
import qualified Data.Set as Set
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import Data.List ((\\), foldl1')
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
    (ExtractEq(..), EncodingData(..), ConvCts(..), ConvEq(..), convert, justReadSExpr)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Print.SMT (isSilencedTalk)
import Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..), DebugSmtRecv(..), TraceSmtTalk(..)
    , tracePlugin, traceSmt, pprConvCtsStep, pprAsSmtCommentCts, pprSmtStep, pprSDoc
    )

data ThoralfState =
    ThoralfState
        { theoryEncoding :: TheoryEncoding
        , disEqClass :: Class
        , extract :: ExtractEq
        , smtSolverRef :: IORef (SMT.Solver, Int)
        , seenDecsRef :: IORef (Set SMT.SExpr)
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
solverWithLevel dbg
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
                               | dbgRecvCheckSat -> logMsg $ "; " ++ msg
                               | otherwise -> return ()

                        [msg@"unsat"] ->
                            if | dbgRecvCheckSat && dbgArrow -> logMsg s
                               | dbgRecvCheckSat -> logMsg $ "; " ++ msg
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

options :: [String]
options =
    -- NOTE: ":print-success" and ":produce-models" are set up for us.
    -- TODO: Use ":global-declarations" to check we're not declaring a variable
    -- twice.
    [ ":interactive-mode"
    , ":produce-assertions"
    , ":produce-models"
    , ":produce-assignments"
    , ":produce-proofs"
    , ":produce-unsat-assumptions"
    , ":produce-unsat-cores"
    ]

mkThoralfInit
    :: PkgModuleName
    -> TcPluginM TheoryEncoding
    -> DebugSmt
    -> TcPluginM ThoralfState
mkThoralfInit
    PkgModuleName{moduleName = disEqName, pkgName}
    seed
    DebugSmt{traceSmtTalk} = do

    encoding@TheoryEncoding{startDecs = decs} <- seed
    Found _ disEqModule <- findImportedModule disEqName (Just pkgName)
    disEq <- divulgeClass disEqModule "DisEquality"

    smtSolver <- tcPluginIO $ solverWithLevel traceSmtTalk
    smtSolverRef <- unsafeTcPluginTcM $ newMutVar (smtSolver, 1)

    tcPluginIO $ sequence_ [ SMT.setOption smtSolver o "true" | o <- options ]

    let startDecs = justReadSExpr <$> decs
    seenDecsRef  <- unsafeTcPluginTcM . newMutVar $ Set.fromList startDecs
    _ <- tcPluginIO $ do
        traverse_ (SMT.ackCommand smtSolver) startDecs
        return smtSolver

    return
        ThoralfState
            { smtSolverRef = smtSolverRef
            , theoryEncoding = encoding
            , disEqClass = disEq
            , extract = ExtractEq Ex.extractEq Ex.extractDisEq
            , seenDecsRef = seenDecsRef
            }

thoralfStop :: ThoralfState -> TcPluginM ()
thoralfStop ThoralfState{smtSolverRef} = do
    (smtSolver, _) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
    _ <- tcPluginIO (SMT.stop smtSolver)
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
        , seenDecsRef
        }
    gs' ds' ws' = do

    (smtSolver, calls) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
    unsafeTcPluginTcM $ writeMutVar smtSolverRef (smtSolver, calls + 1)
    seenDecs <- unsafeTcPluginTcM $ readMutVar seenDecsRef

    let cycle = show calls
    tcPluginIO . SMT.echo smtSolver $ "solver-start-cycle-" ++ cycle

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
    let hideError = flip catchIOError (const $ return (Set.empty, SMT.Sat))
    let noSolving = return $ TcPluginOk [] []
    let convertor = convert extract (EncodingData disEqClass theoryEncoding)

    let gsConvCts = convertor gs
    let wsConvCts = convertor $ ws ++ ds
    tcPluginTrace "thoralf-solve gsConvCts" $ ppr gsConvCts
    tcPluginTrace "thoralf-solve wsConvCts" $ ppr wsConvCts

    (decs1Unseen, decs2Unseen, ctSolving) <- case (gsConvCts, wsConvCts) of

        -- With no wanted constraints there's no useful work to do. Checking the
        -- consistency of the givens without wanteds is not useful.
        (Just _, Just (ConvCts _ [] _)) -> return (Set.empty, Set.empty, TcPluginOk [] [])

        (Just gCCs@(ConvCts ns1 gExprs decs1), Just wCCs@(ConvCts ns2 wExprs decs2)) -> do
            let step = ConvCtsStep gCCs wCCs
            logConvCts step
            logSmtComments step
            logSmtCts step

            (decs1Unseen, givenCheck) <- tcPluginIO $ do
                SMT.echo smtSolver $ "givens-start-cycle-" ++ cycle
                putStrLn "; GIVENS (conversions)"
                sequence_ [ putStrLn $ pprSDoc e "" | e <- wExprs ]
                putStrLn "; GIVENS (names)"
                printAltNames ns1
                (decs1Unseen, check) <- hideError $ do
                    SMT.push smtSolver

                    let decs1Unseen = Set.difference (Set.fromList decs1) seenDecs
                    let decs1Seen = Set.intersection (Set.fromList decs1) seenDecs
                    putStrLn "; DECS1 (seen) "
                    printDecs decs1Seen
                    putStrLn "; DECS1 (unseen) "
                    printDecs decs1Unseen
                    traverse_ (SMT.ackCommand smtSolver) decs1

                    sequence_ $
                        [ SMT.assert smtSolver $ SMT.named name e
                        | e <- eqSExpr <$> gExprs
                        | nth <- [1 :: Int ..]
                        , let name = "given-" ++ cycle ++ "." ++ show nth
                        ]
                    c <- SMT.check smtSolver
                    return (decs1Unseen, c)

                SMT.echo smtSolver $ "givens-finish-cycle-" ++ cycle
                return (decs1Unseen, check)

            tcPluginTrace "thoralf-solve decls" $ ppr ds'
            tcPluginTrace "thoralf-solve decls filtered" $ ppr ds
            tcPluginTrace "thoralf-solve givens" $ ppr gs'
            tcPluginTrace "thoralf-solve givens filtered" $ ppr gs
            tcPluginTrace "thoralf-solve wanteds" $ ppr ws'
            tcPluginTrace "thoralf-solve wanteds filtered" $ ppr ws
            tcPluginTrace "thoralf-solve simplified given sexprs" $ ppr gExprs

            (decs2Unseen, solveCheck) <- case givenCheck of
                    SMT.Unknown -> do
                        c <- tcPluginIO (SMT.pop smtSolver) >> noSolving
                        return (Set.empty, c)

                    SMT.Unsat -> do
                        tcPluginIO $ putStrLn "; Inconsistent Givens" >> SMT.pop smtSolver
                        return (Set.empty, TcPluginContradiction [])

                    SMT.Sat -> do
                        (decs2Unseen, wantedCheck) <- tcPluginIO $ do
                            SMT.echo smtSolver $ "wanteds-start-cycle-" ++ cycle
                            putStrLn "; WANTEDS (conversions)"
                            sequence_ [ putStrLn $ pprSDoc e "" | e <- wExprs ]
                            putStrLn "; WANTEDS (names)"
                            printAltNames ns2
                            setCheck <- hideError $ do

                                let decs2' = decs2 \\ decs1
                                let decs2Unseen = Set.difference (Set.fromList decs2') seenDecs 
                                let decs2Seen = Set.intersection (Set.fromList decs2') seenDecs

                                putStrLn "; DECS2 (seen) "
                                printDecs decs2Seen
                                putStrLn "; DECS2 (unseen) "
                                printDecs decs2Unseen
                                traverse_ (SMT.ackCommand smtSolver) decs2'

                                let name = "wanted-" ++ cycle 
                                SMT.assert smtSolver $ SMT.named name (smtWanted wExprs)
                                c <- SMT.check smtSolver
                                return (decs2Unseen, c)

                            SMT.echo smtSolver $ "wanteds-finish-cycle-" ++ cycle
                            return setCheck

                        solveCheck <- case wantedCheck of
                            SMT.Unsat -> do
                                assertions <- tcPluginIO $ getAssertions smtSolver
                                tcPluginIO $ printCommented assertions
                                unsatCore <- tcPluginIO $ getUnsatCore smtSolver
                                tcPluginIO $ printCommented unsatCore
                                tcPluginIO (SMT.pop smtSolver)

                                let solvedCts = mapMaybe (addEvTerm . eqCt) wExprs
                                let ok = TcPluginOk solvedCts []
                                tcPluginTrace "thoralf-solve simplified wanteds" $ ppr solvedCts
                                logCtsSolution ok
                                return ok

                            SMT.Unknown -> tcPluginIO (SMT.pop smtSolver) >> noSolving

                            SMT.Sat ->do
                                model <- tcPluginIO $ getModel smtSolver
                                tcPluginIO $ printCommented model
                                tcPluginIO (SMT.pop smtSolver) >> noSolving

                        return (decs2Unseen, solveCheck)

            return (decs1Unseen, decs2Unseen, solveCheck)

        _ -> do
            c <- tcPluginIO (putStrLn "Parse Failed") >> noSolving
            return (Set.empty, Set.empty, c)

    let seenDecs' = Set.unions [seenDecs, decs1Unseen, decs2Unseen]
    unsafeTcPluginTcM $ writeMutVar seenDecsRef seenDecs'
    tcPluginIO . SMT.echo smtSolver $ "solver-finish-cycle-" ++ cycle
    return ctSolving

    where
        iIndent@(Indent i) = Indent 1
        tab = showString $ replicate (2 * i) ' '

        jIndent = iIndent + 1

        constraintAsIs = (tab . showString "[constraints-as-is]") ""
        constraintFiltered = (tab . showString "[constraints-filtered]") ""

        getAssertions = flip SMT.command (SMT.List [ SMT.Atom "get-assertions" ])
        getModel = flip SMT.command (SMT.List [ SMT.Atom "get-model" ])
        getUnsatCore = flip SMT.command (SMT.List [ SMT.Atom "get-unsat-core" ])

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

        smtWanted :: [ConvEq] -> SMT.SExpr
        smtWanted [] = SMT.Atom "false"
        smtWanted ws = foldl1' SMT.or (map (SMT.not . eqSExpr) ws)

        printAltNames ns =
            sequence_
                [ putStrLn . showSDocUnsafe $
                    ( text "; " <+> ppr thoralfName <+> text " <= " <+> ppr ghcName)
                | (ghcName, thoralfName) <- ns
                ]

        printDecs decs =
            sequence_
                [ putStrLn $ "; " ++ SMT.showsSExpr dec ""
                | dec <- Set.toList decs
                ]

        printCommented as =
            sequence_
                [ putStrLn $ "; " ++ line
                | line <- lines $ SMT.ppSExpr as ""
                ]

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
