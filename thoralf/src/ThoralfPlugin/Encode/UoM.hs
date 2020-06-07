{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes #-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GHC.Corroborate
import Language.Haskell.Printf

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.Find (findModule, findTyCon)
import ThoralfPlugin.Encode.TheoryEncoding
    (Vec(..), Nat(Zero), TheoryEncoding(..), emptyTheory)

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
        f s' = typeArgConvert $ \case
            (x : y : _) -> Just (x :> y :> VNil, s')
            _ -> Nothing

oneString :: String
oneString = "((as const (Array String Int)) 0)"

baseString :: Vec Two String -> Vec 'Zero String -> String
baseString (measure :> power :> VNil) VNil =
    [s|(store %s %s %s)|] oneString measure power

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (n :> m :> VNil) VNil =
    [s|((_ map (%s (Int Int) Int)) %s %s)|] op n m
