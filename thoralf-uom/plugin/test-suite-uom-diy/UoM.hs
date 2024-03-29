{-# LANGUAGE TypeFamilies, TypeOperators, GADTs, DataKinds #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM.Solve #-}

module UoM where

import Data.Kind (Type)

import Data.Theory.UoM (type (/:), Unit, One)
import Data.UnitsOfMeasure.Syntax (Exp)
import ThoralfPlugin.Singletons.Symbol (SSymbol)

import Data.UnitsOfMeasure.Constraint (IsProd, IsDiv, IsEnc)
import ThoralfPlugin.Singletons.Nat (SNat(..))

data Quantity :: Unit -> Type where
    MkQuantity :: Double -> Quantity m

instance Show (Quantity a) where
    show (MkQuantity x) = show x

scalar :: Double -> Quantity One
scalar = MkQuantity

mkQuantity :: IsEnc s n b => Double -> SSymbol s -> SNat n -> Quantity b
mkQuantity d _ _ = MkQuantity d

add :: Quantity a -> Quantity a -> Quantity a
add (MkQuantity x) (MkQuantity y) = MkQuantity (x + y)

negate :: Quantity a -> Quantity a
negate (MkQuantity x) = MkQuantity (-x)

mult :: IsProd a b c => Quantity a -> Quantity b -> Quantity c
mult (MkQuantity x) (MkQuantity y) = MkQuantity (x * y)

div :: IsDiv a b c => Quantity a -> Quantity b -> Quantity c
div (MkQuantity x) (MkQuantity y) = MkQuantity (x / y)

extract :: Quantity a -> Double
extract (MkQuantity d) = d

-- velocity: m/s
-- time: s
-- distance = velocity * time
type M = Exp '[ '("m", 1)] -- metre
type S = Exp '[ '("s", 1)] -- second
type MpS = M /: S -- metres per second

metres :: Quantity MpS -> Quantity S -> Quantity M
metres = mult

distance :: IsDiv M S mps => Quantity mps -> Quantity S -> Quantity M
distance = mult
