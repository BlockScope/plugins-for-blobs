{-# LANGUAGE QuasiQuotes #-}

module Plugins.Print.SMT
    ( TraceConvertCtsToSmt(..)
    , printSmtInputs
    , pprSmtList
    , pprSmtGivens
    , pprSmtWanteds
    ) where

import Language.Haskell.Printf (s)
import qualified SimpleSMT as SMT (showsSExpr, ppSExpr)
import GHC.Corroborate

import ThoralfPlugin.Convert (SExpr)

newtype TraceConvertCtsToSmt = TraceConvertCtsToSmt Bool

printSmtInputs :: TraceConvertCtsToSmt -> [SExpr] -> SExpr -> [SExpr] -> TcPluginM ()
printSmtInputs (TraceConvertCtsToSmt True) gSExpr wSExpr parseDeclrs = tcPluginIO $ do
    putStrLn . [s|Given SExpr:\n%?|] $ (`SMT.showsSExpr` "") <$> gSExpr
    putStrLn . [s|Wanted SExpr:\n%s|] $ SMT.showsSExpr wSExpr ""
    putStrLn . [s|Variable Decs:\n%?|] $ (`SMT.showsSExpr` "") <$> parseDeclrs
printSmtInputs (TraceConvertCtsToSmt False) _ _ _ = return ()

pprSmtList :: [SExpr] -> String
pprSmtList [] = "[]"
pprSmtList es =
    showString "[\n"
    . foldr (\e m -> SMT.ppSExpr e . showChar '\n' . m) (showChar ']') es
    $ []

pprSmtGivens :: [SExpr] -> String
pprSmtGivens [] = "[]"
pprSmtGivens es =
    showString "[\n"
    . foldr
        (\e m ->
            showString "(assert "
            . SMT.ppSExpr e
            . showChar ')'
            . showChar '\n'
            . m)
        (showChar ']')
        es
    $ []

pprSmtWanteds :: [SExpr] -> String
pprSmtWanteds [] = "[]"
pprSmtWanteds es =
    showString "[\n"
    . foldr
        (\e m ->
            showString "(assert (or false (not "
            . SMT.ppSExpr e
            . showString ")))"
            . showChar '\n'
            . m)
        (showChar ']')
        es
    $ []
