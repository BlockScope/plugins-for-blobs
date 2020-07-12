{-# LANGUAGE TypeFamilies, TypeInType, NamedFieldPuns #-}

module Plugins.Thoralf.TcPlugin (thoralfPlugin) where

import Prelude hiding (showList)
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import Data.List ((\\))
import qualified SimpleSMT as SMT
import System.IO.Error (catchIOError)
import Data.IORef (IORef)
import GHC.Corroborate hiding (tracePlugin)
import GHC.Corroborate.Divulge (divulgeClass)

import ThoralfPlugin.Convert
    (EncodingData(..), ConvCts(..), maybeExtractTyEq, maybeExtractTyDisEq, convert)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugPlugin(..), DebugSmt(..), TraceSmtConversation(..)
    , tracePlugin, traceSmt, pprConvCtsStep, pprSmtStep
    )
import Plugins.Print.Constraints (printCts, pprSolverCallCount)

data ThoralfState =
    ThoralfState
        { smtSolver :: IORef (SMT.Solver, Int)
        , theoryEncoding :: TheoryEncoding
        , disEqClass :: Class
        }

thoralfPlugin
    :: DebugPlugin
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
            { smtSolver = solverRef
            , theoryEncoding = encoding
            , disEqClass = disEq
            }

thoralfStop :: ThoralfState -> TcPluginM ()
thoralfStop ThoralfState{smtSolver = solverRef} = do
    (solver, _) <- unsafeTcPluginTcM $ readMutVar solverRef
    _ <- tcPluginIO (SMT.stop solver)
    return ()

thoralfSolver
    :: DebugPlugin
    -> DebugSmt
    -> ThoralfState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
thoralfSolver
    dbgPlugin@DebugPlugin{traceCallCount, traceCts}
    dbgSmt@DebugSmt{traceSmtConversation}
    ThoralfState
        { smtSolver = smtRef
        , theoryEncoding = encode
        , disEqClass = deCls
        }
    gs' ds' ws' = do
    -- Refresh the solver
    _ <- refresh encode smtRef traceSmtConversation
    (smt, calls) <- unsafeTcPluginTcM $ readMutVar smtRef
    _ <- tracePlugin dbgPlugin $ pprSolverCallCount traceCallCount calls

    -- Preprocessing
    let filt = filter $ isEqCt deCls
    let gs = filt gs'
    let ds = filt ds'
    let ws = filt ws'
    _ <- printCts traceCts False gs ds ws

    -- Define reused functions
    --let print = tcPluginIO . putStrLn . show
    let hideError = flip catchIOError (const $ return SMT.Sat)
    let pop = SMT.pop smt
    let noSolving = return $ TcPluginOk [] []
    let convertor = convert (EncodingData deCls encode)

    case (convertor gs, convertor $ ws ++ ds) of
        (Just gCCs@(ConvCts gExprs decs1), Just wCCs@(ConvCts wExprs decs2)) -> do
            sequence_
                $ tracePlugin dbgPlugin
                <$> pprConvCtsStep dbgPlugin (ConvCtsStep gCCs wCCs)

            sequence_
                $ traceSmt dbgSmt
                <$> pprSmtStep dbgSmt (ConvCtsStep gCCs wCCs)

            let decs2' = decs2 \\ decs1
            let wSExpr = foldl SMT.or (SMT.Atom "false") (map (SMT.not . fst) wExprs)
            let wCtsWithEv = mapMaybe (addEvTerm . snd) wExprs
            givenCheck <- tcPluginIO $ hideError $ do
                SMT.push smt
                traverse_ (SMT.ackCommand smt) decs1
                traverse_ (SMT.assert smt . fst) gExprs
                SMT.check smt

            case givenCheck of
                SMT.Unknown -> tcPluginIO pop >> noSolving

                SMT.Unsat -> do
                    tcPluginIO $ putStrLn "\nInconsistent Givens" >> pop
                    return $ TcPluginContradiction []

                SMT.Sat -> do
                    wantedCheck <- tcPluginIO $ hideError $ do
                        traverse_ (SMT.ackCommand smt) decs2'
                        SMT.assert smt wSExpr
                        SMT.check smt

                    case wantedCheck of
                        SMT.Unsat -> do
                            --print wCtsWithEv
                            tcPluginIO pop
                            return (TcPluginOk wCtsWithEv [])

                        SMT.Unknown -> tcPluginIO pop >> noSolving

                        SMT.Sat -> tcPluginIO pop >> noSolving

        _ -> printCts traceCts True gs ws ds

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
    return (makeEqEvidence "Fm Plugin" (t1,t2), ct')

-- | Make EvTerms for any two types.  Give the types inside a Predtree of the
-- form (EqPred NomEq t1 t2)
makeEqEvidence :: String -> (Type, Type) -> EvTerm
makeEqEvidence s' (t1, t2) = evByFiat s' t1 t2
