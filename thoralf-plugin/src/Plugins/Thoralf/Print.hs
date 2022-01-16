{-# LANGUAGE RecordWildCards #-}

module Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..)
    , TraceSmtConversation(..)
    , pprConvCtsStep, pprSmtStep, tracePlugin, traceSmt
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (DebugCts(..), TraceCarry(..), Indent(..), tracePlugin, pprCts)

import ThoralfPlugin.Convert (ConvCts(..))
import Plugins.Print.SMT
    ( TraceConvertCtsToSmt(..)
    , SmtGivens(..), SmtWanteds(..), SmtDecls(..)
    , pprSmtGivens, pprSmtWanteds, pprSmtDecls
    )

data ConvCtsStep = ConvCtsStep { givens :: ConvCts, wanted :: ConvCts }

newtype TraceSmtConversation = TraceSmtConversation Bool

data DebugSmt =
    DebugSmt
        { traceConvertCtsToSmt :: TraceConvertCtsToSmt
        -- ^ Trace conversions to SMT notation
        , traceSmtConversation :: TraceSmtConversation
        -- ^ Trace the conversation with the SMT solver
        }

pprConvCtsStep :: Indent -> DebugCts -> ConvCtsStep -> [String]
pprConvCtsStep
    indent
    DebugCts{..}
    ConvCtsStep{givens = ConvCts gs _ds1, wanted = ConvCts ws _ds2} =
    if not (coerce traceCarry) then [] else pprCts indent gCts [] wCts
    where
        (_gSs, gCts) = unzip gs
        (_WSs, wCts) = unzip ws

pprSmtStep :: Indent -> DebugSmt -> ConvCtsStep -> [String]
pprSmtStep
    indent@(Indent i)
    DebugSmt{..}
    ConvCtsStep{givens = ConvCts gs ds1, wanted = ConvCts ws ds2} =
    [
        ( tab
        . showString "[smt-step]"
        . showString "\n"
        . tabtab
        . showString "smt-decs = "
        . pprSmtDecls j (SmtDecls $ ds1 ++ ds2)
        . showString "\n"
        . tabtab
        . showString "smt-given = "
        . pprSmtGivens j (SmtGivens gSs)
        . showString "\n"
        . tabtab
        . showString "smt-wanted = "
        . pprSmtWanteds j (SmtWanteds wSs))
        ""
    | coerce traceConvertCtsToSmt
    ]
    where
        tab = showString $ replicate (2 * i) ' '
        tabtab = showString $ replicate (2 * (i + 1)) ' '
        j = indent + 1
        (gSs, _gCts) = unzip gs
        (wSs, _wCts) = unzip ws

traceSmt :: DebugSmt -> String -> TcPluginM ()
traceSmt DebugSmt{..} s'
    | coerce traceConvertCtsToSmt = tcPluginIO $ putStrLn s'
    | otherwise = return ()

instance Outputable ConvCtsStep where
    ppr ConvCtsStep{givens = ConvCts gs ds1, wanted = ConvCts ws ds2} =
        text "smt-decs = "
        <+> ppr (SmtDecls $ ds1 ++ ds2)
        <+> text "smt-given = "
        <+> ppr (SmtGivens gSs)
        <+> text "smt-wanted = "
        <+> ppr (SmtWanteds wSs)
        where
            (gSs, _gCts) = unzip gs
            (wSs, _wCts) = unzip ws
