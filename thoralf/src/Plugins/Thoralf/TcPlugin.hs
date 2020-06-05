{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}

module Plugins.Thoralf.TcPlugin (thoralfPlugin) where

import Prelude hiding (showList)
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import Data.List ((\\))
import qualified SimpleSMT as SMT
import System.IO.Error (catchIOError)
import Data.IORef (IORef)
import GHC.Corroborate

import ThoralfPlugin.Convert
    (EncodingData(..), ConvCts(..), maybeExtractTyEq, maybeExtractTyDisEq, convert)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import Plugins.Thoralf.Print (printCts, showList)

data ThoralfState =
    ThoralfState
        { smtSolver :: IORef SMT.Solver
        , theoryEncoding :: TheoryEncoding
        , disEqClass :: Class
        }

type Debug = Bool

thoralfPlugin
    :: ModuleName
    -> FastString
    -> TcPluginM TheoryEncoding
    -> Debug
    -> TcPlugin
thoralfPlugin disEqName pkgName seed debug = TcPlugin
    { tcPluginInit = mkThoralfInit disEqName pkgName seed debug
    , tcPluginSolve = thoralfSolver debug
    , tcPluginStop = thoralfStop
    }

solverWithLevel :: Bool -> IO SMT.Solver
solverWithLevel debug = do
    let logLevel = if debug then 0 else 1
    logger <- SMT.newLogger logLevel
    grabSMTsolver logger
    where
        grabSMTsolver :: SMT.Logger -> IO SMT.Solver
        grabSMTsolver logger = SMT.newSolver "z3" ["-smt2", "-in"] (Just logger)

mkThoralfInit
    :: ModuleName
    -> FastString
    -> TcPluginM TheoryEncoding
    -> Debug
    -> TcPluginM ThoralfState
mkThoralfInit disEqName pkgName seed debug = do
    encoding <- seed
    let findModule = findImportedModule
    (Found _ disEqModule) <- findModule disEqName (Just pkgName)
    disEq <- findClass disEqModule "DisEquality"
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
    where
        findClass :: Module -> String -> TcPluginM Class
        findClass md strNm = do
            name <- lookupOrig md (mkTcOcc strNm)
            tcLookupClass name

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
    debug
    ThoralfState
        { smtSolver = smtRef
        , theoryEncoding = encode
        , disEqClass = deCls
        }
    gs' ws' ds' = do
    -- Refresh the solver
    _ <- refresh encode smtRef debug
    smt <- unsafeTcPluginTcM $ readMutVar smtRef

    -- Preprocessing
    let filt = filter $ isEqCt deCls
    let gs = filt gs'
    let ws = filt ws'
    let ds = filt ds'
    _ <- printCts debug False gs ws ds

    -- Define reused functions
    --let print = tcPluginIO . putStrLn . show
    let hideError = flip catchIOError (const $ return SMT.Sat)
    let pop = SMT.pop smt
    let noSolving = return $ TcPluginOk [] []
    let convertor = convert (EncodingData deCls encode)

    case (convertor gs, convertor $ ws ++ ds) of
        (Just (ConvCts gExprs decs1), Just (ConvCts wExprs decs2)) -> do
            debugIO debug $ "\nDecs:" ++ showList (decs1 ++ decs2)
            debugIO debug $ "\nGivens :" ++ showList gExprs
            debugIO debug $ "\nWanteds :" ++ showList wExprs

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

        _ -> printCts debug True gs ws ds

refresh :: TheoryEncoding -> IORef SMT.Solver -> Debug -> TcPluginM ()
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

debugIO :: Bool -> String -> TcPluginM ()
debugIO False _ = return ()
debugIO True s = tcPluginIO $ putStrLn s

-- | Make EvTerms for any two types.  Give the types inside a Predtree of the
-- form (EqPred NomEq t1 t2)
makeEqEvidence :: String -> (Type, Type) -> EvTerm
makeEqEvidence s (t1, t2) = evByFiat s t1 t2
