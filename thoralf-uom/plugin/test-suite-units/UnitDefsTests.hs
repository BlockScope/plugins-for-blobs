{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module UnitDefsTests where

import Data.UnitsOfMeasure.TH
    (declareBaseUnit, declareDerivedUnit, declareConvertibleUnit)

-- Import the definitions of m and s from UnitDefs
import UnitDefs ()

-- Declarations.
declareBaseUnit "byte"
declareDerivedUnit "bps" "byte / s"
declareConvertibleUnit "kilobyte" 1024 "byte"
declareConvertibleUnit "squiggle" 2 "m/s"