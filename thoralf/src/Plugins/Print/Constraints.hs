{-# LANGUAGE QuasiQuotes #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Plugins.Print.Constraints
    ( TraceCallCount(..), TraceCts(..), ConvCtsStep(..)
    , printCts, showList, pprSolverCallCount
    ) where

import Prelude hiding (showList)
import Language.Haskell.Printf (s)
import Data.Foldable (traverse_)
import Data.List (intercalate)
import GHC.Corroborate

import ThoralfPlugin.Convert (ConvCts(..), maybeExtractTyEq)

newtype TraceCallCount = TraceCallCount Bool
newtype TraceCts = TraceCts Bool

pprSolverCallCount :: TraceCallCount -> Int -> String
pprSolverCallCount (TraceCallCount callCount) n
    | callCount = [s|>>> GHC-TcPlugin #%d|] n
    | otherwise = ""

printCts
    :: TraceCts
    -> Bool
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
printCts (TraceCts ctsGHC) parseFailed gs ds ws
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

showList :: Show a => [a] -> String
showList [] = "[]"
showList xs = "[\n" ++ intercalate "\n" (show <$> xs) ++ "\n]"

instance Show Ct where
    show ct = case maybeExtractTyEq ct of
        Just ((t1, t2),_) -> show (t1, t2)
        Nothing -> showSDocUnsafe $ ppr ct

instance Show WantedConstraints where
  show = showSDocUnsafe . ppr

instance Show EvTerm where
  show = showSDocUnsafe . ppr

data ConvCtsStep = ConvCtsStep { givens :: ConvCts, wanted :: ConvCts }
