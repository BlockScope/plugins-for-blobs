{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE TypeFamilies #-}

{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | Experimental support for showing units of measure in a pretty
-- syntax.  This requires the units to be fully determined.
--
-- Apart from the definitions below, this module also exports a 'Show'
-- instance for @'Quantity' a u@, which is re-exported by
-- "Data.UnitsOfMeasure".
module Data.UnitsOfMeasure.Show (showQuantity, showUnit) where

import Data.UnitsOfMeasure.Unsafe.Quantity (Quantity(..))
import Data.UnitsOfMeasure.Syntax (Unpack, UnitSyntax((:/)))
import Data.UnitsOfMeasure.Singleton (KnownUnit, unitVal)

import Data.List (group)

instance (Show a, KnownUnit (Unpack u)) => Show (Quantity a u) where
  show x = "[u| " ++ showQuantity x ++ " |]"

-- | Render a quantity nicely, followed by its units:
--
-- >> showQuantity (1 /: [u| 0.1 s / m kg |])
-- "10.0 kg m / s"
showQuantity :: forall a u. (Show a, KnownUnit (Unpack u)) => Quantity a u -> String
showQuantity (MkQuantity x) = show x ++ if s == "1" then "" else ' ':s
  where s = showUnit (undefined :: proxy u)

-- | Render a unit nicely:
--
-- >> showUnit (undefined :: proxy [u| 1 / s |])
-- "s^-1"
--
-- >> showUnit (undefined :: proxy [u| 3.0 kg m / s^2 |])
-- "s^-1"
showUnit :: forall proxy u . KnownUnit (Unpack u) => proxy u -> String
showUnit _ = showUnitBits (unitVal (undefined :: proxy' (Unpack u)))

-- |
--
-- >>> showUnitBits $ ["m"] :/ []
-- "m"
--
-- >>> showUnitBits $ [] :/ ["s", "s"]
-- "s^-2"
--
-- >>> showUnitBits $ ["kg", "m"] :/ ["s", "s"]
-- "kg m / s^2"
showUnitBits :: UnitSyntax String -> String
showUnitBits ([] :/ []) = "1"
showUnitBits (xs :/ []) = showPos xs
showUnitBits ([] :/ ys) = showNeg ys
showUnitBits (xs :/ ys) = showPos xs ++ " / " ++ showPos ys

-- |
--
-- >>> showPos ["m"]
-- "m"
--
-- >>> showPos ["m", "m", "m"]
-- "m^3"
--
-- >>> showPos ["kg", "m"]
-- "kg m"
showPos :: [String] -> String
showPos = unwords . map (\ xs -> showAtom (head xs, length xs)) . group

-- |
--
-- >>> showNeg ["s"]
-- "s^-1"
--
-- >>> showNeg ["s", "s"]
-- "s^-2"
--
-- >>> showNeg ["kg", "m"]
-- "kg^-1 m^-1"
showNeg :: [String] -> String
showNeg = unwords . map (\ xs -> showAtom (head xs, negate $ length xs)) . group

-- |
--
-- >>> showAtom ("s", 0)
-- "1"
--
-- >>> showAtom ("s", 1)
-- "s"
--
-- >>> showAtom ("s", 2)
-- "s^2"
--
-- >>> showAtom ("s", -1)
-- "s^-1"
--
-- >>> showAtom ("s", -2)
-- "s^-2"
showAtom :: (String, Int) -> String
showAtom (_, 0) = "1"
showAtom (s, 1) = s
showAtom (s, i) = s ++ "^" ++ show i