{-# LANGUAGE CPP, GADTs  #-}
{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}

{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Plugins.Thoralf.TcPlugin (thoralfPlugin) where

import Prelude hiding (showList)
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import Data.List ((\\), intercalate)
import qualified Data.Map.Strict as M
import qualified Data.Set as Set
import qualified SimpleSMT as SMT
import Class (Class(..))
import System.IO.Error
import Data.IORef (IORef)
import GhcPlugins (ModuleName, FastString, getUnique, getOccName )
import TcPluginM
    ( tcPluginIO, lookupOrig, tcLookupClass
    , findImportedModule, FindResult(..), zonkCt
    , unsafeTcPluginTcM
    )
import TcRnTypes
    (WantedConstraints, Ct, TcPluginM, TcPluginResult(..), TcPlugin(..))
import TcType (isMetaTyVar)

#if __GLASGOW_HASKELL__ > 804
import TcEvidence (EvTerm(..), evCoercion)
#else
import TcEvidence (EvTerm(..))
#endif

import TyCoRep (UnivCoProvenance(..))
import Coercion (mkUnivCo, Role(..))
import Type (Type, splitTyConApp_maybe, getTyVar_maybe)
import TyCon (TyCon)
import Var (Var, isTcTyVar)
import Module (Module)
import OccName (mkTcOcc, occNameString)
import Outputable (showSDocUnsafe, ppr)
import IOEnv (newMutVar, readMutVar, writeMutVar)

import ThoralfPlugin.Convert --( convertor, maybeExtractTyEq )
import ThoralfPlugin.Encode.TheoryEncoding ( TheoryEncoding (..) )

-- Renaming
type Set = Set.Set
type Map = M.Map

data ThoralfState where
  ThoralfState ::
    { smtSolver :: IORef SMT.Solver
    , theoryEncoding :: TheoryEncoding
    , disEqClass :: Class
    } -> ThoralfState

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
    return $ ThoralfState solverRef encoding disEq
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
thoralfSolver debug (ThoralfState smtRef encode deCls) gs' ws' ds' = do
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
        typeDataType = SMT.Atom typeData

        typeData =
            -- As one long line to avoid problems with CPP and string gaps.
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

printParsedInputs :: Bool -> [SExpr] -> SExpr -> [SExpr] -> TcPluginM ()
printParsedInputs True gSExpr wSExpr parseDeclrs = tcPluginIO $ do
    putStrLn $ "Given SExpr: \n" ++ show (map (`SMT.showsSExpr` "") gSExpr)
    putStrLn $ "Wanted SExpr: \n" ++ SMT.showsSExpr wSExpr ""
    putStrLn $ "Variable Decs: \n" ++ show (map (`SMT.showsSExpr` "") parseDeclrs)
printParsedInputs False _ _ _ = return ()

printCts :: Bool -> Bool -> [Ct] -> [Ct] -> [Ct] -> TcPluginM TcPluginResult
printCts True bool gs ws ds = do
    let iffail = "\n\n" ++ if bool then "Parse Failure" else "Solver call start" ++ "\n\n"
    tcPluginIO $ do
        putStrLn "\n\n  ----- Plugin Call HERE !!! ------\n\n"
        putStrLn iffail
        putStrLn ("\tGivens: \n" ++ showList gs)
        putStrLn ("\tWanteds: \n" ++ showList ws)
        putStrLn ("\tDesireds: \n" ++ showList ds)
    return $ TcPluginOk [] []
printCts False _ _ _ _ = return $ TcPluginOk [] []

debugIO :: Bool -> String -> TcPluginM ()
debugIO False _ = return ()
debugIO True s = tcPluginIO $ putStrLn s

zonkEverything :: [Ct] -> TcPluginM [Ct]
zonkEverything [] = return []
zonkEverything (x : xs) = do
    c <- zonkCt x
    cs <- zonkEverything xs
    return (c:cs)

-- | Make EvTerms for any two types.  Give the types inside a Predtree of the
-- form (EqPred NomEq t1 t2)
makeEqEvidence :: String -> (Type, Type) -> EvTerm
makeEqEvidence s (t1, t2) =
#if __GLASGOW_HASKELL__ > 804
    evCoercion
#else
    EvCoercion
#endif
    $ mkUnivCo (PluginProv s) Nominal t1 t2

-- *  Printing
instance Show Type where
    show ty = case splitTyConApp_maybe ty of
        Just (tcon, tys) -> show tcon ++ " " ++ show tys
        Nothing -> case getTyVar_maybe ty of
            Just var -> show var
            Nothing -> showSDocUnsafe $ ppr ty

instance Show TyCon where
    show = occNameString . getOccName

instance Show Var where
    show v =
        let nicename = varOccName v ++ ";" ++ varUnique v in
        nicename ++ ":" ++ classifyVar v

varOccName :: Var -> String
varOccName = showSDocUnsafe . ppr . getOccName

varUnique :: Var -> String
varUnique = show . getUnique

classifyVar :: Var -> String
classifyVar v
    | isTcTyVar v = if isMetaTyVar v then "t" else "s"
    | otherwise = "irr"

showTupList :: (Show a, Show b) => [(a, b)] -> String
showTupList xs =
    "[\n" ++ intercalate "\n" (map mkEquality xs) ++ "\n]"
    where
        mkEquality (a, b) = show a ++ " ~ " ++ show b

showList :: Show a => [a] -> String
showList xs = "[\n" ++ intercalate "\n" (map show xs) ++ "\n]"

instance Show Ct where
    show ct = case maybeExtractTyEq ct of
        Just ((t1,t2),_) -> show (t1, t2)
        Nothing -> showSDocUnsafe $ ppr ct

instance Show WantedConstraints where
  show = showSDocUnsafe . ppr

instance Show EvTerm where
  show = showSDocUnsafe . ppr
