{-# LANGUAGE DataKinds #-}

module ThoralfPlugin.Encode.Convert
    ( One, Two, Three
    , kindConvert, typeConvert
    ) where

import TyCon (TyCon(..))
import Type (Type, splitTyConApp_maybe )
import ThoralfPlugin.Encode.TheoryEncoding

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
