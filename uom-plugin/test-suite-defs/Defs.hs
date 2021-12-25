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

module Defs where

import "uom-th" Data.UnitsOfMeasure.TH

-- Declarations.
declareBaseUnit "byte"
