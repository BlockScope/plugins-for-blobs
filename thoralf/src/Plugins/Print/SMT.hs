{-# LANGUAGE QuasiQuotes #-}

module Plugins.Print.SMT
    ( TraceConvertCtsToSmt(..)
    , pprSmtInputs
    , pprSmtList
    , pprSmtGivens
    , pprSmtWanteds
    ) where

import qualified SimpleSMT as SMT (showsSExpr, ppSExpr)
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (SExpr)

newtype TraceConvertCtsToSmt = TraceConvertCtsToSmt Bool

pprSmtInputs
    :: Indent
    -> TraceConvertCtsToSmt
    -> [SExpr]
    -> [SExpr]
    -> [SExpr]
    -> ShowS
pprSmtInputs
    _indent@(Indent i)
    (TraceConvertCtsToSmt True)
    gSExprs
    wSExprs
    dSExprs
    = 
    ( tab
    . showString "given-sexpr = "
    . shows ((`SMT.showsSExpr` "") <$> gSExprs)
    . showChar '\n'
    . tab
    . showString "wanted-sexpr = "
    . shows ((`SMT.showsSExpr` "") <$> wSExprs)
    . showChar '\n'
    . tab
    . showString "variables-sexpr = "
    . shows ((`SMT.showsSExpr` "") <$> dSExprs)
    )
    where
        tab = showString $ replicate (2 * i) ' '

pprSmtInputs _ (TraceConvertCtsToSmt False) _ _ _ = const ""

pprSmtList :: Indent -> [SExpr] -> ShowS
pprSmtList _ [] = showString "[]"
pprSmtList _ es =
    showString "[\n"
    . foldr
        (\e m -> SMT.ppSExpr e . showChar '\n' . m)
        (showChar ']')
        es

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
