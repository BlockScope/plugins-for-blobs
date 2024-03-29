{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Defs where

import UnitDefs ()

import Data.UnitsOfMeasure.TH

-- Declarations.
declareBaseUnit "byte"
declareDerivedUnit "bps" "byte / s"
declareConvertibleUnit "kilobyte" 1024 "byte"

-- WARNING: When declareConvertibleUnit doesn't work.
-- • Could not deduce: Data.UnitsOfMeasure.Canonical.IsCanonical
--                       (Unpack (MkUnit "m" /: MkUnit "s"))
--     arising from the superclasses of an instance declaration
-- • In the instance declaration for
--     ‘Data.UnitsOfMeasure.Canonical.HasCanonicalBaseUnit "squiggle"’
-- declareConvertibleUnit "squiggle" 2 "m/s"

-- This declares a dimensionless unit that requires explicit conversion.
[u| dime = 1 1 |]