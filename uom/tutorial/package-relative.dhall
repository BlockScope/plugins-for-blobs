λ(src : Text) →
λ(prefix : Text) →
  let defs = ./../defaults-uom.dhall

  in  let testopts =
            [ "-rtsopts"
            , "-threaded"
            , "-with-rtsopts=-N"
            , "-fplugin Plugins.UoM"
            ]

      in    defs
          ⫽ { name = "uom-plugin-tutorial"
            , synopsis =
                "A tutorial for the Units of measure typechecker plugin"
            , description =
                "A tutorial for the units of measure typechecker plugin, checked with doctest."
            , category = "Type System"
            , tests.doctest
              =
              { dependencies =
                    defs.dependencies
                  # [ "doctest >= 0.13.0"
                    , "${prefix}uom-quantity"
                    , "${prefix}uom-th"
                    , "${prefix}uom-plugin"
                    ]
              , ghc-options = testopts
              , main = "DocTest.hs"
              , source-dirs = [ "${src}src" ]
              , other-modules = [ "Plugins.UoM.UnitDefs" ]
              , when =
                [ { condition = "impl(ghc >= 9.2) && impl(ghc < 9.4)"
                  , source-dirs =
                    [ "${src}doc-ghc-9.2"
                    , "${src}test-suite-doctest-ghc-9.2"
                    ]
                  , other-modules = [ "Data.UnitsOfMeasure.Tutorial" ]
                  }
                , { condition = "impl(ghc >= 8.2) && impl(ghc < 9.2)"
                  , source-dirs =
                    [ "${src}doc-ghc-8.2"
                    , "${src}test-suite-doctest-ghc-8.2"
                    ]
                  , other-modules = [ "Data.UnitsOfMeasure.Tutorial" ]
                  }
                ]
              }
            }
