{-# LANGUAGE CPP #-}

module Plugins.Thoralf.Rows (plugin) where

import GHC.Corroborate
import Plugins.Print

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)
import Plugins.Print.SMT
    ( nullDebugSmt
#if __GLASGOW_HASKELL__ >= 806
    , compilingModuleSmtComment
#endif
    )

plugin :: Plugin
plugin =
    let pm =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-theory")

        dbgPlugin =
            DebugCts
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceSolution = TraceSolution False
                }

        dbgSmt = nullDebugSmt

        tyCheck = thoralfPlugin dbgPlugin dbgSmt pm thoralfTheories
    in
        defaultPlugin
            { tcPlugin = const $ Just tyCheck
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
            , parsedResultAction = const . const compilingModuleSmtComment
#endif
            }
