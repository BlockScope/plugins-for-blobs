module ThoralfPlugin.Encode (thoralfTheories) where

import GHC.Corroborate

import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding, sumEncodings)
import ThoralfPlugin.Encode.Nat (natTheory)
import ThoralfPlugin.Encode.FiniteMap (fmTheory)
import ThoralfPlugin.Encode.UoM (uomTheory)
import ThoralfPlugin.Encode.Symbol (symbolTheory)
import ThoralfPlugin.Encode.Bool (boolTheory)

thoralfTheories :: TcPluginM TheoryEncoding
thoralfTheories =
    let pkg = fsLit "thoralf-plugin"
        fm = mkModuleName "ThoralfPlugin.Theory.FiniteMap"
        uom = mkModuleName "Data.UoM.Theory"
        bool = mkModuleName "ThoralfPlugin.Theory.Bool"
    in
        sumEncodings
            [ natTheory
            , fmTheory fm pkg
            , symbolTheory
            , boolTheory bool pkg
            , uomTheory uom pkg
            ]
