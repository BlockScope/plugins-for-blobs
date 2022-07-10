module ThoralfPlugin.Extract
    ( extractEq
    , extractDisEq
    , maybeExtractTyDisEq
    , maybeExtractTyEq
    ) where

import Data.Maybe (mapMaybe)
import Control.Monad.Reader (guard)
import GHC.Corroborate

extractEq :: [Ct] -> [((Type, Type), Ct)]
extractEq = mapMaybe maybeExtractTyEq

extractDisEq :: Class -> [Ct] -> [((Type, Type), Ct)]
extractDisEq cls = mapMaybe (maybeExtractTyDisEq cls)

maybeExtractTyDisEq :: Class -> Ct -> Maybe ((Type, Type), Ct)
maybeExtractTyDisEq disEqCls ct = do
    ClassPred class' (_: t1 : t2 : _) <- return (classifyPredType $ ctPred ct)
    guard (class' == disEqCls)
    return ((t1, t2), ct)

maybeExtractTyEq :: Ct -> Maybe ((Type, Type), Ct)
maybeExtractTyEq ct =
    case classifyPredType $ ctPred ct of
        EqPred NomEq t1 t2 -> return ((t1, t2), ct)
        _ -> Nothing