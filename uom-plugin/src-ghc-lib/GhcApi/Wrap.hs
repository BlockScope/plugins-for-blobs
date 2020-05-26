module GhcApi.Wrap
  ( -- * Wrappers
    newUnique
  , newWantedCt
  , newGivenCt
  ) where

import GhcApi
    {-
  ( Ct, CtLoc, TcPluginM, EvTerm, PredType
  , mkNonCanonical
  , newUnique
  )
  -}
import GHC.TcPluginM.Extra (newGiven, newWanted)

newWantedCt :: CtLoc -> PredType -> TcPluginM Ct
newWantedCt loc = fmap mkNonCanonical . newWanted loc

newGivenCt :: CtLoc -> PredType -> EvTerm -> TcPluginM Ct
newGivenCt loc prd ev = mkNonCanonical <$> newGiven loc prd ev
