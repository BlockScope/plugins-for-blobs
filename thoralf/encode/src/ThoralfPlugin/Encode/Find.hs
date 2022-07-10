{-# LANGUAGE NamedFieldPuns #-}

module ThoralfPlugin.Encode.Find (PkgModuleName(..), findModule) where

import GHC.Corroborate

data PkgModuleName =
    PkgModuleName
        { moduleName :: ModuleName
        , pkgName :: FastString
        }

findModule :: PkgModuleName -> TcPluginM Module
findModule PkgModuleName{moduleName, pkgName} = do
    let m = moduleNameString moduleName
    let p = unpackFS pkgName
    let mFound = "Plugin Found: module " ++ m
    findPkg <- findImportedModule moduleName (Just pkgName)
    case findPkg of
        Found _ mPkg -> do
            tcPluginTrace (mFound ++ " in package " ++ p) (text "")
            return mPkg
        _ -> do
            let blobs = "plugins-for-blobs"
            let blobsFS = fsLit blobs
            findBlob <- findImportedModule moduleName (Just blobsFS)
            case findBlob of
                Found _ mBlob -> do
                    tcPluginTrace (mFound ++ " in package " ++ blobs) (text "")
                    return mBlob
                _ -> do
                    let msg = "Can't find module " ++ m ++ " in package " ++ p
                    tcPluginTrace msg (text "")
                    error msg

