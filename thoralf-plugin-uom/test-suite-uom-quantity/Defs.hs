{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PackageImports #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

import "uom-th" Data.UnitsOfMeasure.TH

-- Declarations.
[u| m, s |]