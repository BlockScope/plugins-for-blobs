let ghc-opts = [ "-Wall", "-fno-warn-unticked-promoted-constructors" ]

in  { version = "0.1.0"
    , synopsis = "Plugins for helping GHC type check units of measure."
    , description =
        ''
        Starting from the uom and thoralf plugins; we identify, refactor and
        extract commonality in both plugins and then break up the uom plugin for
        reuse. The unit quasiquoter can now be used with the thoralf plugin and
        it passes all units tests of the uom plugin except for those involving
        unit conversions.
        ''
    , category = "Type System"
    , stability = "experimental"
    , author = "Phil de Joux"
    , maintainer = "phil.dejoux@blockscope.com"
    , copyright = "© 2017-2022 Phil de Joux, © 2017-2022 Block Scope Limited"
    , github = "blockscope/plugins-for-blobs"
    , license = "MPL-2.0"
    , license-file = "LICENSE.md"
    , tested-with = "GHC == 8.2.2, GHC == 8.10.7, GHC == 9.2.2"
    , extra-source-files = [ "LICENSE.md" ]
    , dependencies = [ "base >=4.9.1.0 && <5" ]
    , when =
      { condition = "impl(ghc >= 8.8.0)"
      , `then`.ghc-options
        = ghc-opts # [ "-fwrite-ide-info", "-hiedir=../.hie" ]
      , `else`.ghc-options = ghc-opts
      }
    }
