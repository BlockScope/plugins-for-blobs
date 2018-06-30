{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeFamilies #-}

{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}

module Main (main, DistanceTime(..), Qs, Qm, Qkmh) where

import Language.Haskell.Liquid.Liquid (liquid)
import Data.UnitsOfMeasure ((/:), Quantity, u, convert)
import Data.UnitsOfMeasure.Defs ()
import Data.UnitsOfMeasure.Convert (Convertible)

-- NOTE: I cannot use quasiquotes or symbols with liquid haskell.
type Qs a = Quantity a [u| s |]
type Qm a = Quantity a [u| m |]
type Qkmh a = Quantity a [u| km / h |]

{-@
data DistanceTime a where
    DistanceTime :: {dist :: Qm a, time :: Qs a} -> DistanceTime a
@-}


data DistanceTime a where
    DistanceTime :: {dist :: Qm a, time :: Qs a} -> DistanceTime a

deriving instance (Show a) => Show (DistanceTime a)

mkDistanceTime
    :: (Ord a, Fractional a, Convertible u [u| m |], Convertible v [u| s |])
    => Quantity a u
    -> Quantity a v
    -> DistanceTime a
mkDistanceTime d t =
    DistanceTime (convert d) (convert t) 

minute :: Quantity Double [u| s |]
minute = [u| 60 s |]

{-@ kph :: DistanceTime Double -> Qkmh Double @-}
kph :: DistanceTime Double -> Quantity Double [u| km / h |]
kph DistanceTime{..} = convert $ dist /: time

kph55 :: DistanceTime Double
kph55 = mkDistanceTime [u| 110 km |] [u| 2 h |] 

main :: IO a
main = do
    putStrLn $ "One minute is " ++ show minute
    putStrLn $ "55 kph is " ++ show kph55
    putStrLn $ "55 kph is " ++ show (kph kph55)
    liquid ["liquid/Liquid.hs"]
