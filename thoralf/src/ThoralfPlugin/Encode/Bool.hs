{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase #-}

module ThoralfPlugin.Encode.Bool (boolTheory) where

import GhcPlugins (ModuleName, FastString, fsLit, mkModuleName)
import TysWiredIn (boolTyCon, promotedTrueDataCon, promotedFalseDataCon)
import TyCon (TyCon(..))
import TcPluginM (TcPluginM)
import Type (Type)

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
            [ trueLitConv
            , falseLitConv
            , compLitConv compTyCon
            , compTyLitNat compNatCon
            ]
        , kindConvs = [boolKindConv]
        }

trueLitConv :: Type -> Maybe TyConvCont
trueLitConv = typeConvert "true" promotedTrueDataCon

falseLitConv :: Type -> Maybe TyConvCont
falseLitConv = typeConvert "false" promotedFalseDataCon

compLitConv :: TyCon -> Type -> Maybe TyConvCont
compLitConv = typeArgConvert $ \case
    (x : y : _) -> Just (x :> y :> VNil, compMaker)
    _ -> Nothing

compMaker :: Vec Two String -> Vec 'Zero String -> String
compMaker (x :> y :> VNil) VNil = "(< " ++ x ++ " " ++ y ++ ")"

compTyLitNat :: TyCon -> Type -> Maybe TyConvCont
compTyLitNat = typeArgConvert $ \case
    (x : y : _) -> Just (x :> y :> VNil, compLitMaker)
    _ -> Nothing

compLitMaker :: Vec Two String -> Vec 'Zero String -> String
compLitMaker (x :> y :> VNil) VNil =
    "(or (< " ++ x ++ " " ++ y ++ ") (= " ++ x ++ " " ++ y ++ "))"

boolKindConv :: Type -> Maybe KdConvCont
boolKindConv = kindConvert "Bool" boolTyCon
