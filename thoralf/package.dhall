    let defs = ./defaults.dhall

in  let testopts = [ "-Wall", "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

in    defs
    ⫽ { name =
          "thoralf-plugin"
      , synopsis =
          "An extensible GHC typechecker plugin based on Z3"
      , description =
          ''
          Thoralf is a small yet extensible typechecker plugin based on the
          Z3 SMT solver. It is designed to be easy to extend with new
          theories.
          ''
      , category =
          "Development"
      , github =
          "bgamari/the-thoralf-plugin/thoralf"
      , ghc-options =
          [ "-Wall", "-fno-warn-partial-type-signatures" ]
      , dependencies =
            defs.dependencies
          # [ "containers"
            , "ghc-tcplugins-extra >=0.5"
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
            , "units-parser >=0.1"
            ]
      , library =
          { source-dirs =
              "src"
          , exposed-modules =
              [ "Data.Theory.Bool"
              , "Data.Theory.DisEq"
              , "Data.Theory.FiniteMap"
              , "Data.UnitsOfMeasure"
              , "Data.UnitsOfMeasure.Constraint"
              , "Plugins.Thoralf"
              , "Plugins.Thoralf.TcPlugin"
              , "ThoralfPlugin.Convert"
              , "ThoralfPlugin.Variables"
              , "ThoralfPlugin.Singletons.Symbol"
              , "ThoralfPlugin.Singletons.Nat"
              ]
          , other-modules =
              [ "ThoralfPlugin.Encode"
              , "ThoralfPlugin.Encode.Convert"
              , "ThoralfPlugin.Encode.Find"
              , "ThoralfPlugin.Encode.TheoryEncoding"
              , "ThoralfPlugin.Encode.Nat"
              , "ThoralfPlugin.Encode.FiniteMap"
              , "ThoralfPlugin.Encode.Symbol"
              , "ThoralfPlugin.Encode.UoM"
              , "ThoralfPlugin.Encode.Bool"
              , "Plugins.Print.SMT"
              , "Plugins.Thoralf.Print"
              , "Data.Vec"
              ]
          , other-extensions =
              [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
          }
      , tests =
          { rows =
              { dependencies =
                  [ "base", "thoralf-plugin" ]
              , ghc-options =
                  testopts # [ "-fplugin Plugins.Thoralf" ]
              , other-modules =
                  [ "FiniteMaps", "Nat", "RowTypes" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "test-suite-rows"
              }
          , uom =
              { dependencies =
                  [ "base"
                  , "QuickCheck"
                  , "singletons"
                  , "template-haskell"
                  , "tasty"
                  , "tasty-hunit"
                  , "tasty-quickcheck"
                  , "tasty-th"
                  , "thoralf-plugin"
                  , "uom-quantity"
                  , "uom-th"
                  ]
              , ghc-options =
                  testopts
              , other-modules =
                  [ "UoM" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "test-suite-uom"
              }
          , defs =
              { dependencies =
                  [ "base"
                  , "tasty"
                  , "tasty-hunit"
                  , "uom-quantity"
                  , "thoralf-plugin"
                  ]
              , ghc-options =
                  testopts
              , main =
                  "Tests.hs"
              , other-modules =
                  [ "Defs" ]
              , source-dirs =
                  "test-suite-defs"
              }
          , units =
              { dependencies =
                  [ "base"
                  , "tasty"
                  , "tasty-hunit"
                  , "uom-quantity"
                  , "thoralf-plugin"
                  ]
              , ghc-options =
                  testopts
              , main =
                  "Tests.hs"
              , other-modules =
                  [ "Data.UnitsOfMeasure.Defs", "Defs" ]
              , source-dirs =
                  "test-suite-units"
              }
          , hlint =
              { dependencies =
                  "base"
              , ghc-options =
                  testopts
              , main =
                  "HLint.hs"
              , source-dirs =
                  "test-suite-hlint"
              , when =
                  [ { condition =
                        "impl(ghc >= 8.6.0)"
                    , dependencies =
                        "hlint"
                    , buildable =
                        True
                    }
                  , { condition =
                        "impl(ghc >= 8.4.0) && impl(ghc < 8.6.0)"
                    , dependencies =
                        "hlint < 2.1.18"
                    , buildable =
                        True
                    }
                  , { condition =
                        "impl(ghc < 8.4.0)"
                    , dependencies =
                        "hlint"
                    , buildable =
                        False
                    }
                  ]
              }
          }
      }
