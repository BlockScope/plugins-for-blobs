let defs = ./defaults-thoralf.dhall

let thoralf-theory = ./theory/package-relative.dhall "theory/" "thoralf:"

let thoralf-encode = ./encode/package-relative.dhall "encode/" "thoralf:"

let thoralf-plugin = ./plugin/package-relative.dhall "plugin/" "thoralf:"

let thoralf-plugin-rows =
      ./plugin-rows/package-relative.dhall "plugin-rows/" "thoralf:"

in      defs
    //  { name = "thoralf"
        , internal-libraries =
          { thoralf-theory =
                  thoralf-theory.library
              //  { visibility = "public"
                  , dependencies = thoralf-theory.dependencies
                  }
          , thoralf-encode =
                  thoralf-encode.library
              //  { visibility = "public"
                  , dependencies = thoralf-encode.dependencies
                  }
          , thoralf-plugin =
                  thoralf-plugin.library
              //  { visibility = "public"
                  , dependencies = thoralf-plugin.dependencies
                  }
          , thoralf-plugin-rows =
                  thoralf-plugin-rows.library
              //  { visibility = "public"
                  , ghc-options = thoralf-plugin-rows.ghc-options
                  , dependencies = thoralf-plugin-rows.dependencies
                  }
          }
        , tests.thoralf-rows
          =
                thoralf-plugin-rows.tests.rows
            //  { dependencies =
                      thoralf-plugin-rows.dependencies
                    # thoralf-plugin-rows.tests.rows.dependencies
                , ghc-options =
                      thoralf-plugin-rows.ghc-options
                    # thoralf-plugin-rows.tests.rows.ghc-options
                }
        }
