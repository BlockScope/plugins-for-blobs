let defs = ./defaults-blobs.dhall

let uom-quantity = ./uom-quantity/package-relative.dhall "uom-quantity/"

in      defs
    //  { name = "plugins-for-blobs"
        , internal-libraries.uom-quantity
          = uom-quantity.library // { when = uom-quantity.when }
        }
