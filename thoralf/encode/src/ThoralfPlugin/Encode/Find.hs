{-# LANGUAGE NamedFieldPuns #-}

module ThoralfPlugin.Encode.Find (PkgModuleName(..), findModule) where

import GHC.Corroborate

data PkgModuleName =
    PkgModuleName
        { moduleName :: ModuleName
        , pkgName :: FastString
        }

knownPkgs :: [String]
knownPkgs = ["plugins-for-blobs", "thoralf", "uom", "thoralf-uom"]

findModule :: PkgModuleName -> TcPluginM Module
findModule = findPkgModule knownPkgs

findPkgModule :: [String] -> PkgModuleName -> TcPluginM Module
findPkgModule psKnown pName@PkgModuleName{moduleName, pkgName}
    | [] <- psKnown = do
        let m = moduleNameString moduleName
        let p = unpackFS pkgName
        findPkg <- findImportedModule moduleName (Just pkgName)
        case findPkg of
            Found _ mPkg -> do
                let mFound = "Plugin Found: module " ++ m
                tcPluginTrace (mFound ++ " in package " ++ p) (text "")
                return mPkg
            _ -> do
                let msg = "Can't find module " ++ m ++ " in package " ++ p
                tcPluginTrace msg (text "")
                error msg
    | (p : ps) <- psKnown = do
        findPkg <- findImportedModule moduleName (Just $ fsLit p)
        case findPkg of
            Found _ mPkg -> do
                let m = moduleNameString moduleName
                let mFound = "Plugin Found: module " ++ m
                tcPluginTrace (mFound ++ " in package " ++ p) (text "")
                return mPkg
            _ -> findPkgModule ps pName
