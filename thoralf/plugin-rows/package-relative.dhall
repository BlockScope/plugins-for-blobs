λ(src : Text) →
λ(prefix : Text) →
  let defs = ./../defaults-thoralf.dhall

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
            , ghc-options = [ "-Wall", "-Wno-partial-type-signatures" ]
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
                  , "th-printf >=0.7"
                  , "${prefix}thoralf-theory"
                  , "${prefix}thoralf-encode"
                  , "${prefix}thoralf-plugin"
                  ]
            , library =
              { source-dirs = "${src}src"
              , exposed-modules =
                [ "Plugins.Thoralf.Rows", "Data.Theory.FiniteMap" ]
              , other-modules =
                [ "ThoralfPlugin.Encode", "ThoralfPlugin.Encode.FiniteMap" ]
              , other-extensions =
                [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
              , when =
                { condition = "impl(ghc >= 8.10.1)"
                , `then`.source-dirs = "${src}src-StandaloneKindSignatures"
                , `else`.source-dirs = "${src}src-NoStandaloneKindSignatures"
                }
              }
            , tests.rows
              =
              { dependencies = [ "base", "${prefix}thoralf-plugin-rows" ]
              , ghc-options = testopts # [ "-fplugin Plugins.Thoralf.Rows" ]
              , other-modules = [ "FiniteMaps", "Nat", "RowTypes" ]
              , main = "Main.hs"
              , source-dirs = "${src}test-suite-rows"
              }
            }
