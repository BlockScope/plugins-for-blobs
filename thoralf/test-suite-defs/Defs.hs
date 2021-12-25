{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

#if IS_CANONICAL
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PackageImport #-}
#endif

{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

#if IS_CANONICAL
import "uom-th" Data.UnitsOfMeasure.TH (declareBaseUnit)

-- Declarations.
declareBaseUnit "byte"
#endif
