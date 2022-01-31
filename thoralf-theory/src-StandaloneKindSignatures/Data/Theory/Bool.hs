{-# LANGUAGE StandaloneKindSignatures, TypeFamilies, TypeInType, TypeOperators #-}

module Data.Theory.Bool where

import GHC.TypeLits (Nat)

type (<?) :: Nat -> Nat -> Bool
type family (<?) x y where {}

type (<=?) :: Nat -> Nat -> Bool
type family (<=?) x y where {}
