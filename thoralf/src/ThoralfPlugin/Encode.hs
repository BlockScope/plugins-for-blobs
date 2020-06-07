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
    let pkg = fsLit "thoralf-plugin"
        fm = PkgModuleName (mkModuleName "Data.Theory.FiniteMap") pkg
        uom = PkgModuleName (mkModuleName "Data.Theory.UoM") pkg
        bool = PkgModuleName (mkModuleName "Data.Theory.Bool") pkg
        nats = PkgModuleName (mkModuleName "GHC.TypeNats") (fsLit "base")
    in
        sumEncodings
            [ natTheory
            , fmTheory fm
            , symbolTheory
            , boolTheory nats bool
            , uomTheory uom
            ]
