{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

#if IS_CANONICAL
{-# LANGUAGE QuasiQuotes #-}
#endif

{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}

-- | This module exports some example definitions of base and derived
-- units, for demonstration purposes.  In the future, this is likely
-- to change or be moved to a separate package.
module Plugins.Thoralf.UnitDefs () where

-- The SI base units
-- http://www.bipm.org/en/measurement-units/
-- TODO: The definition of meters using quasiquotes fails with:
--    • Could not deduce: Data.UnitsOfMeasure.Canonical.IsCanonical
--                          (Unpack (Base "m"))
--        arising from the superclasses of an instance declaration
--    • In the instance declaration for
--        ‘Data.UnitsOfMeasure.Canonical.HasCanonicalBaseUnit "m"’
--
-- import Data.UnitsOfMeasure
--
-- [u| m |]
