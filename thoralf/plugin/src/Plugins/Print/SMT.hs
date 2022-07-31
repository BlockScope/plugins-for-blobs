{-# LANGUAGE RecordWildCards, NamedFieldPuns #-}

{-# OPTIONS_GHC -Wno-orphans #-}

-- | This module provides for tracing that is itself valid SMT-2, anything that
-- is not an s-expression is a @"; comment"@.
module Plugins.Print.SMT
    (
     -- * Flags
      TraceCarry(..)
    , DebugSmtRecv(..)
    , DebugSmt(..)
    , defaultDebugSmt
    , nullDebugSmt

    -- * Verbosity
    , TraceSmtTalk(..)
    , noSmtTalk
    , tracingSExprCts
    , tracingCtsComments
    , tracingDecsSeen
    , tracingAssertions
    , tracingSatModel
    , tracingUnsatCore

    -- * Printing
    -- $printing
    , SmtDecls(..)
    , SmtGivens(..)
    , SmtWanteds(..)
    , SmtCommentGivens(..)
    , SmtCommentWanteds(..)
    , pprSmtList
    , pprSmtDecls
    , pprSmtGivens
    , pprSmtWanteds
    , compilingModuleSmtComment
    , traceSmt

    -- * Predicates
    , isSilencedTalk, isSilencedRecv
    ) where

import Data.Coerce (coerce)
import GHC.Corroborate
import Control.Monad.IO.Class (MonadIO(..))
import SimpleSMT (SExpr(..))
import qualified SimpleSMT as SMT (ppSExpr)
import Plugins.Print (Indent(..))

import ThoralfPlugin.Convert (ConvCts(..), ConvEq(..))

-- | Flags for tracing the conversation with the SMT solver (the talk).
data TraceSmtTalk =
    TraceSmtTalk
        { traceSend :: Bool -- ^ Trace the sent commands.
        , traceRecv :: DebugSmtRecv -- ^ Trace the received responses.
        , traceArrow :: Bool
        -- ^ Print a send or recv with arrow prefix showing the direction of the
        -- communication. With @traceArrow@ set to @True@ the annotated arrow is printed.
        --
        -- >>> [send->] (set-option :print-success true)
        -- >>> [<-recv] success
        --
        -- Without @traceArrow@ the arrow is omitted:
        --
        -- >>> (set-option :print-success true)
        -- >>> success
        , traceErr :: Bool -- ^ Trace errors.
        , traceOther :: Bool -- ^ Trace other messages.
        }

noSmtTalk :: TraceSmtTalk
noSmtTalk = TraceSmtTalk False (DebugSmtRecvAll False) False False False

-- | Trace responses from the SMT solver.
data DebugSmtRecv
    -- | Print all responses?
    = DebugSmtRecvAll Bool
    -- | Print some responses?
    | DebugSmtRecvSome
        { traceSuccess :: Bool
        -- ^ Trace success, we would have otherwise needed to set that option
        -- __on__ with the solver but this is done for us by @simple-smt@.
        -- Without asking, @simple-smt@ also sets the option to produce models
        -- on too.
        --
        -- >>> [send->] (set-option :print-success true)
        -- >>> [send->] (set-option :produce-models true)
        , traceCheckSat :: Bool
        -- ^ Trace the result of @(check-sat)@. The expected response is either
        -- @sat@ or @unsat@.
        --
        -- >>> [send->] (check-sat)
        -- >>> [<-recv] sat
        --
        -- >>> [send->] (check-sat)
        -- >>> [<-recv] unsat
        }
    deriving Eq

-- | Are we not to trace the sent commands and not trace the received responses?
isSilencedTalk :: TraceSmtTalk -> Bool
isSilencedTalk TraceSmtTalk{..} =
    not traceSend
    && isSilencedRecv traceRecv
    && not traceErr
    && not traceOther
    -- NOTE: traceArrow = false does not silence anything but only change the
    -- inclusion of the arrow prefixes.

-- | Are we not to trace the received responses?
isSilencedRecv :: DebugSmtRecv -> Bool
isSilencedRecv (DebugSmtRecvAll b) = b
isSilencedRecv DebugSmtRecvSome{..} = not traceSuccess && not traceCheckSat

-- | Flag for controlling tracing of the carry.
newtype TraceCarry = TraceCarry Bool

data DebugSmt
    -- | For text output roughly formatted in a readable way with headings and
    -- nested indentation.
    = DebugSmtAsToml
        { traceCarry :: TraceCarry
        -- ^ Trace GHC constraints carried through conversion and solving.

        , traceEqCts :: Bool
        -- ^ Trace equality constraints in TOML-like format.
        --
        -- >>>
        --     [cts-as-smt]
        --       smt-givens-decs = []
        --       smt-givens = []
        --       smt-wanteds-decs = [
        --       (declare-const
        --    aeM7
        --    (Array String Int))
        --       ]
        --       smt-wanteds = [
        --       (assert (or false (not (=
        --    (
        --      (_
        --         map
        --         (+
        --            (Int Int)
        --            Int))
        --      (
        --        (as
        --           const
        --           (Array String Int))
        --        0)
        --      aeM7)
        --    (
        --      (_
        --         map
        --         (+
        --            (Int Int)
        --            Int))
        --      aeM7
        --      (
        --        (as
        --           const
        --           (Array String Int))
        --        0))))))
        --       ]
        }

    -- | For text output in a format that is compatible with the SMT solver so
    -- that the output can be fed back into the solver as-is.
    | DebugSmtAsSmt
        { traceSmtTalk :: TraceSmtTalk
        -- ^ Trace the conversation with the SMT solver

        , traceSExprCts :: Bool
        -- ^ Trace equality constraints converted to s-expressions

        , traceCtsComments :: Bool
        -- ^ Trace the constraints we might solve as comments in both GHC and
        -- Thoralf style.
        --
        -- >>> (echo "solver-start-cycle-15")
        -- ;
        -- ; GIVENS (GHC style)
        -- ; [G] co_a9Ov {0}:: (One *: a_a9aN[sk:1])
        -- ;                   ~# (b_a9aO[sk:1] *: One) (CNonCanonical)
        -- ;
        -- ; WANTEDS (GHC style)
        -- ; [WD] hole{co_a9Oy} {2}:: Base "kg" ~# a_a9aN[sk:1] (CNonCanonical)
        -- ;
        -- ; GIVENS (Thoralf style)
        -- ; (*: [One [],a9aN],*: [a9aO,One []])
        -- ;
        -- ; WANTEDS (Thoralf style)
        -- ; (Base ["kg"],a9aN)
        -- ;
        -- >>> (echo "givens-start-cycle-15")
        -- ; GIVENS (conversions)
        -- ;      [WD] hole{co_a9Oy} {2}:: Base "kg"
        -- ;                               ~# a_a9aN[sk:1] (CNonCanonical)
        -- ;  =>  (=
        -- ;    (store base "kg" one)
        -- ;    a9aN)
        -- ;
        -- ; GIVENS (names)
        -- ;  a9aN  <=  a_a9aN[sk:1]
        -- ;  a9aO  <=  b_a9aO[sk:1]
        -- ;
        -- >>> (echo "wanteds-start-cycle-15")
        -- ; WANTEDS (conversions)
        -- ;      [WD] hole{co_a9Oy} {2}:: Base "kg"
        -- ;                               ~# a_a9aN[sk:1] (CNonCanonical)
        -- ;  =>  (=
        -- ;    (store base "kg" one)
        -- ;    a9aN)
        -- ;
        -- ; WANTEDS (names)
        -- ;  a9aN  <=  a_a9aN[sk:1]

        , traceDecsSeen :: Bool
        -- ^ Note which declarations have been seen where (1) is are the
        -- declarations for the givens and (2) are the declarations for the
        -- wanteds.
        --
        -- >>>
        -- ; DECS1 (seen) 
        -- ; DECS1 (unseen) 
        -- ; (declare-const aahd (array string int))
        -- ; (declare-const aaHE (Array String Int))
        --
        -- ; DECS2 (seen) 
        -- ; DECS2 (unseen) 

        , traceAssertions :: Bool
        -- ^ Trace assertions.
        --
        -- >>> (get-assertions)
        -- ; (
        -- ;   (= one 1)
        -- ;   (= enc base)
        -- ;   (!
        -- ;      (not
        -- ;         (=
        -- ;            (
        -- ;              (as
        -- ;                 const
        -- ;                 (Array String Int))
        -- ;              0)
        -- ;            (
        -- ;              (_
        -- ;                 map
        -- ;                 (-
        -- ;                    (Int Int)
        -- ;                    Int))
        -- ;              (store base "byte" one)
        -- ;              (store base "byte" one))))
        -- ;      :named
        -- ;      wanted-1))

        , traceSatModel :: Bool
        -- ^ Trace the model of a satisfiable constraint.
        --
        -- >>> (get-model)
        -- ; (
        -- ;   (define-fun
        -- ;      base
        -- ;      ()
        -- ;      (Array String Int)
        -- ;      (store
        -- ;         (
        -- ;           (as
        -- ;              const
        -- ;              (Array String Int))
        -- ;           2)
        -- ;         "m"
        -- ;         3))
        -- ;   (define-fun
        -- ;      wanted-17
        -- ;      ()
        -- ;      Bool
        -- ;      (not
        -- ;         (=
        -- ;            (store base "m" one)
        -- ;            (store base "s" one))))
        -- ;   (define-fun
        -- ;      one
        -- ;      ()
        -- ;      Int
        -- ;      1)
        -- ;   (define-fun
        -- ;      enc
        -- ;      ()
        -- ;      (Array String Int)
        -- ;      (store
        -- ;         (
        -- ;           (as
        -- ;              const
        -- ;              (Array String Int))
        -- ;           2)
        -- ;         "m"
        -- ;         3))
        -- ;   (define-fun
        -- ;      exp
        -- ;      ()
        -- ;      (Array String Int)
        -- ;      (
        -- ;        (as
        -- ;           const
        -- ;           (Array String Int))
        -- ;        0)))

        , traceUnsatCore :: Bool
        -- ^ Trace the unsat core of an unsatisfiable constraint.
        --
        -- >>> (get-unsat-core)
        -- ; (wanted-1)
        }

tracingSExprCts, tracingCtsComments, tracingDecsSeen, tracingAssertions, tracingSatModel, tracingUnsatCore :: DebugSmt -> Bool
tracingSExprCts x
    | DebugSmtAsSmt{..} <- x = traceSExprCts
    | otherwise = False

tracingCtsComments x
    | DebugSmtAsSmt{..} <- x = traceCtsComments
    | otherwise = False

tracingDecsSeen x
    | DebugSmtAsSmt{..} <- x = traceDecsSeen
    | otherwise = False

tracingAssertions x
    | DebugSmtAsSmt{..} <- x = traceAssertions
    | otherwise = False

tracingSatModel x
    | DebugSmtAsSmt{..} <- x = traceSatModel
    | otherwise = False

tracingUnsatCore x
    | DebugSmtAsSmt{..} <- x = traceUnsatCore
    | otherwise = False

-- | Default settings for debugging that includes rich information as SMT2
-- comments; like the constraints, their conversions, the sat result, the
-- assertions and the model the model.
defaultDebugSmt :: DebugSmt
defaultDebugSmt =
    DebugSmtAsSmt
        { traceSmtTalk =
            TraceSmtTalk
                { traceSend = True
                , traceRecv =
                    DebugSmtRecvSome
                        { traceSuccess = False
                        , traceCheckSat = True
                        }
                , traceArrow = False
                , traceErr = False
                , traceOther = False
                }
        , traceSExprCts = True
        , traceCtsComments = True
        , traceDecsSeen = True
        , traceAssertions = True
        , traceSatModel = True
        , traceUnsatCore = True
        }

-- | A null debug setting that does not trace anything.
nullDebugSmt :: DebugSmt
nullDebugSmt =
    DebugSmtAsSmt
        { traceSmtTalk =
            TraceSmtTalk
                { traceSend = False
                , traceRecv = DebugSmtRecvAll False
                , traceArrow = False
                , traceErr = False
                , traceOther = False
                }
        , traceSExprCts = False
        , traceCtsComments = False
        , traceDecsSeen = False
        , traceAssertions = False
        , traceSatModel = False
        , traceUnsatCore = False
        }

-- | A list of conversion s-expressions wrapped up for printing.
newtype SmtDecls = SmtDecls [SExpr]

-- | A list of given constraints converted to s-expressions wrapped up for printing.
newtype SmtGivens = SmtGivens [SExpr]

-- | A list of wanted constraints converted to s-expressions wrapped up for printing.
newtype SmtWanteds = SmtWanteds [SExpr]

-- | A list of givens wrapped up for printing.
newtype SmtCommentGivens = SmtCommentGivens [Ct]

-- | A list of wanteds wrapped up for printing.
newtype SmtCommentWanteds = SmtCommentWanteds [Ct]

pprSmtList :: Indent -> [SExpr] -> ShowS
pprSmtList _ [] = showString "[]"
pprSmtList (Indent i) es = let tab = replicate (2 * i) ' ' in
    showChar '['
    . showChar '\n'
    . foldr
        (\e m -> showString tab . SMT.ppSExpr e . showChar '\n' . m)
        (showString tab . showChar ']')
        es

pprSmtDecls :: Indent -> SmtDecls -> ShowS
pprSmtDecls i (SmtDecls es) = pprSmtList i es

instance Outputable SExpr where
    ppr e = text $ SMT.ppSExpr e ""

instance Outputable SmtDecls where
    ppr (SmtDecls es) =
        text "["
        <+> vcat (ppr <$> es)
        <+> text "]"

instance Outputable SmtGivens where
    ppr (SmtGivens es) =
        text "["
        <+> vcat (ppr <$> es)
        <+> text "]"

instance Outputable SmtWanteds where
    ppr (SmtWanteds es) =
        text "["
        <+> vcat (ppr <$> es)
        <+> text "]"

instance Outputable ConvCts where
    ppr (ConvCts names eqs deps) =
        ppr names
        <+> ppr (SmtDecls $ eqSExpr <$> eqs)
        <+> ppr (eqCt <$> eqs)
        <+> ppr deps

instance Outputable SmtCommentWanteds where
    ppr (SmtCommentWanteds cts)
        | null cts = text "[]"
        | otherwise = vcat [ppr ct | ct <- cts]

instance Outputable SmtCommentGivens where
    ppr (SmtCommentGivens cts)
        | null cts = text "[]"
        | otherwise = vcat [ppr ct | ct <- cts]

-- | Pretty prints a list of SMT assertions for the givens.
pprSmtGivens :: Indent -> SmtGivens -> ShowS
pprSmtGivens _ (SmtGivens []) = showString "[]"
pprSmtGivens (Indent i) (SmtGivens es) = let tab = replicate (2 * i) ' ' in
    showChar '['
    . showChar '\n'
    . foldr
        (\e m ->
            showString tab
            . showString "(assert "
            . SMT.ppSExpr e
            . showChar ')'
            . showChar '\n'
            . m)
        (showString tab . showChar ']')
        es

-- | Pretty prints a list of SMT assertions for the wanteds.
pprSmtWanteds :: Indent -> SmtWanteds -> ShowS
pprSmtWanteds _ (SmtWanteds []) = showString "[]"
pprSmtWanteds (Indent i) (SmtWanteds es) = let tab = replicate (2 * i) ' ' in
    showChar '['
    . showChar '\n'
    . foldr
        (\e m ->
            showString tab
            . showString "(assert (or false (not "
            . SMT.ppSExpr e
            . showString ")))"
            . showChar '\n'
            . m)
        (showString tab . showChar ']')
        es

-- | Adds a SMT2 comment @"; Compiling _"@ naming the module being compiled.
compilingModuleSmtComment :: MonadIO m => HsParsedModule -> m HsParsedModule
compilingModuleSmtComment m = do
    let modName = fmap unLoc . hsmodName . unLoc . hpm_module
    let msg = "; Compiling " ++ maybe "an unnamed module" moduleNameString (modName m)
    liftIO $ putStrLn msg
    return m

-- | Traces the given string if 'traceSmtTalk' is @True@.
traceSmt :: DebugSmt -> String -> TcPluginM ()
traceSmt DebugSmtAsSmt{traceSExprCts, traceSmtTalk} s'
    | coerce traceSExprCts || not (isSilencedTalk traceSmtTalk) = tcPluginIO $ putStrLn s'
    | otherwise = return ()
traceSmt DebugSmtAsToml{traceCarry, traceEqCts} s'
    | coerce traceCarry || coerce traceEqCts = tcPluginIO $ putStrLn s'
    | otherwise = return ()

-- $printing
--
-- We use newtypes to define 'Outputable' instances for @[SExpr]@ and
-- @[Ct]@ when they are givens, wanteds and declarations.