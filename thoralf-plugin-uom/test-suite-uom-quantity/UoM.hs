{-# LANGUAGE TypeFamilies, TypeOperators, GADTs, DataKinds, QuasiQuotes #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM.Solve #-}

module UoM where

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.Unsafe.Quantity (Quantity(..))
import Data.UnitsOfMeasure.TH (u)

import Data.UnitsOfMeasure.Constraint (IsProd, IsDiv)

import Defs ()

scalar :: Double -> Quantity Double One
scalar = MkQuantity

add :: Quantity Double a -> Quantity Double a -> Quantity Double a
add (MkQuantity x) (MkQuantity y) = MkQuantity (x + y)

negate :: Quantity Double a -> Quantity Double a
negate (MkQuantity x) = MkQuantity (-x)

mult :: IsProd a b c => Quantity Double a -> Quantity Double b -> Quantity Double c
mult (MkQuantity x) (MkQuantity y) = MkQuantity (x * y)

div :: IsDiv a b c => Quantity Double a -> Quantity Double b -> Quantity Double c
div (MkQuantity x) (MkQuantity y) = MkQuantity (x / y)

extract :: Quantity Double a -> Double
extract (MkQuantity d) = d

-- velocity: m/s
-- time: s
-- distance = velocity * time
type M = [u| m |]
type S = [u| s |]
type MpS = M /: S -- metres per second

mkM :: Double -> Quantity Double M
mkM = MkQuantity

mkS :: Double -> Quantity Double S
mkS = MkQuantity

mkMpS :: Double -> Quantity Double MpS
mkMpS = MkQuantity

metres :: Quantity Double MpS -> Quantity Double S -> Quantity Double M
metres = mult

distance :: IsDiv M S mps => Quantity Double mps -> Quantity Double S -> Quantity Double M
distance = mult
