let defs = ./../defaults.dhall

in  let testopts = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { name = "uom-th"
          , synopsis = "Conversions and TH for units of measure"
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
            { source-dirs = "src"
            , dependencies =
                  defs.dependencies
                # [ "containers >=0.5"
                  , "deepseq >=1.3 && <1.5"
                  , "ghc-tcplugins-extra >=0.5"
                  , "ghc-corroborate"
                  , "template-haskell >=2.9"
                  , "th-printf"
                  , "uom-quantity"
                  , "units-parser >=0.1.1.4"
                  ]
            , exposed-modules =
              [ "Data.UnitsOfMeasure.Canonical", "Data.UnitsOfMeasure.TH" ]
            , other-modules = [] : List Text
            }
          , tests.hlint
            =
            { dependencies = "base"
            , ghc-options = testopts
            , main = "HLint.hs"
            , source-dirs = "test-suite-hlint"
            , when =
              [ { condition = "impl(ghc >= 8.6.0)"
                , dependencies = "hlint"
                , buildable = True
                }
              , { condition = "impl(ghc >= 8.4.0) && impl(ghc < 8.6.0)"
                , dependencies = "hlint < 2.1.18"
                , buildable = True
                }
              , { condition = "impl(ghc < 8.4.0)"
                , dependencies = "hlint"
                , buildable = False
                }
              ]
            }
          }
