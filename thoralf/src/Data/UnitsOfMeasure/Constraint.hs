{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE UndecidableInstances, GADTs #-}

module Data.UnitsOfMeasure.Constraint
    ( IsBase
    , IsExp
    , IsProd
    , IsDiv
    , Exp
    ) where

import Data.Kind (Constraint)
import GHC.TypeLits (Symbol, Nat)
import Data.Theory.UoM (Unit, Base, type (*:), type (/:), type (^:), Exp)

type family IsBase (measure :: Symbol) (b :: Unit) :: Constraint where
    IsBase m b = (b ~ Base m)

type family IsExp (measure :: Symbol) (power :: Nat) (b :: Unit) :: Constraint where
    IsExp m i b = (b ~ (Base m ^: i))

type family IsProd (a :: Unit) (b :: Unit) (aTimesb :: Unit) :: Constraint where
    IsProd a b c = (c ~ (a *: b))

type family IsDiv (a :: Unit) (b :: Unit) (aDivb :: Unit) :: Constraint where
    IsDiv a b c = (c ~ (a /: b))
