{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

#if IS_CANONICAL
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
#endif

{-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Defs where

#if IS_CANONICAL
import Data.UnitsOfMeasure

-- Declarations.
declareBaseUnit "byte"
#endif
