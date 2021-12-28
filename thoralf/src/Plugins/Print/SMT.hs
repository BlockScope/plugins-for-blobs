{-# LANGUAGE QuasiQuotes #-}

module Plugins.Print.SMT
    ( TraceConvertCtsToSmt(..)
    , pprSmtInputs
    , pprSmtList
    , pprSmtGivens
    , pprSmtWanteds
    ) where

import qualified SimpleSMT as SMT (ppSExpr)
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
    indent@(Indent i)
    (TraceConvertCtsToSmt True)
    gSExprs
    wSExprs
    dSExprs
    = 
    ( tab
    . showString "sexpr-decs = "
    . pprSmtList indent dSExprs
    . showChar '\n'
    . tab
    . showString "sexpr-given = "
    . pprSmtList indent gSExprs
    . showChar '\n'
    . tab
    . showString "sexpr-wanted = "
    . pprSmtList indent wSExprs
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
