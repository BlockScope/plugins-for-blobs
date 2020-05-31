module Internal.Compare
  ( -- * GHC API changes
    cmpTyCon
  , cmpType
  , cmpTypes
  ) where

import Internal

cmpTyCon :: TyCon -> TyCon -> Ordering
cmpTyCon a b = getUnique a `nonDetCmpUnique` getUnique b

cmpType :: Type -> Type -> Ordering
cmpType = nonDetCmpType

cmpTypes :: [Type] -> [Type] -> Ordering
cmpTypes = nonDetCmpTypes
