{-# LANGUAGE CPP, ScopedTypeVariables #-}

module Plugins.Thoralf.UoM (plugin) where

import GHC.Corroborate
import qualified GHC.Corroborate as C
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import ThoralfPlugin.Encode (thoralfUoMTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Print.SMT
    ( defaultDebugSmt
#if __GLASGOW_HASKELL__ >= 806
    , compilingModuleSmtComment
#endif
    )

import Plugins.Thoralf.UoM.TcPlugin (thoralfDelayEqPlugin)

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
            { tcPlugin = const . Just $ C.tracePlugin "thoralf-uom-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
            , parsedResultAction = const . const compilingModuleSmtComment
#endif
            }