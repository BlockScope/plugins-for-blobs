{-# LANGUAGE CPP #-}

module Plugins.Thoralf (plugin) where

import GHC.Corroborate

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)
import Plugins.Thoralf.Print
    (DebugPlugin(..), DebugSmt(..), TraceCarry(..), TraceSmtConversation(..))
import Plugins.Print.Constraints (TraceCallCount(..), TraceCts(..))
import Plugins.Print.SMT (TraceConvertCtsToSmt(..))

plugin :: Plugin
plugin =
    let pm =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-plugin")

        dbgPlugin =
            DebugPlugin
                { traceCallCount = TraceCallCount True
                , traceCts = TraceCts True
                , traceCarry = TraceCarry True
                }

        dbgSmt =
            DebugSmt
                { traceConvertCtsToSmt = TraceConvertCtsToSmt True
                , traceSmtConversation = TraceSmtConversation True
                }

        tyCheck = thoralfPlugin dbgPlugin dbgSmt pm thoralfTheories
    in
        defaultPlugin
            { tcPlugin = const $ Just tyCheck
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
