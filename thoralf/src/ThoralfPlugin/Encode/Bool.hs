{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators,
    GADTs, RecordWildCards, StandaloneDeriving
#-}

module ThoralfPlugin.Encode.Bool (boolTheory) where

import GhcPlugins (ModuleName, FastString, Module, fsLit, mkModuleName)
import TysWiredIn (boolTyCon, promotedTrueDataCon, promotedFalseDataCon)
import TyCon (TyCon(..))
import TcPluginM
    (FindResult(..), TcPluginM, tcLookupTyCon, lookupOrig, findImportedModule)
import Type (Type, splitTyConApp_maybe)
import OccName (mkTcOcc)

import ThoralfPlugin.Encode.TheoryEncoding

boolTheory :: ModuleName -> FastString -> TcPluginM TheoryEncoding
boolTheory theoryModuleName pkgName = do
  let f m p = do Found _ m' <- findImportedModule m (Just p); return m'

  boolModule <- f theoryModuleName pkgName
  typeNatMod <- f (mkModuleName "GHC.TypeNats") (fsLit "base")

  compTyCon <- findTyCon boolModule "<?"
  compNat <- findTyCon typeNatMod "<=?"

  return $ boolEncoding compTyCon compNat

findTyCon :: Module -> String -> TcPluginM TyCon
findTyCon md strNm = do
    name <- lookupOrig md (mkTcOcc strNm)
    tcLookupTyCon name

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
trueLitConv ty = do
  (tcon, _) <- splitTyConApp_maybe ty
  case tcon == promotedTrueDataCon of
    True -> return $
      TyConvCont VNil VNil (const . const $ "true") []
    False -> Nothing

falseLitConv :: Type -> Maybe TyConvCont
falseLitConv ty = do
  (tcon, _) <- splitTyConApp_maybe ty
  case tcon == promotedFalseDataCon of
    True -> return $
      TyConvCont VNil VNil (const . const $ "false") []
    False -> Nothing

compLitConv :: TyCon -> Type -> Maybe TyConvCont
compLitConv comp ty = do
  (tycon, types) <- splitTyConApp_maybe ty
  case (tycon == comp, types) of
    (True, (x : y : _)) -> return $
        TyConvCont (x :> y :> VNil) VNil compMaker []
    _ -> Nothing

type Two = 'Succ ('Succ 'Zero)
compMaker :: Vec Two String -> Vec 'Zero String -> String
compMaker (x :> y :> VNil) VNil = "(< " ++ x ++ " " ++ y ++ ")"

compTyLitNat :: TyCon -> Type -> Maybe TyConvCont
compTyLitNat comp ty = do
  (tycon, types) <- splitTyConApp_maybe ty
  case (tycon == comp, types) of
    (True, (x : y : _)) -> return $
        TyConvCont (x :> y :> VNil) VNil compLitMaker []
        --TyConvCont (x :> y :> VNil) VNil (const . const $ "true") []
        --TyConvCont VNil VNil (const . const $  "true") []
    _ -> Nothing

compLitMaker :: Vec Two String -> Vec 'Zero String -> String
compLitMaker (x :> y :> VNil) VNil =
  "(or (< " ++ x ++ " " ++ y ++ ")  (= " ++ x ++ " " ++ y ++ "))"

boolKindConv :: Type -> Maybe KdConvCont
boolKindConv ty = do
  (tycon, _) <- splitTyConApp_maybe ty
  case tycon == boolTyCon of
    True -> return $ KdConvCont VNil (const "Bool")
    False -> Nothing
