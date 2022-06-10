λ(src : Text) →
λ(prefix : Text) →
  let defs = ./../defaults-uom.dhall

  in    defs
      ⫽ { name = "uom-plugin-defs"
        , synopsis = "Units of measure definitions"
        , description =
            ''
            The @uom-plugin@ library adds support for units of measure to GHC
            using the new experimental facility for typechecker plugins. This
            package adds some unit definitions.''
        , category = "Type System"
        , github = "adamgundry/uom-plugin"
        , stability = "experimental"
        , library =
          { source-dirs = "${src}src"
          , exposed-modules = "Plugins.UoM.UnitDefs"
          , other-modules = [] : List Text
          , dependencies =
                defs.dependencies
              # [ "template-haskell >=2.9"
                , "${prefix}uom-quantity"
                , "${prefix}uom-th"
                , "${prefix}uom-plugin"
                ]
          }
        }
