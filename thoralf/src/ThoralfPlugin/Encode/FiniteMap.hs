{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes #-}

module ThoralfPlugin.Encode.FiniteMap (fmTheory) where

import GHC.Corroborate
import Data.Hashable (hash)
import Language.Haskell.Printf

import ThoralfPlugin.Encode.Convert (One, Two, Three, mkConvert, kindArgConvert)
import ThoralfPlugin.Encode.Find (PkgModuleName(..), findModule, findTyCon)
import ThoralfPlugin.Encode.TheoryEncoding
    ( Vec(..), Nat(Zero), KdConvCont, TyConvCont, DecCont(..), TheoryEncoding(..)
    , emptyTheory
    )

type FmTyCons = (TyCon, TyCon, TyCon, TyCon, TyCon, TyCon)

fmTheory :: PkgModuleName -> TcPluginM TheoryEncoding
fmTheory theory = do
    fmModule <- findModule theory
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
        let kds = valKd :> VNil in Just
            ( m1 :> m2 :> VNil
            , kds
            , opString "either"
            , [DecCont kds "either" eitherDec]
            )
    _ -> Nothing

interConvert :: TyCon -> Type -> Maybe TyConvCont
interConvert = mkConvert $ \case
    _ : valKd : m1 : m2 : _ ->
        let kds = valKd :> VNil in Just
            ( m1 :> m2 :> VNil
            , kds
            , opString "both"
            , [DecCont kds "both" bothDec]
            )
    _ -> Nothing

eitherDec :: Vec One String -> [String]
eitherDec (valKd :> VNil) = let hashVal = show $ hash valKd in
    [ [s|(declare-fun either%s ((Maybe %s) (Maybe %s)) (Maybe %s))|]
        hashVal valKd valKd valKd

    , [s|(assert (forall ((y (Maybe %s))) (= (either%s (as nothing (Maybe %s)) y) y)))|]
        valKd hashVal valKd

    , [s|(assert (forall ((x (Maybe %s)) (y (Maybe %s))) (=> ((_ is (just (%s) (Maybe %s))) x) (= (either%s x y) x))))|]
        valKd valKd valKd valKd hashVal
    ]

bothDec :: Vec One String -> [String]
bothDec (valKd :> VNil) =
    [ [s|(declare-fun both%s ((Maybe %s) (Maybe %s)) (Maybe %s))|]
        hashVal valKd valKd valKd

    , [s|(assert (forall ((y (Maybe %s))) (= (both%s y %s) %s)))|]
        valKd hashVal noth noth

    , [s|(assert (forall ((y (Maybe %s))) (= (both%s nothing y) nothing)))|]
        valKd hashVal

    , [s|(assert (forall ((x (Maybe %s)) (y (Maybe %s))) (=> (and ((_ is %s) x) ((_ is %s) y)) (= (both%s x y) x))))|]
        valKd valKd jus jus hashVal
    ]
    where
        hashVal = show $ hash valKd
        noth = [s|(as nothing (Maybe %s))|] valKd
        jus = [s|(just (%s) (Maybe %s))|] valKd valKd

nilString :: Vec 'Zero String -> Vec Two String -> String
nilString VNil (keyKd :> valKd :> VNil) =
    [s|((as const (Array %s (Maybe %s))) nothing)|] keyKd valKd

alterString :: Vec Three String -> Vec 'Zero String -> String
alterString (fm :> key :> val :> VNil) VNil =
    [s|(store %s %s (just %s))|] fm key val

deleteString :: Vec Two String -> Vec One String -> String
deleteString (fm :> key :> VNil) (valKd :> VNil) =
    [s|(store %s %s (as nothing (Maybe %s)))|] fm key valKd

opString :: String -> Vec Two String -> Vec One String -> String
opString op (m1 :> m2 :> VNil) (valKd :> VNil) =
    [s|( (_ map %s%s) %s %s)|] op (show $ hash valKd) m1 m2

fmConvert :: TyCon -> Type -> Maybe KdConvCont
fmConvert = kindArgConvert $ \case
    _ : _ : keyKind : valKind : _ -> Just (keyKind :> valKind :> VNil, fmString)
    _ -> Nothing

fmString :: Vec Two String -> String
fmString (keyKd :> valKd :> VNil) = [s|(Array %s (Maybe %s))|] keyKd valKd
