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

-- WARNING: It would be a lot of work to add type annotations to avoid type-default
-- warnings and what is more this leads to type checking failures;
--
-- {-# LANGUAGE PartialTypeSignatures #-}
--
--   , testGroup "read normalisation"
--     [ testCase "1 m/m"
--         $ (read "[u| 1 m/m |]" :: _ Integer _) @?= [u| 1 |]
--     , testCase "-0.3 m s^-1"
--         $ (read "[u| -0.3 m s^-1 |]" :: _ Double _) @?= [u| -0.3 m/s |]
--     , testCase "42 s m s"
--         $ (read "[u| 42 s m s |]" :: _ Integer _)  @?= [u| 42 m s^2 |]
--     ]
--
-- > cabal new-repl uom-plugin:units
-- solveSimpleWanteds: too many iterations (limit = 4)
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module Main
    ( main

    -- * Exported to avoid -Wunused-top-binds.
    , attract
    , sum'
    , mean
    , foo
    , foo'
    , tricky
    , angularSpeed
    , associativity
    , commutativity
    , unit
    , inverse
    , inverse2
    , f
    , g
    , givens
    , givens2
    , givens3
    , baz
    , baf
    , patternSplice
    , pow
    , dimensionless
    ) where

import Test.Tasty
import Test.Tasty.HUnit

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.TH (u)
import "uom-plugin" Data.UnitsOfMeasure.Convert

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
import Z (z)
import qualified Z (tests)

attract
    :: Fractional a
    => Quantity a [u| kg |]
    -> Quantity a [u| kg |]
    -> Quantity a [u| m |]
    -> Quantity a [u| N |]
attract
    (m1 :: Quantity a [u| kg |])
    (m2 :: Quantity a [u| kg |])
    (r :: Quantity a [u| m |])
    = _G *: m1 *: m2 /: (r *: r) :: Quantity a [u| N |]
  where
    _G = [u| 6.67384e-11 N*m^2/kg^2 |]

-- thanks to expipiplus1, https://github.com/adamgundry/uom-plugin/issues/14
angularSpeed :: Quantity Rational [u|rad/s|]
angularSpeed = z x
  where x :: Quantity Rational [u|s^-1|]
        x = undefined


-- Gingerly now...

-- w^-2 ~ kg^-2  =>  w ~ kg
f :: (One /: (w ^: 2)) ~ (One /: [u| kg^2 |])  => Quantity a w -> Quantity a [u| kg |]
f = id

-- u ~ v * w, v^2 ~ v  =>  u ~ w
g :: (u ~ (v *: w), (v ^: 2) ~ v) => Quantity a u -> Quantity a w
g = id

-- a*a ~ 1  =>  a ~ 1
givens :: ((a *: a) ~ One) => Quantity Double a -> Quantity Double One
givens = id

-- a^2 ~ b^3, b^6 ~ 1 => a ~ 1
givens2 :: ((a ^: 2) ~ (b ^: 3), (b ^: 6) ~ One) => Quantity Double a -> Quantity Double One
givens2 = id

-- a^2 ~ b^3, b^37 ~ 1 => b ~ 1
givens3 :: ((a ^: 2) ~ (b ^: 3), (b ^: 37) ~ One) => Quantity Double b -> Quantity Double One
givens3 = id

-- in baf, c is uniquely determined to be a^3 (or b^2)
baz :: (a ~ (c ^: 3), b ~ (c ^: 2)) => Quantity Double a -> Quantity Double b -> Quantity Double c -> Int
baz _ _ _ = 3
baf :: ((a ^: 2) ~ (b ^: 3)) => Quantity Double a -> Quantity Double b -> Int
baf qa qb = baz qa qb undefined


-- Miscellaneous bits and bobs

-- Pattern splices are supported, albeit with restricted types
patternSplice :: Quantity Integer [u| m |] -> Quantity Rational [u| kg/s |] -> Bool
patternSplice [u| 2 m |] [u| 0.0 kg / s |] = True
patternSplice [u| 1 m |] [u| 0.1 kg / s |] = True
patternSplice _          _                 = False

-- Test that basic constraints involving exponentiation work
pow :: Quantity a (u *: (v ^: i)) -> Quantity a ((v ^: i) *: u)
pow = id


-- This declares a synonym for One
[u| dimensionless = 1 |]
dimensionless :: Quantity a [u|dimensionless|] -> Quantity a [u|1|]
dimensionless = id


-- Runtime testsuite

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "uom-plugin:units"
  [ unQuantityTestGroup
  , testGroup "Attach units by applying the quasiquoter without a numeric value"
    [ testCase "m 3"                           $ [u| m |] 3           @?= [u| 3 m |]
    , testCase "m <$> [3..5]"                  $ [u| m |] <$> [3..5]  @?= [[u| 3 m |],[u| 4 m |],[u| 5 m |]]
    , testCase "m/s 3"                         $ [u| m/s |] 3         @?= [u| 3 m/s |]
#if __GLASGOW_HASKELL__ > 802
    -- TODO: Find out why (m s^-1 3) fails with ghc-8.0.2.
    -- solveSimpleWanteds: too many iterations (limit = 4)
    , testCase "m s^-1 3"                      $ [u| m s^-1 |] 3      @?= [u| 3 m s^-1 |]
#endif
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
  , testGroup "convert"
    [ testCase "10m in ft"     $ convert [u| 10m |]   @?= [u| 32.8 ft |]
    , testCase "5 km^2 in m^2" $ convert [u| 5km^2 |] @?= [u| 5000000 m m |]
    , testCase "ratio"         $ show (ratio [u| ft |] [u| m |]) @?= "[u| 3.28 ft / m |]"
    , testCase "100l in m^3"   $ convert [u| 100l |]   @?= [u| 0.1 m^3 |]
    , testCase "1l/m in m^2"   $ convert [u| 1l/m |]   @?= [u| 0.001 m^2 |]
    , testCase "1l/m in m^2"   $ convert [u| 1l/m |]   @?= [u| 0.001 m^2 |]
    , testCase "5l in ft^3"    $ convert [u| 5l   |]   @?= [u| 0.17643776 ft^3 |]
    , testCase "2000000l^2 in ft^3 m^3" $ convert [u| 2000000l^2 |] @?= [u| 70.575104 ft^3 m^3 |]
    , testCase "42 rad/s in s^-1" $ convert [u| 42 rad/s |] @?= [u| 42 s^-1 |]
    , testCase "2.4 l/h in m" $ convert [u| 2.4 l/ha |] @?= [u| 2.4e-7 m |]
    , testCase "1 m^4 in l m" $ convert [u| 1 m^4 |] @?= [u| 1000 l m |]
    ]
  , Z.tests
  , errorsTestGroup
  , readShowTestGroup
  , readNormalisationTestGroup
  , testGroup "read equality (avoid false equivalences)"
    [ testCase "1 m/m^2 /= 1 m" $
        (read "[u| 1 m/m^2 |]" :: Quantity Double [u| m |]) `throws` noParse
    , testCase "1 m /= 1 m/m^2" $
        (read "[u| 1 m |]" :: Quantity Double [u| m/m^2 |]) `throws` noParse
    ]
  ]

noParse :: [[String]]
noParse = [["Prelude.read: no parse"]]