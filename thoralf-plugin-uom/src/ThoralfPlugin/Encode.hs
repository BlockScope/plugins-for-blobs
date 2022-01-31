module ThoralfPlugin.Encode (thoralfUoMTheories) where

import GHC.Corroborate

import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding, sumEncodings)
import ThoralfPlugin.Encode.Nat (natTheory)
import ThoralfPlugin.Encode.UoM (uomTheory)
import ThoralfPlugin.Encode.Symbol (symbolTheory)
import ThoralfPlugin.Encode.Bool (boolTheory)

thoralfUoMTheories :: TcPluginM TheoryEncoding
thoralfUoMTheories =
    let bool = PkgModuleName (mkModuleName "Data.Theory.Bool") (fsLit "thoralf-theory")

    in
        sumEncodings
            [ natTheory
            , symbolTheory
            , boolTheory bool
            , uomTheory
                (mkModuleName "Data.Theory.UoM")
                (mkModuleName "Data.UnitsOfMeasure.Syntax")
                (fsLit "uom-quantity")
            ]
