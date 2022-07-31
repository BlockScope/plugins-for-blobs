{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

{-# OPTIONS_GHC -Wno-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.UoM #-}

module Literal where

import Data.Ratio ((%))
import Test.Tasty
import Test.Tasty.HUnit

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.TH (u)

import UnitDefs ()

-- WARNING: The commented out tests work for ghc-8.2.2 but not for later GHC versions.
literalTestGroup :: TestTree
literalTestGroup = testGroup "Literal 1 (*:) Quantity _ u"
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

timesOneTestGroup :: TestTree
timesOneTestGroup = testGroup "(1 :: Quantity _ One) (*:) Quantity _ u"
    [ testCase "_ = Double"
        $ (1 :: Quantity Double One) *: ([u| 1 m |] :: (Quantity Double (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Int"
        $ (1 :: Quantity Int One) *: ([u| 1 m |] :: (Quantity Int (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Integer"
        $ (1 :: Quantity Integer One) *: ([u| 1 m |] :: (Quantity Integer (Base "m"))) @?= [u| 1 m |]
    , testCase "_ = Int"
        $ (1 :: Quantity Rational One) *: ([u| 1 m |] :: (Quantity Rational (Base "m"))) @?= [u| 1 m |]
    ]