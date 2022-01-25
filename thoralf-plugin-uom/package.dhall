let defs = ./defaults.dhall

in  let testopts = [ "-Wall", "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { name = "thoralf-plugin-uom"
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
              [ "Plugins.Thoralf.DisEq"
              , "Plugins.Thoralf.DisEq.TcPlugin"
              , "Plugins.Thoralf.UoM"
              , "Data.UnitsOfMeasure.Constraint"
              , "ThoralfPlugin.Singletons.Nat"
              ]
            , other-modules =
              [ "ThoralfPlugin.Encode", "ThoralfPlugin.Encode.UoM" ]
            , other-extensions =
              [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
            , when =
              { condition = "impl(ghc >= 8.10.1)"
              , `then`.source-dirs = "src-StandaloneKindSignatures"
              , `else`.source-dirs = "src-NoStandaloneKindSignatures"
              }
            }
          , tests =
            { uom-diy =
              { dependencies =
                [ "base"
                , "QuickCheck"
                , "singletons"
                , "template-haskell"
                , "tasty"
                , "tasty-hunit"
                , "tasty-quickcheck"
                , "tasty-th"
                , "thoralf-plugin-uom"
                , "uom-quantity"
                , "uom-th"
                ]
              , ghc-options = testopts
              , other-modules = [ "UoM" ]
              , main = "Main.hs"
              , source-dirs = "test-suite-uom-diy"
              }
            , uom-quantity =
              { dependencies =
                [ "base"
                , "QuickCheck"
                , "singletons"
                , "template-haskell"
                , "tasty"
                , "tasty-hunit"
                , "tasty-quickcheck"
                , "tasty-th"
                , "thoralf-plugin-uom"
                , "uom-quantity"
                , "uom-th"
                ]
              , ghc-options = testopts
              , other-modules = [ "Defs", "UoM" ]
              , main = "Main.hs"
              , source-dirs = "test-suite-uom-quantity"
              }
            , defs =
              { dependencies =
                [ "base"
                , "tasty"
                , "tasty-hunit"
                , "uom-quantity"
                , "uom-th"
                , "thoralf-plugin-uom"
                ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules = [ "Defs" ]
              , source-dirs = "test-suite-defs"
              }
            , force =
              { dependencies =
                [ "base"
                , "tasty"
                , "tasty-hunit"
                , "uom-quantity"
                , "uom-th"
                , "thoralf-plugin-uom"
                ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules = [ "UnitDefs" ]
              , source-dirs = "test-suite-force"
              }
            , units =
              { dependencies =
                [ "base"
                , "tasty"
                , "tasty-hunit"
                , "thoralf-plugin-uom"
                , "uom-quantity"
                , "uom-th"
                ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules =
                [ "Abelian", "Defs", "UnitDefs", "UnitDefsTests", "UnQuantity" ]
              , source-dirs = "test-suite-units"
              , when =
                [ { condition = "impl(ghc >= 9.2) && impl(ghc < 9.4)"
                  , source-dirs = [ "test-suite-units-ghc-9.2" ]
                  , other-modules = [ "ErrorTests", "ErrorTestGroups" ]
                  , buildable = True
                  }
                , { condition = "impl(ghc >= 8.2) && impl(ghc < 9.2)"
                  , source-dirs = [ "test-suite-units-ghc-8.2" ]
                  , other-modules = [ "ErrorTests", "ErrorTestGroups" ]
                  , buildable = True
                  }
                ]
              }
            }
          }
