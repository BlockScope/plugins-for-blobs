let defs = ./defaults.dhall

in  let testopts = [ "-Wall", "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { name = "thoralf-plugin-rows"
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
                , "thoralf-theory"
                , "thoralf-encode"
                , "thoralf-plugin"
                ]
          , library =
            { source-dirs = "src"
            , exposed-modules =
              [ "Plugins.Thoralf.Rows", "Data.Theory.FiniteMap" ]
            , other-modules =
              [ "ThoralfPlugin.Encode", "ThoralfPlugin.Encode.FiniteMap" ]
            , other-extensions =
              [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
            }
          , tests.rows
            =
            { dependencies = [ "base", "thoralf-plugin-rows" ]
            , ghc-options = testopts # [ "-fplugin Plugins.Thoralf.Rows" ]
            , other-modules = [ "FiniteMaps", "Nat", "RowTypes" ]
            , main = "Main.hs"
            , source-dirs = "test-suite-rows"
            }
          }