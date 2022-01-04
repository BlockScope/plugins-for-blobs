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
    iIndent@(Indent i)
    (TraceConvertCtsToSmt True)
    gSExprs
    wSExprs
    dSExprs
    = 
    tab
    . showString "sexpr-decs = "
    . pprSmtList jIndent dSExprs
    . showChar '\n'
    . tab
    . showString "sexpr-given = "
    . pprSmtList jIndent gSExprs
    . showChar '\n'
    . tab
    . showString "sexpr-wanted = "
    . pprSmtList jIndent wSExprs
    where
        tab = showString $ replicate (2 * i) ' '
        jIndent = iIndent + 1

pprSmtInputs _ (TraceConvertCtsToSmt False) _ _ _ = const ""

pprSmtList :: Indent -> [SExpr] -> ShowS
pprSmtList _ [] = showString "[]"
pprSmtList (Indent i) es = let tab = replicate (2 * i) ' ' in
    showChar '['
    . showChar '\n'
    . foldr
        (\e m -> showString tab . SMT.ppSExpr e . showChar '\n' . m)
        (showString tab . showChar ']')
        es

pprSmtGivens :: Indent -> [SExpr] -> ShowS
pprSmtGivens _ [] = showString "[]"
pprSmtGivens (Indent i) es = let tab = replicate (2 * i) ' ' in
    showChar '['
    . showChar '\n'
    . foldr
        (\e m ->
            showString tab
            . showString "(assert "
            . SMT.ppSExpr e
            . showChar ')'
            . showChar '\n'
            . m)
        (showString tab . showChar ']')
        es

pprSmtWanteds :: Indent -> [SExpr] -> ShowS
pprSmtWanteds _ [] = showString "[]"
pprSmtWanteds (Indent i) es = let tab = replicate (2 * i) ' ' in
    showChar '['
    . showChar '\n'
    . foldr
        (\e m ->
            showString tab
            . showString "(assert (or false (not "
            . SMT.ppSExpr e
            . showString ")))"
            . showChar '\n'
            . m)
        (showString tab . showChar ']')
        es