{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE UndecidableInstances, GADTs #-}

module Data.UnitsOfMeasure.Constraint
    ( IsBase
    , IsEnc
    , IsProd
    , IsDiv
    ) where

import Data.Kind (Constraint)
import GHC.TypeLits (Symbol, Nat)
import Data.Theory.UoM (Unit, Base, Enc, type (*:), type (/:))

type family IsBase (measure :: Symbol) (b :: Unit) :: Constraint where
    IsBase m b = (b ~ Base m)

type family IsEnc (measure :: Symbol) (power :: Nat) (b :: Unit) :: Constraint where
    IsEnc m i b = (b ~ (Enc m i))

type family IsProd (a :: Unit) (b :: Unit) (aTimesb :: Unit) :: Constraint where
    IsProd a b c = (c ~ (a *: b))

type family IsDiv (a :: Unit) (b :: Unit) (aDivb :: Unit) :: Constraint where
    IsDiv a b c = (c ~ (a /: b))
