{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}
{-# LANGUAGE StandaloneKindSignatures, UndecidableInstances, GADTs #-}

module Data.UnitsOfMeasure.Constraint
    ( IsBase
    , IsEnc
    , IsProd
    , IsDiv
    ) where

import Data.Kind (Constraint)
import GHC.TypeLits (Symbol, Nat)
import Data.Theory.UoM (Unit, Base, Enc, type (*:), type (/:))

type IsBase :: Symbol -> Unit -> Constraint
type family IsBase measure b where
    IsBase m b = (b ~ Base m)

type IsEnc :: Symbol -> Nat -> Unit -> Constraint
type family IsEnc measure power b where
    IsEnc m i b = (b ~ Enc m i)

type IsProd :: Unit -> Unit -> Unit -> Constraint
type family IsProd (a :: Unit) (b :: Unit) (aTimesb :: Unit) :: Constraint where
    IsProd a b c = (c ~ (a *: b))

type IsDiv :: Unit -> Unit -> Unit -> Constraint
type family IsDiv a b aDivb where
    IsDiv a b c = (c ~ (a /: b))
