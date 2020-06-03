{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators,
    GADTs, RecordWildCards, StandaloneDeriving
#-}

module ThoralfPlugin.Encode.Bool (boolTheory) where

import GhcPlugins (ModuleName, FastString, fsLit, mkModuleName)
import TysWiredIn (boolTyCon, promotedTrueDataCon, promotedFalseDataCon)
import TyCon (TyCon(..))
import TcPluginM (TcPluginM)
import Type (Type, splitTyConApp_maybe)

import ThoralfPlugin.Encode.Convert (Two, kindConvert, typeConvert)
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
compLitConv comp ty = do
    (tycon, types) <- splitTyConApp_maybe ty
    case (tycon == comp, types) of
        (True, (x : y : _)) -> return $ TyConvCont (x :> y :> VNil) VNil compMaker []
        _ -> Nothing

compMaker :: Vec Two String -> Vec 'Zero String -> String
compMaker (x :> y :> VNil) VNil = "(< " ++ x ++ " " ++ y ++ ")"

compTyLitNat :: TyCon -> Type -> Maybe TyConvCont
compTyLitNat comp ty = do
    (tycon, types) <- splitTyConApp_maybe ty

    -- NOTE: Consider these alternative encodings.
    -- TyConvCont (x :> y :> VNil) VNil (const . const $ "true") []
    -- TyConvCont VNil VNil (const . const $  "true") []
    case (tycon == comp, types) of
        (True, (x : y : _)) -> return $ TyConvCont (x :> y :> VNil) VNil compLitMaker []
        _ -> Nothing

compLitMaker :: Vec Two String -> Vec 'Zero String -> String
compLitMaker (x :> y :> VNil) VNil =
    "(or (< " ++ x ++ " " ++ y ++ ") (= " ++ x ++ " " ++ y ++ "))"

boolKindConv :: Type -> Maybe KdConvCont
boolKindConv = kindConvert "Bool" boolTyCon
