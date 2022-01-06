{-# LANGUAGE NamedFieldPuns, PackageImports #-}

module Plugins.UoM.Unpack.TcPlugin (uomUnpackPlugin, unitsUnpack) where

import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (TracingFlags(..), Indent(..), tracePlugin, pprSolverCallCount)
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Convert (lookupUnitDefs, lookForUnpacks)

import Plugins.UoM.State (UomState(..), mkUoMInit)

uomUnpackPlugin :: TracingFlags -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomUnpackPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s gs ds ws -> do
            unpacks <- unitsUnpack dbg s gs ds ws
            return $ TcPluginOk [] unpacks
        , tcPluginStop  = const $ return ()
        }

unitsUnpack
    :: TracingFlags
    -> UomState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM [Ct]
unitsUnpack
    dbgPlugin@TracingFlags{traceCallCount}
    UomState{unitDefs, callsRef}
    givens _deriveds wanteds

    | null wanteds = do logCalls; return []
    | otherwise = do logCalls; lookForUnpacks unitDefs givens wanteds
    where
        logCalls = do
            calls <- unsafeTcPluginTcM $ readMutVar callsRef
            unsafeTcPluginTcM $ writeMutVar callsRef (calls + 1)
            tracePlugin dbgPlugin $ pprSolverCallCount (Indent 1) traceCallCount calls
