{-# LANGUAGE DataKinds #-}

module ThoralfPlugin.Encode.Convert
    ( One, Two, Three
    , kindConvert, typeConvert, typeArgConvert
    ) where

import TyCon (TyCon(..))
import Type (Type, splitTyConApp_maybe )
import ThoralfPlugin.Encode.TheoryEncoding
    (KdConvCont(..), TyConvCont(..), Vec(..), Nat(..))

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

typeArgConvert
    :: ([Type] -> Maybe (Vec n Type, Vec n String -> Vec 'Zero String -> String))
    -> TyCon
    -> Type
    -> Maybe TyConvCont
typeArgConvert f c ty = do
    (c', xs) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else
        (\(vecTy, vecS) -> TyConvCont vecTy VNil vecS []) <$> f xs
