{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

#if IS_CANONICAL
import Data.UnitsOfMeasure

-- Declarations.
declareBaseUnit "byte"
#endif
