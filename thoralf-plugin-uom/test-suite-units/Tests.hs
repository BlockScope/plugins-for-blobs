{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

module Main where

import "uom-quantity" Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH

import UnitDefs ()
import Test.Tasty
import Test.Tasty.HUnit

import Defs ()
import UnQuantity (testsUnQuantity)

sum' :: [Quantity Double u] -> Quantity Double u
sum' = foldr (+:) zero

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
  [ testsUnQuantity
  , testGroup "read . show"
    [ testCase "3 m"     $ read (show [u| 3 m     |]) @?= [u| 3 m     |]
    , testCase "1.2 m/s" $ read (show [u| 1.2 m/s |]) @?= [u| 1.2 m/s |]
    , testCase "0"       $ read (show [u| 1       |]) @?= [u| 1       |]
    ]
  , testGroup "read normalisation"
    [ testCase "1 m/m"       $ read "[u| 1 m/m |]"       @?= [u| 1 |]
    , testCase "-0.3 m s^-1" $ read "[u| -0.3 m s^-1 |]" @?= [u| -0.3 m/s |]
    , testCase "42 s m s"    $ read "[u| 42 s m s |]"    @?= [u| 42 m s^2 |]
    ]
  ]

noParse :: [[String]]
noParse = [["Prelude.read: no parse"]]