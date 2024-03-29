{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# LANGUAGE QuasiQuotes #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM.Solve #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Defs where

import Data.UnitsOfMeasure.TH

-- Declarations.
[u| m, s |]