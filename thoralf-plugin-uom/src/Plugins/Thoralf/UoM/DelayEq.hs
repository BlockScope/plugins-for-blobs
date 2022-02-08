{-# LANGUAGE CPP, ScopedTypeVariables #-}

module Plugins.Thoralf.UoM.DelayEq (plugin) where

import GHC.Corroborate
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import ThoralfPlugin.Encode (thoralfUoMTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.Print
    ( defaultDebugSmt
#if __GLASGOW_HASKELL__ >= 806
    , compilingModuleSmtComment
#endif
    )

import Plugins.Thoralf.UoM.DelayEq.TcPlugin (thoralfDelayEqPlugin)

plugin :: Plugin
plugin =
    let disEq =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-theory")

        dbgCts =
            DebugCts
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceSolution = TraceSolution False
                }

        dbgSmt = defaultDebugSmt

        tc = thoralfDelayEqPlugin dbgCts dbgSmt disEq thoralfUoMTheories
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "thoralf-uom-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
            , parsedResultAction = const . const compilingModuleSmtComment
#endif
            }