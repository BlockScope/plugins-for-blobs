{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE UndecidableInstances, GADTs, StandaloneKindSignatures #-}

-- | This module defines the core types used in the @uom-plugin@
-- library.  Note that importing this module may allow you to violate
-- invariants, so you should generally work with the safe interface in
-- "Data.UnitsOfMeasure" instead.
module Data.Theory.UoM
    ( -- * Type-level units of measure
      Unit
    , One
    , Base
    , type (*:)
    , type (/:)
    , type (^:)
    , Enc
    ) where

import GHC.TypeLits (type (-), Symbol, Nat)

infixl 7 *:, /:
infixr 8 ^:

-- | (Kind) Units of measure
data Unit where {}

-- | Dimensionless unit (identity element)
type One :: Unit
type family One where {}

-- | Base unit
type Base :: Symbol -> Unit
type family Base b where {}

-- | An encoding that covers both s and s^n.
type Enc :: Symbol -> Nat -> Unit
type family Enc s n where {}

-- | Multiplication for units of measure
type (*:) :: Unit -> Unit -> Unit
type family u *: v where {}

-- | Division for units of measure
type (/:) :: Unit -> Unit -> Unit
type family u /: v where {}

-- | Exponentiation (to a positive power) for units of measure;
-- negative exponents are not yet supported (they require an Integer kind)
type (^:) :: Unit -> Nat -> Unit
type family u ^: n where
    u ^: 0 = One
    u ^: 1 = u
    u ^: n = u *: (u ^: (n - 1))
