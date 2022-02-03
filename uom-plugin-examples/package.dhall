let defs = ./../defaults-uom.dhall

in  let testopts = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]

    in    defs
        ⫽ { ghc-options = "-dcore-lint" }
        ⫽ { name = "uom-plugin-examples"
          , synopsis = "Examples of the use of uom-plugin"
          , description =
              "This package provides examples of the use of uom-plugin"
          , license = "PublicDomain"
          , license-file = ""
          , extra-source-files = [ "package.dhall" ]
          , executables.uom-plugin-examples
            =
            { dependencies =
                  defs.dependencies
                # [ "uom-quantity", "uom-th", "uom-plugin", "uom-plugin-defs" ]
            , source-dirs = "."
            , main = "Examples.hs"
            , when = { condition = "impl(ghc >= 8.4.0)", buildable = False }
            }
          }
