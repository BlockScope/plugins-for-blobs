{-# LANGUAGE TypeFamilies, TypeInType, GADTs, CPP #-}

module Data.Vec (Vec(..), Nat(..)) where

#if MIN_VERSION_base(4,9,0) && !MIN_VERSION_base(4,11,0)
import Data.Monoid ((<>))
#endif
import Data.Kind (Type)

data Vec :: Nat -> Type -> Type where
    VNil :: Vec 'Zero a
    (:>) :: a -> Vec n a -> Vec ('Succ n) a

infixr 5 :>

data Nat where
    Zero :: Nat
    Succ :: Nat -> Nat

instance Functor (Vec n) where
    fmap _ VNil = VNil
    fmap f (x :> xs) = f x :> fmap f xs

instance Foldable (Vec n) where
    foldMap _ VNil = mempty
    foldMap f (x :> xs) = f x <> foldMap f xs

instance Traversable (Vec n) where
    traverse _ VNil = pure VNil
    traverse f (x :> xs) = (:>) <$> f x <*> traverse f xs
