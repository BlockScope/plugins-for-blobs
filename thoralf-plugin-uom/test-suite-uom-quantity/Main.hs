{-# LANGUAGE DataKinds, QuasiQuotes, TemplateHaskell, TypeOperators, PackageImports #-}

-- NOTE: The plugin Plugins.UoM.Unpack in needed for Known (Unpack (Base "m"))
-- otherwise we'll get an error like this:
--
--      • No instance for (Data.UnitsOfMeasure.Singleton.KnownUnit
--                           (Data.UnitsOfMeasure.Syntax.Unpack (Data.Theory.UoM.Base "m")))
--          arising from a use of ‘show’
--      • In the second argument of ‘printf’, namely
--          ‘(show $ metres (mkMpS 3) (mkS 3))’
--        In the second argument of ‘($)’, namely
--          ‘printf "3 m/s for 3 s = %s m" (show $ metres (mkMpS 3) (mkS 3))’
--        In a stmt of a 'do' block:
--          putStrLn
--            $ printf "3 m/s for 3 s = %s m" (show $ metres (mkMpS 3) (mkS 3))
--     |
--  18 |     putStrLn $ printf "3 m/s for 3 s = %s m" (show $ metres (mkMpS 3) (mkS 3))
--     |
{-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

module Main where

import Test.Tasty.TH (defaultMainGenerator)
import Test.Tasty.QuickCheck (testProperty)
import Text.Printf (printf)
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Quantity (Quantity(..))
import UoM (mkMpS, mkS, metres, extract, distance)
import Defs ()

-- TODO: Resolve ambiguity of fsk0 with distance:
--      • Couldn't match type ‘fsk0
--                             Data.Theory.UoM./: Data.Theory.UoM.Base "s"’
--                       with ‘Data.Theory.UoM.Base "s"’
--          arising from a use of ‘distance’
--        The type variable ‘fsk0’ is ambiguous
--      • In the second argument of ‘($)’, namely
--          ‘distance (mkMpS 3) (mkMpS 2)’
--        In the second argument of ‘printf’, namely
--          ‘(show $ distance (mkMpS 3) (mkMpS 2))’
--        In the second argument of ‘($)’, namely
--          ‘printf
--             "3 m/s for 2 s = %s m" (show $ distance (mkMpS 3) (mkMpS 2))’
--     |
--  35 |     putStrLn $ printf "3 m/s for 2 s = %s m" (show $ distance (mkMpS 3) (mkMpS 2))
--     |

main :: IO ()
main = do
    putStrLn "UoM examples"
    putStrLn $ printf "3 m/s for 3 s = %s m" (show $ metres (mkMpS 3) (mkS 3))
    -- putStrLn $ printf "3 m/s for 2 s = %s m" (show $ distance (mkMpS 3) (mkMpS 2))
    $(defaultMainGenerator)

prop_distance :: Double -> Double -> Bool
prop_distance x y = x * y == extract (distance (MkQuantity x) (MkQuantity y))
