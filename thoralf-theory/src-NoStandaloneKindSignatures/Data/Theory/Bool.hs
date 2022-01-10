{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}

module Data.Theory.Bool where

import GHC.TypeLits (Nat)

type family (<?) (x :: Nat) (y :: Nat) :: Bool where {}
