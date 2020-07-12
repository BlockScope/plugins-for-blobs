{-# LANGUAGE CPP #-}

module Plugins.Thoralf (plugin) where

import GHC.Corroborate

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)
import Plugins.Thoralf.Print (DebugPlugin(..), TraceCarry(..), TraceSmtConversation(..))
import Plugins.Print.Constraints (TraceCallCount(..), TraceCts(..))
import Plugins.Print.SMT (TraceConvertCtsToSmt(..))

plugin :: Plugin
plugin =
    let pm =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-plugin")

        dbg =
            DebugPlugin
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceCarry = TraceCarry False
                , traceConvertCtsToSmt = TraceConvertCtsToSmt False
                , traceSmtConversation = TraceSmtConversation False
                }

        tyCheck = thoralfPlugin pm thoralfTheories dbg
    in
        defaultPlugin
            { tcPlugin = const $ Just tyCheck
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
