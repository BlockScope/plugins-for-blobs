{-# LANGUAGE RecordWildCards #-}

module ThoralfPlugin.Encode.Find (PkgModuleName(..), findModule) where

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
