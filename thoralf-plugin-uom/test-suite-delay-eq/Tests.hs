{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

module Main where

import Data.Ratio ((%))
import Test.Tasty
import Test.Tasty.HUnit

import "uom-quantity" Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH (u)

import UnitDefs ()

-- w^-2 ~ kg^-2  =>  w ~ kg
f :: (One /: (w ^: 2)) ~ (One /: [u| kg^2 |])  => Quantity a w -> Quantity a [u| kg |]
f = id

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

-- Runtime testsuite
main :: IO ()
main = defaultMain tests

-- WARNING: The commented out tests work for ghc-8.2.2 but not for later GHC versions.
tests :: TestTree
tests = testGroup "thoralf-plugin:units"
  [ testGroup "Literal 1 (*:) Quantity _ u"
    [ testCase "_ = Double"
        $ 1 *: ([u| 1 m |] :: (Quantity Double (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Int"
        $ 1 *: ([u| 1 m |] :: (Quantity Int (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Integer"
        $ 1 *: ([u| 1 m |] :: (Quantity Integer (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Rational, 1 *: [u| 1 m |]"
        $ 1 *: ([u| 1 m |] :: (Quantity Rational (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Rational, mk (1 % 1) *: [u| 1 m |]"
        $ mk (1 % 1) *: ([u| 1 m |] :: (Quantity Rational (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Rational, 1 *: [u| 1 % 1 m |]"
        $ 1 *: ([u| 1 % 1 m |] :: (Quantity Rational (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Rational, mk (1 % 1) *: [u| 1 % 1 m |]"
        $ mk (1 % 1) *: ([u| 1 % 1 m |] :: (Quantity Rational (Base "m"))) @?= [u| 1 m |]
    ]
  ]