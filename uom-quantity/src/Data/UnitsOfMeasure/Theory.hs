{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE GADTs #-}

-- | This module defines the core types used in the @uom-plugin@
-- library.  Note that importing this module may allow you to violate
-- invariants, so you should generally work with the safe interface in
-- "Data.UnitsOfMeasure" instead.
module Data.UnitsOfMeasure.Theory
    ( -- * Type-level units of measure
      Unit
    , type One
    , type Base
    , type (*:)
    , type (/:)
    , type (^:)
    ) where

import GHC.TypeLits (Symbol, Nat, type (-))

infixl 7 *:, /:
infixr 8 ^:

-- | (Kind) Units of measure
data Unit where {}

-- | Dimensionless unit (identity element)
type family One :: Unit where {}

-- | Base unit
type family Base (b :: Symbol) :: Unit where {}

-- | Multiplication for units of measure
type family (u :: Unit) *: (v :: Unit) :: Unit where {}

-- | Division for units of measure
type family (u :: Unit) /: (v :: Unit) :: Unit where {}

-- | Exponentiation (to a positive power) for units of measure;
-- negative exponents are not yet supported (they require an Integer kind)
type family (u :: Unit) ^: (n :: Nat)  :: Unit where
  u ^: 0 = One
  u ^: 1 = u
  u ^: n = u *: (u ^: (n-1))
