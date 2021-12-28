{-# LANGUAGE RecordWildCards #-}

module Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..)
    , TraceSmtConversation(..)
    , pprConvCtsStep, pprSmtStep, tracePlugin, traceSmt
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate (TcPluginM, tcPluginIO)
import Plugins.Print (TracingFlags(..), TraceCarry(..), Indent(..), tracePlugin, pprCts)

import ThoralfPlugin.Convert (ConvCts(..))
import Plugins.Print.SMT
    (TraceConvertCtsToSmt(..), pprSmtGivens, pprSmtWanteds, pprSmtList)

data ConvCtsStep = ConvCtsStep { givens :: ConvCts, wanted :: ConvCts }

newtype TraceSmtConversation = TraceSmtConversation Bool

data DebugSmt =
    DebugSmt
        { traceConvertCtsToSmt :: TraceConvertCtsToSmt
        -- ^ Trace conversions to SMT notation
        , traceSmtConversation :: TraceSmtConversation
        -- ^ Trace the conversation with the SMT solver
        }

pprConvCtsStep :: Indent -> TracingFlags -> ConvCtsStep -> [String]
pprConvCtsStep
    indent
    TracingFlags{..}
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
        . pprSmtList j (ds1 ++ ds2)
        . showString "\n"
        . tabtab
        . showString "smt-given = "
        . pprSmtGivens j gSs
        . showString "\n"
        . tabtab
        . showString "smt-wanted = "
        . pprSmtWanteds j wSs)
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
