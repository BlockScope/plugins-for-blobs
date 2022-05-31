{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module Main
    ( main
    , forceOnGround
    ) where

import Test.Tasty
import Test.Tasty.HUnit

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.TH (u)
import Data.UnitsOfMeasure.Show

import UnitDefs ()

myMass :: Quantity Double (Base "kg")
myMass = [u| 65 kg |]

gravityOnEarth :: Quantity Double [u| m/s^2 |]
gravityOnEarth = [u| 9.808 m/(s*s) |]

forceOnGround :: Quantity Double [u| N |]
forceOnGround = gravityOnEarth *: myMass

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "uom-plugin:units"
  [ testGroup "showQuantity"
    [ testCase "myMass"         $ showQuantity myMass         @?= "65.0 kg"
    , testCase "gravityOnEarth" $ showQuantity gravityOnEarth @?= "9.808 m / s^2"
    , testCase "forceOnGround"  $ showQuantity forceOnGround  @?= "637.52 kg m / s^2"
    ]
  ]