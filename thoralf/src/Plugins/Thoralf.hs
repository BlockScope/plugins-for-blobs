module Plugins.Thoralf (plugin) where

import GHC.Corroborate

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)

plugin :: Plugin
plugin =
    let pm = PkgModuleName (mkModuleName "Data.Theory.DisEq") (fsLit "thoralf-plugin")
        debug = False
        tyCheck = thoralfPlugin pm thoralfTheories debug
    in defaultPlugin{tcPlugin = const $ Just tyCheck}
