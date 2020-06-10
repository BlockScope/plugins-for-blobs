{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE UndecidableInstances, GADTs #-}

-- | This module declares the unit of measure interface that is really just an
-- abelian group isomorphic to Z+.
module Data.Theory.UoM
    ( -- * Type-level units of measure
      Unit
    , One
    , Base
    , type (*:)
    , type (/:)
    , type (^:)
    , IsBase
    , IsExp
    , IsProd
    , IsDiv
    , FromList
    ) where

import Data.Kind (Constraint)
import GHC.TypeLits (type (-), Symbol, Nat)

infixl 7 *:, /:
infixr 8 ^:

-- | (Kind) Units of measure
data Unit where {}

-- | Dimensionless unit (identity element)
type family One :: Unit where {}

-- | Base unit
type family Base (b :: Symbol) :: Unit where {}

-- | Multiplication for units of measure
type family (*:) (a :: Unit) (b :: Unit) :: Unit where {}

-- | Division for units of measure
type family (/:) (n :: Unit) (d :: Unit) :: Unit where {}

-- | Exponentiation (to a positive power) for units of measure;
-- negative exponents are not yet supported (they require an Integer kind)
type family (u :: Unit) ^: (n :: Nat)  :: Unit where
    u ^: 0 = One
    u ^: 1 = u
    u ^: n = u *: (u ^: (n - 1))

type family IsBase (measure :: Symbol) (b :: Unit) :: Constraint where
    IsBase m b = (b ~ Base m)

type family IsExp (measure :: Symbol) (power :: Nat) (b :: Unit) :: Constraint where
    IsExp m i b = (b ~ (Base m ^: i))

type family IsProd (a :: Unit) (b :: Unit) (aTimesb :: Unit) :: Constraint where
    IsProd a b c = (c ~ (a *: b))

type family IsDiv (a :: Unit) (b :: Unit) (aDivb :: Unit) :: Constraint where
    IsDiv a b c = (c ~ (a /: b))

type family FromList (xs :: [(Symbol, Nat)]) :: Unit where
    FromList '[] = One
    FromList ('(u, 0) ': ys) = One *: FromList ys
    FromList ('(u, 1) ': ys) = Base u *: FromList ys
    FromList ('(u, i) ': ys) = (Base u ^: i) *: FromList ys
