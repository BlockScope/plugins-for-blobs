module Plugins.UoM.TcPlugin (uomPlugin) where

import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (DebugCts)
import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)
import Plugins.UoM.State (mkUoMInit)
import Plugins.UoM.Eq.TcPlugin (unitsEq)
import Plugins.UoM.Unpack.TcPlugin (unitsUnpack)

import Plugins.UoM.Solve.TcPlugin (unitsSolve)

uomPlugin :: DebugCts -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s gs ds ws -> do
            unpacks <- unitsUnpack dbg s gs ds ws
            eqs <- unitsEq dbg unpacks s gs ds ws
            unitsSolve dbg unpacks eqs s gs ds ws
        , tcPluginStop  = const $ return ()
        }