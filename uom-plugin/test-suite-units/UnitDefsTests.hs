{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module UnitDefsTests where

import "uom-quantity" Data.UnitsOfMeasure
import "uom-th" Data.UnitsOfMeasure.TH (u, declareBaseUnit, declareDerivedUnit, declareConvertibleUnit)
import "uom-plugin" Data.UnitsOfMeasure.Convert

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
