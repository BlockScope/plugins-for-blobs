{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM.DelayEq #-}

module DelayEq where

import Data.List

import "uom-quantity" Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH (u)

import UnitDefs ()

sum' :: [Quantity Double u] -> Quantity Double u
sum' = foldr (+:) zero

mean :: [Quantity Double u] -> Quantity Double u
mean xs = sum' xs /: mk (genericLength xs)

foo :: Num a => Quantity a u -> Quantity a v -> Quantity a (u *: v)
foo x y = x *: y +: y *: x

foo' :: Num a => Quantity a u -> Quantity a v -> Quantity a (u *: v)
foo' = foo

-- Andrew's awkward generalisation example is accepted only with a
-- type signature, even with NoMonoLocalBinds
tricky
    :: forall a u . Num a
    => Quantity a u
    -> (Quantity a (u *: Base "m"), Quantity a (u *: Base "kg"))
tricky x =
    let h :: Quantity a v -> Quantity a (u *: v)
        h = (x *:)
    in (h [u| 3 m |], h [u| 5 kg |])