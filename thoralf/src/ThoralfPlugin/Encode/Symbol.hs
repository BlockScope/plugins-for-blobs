{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators, GADTs #-}

module ThoralfPlugin.Encode.Symbol (symbolTheory) where

import GHC.Corroborate

import ThoralfPlugin.Encode.Convert (kindConvert)
import ThoralfPlugin.Encode.TheoryEncoding
    (Vec(..), TheoryEncoding(..), KdConvCont, TyConvCont(..), emptyTheory)

symbolTheory :: TcPluginM TheoryEncoding
symbolTheory = return symbolEncoding

symbolEncoding :: TheoryEncoding
symbolEncoding = emptyTheory{typeConvs = [symLitConv], kindConvs = [symKindConv]}

symLitConv :: Type -> Maybe TyConvCont
symLitConv ty = do
  fastStr <- isStrLitTy ty
  let str = unpackFS fastStr
  let sexprStr = "\"" ++ str ++ "\""
  return $ TyConvCont VNil VNil ((const . const) sexprStr) []

symKindConv :: Type -> Maybe KdConvCont
symKindConv = kindConvert "String" typeSymbolKindCon
