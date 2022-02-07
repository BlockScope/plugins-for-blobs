{-# LANGUAGE CPP, ScopedTypeVariables #-}

module Plugins.Thoralf.UoM (plugin, thoralfUomPlugin, mkThoralfUomInit) where

import Data.Maybe (mapMaybe)
import Control.Monad.Reader (guard)
import GHC.Corroborate
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode (thoralfUoMTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import ThoralfPlugin.Convert (ExtractEq(..))
import Plugins.Thoralf.TcPlugin
    (ThoralfState(..), mkThoralfInit, thoralfStop, thoralfSolver)
import Plugins.Thoralf.Print (DebugSmt, defaultDebugSmt)
import Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))
import Data.UnitsOfMeasure.Unsafe.Find (lookupUnitDefs)

plugin :: Plugin
plugin =
    let disEq =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-theory")

        dbgPlugin =
            DebugCts
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceSolution = TraceSolution False
                }

        dbgSmt = defaultDebugSmt

        tc = thoralfUomPlugin dbgPlugin dbgSmt disEq thoralfUoMTheories
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "thoralf-uom-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }

mkThoralfUomInit
    :: DebugSmt
    -> PkgModuleName
    -> TcPluginM TheoryEncoding
    -> TcPluginM (ThoralfState, UnitDefs)
mkThoralfUomInit dbgSmt pkgModuleName seed = do
    let theory = mkModuleName "Data.Theory.UoM"
    let syntax = mkModuleName "Data.UnitsOfMeasure.Syntax"
    uds <- lookupUnitDefs theory syntax (fsLit "uom-quantity")
    s <- mkThoralfInit pkgModuleName seed dbgSmt

    let ExtractEq{extractEq = _exEq, extractDisEq = _exDisEq} = extract s

    -- let f :: [Ct] -> [((Type, Type), Ct)]
    --     f cts = undefined

    let extract' :: ExtractEq
        extract' = ExtractEq{extractEq = _extractEq uds, extractDisEq = _extractDisEq}

    return (s{extract = extract'}, uds)

thoralfUomPlugin
    :: DebugCts
    -> DebugSmt
    -> PkgModuleName
    -> TcPluginM TheoryEncoding
    -> TcPlugin
thoralfUomPlugin dbgPlugin dbgSmt pkgModuleName seed =
    TcPlugin
        { tcPluginInit = fst <$> mkThoralfUomInit dbgSmt pkgModuleName seed
        , tcPluginSolve = thoralfSolver dbgPlugin dbgSmt
        , tcPluginStop = thoralfStop
        }

_extractEq :: UnitDefs -> [Ct] -> [((Type, Type), Ct)]
_extractEq uds = mapMaybe (_maybeExtractTyEq uds)

_extractDisEq :: Class -> [Ct] -> [((Type, Type), Ct)]
_extractDisEq cls = mapMaybe (_maybeExtractTyDisEq cls)

_maybeExtractTyDisEq :: Class -> Ct -> Maybe ((Type, Type), Ct)
_maybeExtractTyDisEq disEqCls ct = do
    ClassPred class' (_: t1 : t2 : _) <- return (classifyPredType $ ctPred ct)
    guard (class' == disEqCls)
    return ((t1, t2), ct)

-- TODO: Maybe reuse toUnitEquality?
_maybeExtractTyEq :: UnitDefs -> Ct -> Maybe ((Type, Type), Ct)
_maybeExtractTyEq uds ct =
    case classifyPredType $ ctPred ct of
        EqPred NomEq t1 t2 -> return ((t1, t2), ct)
        IrredPred t
            | Just (tc, [t1,t2]) <- splitTyConApp_maybe t
            , tc == equivTyCon uds -> return ((t1, t2), ct)
        _ -> Nothing