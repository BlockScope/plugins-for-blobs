λ(src : Text) →
λ(prefix : Text) →
  let defs = ./../defaults-blobs.dhall

  in    defs
      ⫽ { name = "thoralf-plugin-defs"
        , synopsis = "Units of measure definitions"
        , description =
            ''
            The @thoralf-plugin-uom@ library adds support for units of measure to
            GHC using the new experimental facility for typechecker plugins. This
            package adds some unit definitions.''
        , category = "Type System"
        , stability = "experimental"
        , library =
          { source-dirs = "${src}src"
          , exposed-modules = "Plugins.Thoralf.UnitDefs"
          , other-modules = [] : List Text
          , dependencies =
                defs.dependencies
              # [ "template-haskell >=2.9"
                , "uom-quantity"
                , "uom-th"
                , "${prefix}thoralf-theory"
                , "${prefix}thoralf-encode"
                , "${prefix}thoralf-plugin"
                , "${prefix}thoralf-plugin-uom"
                ]
          }
        }
