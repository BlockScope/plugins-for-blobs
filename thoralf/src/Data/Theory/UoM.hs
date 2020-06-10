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
    , Exp
    ) where

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

type family Exp (xs :: [(Symbol, Nat)]) :: Unit where
    Exp '[] = One
    Exp ('(u, 0) ': ys) = One *: Exp ys
    Exp ('(u, 1) ': ys) = Base u *: Exp ys
    Exp ('(u, i) ': ys) = (Base u ^: i) *: Exp ys
