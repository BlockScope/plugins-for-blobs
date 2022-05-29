module Main where

import Test.DocTest
import Test.DocTest.Helpers
import System.Environment (getArgs)

main :: IO ()
main = do
    pkg <- findCabalPackage "plugins-for-blobs"
    lib <- extractSpecificCabalLibrary (Just "uom-quantity") pkg
    getArgs >>= mainFromLibrary lib