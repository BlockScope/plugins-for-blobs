{-# LANGUAGE RecordWildCards, NamedFieldPuns #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Plugins.Print.SMT
    ( TraceCarry(..)
    , TraceSmtTalk(..)
    , TraceSmtCts(..)
    , DebugSmtRecv(..)
    , DebugSmt(..)
    , defaultDebugSmt
    , nullDebugSmt
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
    , compilingModuleSmtComment
    , traceSmt
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate
import Control.Monad.IO.Class (MonadIO(..))
import SimpleSMT (SExpr(..))
import qualified SimpleSMT as SMT (ppSExpr)
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (ConvCts(..), ConvEq(..))

-- | Flag for controlling tracing constraints as SMT s-expressions.
newtype TraceSmtCts = TraceSmtCts Bool

-- | Flags for tracing the conversation with the SMT solver (the talk).
data TraceSmtTalk =
    TraceSmtTalk
        { traceSend :: Bool
        , traceRecv :: DebugSmtRecv
        , traceArrow :: Bool
        -- ^ Print an arrow showing the direction of the communication.
        , traceErr :: Bool
        , traceOther :: Bool
        }

data DebugSmtRecv
    = DebugSmtRecvAll Bool
    | DebugSmtRecvSome
        { traceSuccess :: Bool
        , traceCheckSat :: Bool
        }
    deriving Eq

isSilencedTalk :: TraceSmtTalk -> Bool
isSilencedTalk TraceSmtTalk{..} =
    not traceSend
    && isSilencedRecv traceRecv
    && not traceErr
    && not traceOther
    -- NOTE: traceArrow = false does not silence anything but only change the
    -- inclusion of the arrow prefixes.

isSilencedRecv :: DebugSmtRecv -> Bool
isSilencedRecv (DebugSmtRecvAll b) = b
isSilencedRecv DebugSmtRecvSome{..} = not traceSuccess && not traceCheckSat

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
        , traceCtsComments :: Bool
        , traceDecsSeen :: Bool
        , traceAssertions :: Bool
        , traceSatModel :: Bool
        , traceUnsatCore :: Bool
        }

-- | Default settings for debugging that includes rich information as SMT2
-- comments; like the constraints, their conversions, the sat result, the
-- assertions and the model the model.
defaultDebugSmt :: DebugSmt
defaultDebugSmt =
    DebugSmt
        { traceCarry = TraceCarry False
        , traceSmtCts = TraceSmtCts False
        , traceSmtTalk =
            TraceSmtTalk
                { traceSend = True
                , traceRecv =
                    DebugSmtRecvSome
                        { traceSuccess = False
                        , traceCheckSat = True
                        }
                , traceArrow = False
                , traceErr = False
                , traceOther = False
                }
        , traceCtsComments = True
        , traceDecsSeen = True
        , traceAssertions = True
        , traceSatModel = True
        , traceUnsatCore = True
        }

-- | A null debug setting that does not trace anything.
nullDebugSmt :: DebugSmt
nullDebugSmt =
    DebugSmt
        { traceCarry = TraceCarry False
        , traceSmtCts = TraceSmtCts False
        , traceSmtTalk =
            TraceSmtTalk
                { traceSend = False
                , traceRecv = DebugSmtRecvAll False
                , traceArrow = False
                , traceErr = False
                , traceOther = False
                }
        , traceCtsComments = False
        , traceDecsSeen = False
        , traceAssertions = False
        , traceSatModel = False
        , traceUnsatCore = False
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
    ppr (ConvCts names eqs deps) =
        ppr names
        <+> ppr (SmtDecls $ eqSExpr <$> eqs)
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

compilingModuleSmtComment :: MonadIO m => HsParsedModule -> m HsParsedModule
compilingModuleSmtComment m = do
    let modName = fmap unLoc . hsmodName . unLoc . hpm_module
    let msg = "; Compiling " ++ maybe "an unnamed module" moduleNameString (modName m)
    liftIO $ putStrLn msg
    return m

traceSmt :: DebugSmt -> String -> TcPluginM ()
traceSmt DebugSmt{traceSmtTalk, ..} s'
    | coerce traceCarry
        || coerce traceSmtCts
        || not (isSilencedTalk traceSmtTalk)= tcPluginIO $ putStrLn s'
    | otherwise = return ()
