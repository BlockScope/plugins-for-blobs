{-# LANGUAGE CPP #-}

-- | This module defines a typechecker plugin that does unpacking and equality.
-- To use it, add
--
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.UnpackEq #-}
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Simplify #-}
--
-- above the module header of your source files, or in the
-- @ghc-options@ field of your @.cabal@ file.  You do not need to
-- import this module.
module Plugins.UoM.UnpackEq (plugin) where

import GHC.Corroborate
import Plugins.Print
    ( TracingFlags(..)
    , TraceCarry(..), TraceSolution(..), TraceCallCount(..), TraceCts(..)
    )

import Plugins.UoM.Eq.TcPlugin (uomUnpackEqPlugin)

-- | The plugin that GHC will load when this module is used with the
-- @-fplugin@ option.
plugin :: Plugin
plugin =
    let mTheory = mkModuleName "Data.Theory.UoM"
        mSyntax = mkModuleName "Data.UnitsOfMeasure.Syntax"

        dbg =
            TracingFlags
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceCarry = TraceCarry False
                , traceSolution = TraceSolution False
                }

        tc = uomUnpackEqPlugin dbg mTheory mSyntax (fsLit "uom-quantity")
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "uom-unpack-eq-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
