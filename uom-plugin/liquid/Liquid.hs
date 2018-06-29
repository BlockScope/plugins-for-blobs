{-# LANGUAGE DataKinds#-}
{-# LANGUAGE QuasiQuotes #-}

{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}

module Main (main) where

import Language.Haskell.Liquid.Liquid (liquid)
import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.Defs ()

{-@ type Qs = Quantity Double [u| s |] @-}
type Qs = Quantity Double [u| s |]

minute :: Qs
minute = [u| 60 s |]

main :: IO a
main = do
    putStrLn $ "One minute is " ++ show minute
    liquid ["liquid/Liquid.hs"]
