{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase #-}

module ThoralfPlugin.Encode.Nat (natTheory) where

import GhcPlugins (getUnique)
import TysWiredIn (typeNatKindCon)
import TcTypeNats (typeNatAddTyCon, typeNatSubTyCon)
import Type (Type, TyVar, tyVarKind, isNumLitTy)
import TcRnTypes(TcPluginM)

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeArgConvert)
import ThoralfPlugin.Encode.TheoryEncoding

natTheory :: TcPluginM TheoryEncoding
natTheory = return natEncoding

natEncoding :: TheoryEncoding
natEncoding = emptyTheory
  { typeConvs = [natLitConv, natAddConv, natSubConv]
  , kindConvs = [natKindConv]
  , tyVarPreds = assertIntIsNat
  }

natLitConv :: Type -> Maybe TyConvCont
natLitConv ty = do
  integer <- isNumLitTy ty
  return $ TyConvCont VNil VNil ((const . const) (show integer)) []

natAddConv :: Type -> Maybe TyConvCont
natAddConv = (flip typeArgConvert) typeNatAddTyCon $ \case
    [x,y] ->  Just (x :> y :> VNil, opString "+")
    _ -> Nothing

natSubConv :: Type -> Maybe TyConvCont
natSubConv = (flip typeArgConvert) typeNatSubTyCon $ \case
    [x,y] -> Just (x :> y :> VNil, opString "-")
    _ -> Nothing

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (a :> b :> VNil)  VNil = "(" ++ op ++ " " ++ a ++ " " ++ b ++ ")"

assertIntIsNat :: TyVar -> Maybe [String]
assertIntIsNat tv = do
    (KdConvCont _ _) <- natKindConv (tyVarKind tv)
    let name = show $ getUnique tv
    let isNat = "(assert (<= 0 " ++ name ++ "))"
    return [isNat]

natKindConv :: Type -> Maybe KdConvCont
natKindConv = kindConvert "Int" typeNatKindCon
