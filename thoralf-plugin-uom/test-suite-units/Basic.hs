
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM.DelayEq #-}

-- | Some basic examples.
module Basic
    ( myMass
    , gravityOnEarth
    , readMass
    , forceOnGround
    , inMetresPerSecond
    , basicTestGroup
    , showQuantityTestGroup
    ) where

import Test.Tasty
import Test.Tasty.HUnit

import "uom-quantity" Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH (u)
import "uom-quantity" Data.UnitsOfMeasure.Show

import UnitDefs ()
import DelayEq (mean, tricky)

myMass :: Quantity Double (Base "kg")
myMass = [u| 65 kg |]

gravityOnEarth :: Quantity Double [u| m/s^2 |]
gravityOnEarth = [u| 9.808 m/(s*s) |]

readMass :: Read a => String -> Quantity a (Base "kg")
readMass = fmap [u| kg |] read

forceOnGround :: Quantity Double [u| N |]
forceOnGround = gravityOnEarth *: myMass

inMetresPerSecond :: a -> Quantity a [u| m/s |]
inMetresPerSecond = [u| m/s |]

basicTestGroup :: TestTree
basicTestGroup = testGroup "Basic operations"
    [ testCase "2 + 2"                   $ [u| 2 s |] +: [u| 2 s |]        @?= [u| 4 s |]
    , testCase "in m/s"                  $ inMetresPerSecond 5             @?= [u| 5 m/s |]
    , testCase "mean"                    $ mean [ [u| 2 N |], [u| 4 N |] ] @?= [u| 3 N |]
    , testCase "tricky generalisation"   $ tricky [u| 2 s |]               @?= ([u| 6 m s |], [u| 10 kg s |])
    , testCase "polymorphic zero"        $ [u| 0 |] @?= [u| 0 m |]
    , testCase "polymorphic frac zero"   $ [u| 0.0 |] @?= [u| 0.0 N / m |]
    ]

showQuantityTestGroup :: TestTree
showQuantityTestGroup = testGroup "showQuantity"
    [ testCase "myMass"         $ showQuantity myMass         @?= "65.0 kg"
    , testCase "gravityOnEarth" $ showQuantity gravityOnEarth @?= "9.808 m / s^2"
    , testCase "forceOnGround"  $ showQuantity forceOnGround  @?= "637.52 kg m / s^2"
    ]