{-# LANGUAGE QuasiQuotes, NamedFieldPuns #-}
{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Plugins.Thoralf.Print
    ( ConvCtsStep(..), Debug(..)
    , printCts, showList, pprSExprList, pprStep, debugIO
    ) where

import Prelude hiding (showList)
import Language.Haskell.Printf (s)
import Data.List (intercalate)
import qualified SimpleSMT as SMT (showsSExpr, ppSExpr)
import GHC.Corroborate

import ThoralfPlugin.Convert (ConvCts(..), SExpr, maybeExtractTyEq)

data Debug = Debug{cts :: Bool, smt :: Bool}

printParsedInputs :: Bool -> [SExpr] -> SExpr -> [SExpr] -> TcPluginM ()
printParsedInputs True gSExpr wSExpr parseDeclrs = tcPluginIO $ do
    putStrLn . [s|Given SExpr:\n%?|] $ (`SMT.showsSExpr` "") <$> gSExpr
    putStrLn . [s|Wanted SExpr:\n%s|] $ SMT.showsSExpr wSExpr ""
    putStrLn . [s|Variable Decs:\n%?|] $ (`SMT.showsSExpr` "") <$> parseDeclrs
printParsedInputs False _ _ _ = return ()

printCts :: Debug -> Bool -> [Ct] -> [Ct] -> [Ct] -> TcPluginM TcPluginResult
printCts Debug{cts} parseFailed gs ws ds
    | cts = do
        tcPluginIO $ do
            putStrLn . [s|>>> Plugin Call (%s)|] $
                if parseFailed then "Parse Failed" else "Solving"

            putStrLn . [s|>>> GHC-Givens = %s|] $ showList gs
            putStrLn . [s|>>> GHC-Wanteds = %s|] $ showList ws
            putStrLn . [s|>>> GHC-Desireds = %s|] $ showList ds
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
showList xs = "[\n" ++ intercalate "\n" (show <$> xs) ++ "\n]"

instance Show Ct where
    show ct = case maybeExtractTyEq ct of
        Just ((t1,t2),_) -> show (t1, t2)
        Nothing -> showSDocUnsafe $ ppr ct

instance Show WantedConstraints where
  show = showSDocUnsafe . ppr

instance Show EvTerm where
  show = showSDocUnsafe . ppr

data ConvCtsStep = ConvCtsStep {givens :: ConvCts, wanted :: ConvCts }

pprStep :: ConvCtsStep -> [String]
pprStep ConvCtsStep{givens = ConvCts gs ds1, wanted = ConvCts ws ds2} =
    [ [s|+++ GHC-Decs-Given = %s|] $ (showList gCts)
    , [s|+++ GHC-Decs-Wanted = %s|] $ (showList wCts)
    , [s|+++ SMT-Decs = %s|] $ pprSExprList (ds1 ++ ds2)
    , [s|+++ SMT-Given = %s|] $ (pprSExprList gSs)
    , [s|+++ SMT-Wanteds = %s|] $ (pprSExprList wSs)
    ]
    where
        (gSs, gCts) = unzip gs
        (wSs, wCts) = unzip ws

pprSExprList :: [SExpr] -> String
pprSExprList [] = "[]"
pprSExprList es =
    showString "[\n"
    . foldr (\e m -> SMT.ppSExpr e . showChar '\n' . m) (showChar ']') es
    $ []

debugIO :: Debug -> String -> TcPluginM ()
debugIO Debug{cts} s'
    | cts = tcPluginIO $ putStrLn s'
    | otherwise = return ()
