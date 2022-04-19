module Main where

import Test.DocTest
import Test.DocTest.Helpers
import Test.DocTest.Internal.Interpreter (ghcInfo)
import System.Environment (getArgs)

dirs922 :: [FilePath]
dirs922 =
    [ "./uom-quantity/src"
    , "./uom-quantity/src-ghc-9.0"
    , "./uom-quantity/src-StandaloneKindSignatures"
    ]

dirs8107 :: [FilePath]
dirs8107 =
    [ "./uom-quantity/src"
    , "./uom-quantity/src-ghc-8.10"
    , "./uom-quantity/src-StandaloneKindSignatures"
    ]

main :: IO ()
main = do
    pkg <- findCabalPackage "plugins-for-blobs"
    lib <- extractSpecificCabalLibrary (Just "uom-quantity") pkg

    info <- filter ((== "Project version") . fst) <$> ghcInfo
    case info of
        [("Project version", "9.2.2")] ->
            getArgs >>= mainFromLibrary lib { libSourceDirectories = dirs922 }
        [("Project version", "8.10.7")] ->
            getArgs >>= mainFromLibrary lib { libSourceDirectories = dirs8107 }
        [("Project version", v)] -> error $ "Not performing doctest with-compiler: ghc-" <> v
        _ -> error "Could not find GHC interpreter version"