{-# LANGUAGE CPP #-}

module Plugins.Thoralf (plugin) where

import GHC.Corroborate
import Plugins.Print

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)
import Plugins.Thoralf.Print (DebugSmt(..), TraceSmtConversation(..))
import Plugins.Print.SMT (TraceConvertCtsToSmt(..))

plugin :: Plugin
plugin =
    let pm =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-plugin")

        dbgPlugin =
            TracingFlags
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceCarry = TraceCarry False
                , traceSolution = TraceSolution False
                }

        dbgSmt =
            DebugSmt
                { traceConvertCtsToSmt = TraceConvertCtsToSmt False
                , traceSmtConversation = TraceSmtConversation False
                }

        tyCheck = thoralfPlugin dbgPlugin dbgSmt pm thoralfTheories
    in
        defaultPlugin
            { tcPlugin = const $ Just tyCheck
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
