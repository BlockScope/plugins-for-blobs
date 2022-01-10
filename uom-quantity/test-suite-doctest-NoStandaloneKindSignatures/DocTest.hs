module Main where

import Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "-isrc"
    , "-isrc-NoStandaloneKindSignatures"
    , "src-NoStandaloneKindSignatures/Data/Theory/UoM.hs"
    , "src/Data/UnitsOfMeasure/Unsafe/NormalForm.hs"
    , "src/Data/UnitsOfMeasure/Unsafe/Quantity.hs"
    , "src/Data/UnitsOfMeasure/Read.hs"
    , "src/Data/UnitsOfMeasure/Show.hs"
    , "src/Data/UnitsOfMeasure/Singleton.hs"
    , "src-NoStandaloneKindSignatures/Data/UnitsOfMeasure/Syntax.hs"
    ]

main :: IO ()
main = doctest arguments
