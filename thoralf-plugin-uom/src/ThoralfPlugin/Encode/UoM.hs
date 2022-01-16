{-# LANGUAGE TypeFamilies, TypeInType, LambdaCase, QuasiQuotes, NamedFieldPuns #-}

module ThoralfPlugin.Encode.UoM (uomTheory) where

import GHC.Corroborate
import GHC.Corroborate.Divulge (divulgeTyCon)
import Language.Haskell.Printf (s)

import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)
import Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))
import ThoralfPlugin.Encode.Convert
    (One, Two, kindConvert, typeConvert, typeArgConvert)
import ThoralfPlugin.Encode.TheoryEncoding
    (Vec(..), Nat(Zero), TheoryEncoding(..), emptyTheory)

uomTheory :: ModuleName -> ModuleName -> FastString -> TcPluginM TheoryEncoding
uomTheory theory syntax pkgName = do
    uds <- lookupUnitDefs theory syntax pkgName
    mT <- lookupModule theory pkgName
    enc <- divulgeTyCon mT "Enc"
    return $ mkUoMEncoding enc uds

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
        -- TODO: Use equivTyCon
        -- , equivTyCon
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
