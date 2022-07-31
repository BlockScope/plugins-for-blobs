{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE QuasiQuotes #-}

{-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module UnitDefs () where

import Data.UnitsOfMeasure.TH

[u| m, kg |]