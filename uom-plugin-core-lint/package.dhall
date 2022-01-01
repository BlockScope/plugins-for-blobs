let defs = ./../defaults.dhall

in  let testopts = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { ghc-options = "-dcore-lint" }
        ⫽ { name = "uom-plugin-core-lint"
          , synopsis = "Examples of the use of uom-plugin"
          , description =
              "This package provides examples of the use of uom-plugin"
          , license = "PublicDomain"
          , executables.CoreLintRepro
            =
            { dependencies = defs.dependencies # [ "uom-plugin" ]
            , source-dirs = "."
            , main = "CoreLintRepro.hs"
            , other-modules = [ "UnitDefs" ] : List Text
            , when =
              [ { condition = "impl(ghc < 8.4)", buildable = True }
              , { condition = "impl(ghc >= 9.2.1)", buildable = True }
              , { condition = "impl(ghc >= 8.4) && impl(ghc < 9.2)"
                , buildable = False
                }
              ]
            }
          }
