{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

module Main
    ( main

    -- * Exported to avoid -Wunused-top-binds.
    , associativity
    , commutativity
    , unit
    , inverse
    , inverse2

    , module DelayEq

    , patternSplice
    , dimensionless
    , noParse
    ) where

import Test.Tasty
import Test.Tasty.HUnit

import Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH (u)

import Abelian (associativity, commutativity, unit, inverse, inverse2)
import Basic
    ( readMass, basicTestGroup
    , showQuantityTestGroup, readShowTestGroup, readNormalisationTestGroup
    )
import DelayEq (sum', mean, foo, foo', tricky)
import UnQuantity (unQuantityTestGroup)
import Literal (literalTestGroup, timesOneTestGroup)
import UnitDefs ()
import UnitDefsTests ()
import ErrorTestGroups

-- Miscellaneous bits and bobs

-- Pattern splices are supported, albeit with restricted types
patternSplice :: Quantity Integer [u| m |] -> Quantity Rational [u| kg/s |] -> Bool
patternSplice [u| 2 m |] [u| 0.0 kg / s |] = True
patternSplice [u| 1 m |] [u| 0.1 kg / s |] = True
patternSplice _          _                 = False

-- This declares a synonym for One
[u| dimensionless = 1 |]
dimensionless :: Quantity a [u|dimensionless|] -> Quantity a [u|1|]
dimensionless = id

-- Runtime testsuite
main :: IO ()
main = defaultMain tests

-- WARNING: The commented out tests work for ghc-8.2.2 but not for later GHC versions.
tests :: TestTree
tests = testGroup "thoralf-plugin-uom:units"
  [ unQuantityTestGroup
  , testGroup "Attach units by applying the quasiquoter without a numeric value"
    [ testCase "m 3"                           $ [u| m |] 3           @?= [u| 3 m |]
    , testCase "m <$> [3..5]"                  $ [u| m |] <$> [3..5]  @?= [[u| 3 m |],[u| 4 m |],[u| 5 m |]]
    , testCase "m/s 3"                         $ [u| m/s |] 3         @?= [u| 3 m/s |]
    , testCase "m s^-1 3"                      $ [u| m s^-1 |] 3      @?= [u| 3 m s^-1 |]
    , testCase "s^2 3"                         $ [u| s^2 |] 3         @?= [u| 3 s^2 |]
    , testCase "1 $ 3"                         $ [u|dimensionless|] 3 @?= [u| 3 |]
    , testCase "fmap [u| kg |] read $ \"3\""   $ readMass "3"         @?= [u| 3 kg |]
    , testCase "fmap [u| kg |] read $ \"3.0\"" $ readMass "3"         @?= [u| 3.0 kg |]
    ]
  , testGroup "Showing constants"
    [ testCase "show 3m"                 $ show [u| 3 m |]                @?= "[u| 3 m |]"
    , testCase "show 3m/s"               $ show [u| 3 m/s |]              @?= "[u| 3 m / s |]"
    , testCase "show 3.2 s^2"            $ show [u| 3.2 s^2 |]            @?= "[u| 3.2 s^2 |]"
    , testCase "show 3.0 kg m^2 / m s^2" $ show [u| 3.0 kg m^2 / m s^2 |] @?= "[u| 3.0 kg m / s^2 |]"
    , testCase "show 1"                  $ show (mk 1)                    @?= "[u| 1 |]"
    , testCase "show 1 s^-1"             $ show [u| 1 s^-1 |]             @?= "[u| 1 s^-1 |]"
    , testCase "show 2 1 / kg s"         $ show [u| 2 1 / kg s |]         @?= "[u| 2 kg^-1 s^-1 |]"
    , testCase "show (1 % 2) kg"         $ show [u| 1 % 2 kg |]           @?= "[u| 0.5 kg |]"
    ]
  , basicTestGroup
  , literalTestGroup
  , timesOneTestGroup
  , errorsWhenTestGroup
  , showQuantityTestGroup
  , errorsTestGroup
  , readShowTestGroup
  , readNormalisationTestGroup
  ]

noParse :: [[String]]
noParse = [["Prelude.read: no parse"]]