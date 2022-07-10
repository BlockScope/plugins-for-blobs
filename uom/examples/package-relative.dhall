λ(src : Text) →
λ(prefix : Text) →
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
                  # [ "${prefix}uom-quantity"
                    , "${prefix}uom-th"
                    , "${prefix}uom-plugin"
                    , "${prefix}uom-plugin-defs"
                    ]
              , source-dirs = "${src}."
              , main = "Examples.hs"
              , when = { condition = "impl(ghc >= 8.4.0)", buildable = False }
              }
            }
