{-# LANGUAGE NamedFieldPuns #-}

-- | Has functions for printing constraints as SMT-LIB comments and for printing
-- converted constraints.
module Plugins.Thoralf.Print
    (
    -- * Conversion
      ConvCtsStep(..)

    -- * Printing

    -- ** As SMT-LIB comments
    , pprAsSmtCommentCts
    , pprAsSmtCommentSDoc

    -- ** As TOML-like
    , pprSmtStep
    , pprCtsStep
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print (Indent(..), pprCts)

import ThoralfPlugin.Convert (ConvCts(..), ConvEq(..))
import Plugins.Print.SMT
    ( DebugSmt(..)
    , TraceCarry(..)
    , SmtGivens(..), SmtWanteds(..), SmtDecls(..)
    , SmtCommentGivens(..), SmtCommentWanteds(..)
    , pprSmtGivens, pprSmtWanteds, pprSmtDecls
    
    )

-- | For one step in typechecking, the converted givens and wanteds.
data ConvCtsStep = ConvCtsStep { givens :: ConvCts, wanted :: ConvCts }

-- | Pretty prints unconverted constraints laid out TOML-like.
pprCtsStep :: Indent -> DebugSmt -> ConvCtsStep -> [String]
pprCtsStep _ DebugSmtAsSmt{} _ = []
pprCtsStep
    indent
    DebugSmtAsToml{traceCarry}
    ConvCtsStep{givens = ConvCts _ gs _ds1, wanted = ConvCts _ ws _ds2} =
    if not (coerce traceCarry)
        then []
        else pprCts "cts-carried" indent gCts [] wCts
    where
        gCts = eqCt <$> gs
        wCts = eqCt <$> ws

-- | Pretty prints constraints converted to s-expressions in a nested TOML-like
-- format.
pprSmtStep :: Indent -> DebugSmt -> ConvCtsStep -> [String]
pprSmtStep _ DebugSmtAsSmt{} _ = []
pprSmtStep
    indent@(Indent i)
    DebugSmtAsToml{traceEqCts}
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
    | coerce traceEqCts
    ]
    where
        tab = showString $ replicate (2 * i) ' '
        tabtab = showString $ replicate (2 * (i + 1)) ' '
        j = indent + 1
        gSs = eqSExpr <$> gs
        wSs = eqSExpr <$> ws

-- | Prints a list of things as lines of SMT-LIB comments.
pprAsSmtCommentList :: Show a => [a] -> ShowS
pprAsSmtCommentList [] = showString "; []\n"
pprAsSmtCommentList [y] = showString "; " . shows y . showChar '\n'
pprAsSmtCommentList (y : ys) =
        showString "; "
        . shows y
        . foldr
            (\e m -> showChar '\n' . showString "; " . shows e . m)
            (showString "\n")
            ys

-- | Prints a list of constraints as lines of SMT-LIB comments.
pprAsSmtCommentCts :: DebugSmt -> ConvCtsStep -> [String]
pprAsSmtCommentCts DebugSmtAsToml{} _ = []
pprAsSmtCommentCts
    DebugSmtAsSmt{traceCtsComments}
    ConvCtsStep{givens = ConvCts _ gs _, wanted = ConvCts _ ws _} =
        [
            ( showString "\n; GIVENS (GHC style)\n"
            . pprAsSmtCommentSDoc (SmtCommentGivens gCts)
            . showString "\n; WANTEDS (GHC style)\n"
            . pprAsSmtCommentSDoc (SmtCommentWanteds wCts))
            ""
        | traceCtsComments
        ]
        ++
        [
            ( showString "; GIVENS (Thoralf style)\n"
            . pprAsSmtCommentList gCts
            . showString "\n; WANTEDS (Thoralf style)\n"
            . pprAsSmtCommentList wCts)
            ""
        | traceCtsComments
        ]
    where
        gCts = eqCt <$> gs
        wCts = eqCt <$> ws

-- | Pretty prints as lines of SMT-LIB comments.
pprAsSmtCommentSDoc :: Outputable a => a -> ShowS
pprAsSmtCommentSDoc x =
    -- WARNING: Some lines are wrapped when printed so I'm adding the
    -- comment leader to each line once I have the lines.
    showString
    $ unlines [ "; " ++ line | line <- lines . showSDocUnsafe $ ppr x]

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
