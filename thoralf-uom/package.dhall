let defs = ./defaults-blobs.dhall ".hie"

let thoralf-plugin-uom =
      ./plugin/package-relative.dhall
        ".hie"
        "plugin/"
        "thoralf-uom:"
        "thoralf:"
        "uom:"

let thoralf-plugin-defs =
      ./defs/package-relative.dhall
        ".hie"
        "defs/"
        "thoralf-uom:"
        "thoralf:"
        "uom:"

in      defs
    //  { name = "thoralf-uom"
        , internal-libraries =
          { thoralf-plugin-uom =
                  thoralf-plugin-uom.library
              //  { visibility = "public"
                  , dependencies = thoralf-plugin-uom.dependencies
                  }
          , thoralf-plugin-defs =
              thoralf-plugin-defs.library // { visibility = "public" }
          }
        , tests =
          { thoralf-uom-diy =
                  thoralf-plugin-uom.tests.uom-diy
              //  { dependencies =
                        thoralf-plugin-uom.dependencies
                      # thoralf-plugin-uom.tests.uom-diy.dependencies
                  , ghc-options =
                        thoralf-plugin-uom.ghc-options
                      # thoralf-plugin-uom.tests.uom-diy.ghc-options
                  }
          , thoralf-uom-quantity =
                  thoralf-plugin-uom.tests.uom-quantity
              //  { dependencies =
                        thoralf-plugin-uom.dependencies
                      # thoralf-plugin-uom.tests.uom-quantity.dependencies
                  , ghc-options =
                        thoralf-plugin-uom.ghc-options
                      # thoralf-plugin-uom.tests.uom-quantity.ghc-options
                  }
          , thoralf-defs =
                  thoralf-plugin-uom.tests.defs
              //  { dependencies =
                        thoralf-plugin-uom.dependencies
                      # thoralf-plugin-uom.tests.defs.dependencies
                  , ghc-options =
                        thoralf-plugin-uom.ghc-options
                      # thoralf-plugin-uom.tests.defs.ghc-options
                  }
          , thoralf-force =
                  thoralf-plugin-uom.tests.force
              //  { dependencies =
                        thoralf-plugin-uom.dependencies
                      # thoralf-plugin-uom.tests.force.dependencies
                  , ghc-options =
                        thoralf-plugin-uom.ghc-options
                      # thoralf-plugin-uom.tests.force.ghc-options
                  }
          , thoralf-delay-eq =
                  thoralf-plugin-uom.tests.delay-eq
              //  { dependencies =
                        thoralf-plugin-uom.dependencies
                      # thoralf-plugin-uom.tests.delay-eq.dependencies
                  , ghc-options =
                        thoralf-plugin-uom.ghc-options
                      # thoralf-plugin-uom.tests.delay-eq.ghc-options
                  }
          , thoralf-units =
                  thoralf-plugin-uom.tests.units
              //  { dependencies =
                        thoralf-plugin-uom.dependencies
                      # thoralf-plugin-uom.tests.units.dependencies
                  , ghc-options =
                        thoralf-plugin-uom.ghc-options
                      # thoralf-plugin-uom.tests.units.ghc-options
                  }
          }
        }
