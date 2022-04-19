{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE StandaloneKindSignatures #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE GADTs #-}

module Data.UnitsOfMeasure.Syntax
    ( -- * Syntactic representation of units
      UnitSyntax(..)
    , Unpack, Pack
    , Prod, Exp

      -- * Internal
    , type (~~)
    , MkUnit
    ) where

import GHC.Exts (Constraint)
import GHC.TypeLits (Symbol, Nat)
import Data.Theory.UoM

infix 4 ~~

-- | Syntactic representation of a unit as a pair of lists of base units, for
-- example 'One' is represented as @[] ':/' []@ and @'Base' "m" '/:' 'Base' "s"
-- ^: 2@ is represented as @["m"] ':/' ["s","s"]@.
--
-- >>> :kind '[] :/ '[]
-- '[] :/ '[] :: UnitSyntax s
--
-- >>> :type [] :/ []
-- [] :/ [] :: UnitSyntax s
--
-- >>> :kind '["m"] :/ '["s", "s"]
-- '["m"] :/ '["s", "s"] :: UnitSyntax Symbol
--
-- >>> :type ["m"] :/ ["s", "s"]
-- ["m"] :/ ["s", "s"] :: Data.String.IsString s => UnitSyntax s
data UnitSyntax s = [s] :/ [s] deriving (Eq, Show)

-- | Pack up a syntactic representation of a unit as a unit.  For example:
--
-- @ 'Pack' ([] ':/' []) = 'One' @
--
-- @ 'Pack' (["m"] ':/' ["s","s"]) = 'Base' "m" '/:' 'Base' "s" ^: 2 @
--
-- This is a perfectly ordinary closed type family.  'Pack' is a left inverse
-- of 'Unpack' up to the equational theory of units, but it is not a right
-- inverse (because there are multiple list representations of the same unit).
--
-- >>> :kind Pack ('[] :/ '[])
-- Pack ('[] :/ '[]) :: Unit
--
-- >>> :kind Pack ('["m"] :/ '["s", "s"])
-- Pack ('["m"] :/ '["s", "s"]) :: Unit
type Pack :: UnitSyntax Symbol -> Unit
type family Pack u where
    Pack (xs :/ ys) = Prod xs /: Prod ys

-- | Take the product of a list of base units.
--
-- >>> :kind Prod '[]
-- Prod '[] :: Unit
--
-- >>> :kind Prod '["s", "s"]
-- Prod '["s", "s"] :: Unit
type Prod :: [Symbol] -> Unit
type family Prod xs where
    Prod '[] = One
    Prod (x ': xs) = Base x *: Prod xs

-- | Take the product of a list of units with explicit powers.
--
-- >>> :kind Exp '[]
-- Exp '[] :: Unit
--
-- >>> :kind Exp ('("s", 0) ': '[])
-- Exp ('("s", 0) ': '[]) :: Unit
--
-- >>> :kind Exp '[ '("s", 0)]
-- Exp '[ '("s", 0)] :: Unit
--
-- >>> :kind Exp '[ '("s", 1)]
-- Exp '[ '("s", 1)] :: Unit
--
-- >>> :kind Exp '[ '("s", 2)]
-- Exp '[ '("s", 2)] :: Unit
type Exp :: [(Symbol, Nat)] -> Unit
type family Exp xs where
    Exp '[] = One
    Exp ('(u, 0) ': ys) = One *: Exp ys
    Exp ('(u, 1) ': ys) = Base u *: Exp ys
    Exp ('(u, i) ': ys) = (Base u ^: i) *: Exp ys

-- | Unpack a unit as a syntactic representation, where the order of units is
-- deterministic.  For example:
--
-- @ 'Unpack' 'One' = [] ':/' [] @
--
-- @ 'Unpack' ('Base' "s" '*:' 'Base' "m") = ["m","s"] ':/' [] @
--
-- This does not break type soundness because 'Unpack' will reduce only when
-- the unit is entirely constant, and it does not allow the structure of the
-- unit to be observed.  The reduction behaviour is implemented by the plugin,
-- because we cannot define it otherwise.
--
-- >>> :kind Unpack One
-- Unpack One :: UnitSyntax Symbol
--
-- >>> :kind Unpack (Base "m")
-- Unpack (Base "m") :: UnitSyntax Symbol
--
-- >>> :kind Unpack (Base "s" *: Base "m")
-- Unpack (Base "s" *: Base "m") :: UnitSyntax Symbol
--
-- >>> :kind Unpack (Base "m" /: (Base "s" *: Base "s")) :~: '["m"] :/ '["s", "s"]
-- Unpack (Base "m" /: (Base "s" *: Base "s")) :~: '["m"] :/ '["s", "s"] :: *
--
-- >>> :kind Unpack (Base "m" /: (Base "s" *: Base "s")) :~~: '["m"] :/ '["s", "s"]
-- Unpack (Base "m" /: (Base "s" *: Base "s")) :~~: '["m"] :/ '["s", "s"] :: *
type Unpack :: Unit -> UnitSyntax Symbol
type family Unpack u where {}

-- | This is a bit of a hack, honestly, but a good hack.  Constraints @u ~~ v@
-- are just like equalities @u ~ v@, except solving them will be delayed until
-- the plugin.  This may lead to better inferred types.
--
-- >>> :kind (Base "s" *: Base "m") ~~ (Base "m" *: Base "s")
-- (Base "s" *: Base "m") ~~ (Base "m" *: Base "s") :: Constraint
type (~~) :: Unit -> Unit -> Constraint
type family (u :: Unit) ~~ (v :: Unit) :: Constraint where {}

-- | This type family is used for translating unit names (as type-level
-- strings) into units.  It will be 'Base' for base units or expand the
-- definition for derived units.
--
-- The instances displayed by Haddock are available only if
-- "Data.UnitsOfMeasure.Defs" is imported.
--
-- >>> :kind MkUnit "m"
-- MkUnit "m" :: Unit
type MkUnit :: Symbol -> Unit
type family MkUnit s

-- $setup
-- >>> :set -XExplicitNamespaces -XDataKinds -XTypeOperators -XOverloadedStrings
-- >>> import Data.Type.Equality (type (:~:), type (:~~:))
-- >>> import Data.Theory.UoM
-- >>> import GHC.Types (Symbol)