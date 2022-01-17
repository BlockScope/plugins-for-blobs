{-# LANGUAGE NamedFieldPuns #-}

module Plugins.UoM.Unpack.TcPlugin (uomUnpackPlugin, unitsUnpack) where

import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (DebugCts(..), Indent(..), tracePlugin, pprSolverCallCount)

import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs, lookForUnpacks)
import Plugins.UoM.State (UomState(..), mkUoMInit)

uomUnpackPlugin :: DebugCts -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomUnpackPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s gs ds ws -> do
            unpacks <- unitsUnpack dbg s gs ds ws
            return $ TcPluginOk [] unpacks
        , tcPluginStop  = const $ return ()
        }

unitsUnpack
    :: DebugCts
    -> UomState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM [Ct]
unitsUnpack
    dbgPlugin@DebugCts{traceCallCount}
    UomState{unitDefs, callsRef}
    givens _deriveds wanteds

    | null wanteds = do logCalls; return []
    | otherwise = do logCalls; lookForUnpacks unitDefs givens wanteds
    where
        logCalls = do
            calls <- unsafeTcPluginTcM $ readMutVar callsRef
            unsafeTcPluginTcM $ writeMutVar callsRef (calls + 1)
            tracePlugin
                dbgPlugin
                (pprSolverCallCount "ghc-tcplugin-uom-unpack" (Indent 1) traceCallCount calls)
