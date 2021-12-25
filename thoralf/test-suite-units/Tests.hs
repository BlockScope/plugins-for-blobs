{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}

module Main where

import "uom-quantity" Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH
import Plugins.Thoralf.UnitDefs ()
import Test.Tasty
import Test.Tasty.HUnit

import Defs ()

sum' :: [Quantity Double u] -> Quantity Double u
sum' = foldr (+:) zero

-- Check that the abelian group laws hold

associativity :: Quantity a (u *: (v *: w)) -> Quantity a ((u *: v) *: w)
associativity = id

{- NOTE: I enabled AllowAmbiguousTypes to get commutativity to compile.
    • Couldn't match type ‘v0 *: u0’ with ‘v *: u’
      Expected type: Quantity a (u *: v) -> Quantity a (v *: u)
        Actual type: Quantity a (u0 *: v0) -> Quantity a (v0 *: u0)
      NB: ‘*:’ is a type function, and may not be injective
      The type variables ‘v0’, ‘u0’ are ambiguous
    • In the ambiguity check for ‘commutativity’
      To defer the ambiguity check to use sites, enable AllowAmbiguousTypes
      In the type signature:
        commutativity :: Quantity a (u *: v) -> Quantity a (v *: u)
-}
commutativity :: Quantity a (u *: v) -> Quantity a (v *: u)
commutativity = id

unit :: Quantity a (u *: One) -> Quantity a u
unit = id

inverse :: Quantity a (u *: (One /: u)) -> Quantity a One
inverse = id

inverse2 :: proxy b -> Quantity a (Base b /: Base b) -> Quantity a One
inverse2 _ = id

-- u ~ v * w, v^2 ~ v  =>  u ~ w
g :: (u ~ (v *: w), (v ^: 2) ~ v) => Quantity a u -> Quantity a w
g = id


{- NOTE: I enabled TypeFamilies to get givens to compile.
    • Illegal equational constraint (a *: a) ~ One
      (Use GADTs or TypeFamilies to permit this)
    • In the type signature:
        givens :: ((a *: a) ~ One) =>
                  Quantity Double a -> Quantity Double One
-}
-- a*a ~ 1  =>  a ~ 1
givens :: ((a *: a) ~ One) => Quantity Double a -> Quantity Double One
givens = id

-- NOTE: I enabled DataKinds to get givens2 to compile.
--    Illegal type: ‘2’ Perhaps you intended to use DataKinds
-- a^2 ~ b^3, b^6 ~ 1 => a ~ 1
givens2 :: ((a ^: 2) ~ (b ^: 3), (b ^: 6) ~ One) => Quantity Double a -> Quantity Double One
givens2 = id

-- a^2 ~ b^3, b^37 ~ 1 => b ~ 1
givens3 :: ((a ^: 2) ~ (b ^: 3), (b ^: 37) ~ One) => Quantity Double b -> Quantity Double One
givens3 = id

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "thoralf-plugin:units"
  [ testGroup "Get the underlying value with unQuantity"
    [ testCase "unQuantity 3 m"                $ unQuantity [u| 3 m |]            @?= 3
    , testCase "unQuantity 3 s^2"              $ unQuantity [u| 3 s^2 |]          @?= 3
    , testCase "unQuantity 3 m s^-1"           $ unQuantity [u| 3 m s^-1 |]       @?= 3
    , testCase "unQuantity 3.0 kg m^2 / m s^2" $ unQuantity [u| 3.0 kg m / s^2 |] @?= 3
    , testCase "unQuantity 1"                  $ unQuantity (mk 1)                @?= 1
    , testCase "unQuantity 1 (1/s)"            $ unQuantity [u| 1 (1/s) |]        @?= 1
    , testCase "unQuantity 1 1/s"              $ unQuantity [u| 1 1/s |]          @?= 1
    , testCase "unQuantity 1 s^-1"             $ unQuantity [u| 1 s^-1 |]         @?= 1
    , testCase "unQuantity 2 1 / kg s"         $ unQuantity [u| 2 1 / kg s |]     @?= 2
    , testCase "unQuantity (1 % 2) kg"         $ unQuantity [u| 1 % 2 kg |]       @?= 0.5
    ]
  ]
