module Data.UnitsOfMeasure.Unsafe.UnitDefs
  ( UnitDefs(..)
  , eqTc
  , normaliseUnit
  , collectKindOrType
  ) where

import GHC.Corroborate
import Data.UnitsOfMeasure.Unsafe.NormalForm
    ( (^:), (*:), (/:), Atom(..), NormUnit, BaseUnit
    , one, baseUnit, varUnit, famUnit, maybeConstant, ascending
    )

-- | Contains referenes to the basic unit constructors declared in
-- "Data.UnitsOfMeasure", as loaded inside GHC.
data UnitDefs = UnitDefs
    { unitKindCon :: TyCon
    -- ^ The 'Unit' type constructor, to be promoted to a kind
    , unitBaseTyCon :: TyCon
    -- ^ The 'Base' data constructor of 'Unit', promoted to a type constructor
    , unitOneTyCon :: TyCon
    -- ^ The 'One'  type family
    , mulTyCon :: TyCon
    -- ^ The '(*:)' type family
    , divTyCon :: TyCon
    -- ^ The '(/:)' type family
    , expTyCon :: TyCon
    -- ^ The '(^:)' type family
    , unpackTyCon :: TyCon
    -- ^ The 'Unpack' type family
    , unitSyntaxTyCon :: TyCon
    -- ^ The 'UnitSyntax' type constructor, to be promoted to a kind
    , unitSyntaxPromotedDataCon :: TyCon
    -- ^ The data constructor of 'UnitSyntax', promoted to a type constructor
    , equivTyCon :: TyCon
    -- ^ The '(~~)' type family
    }

eqTc :: UnitDefs -> TyCon -> Bool
eqTc = (==) . unpackTyCon

collectKindOrType :: UnitDefs -> a -> Type -> [(a, Type, [(BaseUnit, Integer)])]
collectKindOrType uds ct a = case maybeConstant =<< normaliseUnit uds a of
    Just xs -> [(ct, a, xs)]
    _ -> []

-- | Try to convert a type to a unit normal form; this does not check
-- the type has kind 'Unit', and may fail even if it does.
normaliseUnit :: UnitDefs -> Type -> Maybe NormUnit
normaliseUnit uds ty | Just ty1 <- coreView ty = normaliseUnit uds ty1
normaliseUnit _ (TyVarTy v) = pure $ varUnit v
normaliseUnit uds (TyConApp tc tys)
    | tc == unitOneTyCon uds =
        pure one

    | tc == unitBaseTyCon uds, [x] <- tys =
        pure $ baseUnit x

    | tc == mulTyCon uds, [u, v] <- tys =
        (*:) <$> normaliseUnit uds u <*> normaliseUnit uds v

    | tc == divTyCon uds, [u, v] <- tys =
        (/:) <$> normaliseUnit uds u <*> normaliseUnit uds v

    | tc == expTyCon uds, [u, n] <- tys, Just i <- isNumLitTy n =
        (^:) <$> normaliseUnit uds u <*> pure i

    | isFamilyTyCon tc = pure $ famUnit tc tys

normaliseUnit _ _ = Nothing
