    let defs = ./defaults.dhall

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
            , "ghc-corroborate"
            , "ghc-prim"
            , "hashable"
            , "mtl"
            , "simple-smt"
            ]
      , library =
          { source-dirs =
              "src"
          , exposed-modules =
              [ "ThoralfPlugin.Convert"
              , "ThoralfPlugin.Variables"
              , "ThoralfPlugin.Singletons.Symbol"
              , "ThoralfPlugin.Singletons.Nat"
              , "ThoralfPlugin.Theory.DisEq"
              , "ThoralfPlugin.Theory.FiniteMap"
              , "ThoralfPlugin.Theory.UoM"
              , "ThoralfPlugin.Theory.Bool"
              , "Plugins.Thoralf"
              , "Plugins.Thoralf.TcPlugin"
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
                  [ "-Wall", "-fplugin Plugins.Thoralf" ]
              , other-modules =
                  [ "FiniteMaps", "Nat", "RowTypes" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "test-suite-rows"
              }
          , units =
              { dependencies =
                  [ "base"
                  , "QuickCheck"
                  , "singletons"
                  , "thoralf-plugin"
                  , "template-haskell"
                  , "tasty"
                  , "tasty-hunit"
                  , "tasty-quickcheck"
                  , "tasty-th"
                  ]
              , ghc-options =
                  [ "-Wall", "-fplugin Plugins.Thoralf" ]
              , other-modules =
                  [ "UoM" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "test-suite-units"
              }
          , hlint =
              { dependencies =
                  [ "base", "hlint" ]
              , ghc-options =
                  [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]
              , main =
                  "HLint.hs"
              , source-dirs =
                  "test-suite-hlint"
              }
          }
      }
