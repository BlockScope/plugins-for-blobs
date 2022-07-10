let defs = ./defaults-uom.dhall

let uom-quantity = ./quantity/package-relative.dhall "quantity/" "uom:"

let uom-th = ./th/package-relative.dhall "th/" "uom:"

let uom-plugin = ./plugin/package-relative.dhall "plugin/" "uom:"

let uom-plugin-defs = ./defs/package-relative.dhall "defs/" "uom:"

let uom-plugin-examples = ./examples/package-relative.dhall "examples/" "uom:"

let uom-plugin-tutorial = ./tutorial/package-relative.dhall "tutorial/" "uom:"

in      defs
    //  { name = "uom"
        , internal-libraries =
          { uom-quantity =
                  uom-quantity.library
              //  { visibility = "public", when = uom-quantity.when }
          , uom-th = uom-th.library // { visibility = "public" }
          , uom-plugin = uom-plugin.library // { visibility = "public" }
          , uom-plugin-defs =
              uom-plugin-defs.library // { visibility = "public" }
          }
        , executables = uom-plugin-examples.executables
        , tests =
          { uom-quantity-doctest = uom-quantity.tests.doctest
          , uom-defs = uom-plugin.tests.defs
          , uom-units = uom-plugin.tests.units
          , uom-unpack-solve = uom-plugin.tests.unpack-solve
          , uom-force = uom-plugin.tests.force
          , uom-tutorial-doctest = uom-plugin-tutorial.tests.doctest
          }
        }
