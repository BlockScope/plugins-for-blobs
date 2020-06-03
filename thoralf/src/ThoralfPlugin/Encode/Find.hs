module ThoralfPlugin.Encode.Find (findTyCon, findModule) where

import GhcPlugins (ModuleName, FastString, Module)
import TyCon (TyCon(..))
import TcPluginM
    (FindResult(..), TcPluginM, tcLookupTyCon, lookupOrig, findImportedModule)
import OccName (mkTcOcc)

findModule :: ModuleName -> FastString -> TcPluginM Module
findModule m p = do Found _ m' <- findImportedModule m (Just p); return m'

findTyCon :: Module -> String -> TcPluginM TyCon
findTyCon md strNm = do
    name <- lookupOrig md (mkTcOcc strNm)
    tcLookupTyCon name
