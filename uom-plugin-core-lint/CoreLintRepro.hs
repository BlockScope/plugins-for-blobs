{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

import Data.UnitsOfMeasure

import UnitDefs ()

radiusOfEarth :: Quantity Double [u| km |]
radiusOfEarth = convert [u| 6371000 m |]

main = undefined