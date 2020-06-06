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
module Data.UnitsOfMeasure.Unsafe
    ( -- * Type-level units of measure
      Unit
    , type One
    , type Base
    , type (*:)
    , type (/:)
    , type (^:)


      -- * Syntactic representation of units
    , UnitSyntax(..)
    , Unpack
    , Pack
    , Prod

      -- * Internal
    , type (~~)
    , MkUnit
    ) where

import GHC.Exts (Constraint)
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

-- | Syntactic representation of a unit as a pair of lists of base
-- units, for example 'One' is represented as @[] ':/' []@ and
-- @'Base' "m" '/:' 'Base' "s" ^: 2@ is represented as @["m"] ':/' ["s","s"]@.
data UnitSyntax s = [s] :/ [s]
  deriving (Eq, Show)

-- | Pack up a syntactic representation of a unit as a unit.  For example:
--
-- @ 'Pack' ([] ':/' []) = 'One' @
--
-- @ 'Pack' (["m"] ':/' ["s","s"]) = 'Base' "m" '/:' 'Base' "s" ^: 2 @
--
-- This is a perfectly ordinary closed type family.  'Pack' is a left
-- inverse of 'Unpack' up to the equational theory of units, but it is
-- not a right inverse (because there are multiple list
-- representations of the same unit).
type family Pack (u :: UnitSyntax Symbol) :: Unit where
  Pack (xs :/ ys) = Prod xs /: Prod ys

-- | Take the product of a list of base units.
type family Prod (xs :: [Symbol]) :: Unit where
  Prod '[]       = One
  Prod (x ': xs) = Base x *: Prod xs

-- | Unpack a unit as a syntactic representation, where the order of
-- units is deterministic.  For example:
--
-- @ 'Unpack' 'One' = [] ':/' [] @
--
-- @ 'Unpack' ('Base' "s" '*:' 'Base' "m") = ["m","s"] ':/' [] @
--
-- This does not break type soundness because
-- 'Unpack' will reduce only when the unit is entirely constant, and
-- it does not allow the structure of the unit to be observed.  The
-- reduction behaviour is implemented by the plugin, because we cannot
-- define it otherwise.
type family Unpack (u :: Unit) :: UnitSyntax Symbol where {}


-- | This is a bit of a hack, honestly, but a good hack.  Constraints
-- @u ~~ v@ are just like equalities @u ~ v@, except solving them will
-- be delayed until the plugin.  This may lead to better inferred types.
type family (u :: Unit) ~~ (v :: Unit) :: Constraint where {}

infix 4 ~~

-- | This type family is used for translating unit names (as
-- type-level strings) into units.  It will be 'Base' for base units
-- or expand the definition for derived units.
--
-- The instances displayed by Haddock are available only if
-- "Data.UnitsOfMeasure.Defs" is imported.
type family MkUnit (s :: Symbol) :: Unit
