let defs = ./../defaults.dhall

in    defs
    ⫽ { name = "thoralf-plugin-defs"
      , synopsis = "Units of measure definitions"
      , description =
          ''
          The @thoralf-plugin-uom@ library adds support for units of measure to
          GHC using the new experimental facility for typechecker plugins. This
          package adds some unit definitions.''
      , category = "Type System"
      , github = "adamgundry/uom-plugin"
      , license = "BSD3"
      , license-file = "LICENSE"
      , stability = "experimental"
      , extra-source-files = [ "LICENSE" ]
      , library =
        { source-dirs = "src"
        , exposed-modules = "Plugins.UoM.UnitDefs"
        , other-modules = [] : List Text
        , dependencies =
              defs.dependencies
            # [ "template-haskell >=2.9"
              , "uom-quantity"
              , "uom-th"
              , "thoralf-plugin-uom"
              ]
        }
      }
