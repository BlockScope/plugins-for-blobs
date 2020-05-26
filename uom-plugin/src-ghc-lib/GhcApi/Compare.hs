module GhcApi.Compare
  ( -- * GHC API changes
    cmpType
  , cmpTypes
  , cmpTyCon
  ) where

import GhcApi

cmpTyCon :: TyCon -> TyCon -> Ordering
cmpTyCon a b = getUnique a `nonDetCmpUnique` getUnique b

cmpType :: Type -> Type -> Ordering
cmpType = nonDetCmpType

cmpTypes :: [Type] -> [Type] -> Ordering
cmpTypes = nonDetCmpTypes
