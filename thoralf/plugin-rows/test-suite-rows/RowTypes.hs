{-# LANGUAGE TypeInType, TypeApplications, GADTs #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.Rows #-}

module RowTypes where

import Text.Printf (printf)
import GHC.TypeLits
import Data.Kind

import ThoralfPlugin.Singletons.Symbol
import qualified Data.Theory.DisEq as D
import Data.Theory.FiniteMap

data RowType :: Fm Symbol Type -> Type where

  EmptyRec :: RowType Nil

  AddField
    :: AddField m m' field val
    => RowType m -> SSymbol field -> val -> RowType m'

  DelField
    :: DelField m m' field
    => RowType m -> SSymbol field -> val -> RowType m'

data PricedRec where
  PRec :: Has m "price" Int => RowType m -> PricedRec

instance Show PricedRec where
    show = show . pRecPrice

getPrice :: Has m "price" Int => RowType m -> Int
getPrice (DelField rec _ _) = getPrice rec
getPrice (AddField rec fld val) =
  case scomp fld (SSym @"price") of
    D.Refl -> val
    D.DisRefl -> getPrice rec

pRecPrice :: PricedRec -> Int
pRecPrice (PRec rec) = getPrice rec

totalPrice :: [PricedRec] -> Int
totalPrice = sum . map pRecPrice

car :: PricedRec
car = PRec
  (AddField
    (AddField EmptyRec (SSym @"price") (9000 :: Int))
    (SSym @"make")
    ("honda" :: String))

plane :: PricedRec
plane = PRec
  (AddField
    (AddField EmptyRec (SSym @"pilot") ("zhang" :: String))
    (SSym @"price")
    (12000 :: Int))

rowTests :: IO ()
rowTests = do
  let xs = [car, plane]
  let sumTest = totalPrice xs
  putStrLn $ printf "price of %s = %d" (show xs) sumTest
