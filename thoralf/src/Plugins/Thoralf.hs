module Plugins.Thoralf (plugin) where

import GHC.Corroborate

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)
import Plugins.Thoralf.Print (Debug(..))

plugin :: Plugin
plugin =
    let pm = PkgModuleName (mkModuleName "Data.Theory.DisEq") (fsLit "thoralf-plugin")
        dbg = Debug{ctsGHC = False, ctsSMT = False, smt = False}
        tyCheck = thoralfPlugin pm thoralfTheories dbg
    in defaultPlugin{tcPlugin = const $ Just tyCheck}
