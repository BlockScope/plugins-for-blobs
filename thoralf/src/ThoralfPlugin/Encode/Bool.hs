{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase #-}

module ThoralfPlugin.Encode.Bool (boolTheory) where

import GhcPlugins (ModuleName, FastString, fsLit, mkModuleName)
import TysWiredIn (boolTyCon, promotedTrueDataCon, promotedFalseDataCon)
import TyCon (TyCon(..))
import TcPluginM (TcPluginM)

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.Find (findModule, findTyCon)
import ThoralfPlugin.Encode.TheoryEncoding

boolTheory :: ModuleName -> FastString -> TcPluginM TheoryEncoding
boolTheory theoryModuleName pkgName = do
  boolModule <- findModule theoryModuleName pkgName
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
        f s = typeArgConvert $ \case
            (x : y : _) -> Just (x :> y :> VNil, s)
            _ -> Nothing

compLT :: Vec Two String -> Vec 'Zero String -> String
compLT (x :> y :> VNil) VNil = "(< " ++ x ++ " " ++ y ++ ")"

compLE :: Vec Two String -> Vec 'Zero String -> String
compLE (x :> y :> VNil) VNil =
    "(or (< " ++ x ++ " " ++ y ++ ") (= " ++ x ++ " " ++ y ++ "))"
