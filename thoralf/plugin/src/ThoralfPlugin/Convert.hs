{-# LANGUAGE CPP, NamedFieldPuns, ParallelListComp, PartialTypeSignatures #-}
{-# LANGUAGE LambdaCase, QuasiQuotes, ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-partial-type-signatures #-}

module ThoralfPlugin.Convert
    (
    -- * Data Definitions
    -- ** Core Types
      EncodingData(..), ConvCts(..), ConvEq(..), ConvMonad
    -- ** Basic Definitions
    , SExpr

    -- * Convert Function
    , convert, conv
    -- ** Extraction
    , ExtractEq(..)
    -- ** Converting the Dependencies
    , convertDeps, convertDecs, mkDefaultSMTVar, mkSMTSort
    , KdVar, convertTyVars, justReadSExpr

    -- * Converting A Single Type
    -- ** Type Conversion Data
    , ConvertedType, ConvDeps(..), noDeps, Decl(..), Hash
    -- ** Converting A Type
    , convertType, tyVarConv, tryConvTheory, addDepParts, convDecConts
    , defaultConvTy, defConvTy

    -- * Converting A Single Kind
    , AltName, GhcName, ThoralfName, convertKind, convKindTheories

    -- * A Common Helper Function
    , tryFns
    ) where

#if MIN_VERSION_base(4,9,0) && !MIN_VERSION_base(4,11,0)
import Data.Semigroup (Semigroup(..))
#endif
import Data.Foldable (fold)
import Data.Maybe (mapMaybe)
import qualified Data.Map as M (fromList, toList)
import qualified Data.Set as S (fromList, toList)
import qualified SimpleSMT as SMT (SExpr, not, eq, readSExpr, ppSExpr)
import Control.Monad.Reader (ReaderT(..), lift, ask, guard)
import GHC.Corroborate hiding ((<>))
import Language.Haskell.Printf (s)

import ThoralfPlugin.Encode.TheoryEncoding
    (TheoryEncoding(..), DecCont(..), KdConvCont(..), TyConvCont(..), Vec(..))

-- | The input needed to convert 'Ct' into smt expressions.  We need the class
-- for dis equality, and an encoding of a collection of theories.
data EncodingData = EncodingData {encDisEq :: Class, encTheory :: TheoryEncoding}

data ConvEq =
    ConvEq
        { eqSExpr :: SExpr
        , eqCt :: Ct
        }

instance Outputable ConvEq where
    ppr (ConvEq e ct) = 
        vcat
            [ text "    " <+> ppr ct
            , text " => " <+> text (SMT.ppSExpr e "")
            ]

newtype GhcName = GhcName String
newtype ThoralfName = ThoralfName String
type AltName = (GhcName, ThoralfName)

instance Outputable GhcName where
    ppr (GhcName n) = text n

instance Outputable ThoralfName where
    ppr (ThoralfName n) = text n

-- | The output of converting constraints. We have a list of converted
-- constraints as well as a list of declarations. These declarations are
-- variable declarations as well as function symbols with accompanying defining
-- assert statements.
data ConvCts =
    ConvCts
        { convDescs :: [AltName]
        -- ^ Decscription of the converted types.
        , convEquals :: [ConvEq]
        -- ^ A list of converted constraints.
        , convDeps :: [SExpr]
        -- ^ A list of declarations.
        }

-- | Since our encoding data is passed around as a constant state, we put it in
-- a reader monad. Of course, conversion could fail, so we transform from
-- a Maybe monad.
type ConvMonad a = ReaderT EncodingData Maybe a

-- | The type of smt expressions.
type SExpr = SMT.SExpr

convert :: ExtractEq -> EncodingData -> [Ct] -> Maybe ConvCts
convert extract encodingData cts = runReaderT (conv extract cts) encodingData

conv :: ExtractEq -> [Ct] -> ConvMonad ConvCts
conv ExtractEq{extractEq, extractDisEq} cts = do
    EncodingData disEqClass _ <- ask

    let disEquals = extractDisEq disEqClass cts
    let equals = extractEq cts

    let matchingCts :: [Ct] = snd <$> disEquals ++ equals

    convDisEqs :: [((SExpr, SExpr), ConvDeps)] <- traverse (convPair . fst) disEquals
    convEqs :: [((SExpr, SExpr), ConvDeps)] <- traverse (convPair . fst) equals

    let disEqExprs :: [SExpr] = SMT.not . uncurry SMT.eq . fst <$> convDisEqs
    let eqExprs :: [SExpr] = uncurry SMT.eq . fst <$> convEqs
    let convPairs :: [ConvEq] =
            [ ConvEq{eqSExpr = e, eqCt = ct}
            | e <- disEqExprs ++ eqExprs
            | ct <- matchingCts
            ]

    let deps :: ConvDeps = mconcat $ (snd <$> convDisEqs) ++ (snd <$> convEqs)
    decls :: [SExpr] <- convertDeps deps

    let altNames = convertTyVarNames deps

    --guard (length matchingCts == length (disEqExprs ++ eqExprs))
    return $ ConvCts altNames convPairs decls
    where
        convPair :: (Type, Type) -> ConvMonad ((SExpr, SExpr), ConvDeps)
        convPair (t1, t2) = do
            ConvertedType _ t1' deps1 <- convertType t1
            ConvertedType _ t2' deps2 <- convertType t2
            return ((justReadSExpr t1', justReadSExpr t2'), deps1 <> deps2)

data ExtractEq =
    ExtractEq
        { extractEq :: [Ct] -> [((Type, Type), Ct)]
        , extractDisEq :: Class -> [Ct] -> [((Type, Type), Ct)]
        }

nubX :: Ord a => [a] -> [a]
nubX = S.toList . S.fromList

nubKV :: Ord a => [(a, b)] -> [(a, b)]
nubKV = M.toList . M.fromList

convertTyVarNames :: ConvDeps -> [(GhcName, ThoralfName)]
convertTyVarNames (ConvDeps tyvars' _kdvars _defvars _decs) = let tyvars = nubX tyvars' in
    (\tyvar ->
        ( GhcName . showSDocUnsafe $ ppr tyvar
        , ThoralfName . show $ getUnique tyvar))
    <$> tyvars

convertDeps :: ConvDeps -> ConvMonad [SExpr]
convertDeps (ConvDeps tyvars' kdvars' defvars' decs) = do
    let kdvars = nubX kdvars'
    let tyvars = nubX tyvars'
    let defvars = nubX defvars'

    -- TYVARS: [a1Fi,...]
    convertedTyVars <- traverse convertTyVars tyvars
    let kindVars = nubX $ concatMap snd convertedTyVars ++ kdvars
    let kindExprs = mkSMTSort <$> kindVars

    -- TYVAREXPRS: ((declare-const a1Fi (Array String Int)) (declare-const ...))
    let tyVarExprs = fst <$> convertedTyVars
    let defExprs = mkDefaultSMTVar <$> defvars

    decExprs <- convertDecs decs

    EncodingData _ theories <- ask

    -- TYVARS: [...,a1FF,...]
    -- TVPREDS: ((assert (<= 0 a1FF)))
    let tvPreds = foldMap (fmap justReadSExpr) $ mapMaybe (tyVarPreds theories) tyvars

    -- WARNING: Order matters when putting these expressions together.
    let varExprs = kindExprs ++ tyVarExprs ++ defExprs
    return $ varExprs ++ decExprs ++ tvPreds

showUnique :: TyVar -> String
showUnique = show . getUnique

-- | Converting Local Declarations
convertDecs :: [Decl] -> ConvMonad [SExpr]
convertDecs ds = return $ justReadSExpr <$>
    (foldMap snd . nubKV $ (\(Decl k v) -> (k, v)) <$> ds)

mkDefaultSMTVar :: TyVar -> SExpr
mkDefaultSMTVar = justReadSExpr . [s|(declare-const %? Type)|] . getUnique

mkSMTSort :: TyVar -> SExpr
mkSMTSort = justReadSExpr . [s|(declare-sort Sort%?)|] . getUnique

-- | Kind variables are just type variables
type KdVar = TyVar

convertTyVars :: TyVar -> ConvMonad (SExpr, [KdVar])
convertTyVars tv = do
    (smtSort, kdVars) <- convertKind $ tyVarKind tv
    return (justReadSExpr $ [s|(declare-const %? %s)|] (getUnique tv) smtSort, kdVars)

-- | A Type is converted into a string which is a valid SMT term, if the
-- dependencies are converted properly and sent to the solver before the term
-- is mentioned.
data ConvertedType =
    ConvertedType
        { convTyDesc :: String -- ^ A description of the term.
        , convTySmt :: String -- ^ The SMT term.
        , convTyDeps :: ConvDeps -- ^ The dependencies of the term.
        }

-- | These are pieces of a type that need to be converted into SMT declarations
-- or definitions in order for the converted type to be well sorted or correct.
data ConvDeps =
    ConvDeps
        { convTyVars :: [TyVar] -- ^ Type variables for a known theory
        , convKdVars :: [TyVar] -- ^ Kind variables for unknown theories
        , convDefVar :: [TyVar] -- ^ Type variables for default, syntactic theories
        , convDecs   :: [Decl]  -- ^ SMT declarations specific to some converted type
        }

noDeps :: ConvDeps
noDeps = mempty

data Decl =
    Decl
        { decKey :: (String, String) -- ^ A unique identifier
        , localDec :: [String]       -- ^ A list of local declarations
        }
    deriving Show

type Hash = String

instance Semigroup ConvDeps where
    (ConvDeps a b c d) <> (ConvDeps e f g h) =
        ConvDeps (a ++ e) (b ++ f) (c ++ g) (d ++ h)

instance Monoid ConvDeps where
    mempty = ConvDeps [] [] [] []
    mappend = (<>)

convertType :: Type -> ConvMonad ConvertedType
convertType ty =
    case tyVarConv ty of
        Just (smtVar, tyvar) ->
            return
                ConvertedType
                    { convTyDesc = showSDocUnsafe $ ppr ty
                    , convTySmt = smtVar
                    , convTyDeps = noDeps{convTyVars = [tyvar]}
                    }
        Nothing -> tryConvTheory ty

tyVarConv :: Type -> Maybe (String, TyVar)
tyVarConv ty = do
    tyvar <- tcGetTyVar_maybe ty
    -- Not checking for skolems. See doc on "dumb tau variables"
    let isSkolem = True
    guard isSkolem
    return (showUnique tyvar, tyvar)

tryConvTheory :: Type -> ConvMonad ConvertedType
tryConvTheory ty = do
    EncodingData _ theories <- ask
    case tryFns (typeConvs theories) ty of
        Just (TyConvCont tys kds cont decs) -> do
            recurTys :: Vec _ ConvertedType <- traverse convertType tys
            recurKds :: Vec _ (String, [KdVar]) <- traverse convertKind kds
            (decls :: [Decl], decKds :: [KdVar]) <- convDecConts decs

            let convDescs :: Vec _ String = convTyDesc <$> recurTys
            let convTys :: Vec _ String = convTySmt <$> recurTys
            let convKds :: Vec _ String = fst <$> recurKds
            let converted :: String = cont convTys convKds

            let tyDeps :: ConvDeps = foldMap convTyDeps recurTys
            let kdVars :: [KdVar] = foldMap snd recurKds ++ decKds
            let deps :: ConvDeps = addDepParts tyDeps kdVars decls

            let name = foldMap (\case "" -> "_"; x -> x) convDescs
            return $ ConvertedType name converted deps

        Nothing -> defaultConvTy ty

addDepParts :: ConvDeps -> [KdVar] -> [Decl] -> ConvDeps
addDepParts (ConvDeps t k d decl) ks decls =
    ConvDeps t (k ++ ks) d (decl ++ decls)

convDecConts :: [DecCont] -> ConvMonad ([Decl], [KdVar])
convDecConts dcs = do
    decConts <- traverse convDecCont dcs
    let decls = fst <$> decConts
    let kdVars = concatMap snd decConts
    return (decls, kdVars)
    where
        convDecCont :: DecCont -> ConvMonad (Decl, [KdVar])
        convDecCont (DecCont kholes declName cont) = do
            recur <- traverse convertKind kholes
            let kConvs = fst <$> recur
            let declKey = (declName, fold kConvs)
            let kdVars = foldMap snd recur
            let decl = Decl declKey (cont kConvs)
            return (decl, kdVars)

defaultConvTy :: Type -> ConvMonad ConvertedType
defaultConvTy ty = do
    (convertedTy, defVars) <- lift (defConvTy ty)
    return
        ConvertedType
            { convTyDesc = showSDocUnsafe $ ppr ty
            , convTySmt = convertedTy
            , convTyDeps = noDeps{convDefVar = defVars}
            }

defConvTy :: Type -> Maybe (String, [TyVar])
defConvTy = tryFns [defTyVar, defFn, defTyConApp] where

    defTyVar :: Type -> Maybe (String, [TyVar])
    defTyVar ty = do
        tv <- getTyVar_maybe ty
        return (showUnique tv, [tv])

    defFn :: Type -> Maybe (String, [TyVar])
    defFn ty = do
#if __GLASGOW_HASKELL__ < 900
        (fn, arg) <- splitFunTy_maybe ty
#else
        (fn, arg, _) <- splitFunTy_maybe ty
#endif
        (fnStr, tv1) <- defConvTy fn
        (argStr, tv2) <- defConvTy arg
        return ([s|(apply (apply (lit "->") %s) %s)|] fnStr argStr, tv1 ++ tv2)

    defTyConApp :: Type -> Maybe (String, [TyVar])
    defTyConApp ty = do
        (tcon, tys) <- splitTyConApp_maybe ty
        recur <- traverse defConvTy tys
        let defConvTys = fst <$> recur
        let tvars = foldMap snd recur
        let convTcon = [s|(lit "%?")|] $ getUnique tcon
        let converted = foldl [s|(apply %s %s)|] convTcon defConvTys
        return (converted, tvars)

-- | Converts a Kind into a String and some kind variables
convertKind :: Kind -> ConvMonad (String, [KdVar])
convertKind kind =
    case getTyVar_maybe kind of
        Just tvar -> return ([s|Sort%?|] $ getUnique tvar, [tvar])
        Nothing -> convKindTheories kind

convKindTheories :: Kind -> ConvMonad (String, [KdVar])
convKindTheories kind = do
    EncodingData _ theories <- ask
    case tryFns (kindConvs theories) kind of
        Nothing -> return ("Type", []) -- Kind defaulting
        Just (KdConvCont kholes kContin) -> do
            recur <- traverse convertKind kholes
            let convHoles = fst <$> recur
            let holeVars = foldMap snd recur
            return (kContin convHoles, holeVars)

-- | In order, try the functions.
tryFns :: [a -> Maybe b] -> a -> Maybe b
tryFns [] _ = Nothing
tryFns (f : fs) a = case f a of
    Nothing -> tryFns fs a
    Just b -> Just b

justReadSExpr :: String -> SExpr
justReadSExpr sexpr =
    case SMT.readSExpr sexpr of
        Just (e, _) -> e
        Nothing -> error $ "Could not parse SExpr: " ++ sexpr