{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes, NamedFieldPuns #-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeTyCon)
import Language.Haskell.Printf (s)

import ThoralfPlugin.Encode.Convert
    (One, Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.TheoryEncoding
    (Vec(..), Nat(Zero), TheoryEncoding(..), emptyTheory)
import Data.UnitsOfMeasure.Unsafe.Convert (UnitDefs(..))

uomTheory :: ModuleName -> ModuleName -> FastString -> TcPluginM TheoryEncoding
uomTheory theory syntax pkgName = do
    mT <- lookupModule theory pkgName
    mS <- lookupModule syntax pkgName
    let f = divulgeTyCon mT
    let g = divulgeTyCon mS

    unit <- f "Unit"
    base <- f "Base"
    one <- f "One"
    enc <- f "Enc"

    m <- f "*:"
    d <- f "/:"
    e <- f "^:"

    x <- g "Unpack"
    i <- g "UnitSyntax"
    c <- g "~~"
    return . mkUoMEncoding enc $
        UnitDefs
            { unitKindCon = unit
            , unitBaseTyCon = base
            , unitOneTyCon = one
            , mulTyCon = m
            , divTyCon = d
            , expTyCon = e
            , unpackTyCon = x
            , unitSyntaxTyCon = i
            , unitSyntaxPromotedDataCon = getDataCon i ":/"
            , equivTyCon = c
            }
    where
        getDataCon u s' =
            case [ dc | dc <- tyConDataCons u, occNameFS (occName (dataConName dc)) == fsLit s' ] of
                [d] -> promoteDataCon d
                _ -> error $ "lookupUnitDefs/getDataCon: missing " ++ s'

mkUoMEncoding :: TyCon -> UnitDefs -> TheoryEncoding
mkUoMEncoding
    unitEncTyCon
    UnitDefs
        { unitKindCon
        , unitBaseTyCon
        , unitOneTyCon
        , mulTyCon
        , divTyCon
        , expTyCon
        } =
    emptyTheory
        { startDecs =
            [ "(declare-const n1 Int)"
            , "(assert (= n1 1))"
            , "(declare-const base (Array String Int))"
            , "(declare-const enc (Array String Int))"
            , "(declare-const exp (Array String Int))"
            , "(assert (= enc base))"
            ]
        , typeConvs =
            [ typeConvert oneString unitOneTyCon
            , f baseString unitBaseTyCon
            , g encString unitEncTyCon
            , g expString expTyCon
            , g (opString "-") divTyCon
            , g (opString "+") mulTyCon
            ]
        , kindConvs = [kindConvert "(Array String Int)" unitKindCon]
        }
    where
        f s' = typeArgConvert $ \case
            (x : _) -> Just (x :> VNil, s')
            _ -> Nothing

        g s' = typeArgConvert $ \case
            (x : y : _) -> Just (x :> y :> VNil, s')
            _ -> Nothing

oneString :: String
oneString = "((as const (Array String Int)) 0)"

encString :: Vec Two String -> Vec 'Zero String -> String
encString (measure :> power :> VNil) VNil =
    [s|(store enc %s %s)|] measure power

baseString :: Vec One String -> Vec 'Zero String -> String
baseString (measure :> VNil) VNil =
    [s|(store base %s n1)|] measure

expString :: Vec Two String -> Vec 'Zero String -> String
expString (measure :> power :> VNil) VNil =
    [s|(store exp %s %s)|] measure power

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (n :> m :> VNil) VNil =
    [s|((_ map (%s (Int Int) Int)) %s %s)|] op n m
