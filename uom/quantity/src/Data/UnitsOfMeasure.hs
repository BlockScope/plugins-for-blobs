{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

-- | See "Data.UnitsOfMeasure.Tutorial" for how to use this module.
module Data.UnitsOfMeasure
    ( -- * Type-level units of measure
      Unit
    , type Base
    , type One
    , type (*:)
    , type (/:)
    , type (^:)

      -- * Values indexed by their units
    , Quantity
    , unQuantity
    , zero
    , mk

      -- * Unit-safe 'Num' operations
    , (+:)
    , (*:)
    , (-:)
    , negate'
    , abs'
    , signum'
    , fromInteger'

      -- * Unit-safe 'Fractional' operations
    , (/:)
    , recip'
    , fromRational'

      -- * Unit-safe 'Real' operations
    , toRational'

      -- * Unit-safe 'Floating' operations
    , sqrt'

      -- * Pay no attention to that man behind the curtain
    , MkUnit
    , Pack
    , Unpack
    , KnownUnit
    ) where

import Data.UnitsOfMeasure.Read ()
import Data.UnitsOfMeasure.Show ()
import Data.UnitsOfMeasure.Singleton
import Data.UnitsOfMeasure.Unsafe.Quantity
import Data.UnitsOfMeasure.Syntax
import Data.Theory.UoM
