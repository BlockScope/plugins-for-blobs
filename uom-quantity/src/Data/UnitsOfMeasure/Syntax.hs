{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE GADTs #-}

module Data.UnitsOfMeasure.Syntax
    ( -- * Syntactic representation of units
      UnitSyntax(..)
    , Unpack
    , Pack
    , Prod

      -- * Internal
    , type (~~)
    , MkUnit
    ) where

import GHC.Exts (Constraint)
import GHC.TypeLits (Symbol)
import Data.Theory.UoM

infix 4 ~~

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

-- | This type family is used for translating unit names (as
-- type-level strings) into units.  It will be 'Base' for base units
-- or expand the definition for derived units.
--
-- The instances displayed by Haddock are available only if
-- "Data.UnitsOfMeasure.Defs" is imported.
type family MkUnit (s :: Symbol) :: Unit
