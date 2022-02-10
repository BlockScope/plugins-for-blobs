let defs = ./../defaults-uom.dhall

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
      , stability = "experimental"
      , extra-source-files =
          defs.extra-source-files # [ "CHANGELOG.md", "README.md" ]
      , library =
        { source-dirs = "src"
        , dependencies =
              defs.dependencies
            # [ "containers >=0.5"
              , "deepseq >=1.3 && <1.5"
              , "ghc-tcplugins-extra"
              , "ghc-corroborate"
              , "template-haskell >=2.9"
              , "th-printf >=0.7"
              , "uom-quantity"
              , "units-parser >=0.1.1.4"
              ]
        , exposed-modules =
          [ "Data.UnitsOfMeasure.Canonical", "Data.UnitsOfMeasure.TH" ]
        , other-modules = [] : List Text
        , when =
          { condition = "impl(ghc >= 8.10.1)"
          , `then`.source-dirs = "src-StandaloneKindSignatures"
          , `else`.source-dirs = "src-NoStandaloneKindSignatures"
          }
        }
      }
