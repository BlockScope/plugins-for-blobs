{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE GADTs #-}

module Data.UnitsOfMeasure.Unsafe.Quantity
    ( -- * Values indexed by their units
      Quantity(..)
    , unQuantity
    , zero
    , mk

      -- * Unit-safe 'Num' operations
    , (+:)
    , (*:)
    , (-:)
    , negate'
    , abs'
    , signum'
    , fromInteger'

      -- * Unit-safe 'Fractional' operations
    , (/:)
    , recip'
    , fromRational'

      -- * Unit-safe 'Real' operations
    , toRational'

      -- * Unit-safe 'Floating' operations
    , sqrt'
    ) where

import Control.DeepSeq (NFData)
import Foreign.Storable (Storable)

import Data.UnitsOfMeasure.Theory

infixl 6 +:, -:
infixl 7 *:, /:

-- | A @Quantity a u@ is represented identically to a value of
-- underlying numeric type @a@, but with units @u@.
newtype Quantity a (u :: Unit) = MkQuantity a
  -- ^ Warning: the 'MkQuantity' constructor allows module invariants
  -- to be violated, so use it with caution!
type role Quantity representational nominal

-- These classes work uniformly on the underlying representation,
-- regardless of the units
deriving instance Bounded a => Bounded (Quantity a u)
deriving instance Eq      a => Eq      (Quantity a u)
deriving instance Ord     a => Ord     (Quantity a u)

-- These classes are not unit-polymorphic, so we have to restrict the
-- unit index to be dimensionless
deriving instance (Enum       a, u ~ One) => Enum       (Quantity a u)
deriving instance (Floating   a, u ~ One) => Floating   (Quantity a u)
deriving instance (Fractional a, u ~ One) => Fractional (Quantity a u)
deriving instance (Integral   a, u ~ One) => Integral   (Quantity a u)
deriving instance (Num        a, u ~ One) => Num        (Quantity a u)
deriving instance (Real       a, u ~ One) => Real       (Quantity a u)
deriving instance (RealFloat  a, u ~ One) => RealFloat  (Quantity a u)
deriving instance (RealFrac   a, u ~ One) => RealFrac   (Quantity a u)

-- To enable marshalling into FFI code.
deriving instance Storable a => Storable (Quantity a u)

-- To enable deriving NFData for data types containing Quantity fields.
deriving instance NFData a => NFData (Quantity a u)

-- | Extract the underlying value of a quantity
unQuantity :: Quantity a u -> a
unQuantity (MkQuantity x) = x

-- | Zero is polymorphic in its units: this is required because the
-- 'Num' instance constrains the quantity to be dimensionless, so
-- @0 :: Quantity a u@ is not well typed.
zero :: Num a => Quantity a u
zero = MkQuantity 0

-- | Construct a 'Quantity' from a dimensionless value.  Note that for
-- numeric literals, the 'Num' and 'Fractional' instances allow them
-- to be treated as quantities directly.
mk :: a -> Quantity a One
mk = MkQuantity

-- | Addition ('+') of quantities requires the units to match.
(+:) :: Num a => Quantity a u -> Quantity a u -> Quantity a u
MkQuantity x +: MkQuantity y = MkQuantity (x + y)

-- | Multiplication ('*') of quantities multiplies the units.
(*:) :: (Num a, w ~~ u *: v) => Quantity a u -> Quantity a v -> Quantity a w
MkQuantity x *: MkQuantity y = MkQuantity (x * y)

-- | Subtraction ('-') of quantities requires the units to match.
(-:) :: Num a => Quantity a u -> Quantity a u -> Quantity a u
MkQuantity x -: MkQuantity y = MkQuantity (x - y)

-- | Negation ('negate') of quantities is polymorphic in the units.
negate' :: Num a => Quantity a u -> Quantity a u
negate' (MkQuantity x) = MkQuantity (negate x)

-- | Absolute value ('abs') of quantities is polymorphic in the units.
abs' :: Num a => Quantity a u -> Quantity a u
abs' (MkQuantity x) = MkQuantity (abs x)

-- | The sign ('signum') of a quantity gives a dimensionless result.
signum' :: Num a => Quantity a u -> Quantity a One
signum' (MkQuantity x) = MkQuantity (signum x)

-- | Convert an 'Integer' quantity into any 'Integral' type ('fromInteger').
fromInteger' :: Integral a => Quantity Integer u -> Quantity a u
fromInteger' (MkQuantity x) = MkQuantity (fromInteger x)

-- | Division ('/') of quantities divides the units.
(/:) :: (Fractional a, w ~~ u /: v) => Quantity a u -> Quantity a v -> Quantity a w
MkQuantity x /: MkQuantity y = MkQuantity (x / y)

-- | Reciprocal ('recip') of quantities reciprocates the units.
recip' :: (Fractional a, w ~~ One /: u) => Quantity a u -> Quantity a w
recip' (MkQuantity x) = MkQuantity (recip x)

-- | Convert a 'Rational' quantity into any 'Fractional' type ('fromRational').
fromRational' :: Fractional a => Quantity Rational u -> Quantity a u
fromRational' (MkQuantity x) = MkQuantity (fromRational x)

-- | Convert any 'Real' quantity into a 'Rational' type ('toRational').
toRational' :: Real a => Quantity a u -> Quantity Rational u
toRational' (MkQuantity x) = MkQuantity (toRational x)

-- | Taking the square root ('sqrt') of a quantity requires its units
-- to be a square.  Fractional units are not currently supported.
sqrt' :: (Floating a, w ~~ u ^: 2) => Quantity a w -> Quantity a u
sqrt' (MkQuantity x) = MkQuantity (sqrt x)
