module Data.UnitsOfMeasure.Unsafe.Convert
  ( unitKind
  , isUnitKind
  , reifyUnit
  , lookForUnpacks
  , lookupUnitDefs
  ) where

import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeTyCon)
import GHC.Corroborate.Shim (promoteTyCon, mkEqPred)
import GHC.Corroborate.Wrap (newGivenCt)
import Data.List (partition, genericReplicate)

import Data.UnitsOfMeasure.Unsafe.NormalForm
    ( (^:), (*:), (/:), Atom(..), NormUnit, BaseUnit
    , one, baseUnit, varUnit, famUnit, maybeConstant, ascending
    )
import Data.UnitsOfMeasure.Unsafe.UnitDefs
import Internal.Unit.Type (collectType)

-- | 'Unit' promoted to a kind
unitKind :: UnitDefs -> Kind
unitKind uds = TyConApp (promoteTyCon $ unitKindCon uds) []

-- | Is this the 'Unit' kind?
isUnitKind :: UnitDefs -> Kind -> Bool
isUnitKind uds ty
    | Just (tc, _) <- tcSplitTyConApp_maybe ty = tc == unitKindCon uds
    | otherwise = False

-- | Convert a unit normal form to a type expression of kind 'Unit'
reifyUnit :: UnitDefs -> NormUnit -> Type
reifyUnit uds u
    | null xs && null ys = oneTy
    | null ys = foldr1 times xs
    | null xs = oneTy `divide` foldr1 times ys
    | otherwise = foldr1 times xs `divide` foldr1 times ys
    where
        (pos, neg) = partition ((> 0) . snd) $ ascending u

        xs = map fromAtom pos
        ys = map (fromAtom . fmap negate) neg

        oneTy = mkTyConApp (unitOneTyCon uds) []
        times x y = mkTyConApp (mulTyCon uds) [x, y]
        divide x y = mkTyConApp (divTyCon uds) [x, y]

        fromAtom (a, n) = pow n (reifyAtom a)
        pow 1 ty = ty
        pow n ty = mkTyConApp (expTyCon uds) [ty, mkNumLitTy n]

        reifyAtom (BaseAtom s) = mkTyConApp (unitBaseTyCon uds) [s]
        reifyAtom (VarAtom v) = mkTyVarTy v
        reifyAtom (FamAtom f tys) = mkTyConApp f tys

lookForUnpacks
    :: UnitDefs
    -> [Ct]
    -- ^ The given constraints.
    -> [Ct]
    -- ^ The wanted constraints.
    -> TcPluginM [Ct]
    -- ^ The unpacked units as constraints to be introduced as new work for
    -- typechecking constraint solver.
lookForUnpacks
    uds@UnitDefs{unpackTyCon = tyConUnpack, unitSyntaxPromotedDataCon = tyConSyntax}
    givens wanteds = mapM unpackCt unpacks where
    unpacks = concatMap collectCt $ givens ++ wanteds

    collectCt ct = collectType uds ct $ ctEvPred $ ctEvidence ct

    unpackCt (ct,a,xs) =
        newGivenCt loc (mkEqPred ty1 ty2) (evByFiat "units" ty1 ty2)
        where
            ty1 = TyConApp tyConUnpack [a]

            ty2 = mkTyConApp tyConSyntax
                   [ typeSymbolKind
                   , foldr promoter nil ys
                   , foldr promoter nil zs
                   ]

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
    return
        UnitDefs
            { unitKindCon = u
            , unitBaseTyCon = b
            , unitOneTyCon = o
            , mulTyCon = m
            , divTyCon = d
            , expTyCon = e
            , unpackTyCon = x
            , unitSyntaxTyCon = i
            , unitSyntaxPromotedDataCon = getDataCon i ":/"
            , equivTyCon = c
            }
    where
        getDataCon u s =
            case [ dc | dc <- tyConDataCons u, occNameFS (occName (dataConName dc)) == fsLit s ] of
                [d] -> promoteDataCon d
                _ -> error $ "lookupUnitDefs/getDataCon: missing " ++ s