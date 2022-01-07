{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE PackageImports #-}

-- UoM works.
-- {-# OPTIONS_GHC -fplugin Plugins.UoM #-}

-- Unpack then Solve works.
-- {-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
-- {-# OPTIONS_GHC -fplugin Plugins.UoM.Solve #-}

-- Unpack, Eq, Solve works.
{-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
{-# OPTIONS_GHC -fplugin Plugins.UoM.Eq #-}
{-# OPTIONS_GHC -fplugin Plugins.UoM.Simplify #-}

-- UnpackEq then Simplify fails.
-- {-# OPTIONS_GHC -fplugin Plugins.UoM.UnpackEq #-}
-- {-# OPTIONS_GHC -fplugin Plugins.UoM.Simplify #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

import "uom-th" Data.UnitsOfMeasure.TH

-- Declarations.
declareBaseUnit "byte"
