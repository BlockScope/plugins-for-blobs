module ThoralfPlugin.Encode (thoralfTheories) where

import GHC.Corroborate

import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding, sumEncodings)
import ThoralfPlugin.Encode.Nat (natTheory)
import ThoralfPlugin.Encode.FiniteMap (fmTheory)
import ThoralfPlugin.Encode.Symbol (symbolTheory)
import ThoralfPlugin.Encode.Bool (boolTheory)

thoralfTheories :: TcPluginM TheoryEncoding
thoralfTheories =
    let fm = PkgModuleName (mkModuleName "Data.Theory.FiniteMap") (fsLit "thoralf-plugin-rows")
        bool = PkgModuleName (mkModuleName "Data.Theory.Bool") (fsLit "thoralf-theory")
        nats = PkgModuleName (mkModuleName "GHC.TypeNats") (fsLit "base")

    in
        sumEncodings
            [ natTheory
            , fmTheory fm
            , symbolTheory
            , boolTheory nats bool
            ]
