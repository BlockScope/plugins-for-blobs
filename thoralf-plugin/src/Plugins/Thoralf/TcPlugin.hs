{-# LANGUAGE TypeFamilies, TypeInType, NamedFieldPuns #-}

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
import qualified SimpleSMT as SMT
import System.IO.Error (catchIOError)
import Data.IORef (IORef)
import GHC.Corroborate hiding (tracePlugin)
import GHC.Corroborate.Divulge (divulgeClass)
import Plugins.Print
    (DebugCts(..), Indent(..), pprSolverCallCount, pprCtsStepProblem, pprCtsStepSolution)

import ThoralfPlugin.Extract (maybeExtractTyEq, maybeExtractTyDisEq)
import qualified ThoralfPlugin.Extract as Ex(extractEq, extractDisEq)
import ThoralfPlugin.Convert (ExtractEq(..), EncodingData(..), ConvCts(..), convert)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Print.SMT (SmtGivens(..), SmtWanteds(..), SmtDecls(..), pprSmtInputs)
import Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..), TraceSmtConversation(..)
    , tracePlugin, traceSmt, pprConvCtsStep, pprSmtStep
    )

data ThoralfState =
    ThoralfState
        { smtRef :: IORef (SMT.Solver, Int)
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
thoralfPlugin dbgPlugin dbgSmt@DebugSmt{traceSmtConversation} pkgModuleName seed =
    TcPlugin
        { tcPluginInit = mkThoralfInit pkgModuleName seed traceSmtConversation
        , tcPluginSolve = thoralfSolver dbgPlugin dbgSmt
        , tcPluginStop = thoralfStop
        }

solverWithLevel :: TraceSmtConversation -> IO SMT.Solver
solverWithLevel (TraceSmtConversation False) = grabSMTsolver Nothing
solverWithLevel (TraceSmtConversation True) = grabSMTsolver . Just =<< SMT.newLogger 0

grabSMTsolver :: Maybe SMT.Logger -> IO SMT.Solver
grabSMTsolver = SMT.newSolver "z3" ["-smt2", "-in"]

mkThoralfInit
    :: PkgModuleName
    -> TcPluginM TheoryEncoding
    -> TraceSmtConversation
    -> TcPluginM ThoralfState
mkThoralfInit PkgModuleName{moduleName = disEqName, pkgName} seed debug = do
    encoding <- seed
    Found _ disEqModule <- findImportedModule disEqName (Just pkgName)
    disEq <- divulgeClass disEqModule "DisEquality"
    z3Solver <- tcPluginIO $ do
        z3Solver <- solverWithLevel debug
        SMT.push z3Solver
        return z3Solver
    solverRef <- unsafeTcPluginTcM $ newMutVar (z3Solver, 0)
    return
        ThoralfState
            { smtRef = solverRef
            , theoryEncoding = encoding
            , disEqClass = disEq
            , extract = ExtractEq Ex.extractEq Ex.extractDisEq
            }

thoralfStop :: ThoralfState -> TcPluginM ()
thoralfStop ThoralfState{smtRef} = do
    (solver, _) <- unsafeTcPluginTcM $ readMutVar smtRef
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
    dbgSmt@DebugSmt{traceConvertCtsToSmt, traceSmtConversation}
    ThoralfState
        { smtRef
        , theoryEncoding
        , disEqClass
        , extract
        }
    gs' ds' ws' = do
    -- Refresh the solver
    _ <- refresh theoryEncoding smtRef traceSmtConversation
    (smt, calls) <- unsafeTcPluginTcM $ readMutVar smtRef
    _ <- tracePlugin
            dbgPlugin
            (pprSolverCallCount "ghc-tcplugin-thoralf" iIndent traceCallCount calls)

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
            logSmtInputs
                (SmtGivens $ fst <$> gExprs)
                (SmtWanteds $ fst <$> wExprs)
                (SmtDecls $ decs1 ++ decs2)
            logConvCts step
            logSmt step

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

        logSmtInputs gs ds ws =
            tracePlugin dbgPlugin $ pprSmtInputs jIndent traceConvertCtsToSmt gs ds ws ""

        logCtsProblem msg gs ds ws = sequence_ $
            tracePlugin dbgPlugin <$> pprCtsStepProblem "cts-problem" jIndent dbgPlugin msg gs ds ws

        logCtsSolution x = sequence_ $
            tracePlugin dbgPlugin <$> pprCtsStepSolution "cts-solution" jIndent dbgPlugin x

        logConvCts step = sequence_ $
            tracePlugin dbgPlugin <$> pprConvCtsStep jIndent dbgSmt step

        logSmt step = sequence_ $
            traceSmt dbgSmt <$> pprSmtStep jIndent dbgSmt step

        smtWanted ws = foldl SMT.or (SMT.Atom "false") (map (SMT.not . fst) ws)

refresh
    :: TheoryEncoding
    -> IORef (SMT.Solver, Int)
    -> TraceSmtConversation
    -> TcPluginM ()
refresh encoding solverRef debug = do
    (solver, n) <- unsafeTcPluginTcM $ readMutVar solverRef
    _ <- tcPluginIO $ SMT.stop solver
    let decs = startDecs encoding

    z3Solver <- tcPluginIO $ do
        z3Solver <- solverWithLevel debug
        SMT.ackCommand z3Solver typeDataType
        traverse_ (SMT.ackCommand z3Solver . SMT.Atom) decs
        SMT.push z3Solver
        return z3Solver

    unsafeTcPluginTcM $ writeMutVar solverRef (z3Solver, n + 1)
    where
        typeDataType =
            SMT.Atom
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
