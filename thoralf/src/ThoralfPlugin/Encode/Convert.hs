module ThoralfPlugin.Encode.Convert (kindConvert) where

import TyCon (TyCon(..))
import Type (Type, splitTyConApp_maybe )
import ThoralfPlugin.Encode.TheoryEncoding

kindConvert :: String -> TyCon -> Type -> Maybe KdConvCont
kindConvert s c ty = do
    (c', _) <- splitTyConApp_maybe ty
    if c' /= c then Nothing else Just $ KdConvCont VNil (const s)
