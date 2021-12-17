let defs = ./../defaults.dhall

in  let testopts = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { name = "uom-quantity"
          , synopsis = "Units of measure as a GHC typechecker plugin"
          , description =
              ''
              The @uom-plugin@ library adds support for units of measure to GHC
              using the new experimental facility for typechecker plugins, which
              is available in GHC 7.10 and later.  See
              "Data.UnitsOfMeasure.Tutorial" for an introduction to the library.''
          , category = "Type System"
          , github = "adamgundry/uom-plugin"
          , license = "BSD3"
          , license-file = "LICENSE"
          , stability = "experimental"
          , extra-source-files = [ "README.md", "LICENSE" ]
          , library =
            { source-dirs = [ "src" ]
            , dependencies =
                  defs.dependencies
                # [ "deepseq >=1.3 && <1.5"
                  , "template-haskell >=2.9"
                  , "containers >=0.5"
                  , "ghc-corroborate"
                  , "units-parser >=0.1.1.4"
                  ]
            , exposed-modules =
              [ "GHC.Corroborate.Type"
              , "Data.Theory.UoM"
              , "Data.UnitsOfMeasure.Read"
              , "Data.UnitsOfMeasure.Show"
              , "Data.UnitsOfMeasure.Singleton"
              , "Data.UnitsOfMeasure.Syntax"
              , "Data.UnitsOfMeasure.Unsafe.Convert"
              , "Data.UnitsOfMeasure.Unsafe.Unify"
              , "Data.UnitsOfMeasure.Unsafe.NormalForm"
              , "Data.UnitsOfMeasure.Unsafe.Quantity"
              ]
            , other-modules = [] : List Text
            }
          , when =
            [ { condition = "impl(ghc >= 9.2) && impl(ghc < 9.4)"
              , source-dirs = "src-ghc-9.0"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=9.2 && <9.4"
                  , mixin = [] : List Text
                  }
                ]
              }
            , { condition = "impl(ghc >= 9.0) && impl(ghc < 9.2)"
              , source-dirs = "src-ghc-9.0"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=9.0 && <9.2"
                  , mixin = [] : List Text
                  }
                ]
              }
            , { condition = "impl(ghc >= 8.10.0) && impl(ghc < 9.0)"
              , source-dirs = "src-ghc-8.10"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=8.10 && <8.12"
                  , mixin = [] : List Text
                  }
                ]
              }
            , { condition = "impl(ghc >= 8.8.0) && impl(ghc < 8.10.0)"
              , source-dirs = "src-ghc-8.8"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=8.8 && <8.10"
                  , mixin =
                    [ "hiding ()"
                    , "(TcRnTypes as TcRnTypes)"
                    , "(Type as Type)"
                    , "(TcRnTypes as Constraint)"
                    , "(Type as Predicate)"
                    ]
                  }
                ]
              }
            , { condition = "impl(ghc >= 8.6.0) && impl(ghc < 8.8.0)"
              , source-dirs = "src-ghc-8.6"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=8.6 && <8.8"
                  , mixin =
                    [ "hiding ()"
                    , "(TcRnTypes as TcRnTypes)"
                    , "(Type as Type)"
                    , "(TcRnTypes as Constraint)"
                    , "(Type as Predicate)"
                    ]
                  }
                ]
              }
            , { condition = "impl(ghc >= 8.4.0) && impl(ghc < 8.6.0)"
              , source-dirs = "src-ghc-8.4"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=8.4 && <8.6"
                  , mixin =
                    [ "hiding ()"
                    , "(TcRnTypes as TcRnTypes)"
                    , "(Type as Type)"
                    , "(TcRnTypes as Constraint)"
                    , "(Type as Predicate)"
                    ]
                  }
                ]
              }
            , { condition = "impl(ghc >= 8.2.0) && impl(ghc < 8.4.0)"
              , source-dirs = "src-ghc-8.2"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=8.2 && <8.4"
                  , mixin =
                    [ "hiding ()"
                    , "(TcRnTypes as TcRnTypes)"
                    , "(Type as Type)"
                    , "(TcRnTypes as Constraint)"
                    , "(Type as Predicate)"
                    ]
                  }
                ]
              }
            , { condition = "impl(ghc >= 8.0.0) && impl(ghc < 8.2.0)"
              , source-dirs = "src-ghc-8.0"
              , dependencies =
                [ { name = "ghc"
                  , version = ">=8.0 && <8.2"
                  , mixin =
                    [ "hiding ()"
                    , "(TcRnTypes as TcRnTypes)"
                    , "(Type as Type)"
                    , "(TcRnTypes as Constraint)"
                    , "(Type as Predicate)"
                    ]
                  }
                ]
              }
            ]
          , tests.doctest
            =
            { dependencies =
                  defs.dependencies
                # [ "deepseq >=1.3 && <1.5"
                  , "template-haskell >=2.9"
                  , "containers >=0.5"
                  , "ghc-corroborate"
                  , "units-parser >=0.1"
                  , "doctest"
                  , "QuickCheck"
                  ]
            , ghc-options = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]
            , main = "DocTest.hs"
            , source-dirs = [ "src", "test-suite-doctest" ]
            }
          }
