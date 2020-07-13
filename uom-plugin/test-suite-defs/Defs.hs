{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

import Data.UnitsOfMeasure

-- Declarations.
declareBaseUnit "byte"
