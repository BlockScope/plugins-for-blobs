module Data.UnitsOfMeasure.Unsafe.Kind
  ( unitKind
  , isUnitKind
  , reifyUnit
  ) where

import GHC.Corroborate
import GHC.Corroborate.Shim (promoteTyCon)
import Data.List (partition)

import Data.UnitsOfMeasure.Unsafe.NormalForm (Atom(..), NormUnit, ascending)
import Data.UnitsOfMeasure.Unsafe.UnitDefs

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