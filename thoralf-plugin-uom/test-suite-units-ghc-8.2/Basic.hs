
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

-- | Some basic examples.
module Basic
    ( myMass
    , gravityOnEarth
    , readMass
    , forceOnGround
    , inMetresPerSecond
    , basicTestGroup
    , showQuantityTestGroup
    , readShowTestGroup
    , readNormalisationTestGroup
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

readShowTestGroup :: TestTree
readShowTestGroup = testGroup "read . show"
    [ testCase "3 m"     $ read (show [u| 3 m     |]) @?= [u| 3 m     |]
    , testCase "1.2 m/s" $ read (show [u| 1.2 m/s |]) @?= [u| 1.2 m/s |]
    , testCase "1"       $ read (show [u| 1       |]) @?= [u| 1       |]
    ]

readNormalisationTestGroup :: TestTree
readNormalisationTestGroup = testGroup "read normalisation"
    [ testCase "1 m/m"       $ read "[u| 1 m/m |]"       @?= [u| 1 |]
    , testCase "-0.3 m s^-1" $ read "[u| -0.3 m s^-1 |]" @?= [u| -0.3 m/s |]
    , testCase "42 s m s"    $ read "[u| 42 s m s |]"    @?= [u| 42 m s^2 |]
    ]