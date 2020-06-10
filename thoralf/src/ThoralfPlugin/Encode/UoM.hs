{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes #-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeTyCon)
import Language.Haskell.Printf (s)

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.Find (PkgModuleName(..), findModule)
import ThoralfPlugin.Encode.TheoryEncoding
    (Vec(..), Nat(Zero), TheoryEncoding(..), emptyTheory)

uomTheory :: PkgModuleName -> TcPluginM TheoryEncoding
uomTheory theory = do
  uomModule <- findModule theory
  let f = divulgeTyCon uomModule
  u <- f "Unit"
  b <- f "Base"
  o <- f "One"
  m <- f "*:"
  d <- f "/:"
  return $ mkUoMEncoding u b o d m

mkUoMEncoding :: TyCon -> TyCon -> TyCon -> TyCon -> TyCon -> TheoryEncoding
mkUoMEncoding u b o d m =
    emptyTheory
        { typeConvs =
            [ f baseString b
            , typeConvert oneString o
            , f (opString "-") d
            , f (opString "+") m
            ]
        , kindConvs = [kindConvert "(Array String Int)" u]
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
