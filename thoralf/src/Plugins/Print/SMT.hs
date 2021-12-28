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
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (SExpr)

newtype TraceConvertCtsToSmt = TraceConvertCtsToSmt Bool

printSmtInputs :: Indent -> TraceConvertCtsToSmt -> [SExpr] -> SExpr -> [SExpr] -> TcPluginM ()
printSmtInputs _ (TraceConvertCtsToSmt True) gSExpr wSExpr parseDeclrs = tcPluginIO $ do
    putStrLn . [s|Given SExpr:\n%?|] $ (`SMT.showsSExpr` "") <$> gSExpr
    putStrLn . [s|Wanted SExpr:\n%s|] $ SMT.showsSExpr wSExpr ""
    putStrLn . [s|Variable Decs:\n%?|] $ (`SMT.showsSExpr` "") <$> parseDeclrs
printSmtInputs _ (TraceConvertCtsToSmt False) _ _ _ = return ()

pprSmtList :: Indent -> [SExpr] -> ShowS
pprSmtList _ [] = showString "[]"
pprSmtList _ es =
    showString "[\n"
    . foldr (\e m -> SMT.ppSExpr e . showChar '\n' . m) (showChar ']') es

pprSmtGivens :: Indent -> [SExpr] -> ShowS
pprSmtGivens _ [] = showString "[]"
pprSmtGivens _ es =
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

pprSmtWanteds :: Indent -> [SExpr] -> ShowS
pprSmtWanteds _ [] = showString "[]"
pprSmtWanteds _ es =
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
