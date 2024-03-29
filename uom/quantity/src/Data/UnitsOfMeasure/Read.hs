{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-partial-type-signatures #-}
{-# OPTIONS_GHC -Wno-orphans #-}

-- | Very very rough support for reading units of measure in the
-- syntax used by "Data.UnitsOfMeasure.Show".
module Data.UnitsOfMeasure.Read
   ( readQuantity
   , readUnit
   , readWithUnit
   , Some(..)
   , QuantityWithUnit(..)

     -- * Exports for doctest-parallel testing
   , expToUnitSyntax, someListVal, unitSyntaxToSomeUnit, expToSomeUnit
   ) where

import Control.Monad (join)
import GHC.TypeLits (SomeSymbol(..), someSymbolVal)
import Data.List (genericReplicate)
import Data.Proxy (Proxy(..))
import Data.Type.Equality ((:~:)(Refl))
import Text.Parse.Units (parseUnit, universalSymbolTable, UnitExp(..))

import Data.UnitsOfMeasure.Unsafe.Quantity (Quantity(..))
import Data.UnitsOfMeasure.Syntax (Pack, Unpack, UnitSyntax((:/)))
import Data.UnitsOfMeasure.Singleton
    ( SUnit(..), SList(..), KnownUnit
    , unitSing, forgetSUnit, testEquivalentSUnit)

-- | Represents a quantity whose units have a syntactic representation
-- that is known statically and at runtime.
data QuantityWithUnit a u where
    QuantityWithUnit :: Quantity a (Pack u) -> SUnit u -> QuantityWithUnit a u

-- | An existential wrapper type: @'Some' p@ is essentially @exists x . p x@.
data Some p where
  Some :: p x -> Some p

instance (KnownUnit (Unpack u), u ~ Pack (Unpack u), Read a) => Read (Quantity a u) where
  readsPrec i (' ':s) = readsPrec i s
  readsPrec _ ('[':'u':'|':s)
   | (t, '|':']':r) <- break (== '|') s
   , Right v <- readWithUnit (Proxy :: Proxy (Unpack u)) t = [(v, r)]
  readsPrec _ _ = []

-- | Parse a quantity and check that it has the expected units.
readWithUnit :: forall proxy a u . (Read a, KnownUnit u)
             => proxy u -> String -> Either String (Quantity a (Pack u))
readWithUnit _ s = do
  Some (QuantityWithUnit (q :: Quantity a _) v) <- readQuantity s
  case testEquivalentSUnit (unitSing :: SUnit u) v of
    Just Refl -> Right q
    Nothing   -> Left ("wrong units: got " ++ show (forgetSUnit v))

-- | Parse a quantity along with its units.
readQuantity :: Read a => String -> Either String (Some (QuantityWithUnit a))
readQuantity s = case reads s of
                   [(n, s')] -> do Some u <- readUnit s'
                                   return $ Some (QuantityWithUnit (MkQuantity n) u)
                   _         -> Left "reads: no parse"

-- | Parse a unit.
--
-- >>> readUnit ""
-- Right [] :/ []
--
-- >>> readUnit "m"
-- Right ["m"] :/ []
--
-- >>> readUnit "m m"
-- Right ["m","m"] :/ []
--
-- >>> readUnit "m^2"
-- Right ["m","m"] :/ []
--
-- >>> readUnit "m^3"
-- Right ["m","m","m"] :/ []
--
-- >>> readUnit "m/s^2"
-- Right ["m"] :/ ["s","s"]
--
-- >>> readUnit "m s^-2"
-- Right ["m"] :/ ["s","s"]
readUnit :: String -> Either String (Some SUnit)
readUnit s = expToSomeUnit <$> parseUnit universalSymbolTable s

-- |
-- >>> expToSomeUnit Unity
-- [] :/ []
--
-- >>> expToSomeUnit (Unit Nothing "m")
-- ["m"] :/ []
--
-- >>> expToSomeUnit (Mult (Unit Nothing "m") (Unit Nothing "m"))
-- ["m","m"] :/ []
--
-- >>> expToSomeUnit (Pow (Unit Nothing "m") 3)
-- ["m","m","m"] :/ []
--
-- >>> expToSomeUnit (Div (Unit Nothing "m") (Pow (Unit Nothing "s") 2))
-- ["m"] :/ ["s","s"]
expToSomeUnit :: UnitExp () String -> Some SUnit
expToSomeUnit = unitSyntaxToSomeUnit . expToUnitSyntax

-- |
-- >>> unitSyntaxToSomeUnit ([] :/ [])
-- [] :/ []
--
-- >>> unitSyntaxToSomeUnit (["m"] :/ ["s", "s"])
-- ["m"] :/ ["s","s"]
unitSyntaxToSomeUnit :: UnitSyntax String -> Some SUnit
unitSyntaxToSomeUnit (xs :/ ys) = case (someListVal xs, someListVal ys) of
  (Some xs', Some ys') -> Some (SUnit xs' ys')

-- |
-- >>> (\(Some xs) -> forgetSList xs) $ someListVal []
-- []
--
-- >>> (\(Some xs) -> forgetSList xs) $ someListVal ["m"]
-- ["m"]
someListVal :: [String] -> Some SList
someListVal [] = Some SNil
someListVal (x:xs) = case (someSymbolVal x, someListVal xs) of
                       (SomeSymbol x', Some xs') -> Some (SCons x' xs')

-- |
-- >>> expToUnitSyntax Unity
-- [] :/ []
--
-- >>> expToUnitSyntax (Unit Nothing "m")
-- ["m"] :/ []
--
-- >>> expToUnitSyntax (Mult (Unit Nothing "m") (Unit Nothing "m"))
-- ["m","m"] :/ []
--
-- >>> expToUnitSyntax (Pow (Unit Nothing "m") 3)
-- ["m","m","m"] :/ []
--
-- >>> expToUnitSyntax (Div (Unit Nothing "m") (Pow (Unit Nothing "s") 2))
-- ["m"] :/ ["s","s"]
expToUnitSyntax :: UnitExp () String -> UnitSyntax String
expToUnitSyntax Unity = [] :/ []
expToUnitSyntax (Unit _ s) = [s] :/ []
expToUnitSyntax (u `Mult` v) = (u_xs ++ v_xs) :/ (u_ys ++ v_ys)
  where
    u_xs :/ u_ys = expToUnitSyntax u
    v_xs :/ v_ys = expToUnitSyntax v
expToUnitSyntax (u `Div` v) = (u_xs ++ v_ys) :/ (u_ys ++ v_xs)
  where
    u_xs :/ u_ys = expToUnitSyntax u
    v_xs :/ v_ys = expToUnitSyntax v
expToUnitSyntax (u `Pow` n)
    | n >= 0    = join (genericReplicate n u_xs) :/ join (genericReplicate n u_ys)
    | otherwise = join (genericReplicate (negate n) u_ys) :/ join (genericReplicate (negate n) u_xs)
  where
    u_xs :/ u_ys = expToUnitSyntax u

-- $setup
-- >>> :set -XFlexibleInstances
-- >>> import Data.UnitsOfMeasure.Singleton
-- >>> import Data.UnitsOfMeasure.Syntax (UnitSyntax((:/)))
-- >>> import Text.Parse.Units
--
-- >>> :{
-- instance Show (Some SUnit) where
--     show (Some u) = show $ forgetSUnit u
-- :}
