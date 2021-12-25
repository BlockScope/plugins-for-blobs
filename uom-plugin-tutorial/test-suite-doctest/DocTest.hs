module Main (main) where

import Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "-idoc"
    , "-isrc"
    , "./src/Data/UnitsOfMeasure/Defs.hs"
    , "./doc/Data/UnitsOfMeasure/Tutorial.hs"
    , "-fplugin Plugins.UoM"
    ]

main :: IO ()
main = doctest arguments
