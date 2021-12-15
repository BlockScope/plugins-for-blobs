let defs = ./../defaults.dhall

in  let testopts = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

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
            { source-dirs = [ "doc", "src" ]
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
              [ "Data.UnitsOfMeasure"
              , "Data.UnitsOfMeasure.Convert"
              , "Data.UnitsOfMeasure.Tutorial"
              , "Plugins.UoM"
              ]
            , other-modules = [ "Plugins.UoM.TcPlugin" ]
            }
          , tests =
            { defs =
              { dependencies =
                [ "base", "tasty", "tasty-hunit", "uom-quantity", "uom-plugin" ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules = [ "Defs" ]
              , source-dirs = "test-suite-defs"
              , when = { condition = "impl(ghc >= 8.4.0)", buildable = False }
              }
            , units =
              { dependencies =
                [ "base", "tasty", "tasty-hunit", "uom-quantity", "uom-plugin" ]
              , ghc-options = testopts
              , main = "Tests.hs"
              , other-modules =
                [ "Data.UnitsOfMeasure.Defs", "Defs", "ErrorTests", "Z" ]
              , source-dirs = "test-suite-units"
              , when = { condition = "impl(ghc >= 8.4.0)", buildable = False }
              }
            , hlint =
              { dependencies = "base"
              , ghc-options = testopts
              , main = "HLint.hs"
              , source-dirs = "test-suite-hlint"
              , when =
                [ { condition = "impl(ghc >= 9.0.0)"
                  , dependencies = "hlint >= 3.3.4"
                  , buildable = True
                  }
                , { condition = "impl(ghc >= 8.10.0) && impl(ghc < 9.0.0)"
                  , dependencies = "hlint >= 3.2.7"
                  , buildable = True
                  }
                , { condition = "impl(ghc >= 8.8.0) && impl(ghc < 8.10.0)"
                  , dependencies = "hlint >= 3.1.6"
                  , buildable = True
                  }
                , { condition = "impl(ghc >= 8.6.0) && impl(ghc < 8.8.0)"
                  , dependencies = "hlint >= 2.1.26"
                  , buildable = True
                  }
                , { condition = "impl(ghc >= 8.4.0) && impl(ghc < 8.6.0)"
                  , dependencies = "hlint >= 2.1.11"
                  , buildable = True
                  }
                , { condition = "impl(ghc < 8.4.0)"
                  , dependencies = "hlint <= 2.1.10"
                  , buildable = False
                  }
                ]
              }
            }
          }
