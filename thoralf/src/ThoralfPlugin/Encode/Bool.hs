{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes #-}

module ThoralfPlugin.Encode.Bool (boolTheory) where

import GHC.Corroborate
import Language.Haskell.Printf

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.Find (findModule, findTyCon)
import ThoralfPlugin.Encode.TheoryEncoding
    (Vec(..), Nat(Zero), TheoryEncoding(..), emptyTheory)

boolTheory :: ModuleName -> FastString -> TcPluginM TheoryEncoding
boolTheory theory pkgName = do
  boolModule <- findModule theory pkgName
  typeNatMod <- findModule (mkModuleName "GHC.TypeNats") (fsLit "base")

  compTyCon <- findTyCon boolModule "<?"
  compNat <- findTyCon typeNatMod "<=?"

  return $ boolEncoding compTyCon compNat

boolEncoding :: TyCon -> TyCon -> TheoryEncoding
boolEncoding compTyCon compNatCon =
    emptyTheory
        { typeConvs =
            [ typeConvert "true" promotedTrueDataCon
            , typeConvert "false" promotedFalseDataCon
            , f compLT compTyCon
            , f compLE compNatCon
            ]
        , kindConvs = [kindConvert "Bool" boolTyCon]
        }
    where
        f s' = typeArgConvert $ \case
            (x : y : _) -> Just (x :> y :> VNil, s')
            _ -> Nothing

compLT :: Vec Two String -> Vec 'Zero String -> String
compLT (x :> y :> VNil) VNil = [s|(< %s %s)|] x y

compLE :: Vec Two String -> Vec 'Zero String -> String
compLE (x :> y :> VNil) VNil = [s|(or (< %s %s) (= %s %s))|] x y x y
