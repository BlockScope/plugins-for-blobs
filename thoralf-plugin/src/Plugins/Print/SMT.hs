{-# LANGUAGE RecordWildCards #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Plugins.Print.SMT
    ( TraceCarry(..)
    , TraceSmtTalk(..)
    , TraceSmtCts(..)
    , DebugSmtTalk(..)
    , DebugSmtRecv(..)
    , DebugSmt(..)
    , SmtDecls(..)
    , SmtGivens(..)
    , SmtWanteds(..)
    , SmtCommentGivens(..)
    , SmtCommentWanteds(..)
    , pprSmtList
    , pprSmtDecls
    , pprSmtGivens
    , pprSmtWanteds
    , isSilencedTalk, isSilencedRecv
    ) where

import GHC.Corroborate
import SimpleSMT (SExpr(..))
import qualified SimpleSMT as SMT (ppSExpr)
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (ConvCts(..), ConvEq(..))

-- | Flag for controlling tracing constraints as SMT s-expressions.
newtype TraceSmtCts = TraceSmtCts Bool

data DebugSmtTalk =
    DebugSmtTalk
        { traceSend :: Bool
        , traceRecv :: DebugSmtRecv
        , traceErr :: Bool
        , traceOther :: Bool
        , traceArrow :: Bool
        , traceCtsComments :: Bool
        }

data DebugSmtRecv
    = DebugSmtRecvAll Bool
    | DebugSmtRecvSome
        { traceSuccess :: Bool
        , traceCheckSat :: Bool
        }
    deriving Eq

isSilencedTalk :: DebugSmtTalk -> Bool
isSilencedTalk DebugSmtTalk{..} =
    not traceSend
    && isSilencedRecv traceRecv
    && not traceErr
    && not traceOther
    -- NOTE: traceArrow = false does not silence anything but only change the
    -- inclusion of the arrow prefixes.
    && not traceCtsComments

isSilencedRecv :: DebugSmtRecv -> Bool
isSilencedRecv (DebugSmtRecvAll b) = b
isSilencedRecv DebugSmtRecvSome{..} = not traceSuccess && not traceCheckSat

-- | Flag for controlling the two-way conversation with the SMT solver.
newtype TraceSmtTalk = TraceSmtTalk DebugSmtTalk

-- | Flag for controlling tracing of the carry.
newtype TraceCarry = TraceCarry Bool

data DebugSmt =
    DebugSmt
        { traceCarry :: TraceCarry
        -- ^ Trace GHC constraints carried through conversion and solving.
        , traceSmtCts :: TraceSmtCts
        -- ^ Trace conversions to SMT notation
        , traceSmtTalk :: TraceSmtTalk
        -- ^ Trace the conversation with the SMT solver
        }

newtype SmtDecls = SmtDecls [SExpr]
newtype SmtGivens = SmtGivens [SExpr]
newtype SmtWanteds = SmtWanteds [SExpr]

newtype SmtCommentGivens = SmtCommentGivens [Ct]
newtype SmtCommentWanteds = SmtCommentWanteds [Ct]

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
        ppr (SmtDecls $ eqSExpr <$> eqs)
        <+> ppr (eqCt <$> eqs)
        <+> ppr deps

instance Outputable SmtCommentWanteds where
    ppr (SmtCommentWanteds cts)
        | null cts = text "[]"
        | otherwise = vcat [ppr ct | ct <- cts]

instance Outputable SmtCommentGivens where
    ppr (SmtCommentGivens cts)
        | null cts = text "[]"
        | otherwise = vcat [ppr ct | ct <- cts]

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