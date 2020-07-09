{-# LANGUAGE TypeOperators, AllowAmbiguousTypes #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}

module Main where

import Test.Tasty
import Data.UnitsOfMeasure

sum' :: [Quantity Double u] -> Quantity Double u
sum' = foldr (+:) zero

{- NOTE: I enabled AllowAmbiguousTypes to get commutativity to compile.
    • Couldn't match type ‘v0 *: u0’ with ‘v *: u’
      Expected type: Quantity a (u *: v) -> Quantity a (v *: u)
        Actual type: Quantity a (u0 *: v0) -> Quantity a (v0 *: u0)
      NB: ‘*:’ is a type function, and may not be injective
      The type variables ‘v0’, ‘u0’ are ambiguous
    • In the ambiguity check for ‘commutativity’
      To defer the ambiguity check to use sites, enable AllowAmbiguousTypes
      In the type signature:
        commutativity :: Quantity a (u *: v) -> Quantity a (v *: u)
-}
commutativity :: Quantity a (u *: v) -> Quantity a (v *: u)
commutativity = id

unit :: Quantity a (u *: One) -> Quantity a u
unit = id

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "uom-plugin" []
