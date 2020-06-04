{-# LANGUAGE TypeInType, TypeFamilies, TypeOperators #-}
{-# LANGUAGE GADTs, MultiParamTypeClasses #-}

module ThoralfPlugin.Theory.DisEq (DisEquality, (:~?~:)(..)) where

class DisEquality (x :: k) (y :: k) where {}

data a :~?~: b where
    Refl :: a :~?~: a
    DisRefl :: DisEquality a b => a :~?~: b
