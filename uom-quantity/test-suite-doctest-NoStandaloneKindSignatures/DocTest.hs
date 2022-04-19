module Main where

import Test.DocTest.Internal.Interpreter (ghcInfo)

main :: IO ()
main = do
    info <- filter ((== "Project version") . fst) <$> ghcInfo
    case info of
        [("Project version", v)] -> error $ "Not performing doctest with-compiler: ghc-" <> v
        _ -> error "Could not find GHC interpreter version"