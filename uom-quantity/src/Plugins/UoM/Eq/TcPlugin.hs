{-# LANGUAGE NamedFieldPuns #-}

module Plugins.UoM.Eq.TcPlugin (uomEqPlugin, uomUnpackEqPlugin, unitsEq, evMagic) where

import Data.Either (partitionEithers)
import GHC.Corroborate hiding (tracePlugin)
import GHC.Corroborate.Shim (mkFunnyEqEvidence)
import Plugins.Print
    ( DebugCts(..), Indent(..), tracePlugin, pprSolverCallCount )

import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)
import Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))
import Data.UnitsOfMeasure.Unsafe.Unify
    ( UnitEquality(..), fromUnitEquality, toUnitEquality )

import Plugins.UoM.Unpack.TcPlugin (unitsUnpack)
import Plugins.UoM.State (UomState(..), mkUoMInit)

uomEqPlugin :: DebugCts -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomEqPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s@UomState{unitDefs = ud} gs ds ws -> do
            (gs', ws') <- unitsEq dbg [] s gs ds ws
            let gs'' =
                    [ (evMagic "uom-eq" ud ct, ct)
                    | g <- gs'
                    , let ct = fromUnitEquality g
                    ]
            return $ TcPluginOk gs'' (fromUnitEquality <$> ws')
        , tcPluginStop  = const $ return ()
        }

uomUnpackEqPlugin :: DebugCts -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomUnpackEqPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s@UomState{unitDefs = ud} gs ds ws -> do
            unpacks <- unitsUnpack dbg s gs ds ws
            (gs', ws') <- unitsEq dbg unpacks s gs ds ws
            let gs'' =
                    [ (evMagic "uom-unpack-eq" ud ct, ct)
                    | g <- gs'
                    , let ct = fromUnitEquality g
                    ]
            return $ TcPluginOk gs'' (fromUnitEquality <$> ws')
        , tcPluginStop  = const $ return ()
        }

unitsEq
    :: DebugCts
    -> [Ct] -- ^ Unpacked given units
    -> UomState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM ([UnitEquality], [UnitEquality]) -- ^ Unit givens and unit wanteds
unitsEq
    dbgPlugin@DebugCts{traceCallCount}
    unpacks
    UomState{unitDefs, callsRef}
    givens _deriveds wanteds

    | null wanteds = do
        logCalls

        zonked_cts <- mapM zonkCt givens
        let (unit_givens, _) = partitionEithers $ map toUE zonked_cts
        return (unit_givens, [])

    | otherwise = do
        logCalls

        if not $ null unpacks then return ([], []) else do
            let (unit_wanteds, _) = partitionEithers $ map toUE wanteds
            if null unit_wanteds then return ([], []) else do
                (unit_givens, _) <- partitionEithers . map toUE <$> mapM zonkCt givens
                return (unit_givens, unit_wanteds)
    where
        toUE = toUnitEquality unitDefs

        logCalls = do
            calls <- unsafeTcPluginTcM $ readMutVar callsRef
            unsafeTcPluginTcM $ writeMutVar callsRef (calls + 1)
            tracePlugin dbgPlugin $ pprSolverCallCount (Indent 1) traceCallCount calls

-- | Produce bogus evidence for a constraint, including actual
-- equality constraints and our fake '(~~)' equality constraints.
evMagic :: String -> UnitDefs -> Ct -> EvTerm
evMagic s uds ct = case classifyPredType $ ctEvPred $ ctEvidence ct of
    EqPred NomEq t1 t2 -> evByFiat s t1 t2

    IrredPred t
        | Just (tc, [t1,t2]) <- splitTyConApp_maybe t
        , tc == equivTyCon uds -> mkFunnyEqEvidence s t t1 t2

    _ -> error "evMagic"