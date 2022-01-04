module ThoralfPlugin.Encode (thoralfTheories) where

import GHC.Corroborate

import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding, sumEncodings)
import ThoralfPlugin.Encode.Nat (natTheory)
import ThoralfPlugin.Encode.FiniteMap (fmTheory)
import ThoralfPlugin.Encode.UoM (uomTheory)
import ThoralfPlugin.Encode.Symbol (symbolTheory)
import ThoralfPlugin.Encode.Bool (boolTheory)

thoralfTheories :: TcPluginM TheoryEncoding
thoralfTheories =
    let tPkg = fsLit "thoralf-theory"
        fm = PkgModuleName (mkModuleName "Data.Theory.FiniteMap") tPkg
        bool = PkgModuleName (mkModuleName "Data.Theory.Bool") tPkg
        nats = PkgModuleName (mkModuleName "GHC.TypeNats") (fsLit "base")

    in
        sumEncodings
            [ natTheory
            , fmTheory fm
            , symbolTheory
            , boolTheory nats bool
            , uomTheory
                (mkModuleName "Data.Theory.UoM")
                (mkModuleName "Data.UnitsOfMeasure.Syntax")
                (fsLit "uom-quantity")
            ]
