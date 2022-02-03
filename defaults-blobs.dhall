let ghc-opts = [ "-Wall", "-fno-warn-unticked-promoted-constructors" ]

in  { version = "0.1.0"
    , author = "Phil de Joux"
    , maintainer = "phil.dejoux@blockscope.com"
    , copyright = "© 2017-2022 Phil de Joux, © 2017-2022 Block Scope Limited"
    , git = "https://github.com/slockscope/plugins-for-blobs.git"
    , bug-reports = "https://github.com/blockscope/plugins-for-blobs/issues"
    , license = "MPL-2.0"
    , license-file = "LICENSE.md"
    , tested-with = "GHC == 8.2.2, GHC == 8.10.7, GHC == 9.2.1"
    , extra-source-files = "package.dhall"
    , when =
      { condition = "impl(ghc >= 8.8.0)"
      , `then`.ghc-options
        = ghc-opts # [ "-fwrite-ide-info", "-hiedir=../.hie" ]
      , `else`.ghc-options = ghc-opts
      }
    , dependencies = [ "base" ]
    }
