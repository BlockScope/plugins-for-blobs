-- | This module defines a typechecker plugin that solves equations involving
-- units of measure but doesn't do unit unpacking.  To use it, add
--
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Solve #-}
--
-- above the module header of your source files, or in the
-- @ghc-options@ field of your @.cabal@ file.  You do not need to
-- import this module.
module Plugins.UoM.Solve (plugin) where

import GHC.Corroborate
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import Plugins.UoM.Solve.TcPlugin (uomSolvePlugin)

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

        tc = uomSolvePlugin dbg mTheory mSyntax (fsLit "uom-quantity")
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "uom-solve-plugin" tc
            , pluginRecompile = purePlugin
            }
