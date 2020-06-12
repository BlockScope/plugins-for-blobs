{-# LANGUAGE TypeOperators #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}

module Main where

import Test.Tasty
import Data.UnitsOfMeasure

sum' :: [Quantity Double u] -> Quantity Double u
sum' = foldr (+:) zero

unit :: Quantity a (u *: One) -> Quantity a u
unit = id

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "uom-plugin" []
