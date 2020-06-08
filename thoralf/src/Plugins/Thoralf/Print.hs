{-# LANGUAGE QuasiQuotes, NamedFieldPuns #-}
{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Plugins.Thoralf.Print (Debug(..), printCts, showList) where

import Prelude hiding (showList)
import Language.Haskell.Printf (s)
import Data.List (intercalate)
import qualified SimpleSMT as SMT (showsSExpr)
import GHC.Corroborate

import ThoralfPlugin.Convert (SExpr, maybeExtractTyEq)

data Debug = Debug{cts :: Bool, smt :: Bool}

printParsedInputs :: Bool -> [SExpr] -> SExpr -> [SExpr] -> TcPluginM ()
printParsedInputs True gSExpr wSExpr parseDeclrs = tcPluginIO $ do
    putStrLn . [s|Given SExpr:\n%?|] $ (`SMT.showsSExpr` "") <$> gSExpr
    putStrLn . [s|Wanted SExpr:\n%s|] $ SMT.showsSExpr wSExpr ""
    putStrLn . [s|Variable Decs:\n%?|] $ (`SMT.showsSExpr` "") <$> parseDeclrs
printParsedInputs False _ _ _ = return ()

printCts :: Debug -> Bool -> [Ct] -> [Ct] -> [Ct] -> TcPluginM TcPluginResult
printCts Debug{cts} bool gs ws ds
    | cts == True = do
        let iffail = "\n\n" ++ if bool then "Parse Failure" else "Solver call start" ++ "\n\n"
        tcPluginIO $ do
            putStrLn "\n\n  ----- Plugin Call HERE !!! ------\n\n"
            putStrLn iffail
            putStrLn ("\tGivens: \n" ++ showList gs)
            putStrLn ("\tWanteds: \n" ++ showList ws)
            putStrLn ("\tDesireds: \n" ++ showList ds)
        return $ TcPluginOk [] []
    | otherwise = return $ TcPluginOk [] []

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
showList xs = "[\n" ++ intercalate "\n" (map show xs) ++ "\n]"

instance Show Ct where
    show ct = case maybeExtractTyEq ct of
        Just ((t1,t2),_) -> show (t1, t2)
        Nothing -> showSDocUnsafe $ ppr ct

instance Show WantedConstraints where
  show = showSDocUnsafe . ppr

instance Show EvTerm where
  show = showSDocUnsafe . ppr
