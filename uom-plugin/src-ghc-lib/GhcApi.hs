{-# LANGUAGE PackageImports #-}

module GhcApi
    (
    -- * From Coercion
      mkUnivCo
    , Coercion

    -- * From DataCon
    , dataConName, promoteDataCon, dataConWrapId

    -- * From FastString
    , FastString(..)
    , fsLit

    -- * From Module
    , mkModuleName

    -- * From Name
    , mkSysTvName

    -- * From OccName
    , occName, occNameFS, mkTcOcc

    -- * From Outputable
    , Outputable(..)
    , (<>), (<+>), ($$)
    , text

    -- * From Plugins
    , Plugin(..)
    , defaultPlugin

    -- * From TcEvidence
    , EvTerm(..)
    , TcCoercion
    , TcCoercionR
    , EvExpr
    , evCast
    , evDFunApp

    -- * From TcPluginM
    , TcPluginM
    , tcPluginTrace, matchFam, newFlexiTyVar, isTouchableTcPluginM
    , tcLookupTyCon, zonkCt
    , newUnique

    -- * From TcRnTypes
    , Ct(..), TcPlugin(..), TcPluginResult(..), CtLoc
    , ctLoc, ctEvidence, ctEvPred, ctPred
    , isGiven, isWanted, isGivenCt
    , mkNonCanonical

    -- * From TcType
    , tcSplitTyConApp_maybe, vanillaSkolemTv

    -- * From TyCon
    , TyCon(..), Role(..)
    , isFamilyTyCon, tyConDataCons

    -- * From TyCoRep
    , UnivCoProvenance(PluginProv)
    , Kind
    , Type(TyConApp, TyVarTy, AppTy, ForAllTy, FunTy)
    , mkTyVarTy

    -- * From Type
    , EqRel(..), Pred(..), PredType
    --, PredTree(..), PredType
    , splitTyConApp_maybe, typeKind, classifyPredType
    , tyCoVarsOfType, tyCoVarsOfTypes
    , mkNumLitTy, mkTyConApp
    , isNumLitTy, isStrLitTy
    , coreView
    , mkPrimEqPred, mkStrLitTy
    , nonDetCmpType, nonDetCmpTypes

    -- * From TysWiredIn
    , typeSymbolKind, nilDataCon, consDataCon, heqTyCon, heqDataCon

    -- * From Unique
    , getUnique
    , nonDetCmpUnique

    -- * From Util
    , thenCmp

    -- * From Var
    , Id, DFunId, TyVar
    , mkTcTyVar

    -- * From VarSet
    , TyCoVarSet
    , elemVarSet

    -- * From GHC.TcPluginM.Extra
    , evByFiat, tracePlugin, lookupModule, lookupName
    ) where

import Prelude hiding ((<>))

import GhcPlugins hiding (TcPlugin)
import Constraint
    ( Ct(..), CtLoc
    , ctLoc, ctEvidence, ctPred, ctEvPred
    , isGiven, isWanted, isGivenCt
    , mkNonCanonical
    )
import Predicate (Pred(..), EqRel(..), classifyPredType)
import TcEvidence
    ( EvTerm(..)
    , TcCoercion
    , TcCoercionR
    , EvExpr
    , evCast
    , evDFunApp
    )
import TcPluginM
    ( TcPluginM
    , tcPluginTrace, matchFam, newFlexiTyVar, isTouchableTcPluginM
    , tcLookupTyCon, zonkCt
    , newUnique
    )
import TcRnTypes (TcPlugin(..), TcPluginResult(..))
import TcType (vanillaSkolemTv)
import TyCoRep
    ( UnivCoProvenance(PluginProv)
    , Type(TyConApp, TyVarTy, AppTy, ForAllTy, FunTy)
    )
import Unique (nonDetCmpUnique)
import GHC.TcPluginM.Extra (evByFiat, tracePlugin, lookupModule, lookupName )
