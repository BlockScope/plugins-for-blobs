{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators,
    GADTs, RecordWildCards, StandaloneDeriving
#-}

module ThoralfPlugin.Encode.Symbol (symbolTheory) where

import Type (Type, isStrLitTy)
import TcPluginM (TcPluginM)
import FastString (unpackFS)
import TysWiredIn (typeSymbolKindCon)

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