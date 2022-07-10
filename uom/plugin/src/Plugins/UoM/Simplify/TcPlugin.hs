{-# LANGUAGE NamedFieldPuns #-}

module Plugins.UoM.Simplify.TcPlugin (uomSimplifyPlugin, unitsSimplify) where

import Data.Either (partitionEithers)
import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print
    ( DebugCts(..), Indent(..)
    , pprCtsStepProblem, pprCtsStepSolution, tracePlugin, pprSolverCallCount
    )

import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)
import Data.UnitsOfMeasure.Unsafe.Unify
    ( UnitEquality(..), SubstItem(..), SimplifyResult(..)
    , fromUnitEquality, toUnitEquality
    , simplifySubst, simplifyUnsubst
    , simplifyUnits, simplifySolved
    , substsSubst, substsUnitEquality
    )

import Plugins.UoM.Eq.TcPlugin (evMagic)
import Plugins.UoM.State (UomState(..), mkUoMInit)
import Plugins.UoM.Solve.TcPlugin (reportContradiction, substItemToCt)

uomSimplifyPlugin :: DebugCts -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomSimplifyPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = mkUoMInit =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = unitsSimplify dbg
        , tcPluginStop  = const $ return ()
        }

unitsSimplify
    :: DebugCts
    -> UomState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
unitsSimplify dbg s@UomState{unitDefs} gs ds ws = unitsSimplify' dbg s (f gs) ds (f ws) where
    f = fst . partitionEithers . map (toUnitEquality unitDefs)

unitsSimplify'
    :: DebugCts
    -> UomState
    -> [UnitEquality]
    -> [Ct]
    -> [UnitEquality]
    -> TcPluginM TcPluginResult
unitsSimplify'
    dbgPlugin@DebugCts{traceCallCount}
    UomState{unitDefs, callsRef}
    unit_givens deriveds unit_wanteds

    | null unit_wanteds = do
        logCalls
        logCtsProblem []

        if null unit_givens then return $ TcPluginOk [] [] else do
            let (unit_givens', _) = partitionEithers $ zipWith foo givens (Left <$> unit_givens)
            sr <- simplifyUnits unitDefs $ map snd unit_givens'
            tcPluginTrace "uom-solve simplified givens only" $ ppr sr
            case sr of
                -- Simplified tvs [] evs eqs -> TcPluginOk (map (solvedGiven . fst) unit_givens) []
                Simplified _ -> return $ TcPluginOk [] []
                Impossible eq _ -> contradiction eq

    | otherwise = do
        logCalls
        logCtsProblem wanteds

        sr <- simplifyUnits unitDefs unit_givens
        tcPluginTrace "uom-solve simplified givens" $ ppr sr

        case sr of
            Impossible eq _ -> contradiction eq

            Simplified ss -> do
                sr' <- simplifyUnits unitDefs $ map (substsUnitEquality (simplifySubst ss)) unit_wanteds
                tcPluginTrace "uom-solve simplified wanteds" $ ppr sr'
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
            tracePlugin
                dbgPlugin
                (pprSolverCallCount traceCallCount "ghc-tcplugin-uom-simplify" indent calls)

        logCtsProblem ws =
            mapM_
                (tracePlugin dbgPlugin)
                (pprCtsStepProblem dbgPlugin "cts-problem" indent Nothing givens deriveds ws)

        logCtsSolution x =
            mapM_
                (tracePlugin dbgPlugin)
                (pprCtsStepSolution dbgPlugin "cts-solution" indent x)

        contradiction eq = do
            contra <- reportContradiction unitDefs eq
            logCtsSolution contra
            return contra