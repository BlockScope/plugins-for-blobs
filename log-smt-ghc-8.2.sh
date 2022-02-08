cabal clean
cabal build thoralf-plugin-rows --verbose=0 > smt2/ghc-8.2/thoralf-plugin-rows.smt2
cabal build thoralf-plugin-defs --verbose=0 > smt2/ghc-8.2/thoralf-plugin-defs.smt2
cabal build thoralf-plugin-uom:defs --verbose=0 > smt2/ghc-8.2/thoralf-plugin-uom-defs.smt2
cabal build thoralf-plugin-uom:force --verbose=0 > smt2/ghc-8.2/thoralf-plugin-uom-force.smt2
cabal build thoralf-plugin-uom:uom-diy --verbose=0 > smt2/ghc-8.2/thoralf-plugin-uom-diy.smt2
cabal build thoralf-plugin-uom:uom-quantity --verbose=0 > smt2/ghc-8.2/thoralf-plugin-uom-quantity.smt2
cabal build thoralf-plugin-uom:units --verbose=0 > smt2/ghc-8.2/thoralf-plugin-uom-units.smt2