module Plugins.Thoralf (plugin) where

import GhcPlugins (Plugin(..), defaultPlugin)

import ThoralfPlugin.Encode (thoralfTheories )
import Plugins.Thoralf.TcPlugin (thoralfPlugin)

plugin :: Plugin
plugin =
    let debug = False
        tyCheck = thoralfPlugin debug thoralfTheories
    in defaultPlugin{tcPlugin = const $ Just tyCheck}
