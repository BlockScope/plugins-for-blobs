module Main (main) where

import Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "-isrc"
    , "src/Data/Theory/UoM.hs"
    , "src/Data/UnitsOfMeasure/Unsafe/NormalForm.hs"
    , "src/Data/UnitsOfMeasure/Unsafe/Quantity.hs"
    , "src/Data/UnitsOfMeasure/Syntax.hs"
    ]

main :: IO ()
main = doctest arguments
