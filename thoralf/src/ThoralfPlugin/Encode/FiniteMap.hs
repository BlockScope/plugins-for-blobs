{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase #-}

module ThoralfPlugin.Encode.FiniteMap (fmTheory) where

import GhcPlugins (ModuleName, FastString)
import TyCon (TyCon(..))
import TcPluginM (TcPluginM)
import Type (Type, splitTyConApp_maybe)
import Data.Hashable (hash)

import ThoralfPlugin.Encode.Convert (One, Two, Three, mkConvert)
import ThoralfPlugin.Encode.Find (findModule, findTyCon)
import ThoralfPlugin.Encode.TheoryEncoding

type FmTyCons = (TyCon, TyCon, TyCon, TyCon, TyCon, TyCon)

fmTheory :: ModuleName -> FastString -> TcPluginM TheoryEncoding
fmTheory theoryModuleName pkgName = do
    fmModule <- findModule theoryModuleName pkgName
    let f = findTyCon fmModule
    nil <- f "Nil"
    alt <- f "Alter"
    del <- f "Delete"
    union <- f "UnionL"
    inter <- f "IntersectL"
    fm <- f "Fm"
    return $ mkFmTheory (nil, alt, del, union, inter, fm)

mkFmTheory :: FmTyCons -> TheoryEncoding
mkFmTheory (nil, alter, delete, union, inter, fm) =
    emptyTheory
        { startDecs = [maybeDef]
        , typeConvs =
            [ nilConvert nil
            , alterConvert alter
            , deleteConvert delete
            , unionConvert union
            , interConvert inter
            ]
        , kindConvs = [fmConvert fm]
        }

-- Data and constant declarations
-- TODO: eventually make this less of a hack.
maybeDef :: String
maybeDef = "(declare-datatypes (T) ((Maybe nothing (just (fromJust T)))))"

nilConvert :: TyCon -> Type -> Maybe TyConvCont
nilConvert = mkConvert $ \case
    keyKd : valKd : _ ->
        Just
            ( VNil
            , keyKd :> valKd :> VNil
            , nilString
            , []
            )
    _ -> Nothing

alterConvert :: TyCon -> Type -> Maybe TyConvCont
alterConvert = mkConvert $ \case
    _ : _ : fmTp : keyTp : valTp : _ ->
        Just
            ( fmTp :> keyTp :> valTp :> VNil
            , VNil
            , alterString
            , []
            )
    _ -> Nothing

deleteConvert :: TyCon -> Type -> Maybe TyConvCont
deleteConvert = mkConvert $ \case
    _ : valKd : fmTp : keyTp : _ ->
        Just
            ( fmTp :> keyTp :> VNil
            , valKd :> VNil
            , deleteString
            , []
            )
    _ -> Nothing

unionConvert :: TyCon -> Type -> Maybe TyConvCont
unionConvert = mkConvert $ \case
    _ : valKd : m1 : m2 : _ ->
        let kds = valKd :> VNil in Just $
            ( m1 :> m2 :> VNil
            , kds
            , opString "either"
            , [DecCont kds "either" eitherDec]
            )
    _ -> Nothing

interConvert :: TyCon -> Type -> Maybe TyConvCont
interConvert = mkConvert $ \case
    _ : valKd : m1 : m2 : _ ->
        let kds = valKd :> VNil in Just $
            ( m1 :> m2 :> VNil
            , kds
            , opString "both"
            , [DecCont kds "both" bothDec]
            )
    _ -> Nothing

eitherDec :: Vec One String -> [String]
eitherDec (valKd :> VNil) = let hashVal = show $ hash valKd in
    [ "(declare-fun either" ++ hashVal ++ " ((Maybe "++ valKd ++ ") \
      \(Maybe "++ valKd ++ ")) (Maybe " ++ valKd ++"))"
    , "(assert (forall ((y (Maybe " ++ valKd ++ "))) \
      \(= (either" ++ hashVal ++ " (as nothing (Maybe " ++
        valKd ++ ") ) y) y)))"
    , "(assert (forall ((x (Maybe " ++ valKd ++ ")) (y (Maybe " ++ valKd ++
      "))) (=> ((_ is (just (" ++ valKd ++ ") (Maybe " ++ valKd ++
      ") ) ) x) (= (either" ++ hashVal ++ " x y) x))))"
    ]

bothDec :: Vec One String -> [String]
bothDec (valKd :> VNil) =
    [ "(declare-fun both" ++ hashVal ++
    " ((Maybe " ++ valKd ++ ") (Maybe " ++
    valKd ++ ")) (Maybe " ++ valKd ++ "))"
    , "(assert (forall ((y (Maybe " ++ valKd ++ "))) \
    \(= (both" ++ hashVal ++ " y " ++ noth ++ ") " ++ noth ++ ")))"
    , "(assert (forall ((y (Maybe " ++ valKd ++
    "))) (= (both" ++ hashVal ++ " nothing y) nothing)))"
    , "(assert (forall ((x (Maybe " ++ valKd ++ ")) (y (Maybe " ++
    valKd ++ "))) (=> (and ((_ is " ++ jus ++
    ") x) ((_ is "++ jus ++") y) ) (= (both" ++ hashVal ++ " x y) x))))"
    ]
    where
        hashVal = show $ hash valKd
        noth = "(as nothing (Maybe " ++ valKd ++ "))"
        jus = "(just ("++ valKd ++ ") (Maybe "++ valKd ++ "))"

nilString :: Vec 'Zero String -> Vec Two String -> String
nilString VNil (keyKd :> valKd :> VNil) =
    "((as const (Array " ++ keyKd ++ " (Maybe " ++ valKd ++ "))) nothing)"

alterString :: Vec Three String -> Vec 'Zero String -> String
alterString (fm :> key :> val :> VNil) VNil =
    "(store " ++ fm ++ " " ++ key ++ " (just " ++ val  ++ "))"

deleteString :: Vec Two String -> Vec One String -> String
deleteString (fm :> key :> VNil) (valKd :> VNil) =
    "(store " ++ fm ++ " " ++ key ++ " (as nothing (Maybe " ++ valKd ++ ") )  )"

opString :: String -> Vec Two String -> Vec One String -> String
opString op (m1 :> m2 :> VNil) (valKd :> VNil) =
    "( (_ map " ++ op ++ (show $ hash valKd) ++") "++ m1 ++ " " ++ m2 ++ ")"

fmConvert :: TyCon -> Type -> Maybe KdConvCont
fmConvert fm ty = do
    (tcon, (_ : _ : keyKind : valKind : _)) <- splitTyConApp_maybe ty
    True <- return $ tcon == fm
    let kindList = keyKind :> valKind :> VNil
    return $ KdConvCont kindList fmString
    where
        fmString :: Vec Two String -> String
        fmString (keyKindStr :> valKindStr :> VNil) = mkArrayTp keyKindStr valKindStr

        mkArrayTp :: String -> String -> String
        mkArrayTp keySort valSort = "(Array " ++ keySort ++ " (Maybe " ++ valSort ++ "))"
