{-# LANGUAGE DataKinds #-}

module ThoralfPlugin.Encode.Convert
    ( One, Two, Three
    , kindConvert, typeConvert, kindArgConvert, typeArgConvert, mkConvert
    ) where

import TyCon (TyCon(..))
import Type (Type, splitTyConApp_maybe )
import ThoralfPlugin.Encode.TheoryEncoding
    (KdConvCont(..), TyConvCont(..), Vec(..), Nat(..), DecCont)
import TyCoRep (Kind)

type One = 'Succ 'Zero
type Two = 'Succ One
type Three = 'Succ Two

kindConvert :: String -> TyCon -> Type -> Maybe KdConvCont
kindConvert s c ty = do
    (c', _) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else Just $ KdConvCont VNil (const s)

typeConvert :: String -> TyCon -> Type -> Maybe TyConvCont
typeConvert s c ty = do
    (c', _) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else Just $ TyConvCont VNil VNil (const $ const s) []

kindArgConvert
    :: ([Type] -> Maybe (Vec m Kind, Vec m String -> String))
    -> TyCon
    -> Type
    -> Maybe KdConvCont
kindArgConvert f c ty = do
    (c', xs) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else uncurry KdConvCont <$> f xs

typeArgConvert
    :: ([Type] -> Maybe (Vec n Type, Vec n String -> Vec 'Zero String -> String))
    -> TyCon
    -> Type
    -> Maybe TyConvCont
typeArgConvert f c ty = do
    (c', xs) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else
        (\(vecTy, vecS) -> TyConvCont vecTy VNil vecS []) <$> f xs

mkConvert
    :: ([Type]
            -> Maybe
                ( Vec n Type, Vec m Kind
                , Vec n String -> Vec m String -> String
                , [DecCont]
                )
       )
    -> TyCon
    -> Type
    -> Maybe TyConvCont
mkConvert f c ty = do
    (c', xs) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else uncurry4 TyConvCont <$> f xs

uncurry4 :: (a -> b -> c -> d -> e) -> (a, b, c, d) -> e
uncurry4 f ~(a, b, c, d) = f a b c d
