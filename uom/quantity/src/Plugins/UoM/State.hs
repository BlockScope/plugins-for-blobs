module Plugins.UoM.State (UomState(..), mkUoMInit) where

import Data.IORef (IORef)
import GHC.Corroborate

import Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))

data UomState =
    UomState
        { unitDefs :: UnitDefs
        , callsRef :: IORef Int
        }

mkUoMInit :: UnitDefs -> TcPluginM UomState
mkUoMInit u = do
    calls <- unsafeTcPluginTcM $ newMutVar 1
    return $ UomState { unitDefs = u, callsRef = calls }