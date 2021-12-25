{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

#if IS_CANONICAL
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PackageImports #-}
#endif

{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

import Plugins.Thoralf.UnitDefs ()

#if IS_CANONICAL
import "uom-th" Data.UnitsOfMeasure.TH

-- Declarations.
declareBaseUnit "byte"
declareDerivedUnit "bps" "byte / s"
declareConvertibleUnit "kilobyte" 1024 "byte"
declareConvertibleUnit "squiggle" 2 "m/s"

-- This declares a dimensionless unit that requires explicit conversion.
[u| dime = 1 1 |]
dime :: Fractional a => Quantity a [u|dime|] -> Quantity a [u|1|]
dime = convert
#endif
