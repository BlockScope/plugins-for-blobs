{-# LANGUAGE TypeOperators, PackageImports #-}

{-# OPTIONS_GHC -fplugin Plugins.UoM #-}

-- | Checks that the abelian group laws hold.
module Abelian where

import Data.UnitsOfMeasure (type (*:), type (/:), One, Base, Quantity)

associativity :: Quantity a (u *: (v *: w)) -> Quantity a ((u *: v) *: w)
associativity = id

commutativity :: Quantity a (u *: v) -> Quantity a (v *: u)
commutativity = id

unit :: Quantity a (u *: One) -> Quantity a u
unit = id

inverse :: Quantity a (u *: (One /: u)) -> Quantity a One
inverse = id

inverse2 :: proxy b -> Quantity a (Base b /: Base b) -> Quantity a One
inverse2 _ = id