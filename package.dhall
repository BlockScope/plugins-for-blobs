let uom-quantity = ./uom-quantity/package-relative.dhall "uom-quantity/"

in  { name = "plugins-for-blobs"
    , `library uom-quantity` =
        uom-quantity.library // { when = uom-quantity.when }
    }
