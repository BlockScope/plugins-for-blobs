# Plugins for Blobs

[![cabal](https://github.com/BlockScope/plugins-for-blobs/actions/workflows/cabal.yml/badge.svg)](https://github.com/BlockScope/plugins-for-blobs/actions/workflows/cabal.yml)
[![stack](https://github.com/BlockScope/plugins-for-blobs/actions/workflows/stack.yml/badge.svg)](https://github.com/BlockScope/plugins-for-blobs/actions/workflows/stack.yml)
[![hlint](https://github.com/BlockScope/plugins-for-blobs/actions/workflows/hlint.yml/badge.svg)](https://github.com/BlockScope/plugins-for-blobs/actions/workflows/hlint.yml)

> 1 blob is equal to 1 lbf⋅s2/in, or 12 [slugs][slug].

In their [paper][thoralf-paper], the researchers developing the `thoralf-plugin`
suggest that it could match the `uom-plugin` in units of measure typechecking
capability. That's the challenge for this refactoring of both plugins.

Under the hood, the `thoralf-plugin` uses Z3 to solve equational theories. The
`uom-plugin` solves trivial equations, rewrites and simplifies constraints and
makes substitutions.

The `uom-plugin` depends on [ghc-tcplugins-extra][ghc-tcplugins-extra] and
[units-parser][units-parser]. It defines a quasiquoter for writing units with
measures, such as `[u| 9.8 m/s^2 |]`.

The `thoralf-plugin` ships with one small units example, calculating distance in
`m` from velocity in `m/s` and time in `s`. The `uom-plugin` has a large number
of unit tests.

[slug]: https://en.wikipedia.org/wiki/Slug_(unit)
[uom-plugin]: https://github.com/adamgundry/uom-plugin
[thoralf-plugin]: https://github.com/bgamari/the-thoralf-plugin
[ghc-tcplugins-extra]: https://github.com/BlockScope/ghc-tcplugins-extra
[units-parser]: https://github.com/adamgundry/units-parser
[thoralf-paper]: https://repository.brynmawr.edu/compsci_pubs/82/

## Goals

Initial goals:

✅&nbsp;&nbsp;Identify, refactor and extract commonality in both unit plugins.  
✅&nbsp;&nbsp;Use the unit quasiquoter with the `thoralf-plugin`.  
✅&nbsp;&nbsp;Pass all units tests of the `uom-plugin` with the `thoralf-plugin` except for those involving unit conversions.  

Stretch goals:

✅&nbsp;&nbsp;Fix a longstanding bug with the `uom-plugin` (a bonus goal, stumbled on by accident [^uom-fix]).  
❌&nbsp;&nbsp;Add the experimental [unit conversions](#unit-conversions) of the `uom-plugin` to the `thoralf-plugin`.  

[^uom-fix]: Adam Gundry made changes that got the `uom-plugin` working again
with `ghc-9.0` and `ghc-9.2` when the plugin was stuck at `ghc-8.2`, failing
with later versions of GHC. I caught a problem with these changes not yet picked
up by the unit tests and added a unit test for that. While working on
reproducing tests for the `thoralf-plugin` I noticed that in some cases the
`uom-plugin` tests showed failures with unit order reversed. I then backported a
fraction of Adam's changes into `ghc-corroborate`. With just these few changes
to `cmpTyCon`, `cmpType` and `cmpTypes` the plugin works again with `ghc-9.2`.
I've tested this with flare-timing and nothing bad happens but the fix comes
with a core-lint error.

## Progress

### New Utility Packages

* Added [ghc-corroborate](https://github.com/BlockScope/ghc-corroborate#readme),
  a new package exposing a flattened subset of GHC's API needed for typechecking
  plugins as a single API across multiple GHC versions. It uses cabal
  conditionals and mixins and avoids use of the `CPP` language extension and
  predefined macros for switching between GHC versions.
* Used the same techniques for avoiding `CPP` with [ghc-tcplugins-extra](https://github.com/clash-lang/ghc-tcplugins-extra/pull/18).
* Moved the tracing of the `thoralf-plugin` to
  [ghc-tcplugins-trace](https://github.com/BlockScope/ghc-tcplugins-trace#readme).

### Rearranged Plugin Packages

The general idea with this was to rearrange the modules of each plugin for
similarity between both (so that I could see that) and to split the packages up
so that they could be shared between both.

* Moved the quasiquoter of the `uom-plugin` to `uom-th`.
* Moved the units of measure (UoM) theory from the `thoralf-plugin` and much of
  the `uom-plugin` internals to `uom-quantity`.
* Split the `thoralf-plugin` into:
  * `thoralf-encode`
  * `thoralf-plugin`
  * `thoralf-plugin-rows`
  * `thoralf-plugin-uom`
* Split the units of measure features of the thoralf plugin from the rest so
  that we have `thoralf-plugin-uom` for units and `thoralf-plugin-rows` for the
  rest.
  
```
> cabal-plan tred --hide-exes --hide-builtin
thoralf-plugin-defs
 └─ thoralf-plugin-uom
     ├─ thoralf-plugin
     └─ uom-th

thoralf-plugin-rows
└─ thoralf-plugin

thoralf-plugin
 └─ thoralf-encode

uom-plugin-defs
└─ uom-plugin
  └─ uom-th

uom-th
└─ uom-quantity
    ├─ ghc-tcplugins-trace
    │   ├─ ghc-corroborate
    │   │   └─ ghc-tcplugins-extra
    │   └─ th-printf
    └─ units-parser
```

### Enhanced Tracing

* Added `-ddump-tc-trace` tracing to the `thoralf-plugin-uom` (the `uom-plugin`
  already has this).
* Added configuration for what to trace from the `thoralf-plugin-uom`. There are
  two combination of these that are useful; a TOML style layout and an SMT2
  style layout. The later output can be fed directly and unaltered into Z3 and
  is full of useful comments to help follow along. The SMT2 output for various
  unit tests can be found in the smt2/ghc-x.y folders, such as
  [smt2/ghc-8.10](/smt2/ghc-8.10).

### Partial Plugins

I saw that the `uom-plugin` operated in two phases; (1) looking for unpacks and
(2) solving equations. This package now has 3 plugins:

* `Plugins.UoM` that combines the two phases as before.
* `Plugins.UoM.Unpack` that does only the unpacking.
* `Plugins.UoM.Solve` that does only the solving.

### Unit Definitions

I pulled unit definitions out of `uom-plugin` and put these into
`uom-plugin-defs`. Also added a similar `thoralf-plugin-defs` package with the
same set of unit definitions.

## Changes in Use

I've shortened names of the plugins.

```diff
-- {-# OPTIONS_GHC -fplugin Data.UnitsOfMeasure.Plugin #-}
++ {-# OPTIONS_GHC -fplugin Plugins.UoM #-}
```

```diff
-- {-# OPTIONS_GHC -fplugin ThoralfPlugin.Plugin #-}
++ {-# OPTIONS_GHC -fplugin Plugins.Thoralf #-}
```

## Unpack First

There are two phases to solving with the uom-plugin, unpacking and solving
constraints. The plugin `Plugins.UoM` does both. It will unpack if there is any
of that work to do. Only when the unpacks are discharged will it solve. I've
separated these steps so that the unpacking can be used with solver plugins that
don't themselves do unit unpacking.

* Two ways of solving with plugins from the `uom-plugin` package.
  * Using one plugin that does both unpacking and solving.
    ```haskell
    {-# OPTIONS_GHC -fplugin Plugins.UoM #-}
    ```

  * Using one plugin for unpacking and another for solving.
    ```haskell
    {-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
    {-# OPTIONS_GHC -fplugin Plugins.UoM.Solve #-}
    ```

* Two ways of solving with plugins from the `thoralf-plugin-uom` package.
  * Using one plugin that does both unpacking and solving.
    ```haskell
    {-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM #-}
    ```

  * Using one plugin for unpacking and another for solving.
    ```haskell
    {-# OPTIONS_GHC -fplugin Plugins.UoM.Unpack #-}
    {-# OPTIONS_GHC -fplugin Plugins.Thoralf.UoM.Solve #-}
    ```

    With this, we're able to use the `u` quasiquoter.  Without the unpacking,
    trying to declare units would fail with:

    ```
        • Could not deduce: IsCanonical (Unpack (Base "byte"))
            arising from the superclasses of an instance declaration
        • In the instance declaration for ‘HasCanonicalBaseUnit "byte"’
       |
    __ | declareBaseUnit "byte"
       | ^
    ```

## Test Suite Units

A goal of this project is to run the same tests in `thoralf-plugin-uom:units` as
in `uom-plugin:units`.

```diff
- > cabal test uom-plugin:units --test-show-details=always"
+ > cabal test thoralf-plugin-uom:units --test-show-details=always"
  Running 1 test suites...
  Test suite units: RUNNING...
- uom-plugin:units
+ thoralf-plugin-uom:units
    Get the underlying value with unQuantity
      unQuantity 3 m:                             OK
      unQuantity 3 s^2:                           OK
      unQuantity 3 m s^-1:                        OK
      unQuantity 3.0 kg m^2 / m s^2:              OK
      unQuantity 1:                               OK
      unQuantity 1 (1/s):                         OK
      unQuantity 1 1/s:                           OK
      unQuantity 1 s^-1:                          OK
      unQuantity 2 1 / kg s:                      OK
      unQuantity (1 % 2) kg:                      OK
    Attach units by applying the quasiquoter without a numeric value
      m 3:                                        OK
      m <$> [3..5]:                               OK
      m/s 3:                                      OK
      m s^-1 3:                                   OK
      s^2 3:                                      OK
      1 $ 3:                                      OK
      fmap [u| kg |] read $ "3":                  OK
      fmap [u| kg |] read $ "3.0":                OK
    Showing constants
      show 3m:                                    OK
      show 3m/s:                                  OK
      show 3.2 s^2:                               OK
      show 3.0 kg m^2 / m s^2:                    OK
      show 1:                                     OK
      show 1 s^-1:                                OK
      show 2 1 / kg s:                            OK
      show (1 % 2) kg:                            OK
    Basic operations
      2 + 2:                                      OK
      in m/s:                                     OK
      mean:                                       OK
      tricky generalisation:                      OK
      polymorphic zero:                           OK
      polymorphic frac zero:                      OK
    Literal 1 (*:) Quantity _ u
      _ = Double:                                 OK
      _ = Int:                                    OK
      _ = Integer:                                OK
      _ = Rational, 1 *: [u| 1 m |]:              OK
      _ = Rational, mk (1 % 1) *: [u| 1 m |]:     OK
      _ = Rational, 1 *: [u| 1 % 1 m |]:          OK
      _ = Rational, mk (1 % 1) *: [u| 1 % 1 m |]: OK
    (1 :: Quantity _ One) (*:) Quantity _ u
      _ = Double:                                 OK
      _ = Int:                                    OK
      _ = Integer:                                OK
      _ = Int:                                    OK
    errors when a /= b, (1 :: Quantity a One) (*:) Quantity b u
      b = Double
        a = Int:                                  OK
        a = Integer:                              OK
        a = Rational:                             OK
      b = Int
        a = Double:                               OK
        a = Integer:                              OK
        a = Rational:                             OK
      b = Integer
        a = Double:                               OK
        a = Int:                                  OK
        a = Rational:                             OK
      b = Rational
        a = Double:                               OK
        a = Int:                                  OK
        a = Integer:                              OK
    showQuantity
      myMass:                                     OK
      gravityOnEarth:                             OK
      forceOnGround:                              OK
-   convert
-     10m in ft:                                  OK
-     5 km^2 in m^2:                              OK
-     ratio:                                      OK
-     100l in m^3:                                OK
-     1l/m in m^2:                                OK
-     1l/m in m^2:                                OK
-     5l in ft^3:                                 OK
-     2000000l^2 in ft^3 m^3:                     OK
-     42 rad/s in s^-1:                           OK
-     2.4 l/h in m:                               OK
-     1 m^4 in l m:                               OK
-   show via convert
-     A 1.01km:                                   OK
-     B 1010m:                                    OK
    errors
      s/m ~ m/s:                                  OK
      m + s:                                      OK
      a ~ a  =>  a ~ kg:                          OK
-     a ~ b  =>  a ~ kg:                          OK
-     a^2 ~ b^3  =>  a ~ s:                       OK
    read . show
      3 m:                                        OK
      1.2 m/s:                                    OK
      1:                                          OK
    read normalisation
      1 m/m:                                      OK
      -0.3 m s^-1:                                OK
      42 s m s:                                   OK
-   read equality (avoid false equivalences)
-     1 m/m^2 /= 1 m:                             OK
-     1 m /= 1 m/m^2:                             OK

- All 84 tests passed (0.00s)
+ All 67 tests passed (0.00s)

  Test suite units: PASS
  1 of 1 test suites (1 of 1 test cases) passed.
```

## Running All Test Suites

```
> cabal test all:tests
> stack test
```

To see tests of the `uom-plugin` with color but no build output to the terminal:

```
> stack test uom-plugin --no-terminal --test-arguments "--color=always"
```

## Generating Cabal Files

We're using [hpack-dhall](https://github.com/cabalism/hpack-dhall) to format
`**/package.dhall` files and generate `**/*.cabal` files. There's a shake build
rule `cabal-files` that does this for every package in this monorepo.

```
> ./cabal-shake-build.sh cabal-files
```

## Unit Conversions

The `uom-plugin` has experimental unit conversions.

```haskell
-- | Automatically convert a quantity with units @u@ so that its units
-- are @v@, provided @u@ and @v@ have the same dimension.
convert
    :: forall a u v
    . (Fractional a, Convertible u v)
    => Quantity a u
    -> Quantity a v

-- | Calculate the conversion ratio between two units with the same
-- dimension.  The slightly unusual proxy arguments allow this to be
-- called using quasiquoters to specify the units, for example
-- @'ratio' [u| ft |] [u| m |]@.
ratio
    :: forall a u v (proxy :: Unit -> Type) proxy'
    . (Fractional a, Convertible u v)
    => proxy' (proxy u)
    -> proxy' (proxy v)
    -> Quantity a (u /: v)
```

How this works can be seen in the units tests for this feature.

```haskell
testGroup "convert"
[ testCase "10m in ft"     $ convert [u| 10m |]   @?= [u| 32.8 ft |]
, testCase "5 km^2 in m^2" $ convert [u| 5km^2 |] @?= [u| 5000000 m m |]
, testCase "ratio"         $ show (ratio [u| ft |] [u| m |]) @?= "[u| 3.28 ft / m |]"
, testCase "100l in m^3"   $ convert [u| 100l |]   @?= [u| 0.1 m^3 |]
, testCase "1l/m in m^2"   $ convert [u| 1l/m |]   @?= [u| 0.001 m^2 |]
, testCase "1l/m in m^2"   $ convert [u| 1l/m |]   @?= [u| 0.001 m^2 |]
, testCase "5l in ft^3"    $ convert [u| 5l   |]   @?= [u| 0.17643776 ft^3 |]
, testCase "2000000l^2 in ft^3 m^3" $ convert [u| 2000000l^2 |] @?= [u| 70.575104 ft^3 m^3 |]
, testCase "42 rad/s in s^-1" $ convert [u| 42 rad/s |] @?= [u| 42 s^-1 |]
, testCase "2.4 l/h in m" $ convert [u| 2.4 l/ha |] @?= [u| 2.4e-7 m |]
, testCase "1 m^4 in l m" $ convert [u| 1 m^4 |] @?= [u| 1000 l m |]
]
```

Units can only be converted if they share a dimension and for that they need to
be derived from a base unit with a conversion ratio.

```haskell
[u| rad = 1 1 |] -- dimensionless unit
[u| m, s |] -- base units
[u| km = 1000m, ha = 10000 m^2, l = 0.001 m^3, ft = 100 % 328 m |] -- derived units
```
