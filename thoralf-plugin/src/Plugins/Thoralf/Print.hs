{-# LANGUAGE RecordWildCards #-}

module Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..), DebugSmtConversation(..)
    , TraceCarry(..), TraceSmtConversation(..)
    , pprConvCtsStep, pprSmtStep, tracePlugin, traceSmt
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (Indent(..), tracePlugin, pprCts)

import ThoralfPlugin.Convert (ConvCts(..))
import Plugins.Print.SMT
    ( DebugSmt(..), DebugSmtConversation(..)
    , TraceCarry(..), TraceSmtConversation(..), TraceConvertCtsToSmt(..)
    , SmtGivens(..), SmtWanteds(..), SmtDecls(..)
    , pprSmtGivens, pprSmtWanteds, pprSmtDecls
    )

data ConvCtsStep = ConvCtsStep { givens :: ConvCts, wanted :: ConvCts }

pprConvCtsStep :: Indent -> DebugSmt -> ConvCtsStep -> [String]
pprConvCtsStep
    indent
    DebugSmt{..}
    ConvCtsStep{givens = ConvCts gs _ds1, wanted = ConvCts ws _ds2} =
    if not (coerce traceCarry)
        then []
        else pprCts "cts-carried" indent gCts [] wCts
    where
        (_gSs, gCts) = unzip gs
        (_WSs, wCts) = unzip ws

pprSmtStep :: DebugSmt -> Indent -> ConvCtsStep -> [String]
pprSmtStep
    DebugSmt{..}
    indent@(Indent i)
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
