{-# LANGUAGE CPP #-}

-- | This module defines a typechecker plugin that does only the equality part. 
-- To use it, add
--
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Eq #-}
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Simplify #-}
--
-- above the module header of your source files, or in the
-- @ghc-options@ field of your @.cabal@ file.  You do not need to
-- import this module.
module Plugins.UoM.Eq (plugin) where

import GHC.Corroborate
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import Plugins.UoM.Eq.TcPlugin (uomEqPlugin)

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

        tc = uomEqPlugin dbg mTheory mSyntax (fsLit "uom-quantity")
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "uom-eq-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
