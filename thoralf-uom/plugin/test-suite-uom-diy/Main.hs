{-# LANGUAGE TemplateHaskell #-}

module Main where

import Test.Tasty.TH (defaultMainGenerator)
import Test.Tasty.QuickCheck (testProperty)
import Text.Printf (printf)
import UoM (Quantity(..), extract, metres, distance)

main :: IO ()
main = do
    putStrLn "UoM examples"
    putStrLn $ printf "3 m/s for 3 s = %s m" (show $ metres (MkQuantity 3) (MkQuantity 3))
    putStrLn $ printf "3 m/s for 2 s = %s m" (show $ distance (MkQuantity 3) (MkQuantity 2))
    putStrLn ""
    $(defaultMainGenerator)

prop_distance :: Double -> Double -> Bool
prop_distance x y = x * y == extract (distance (MkQuantity x) (MkQuantity y))
