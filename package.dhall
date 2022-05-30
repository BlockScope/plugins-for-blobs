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
let defs = ./defaults-blobs.dhall

let uom-quantity =
      ./uom-quantity/package-relative.dhall "uom-quantity/" "plugins-for-blobs:"

let uom-th = ./uom-th/package-relative.dhall "uom-th/" "plugins-for-blobs:"

let thoralf-theory =
      ./thoralf-theory/package-relative.dhall
        "thoralf-theory/"
        "plugins-for-blobs:"

let thoralf-encode =
      ./thoralf-encode/package-relative.dhall
        "thoralf-encode/"
        "plugins-for-blobs:"

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
          }
        , tests.uom-quantity-doctest = uom-quantity.tests.doctest
        }
