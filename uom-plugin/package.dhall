let defs = ./../defaults.dhall

in  let testopts = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in  let units-test =
              { dependencies =
                [ "base"
                , "tasty"
                , "tasty-hunit"
                , "uom-quantity"
                , "uom-th"
                , "uom-plugin"
                ]
              , main = "Tests.hs"
              , other-modules =
                [ "Abelian"
                , "Basic"
                , "DelayEq"
                , "Literal"
                , "UnitDefs"
                , "UnitDefsTests"
                , "UnQuantity"
                , "Z"
                ]
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
                , { condition = "impl(ghc >= 8.4) && impl(ghc < 9.2)"
                  , source-dirs = [] : List Text
                  , other-modules = [] : List Text
                  , buildable = False
                  }
                ]
              }

        in    defs
            ⫽ { name = "uom-plugin"
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
              , extra-source-files = [ "CHANGELOG.md", "README.md", "LICENSE" ]
              , library =
                { source-dirs = [ "src" ]
                , dependencies =
                      defs.dependencies
                    # [ "containers >=0.5"
                      , "deepseq >=1.3 && <1.5"
                      , "ghc-tcplugins-extra"
                      , "ghc-tcplugins-trace"
                      , "ghc-corroborate"
                      , "template-haskell >=2.9"
                      , "th-printf"
                      , "uom-quantity"
                      , "uom-th"
                      , "units-parser >=0.1.1.4"
                      ]
                , exposed-modules =
                  [ "Data.UnitsOfMeasure.Convert"
                  , "Data.UnitsOfMeasure.Tutorial"
                  , "Plugins.UoM.Solve"
                  , "Plugins.UoM.Simplify"
                  , "Plugins.UoM"
                  ]
                , other-modules =
                  [ "Plugins.UoM.Simplify.TcPlugin"
                  , "Plugins.UoM.Solve.TcPlugin"
                  , "Plugins.UoM.TcPlugin"
                  ]
                , when =
                  [ { condition = "impl(ghc >= 9.2) && impl(ghc < 9.4)"
                    , source-dirs = [ "doc-ghc-9.2" ]
                    }
                  , { condition = "impl(ghc >= 8.2) && impl(ghc < 9.2)"
                    , source-dirs = [ "doc-ghc-8.2" ]
                    }
                  ]
                }
              , tests =
                { defs =
                  { dependencies =
                    [ "base"
                    , "tasty"
                    , "tasty-hunit"
                    , "uom-quantity"
                    , "uom-th"
                    , "uom-plugin"
                    ]
                  , ghc-options = testopts
                  , main = "Tests.hs"
                  , other-modules = [ "Defs" ]
                  , source-dirs = "test-suite-defs"
                  , when =
                    { condition = "impl(ghc >= 8.4) && impl(ghc < 9.2)"
                    , buildable = False
                    }
                  }
                , units =
                      units-test
                    ⫽ { ghc-options = testopts # [ "-fplugin=Plugins.UoM" ] }
                , unpack-solve =
                      units-test
                    ⫽ { ghc-options =
                            testopts
                          # [ "-fplugin=Plugins.UoM.Unpack"
                            , "-fplugin=Plugins.UoM.Solve"
                            ]
                      }
                , force =
                  { dependencies =
                    [ "base"
                    , "tasty"
                    , "tasty-hunit"
                    , "uom-quantity"
                    , "uom-th"
                    , "uom-plugin"
                    ]
                  , ghc-options = testopts
                  , main = "Tests.hs"
                  , other-modules = [ "UnitDefs" ]
                  , source-dirs = "test-suite-force"
                  , when =
                    { condition = "impl(ghc >= 8.4) && impl(ghc < 9.2)"
                    , buildable = False
                    }
                  }
                }
              }
