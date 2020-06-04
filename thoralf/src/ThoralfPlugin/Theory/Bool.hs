{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators #-}

module ThoralfPlugin.Theory.Bool where

import GHC.TypeLits (Nat)

type family (<?) (x :: Nat) (y :: Nat) :: Bool where {}
