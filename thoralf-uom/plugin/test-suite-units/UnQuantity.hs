{-# LANGUAGE DataKinds, QuasiQuotes #-}

-- NOTE: The plugin is not needed to use unQuantity.
{-# OPTIONS_GHC -Wno-type-defaults #-}

module UnQuantity where

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit ((@?=), testCase)

import Data.UnitsOfMeasure (mk, unQuantity)
import Data.UnitsOfMeasure.TH (u)

unQuantityTestGroup :: TestTree
unQuantityTestGroup = testGroup "Get the underlying value with unQuantity"
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
