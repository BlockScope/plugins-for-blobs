module Plugins.Thoralf (plugin) where

import GhcPlugins (Plugin(..), mkModuleName, fsLit, defaultPlugin)

import ThoralfPlugin.Encode (thoralfTheories )
import Plugins.Thoralf.TcPlugin (thoralfPlugin)

plugin :: Plugin
plugin =
    let disEqName = mkModuleName "ThoralfPlugin.Theory.DisEq"
        pkgName = fsLit "thoralf-plugin"
        debug = False
        tyCheck = thoralfPlugin disEqName pkgName thoralfTheories debug
    in defaultPlugin{tcPlugin = const $ Just tyCheck}
