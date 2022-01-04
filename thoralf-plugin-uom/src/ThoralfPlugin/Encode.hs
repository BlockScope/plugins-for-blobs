module ThoralfPlugin.Encode (thoralfTheories) where

import GHC.Corroborate

import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding, sumEncodings)
import ThoralfPlugin.Encode.Nat (natTheory)
import ThoralfPlugin.Encode.UoM (uomTheory)
import ThoralfPlugin.Encode.Symbol (symbolTheory)
import ThoralfPlugin.Encode.Bool (boolTheory)

thoralfTheories :: TcPluginM TheoryEncoding
thoralfTheories =
    let bool = PkgModuleName (mkModuleName "Data.Theory.Bool") (fsLit "thoralf-theory")
        nats = PkgModuleName (mkModuleName "GHC.TypeNats") (fsLit "base")

    in
        sumEncodings
            [ natTheory
            , symbolTheory
            , boolTheory nats bool
            , uomTheory
                (mkModuleName "Data.Theory.UoM")
                (mkModuleName "Data.UnitsOfMeasure.Syntax")
                (fsLit "uom-quantity")
            ]
