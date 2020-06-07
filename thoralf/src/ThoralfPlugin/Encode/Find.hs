{-# LANGUAGE RecordWildCards #-}

module ThoralfPlugin.Encode.Find (PkgModuleName(..), findTyCon, findModule) where

import GHC.Corroborate

data PkgModuleName =
    PkgModuleName
        { moduleName :: ModuleName
        , pkgName :: FastString
        }

findModule :: PkgModuleName -> TcPluginM Module
findModule PkgModuleName{..} = do
    Found _ m' <- findImportedModule moduleName (Just pkgName)
    return m'

findTyCon :: Module -> String -> TcPluginM TyCon
findTyCon md strNm = do
    name <- lookupOrig md (mkTcOcc strNm)
    tcLookupTyCon name
