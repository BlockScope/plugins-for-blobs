let defs = ./defaults.dhall

in  let testopts = [ "-Wall", "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { name = "smt-uom-plugin"
          , synopsis = "An extensible GHC typechecker plugin based on Z3"
          , description =
              ''
              Thoralf is a small yet extensible typechecker plugin based on the
              Z3 SMT solver. It is designed to be easy to extend with new
              theories.
              ''
          , category = "Development"
          , github = "bgamari/the-thoralf-plugin/thoralf"
          , ghc-options = [ "-Wall", "-fno-warn-partial-type-signatures" ]
          , dependencies =
                defs.dependencies
              # [ "containers"
                , "ghc-tcplugins-extra"
                , "ghc-tcplugins-trace"
                , "ghc-corroborate"
                , "template-haskell >=2.9"
                , "ghc-prim"
                , "hashable"
                , "mtl"
                , "simple-smt"
                , "th-printf"
                , "uom-quantity"
                , "uom-th"
                , "units-parser >=0.1.1.4"
                , "thoralf-theory"
                , "thoralf-encode"
                , "thoralf-plugin"
                ]
          , library =
            { source-dirs = "src"
            , exposed-modules =
              [ "Plugins.Thoralf.UoM"
              , "ThoralfPlugin.Singletons.Symbol"
              , "ThoralfPlugin.Singletons.Nat"
              ]
            , other-modules = [ "ThoralfPlugin.Encode" ]
            , other-extensions =
              [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
            }
          , tests =
            { uom =
              { dependencies =
                [ "base"
                , "QuickCheck"
                , "singletons"
                , "template-haskell"
                , "tasty"
                , "tasty-hunit"
                , "tasty-quickcheck"
                , "tasty-th"
                , "smt-uom-plugin"
                , "uom-quantity"
                , "uom-th"
                ]
              , ghc-options = testopts
              , other-modules = [ "UoM" ]
              , main = "Main.hs"
              , source-dirs = "test-suite-uom"
              }
            , defs =
              { dependencies =
                [ "base"
                , "tasty"
                , "tasty-hunit"
                , "uom-quantity"
                , "uom-th"
                , "smt-uom-plugin"
                ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules = [ "Defs" ]
              , source-dirs = "test-suite-defs"
              }
            , units =
              { dependencies =
                [ "base"
                , "tasty"
                , "tasty-hunit"
                , "smt-uom-plugin"
                , "uom-quantity"
                , "uom-th"
                ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules = [ "Plugins.Thoralf.UnitDefs", "Defs" ]
              , source-dirs = "test-suite-units"
              }
            }
          }
