{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}

-- | This module exports some example definitions of base and derived
-- units, for demonstration purposes.
module UnitDefs
    ( MkUnit
    ) where

import Data.UnitsOfMeasure

[u| m |]

[u| km = 1000m |]