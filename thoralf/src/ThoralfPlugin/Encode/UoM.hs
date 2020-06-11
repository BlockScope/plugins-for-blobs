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
    u <- f "Unit"
    b <- f "Base"
    o <- f "One"
    m <- f "*:"
    d <- f "/:"
    e <- f "^:"
    x <- g "Unpack"
    i <- g "UnitSyntax"
    c <- g "~~"
    return . mkUoMEncoding $
        UnitDefs
            { unitKindCon = u
            , unitBaseTyCon = b
            , unitOneTyCon = o
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

mkUoMEncoding :: UnitDefs -> TheoryEncoding
mkUoMEncoding
    UnitDefs
        { unitKindCon
        , unitBaseTyCon
        , unitOneTyCon
        , mulTyCon
        , divTyCon
        , expTyCon
        } =
    emptyTheory
        { typeConvs =
            [ f baseString unitBaseTyCon
            , typeConvert oneString unitOneTyCon
            , g (opString "-") divTyCon
            , g (opString "+") mulTyCon
            , g expString expTyCon
            ]
        , kindConvs = [kindConvert "(Array String Int)" unitKindCon]
        }
    where
        g s' = typeArgConvert $ \case
            (x : y : _) -> Just (x :> y :> VNil, s')
            _ -> Nothing

        f s' = typeArgConvert $ \case
            (x : _) -> Just (x :> VNil, s')
            _ -> Nothing

oneString :: String
oneString = "((as const (Array String Int)) 0)"

baseString :: Vec One String -> Vec 'Zero String -> String
baseString (measure :> VNil) VNil =
    [s|(store %s %s 1)|] oneString measure

expString :: Vec Two String -> Vec 'Zero String -> String
expString (measure :> power :> VNil) VNil =
    [s|(store %s %s %s)|] oneString measure power

opString :: String -> Vec Two String -> Vec 'Zero String -> String
opString op (n :> m :> VNil) VNil =
    [s|((_ map (%s (Int Int) Int)) %s %s)|] op n m
