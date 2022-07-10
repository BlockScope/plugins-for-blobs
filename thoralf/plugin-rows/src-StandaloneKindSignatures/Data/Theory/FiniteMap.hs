{-# LANGUAGE StandaloneKindSignatures, TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE UndecidableInstances, RankNTypes, ConstraintKinds, GADTs #-}

-- | This module declares the finite maps interface.
module Data.Theory.FiniteMap
  ( Fm
  , Nil
  , Has
  , Omits
  , FromList
  , AddField
  , DelField
  , UnionFm
  , IntersectFm
  ) where

import Data.Kind (Type)

-- The sole data definition, everything else is the exposed grammar.
data Fm :: forall k v. k -> v -> Type where {}

-- The Encoding
type Nil :: Fm (k :: Type) (v :: Type)
type family Nil where {}

type Alter :: Fm k v -> k -> v -> Fm k v
type family Alter m key val where {}

type Delete :: Fm (k :: Type) (v :: Type) -> k -> Fm k v
type family Delete m k where {}

type UnionL :: Fm (k :: Type) (v :: Type) -> Fm k v -> Fm k v
type family UnionL m m' where {}

type IntersectL :: Fm (k :: Type) (v :: Type) -> Fm k v -> Fm k v
type family IntersectL m m' where {}

-- Contraints
type Has m k v = Alter m k v ~ m
type Omits m k = Delete m k ~ m
type AddField m m' k v = Alter m k v ~ m'
type DelField m m' k = Delete m k ~ m'
type UnionFm m1 m2 u = u ~ UnionL m1 m2
type IntersectFm m1 m2 i = i ~ IntersectL m1 m2

-- type family FromList (xs :: [(k,v)]) :: Fm k v where
type FromList :: [(k,v)] -> Fm k v
type family FromList xs where
    FromList '[] = Nil
    FromList ( '(k,v) : ys ) = (Alter (FromList ys) k v)
