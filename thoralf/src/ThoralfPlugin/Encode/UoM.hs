{-# LANGUAGE TypeFamilies, TypeInType, TypeOperators,
    GADTs, RecordWildCards, StandaloneDeriving
#-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GhcPlugins (ModuleName, FastString)
import TyCon (TyCon(..))
import TcPluginM (TcPluginM)
import Type (Type, splitTyConApp_maybe )

import ThoralfPlugin.Encode.Convert (Two, kindConvert)
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

baseConvert :: TyCon -> Type -> Maybe TyConvCont
baseConvert base ty = do
    (tcon, (measure : power : _)) <- splitTyConApp_maybe ty
    if tcon /= base then Nothing else
        let tyList = measure :> power :> VNil in
        Just $ TyConvCont tyList VNil baseString []

baseString :: Vec Two String -> Vec 'Zero String -> String
baseString (measure :> power :> VNil) VNil =
    let one = "((as const (Array String Int)) 0)" in
    "(store " ++ one ++ " " ++ measure ++ " " ++ power ++ ")"

oneConvert :: TyCon -> Type -> Maybe TyConvCont
oneConvert one ty = do
    (tcon, _) <- splitTyConApp_maybe ty
    if tcon /= one then Nothing else
        let one' = "((as const (Array String Int)) 0)" in
        Just $ TyConvCont VNil VNil (const . const $ one') []

divConvert :: TyCon -> Type -> Maybe TyConvCont
divConvert divTycon ty = do
    (tcon, (n : m : _)) <- splitTyConApp_maybe ty
    if tcon /= divTycon then Nothing else
        let tyList = n :> m :> VNil in
        Just $ TyConvCont tyList VNil divString []

divString :: Vec Two String -> Vec 'Zero String -> String
divString (n :> m :> VNil) VNil =
    "((_ map (- (Int Int) Int)) " ++ n ++ " " ++ m ++ ")"

mulConvert :: TyCon -> Type -> Maybe TyConvCont
mulConvert mult ty = do
    (tcon, (n : m : _)) <- splitTyConApp_maybe ty
    if tcon /= mult then Nothing else
        let tyList = n :> m :> VNil in
        Just $ TyConvCont tyList VNil mulString []

mulString :: Vec Two String -> Vec 'Zero String -> String
mulString (n :> m :> VNil) VNil =
    "((_ map (+ (Int Int) Int)) " ++ n ++ " " ++ m ++ ")"

uomConvert :: TyCon -> Type -> Maybe KdConvCont
uomConvert = kindConvert "(Array String Int)"
