{- NOTES:
* internal libraries need to be made public otherwise:
    cabal test plugins-for-blobs:uom-quantity-doctest --test-show-details=always
    Resolving dependencies...
    Error: cabal: Could not resolve dependencies:
    [__0] trying: plugins-for-blobs-0.1.0 (user goal)
    [__1] trying: uom-quantity-0.3.0.1 (user goal)
    [__2] rejecting: uom-quantity:*test (requires library 'uom-quantity' from
    plugins-for-blobs, but the component is private)
    [__2] rejecting: uom-quantity:!test (constraint from config file, command line
    flag, or user target requires opposite flag selection)
    [__2] fail (backjumping, conflict set: plugins-for-blobs, uom-quantity,
    uom-quantity:test)
    After searching the rest of the dependency tree exhaustively, these were the
    goals I've had most trouble fulfilling: uom-quantity, uom-quantity:test,
    plugins-for-blobs
-}
let defs = ./thoralf-uom/defaults-blobs.dhall ".hie"

let uom-quantity =
      ./uom/quantity/package-relative.dhall "uom/quantity/" "plugins-for-blobs:"

let uom-th = ./uom/th/package-relative.dhall "uom/th/" "plugins-for-blobs:"

let thoralf-theory =
      ./thoralf/theory/package-relative.dhall
        "thoralf/theory/"
        "plugins-for-blobs:"

let thoralf-encode =
      ./thoralf/encode/package-relative.dhall
        "thoralf/encode/"
        "plugins-for-blobs:"

let thoralf-plugin =
      ./thoralf/plugin/package-relative.dhall
        "thoralf/plugin/"
        "plugins-for-blobs:"

let thoralf-plugin-rows =
      ./thoralf/plugin-rows/package-relative.dhall
        "thoralf/plugin-rows/"
        "plugins-for-blobs:"

let thoralf-plugin-uom =
      ./thoralf-uom/plugin/package-relative.dhall
        ".hie"
        "thoralf-uom/plugin/"
        "plugins-for-blobs:"
        "plugins-for-blobs:"
        "plugins-for-blobs:"

let thoralf-plugin-defs =
      ./thoralf-uom/defs/package-relative.dhall
        ".hie"
        "thoralf-uom/defs/"
        "plugins-for-blobs:"
        "plugins-for-blobs:"
        "plugins-for-blobs:"

let uom-plugin =
      ./uom/plugin/package-relative.dhall "uom/plugin/" "plugins-for-blobs:"

let uom-plugin-defs =
      ./uom/defs/package-relative.dhall "uom/defs/" "plugins-for-blobs:"

let uom-plugin-examples =
      ./uom/examples/package-relative.dhall "uom/examples/" "plugins-for-blobs:"

let uom-plugin-tutorial =
      ./uom/tutorial/package-relative.dhall "uom/tutorial/" "plugins-for-blobs:"

in      defs
    //  { name = "plugins-for-blobs"
        , internal-libraries =
          { uom-quantity =
                  uom-quantity.library
              //  { visibility = "public", when = uom-quantity.when }
          , uom-th = uom-th.library // { visibility = "public" }
          , thoralf-theory =
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
          , thoralf-plugin-uom =
                  thoralf-plugin-uom.library
              //  { visibility = "public"
                  , dependencies = thoralf-plugin-uom.dependencies
                  }
          , thoralf-plugin-defs =
              thoralf-plugin-defs.library // { visibility = "public" }
          , uom-plugin = uom-plugin.library // { visibility = "public" }
          , uom-plugin-defs =
              uom-plugin-defs.library // { visibility = "public" }
          }
        , executables = uom-plugin-examples.executables
        , tests =
          { uom-quantity-doctest = uom-quantity.tests.doctest
          , thoralf-rows =
                  thoralf-plugin-rows.tests.rows
              //  { dependencies =
                        thoralf-plugin-rows.dependencies
                      # thoralf-plugin-rows.tests.rows.dependencies
                  , ghc-options =
                        thoralf-plugin-rows.ghc-options
                      # thoralf-plugin-rows.tests.rows.ghc-options
                  }
          , thoralf-uom-diy =
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
          , uom-defs = uom-plugin.tests.defs
          , uom-units = uom-plugin.tests.units
          , uom-unpack-solve = uom-plugin.tests.unpack-solve
          , uom-force = uom-plugin.tests.force
          , uom-tutorial-doctest = uom-plugin-tutorial.tests.doctest
          }
        }
