{-# LANGUAGE QuasiQuotes, NamedFieldPuns, RecordWildCards #-}
{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Plugins.UoM.Print
    ( Debug(..)
    , printCts, showList, pprStep, pprSolverCallCount, debugIO
    ) where

import Prelude hiding (showList)
import Language.Haskell.Printf (s)
import Data.Foldable (traverse_)
import Data.List (intercalate)
import GHC.Corroborate

data Debug =
    Debug
        { callCount :: Bool -- ^ Trace TcPlugin call count
        , ctsGHC :: Bool -- ^ Trace GHC constraints
        }

pprSolverCallCount :: Debug -> Int -> String
pprSolverCallCount Debug{callCount} n
    | callCount = [s|>>> GHC-TcPlugin #%d|] n
    | otherwise = ""

printCts
    :: Debug
    -> Bool
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
printCts Debug{ctsGHC} parseFailed gs ds ws
    | ctsGHC = do
        tcPluginIO $ do
            let p = [s|>>> GHC-TcPlugin-Called (%s)|] $
                    if parseFailed then "Parse Failed" else "Solving"
            traverse_ putStrLn $ p : pprCts gs ds ws

        return $ TcPluginOk [] []
    | otherwise = return $ TcPluginOk [] []

pprCts
    :: [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> [String]
pprCts gs ds ws =
    [ [s|>>> GHC-Givens = %s|] $ showList gs
    , [s|>>> GHC-Derived = %s|] $ showList ds
    , [s|>>> GHC-Wanteds = %s|] $ showList ws
    ]

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
showList [] = "[]"
showList xs = "[\n" ++ intercalate "\n" (show <$> xs) ++ "\n]"

maybeExtractTyEq :: Ct -> Maybe ((Type, Type), Ct)
maybeExtractTyEq ct =
    case classifyPredType $ ctPred ct of
        EqPred NomEq t1 t2 -> return ((t1, t2), ct)
        _ -> Nothing

instance Show Ct where
    show ct = case maybeExtractTyEq ct of
        Just ((t1, t2),_) -> show (t1, t2)
        Nothing -> showSDocUnsafe $ ppr ct

instance Show WantedConstraints where
  show = showSDocUnsafe . ppr

instance Show EvTerm where
  show = showSDocUnsafe . ppr

pprStep
    :: Debug
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> [String]
pprStep Debug{..} gCts dCts wCts =
    if not ctsGHC then [] else
    [ [s|+++ GHC-Decs-Given = %s|] $ showList gCts
    , [s|+++ GHC-Decs-Derived = %s|] $ showList dCts
    , [s|+++ GHC-Decs-Wanted = %s|] $ showList wCts
    ]

debugIO :: Debug -> String -> TcPluginM ()
debugIO Debug{..} s'
    | callCount || ctsGHC = tcPluginIO $ putStrLn s'
    | otherwise = return ()
