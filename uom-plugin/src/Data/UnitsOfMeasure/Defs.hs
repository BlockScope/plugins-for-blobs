{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE TemplateHaskell #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}

-- | This module exports some example definitions of base and derived
-- units, for demonstration purposes.  In the future, this is likely
-- to change or be moved to a separate package.
module Data.UnitsOfMeasure.Defs
    ( MkUnit
    ) where

import Data.UnitsOfMeasure
import Data.UnitsOfMeasure.Convert
import Data.Ratio ((%))

-- The SI base units
-- http://www.bipm.org/en/measurement-units/
[u| m, kg, s, A, K, mol, cd |]

-- Some prefixed units
[u| km = 1000m, g = 0.001 kg |]

-- SI derived units
-- http://physics.nist.gov/cuu/Units/units.html
[u| Hz = s^-1
  , N  = kg m / s^2
  , Pa = N / m^2
  , J  = N m
  , W  = J / s
  , C  = s A
  , V  = W / A
  , F  = C / V
  , ohm = V / A
 |]

-- SI derived unit steradian (sr) requires explicit conversion
-- https://en.wikipedia.org/wiki/Steradian
[u| sr = 1 1 |]

-- NOTE: Here's the dumped splicing for the quasiquoter ...
-- [u| rad = 1 1 |]
-- stack build --ghc-options='-ddump-splices -ddump-to-file'
--    " rad = 1 1 "
--  ======>
--    [type instance MkUnit "rad" = Base "rad",
--     instance HasCanonicalBaseUnit "rad" where
--       type CanonicalBaseUnit "rad" = One
--       conversionBase _ = Data.UnitsOfMeasure.Internal.MkQuantity 1.0]

-- NOTE: The splicing is the same for ...
-- declareConvertibleUnit "rad" 1 "1"
-- stack build --ghc-options='-ddump-splices -ddump-to-file'
--    declareConvertibleUnit "rad" 1 "1"
--  ======>
--    type instance MkUnit "rad" = Base "rad"
--    instance HasCanonicalBaseUnit "rad" where
--      type CanonicalBaseUnit "rad" = One
--      conversionBase _ = Data.UnitsOfMeasure.Internal.MkQuantity 1.0

-- SI derived unit radian (rad) requires explicit conversion too but
-- let's also add the SI-accepted unit, the degree at the same time
-- https://en.wikipedia.org/wiki/Radian
-- https://en.wikipedia.org/wiki/Degree_(angle)

-- NOTE: The following has error ...
-- unable to parse unit declarations:  deg = (pi / 180) rad
-- [u| rad = 1 1 |]
-- [u| deg = (pi / 180) rad |]

-- NOTE: A similar error substituting for pi ...
-- unable to parse unit declarations:  deg = (3.141592653589793 / 180) rad
-- [u| rad = 1 1 |]
-- [u| deg = (3.141592653589793 / 180) rad |]

-- NOTE: A similar error without the parens ...
-- unable to parse unit declarations:  deg = 3.141592653589793 / 180 rad
-- [u| rad = 1 1 |]
-- [u| deg = 3.141592653589793 / 180 rad |]

-- NOTE: Still a problem with a single scaling ...
-- Couldn't match type ‘One’ with ‘Base "rad"’
-- In the instance declaration for ‘HasCanonicalBaseUnit "deg"’
-- [u| rad = 1 1 |]
-- [u| deg = 1.7453292519943295e-2 rad |]

-- NOTE: This compiles but isn't the same as the quasiquoter ...
-- declareDerivedUnit "rad" "1 1"
-- declareConvertibleUnit "deg" (5030569068109113 % 288230376151711744) "rad"

-- NOTE: This is the same error as seen with the quasiquoter ...
-- Couldn't match type ‘One’ with ‘Base "rad"’
-- In the instance declaration for ‘HasCanonicalBaseUnit "deg"’
-- declareConvertibleUnit "rad" 1 "1"
-- declareConvertibleUnit "deg" (5030569068109113 % 288230376151711744) "rad"
-- Here's the splicing ...
--    declareConvertibleUnit
--       "deg" (5030569068109113 % 288230376151711744) "rad"
--  ======>
--    type instance MkUnit "deg" = Base "deg"
--    instance HasCanonicalBaseUnit "deg" where
--      type CanonicalBaseUnit "deg" = MkUnit "rad"
--      conversionBase _
--        = Data.UnitsOfMeasure.Internal.MkQuantity 57.29577951308232

-- NOTE: This works ...
-- [u| deg = (5030569068109113 % 288230376151711744) 1 |]
--     " deg = (5030569068109113 % 288230376151711744) 1 "
--  ======>
--    [type instance MkUnit "deg" = Base "deg",
--     instance HasCanonicalBaseUnit "deg" where
--       type CanonicalBaseUnit "deg" = One
--       conversionBase _
--         = Data.UnitsOfMeasure.Internal.MkQuantity 57.29577951308232]

-- declareConvertibleUnit "deg" (5030569068109113 % 288230376151711744) "1"
-- Here's the splicing ...
--    declareConvertibleUnit
--      "deg" (5030569068109113 % 288230376151711744) "1"
--  ======>
--    type instance MkUnit "deg" = Base "deg"
--    instance HasCanonicalBaseUnit "deg" where
--      type CanonicalBaseUnit "deg" = One
--      conversionBase _
--        = Data.UnitsOfMeasure.Internal.MkQuantity 57.29577951308232

type instance MkUnit "rad" = Base "rad"
instance HasCanonicalBaseUnit "rad" where
  type CanonicalBaseUnit "rad" = One
  conversionBase _ = MkQuantity 1.0

type instance MkUnit "deg" = Base "deg"
instance HasCanonicalBaseUnit "deg" where
  type CanonicalBaseUnit "deg" = One
  conversionBase _ = MkQuantity 57.29577951308232

-- Non-SI units accepted for use with them
-- http://www.bipm.org/en/publications/si-brochure/chapter4.html
[u| min = 60 s
  , h = 3600 s
  , d = 86400 s
  , ha = 10000 m^2
  , l = 0.001 m^3
  , t = 1000 kg
  , au = 149597870700 m |]

-- Some random other units
[u| ft = 100 % 328 m, in = 0.0254 m, mi = 1609.344 m, mph = mi/h |]
