module Main (main) where

import Test.DocTest (doctest)

arguments :: [String]
arguments =
    [ "-idoc"
    , "-isrc"
    , "./src/Plugins/UoM/UnitDefs.hs"
    , "./doc-ghc-9.2/Data/UnitsOfMeasure/Tutorial.hs"
    , "-XPackageImports"
    , "-fplugin Plugins.UoM"
    ]

main :: IO ()
main = doctest arguments
