{-# LANGUAGE TypeFamilies, TypeInType, NamedFieldPuns, QuasiQuotes #-}

module Plugins.Thoralf.TcPlugin (thoralfPlugin) where

import Prelude hiding (showList)
import Language.Haskell.Printf (s)
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import Data.List ((\\))
import qualified SimpleSMT as SMT
import System.IO.Error (catchIOError)
import Data.IORef (IORef)
import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeClass)

import ThoralfPlugin.Convert
    (EncodingData(..), ConvCts(..), maybeExtractTyEq, maybeExtractTyDisEq, convert)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.Print (Debug(..), printCts, showList)

data ThoralfState =
    ThoralfState
        { smtSolver :: IORef SMT.Solver
        , theoryEncoding :: TheoryEncoding
        , disEqClass :: Class
        }

thoralfPlugin :: PkgModuleName -> TcPluginM TheoryEncoding -> Debug -> TcPlugin
thoralfPlugin pkgModuleName seed dbg@Debug{smt} =
    TcPlugin
        { tcPluginInit = mkThoralfInit pkgModuleName seed smt
        , tcPluginSolve = thoralfSolver dbg
        , tcPluginStop = thoralfStop
        }

solverWithLevel :: Bool -> IO SMT.Solver
solverWithLevel False = grabSMTsolver Nothing
solverWithLevel True = grabSMTsolver . Just =<< SMT.newLogger 0

grabSMTsolver :: Maybe SMT.Logger -> IO SMT.Solver
grabSMTsolver logger = SMT.newSolver "z3" ["-smt2", "-in"] logger

mkThoralfInit
    :: PkgModuleName
    -> TcPluginM TheoryEncoding
    -> Bool
    -> TcPluginM ThoralfState
mkThoralfInit PkgModuleName{moduleName = disEqName, pkgName} seed debug = do
    encoding <- seed
    Found _ disEqModule <- findImportedModule disEqName (Just pkgName)
    disEq <- divulgeClass disEqModule "DisEquality"
    z3Solver <- tcPluginIO $ do
        z3Solver <- solverWithLevel debug
        SMT.push z3Solver
        return z3Solver
    solverRef <- unsafeTcPluginTcM $ newMutVar z3Solver
    return
        ThoralfState
            { smtSolver = solverRef
            , theoryEncoding = encoding
            , disEqClass = disEq
            }

thoralfStop :: ThoralfState -> TcPluginM ()
thoralfStop ThoralfState{smtSolver = solverRef} = do
    solver <- unsafeTcPluginTcM $ readMutVar solverRef
    _ <- tcPluginIO (SMT.stop solver)
    return ()

thoralfSolver
    :: Debug
    -> ThoralfState
    -> [Ct]
    -> [Ct]
    -> [Ct]
    -> TcPluginM TcPluginResult
thoralfSolver
    dbg@Debug{smt = debugSMT}
    ThoralfState
        { smtSolver = smtRef
        , theoryEncoding = encode
        , disEqClass = deCls
        }
    gs' ws' ds' = do
    -- Refresh the solver
    _ <- refresh encode smtRef debugSMT
    smt <- unsafeTcPluginTcM $ readMutVar smtRef

    -- Preprocessing
    let filt = filter $ isEqCt deCls
    let gs = filt gs'
    let ws = filt ws'
    let ds = filt ds'
    _ <- printCts dbg False gs ws ds

    -- Define reused functions
    --let print = tcPluginIO . putStrLn . show
    let hideError = flip catchIOError (const $ return SMT.Sat)
    let pop = SMT.pop smt
    let noSolving = return $ TcPluginOk [] []
    let convertor = convert (EncodingData deCls encode)

    case (convertor gs, convertor $ ws ++ ds) of
        (Just (ConvCts gExprs decs1), Just (ConvCts wExprs decs2)) -> do
            debugIO dbg . [s|+++ SMT-Decs = %s|] $ showList (decs1 ++ decs2)
            debugIO dbg . [s|+++ SMT-Givens = %s|] $ showList gExprs
            debugIO dbg . [s|+++ SMT-Wanteds = %s|] $ showList wExprs

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

        _ -> printCts dbg True gs ws ds

refresh :: TheoryEncoding -> IORef SMT.Solver -> Bool -> TcPluginM ()
refresh encoding solverRef debug = do
    solver <- unsafeTcPluginTcM $ readMutVar solverRef
    _ <- tcPluginIO $ SMT.stop solver
    let decs = startDecs encoding

    z3Solver <- tcPluginIO $ do
        z3Solver <- solverWithLevel debug
        SMT.ackCommand z3Solver typeDataType
        traverse_ (SMT.ackCommand z3Solver . SMT.Atom) decs
        SMT.push z3Solver
        return z3Solver

    unsafeTcPluginTcM $ writeMutVar solverRef z3Solver
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

debugIO :: Debug -> String -> TcPluginM ()
debugIO Debug{cts} s'
    | cts == True = tcPluginIO $ putStrLn s'
    | otherwise = return ()

-- | Make EvTerms for any two types.  Give the types inside a Predtree of the
-- form (EqPred NomEq t1 t2)
makeEqEvidence :: String -> (Type, Type) -> EvTerm
makeEqEvidence s' (t1, t2) = evByFiat s' t1 t2
