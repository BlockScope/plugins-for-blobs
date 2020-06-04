{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators, UndecidableInstances #-}

-- | This module declares the unit of measure interface that is really just an
-- abelian group isomorphic to Z+.
module ThoralfPlugin.Theory.UoM
    ( UoM
    , FromList
    , One
    , IsBase
    , IsProd
    , IsDiv
    ) where

import GHC.Types (Symbol)
import Data.Kind (Constraint)
import GHC.TypeLits

data UoM where {}

type family One :: UoM where {}
type family Base (measure :: Symbol) (power :: Nat) :: UoM where {}
type family (*:) (a :: UoM) (b :: UoM) :: UoM where {}
type family (/:) (n :: UoM) (d :: UoM) :: UoM where {}

type family IsBase (measure :: Symbol) (power :: Nat) (b :: UoM) :: Constraint where
    IsBase m i b = (b ~ (Base m i))

type family IsProd (a :: UoM) (b :: UoM) (aTimesb :: UoM) :: Constraint where
    IsProd a b c = (c ~ (a *: b))

type family IsDiv (a :: UoM) (b :: UoM) (aDivb :: UoM) :: Constraint where
    IsDiv a b c = (c ~ (a /: b))

type family FromList (xs :: [(Symbol,Nat)]) :: UoM where
    FromList '[] = One
    FromList ('(u,i) ': ys) = (Base u i) *: (FromList ys)
