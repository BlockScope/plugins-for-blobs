{-# LANGUAGE QuasiQuotes, RecordWildCards #-}

module Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugPlugin(..), DebugSmt(..)
    , TraceCarry(..), TraceSmtConversation(..)
    , pprPluginStep, pprSmtStep, tracePlugin, traceSmt
    ) where

import Prelude hiding (showList)
import Data.Coerce (coerce)
import Language.Haskell.Printf (s)
import GHC.Corroborate (TcPluginM, tcPluginIO)

import ThoralfPlugin.Convert (ConvCts(..))
import Plugins.Print (DebugPlugin(..), TraceCarry(..), tracePlugin)
import Plugins.Print.Constraints (showList)
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

pprPluginStep :: DebugPlugin -> ConvCtsStep -> [String]
pprPluginStep
    DebugPlugin{..}
    ConvCtsStep{givens = ConvCts gs _ds1, wanted = ConvCts ws _ds2} =
    if not (coerce traceCarry) then [] else
        [ [s|+++ GHC-Decs-Given = %s|] $ showList gCts
        , [s|+++ GHC-Decs-Wanted = %s|] $ showList wCts
        ]
    where
        (_gSs, gCts) = unzip gs
        (_WSs, wCts) = unzip ws

pprSmtStep :: DebugSmt -> ConvCtsStep -> [String]
pprSmtStep
    DebugSmt{..}
    ConvCtsStep{givens = ConvCts gs ds1, wanted = ConvCts ws ds2} =
    if not (coerce traceConvertCtsToSmt) then [] else
        [ [s|+++ SMT-Decs = %s|] $ pprSmtList (ds1 ++ ds2)
        , [s|+++ SMT-Given = %s|] $ pprSmtGivens gSs
        , [s|+++ SMT-Wanteds = %s|] $ pprSmtWanteds wSs
        ]
    where
        (gSs, _gCts) = unzip gs
        (wSs, _wCts) = unzip ws

traceSmt :: DebugSmt -> String -> TcPluginM ()
traceSmt DebugSmt{..} s'
    | coerce traceConvertCtsToSmt = tcPluginIO $ putStrLn s'
    | otherwise = return ()
