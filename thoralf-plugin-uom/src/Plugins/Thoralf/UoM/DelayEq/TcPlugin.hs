{-# LANGUAGE MultiWayIf, NamedFieldPuns, ParallelListComp, TypeFamilies, TypeInType #-}
{-# LANGUAGE PackageImports #-}

module Plugins.Thoralf.UoM.DelayEq.TcPlugin (thoralfDelayEqPlugin) where

import Prelude hiding (showList, cycle)
import qualified Data.Set as Set
import Data.Foldable (traverse_)
import Data.Either (partitionEithers)
import Data.Maybe (mapMaybe)
import Data.List ((\\), foldl1')
import qualified SimpleSMT as SMT
import System.IO.Error (catchIOError)
import GHC.Corroborate hiding (tracePlugin)
import Plugins.Print
    (DebugCts(..), Indent(..), pprSolverCallCount, pprCtsStepProblem, pprCtsStepSolution)

import ThoralfPlugin.Extract (maybeExtractTyEq, maybeExtractTyDisEq)
import ThoralfPlugin.Convert (EncodingData(..), ConvCts(..), ConvEq(..), convert)
import ThoralfPlugin.Encode.TheoryEncoding (TheoryEncoding(..))
import ThoralfPlugin.Encode.Find (PkgModuleName(..))
import Plugins.Thoralf.Print
    ( ConvCtsStep(..), DebugSmt(..)
    , tracePlugin, traceSmt, pprConvCtsStep, pprAsSmtCommentCts, pprSmtStep, pprSDoc
    )
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.Unify (UnitEquality(..), fromUnitEquality)
import "uom-quantity" Plugins.UoM.Unpack.TcPlugin (unitsUnpack)
import "uom-quantity" Data.UnitsOfMeasure.Unsafe.UnitDefs (UnitDefs(..))
import Plugins.Thoralf.TcPlugin (ThoralfState(..), thoralfStop)
import Plugins.UoM.Eq.TcPlugin (unitsEq, evMagic)
import Plugins.Thoralf.UoM (mkThoralfUomInit)
import Plugins.UoM.State (UomState(..))

thoralfDelayEqPlugin
    :: DebugCts
    -> DebugSmt
    -> PkgModuleName
    -> TcPluginM TheoryEncoding
    -> TcPlugin
thoralfDelayEqPlugin dbgCts dbgSmt pkgModuleName seed =
    TcPlugin
        { tcPluginInit = mkThoralfUomInit dbgSmt pkgModuleName seed
        , tcPluginSolve = \(s, ud) gs ds ws -> do
            (_, calls) <- unsafeTcPluginTcM . readMutVar $ smtSolverRef s
            calls' <- unsafeTcPluginTcM $ newMutVar calls
            let uomState = UomState ud calls'
            unpacks <- unitsUnpack dbgCts uomState gs ds ws
            eqs <- unitsEq dbgCts unpacks uomState gs ds ws
            delayEqSolve dbgCts dbgSmt unpacks eqs ud s gs ds ws
        , tcPluginStop = thoralfStop <$> fst
        }

delayEqSolve
    :: DebugCts
    -> DebugSmt
    -> [Ct] -- ^ Unpacked given units
    -> ([UnitEquality], [UnitEquality]) -- ^ Unit givens and unit wanteds
    -> UnitDefs
    -> ThoralfState
    -> [Ct] -- ^ Given constraints
    -> [Ct] -- ^ Derived constraints
    -> [Ct] -- ^ Wanted constraints
    -> TcPluginM TcPluginResult
delayEqSolve
    dbgPlugin@DebugCts{traceCallCount}
    dbgSmt
    unpacks
    (unit_givens, unit_wanteds)
    ud
    ThoralfState
        { smtSolverRef
        , theoryEncoding
        , disEqClass
        , extract
        , seenDecsRef
        }
    givens ds' wanteds

    | null wanteds = do
        if null unit_givens then return $ TcPluginOk [] [] else do

            (smtSolver, calls) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
            unsafeTcPluginTcM $ writeMutVar smtSolverRef (smtSolver, calls + 1)

            let cycle = show calls
            tcPluginIO . SMT.echo smtSolver $ "solver-start-cycle-" ++ cycle

            _ <- tracePlugin
                    dbgPlugin
                    (pprSolverCallCount traceCallCount "ghc-tcplugin-thoralf" iIndent calls)

            let (unit_givens', _) = partitionEithers $ zipWith foo givens (Left <$> unit_givens)

            let solvedCts =
                    [ (evMagic "thoralf-uom-delay-eq" ud ct, ct)
                    | (_, eq) <- unit_givens'
                    , let ct = fromUnitEquality eq
                    ]

            return $ TcPluginOk solvedCts []

    | not $ null unpacks = return $ TcPluginOk [] unpacks

    | null unit_wanteds = return $ TcPluginOk [] []

    | otherwise = do

        (smtSolver, calls) <- unsafeTcPluginTcM $ readMutVar smtSolverRef
        unsafeTcPluginTcM $ writeMutVar smtSolverRef (smtSolver, calls + 1)
        seenDecs <- unsafeTcPluginTcM $ readMutVar seenDecsRef

        let cycle = show calls
        tcPluginIO . SMT.echo smtSolver $ "solver-start-cycle-" ++ cycle

        _ <- tracePlugin
                dbgPlugin
                (pprSolverCallCount traceCallCount "ghc-tcplugin-thoralf" iIndent calls)

        -- Preprocessing
        let (unit_givens', gs') = partitionEithers $ zipWith foo givens (Left <$> unit_givens)
        let (unit_wanteds', ws') = partitionEithers $ zipWith foo wanteds (Left <$> unit_wanteds)

        let solvedEqGivens =
                [ (evMagic "thoralf-uom-delay-eq" ud ct, ct)
                | (_, eq) <- unit_givens'
                , let ct = fromUnitEquality eq
                ]

        let solvedEqWanteds =
                [ (evMagic "thoralf-uom-delay-eq" ud ct, ct)
                | (_, eq) <- unit_wanteds'
                , let ct = fromUnitEquality eq
                ]

        let gs = sift gs' ++ (snd <$> solvedEqGivens)
        let ds = sift ds'
        let ws = sift ws' ++ (snd <$> solvedEqWanteds)
        logCtsProblem (Just constraintAsIs) gs' ds' ws'
        logCtsProblem (Just constraintFiltered) gs ds ws

        let gsConvCts = convertor gs
        let wsConvCts = convertor $ ws ++ ds
        tcPluginTrace "thoralf-solve gsConvCts" $ ppr gsConvCts
        tcPluginTrace "thoralf-solve wsConvCts" $ ppr wsConvCts

        (decs1Unseen, decs2Unseen, ctSolving) <- case (gsConvCts, wsConvCts) of

            -- With no wanted constraints there's no useful work to do. Checking the
            -- consistency of the givens without wanteds is not useful.
            (Just _, Just (ConvCts _ [] _)) -> return (Set.empty, Set.empty, TcPluginOk [] [])

            (Just gCCs@(ConvCts ns1 gExprs decs1), Just wCCs@(ConvCts ns2 wExprs decs2)) -> do
                let step = ConvCtsStep gCCs wCCs
                logConvCts step
                logSmtComments step
                logSmtCts step

                (decs1Unseen, givenCheck) <- tcPluginIO $ do
                    SMT.echo smtSolver $ "givens-start-cycle-" ++ cycle
                    putStrLn "; GIVENS (conversions)"
                    sequence_ [ putStrLn $ pprSDoc e "" | e <- wExprs ]
                    putStrLn "; GIVENS (names)"
                    printAltNames ns1
                    (decs1Unseen, check) <- hideError $ do
                        SMT.push smtSolver

                        let decs1Unseen = Set.difference (Set.fromList decs1) seenDecs
                        let decs1Seen = Set.intersection (Set.fromList decs1) seenDecs
                        putStrLn "; DECS1 (seen) "
                        printDecs decs1Seen
                        putStrLn "; DECS1 (unseen) "
                        printDecs decs1Unseen
                        traverse_ (SMT.ackCommand smtSolver) decs1

                        sequence_ $
                            [ SMT.assert smtSolver $ SMT.named name e
                            | e <- eqSExpr <$> gExprs
                            | nth <- [1 :: Int ..]
                            , let name = "given-" ++ cycle ++ "." ++ show nth
                            ]
                        c <- SMT.check smtSolver
                        return (decs1Unseen, c)

                    SMT.echo smtSolver $ "givens-finish-cycle-" ++ cycle
                    return (decs1Unseen, check)

                tcPluginTrace "thoralf-solve decls" $ ppr ds'
                tcPluginTrace "thoralf-solve decls filtered" $ ppr ds
                tcPluginTrace "thoralf-solve givens" $ ppr gs'
                tcPluginTrace "thoralf-solve givens filtered" $ ppr gs
                tcPluginTrace "thoralf-solve wanteds" $ ppr ws'
                tcPluginTrace "thoralf-solve wanteds filtered" $ ppr ws
                tcPluginTrace "thoralf-solve simplified given sexprs" $ ppr gExprs

                (decs2Unseen, solveCheck) <- case givenCheck of
                        SMT.Unknown -> do
                            c <- tcPluginIO (SMT.pop smtSolver) >> noSolving
                            return (Set.empty, c)

                        SMT.Unsat -> do
                            tcPluginIO $ putStrLn "; Inconsistent Givens" >> SMT.pop smtSolver
                            return (Set.empty, TcPluginContradiction [])

                        SMT.Sat -> do
                            (decs2Unseen, wantedCheck) <- tcPluginIO $ do
                                SMT.echo smtSolver $ "wanteds-start-cycle-" ++ cycle
                                putStrLn "; WANTEDS (conversions)"
                                sequence_ [ putStrLn $ pprSDoc e "" | e <- wExprs ]
                                putStrLn "; WANTEDS (names)"
                                printAltNames ns2
                                setCheck <- hideError $ do

                                    let decs2' = decs2 \\ decs1
                                    let decs2Unseen = Set.difference (Set.fromList decs2') seenDecs 
                                    let decs2Seen = Set.intersection (Set.fromList decs2') seenDecs

                                    putStrLn "; DECS2 (seen) "
                                    printDecs decs2Seen
                                    putStrLn "; DECS2 (unseen) "
                                    printDecs decs2Unseen
                                    traverse_ (SMT.ackCommand smtSolver) decs2'

                                    let name = "wanted-" ++ cycle 
                                    SMT.assert smtSolver $ SMT.named name (smtWanted wExprs)
                                    c <- SMT.check smtSolver
                                    return (decs2Unseen, c)

                                SMT.echo smtSolver $ "wanteds-finish-cycle-" ++ cycle
                                return setCheck

                            solveCheck <- case wantedCheck of
                                SMT.Unsat -> do
                                    assertions <- tcPluginIO $ getAssertions smtSolver
                                    tcPluginIO $ printCommented assertions
                                    unsatCore <- tcPluginIO $ getUnsatCore smtSolver
                                    tcPluginIO $ printCommented unsatCore
                                    tcPluginIO (SMT.pop smtSolver)

                                    let solvedCts = mapMaybe (addEvTerm . eqCt) wExprs
                                    let ok = TcPluginOk (solvedCts ++ solvedEqGivens ++ solvedEqWanteds) []
                                    tcPluginTrace "thoralf-solve simplified wanteds" $ ppr solvedCts
                                    logCtsSolution ok
                                    return ok

                                SMT.Unknown -> tcPluginIO (SMT.pop smtSolver) >> noSolving

                                SMT.Sat ->do
                                    model <- tcPluginIO $ getModel smtSolver
                                    tcPluginIO $ printCommented model
                                    tcPluginIO (SMT.pop smtSolver) >> noSolving

                            return (decs2Unseen, solveCheck)

                return (decs1Unseen, decs2Unseen, solveCheck)

            _ -> do
                c <- tcPluginIO (putStrLn "Parse Failed") >> noSolving
                return (Set.empty, Set.empty, c)

        let seenDecs' = Set.unions [seenDecs, decs1Unseen, decs2Unseen]
        unsafeTcPluginTcM $ writeMutVar seenDecsRef seenDecs'
        tcPluginIO . SMT.echo smtSolver $ "solver-finish-cycle-" ++ cycle
        return ctSolving

    where
        sift = filter $ isEqCt disEqClass
        convertor = convert extract (EncodingData disEqClass theoryEncoding)
        hideError = flip catchIOError (const $ return (Set.empty, SMT.Sat))
        noSolving = return $ TcPluginOk [] []

        foo :: Ct -> Either UnitEquality Ct -> Either (Ct, UnitEquality) Ct
        foo ct (Left x) = Left (ct, x)
        foo _ (Right ct') = Right ct'

        iIndent@(Indent i) = Indent 1
        tab = showString $ replicate (2 * i) ' '

        jIndent = iIndent + 1

        constraintAsIs = (tab . showString "[constraints-as-is]") ""
        constraintFiltered = (tab . showString "[constraints-filtered]") ""

        getAssertions = flip SMT.command (SMT.List [ SMT.Atom "get-assertions" ])
        getModel = flip SMT.command (SMT.List [ SMT.Atom "get-model" ])
        getUnsatCore = flip SMT.command (SMT.List [ SMT.Atom "get-unsat-core" ])

        logCtsProblem msg gs ds ws =
            sequence_
            $ tracePlugin dbgPlugin
            <$> pprCtsStepProblem dbgPlugin "cts-problem" jIndent msg gs ds ws

        logCtsSolution x =
            sequence_
            $ tracePlugin dbgPlugin
            <$> pprCtsStepSolution dbgPlugin "cts-solution" jIndent x

        logConvCts step =
            sequence_
            $ tracePlugin dbgPlugin
            <$> pprConvCtsStep jIndent dbgSmt step

        logSmtComments step =
            sequence_
            $ traceSmt dbgSmt <$> pprAsSmtCommentCts dbgSmt step

        logSmtCts step =
            sequence_
            $ traceSmt dbgSmt <$> pprSmtStep dbgSmt jIndent step

        smtWanted :: [ConvEq] -> SMT.SExpr
        smtWanted [] = SMT.Atom "false"
        smtWanted ws = foldl1' SMT.or (map (SMT.not . eqSExpr) ws)

        printAltNames ns =
            sequence_
                [ putStrLn . showSDocUnsafe $
                    ( text "; " <+> ppr thoralfName <+> text " <= " <+> ppr ghcName)
                | (ghcName, thoralfName) <- ns
                ]

        printDecs decs =
            sequence_
                [ putStrLn $ "; " ++ SMT.showsSExpr dec ""
                | dec <- Set.toList decs
                ]

        printCommented as =
            sequence_
                [ putStrLn $ "; " ++ line
                | line <- lines $ SMT.ppSExpr as ""
                ]

isEqCt :: Class -> Ct -> Bool
isEqCt diseq ct = case (maybeExtractTyEq ct, maybeExtractTyDisEq diseq ct) of
    (Nothing, Nothing) -> False
    _ -> True

-- * Solver Helper Functions
--------------------------------------------------------------------------------

-- Note: We assume the use of addEvTerm is non-failing.
-- That is, we assume (length $ mapMaybe addEvTerm wCts) == length wCts.

addEvTerm :: Ct -> Maybe (EvTerm, Ct)
addEvTerm ct = do
    ((t1, t2), ct') <- maybeExtractTyEq ct
    -- We never have a wanted disequality.
    return (makeEqEvidence "thoralf" (t1,t2), ct')

-- | Make EvTerms for any two types.  Give the types inside a Predtree of the
-- form (EqPred NomEq t1 t2)
makeEqEvidence :: String -> (Type, Type) -> EvTerm
makeEqEvidence s' (t1, t2) = evByFiat s' t1 t2
