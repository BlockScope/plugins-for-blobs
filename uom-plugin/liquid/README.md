# Units of Measure with Liquid Haskell

This test suite should be run from the root folder. It fails with;

```
> stack test uom-plugin:liquid
uom-plugin-0.3.0.0: build (lib + test)
Preprocessing library for uom-plugin-0.3.0.0..
Building library for uom-plugin-0.3.0.0..
[11 of 15] Compiling Data.UnitsOfMeasure.Convert
( src/Data/UnitsOfMeasure/Convert.hs
, .stack-work/dist/x86_64-osx/Cabal-2.0.1.0/build/Data/UnitsOfMeasure/Convert.o
) [Data.UnitsOfMeasure.Plugin changed]
[15 of 15] Compiling Data.UnitsOfMeasure.Defs
( src/Data/UnitsOfMeasure/Defs.hs
, .stack-work/dist/x86_64-osx/Cabal-2.0.1.0/build/Data/UnitsOfMeasure/Defs.o
) [Data.UnitsOfMeasure.Plugin changed]
Preprocessing test suite 'liquid' for uom-plugin-0.3.0.0..
Building test suite 'liquid' for uom-plugin-0.3.0.0..
[2 of 2] Compiling Main
( liquid/Liquid.hs
, .stack-work/dist/x86_64-osx/Cabal-2.0.1.0/build/liquid/liquid-tmp/Main.o
)
Linking .stack-work/dist/x86_64-osx/Cabal-2.0.1.0/build/liquid/liquid ...
uom-plugin-0.3.0.0: copy/register
Installing library in /.../uom-plugin/.stack-work/install/x86_64-osx/
lts-11.7/8.2.2/lib/x86_64-osx-ghc-8.2.2/uom-plugin-0.3.0.0-KkZk91t06eqFxfNpcmFJIY
Registering library for uom-plugin-0.3.0.0..
uom-plugin-0.3.0.0: test (suite: liquid)

Progress 1/2: uom-plugin-0.3.0.0One minute is [u| 60.0 s |]
LiquidHaskell Version 0.8.2.4, Git revision ec88f568d101bfd35b6254aa7db034164d9c89dd
Copyright 2013-18 Regents of the University of California. All Rights Reserved.


**** DONE:  annotate ***********************************************************


**** RESULT: ERROR *************************************************************


 /.../uom-plugin/uom-plugin/liquid/Liquid.hs:12:33: Error: Cannot parse specification:

 12 | {-@ type Qs = Quantity Double [u| s |] @-}
                                      ^

     unexpected "|"
     expecting bareTyArgP

uom-plugin-0.3.0.0: Test suite liquid failed
Completed 2 action(s).
Test suite failure for package uom-plugin-0.3.0.0
    liquid:  exited with: ExitFailure 2
Logs printed to console
```
