{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE UndecidableInstances, GADTs #-}

-- | This module declares the unit of measure interface that is really just an
-- abelian group isomorphic to Z+.
module Data.Theory.UoM
    ( Unit
    , FromList
    , One
    , Base
    , type (*:)
    , type (/:)
    , IsBase
    , IsProd
    , IsDiv
    ) where

import Data.Kind (Constraint)
import GHC.TypeLits (Symbol, Nat)

-- | (Kind) Units of measure
data Unit where {}

-- | Dimensionless unit (identity element)
type family One :: Unit where {}

-- | Base unit
type family Base (measure :: Symbol) (power :: Nat) :: Unit where {}

-- | Multiplication for units of measure
type family (*:) (a :: Unit) (b :: Unit) :: Unit where {}

-- | Division for units of measure
type family (/:) (n :: Unit) (d :: Unit) :: Unit where {}

type family IsBase (measure :: Symbol) (power :: Nat) (b :: Unit) :: Constraint where
    IsBase m i b = (b ~ Base m i)

type family IsProd (a :: Unit) (b :: Unit) (aTimesb :: Unit) :: Constraint where
    IsProd a b c = (c ~ (a *: b))

type family IsDiv (a :: Unit) (b :: Unit) (aDivb :: Unit) :: Constraint where
    IsDiv a b c = (c ~ (a /: b))

type family FromList (xs :: [(Symbol, Nat)]) :: Unit where
    FromList '[] = One
    FromList ('(u, i) ': ys) = Base u i *: FromList ys
