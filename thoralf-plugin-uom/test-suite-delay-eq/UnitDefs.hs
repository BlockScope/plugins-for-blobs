{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE QuasiQuotes #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module UnitDefs () where

import "uom-th" Data.UnitsOfMeasure.TH

[u| m, kg |]