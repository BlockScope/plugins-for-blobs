{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Z (z) where

import "uom-plugin" Data.UnitsOfMeasure.Convert (convert)


-- Inferring this type used to lead to unit equations with occur-check
-- failures, because it involves things like Pack (Unpack u) ~ u
-- The type signature is intentionally left off here to check that the
-- compiler can infer it.
-- z :: forall a (u :: Unit) (v :: Unit). (Fractional a, Convertible u v)
--   => Quantity a u
--   -> Quantity a v
{-# ANN z "HLint: ignore Eta reduce" #-}
z q = convert q
