{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}

{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}

module Main (main, AB(..), Qs, Qm) where

import Language.Haskell.Liquid.Liquid (liquid)
import Data.UnitsOfMeasure (Quantity, u)
import Data.UnitsOfMeasure.Defs ()


-- NOTE: I cannot use quasiquotes or symbols with liquid haskell.
type Qs = Quantity Double [u| s |]
type Qm = Quantity Double [u| m |]

data AB
    = A { x :: Quantity Double [u| s |] }
    | B { y :: Quantity Double [u| m |] }

{-@ data A = A {x :: Qs} | B {y :: Qm} @-}

minute :: Quantity Double [u| s |]
minute = [u| 60 s |]

main :: IO a
main = do
    putStrLn $ "One minute is " ++ show minute
    liquid ["liquid/Liquid.hs"]
