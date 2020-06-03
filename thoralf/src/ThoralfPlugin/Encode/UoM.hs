{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase #-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GhcPlugins (ModuleName, FastString)
import TyCon (TyCon(..))
import TcPluginM (TcPluginM)
import Type (Type)

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.Find (findModule, findTyCon)
import ThoralfPlugin.Encode.TheoryEncoding

uomTheory :: ModuleName -> FastString -> TcPluginM TheoryEncoding
uomTheory theoryModuleName pkgName = do
  uomModule <- findModule theoryModuleName pkgName
  let f = findTyCon uomModule
  baseTyCon <- f "Base"
  oneTyCon <- f "One"
  divTyCon <- f "/:"
  mulTyCon <- f "*:"
  uomTyCon <- f "UoM"
  return $ mkUoMEncoding baseTyCon oneTyCon divTyCon mulTyCon uomTyCon

mkUoMEncoding :: TyCon -> TyCon -> TyCon -> TyCon -> TyCon -> TheoryEncoding
mkUoMEncoding base one div' mult uom =
    emptyTheory
        { typeConvs =
            [ baseConvert base
            , oneConvert one
            , divConvert div'
            , mulConvert mult
            ]
        , kindConvs = [uomConvert uom]
        }

oneConvert :: TyCon -> Type -> Maybe TyConvCont
oneConvert = typeConvert oneString

baseConvert :: TyCon -> Type -> Maybe TyConvCont
baseConvert = typeArgConvert $ \case
    (m : p : _) -> Just (m :> p :> VNil, baseString)
    _ -> Nothing

divConvert :: TyCon -> Type -> Maybe TyConvCont
divConvert = typeArgConvert $ \case
    (n : m : _) -> Just (n :> m :> VNil, opString "-")
    _ -> Nothing

mulConvert :: TyCon -> Type -> Maybe TyConvCont
mulConvert = typeArgConvert $ \ case
    (n : m : _) -> Just (n :> m :> VNil, opString "+")
    _ -> Nothing

oneString :: String
oneString = "((as const (Array String Int)) 0)"

baseString :: Vec Two String -> Vec 'Zero String -> String
baseString (measure :> power :> VNil) VNil =
    "(store " ++ oneString ++ " " ++ measure ++ " " ++ power ++ ")"

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (n :> m :> VNil) VNil =
    "((_ map (" ++ op ++ " (Int Int) Int)) " ++ n ++ " " ++ m ++ ")"

uomConvert :: TyCon -> Type -> Maybe KdConvCont
uomConvert = kindConvert "(Array String Int)"
