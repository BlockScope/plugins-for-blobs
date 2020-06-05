module ThoralfPlugin.Encode.Find (findTyCon, findModule) where

import Internal

findModule :: ModuleName -> FastString -> TcPluginM Module
findModule m p = do Found _ m' <- findImportedModule m (Just p); return m'

findTyCon :: Module -> String -> TcPluginM TyCon
findTyCon md strNm = do
    name <- lookupOrig md (mkTcOcc strNm)
    tcLookupTyCon name
