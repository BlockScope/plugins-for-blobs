{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators, GADTs #-}

module ThoralfPlugin.Encode.Symbol (symbolTheory) where

import Internal

import ThoralfPlugin.Encode.Convert (kindConvert)
import ThoralfPlugin.Encode.TheoryEncoding

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
