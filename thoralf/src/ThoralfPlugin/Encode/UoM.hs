{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase #-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GhcPlugins (ModuleName, FastString, TyCon)
import TcPluginM (TcPluginM)

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
            [ f baseString base
            , typeConvert oneString one
            , f (opString "-") div'
            , f (opString "+") mult
            ]
        , kindConvs = [kindConvert "(Array String Int)" uom]
        }
    where
        f s = typeArgConvert $ \case
            (x : y : _) -> Just (x :> y :> VNil, s)
            _ -> Nothing

oneString :: String
oneString = "((as const (Array String Int)) 0)"

baseString :: Vec Two String -> Vec 'Zero String -> String
baseString (measure :> power :> VNil) VNil =
    "(store " ++ oneString ++ " " ++ measure ++ " " ++ power ++ ")"

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (n :> m :> VNil) VNil =
    "((_ map (" ++ op ++ " (Int Int) Int)) " ++ n ++ " " ++ m ++ ")"
