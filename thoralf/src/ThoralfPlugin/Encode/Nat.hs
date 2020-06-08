{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes #-}

module ThoralfPlugin.Encode.Nat (natTheory) where

import GHC.Corroborate
import Language.Haskell.Printf (s)

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeArgConvert)
import ThoralfPlugin.Encode.TheoryEncoding
    ( Vec(..), Nat(Zero), KdConvCont(..), TyConvCont(..), TheoryEncoding(..)
    , emptyTheory
    )

natTheory :: TcPluginM TheoryEncoding
natTheory = return natEncoding

natEncoding :: TheoryEncoding
natEncoding = emptyTheory
    { typeConvs = [litConvert, addConvert, subConvert]
    , kindConvs = [natConvert]
    , tyVarPreds = assertIntIsNat
    }

litConvert :: Type -> Maybe TyConvCont
litConvert ty = do
    integer <- isNumLitTy ty
    return $ TyConvCont VNil VNil (const . const $ show integer) []

addConvert :: Type -> Maybe TyConvCont
addConvert = flip typeArgConvert typeNatAddTyCon $ \case
    [x,y] ->  Just (x :> y :> VNil, opString "+")
    _ -> Nothing

subConvert :: Type -> Maybe TyConvCont
subConvert = flip typeArgConvert typeNatSubTyCon $ \case
    [x,y] -> Just (x :> y :> VNil, opString "-")
    _ -> Nothing

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (a :> b :> VNil)  VNil = [s|(%s %s %s)|] op a b

assertIntIsNat :: TyVar -> Maybe [String]
assertIntIsNat tv = do
    KdConvCont _ _ <- natConvert (tyVarKind tv)
    return [[s|(assert (<= 0 %?))|] $ getUnique tv]

natConvert :: Type -> Maybe KdConvCont
natConvert = kindConvert "Int" typeNatKindCon
