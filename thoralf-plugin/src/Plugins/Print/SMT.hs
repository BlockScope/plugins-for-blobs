{-# OPTIONS_GHC -fno-warn-orphans #-}

module Plugins.Print.SMT
    ( TraceConvertCtsToSmt(..)
    , SmtDecls(..)
    , SmtGivens(..)
    , SmtWanteds(..)
    , pprSmtInputs
    , pprSmtList
    , pprSmtDecls
    , pprSmtGivens
    , pprSmtWanteds
    ) where

import GHC.Corroborate
import SimpleSMT (SExpr(..))
import qualified SimpleSMT as SMT (ppSExpr)
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (ConvCts(..))

newtype TraceConvertCtsToSmt = TraceConvertCtsToSmt Bool
newtype SmtDecls = SmtDecls [SExpr]
newtype SmtWanteds = SmtWanteds [SExpr]
newtype SmtGivens = SmtGivens [SExpr]

pprSmtInputs
    :: Indent
    -> TraceConvertCtsToSmt
    -> SmtGivens
    -> SmtWanteds
    -> SmtDecls
    -> ShowS
pprSmtInputs
    iIndent@(Indent i)
    (TraceConvertCtsToSmt True)
    (SmtGivens gSExprs)
    (SmtWanteds wSExprs)
    (SmtDecls dSExprs)
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

pprSmtDecls :: Indent -> SmtDecls -> ShowS
pprSmtDecls i (SmtDecls es) = pprSmtList i es

instance Outputable SExpr where
    ppr e = text $ SMT.ppSExpr e ""

instance Outputable SmtDecls where
    ppr (SmtDecls es) =
        text "["
        <+> vcat (ppr <$> es)
        <+> text "]"

instance Outputable SmtGivens where
    ppr (SmtGivens es) =
        text "["
        <+> vcat (ppr <$> es)
        <+> text "]"

instance Outputable SmtWanteds where
    ppr (SmtWanteds es) =
        text "["
        <+> vcat (ppr <$> es)
        <+> text "]"

instance Outputable ConvCts where
    ppr (ConvCts eqs deps) =
        ppr (SmtDecls $ fst <$> eqs)
        <+> ppr (snd <$> eqs)
        <+> ppr deps

pprSmtGivens :: Indent -> SmtGivens -> ShowS
pprSmtGivens _ (SmtGivens []) = showString "[]"
pprSmtGivens (Indent i) (SmtGivens es) = let tab = replicate (2 * i) ' ' in
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

pprSmtWanteds :: Indent -> SmtWanteds -> ShowS
pprSmtWanteds _ (SmtWanteds []) = showString "[]"
pprSmtWanteds (Indent i) (SmtWanteds es) = let tab = replicate (2 * i) ' ' in
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