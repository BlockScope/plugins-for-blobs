{-# LANGUAGE CPP #-}

-- | This module defines a typechecker plugin that unpacks units of measure.  To
-- use it, add
--
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
--
-- above the module header of your source files, or in the
-- @ghc-options@ field of your @.cabal@ file.  You do not need to
-- import this module.
module Plugins.UoM.Unpack (plugin) where

import GHC.Corroborate
import Plugins.Print
    ( DebugCts(..)
    , TraceCarry(..), TraceSolution(..), TraceCallCount(..), TraceCts(..)
    )

import Plugins.UoM.Unpack.TcPlugin (uomUnpackPlugin)

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
                , traceCarry = TraceCarry False
                , traceSolution = TraceSolution False
                }

        tc = uomUnpackPlugin dbg mTheory mSyntax (fsLit "uom-quantity")
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "uom-unpack-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
