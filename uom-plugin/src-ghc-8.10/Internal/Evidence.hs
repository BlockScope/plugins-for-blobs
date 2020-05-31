module Internal.Evidence (evDFunApp', evCast', terms) where

import Internal

evDFunApp' :: DFunId -> [Type] -> [EvExpr] -> EvTerm
evDFunApp' f ts es = evDFunApp f ts es

evCast' :: EvTerm -> TcCoercion -> EvTerm
evCast' (EvExpr e)  = evCast e
evCast' (EvTypeable _ _) = error "Can't evCast (EvTypeable _ _)"
evCast' (EvFun _ _ _ _) = error "Can't evCast (EvFun _ _ _ _)"

terms :: Type -> Type -> [EvExpr]
terms t1 t2 = [let (EvExpr e) = evByFiat "units" t1 t2 in e]
