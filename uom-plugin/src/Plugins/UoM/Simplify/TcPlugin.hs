{-# LANGUAGE NamedFieldPuns, PackageImports #-}

module Plugins.UoM.Simplify.TcPlugin (uomSimplifyPlugin, unitsSimplify) where

import Data.Either (partitionEithers)
import GHC.Corroborate hiding (tracePlugin)
import GHC.Corroborate.Shim (mkEqPred, mkFunnyEqEvidence)
import GHC.Corroborate.Wrap (newGivenCt, newWantedCt)
import Plugins.Print
    ( TracingFlags(..), Indent(..)
    , pprCtsStepProblem, pprCtsStepSolution, tracePlugin, pprSolverCallCount
    )

import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Kind (reifyUnit)
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Unify
    ( UnitEquality(..), SubstItem(..), SimplifyResult(..)
    , fromUnitEquality, toUnitEquality
    , simplifySubst, simplifyUnsubst
    , simplifyUnits, simplifySolved
    , substsSubst, substsUnitEquality
    )

import Plugins.UoM.Eq.TcPlugin (evMagic)
import Plugins.UoM.State (UomState(..), mkUoMInit)

uomSimplifyPlugin :: TracingFlags -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomSimplifyPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = unitsSimplify dbg
        , tcPluginStop  = const $ return ()
        }

unitsSimplify
    :: TracingFlags
    -> UomState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
unitsSimplify dbg s@UomState{unitDefs} gs ds ws = unitsSimplify' dbg s (f gs) ds (f ws) where
    f = fst . partitionEithers . map (toUnitEquality unitDefs)

unitsSimplify'
    :: TracingFlags
    -> UomState
    -> [UnitEquality]
    -> [Ct]
    -> [UnitEquality]
    -> TcPluginM TcPluginResult
unitsSimplify'
    dbgPlugin@TracingFlags{traceCallCount}
    UomState{unitDefs, callsRef}
    unit_givens deriveds unit_wanteds

    | null unit_wanteds = do
        logCalls
        logCtsProblem []

        if null unit_givens then return $ TcPluginOk [] [] else do
            let (unit_givens', _) = partitionEithers $ zipWith foo givens (Left <$> unit_givens)
            sr <- simplifyUnits unitDefs $ map snd unit_givens'
            tcPluginTrace "unitsOfMeasureSolver simplified givens only" $ ppr sr
            case sr of
                -- Simplified tvs [] evs eqs -> TcPluginOk (map (solvedGiven . fst) unit_givens) []
                Simplified _ -> return $ TcPluginOk [] []
                Impossible eq _ -> contradiction eq

    | otherwise = do
        logCalls
        logCtsProblem wanteds

        sr <- simplifyUnits unitDefs unit_givens
        tcPluginTrace "unitsOfMeasureSolver simplified givens" $ ppr sr

        case sr of
            Impossible eq _ -> contradiction eq

            Simplified ss -> do
                sr' <- simplifyUnits unitDefs $ map (substsUnitEquality (simplifySubst ss)) unit_wanteds
                tcPluginTrace "unitsOfMeasureSolver simplified wanteds" $ ppr sr'
                case sr' of
                    Impossible _eq _ ->
                        -- Don't report a contradiction, see #22
                        return $ TcPluginOk [] []

                    Simplified ss' -> do
                        let solvedCts =
                                [ (evMagic "uom-solve" unitDefs ct, ct)
                                | eq <- simplifySolved ss'
                                , let ct = fromUnitEquality eq
                                ]

                        ok <-
                            TcPluginOk solvedCts
                            <$>
                                mapM
                                    (substItemToCt unitDefs)
                                    (filter
                                        (isWanted . ctEvidence . siCt)
                                        (substsSubst
                                            (simplifyUnsubst ss)
                                            (simplifySubst ss'))
                                    )

                        logCtsSolution ok
                        return ok
    where
        givens = fromUnitEquality <$> unit_givens
        wanteds = fromUnitEquality <$> unit_wanteds

        foo :: Ct -> Either UnitEquality Ct -> Either (Ct, UnitEquality) Ct
        foo ct (Left x) = Left (ct, x)
        foo _ (Right ct') = Right ct'

        indent = Indent 1

        logCalls = do
            calls <- unsafeTcPluginTcM $ readMutVar callsRef
            unsafeTcPluginTcM $ writeMutVar callsRef (calls + 1)
            tracePlugin dbgPlugin $ pprSolverCallCount indent traceCallCount calls

        logCtsProblem ws =
            sequence_
                $ tracePlugin dbgPlugin
                <$> pprCtsStepProblem indent dbgPlugin Nothing givens deriveds ws

        logCtsSolution x =
            sequence_
                $ tracePlugin dbgPlugin
                <$> pprCtsStepSolution indent dbgPlugin x

        contradiction eq = do
            contra <- reportContradiction unitDefs eq
            logCtsSolution contra
            return contra

reportContradiction :: UnitDefs -> UnitEquality -> TcPluginM TcPluginResult
reportContradiction uds eq =
    TcPluginContradiction . pure <$> fromUnitEqualityForContradiction uds eq

-- See #22 for why we need this
fromUnitEqualityForContradiction :: UnitDefs -> UnitEquality -> TcPluginM Ct
fromUnitEqualityForContradiction uds (UnitEquality ct u v) =
    case classifyPredType $ ctEvPred $ ctEvidence ct of
        EqPred NomEq _ _ -> return ct
        _
            | isGivenCt ct ->
                newGivenCt
                    (ctLoc ct)
                    (mkEqPred u' v')
                    (mkFunnyEqEvidence "units" (ctPred ct) u' v')

            | otherwise -> newWantedCt (ctLoc ct) (mkEqPred u' v')
    where
        u' = reifyUnit uds u
        v' = reifyUnit uds v

substItemToCt :: UnitDefs -> SubstItem -> TcPluginM Ct
substItemToCt uds si
    | isGiven (ctEvidence ct) = newGivenCt loc prd $ evByFiat "units" ty1 ty2
    | otherwise = newWantedCt loc prd
    where
        prd = mkEqPred ty1 ty2
        ty1 = mkTyVarTy (siVar si)
        ty2 = reifyUnit uds (siUnit si)
        ct = siCt si
        loc = ctLoc ct