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

-- | The plugin that GHC will load when this module is used with the
-- @-fplugin@ option.
plugin :: Plugin
plugin =
    let m = mkModuleName "Data.UnitsOfMeasure.Unsafe"
        pkg = fsLit "uom-plugin"
        tc = uomPlugin m pkg
    in defaultPlugin{tcPlugin = const . Just $ tracePlugin "uom-plugin" tc}
