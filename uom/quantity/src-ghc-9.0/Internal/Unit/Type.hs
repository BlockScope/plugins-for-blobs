module Internal.Unit.Type (collectType) where

import GHC.Core.TyCo.Rep (Type(..))

import Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs, eqTc, collectKindOrType)
import Data.UnitsOfMeasure.Unsafe.NormalForm (BaseUnit)

collectType :: UnitDefs -> a -> Type -> [(a, Type, [(BaseUnit, Integer)])]
collectType uds ct (AppTy f s) = collectType uds ct f ++ collectType uds ct s
collectType uds ct (TyConApp tc [a]) | eqTc uds tc = collectKindOrType uds ct a
collectType uds ct (TyConApp _ as) = concatMap (collectType uds ct) as
collectType uds ct (FunTy _ _ t v) = collectType uds ct t ++ collectType uds ct v
collectType uds ct (ForAllTy _ t) = collectType uds ct t
collectType _ _ TyVarTy{} = []
collectType _ _ LitTy{} = []
collectType _ _ CastTy{} = []
collectType _ _ CoercionTy{} = []
