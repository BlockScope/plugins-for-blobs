λ(src : Text) →
λ(prefix : Text) →
  let defs = ./../defaults-thoralf.dhall

  in  let testopts = [ "-Wall", "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

      in    defs
          ⫽ { name = "thoralf-theory"
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
                  ]
            , library =
              { source-dirs = "${src}src"
              , exposed-modules = [ "Data.Theory.Bool", "Data.Theory.DisEq" ]
              , other-modules = [] : List Text
              , other-extensions =
                [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
              , when =
                { condition = "impl(ghc >= 8.10.1)"
                , `then`.source-dirs = "${src}src-StandaloneKindSignatures"
                , `else`.source-dirs = "${src}src-NoStandaloneKindSignatures"
                }
              }
            }
