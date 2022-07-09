let defs = ./../defaults-blobs.dhall ".hie"

in    defs
    ⫽ { name = "build-plugins-for-blobs"
      , synopsis = "A shake build of uom-plugin."
      , description = "Builds the packages making up uom-plugin."
      , category = "Build"
      , executables.build-plugins-for-blobs
        =
        { dependencies =
              defs.dependencies
            # [ "ansi-terminal", "shake", "raw-strings-qq", "text", "time" ]
        , ghc-options = [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]
        , main = "Main.hs"
        , source-dirs = "."
        }
      }
