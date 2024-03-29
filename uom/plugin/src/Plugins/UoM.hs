{-# LANGUAGE CPP #-}

-- | This module defines a typechecker plugin that solves equations
-- involving units of measure.  To use it, add
--
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM #-}
--
-- above the module header of your source files, or in the
-- @ghc-options@ field of your @.cabal@ file.  You do not need to
-- import this module.
module Plugins.UoM (plugin) where

import GHC.Corroborate
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import Plugins.UoM.TcPlugin (uomPlugin)

-- | The plugin that GHC will load when this module is used with the
-- @-fplugin@ option.
plugin :: Plugin
plugin =
    let mTheory = mkModuleName "Data.Theory.UoM"
        mSyntax = mkModuleName "Data.UnitsOfMeasure.Syntax"

        dbg =
            DebugCts
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceSolution = TraceSolution False
                }

        tc = uomPlugin dbg mTheory mSyntax (fsLit "uom-quantity")
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "uom-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
