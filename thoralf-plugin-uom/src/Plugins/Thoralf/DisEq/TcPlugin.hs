{-# LANGUAGE NamedFieldPuns #-}

module Plugins.Thoralf.DisEq.TcPlugin (disEqPlugin, unitsDisEq) where

import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (DebugCts(..), Indent(..), tracePlugin, pprSolverCallCount)

import GHC.Corroborate.Divulge (divulgeClass)
import GHC.Corroborate.Shim (mkEqPred)
import GHC.Corroborate.Wrap (newGivenCt)

import Internal.Unit.Type (collectType)
import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)
import Plugins.UoM.State (UomState(..), mkUoMInit)
import Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))

data DisEqState =
    DisEqState
        { uomState :: UomState
        , disEqClass :: Class
        }

mkDisEqInit :: PkgModuleName -> UnitDefs -> TcPluginM DisEqState
mkDisEqInit PkgModuleName{moduleName = disEqName, pkgName} ud = do
    Found _ disEqModule <- findImportedModule disEqName (Just pkgName)
    disEq <- divulgeClass disEqModule "DisEquality"
    uomState <- mkUoMInit ud
    return $ DisEqState { uomState = uomState, disEqClass = disEq }

disEqPlugin
    :: DebugCts
    -> PkgModuleName
    -> ModuleName
    -> ModuleName
    -> FastString
    -> TcPlugin
disEqPlugin dbg pkgDisEq theory syntax pkg =
    TcPlugin
        { tcPluginInit = mkDisEqInit pkgDisEq =<< lookupUnitDefs theory syntax pkg
        , tcPluginSolve = \s gs ds ws -> do
            disEqs <- unitsDisEq dbg s gs ds ws
            return $ TcPluginOk [] disEqs
        , tcPluginStop  = const $ return ()
        }

unitsDisEq
    :: DebugCts
    -> DisEqState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM [Ct]
unitsDisEq
    dbgPlugin@DebugCts{traceCallCount}
    s@DisEqState{uomState = UomState{callsRef}}
    givens _deriveds wanteds

    | null wanteds = do logCalls; return []
    | otherwise = do logCalls; lookForDisEqs s givens wanteds
    where
        logCalls = do
            calls <- unsafeTcPluginTcM $ readMutVar callsRef
            unsafeTcPluginTcM $ writeMutVar callsRef (calls + 1)
            tracePlugin dbgPlugin $ pprSolverCallCount (Indent 1) traceCallCount calls

lookForDisEqs
    :: DisEqState
    -> [Ct]
    -- ^ The given constraints.
    -> [Ct]
    -- ^ The wanted constraints.
    -> TcPluginM [Ct]
    -- ^ The @~~@ constraints to be introduced as @disEq@ new work for
    -- typechecking constraint solver.
lookForDisEqs
    DisEqState
        { uomState = UomState{unitDefs = uds@UnitDefs{equivTyCon}}
        , disEqClass
        }
    givens wanteds = mapM unpackCt unpacks where
    unpacks = concatMap collectCt $ givens ++ wanteds

    collectCt ct = collectType uds ct $ ctEvPred $ ctEvidence ct

    unpackCt (ct, a, _xs) =
        newGivenCt loc (mkEqPred ty1 ty2) (evByFiat "thoralf-uom-diseq" ty1 ty2)
        where
            ty1 = TyConApp equivTyCon [a]
            ty2 = undefined disEqClass
            loc = ctLoc ct