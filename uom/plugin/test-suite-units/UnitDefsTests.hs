{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -Wno-orphans #-}

module UnitDefsTests where

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.TH (u, declareBaseUnit, declareDerivedUnit, declareConvertibleUnit)
import Data.UnitsOfMeasure.Convert

-- Import the definitions of m and s from UnitDefs
import UnitDefs ()

-- Declarations.
declareBaseUnit "byte"
declareDerivedUnit "bps" "byte / s"
declareConvertibleUnit "kilobyte" 1024 "byte"
declareConvertibleUnit "squiggle" 2 "m/s"

-- This declares a dimensionless unit that requires explicit conversion.
[u| dime = 1 1 |]
dime :: Fractional a => Quantity a [u| dime |] -> Quantity a [u| 1 |]
dime = convert
