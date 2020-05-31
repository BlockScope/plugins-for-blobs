module Internal
    ( module GhcPlugins
    , module Constraint
    , module Predicate
    , module TcEvidence
    , module TcPluginM
    , module TcRnTypes
    , module TcType
    , module TyCoRep
    , module Unique
    , module GHC.TcPluginM.Extra
    ) where

import GhcPlugins
    ( PredType, FastString(..), Role(..), TyCoVarSet, Plugin(..)
    , Kind, TyVar, Id, DFunId, Coercion, TyCon(..), Outputable(..)
    , (<>), (<+>), ($$)
    , isNumLitTy, isStrLitTy, isFamilyTyCon
    , mkNumLitTy, mkStrLitTy
    , mkTyConApp, mkTcTyVar, mkPrimEqPred, mkTyVarTy
    , dataConName, dataConWrapId, promoteDataCon
    , heqTyCon, heqDataCon
    , consDataCon, nilDataCon
    , typeKind, typeSymbolKind
    , tyCoVarsOfType, tyCoVarsOfTypes, tyConDataCons
    , mkModuleName, mkSysTvName
    , occName, occNameFS, mkTcOcc, text, fsLit
    , thenCmp, getUnique
    , splitTyConApp_maybe
    , defaultPlugin, mkUnivCo, elemVarSet, coreView
    )
import Constraint
    ( Ct(..), CtLoc
    , ctLoc, ctEvidence, ctPred, ctEvPred
    , isGiven, isWanted, isGivenCt
    , mkNonCanonical
    )
import Predicate (PredTree(..), EqRel(..), classifyPredType)
import TcEvidence (EvTerm(..), TcCoercion, TcCoercionR)
import TcPluginM
    ( TcPluginM
    , tcPluginTrace, matchFam, newFlexiTyVar, isTouchableTcPluginM
    , tcLookupTyCon, zonkCt
    , newUnique
    )
import TcRnTypes (TcPlugin(..), TcPluginResult(..))
import TcType (tcSplitTyConApp_maybe, vanillaSkolemTv)
import TyCoRep (UnivCoProvenance(PluginProv), Type(..))
import Unique (nonDetCmpUnique)
import GHC.TcPluginM.Extra (evByFiat, tracePlugin, lookupModule, lookupName )
