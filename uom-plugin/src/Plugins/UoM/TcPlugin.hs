{-# LANGUAGE PackageImports #-}

module Plugins.UoM.TcPlugin (uomPlugin) where

import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (TracingFlags)
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)

import Plugins.UoM.State (mkUoMInit)
import Plugins.UoM.Solve.TcPlugin (unitsSolve)
import Plugins.UoM.Unpack.TcPlugin (unitsUnpack)

uomPlugin :: TracingFlags -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s gs ds ws -> do
            unpacks <- unitsUnpack dbg s gs ds ws
            unitsSolve dbg unpacks s gs ds ws
        , tcPluginStop  = const $ return ()
        }