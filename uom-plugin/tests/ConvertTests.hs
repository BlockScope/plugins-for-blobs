{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}

{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# OPTIONS_GHC -fno-warn-partial-type-signatures #-}

{-# OPTIONS_GHC -fdefer-type-errors #-}
{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}

#if __GLASGOW_HASKELL__ > 710
{-# OPTIONS_GHC -fno-warn-deferred-type-errors #-}
#endif

module ConvertTests where

import Data.UnitsOfMeasure.Defs ()
import Data.UnitsOfMeasure
    ( u
    , convert
    , toRational'
    -- NOTE: Comment the above line hiding toRational' to get the error pasted
    -- into the comment at the end of this file. I would have expected that the
    -- compiler would fail first trying to find toRational'.
    )
import Data.UnitsOfMeasure.Internal (Quantity(..))
import Data.UnitsOfMeasure.Convert (Convertible)

newtype Wrap a = Wrap a

unwrapAsKm
    :: (Real a, Fractional a, Convertible u [u| m |])
    => Wrap (Quantity a u)
    -> a
unwrapAsKm (Wrap d) =
    fromRational dKm
    where
        MkQuantity dKm = toRational' $ convert d :: Quantity _ [u| km |]

{-
    solveSimpleWanteds: too many iterations (limit = 4)
      Set limit with -fconstraint-solver-iterations=n; n=0 for no limit
      Simples = {[WD] irred_als5 {2}:: Data.UnitsOfMeasure.Convert.HasCanonical
                                         (Data.UnitsOfMeasure.Internal.Unpack u) (CNonCanonical),
                 [WD] irred_als8 {2}:: Data.UnitsOfMeasure.Convert.HasCanonical
                                         (Data.UnitsOfMeasure.Internal.Unpack v0) (CNonCanonical),
                 [WD] $dFractional_alr6 {0}:: Fractional a (CDictCan(psc)),
                 [WD] $dKnownUnit_als9 {2}:: Data.UnitsOfMeasure.Singleton.KnownUnit
                                               (Data.UnitsOfMeasure.Internal.Unpack
                                                  u) (CDictCan(psc)),
                 [WD] $dKnownUnit_alsa {2}:: Data.UnitsOfMeasure.Singleton.KnownUnit
                                               (Data.UnitsOfMeasure.Internal.Unpack
                                                  v0) (CDictCan(psc)),
                 [WD] hole{alrZ} {4}:: Data.UnitsOfMeasure.Convert.ToCBU
                                         (Data.UnitsOfMeasure.Internal.Unpack u)
                                       ~
                                       Data.UnitsOfMeasure.Convert.ToCBU
                                         (Data.UnitsOfMeasure.Internal.Unpack v0) (CNonCanonical),
                 [WD] hole{alrS} {6}:: Data.UnitsOfMeasure.Internal.Pack
                                         (Data.UnitsOfMeasure.Internal.Unpack u)
                                       ~
                                       u (CNonCanonical),
                 [WD] hole{als2} {6}:: Data.UnitsOfMeasure.Internal.Pack
                                         (Data.UnitsOfMeasure.Internal.Unpack v0)
                                       ~
                                       v0 (CNonCanonical)}
      WC = WC {wc_simple =
                 [G] cobox_alvH {9}:: Data.UnitsOfMeasure.Internal.Unpack
                                        (Data.UnitsOfMeasure.Internal.Base "m")
                                      ~
                                      ('["m"] 'Data.UnitsOfMeasure.Internal.:/ '[]) (CNonCanonical)
                 [WD] irred_alvF {2}:: Data.UnitsOfMeasure.Convert.HasCanonical
                                         (Data.UnitsOfMeasure.Internal.Unpack v0) (CNonCanonical)
                 [WD] $dKnownUnit_alvG {2}:: Data.UnitsOfMeasure.Singleton.KnownUnit
                                               (Data.UnitsOfMeasure.Internal.Unpack
                                                  v0) (CDictCan(psc))
                 [WD] hole{alvh} {9}:: Data.UnitsOfMeasure.Convert.ToCBU
                                         (Data.UnitsOfMeasure.Internal.Unpack v0)
                                       ~
                                       Data.UnitsOfMeasure.Internal.Pack
                                         (Data.UnitsOfMeasure.Internal.Unpack
                                            (Data.UnitsOfMeasure.Internal.Base "m")) (CNonCanonical)
                 [WD] hole{alvk} {10}:: Data.UnitsOfMeasure.Internal.Pack
                                          (Data.UnitsOfMeasure.Internal.Unpack v0)
                                        ~
                                        v0 (CNonCanonical)}
  |
1 | {-# LANGUAGE CPP #-}
  | ^
-}

