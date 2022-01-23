{-# LANGUAGE NamedFieldPuns, RecordWildCards #-}

module Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..), DebugSmtRecv(..), DebugSmtTalk(..)
    , TraceCarry(..), TraceSmtTalk(..)
    , pprConvCtsStep, pprAsSmtCommentCts, pprSmtStep, pprSDoc
    , tracePlugin, traceSmt
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (Indent(..), tracePlugin, pprCts)

import ThoralfPlugin.Convert (ConvCts(..), ConvEq(..))
import Plugins.Print.SMT
    ( DebugSmt(..), DebugSmtTalk(..), DebugSmtRecv(..)
    , TraceCarry(..), TraceSmtTalk(..), TraceSmtCts(..)
    , SmtGivens(..), SmtWanteds(..), SmtDecls(..)
    , SmtCommentGivens(..), SmtCommentWanteds(..)
    , pprSmtGivens, pprSmtWanteds, pprSmtDecls, isSilencedTalk
    )

data ConvCtsStep = ConvCtsStep { givens :: ConvCts, wanted :: ConvCts }

pprConvCtsStep :: Indent -> DebugSmt -> ConvCtsStep -> [String]
pprConvCtsStep
    indent
    DebugSmt{..}
    ConvCtsStep{givens = ConvCts _ gs _ds1, wanted = ConvCts _ ws _ds2} =
    if not (coerce traceCarry)
        then []
        else pprCts "cts-carried" indent gCts [] wCts
    where
        gCts = eqCt <$> gs
        wCts = eqCt <$> ws

pprSmtStep :: DebugSmt -> Indent -> ConvCtsStep -> [String]
pprSmtStep
    DebugSmt{..}
    indent@(Indent i)
    ConvCtsStep{givens = ConvCts _ns1 gs ds1, wanted = ConvCts _ns2 ws ds2} =
    [
        ( tab
        . showString "[cts-as-smt]"
        . showString "\n"
        . tabtab
        . showString "smt-givens-decs = "
        . pprSmtDecls j (SmtDecls ds1)
        . showString "\n"
        . tabtab
        . showString "smt-givens = "
        . pprSmtGivens j (SmtGivens gSs)
        . showString "\n"
        . tabtab
        . showString "smt-wanteds-decs = "
        . pprSmtDecls j (SmtDecls ds2)
        . showString "\n"
        . tabtab
        . showString "smt-wanteds = "
        . pprSmtWanteds j (SmtWanteds wSs))
        ""
    | coerce traceSmtCts
    ]
    where
        tab = showString $ replicate (2 * i) ' '
        tabtab = showString $ replicate (2 * (i + 1)) ' '
        j = indent + 1
        gSs = eqSExpr <$> gs
        wSs = eqSExpr <$> ws

pprCommentList :: Show a => [a] -> ShowS
pprCommentList [] = showString "; []\n"
pprCommentList [y] = showString "; " . shows y . showChar '\n'
pprCommentList (y : ys) =
        showString "; "
        . shows y
        . foldr
            (\e m -> showChar '\n' . showString "; " . shows e . m)
            (showString "\n")
            ys

pprAsSmtCommentCts :: DebugSmt -> ConvCtsStep -> [String]
pprAsSmtCommentCts
    DebugSmt{traceSmtTalk = TraceSmtTalk DebugSmtTalk{traceCtsComments}}
    ConvCtsStep{givens = ConvCts _ gs _, wanted = ConvCts _ ws _} =
        [
            ( showString "\n; GIVENS (GHC style)\n"
            . pprSDoc (SmtCommentGivens gCts)
            . showString "\n; WANTEDS (GHC style)\n"
            . pprSDoc (SmtCommentWanteds wCts))
            ""
        | traceCtsComments
        ]
        ++
        [
            ( showString "; GIVENS (Thoralf style)\n"
            . pprCommentList gCts
            . showString "\n; WANTEDS (Thoralf style)\n"
            . pprCommentList wCts)
            ""
        | traceCtsComments
        ]
    where
        gCts = eqCt <$> gs
        wCts = eqCt <$> ws

pprSDoc :: Outputable a => a -> ShowS
pprSDoc x =
    -- WARNING: Some lines are wrapped when printed so I'm adding the
    -- comment leader to each line once I have the lines.
    showString
    $ unlines [ "; " ++ line | line <- lines . showSDocUnsafe $ ppr x]

traceSmt :: DebugSmt -> String -> TcPluginM ()
traceSmt DebugSmt{traceSmtTalk = TraceSmtTalk talk, ..} s'
    | coerce traceCarry
        || coerce traceSmtCts
        || not (isSilencedTalk talk)= tcPluginIO $ putStrLn s'
    | otherwise = return ()

instance Outputable ConvCtsStep where
    ppr ConvCtsStep{givens = ConvCts ns1 gs ds1, wanted = ConvCts ns2 ws ds2} =
        text "smt-givens-decs = "
        <+> ppr (SmtDecls ds1)
        <+> text "smt-givens-names = "
        <+> vcat (pprNames <$> ns1)
        <+> text "smt-given = "
        <+> ppr (SmtGivens gSs)
        <+> text "smt-wanteds-decs = "
        <+> ppr (SmtDecls ds2)
        <+> text "smt-wanteds-names = "
        <+> vcat (pprNames <$> ns2)
        <+> text "smt-wanted = "
        <+> ppr (SmtWanteds wSs)
        where
            gSs = eqSExpr <$> gs
            wSs = eqSExpr <$> ws
            pprNames (x, y) = ppr x <+> text " <=> " <+> ppr y
