{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes #-}

module ThoralfPlugin.Encode.FiniteMap (fmTheory) where

import Prelude hiding (maybe, either)
import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeTyCon)
import Data.Hashable (hash)
import Language.Haskell.Printf

import ThoralfPlugin.Encode.Convert (One, Two, Three, mkConvert, kindArgConvert)
import ThoralfPlugin.Encode.Find (PkgModuleName(..), findModule)
import ThoralfPlugin.Encode.TheoryEncoding
    ( Vec(..), Nat(Zero), KdConvCont, TyConvCont, DecCont(..), TheoryEncoding(..)
    , emptyTheory
    )

type FmTyCons = (TyCon, TyCon, TyCon, TyCon, TyCon, TyCon)

fmTheory :: PkgModuleName -> TcPluginM TheoryEncoding
fmTheory theory = do
    fmModule <- findModule theory
    let f = divulgeTyCon fmModule
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

maybe, forally, forallxy :: String -> String
maybe = [s|(Maybe %s)|]
forally x = [s|forall ((y %s))|] (maybe x)
forallxy x = let m = maybe x in [s|forall ((x %s) (y %s))|] m m

declarefun :: String -> String -> String
declarefun f x = let m = maybe x in [s|(declare-fun %s (%s %s) %s)|] f m m m

eitherDec :: Vec One String -> [String]
eitherDec (valKd :> VNil) = let either = [s|either%s|] (show $ hash valKd) in
    [ declarefun either valKd

    , [s|(assert (%s (= (%s (as nothing %s) y) y)))|]
        (forally valKd) either (maybe valKd)

    , [s|(assert (%s (=> ((_ is (just (%s) %s)) x) (= (%s x y) x))))|]
        (forallxy valKd) valKd (maybe valKd) either
    ]

bothDec :: Vec One String -> [String]
bothDec (valKd :> VNil) =
    [ declarefun both valKd

    , [s|(assert (%s (= (%s y %s) %s)))|]
        (forally valKd) both nothing nothing

    , [s|(assert (%s (= (%s nothing y) nothing)))|]
        (forally valKd) both

    , [s|(assert (%s (=> (and ((_ is %s) x) ((_ is %s) y)) (= (%s x y) x))))|]
        (forallxy valKd) just just both
    ]
    where
        both = [s|both%s|] (show $ hash valKd)
        nothing = [s|(as nothing %s)|] (maybe valKd)
        just = [s|(just (%s) %s)|] valKd (maybe valKd)

nilString :: Vec 'Zero String -> Vec Two String -> String
nilString VNil (keyKd :> valKd :> VNil) =
    [s|((as const (Array %s %s)) nothing)|] keyKd (maybe valKd)

alterString :: Vec Three String -> Vec 'Zero String -> String
alterString (fm :> key :> val :> VNil) VNil =
    [s|(store %s %s (just %s))|] fm key val

deleteString :: Vec Two String -> Vec One String -> String
deleteString (fm :> key :> VNil) (valKd :> VNil) =
    [s|(store %s %s (as nothing %s))|] fm key (maybe valKd)

opString :: String -> Vec Two String -> Vec One String -> String
opString op (m1 :> m2 :> VNil) (valKd :> VNil) =
    [s|( (_ map %s%s) %s %s)|] op (show $ hash valKd) m1 m2

fmConvert :: TyCon -> Type -> Maybe KdConvCont
fmConvert = kindArgConvert $ \case
    _ : _ : keyKind : valKind : _ -> Just (keyKind :> valKind :> VNil, fmString)
    _ -> Nothing

fmString :: Vec Two String -> String
fmString (keyKd :> valKd :> VNil) = [s|(Array %s %s)|] keyKd (maybe valKd)
