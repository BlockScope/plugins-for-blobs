λ(hie : Text) →
λ(src : Text) →
λ(prefix : Text) →
  let defs = ./../defaults-blobs.dhall hie

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
                  , "th-printf >=0.7"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  , "units-parser >=0.1.1.4"
                  , "${prefix}thoralf-theory"
                  , "${prefix}thoralf-encode"
                  , "${prefix}thoralf-plugin"
                  ]
            , library =
              { source-dirs = "${src}src"
              , exposed-modules =
                [ "Plugins.Thoralf.UoM"
                , "Plugins.Thoralf.UoM.Solve"
                , "Data.UnitsOfMeasure.Constraint"
                , "ThoralfPlugin.Singletons.Nat"
                ]
              , other-modules =
                [ "ThoralfPlugin.Encode"
                , "ThoralfPlugin.Encode.UoM"
                , "Plugins.Thoralf.UoM.TcPlugin"
                ]
              , other-extensions =
                [ "TypeFamilies", "TypeInType", "GADTs", "RecordWildCards" ]
              , when =
                { condition = "impl(ghc >= 8.10.1)"
                , `then`.source-dirs = "${src}src-StandaloneKindSignatures"
                , `else`.source-dirs = "${src}src-NoStandaloneKindSignatures"
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
                  , "${prefix}thoralf-plugin-uom"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  ]
                , ghc-options = testopts
                , other-modules = [ "UoM" ]
                , main = "Main.hs"
                , source-dirs = "${src}test-suite-uom-diy"
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
                  , "${prefix}thoralf-plugin-uom"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  ]
                , ghc-options = testopts
                , other-modules = [ "Defs", "UoM" ]
                , main = "Main.hs"
                , source-dirs = "${src}test-suite-uom-quantity"
                }
              , defs =
                { dependencies =
                  [ "base"
                  , "tasty"
                  , "tasty-hunit"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  , "${prefix}thoralf-plugin-uom"
                  ]
                , ghc-options = testopts
                , main = "Tests.hs"
                , other-modules = [ "Defs" ]
                , source-dirs = "${src}test-suite-defs"
                }
              , force =
                { dependencies =
                  [ "base"
                  , "tasty"
                  , "tasty-hunit"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  , "${prefix}thoralf-plugin-uom"
                  ]
                , ghc-options = testopts
                , main = "Tests.hs"
                , other-modules = [ "UnitDefs" ]
                , source-dirs = "${src}test-suite-force"
                }
              , delay-eq =
                { dependencies =
                  [ "base"
                  , "tasty"
                  , "tasty-hunit"
                  , "${prefix}thoralf-plugin-uom"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  ]
                , ghc-options = testopts
                , main = "Tests.hs"
                , other-modules = [ "UnitDefs" ]
                , source-dirs = "${src}test-suite-delay-eq"
                }
              , units =
                { dependencies =
                  [ "base"
                  , "tasty"
                  , "tasty-hunit"
                  , "${prefix}thoralf-plugin-uom"
                  , "${prefix}uom-quantity"
                  , "${prefix}uom-th"
                  ]
                , ghc-options = testopts
                , main = "Tests.hs"
                , other-modules =
                  [ "Abelian"
                  , "Defs"
                  , "DelayEq"
                  , "Literal"
                  , "UnitDefs"
                  , "UnitDefsTests"
                  , "UnQuantity"
                  ]
                , source-dirs = "${src}test-suite-units"
                , when =
                  [ { condition = "impl(ghc >= 9.2) && impl(ghc < 9.4)"
                    , source-dirs = [ "${src}test-suite-units-ghc-9.2" ]
                    , other-modules =
                      [ "Basic", "ErrorTests", "ErrorTestGroups" ]
                    , buildable = True
                    }
                  , { condition = "impl(ghc >= 8.4) && impl(ghc < 9.2)"
                    , source-dirs = [ "${src}test-suite-units-ghc-8.4" ]
                    , other-modules =
                      [ "Basic", "ErrorTests", "ErrorTestGroups" ]
                    , buildable = True
                    }
                  , { condition = "impl(ghc >= 8.2) && impl(ghc < 8.4)"
                    , source-dirs = [ "${src}test-suite-units-ghc-8.2" ]
                    , other-modules =
                      [ "Basic", "ErrorTests", "ErrorTestGroups" ]
                    , buildable = True
                    }
                  ]
                }
              }
            }
