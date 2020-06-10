-- | This module defines a typechecker plugin that solves equations
-- involving units of measure.  To use it, add
--
-- > {-# OPTIONS_GHC -fplugin Plugins.UoM #-}
--
-- above the module header of your source files, or in the
-- @ghc-options@ field of your @.cabal@ file.  You do not need to
-- import this module.
module Plugins.UoM.TcPlugin (uomPlugin) where

import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeTyCon)
import GHC.Corroborate.Type (collectType)
import GHC.Corroborate.Shim (mkEqPred, mkFunnyEqEvidence)
import GHC.Corroborate.Wrap (newGivenCt, newWantedCt)
import Data.Either (partitionEithers)
import Data.List (genericReplicate)

import Data.UnitsOfMeasure.Unsafe.Convert
import Data.UnitsOfMeasure.Unsafe.Unify
import Plugins.UoM.Print (Debug(..), debugIO, printCts, pprStep)

uomPlugin :: Debug -> ModuleName -> ModuleName -> FastString -> TcPlugin
uomPlugin dbg theory syntax pkg =
    TcPlugin
        { tcPluginInit  = lookupUnitDefs theory syntax pkg
        , tcPluginSolve = unitsOfMeasureSolver dbg
        , tcPluginStop  = const $ return ()
        }

unitsOfMeasureSolver
    :: Debug
    -> UnitDefs
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
unitsOfMeasureSolver dbg uds givens deriveds wanteds
    | null wanteds = do
        _ <- printCts dbg False givens deriveds []
        sequence_ $ debugIO dbg <$> pprStep dbg givens deriveds []

        zonked_cts <- mapM zonkCt givens
        let (unit_givens, _) = partitionEithers $ zipWith foo givens $ map toUE zonked_cts

        if null unit_givens then return $ TcPluginOk [] [] else do
            sr <- simplifyUnits uds $ map snd unit_givens
            tcPluginTrace "unitsOfMeasureSolver simplified givens only" $ ppr sr
            case sr of
                -- Simplified tvs [] evs eqs -> TcPluginOk (map (solvedGiven . fst) unit_givens) []
                Simplified _ -> return $ TcPluginOk [] []
                Impossible eq _ -> reportContradiction uds eq

    | otherwise = do
        _ <- printCts dbg False givens deriveds wanteds
        sequence_ $ debugIO dbg <$> pprStep dbg givens deriveds wanteds
        xs <- lookForUnpacks uds givens wanteds

        if not $ null xs then return $ TcPluginOk [] xs else do
            let (unit_wanteds, _) = partitionEithers $ map toUE wanteds
            if null unit_wanteds then return $ TcPluginOk [] [] else do
                (unit_givens, _) <- partitionEithers . map toUE <$> mapM zonkCt givens
                sr <- simplifyUnits uds unit_givens
                tcPluginTrace "unitsOfMeasureSolver simplified givens" $ ppr sr
                case sr of
                    Impossible eq _ -> reportContradiction uds eq
                    Simplified ss -> do
                        sr' <- simplifyUnits uds $ map (substsUnitEquality (simplifySubst ss)) unit_wanteds
                        tcPluginTrace "unitsOfMeasureSolver simplified wanteds" $ ppr sr'
                        case sr' of
                            Impossible _eq _ ->
                                -- Don't report a contradiction, see #22
                                return $ TcPluginOk [] []

                            Simplified ss' ->
                                TcPluginOk
                                    [ (evMagic uds ct, ct)
                                    | eq <- simplifySolved ss'
                                    , let ct = fromUnitEquality eq
                                    ]
                                    <$>
                                        mapM
                                            (substItemToCt uds)
                                            (filter
                                                (isWanted . ctEvidence . siCt)
                                                (substsSubst
                                                    (simplifyUnsubst ss)
                                                    (simplifySubst ss'))
                                            )
    where
        -- solvedGiven ct = (ctEvTerm (ctEvidence ct), ct)
        toUE = toUnitEquality uds

        foo :: Ct -> Either UnitEquality Ct -> Either (Ct, UnitEquality) Ct
        foo ct (Left x) = Left (ct, x)
        foo _ (Right ct') = Right ct'

reportContradiction :: UnitDefs -> UnitEquality -> TcPluginM TcPluginResult
reportContradiction uds eq = TcPluginContradiction . pure <$> fromUnitEqualityForContradiction uds eq

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

lookForUnpacks :: UnitDefs -> [Ct] -> [Ct] -> TcPluginM [Ct]
lookForUnpacks uds givens wanteds = mapM unpackCt unpacks where
    unpacks = concatMap collectCt $ givens ++ wanteds

    collectCt ct = collectType uds ct $ ctEvPred $ ctEvidence ct

    unpackCt (ct,a,xs) =
        newGivenCt loc (mkEqPred ty1 ty2) (evByFiat "units" ty1 ty2)
        where
            ty1 = TyConApp (unpackTyCon uds) [a]
            ty2 = mkTyConApp (unitSyntaxPromotedDataCon uds)
                   [ typeSymbolKind
                   , foldr promoter nil ys
                   , foldr promoter nil zs ]
            loc = ctLoc ct

            ys = concatMap (\ (s, i) -> if i > 0 then genericReplicate i s else []) xs
            zs = concatMap (\ (s, i) -> if i < 0 then genericReplicate (abs i) s else []) xs

    nil = mkTyConApp (promoteDataCon nilDataCon) [typeSymbolKind]

    promoter x t = mkTyConApp cons_tycon [typeSymbolKind, mkStrLitTy x, t]
    cons_tycon = promoteDataCon consDataCon

lookupUnitDefs :: ModuleName -> ModuleName -> FastString -> TcPluginM UnitDefs
lookupUnitDefs theory syntax pkgName = do
    mT <- lookupModule theory pkgName
    mS <- lookupModule syntax pkgName
    let f = divulgeTyCon mT
    let g = divulgeTyCon mS
    u <- f "Unit"
    b <- f "Base"
    o <- f "One"
    m <- f "*:"
    d <- f "/:"
    e <- f "^:"
    x <- g "Unpack"
    i <- g "UnitSyntax"
    c <- g "~~"
    return $ UnitDefs u b o m d e x i (getDataCon i ":/") c
    where
        getDataCon u s =
            case [ dc | dc <- tyConDataCons u, occNameFS (occName (dataConName dc)) == fsLit s ] of
                [d] -> promoteDataCon d
                _   -> error $ "lookupUnitDefs/getDataCon: missing " ++ s

-- | Produce bogus evidence for a constraint, including actual
-- equality constraints and our fake '(~~)' equality constraints.
evMagic :: UnitDefs -> Ct -> EvTerm
evMagic uds ct = case classifyPredType $ ctEvPred $ ctEvidence ct of
    EqPred NomEq t1 t2 -> evByFiat "units" t1 t2

    IrredPred t
      | Just (tc, [t1,t2]) <- splitTyConApp_maybe t
      , tc == equivTyCon uds -> mkFunnyEqEvidence "units" t t1 t2

    _ -> error "evMagic"
