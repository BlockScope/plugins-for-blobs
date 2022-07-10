
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

-- | Some basic examples.
module Basic
    ( myMass
    , gravityOnEarth
    , readMass
    --, forceOnGround
    , inMetresPerSecond
    , basicTestGroup
    , showQuantityTestGroup
    , readShowTestGroup
    , readNormalisationTestGroup
    ) where

import Test.Tasty
import Test.Tasty.HUnit

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.TH (u)
import Data.UnitsOfMeasure.Show

import UnitDefs ()
import DelayEq (mean, {- tricky -})

myMass :: Quantity Double (Base "kg")
myMass = [u| 65 kg |]

gravityOnEarth :: Quantity Double [u| m/s^2 |]
gravityOnEarth = [u| 9.808 m/(s*s) |]

readMass :: Read a => String -> Quantity a (Base "kg")
readMass = fmap [u| kg |] read

-- • Could not deduce: fsk0
--                     Data.UnitsOfMeasure.Syntax.~~ (fsk1 *: fsk2)
--     arising from a use of ‘*:’
-- forceOnGround :: Quantity Double [u| N |]
-- forceOnGround = gravityOnEarth *: myMass

inMetresPerSecond :: a -> Quantity a [u| m/s |]
inMetresPerSecond = [u| m/s |]

basicTestGroup :: TestTree
basicTestGroup = testGroup "Basic operations"
    [ testCase "2 + 2"                   $ [u| 2 s |] +: [u| 2 s |]        @?= [u| 4 s |]
    , testCase "in m/s"                  $ inMetresPerSecond 5             @?= [u| 5 m/s |]
    , testCase "mean"                    $ mean [ [u| 2 N |], [u| 4 N |] ] @?= [u| 3 N |]

    -- • Couldn't match type ‘fsk6’ with ‘fsk4 *: fsk5’
    --   Expected type: Quantity Integer (Base "s" *: Base "kg")
    --     Actual type: Quantity Integer (MkUnit "kg" *: MkUnit "s")
    --   The type variables ‘fsk4’, ‘fsk5’, ‘fsk6’ are ambiguous
    -- , testCase "tricky generalisation"   $ tricky [u| 2 s |]               @?= ([u| 6 m s |], [u| 10 kg s |])

    -- • Occurs check: cannot construct the infinite type:
    --     fsk4 ~ (fsk4 *: One) /: One
    --   The type variable ‘fsk4’ is ambiguous
    --   Expected type: Quantity Integer (Pack (Unpack (Base "m")))
    --     Actual type: Quantity Integer (MkUnit "m")
    -- , testCase "polymorphic zero"        $ [u| 0 |] @?= [u| 0 m |]

    , testCase "polymorphic frac zero"   $ [u| 0.0 |] @?= [u| 0.0 N / m |]
    ]

showQuantityTestGroup :: TestTree
showQuantityTestGroup = testGroup "showQuantity"
    [ testCase "myMass"         $ showQuantity myMass         @?= "65.0 kg"
    , testCase "gravityOnEarth" $ showQuantity gravityOnEarth @?= "9.808 m / s^2"

    --, testCase "forceOnGround"  $ showQuantity forceOnGround  @?= "637.52 kg m / s^2"
    ]

readShowTestGroup :: TestTree
readShowTestGroup = testGroup "read . show" [
    -- • Occurs check: cannot construct the infinite type:
    --     fsk2 ~ (fsk2 *: One) /: One
    --     arising from a use of ‘read’
    --   The type variable ‘fsk2’ is ambiguous
    --  testCase "3 m"     $ read (show [u| 3 m     |]) @?= [u| 3 m     |]

    -- • Couldn't match type ‘fsk2’ with ‘(fsk4 *: One) /: (fsk6 *: One)’
    --     arising from a use of ‘read’
    --   The type variables ‘fsk4’, ‘fsk6’, ‘fsk2’ are ambiguous
    -- , testCase "1.2 m/s" $ read (show [u| 1.2 m/s |]) @?= [u| 1.2 m/s |]

    -- • Occurs check: cannot construct the infinite type:
    --     fsk7 ~ fsk7 /: fsk7
    --     arising from a use of ‘read’
    --   The type variable ‘fsk7’ is ambiguous
    -- , testCase "1"       $ read (show [u| 1       |]) @?= [u| 1       |]
    ]

readNormalisationTestGroup :: TestTree
readNormalisationTestGroup = testGroup "read normalisation" [
    -- • Occurs check: cannot construct the infinite type:
    --     fsk8 ~ fsk8 /: fsk8
    --     arising from a use of ‘read’
    --   The type variable ‘fsk8’ is ambiguous
    --  testCase "1 m/m"       $ read "[u| 1 m/m |]"       @?= [u| 1 |]

    -- • Couldn't match type ‘fsk2’
    --                  with ‘(fsk5 *: fsk8) /: (fsk6 *: fsk8)’
    --     arising from a use of ‘read’
    --   The type variables ‘fsk5’, ‘fsk6’, ‘fsk8’, ‘fsk2’ are ambiguous
    -- , testCase "-0.3 m s^-1" $ read "[u| -0.3 m s^-1 |]" @?= [u| -0.3 m/s |]

    -- • Couldn't match type ‘fsk4’
    --                  with ‘(fsk6 *: (fsk7 *: (fsk7 *: fsk8))) /: fsk8’
    --     arising from a use of ‘read’
    --   The type variables ‘fsk6’, ‘fsk7’, ‘fsk8’, ‘fsk4’ are ambiguous
    --, testCase "42 s m s"    $ read "[u| 42 s m s |]"    @?= [u| 42 m s^2 |]
    ]