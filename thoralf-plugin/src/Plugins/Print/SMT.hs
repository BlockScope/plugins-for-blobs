{-# LANGUAGE RecordWildCards #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Plugins.Print.SMT
    ( TraceCarry(..)
    , TraceSmtConversation(..)
    , TraceConvertCtsToSmt(..)
    , DebugSmtConversation(..)
    , DebugSmt(..)
    , SmtDecls(..)
    , SmtGivens(..)
    , SmtWanteds(..)
    , pprSmtList
    , pprSmtDecls
    , pprSmtGivens
    , pprSmtWanteds
    , isSilenced
    ) where

import GHC.Corroborate
import SimpleSMT (SExpr(..))
import qualified SimpleSMT as SMT (ppSExpr)
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (ConvCts(..))

-- | Flag for controlling tracing constraints as SMT s-expressions.
newtype TraceConvertCtsToSmt = TraceConvertCtsToSmt Bool

data DebugSmtConversation =
    DebugSmtConversation
        { traceSend :: Bool
        , traceRecv :: Bool
        , traceErr :: Bool
        , traceOther :: Bool
        }

isSilenced :: DebugSmtConversation -> Bool
isSilenced DebugSmtConversation{..} =
    not traceSend && not traceRecv && not traceErr && not traceOther

-- | Flag for controlling the two-way conversation with the SMT solver.
newtype TraceSmtConversation = TraceSmtConversation DebugSmtConversation

-- | Flag for controlling tracing of the carry.
newtype TraceCarry = TraceCarry Bool

data DebugSmt =
    DebugSmt
        { traceCarry :: TraceCarry
        -- ^ Trace GHC constraints carried through conversion and solving.
        , traceConvertCtsToSmt :: TraceConvertCtsToSmt
        -- ^ Trace conversions to SMT notation
        , traceSmtConversation :: TraceSmtConversation
        -- ^ Trace the conversation with the SMT solver
        }

newtype SmtDecls = SmtDecls [SExpr]
newtype SmtWanteds = SmtWanteds [SExpr]
newtype SmtGivens = SmtGivens [SExpr]

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