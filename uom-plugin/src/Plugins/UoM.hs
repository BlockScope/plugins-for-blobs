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

import Plugins.UoM.TcPlugin (uomPlugin)
import Plugins.Print.Constraints (TraceCallCount(..), TraceCts(..))
import Plugins.Print (DebugPlugin(..), TraceCarry(..))

-- | The plugin that GHC will load when this module is used with the
-- @-fplugin@ option.
plugin :: Plugin
plugin =
    let mTheory = mkModuleName "Data.Theory.UoM"
        mSyntax = mkModuleName "Data.UnitsOfMeasure.Syntax"
        pkg = fsLit "uom-plugin"

        dbg =
            DebugPlugin
                { traceCallCount = TraceCallCount True
                , traceCts = TraceCts True
                , traceCarry = TraceCarry True
                }

        tc = uomPlugin dbg mTheory mSyntax pkg
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "uom-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
