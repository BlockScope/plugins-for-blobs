{-# LANGUAGE CPP #-}

module Plugins.Thoralf.Rows (plugin) where

import GHC.Corroborate
import Plugins.Print

import ThoralfPlugin.Encode (thoralfTheories )
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.TcPlugin (thoralfPlugin)
import Plugins.Thoralf.Print
    (DebugSmt(..), TraceCarry(..), DebugSmtTalk(..), DebugSmtRecv(..), TraceSmtTalk(..))
import Plugins.Print.SMT (TraceSmtCts(..))

plugin :: Plugin
plugin =
    let pm =
            PkgModuleName
                (mkModuleName "Data.Theory.DisEq")
                (fsLit "thoralf-theory")

        dbgPlugin =
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

        tyCheck = thoralfPlugin dbgPlugin dbgSmt pm thoralfTheories
    in
        defaultPlugin
            { tcPlugin = const $ Just tyCheck
#if __GLASGOW_HASKELL__ >= 806
            , pluginRecompile = purePlugin
#endif
            }
