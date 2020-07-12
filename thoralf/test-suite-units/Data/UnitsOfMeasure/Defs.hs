{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}

-- | This module exports some example definitions of base and derived
-- units, for demonstration purposes.  In the future, this is likely
-- to change or be moved to a separate package.
module Data.UnitsOfMeasure.Defs () where

import Data.UnitsOfMeasure

-- The SI base units
-- http://www.bipm.org/en/measurement-units/
-- TODO: The definition of meters using quasiquotes fails with:
--    • Could not deduce: Data.UnitsOfMeasure.Canonical.IsCanonical
--                          (Unpack (Base "m"))
--        arising from the superclasses of an instance declaration
--    • In the instance declaration for
--        ‘Data.UnitsOfMeasure.Canonical.HasCanonicalBaseUnit "m"’
-- [u| m |]
