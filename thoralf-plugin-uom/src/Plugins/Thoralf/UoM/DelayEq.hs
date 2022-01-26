{-# LANGUAGE CPP, PackageImports, ScopedTypeVariables #-}

module Plugins.Thoralf.UoM.DelayEq (plugin) where

import GHC.Corroborate
import Plugins.Print (DebugCts(..), TraceSolution(..), TraceCallCount(..), TraceCts(..))

import ThoralfPlugin.Encode (thoralfUoMTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.Print
    (DebugSmt(..), TraceCarry(..), DebugSmtTalk(..), DebugSmtRecv(..), TraceSmtTalk(..))
import Plugins.Print.SMT (TraceSmtCts(..))

import Plugins.Thoralf.UoM.DelayEq.TcPlugin (thoralfDelayEqPlugin)

plugin :: Plugin
plugin =
    let disEq =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-theory")

        dbgCts =
            DebugCts
                { traceCallCount = TraceCallCount False
                , traceCts = TraceCts False
                , traceSolution = TraceSolution False
                }

        dbgSmt =
            DebugSmt
                { traceCarry = TraceCarry False
                , traceSmtCts = TraceSmtCts False
                , traceSmtTalk =
                    TraceSmtTalk
                        DebugSmtTalk
                            { traceSend = True
                            -- , traceRecv = DebugSmtRecvAll False
                            , traceRecv =
                                DebugSmtRecvSome
                                    { traceSuccess = False
                                    , traceCheckSat = True
                                    }
                            , traceErr = False
                            , traceOther = False
                            , traceArrow = False
                            , traceCtsComments = True
                            }
                }

        tc = thoralfDelayEqPlugin dbgCts dbgSmt disEq thoralfUoMTheories
    in
        defaultPlugin
            { tcPlugin = const . Just $ tracePlugin "thoralf-uom-plugin" tc
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
