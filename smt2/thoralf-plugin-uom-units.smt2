; Build profile: -w ghc-8.2.2 -O1
; [1 of 5] Compiling Abelian
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1HX} {1}:: (u *: (One /: u))
;                       ~
;                       (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1HH,/: [One [],a1HH]],*: [a1HJ,/: [One [],a1HJ]])

(echo "givens-start-cycle-1")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
(declare-const
   a1HH
   (Array String Int))
(declare-const
   a1HJ
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1HH
                 (
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (
                     (as
                        const
                        (Array String Int))
                     0)
                   a1HH))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1HJ
                 (
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (
                     (as
                        const
                        (Array String Int))
                     0)
                   a1HJ)))))
      :named
      wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1IA} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{a1IF} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Ir,a1Iq],*: [a1Io,a1In])
; (*: [a1In,a1Io],*: [a1Iq,a1Ir])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const
   a1In
   (Array String Int))
(declare-const
   a1Io
   (Array String Int))
(declare-const
   a1Iq
   (Array String Int))
(declare-const
   a1Ir
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    a1Ir
                    a1Iq)
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    a1Io
                    a1In))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1In
                 a1Io)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Iq
                 a1Ir))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Ja} {1}:: ((u0 *: v0) *: w0)
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)
; [WD] hole{a1Jj} {1}:: (u *: (v *: w))
;                       ~
;                       (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1IV,a1IW],a1IX],*: [*: [a1IR,a1IS],a1IT])
; (*: [a1IR,*: [a1IS,a1IT]],*: [a1IV,*: [a1IW,a1IX]])

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(declare-const
   a1IR
   (Array String Int))
(declare-const
   a1IS
   (Array String Int))
(declare-const
   a1IT
   (Array String Int))
(declare-const
   a1IV
   (Array String Int))
(declare-const
   a1IW
   (Array String Int))
(declare-const
   a1IX
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      a1IV
                      a1IW)
                    a1IX)
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      a1IR
                      a1IS)
                    a1IT))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IR
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IS
                   a1IT))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IV
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IW
                   a1IX)))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1K7} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1Jl],Base [a1Jl]],One [])

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(declare-const a1Jl String)
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base a1Jl one)
                 (store base a1Jl one))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Kg} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Jv,/: [One [],a1Jv]],One [])

(echo "givens-start-cycle-5")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
(declare-const
   a1Jv
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Jv
                 (
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (
                     (as
                        const
                        (Array String Int))
                     0)
                   a1Jv))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
      :named
      wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Kl} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JC,One []],a1JC)

(echo "givens-start-cycle-6")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(declare-const
   a1JC
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JC
                 (
                   (as
                      const
                      (Array String Int))
                   0))
               a1JC)))
      :named
      wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Ks} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JI,a1JJ],*: [a1JJ,a1JI])

(echo "givens-start-cycle-7")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(declare-const
   a1JI
   (Array String Int))
(declare-const
   a1JJ
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JI
                 a1JJ)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JJ
                 a1JI))))
      :named
      wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1KD} {1}:: (u *: (v *: w))
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JQ,*: [a1JR,a1JS]],*: [*: [a1JQ,a1JR],a1JS])

(echo "givens-start-cycle-8")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(declare-const
   a1JQ
   (Array String Int))
(declare-const
   a1JR
   (Array String Int))
(declare-const
   a1JS
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JQ
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1JR
                   a1JS))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1JQ
                   a1JR)
                 a1JS))))
      :named
      wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; [2 of 5] Compiling Plugins.Thoralf.UnitDefs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(exit)
; [3 of 5] Compiling Defs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{abjd} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base "byte" one)
                 (store base "byte" one)))))
      :named
      wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(exit)
; [5 of 5] Compiling Main
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_acEH {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acDB {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDD {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDF {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDH {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDJ {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDL {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDN {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDP {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDR {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDT {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDV {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDX {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDZ {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE1 {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE3 {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE5 {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE7 {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE9 {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEb {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEd {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEf {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEh {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEj {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEl {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEn {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEp {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEr {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEt {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEv {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEx {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEz {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEB {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acED {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEF {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDt {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acDv {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDr {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acEK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acEL {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acEG)
; (*: [acDa,acDu],acDA)
; (*: [acDa,acDA],acDC)
; (*: [acDa,acDC],acDE)
; (*: [acDa,acDE],acDG)
; (*: [acDa,acDG],acDI)
; (*: [acDa,acDI],acDK)
; (*: [acDa,acDK],acDM)
; (*: [acDa,acDM],acDO)
; (*: [acDa,acDO],acDQ)
; (*: [acDa,acDQ],acDS)
; (*: [acDa,acDS],acDU)
; (*: [acDa,acDU],acDW)
; (*: [acDa,acDW],acDY)
; (*: [acDa,acDY],acE0)
; (*: [acDa,acE0],acE2)
; (*: [acDa,acE2],acE4)
; (*: [acDa,acE4],acE6)
; (*: [acDa,acE6],acE8)
; (*: [acDa,acE8],acEa)
; (*: [acDa,acEa],acEc)
; (*: [acDa,acEc],acEe)
; (*: [acDa,acEe],acEg)
; (*: [acDa,acEg],acEi)
; (*: [acDa,acEi],acEk)
; (*: [acDa,acEk],acEm)
; (*: [acDa,acEm],acEo)
; (*: [acDa,acEo],acEq)
; (*: [acDa,acEq],acEs)
; (*: [acDa,acEs],acEu)
; (*: [acDa,acEu],acEw)
; (*: [acDa,acEw],acEy)
; (*: [acDa,acEy],acEA)
; (*: [acDa,acEA],acEC)
; (*: [acDa,acEC],acEE)
; (*: [acDa,acDa],acDs)
; (*: [acDa,acDs],acDu)
; (*: [acD9,acD9],acDq)
; (acEE,acEG)
; (acDq,acDu)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
(push 1)
(declare-const
   acD9
   (Array String Int))
(declare-const
   acDa
   (Array String Int))
(declare-const
   acDq
   (Array String Int))
(declare-const
   acDs
   (Array String Int))
(declare-const
   acDu
   (Array String Int))
(declare-const
   acDA
   (Array String Int))
(declare-const
   acDC
   (Array String Int))
(declare-const
   acDE
   (Array String Int))
(declare-const
   acDG
   (Array String Int))
(declare-const
   acDI
   (Array String Int))
(declare-const
   acDK
   (Array String Int))
(declare-const
   acDM
   (Array String Int))
(declare-const
   acDO
   (Array String Int))
(declare-const
   acDQ
   (Array String Int))
(declare-const
   acDS
   (Array String Int))
(declare-const
   acDU
   (Array String Int))
(declare-const
   acDW
   (Array String Int))
(declare-const
   acDY
   (Array String Int))
(declare-const
   acE0
   (Array String Int))
(declare-const
   acE2
   (Array String Int))
(declare-const
   acE4
   (Array String Int))
(declare-const
   acE6
   (Array String Int))
(declare-const
   acE8
   (Array String Int))
(declare-const
   acEa
   (Array String Int))
(declare-const
   acEc
   (Array String Int))
(declare-const
   acEe
   (Array String Int))
(declare-const
   acEg
   (Array String Int))
(declare-const
   acEi
   (Array String Int))
(declare-const
   acEk
   (Array String Int))
(declare-const
   acEm
   (Array String Int))
(declare-const
   acEo
   (Array String Int))
(declare-const
   acEq
   (Array String Int))
(declare-const
   acEs
   (Array String Int))
(declare-const
   acEu
   (Array String Int))
(declare-const
   acEw
   (Array String Int))
(declare-const
   acEy
   (Array String Int))
(declare-const
   acEA
   (Array String Int))
(declare-const
   acEC
   (Array String Int))
(declare-const
   acEE
   (Array String Int))
(declare-const
   acEG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acEG)
      :named
      given-1.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDu)
         acDA)
      :named
      given-1.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDA)
         acDC)
      :named
      given-1.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDC)
         acDE)
      :named
      given-1.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDE)
         acDG)
      :named
      given-1.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDG)
         acDI)
      :named
      given-1.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDI)
         acDK)
      :named
      given-1.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDK)
         acDM)
      :named
      given-1.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDM)
         acDO)
      :named
      given-1.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDO)
         acDQ)
      :named
      given-1.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDQ)
         acDS)
      :named
      given-1.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDS)
         acDU)
      :named
      given-1.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDU)
         acDW)
      :named
      given-1.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDW)
         acDY)
      :named
      given-1.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDY)
         acE0)
      :named
      given-1.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE0)
         acE2)
      :named
      given-1.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE2)
         acE4)
      :named
      given-1.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE4)
         acE6)
      :named
      given-1.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE6)
         acE8)
      :named
      given-1.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE8)
         acEa)
      :named
      given-1.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEa)
         acEc)
      :named
      given-1.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEc)
         acEe)
      :named
      given-1.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEe)
         acEg)
      :named
      given-1.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEg)
         acEi)
      :named
      given-1.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEi)
         acEk)
      :named
      given-1.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEk)
         acEm)
      :named
      given-1.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEm)
         acEo)
      :named
      given-1.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEo)
         acEq)
      :named
      given-1.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEq)
         acEs)
      :named
      given-1.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEs)
         acEu)
      :named
      given-1.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEu)
         acEw)
      :named
      given-1.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEw)
         acEy)
      :named
      given-1.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEy)
         acEA)
      :named
      given-1.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEA)
         acEC)
      :named
      given-1.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEC)
         acEE)
      :named
      given-1.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDa)
         acDs)
      :named
      given-1.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDs)
         acDu)
      :named
      given-1.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acD9
           acD9)
         acDq)
      :named
      given-1.38))
(assert
   (!
      (= acEE acEG)
      :named
      given-1.39))
(assert
   (!
      (= acDq acDu)
      :named
      given-1.40))
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] cobox_acEH {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acDB {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDD {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDF {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDH {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDJ {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDL {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDN {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDP {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDR {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDT {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDV {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDX {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDZ {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE1 {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE3 {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE5 {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE7 {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE9 {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEb {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEd {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEf {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEh {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEj {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEl {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEn {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEp {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEr {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEt {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEv {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEx {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEz {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEB {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acED {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEF {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDt {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acDv {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDr {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acEK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acEL {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acEU} {2}:: (a0 *: a0) ~ (b *: (b *: b)) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acEG)
; (*: [acDa,acDu],acDA)
; (*: [acDa,acDA],acDC)
; (*: [acDa,acDC],acDE)
; (*: [acDa,acDE],acDG)
; (*: [acDa,acDG],acDI)
; (*: [acDa,acDI],acDK)
; (*: [acDa,acDK],acDM)
; (*: [acDa,acDM],acDO)
; (*: [acDa,acDO],acDQ)
; (*: [acDa,acDQ],acDS)
; (*: [acDa,acDS],acDU)
; (*: [acDa,acDU],acDW)
; (*: [acDa,acDW],acDY)
; (*: [acDa,acDY],acE0)
; (*: [acDa,acE0],acE2)
; (*: [acDa,acE2],acE4)
; (*: [acDa,acE4],acE6)
; (*: [acDa,acE6],acE8)
; (*: [acDa,acE8],acEa)
; (*: [acDa,acEa],acEc)
; (*: [acDa,acEc],acEe)
; (*: [acDa,acEe],acEg)
; (*: [acDa,acEg],acEi)
; (*: [acDa,acEi],acEk)
; (*: [acDa,acEk],acEm)
; (*: [acDa,acEm],acEo)
; (*: [acDa,acEo],acEq)
; (*: [acDa,acEq],acEs)
; (*: [acDa,acEs],acEu)
; (*: [acDa,acEu],acEw)
; (*: [acDa,acEw],acEy)
; (*: [acDa,acEy],acEA)
; (*: [acDa,acEA],acEC)
; (*: [acDa,acEC],acEE)
; (*: [acDa,acDa],acDs)
; (*: [acDa,acDs],acDu)
; (*: [acD9,acD9],acDq)
; (acEE,acEG)
; (acDq,acDu)

; WANTEDS (Thoralf style)
; (*: [acDd,acDd],*: [acDa,*: [acDa,acDa]])

(echo "givens-start-cycle-2")
(push 1)
(declare-const
   acD9
   (Array String Int))
(declare-const
   acDa
   (Array String Int))
(declare-const
   acDq
   (Array String Int))
(declare-const
   acDs
   (Array String Int))
(declare-const
   acDu
   (Array String Int))
(declare-const
   acDA
   (Array String Int))
(declare-const
   acDC
   (Array String Int))
(declare-const
   acDE
   (Array String Int))
(declare-const
   acDG
   (Array String Int))
(declare-const
   acDI
   (Array String Int))
(declare-const
   acDK
   (Array String Int))
(declare-const
   acDM
   (Array String Int))
(declare-const
   acDO
   (Array String Int))
(declare-const
   acDQ
   (Array String Int))
(declare-const
   acDS
   (Array String Int))
(declare-const
   acDU
   (Array String Int))
(declare-const
   acDW
   (Array String Int))
(declare-const
   acDY
   (Array String Int))
(declare-const
   acE0
   (Array String Int))
(declare-const
   acE2
   (Array String Int))
(declare-const
   acE4
   (Array String Int))
(declare-const
   acE6
   (Array String Int))
(declare-const
   acE8
   (Array String Int))
(declare-const
   acEa
   (Array String Int))
(declare-const
   acEc
   (Array String Int))
(declare-const
   acEe
   (Array String Int))
(declare-const
   acEg
   (Array String Int))
(declare-const
   acEi
   (Array String Int))
(declare-const
   acEk
   (Array String Int))
(declare-const
   acEm
   (Array String Int))
(declare-const
   acEo
   (Array String Int))
(declare-const
   acEq
   (Array String Int))
(declare-const
   acEs
   (Array String Int))
(declare-const
   acEu
   (Array String Int))
(declare-const
   acEw
   (Array String Int))
(declare-const
   acEy
   (Array String Int))
(declare-const
   acEA
   (Array String Int))
(declare-const
   acEC
   (Array String Int))
(declare-const
   acEE
   (Array String Int))
(declare-const
   acEG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acEG)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDu)
         acDA)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDA)
         acDC)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDC)
         acDE)
      :named
      given-2.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDE)
         acDG)
      :named
      given-2.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDG)
         acDI)
      :named
      given-2.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDI)
         acDK)
      :named
      given-2.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDK)
         acDM)
      :named
      given-2.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDM)
         acDO)
      :named
      given-2.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDO)
         acDQ)
      :named
      given-2.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDQ)
         acDS)
      :named
      given-2.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDS)
         acDU)
      :named
      given-2.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDU)
         acDW)
      :named
      given-2.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDW)
         acDY)
      :named
      given-2.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDY)
         acE0)
      :named
      given-2.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE0)
         acE2)
      :named
      given-2.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE2)
         acE4)
      :named
      given-2.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE4)
         acE6)
      :named
      given-2.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE6)
         acE8)
      :named
      given-2.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE8)
         acEa)
      :named
      given-2.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEa)
         acEc)
      :named
      given-2.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEc)
         acEe)
      :named
      given-2.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEe)
         acEg)
      :named
      given-2.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEg)
         acEi)
      :named
      given-2.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEi)
         acEk)
      :named
      given-2.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEk)
         acEm)
      :named
      given-2.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEm)
         acEo)
      :named
      given-2.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEo)
         acEq)
      :named
      given-2.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEq)
         acEs)
      :named
      given-2.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEs)
         acEu)
      :named
      given-2.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEu)
         acEw)
      :named
      given-2.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEw)
         acEy)
      :named
      given-2.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEy)
         acEA)
      :named
      given-2.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEA)
         acEC)
      :named
      given-2.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEC)
         acEE)
      :named
      given-2.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDa)
         acDs)
      :named
      given-2.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDs)
         acDu)
      :named
      given-2.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acD9
           acD9)
         acDq)
      :named
      given-2.38))
(assert
   (!
      (= acEE acEG)
      :named
      given-2.39))
(assert
   (!
      (= acDq acDu)
      :named
      given-2.40))
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const
   acDd
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acDd
                 acDd)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acDa
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   acDa
                   acDa)))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_acFz {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acFt {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFv {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFx {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFl {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acFn {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFj {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acFC {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acFD {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acFy)
; (*: [acF7,acFm],acFs)
; (*: [acF7,acFs],acFu)
; (*: [acF7,acFu],acFw)
; (*: [acF7,acF7],acFk)
; (*: [acF7,acFk],acFm)
; (*: [acF6,acF6],acFi)
; (acFw,acFy)
; (acFi,acFm)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
(push 1)
(declare-const
   acF6
   (Array String Int))
(declare-const
   acF7
   (Array String Int))
(declare-const
   acFi
   (Array String Int))
(declare-const
   acFk
   (Array String Int))
(declare-const
   acFm
   (Array String Int))
(declare-const
   acFs
   (Array String Int))
(declare-const
   acFu
   (Array String Int))
(declare-const
   acFw
   (Array String Int))
(declare-const
   acFy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acFy)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFm)
         acFs)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFs)
         acFu)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFu)
         acFw)
      :named
      given-3.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acF7)
         acFk)
      :named
      given-3.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFk)
         acFm)
      :named
      given-3.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF6
           acF6)
         acFi)
      :named
      given-3.7))
(assert
   (!
      (= acFw acFy)
      :named
      given-3.8))
(assert
   (!
      (= acFi acFm)
      :named
      given-3.9))
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] cobox_acFz {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acFt {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFv {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFx {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFl {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acFn {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFj {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acFC {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acFD {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acFP} {3}:: (b0 *: (b0 *: b0))
;                       ~
;                       (b *: (b *: b)) (CNonCanonical)
; [WD] hole{acFY} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                       ~
;                       One (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acFy)
; (*: [acF7,acFm],acFs)
; (*: [acF7,acFs],acFu)
; (*: [acF7,acFu],acFw)
; (*: [acF7,acF7],acFk)
; (*: [acF7,acFk],acFm)
; (*: [acF6,acF6],acFi)
; (acFw,acFy)
; (acFi,acFm)

; WANTEDS (Thoralf style)
; (*: [acFb,*: [acFb,acFb]],*: [acF7,*: [acF7,acF7]])
; (*: [acFb,*: [acFb,*: [acFb,*: [acFb,*: [acFb,acFb]]]]],One [])

(echo "givens-start-cycle-4")
(push 1)
(declare-const
   acF6
   (Array String Int))
(declare-const
   acF7
   (Array String Int))
(declare-const
   acFi
   (Array String Int))
(declare-const
   acFk
   (Array String Int))
(declare-const
   acFm
   (Array String Int))
(declare-const
   acFs
   (Array String Int))
(declare-const
   acFu
   (Array String Int))
(declare-const
   acFw
   (Array String Int))
(declare-const
   acFy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acFy)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFm)
         acFs)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFs)
         acFu)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFu)
         acFw)
      :named
      given-4.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acF7)
         acFk)
      :named
      given-4.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFk)
         acFm)
      :named
      given-4.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF6
           acF6)
         acFi)
      :named
      given-4.7))
(assert
   (!
      (= acFw acFy)
      :named
      given-4.8))
(assert
   (!
      (= acFi acFm)
      :named
      given-4.9))
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(declare-const
   acFb
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acFb
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      acFb
                      acFb))
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acF7
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      acF7
                      acF7)))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acFb
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   acFb
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     acFb
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       acFb
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         acFb
                         acFb)))))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
      :named
      wanted-4))
(check-sat)
sat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_acGj {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acGh {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acGk {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acGi)
; (*: [acG8,acG8],acGg)
; (acGg,acGi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(declare-const
   acG8
   (Array String Int))
(declare-const
   acGg
   (Array String Int))
(declare-const
   acGi
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acGi)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acG8
           acG8)
         acGg)
      :named
      given-5.2))
(assert
   (!
      (= acGg acGi)
      :named
      given-5.3))
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
(assert
   (! false :named wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_acGW {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acGR {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acGS {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acGZ {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [acGB,acGB],acGV)
; (*: [acGB,acGC],acGQ)
; (acGQ,acGA)
; (acGV,acGB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
(push 1)
(declare-const
   acGA
   (Array String Int))
(declare-const
   acGB
   (Array String Int))
(declare-const
   acGC
   (Array String Int))
(declare-const
   acGQ
   (Array String Int))
(declare-const
   acGV
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGB)
         acGV)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGC)
         acGQ)
      :named
      given-6.2))
(assert
   (!
      (= acGQ acGA)
      :named
      given-6.3))
(assert
   (!
      (= acGV acGB)
      :named
      given-6.4))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_acGW {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acGR {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acGS {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acGZ {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acH9} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{acHe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [acGB,acGB],acGV)
; (*: [acGB,acGC],acGQ)
; (acGQ,acGA)
; (acGV,acGB)

; WANTEDS (Thoralf style)
; (*: [acGH,acGC],acGA)
; (*: [acGH,acGH],acGH)

(echo "givens-start-cycle-7")
(push 1)
(declare-const
   acGA
   (Array String Int))
(declare-const
   acGB
   (Array String Int))
(declare-const
   acGC
   (Array String Int))
(declare-const
   acGQ
   (Array String Int))
(declare-const
   acGV
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGB)
         acGV)
      :named
      given-7.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGC)
         acGQ)
      :named
      given-7.2))
(assert
   (!
      (= acGQ acGA)
      :named
      given-7.3))
(assert
   (!
      (= acGV acGB)
      :named
      given-7.4))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(declare-const
   acGH
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acGH
                    acGC)
                  acGA)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acGH
                 acGH)
               acGH)))
      :named
      wanted-7))
(check-sat)
sat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_acLw {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acKq {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKs {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKu {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKw {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKy {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKA {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKC {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKE {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKG {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKI {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKK {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKM {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKO {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKQ {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKS {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKU {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKW {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKY {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL0 {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL2 {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL4 {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL6 {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL8 {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLa {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLc {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLe {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLg {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLi {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLk {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLm {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLo {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLq {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLs {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLu {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKi {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acKk {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKg {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acLz {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acLA {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acLv)
; (*: [acHw,acKj],acKp)
; (*: [acHw,acKp],acKr)
; (*: [acHw,acKr],acKt)
; (*: [acHw,acKt],acKv)
; (*: [acHw,acKv],acKx)
; (*: [acHw,acKx],acKz)
; (*: [acHw,acKz],acKB)
; (*: [acHw,acKB],acKD)
; (*: [acHw,acKD],acKF)
; (*: [acHw,acKF],acKH)
; (*: [acHw,acKH],acKJ)
; (*: [acHw,acKJ],acKL)
; (*: [acHw,acKL],acKN)
; (*: [acHw,acKN],acKP)
; (*: [acHw,acKP],acKR)
; (*: [acHw,acKR],acKT)
; (*: [acHw,acKT],acKV)
; (*: [acHw,acKV],acKX)
; (*: [acHw,acKX],acKZ)
; (*: [acHw,acKZ],acL1)
; (*: [acHw,acL1],acL3)
; (*: [acHw,acL3],acL5)
; (*: [acHw,acL5],acL7)
; (*: [acHw,acL7],acL9)
; (*: [acHw,acL9],acLb)
; (*: [acHw,acLb],acLd)
; (*: [acHw,acLd],acLf)
; (*: [acHw,acLf],acLh)
; (*: [acHw,acLh],acLj)
; (*: [acHw,acLj],acLl)
; (*: [acHw,acLl],acLn)
; (*: [acHw,acLn],acLp)
; (*: [acHw,acLp],acLr)
; (*: [acHw,acLr],acLt)
; (*: [acHw,acHw],acKh)
; (*: [acHw,acKh],acKj)
; (*: [acHv,acHv],acKf)
; (acLt,acLv)
; (acKf,acKj)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
(push 1)
(declare-const
   acHv
   (Array String Int))
(declare-const
   acHw
   (Array String Int))
(declare-const
   acKf
   (Array String Int))
(declare-const
   acKh
   (Array String Int))
(declare-const
   acKj
   (Array String Int))
(declare-const
   acKp
   (Array String Int))
(declare-const
   acKr
   (Array String Int))
(declare-const
   acKt
   (Array String Int))
(declare-const
   acKv
   (Array String Int))
(declare-const
   acKx
   (Array String Int))
(declare-const
   acKz
   (Array String Int))
(declare-const
   acKB
   (Array String Int))
(declare-const
   acKD
   (Array String Int))
(declare-const
   acKF
   (Array String Int))
(declare-const
   acKH
   (Array String Int))
(declare-const
   acKJ
   (Array String Int))
(declare-const
   acKL
   (Array String Int))
(declare-const
   acKN
   (Array String Int))
(declare-const
   acKP
   (Array String Int))
(declare-const
   acKR
   (Array String Int))
(declare-const
   acKT
   (Array String Int))
(declare-const
   acKV
   (Array String Int))
(declare-const
   acKX
   (Array String Int))
(declare-const
   acKZ
   (Array String Int))
(declare-const
   acL1
   (Array String Int))
(declare-const
   acL3
   (Array String Int))
(declare-const
   acL5
   (Array String Int))
(declare-const
   acL7
   (Array String Int))
(declare-const
   acL9
   (Array String Int))
(declare-const
   acLb
   (Array String Int))
(declare-const
   acLd
   (Array String Int))
(declare-const
   acLf
   (Array String Int))
(declare-const
   acLh
   (Array String Int))
(declare-const
   acLj
   (Array String Int))
(declare-const
   acLl
   (Array String Int))
(declare-const
   acLn
   (Array String Int))
(declare-const
   acLp
   (Array String Int))
(declare-const
   acLr
   (Array String Int))
(declare-const
   acLt
   (Array String Int))
(declare-const
   acLv
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acLv)
      :named
      given-8.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKj)
         acKp)
      :named
      given-8.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKp)
         acKr)
      :named
      given-8.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKr)
         acKt)
      :named
      given-8.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKt)
         acKv)
      :named
      given-8.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKv)
         acKx)
      :named
      given-8.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKx)
         acKz)
      :named
      given-8.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKz)
         acKB)
      :named
      given-8.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKB)
         acKD)
      :named
      given-8.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKD)
         acKF)
      :named
      given-8.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKF)
         acKH)
      :named
      given-8.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKH)
         acKJ)
      :named
      given-8.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKJ)
         acKL)
      :named
      given-8.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKL)
         acKN)
      :named
      given-8.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKN)
         acKP)
      :named
      given-8.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKP)
         acKR)
      :named
      given-8.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKR)
         acKT)
      :named
      given-8.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKT)
         acKV)
      :named
      given-8.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKV)
         acKX)
      :named
      given-8.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKX)
         acKZ)
      :named
      given-8.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKZ)
         acL1)
      :named
      given-8.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL1)
         acL3)
      :named
      given-8.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL3)
         acL5)
      :named
      given-8.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL5)
         acL7)
      :named
      given-8.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL7)
         acL9)
      :named
      given-8.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL9)
         acLb)
      :named
      given-8.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLb)
         acLd)
      :named
      given-8.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLd)
         acLf)
      :named
      given-8.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLf)
         acLh)
      :named
      given-8.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLh)
         acLj)
      :named
      given-8.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLj)
         acLl)
      :named
      given-8.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLl)
         acLn)
      :named
      given-8.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLn)
         acLp)
      :named
      given-8.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLp)
         acLr)
      :named
      given-8.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLr)
         acLt)
      :named
      given-8.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acHw)
         acKh)
      :named
      given-8.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKh)
         acKj)
      :named
      given-8.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHv
           acHv)
         acKf)
      :named
      given-8.38))
(assert
   (!
      (= acLt acLv)
      :named
      given-8.39))
(assert
   (!
      (= acKf acKj)
      :named
      given-8.40))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_acLw {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acKq {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKs {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKu {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKw {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKy {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKA {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKC {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKE {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKG {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKI {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKK {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKM {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKO {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKQ {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKS {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKU {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKW {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKY {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL0 {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL2 {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL4 {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL6 {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL8 {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLa {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLc {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLe {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLg {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLi {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLk {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLm {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLo {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLq {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLs {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLu {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKi {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acKk {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKg {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acLz {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acLA {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acLH} {2}:: One ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acLv)
; (*: [acHw,acKj],acKp)
; (*: [acHw,acKp],acKr)
; (*: [acHw,acKr],acKt)
; (*: [acHw,acKt],acKv)
; (*: [acHw,acKv],acKx)
; (*: [acHw,acKx],acKz)
; (*: [acHw,acKz],acKB)
; (*: [acHw,acKB],acKD)
; (*: [acHw,acKD],acKF)
; (*: [acHw,acKF],acKH)
; (*: [acHw,acKH],acKJ)
; (*: [acHw,acKJ],acKL)
; (*: [acHw,acKL],acKN)
; (*: [acHw,acKN],acKP)
; (*: [acHw,acKP],acKR)
; (*: [acHw,acKR],acKT)
; (*: [acHw,acKT],acKV)
; (*: [acHw,acKV],acKX)
; (*: [acHw,acKX],acKZ)
; (*: [acHw,acKZ],acL1)
; (*: [acHw,acL1],acL3)
; (*: [acHw,acL3],acL5)
; (*: [acHw,acL5],acL7)
; (*: [acHw,acL7],acL9)
; (*: [acHw,acL9],acLb)
; (*: [acHw,acLb],acLd)
; (*: [acHw,acLd],acLf)
; (*: [acHw,acLf],acLh)
; (*: [acHw,acLh],acLj)
; (*: [acHw,acLj],acLl)
; (*: [acHw,acLl],acLn)
; (*: [acHw,acLn],acLp)
; (*: [acHw,acLp],acLr)
; (*: [acHw,acLr],acLt)
; (*: [acHw,acHw],acKh)
; (*: [acHw,acKh],acKj)
; (*: [acHv,acHv],acKf)
; (acLt,acLv)
; (acKf,acKj)

; WANTEDS (Thoralf style)
; (One [],acHw)

(echo "givens-start-cycle-9")
(push 1)
(declare-const
   acHv
   (Array String Int))
(declare-const
   acHw
   (Array String Int))
(declare-const
   acKf
   (Array String Int))
(declare-const
   acKh
   (Array String Int))
(declare-const
   acKj
   (Array String Int))
(declare-const
   acKp
   (Array String Int))
(declare-const
   acKr
   (Array String Int))
(declare-const
   acKt
   (Array String Int))
(declare-const
   acKv
   (Array String Int))
(declare-const
   acKx
   (Array String Int))
(declare-const
   acKz
   (Array String Int))
(declare-const
   acKB
   (Array String Int))
(declare-const
   acKD
   (Array String Int))
(declare-const
   acKF
   (Array String Int))
(declare-const
   acKH
   (Array String Int))
(declare-const
   acKJ
   (Array String Int))
(declare-const
   acKL
   (Array String Int))
(declare-const
   acKN
   (Array String Int))
(declare-const
   acKP
   (Array String Int))
(declare-const
   acKR
   (Array String Int))
(declare-const
   acKT
   (Array String Int))
(declare-const
   acKV
   (Array String Int))
(declare-const
   acKX
   (Array String Int))
(declare-const
   acKZ
   (Array String Int))
(declare-const
   acL1
   (Array String Int))
(declare-const
   acL3
   (Array String Int))
(declare-const
   acL5
   (Array String Int))
(declare-const
   acL7
   (Array String Int))
(declare-const
   acL9
   (Array String Int))
(declare-const
   acLb
   (Array String Int))
(declare-const
   acLd
   (Array String Int))
(declare-const
   acLf
   (Array String Int))
(declare-const
   acLh
   (Array String Int))
(declare-const
   acLj
   (Array String Int))
(declare-const
   acLl
   (Array String Int))
(declare-const
   acLn
   (Array String Int))
(declare-const
   acLp
   (Array String Int))
(declare-const
   acLr
   (Array String Int))
(declare-const
   acLt
   (Array String Int))
(declare-const
   acLv
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acLv)
      :named
      given-9.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKj)
         acKp)
      :named
      given-9.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKp)
         acKr)
      :named
      given-9.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKr)
         acKt)
      :named
      given-9.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKt)
         acKv)
      :named
      given-9.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKv)
         acKx)
      :named
      given-9.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKx)
         acKz)
      :named
      given-9.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKz)
         acKB)
      :named
      given-9.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKB)
         acKD)
      :named
      given-9.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKD)
         acKF)
      :named
      given-9.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKF)
         acKH)
      :named
      given-9.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKH)
         acKJ)
      :named
      given-9.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKJ)
         acKL)
      :named
      given-9.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKL)
         acKN)
      :named
      given-9.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKN)
         acKP)
      :named
      given-9.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKP)
         acKR)
      :named
      given-9.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKR)
         acKT)
      :named
      given-9.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKT)
         acKV)
      :named
      given-9.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKV)
         acKX)
      :named
      given-9.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKX)
         acKZ)
      :named
      given-9.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKZ)
         acL1)
      :named
      given-9.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL1)
         acL3)
      :named
      given-9.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL3)
         acL5)
      :named
      given-9.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL5)
         acL7)
      :named
      given-9.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL7)
         acL9)
      :named
      given-9.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL9)
         acLb)
      :named
      given-9.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLb)
         acLd)
      :named
      given-9.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLd)
         acLf)
      :named
      given-9.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLf)
         acLh)
      :named
      given-9.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLh)
         acLj)
      :named
      given-9.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLj)
         acLl)
      :named
      given-9.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLl)
         acLn)
      :named
      given-9.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLn)
         acLp)
      :named
      given-9.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLp)
         acLr)
      :named
      given-9.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLr)
         acLt)
      :named
      given-9.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acHw)
         acKh)
      :named
      given-9.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKh)
         acKj)
      :named
      given-9.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHv
           acHv)
         acKf)
      :named
      given-9.38))
(assert
   (!
      (= acLt acLv)
      :named
      given-9.39))
(assert
   (!
      (= acKf acKj)
      :named
      given-9.40))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHw)))
      :named
      wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_acM1 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acLV {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLX {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLZ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLN {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acLP {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLL {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acM4 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acM5 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acM0)
; (*: [acHE,acLO],acLU)
; (*: [acHE,acLU],acLW)
; (*: [acHE,acLW],acLY)
; (*: [acHE,acHE],acLM)
; (*: [acHE,acLM],acLO)
; (*: [acHD,acHD],acLK)
; (acLY,acM0)
; (acLK,acLO)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
(push 1)
(declare-const
   acHD
   (Array String Int))
(declare-const
   acHE
   (Array String Int))
(declare-const
   acLK
   (Array String Int))
(declare-const
   acLM
   (Array String Int))
(declare-const
   acLO
   (Array String Int))
(declare-const
   acLU
   (Array String Int))
(declare-const
   acLW
   (Array String Int))
(declare-const
   acLY
   (Array String Int))
(declare-const
   acM0
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acM0)
      :named
      given-10.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLO)
         acLU)
      :named
      given-10.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLU)
         acLW)
      :named
      given-10.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLW)
         acLY)
      :named
      given-10.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acHE)
         acLM)
      :named
      given-10.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLM)
         acLO)
      :named
      given-10.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHD
           acHD)
         acLK)
      :named
      given-10.7))
(assert
   (!
      (= acLY acM0)
      :named
      given-10.8))
(assert
   (!
      (= acLK acLO)
      :named
      given-10.9))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_acM1 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acLV {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLX {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLZ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLN {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acLP {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLL {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acM4 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acM5 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acMc} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acM0)
; (*: [acHE,acLO],acLU)
; (*: [acHE,acLU],acLW)
; (*: [acHE,acLW],acLY)
; (*: [acHE,acHE],acLM)
; (*: [acHE,acLM],acLO)
; (*: [acHD,acHD],acLK)
; (acLY,acM0)
; (acLK,acLO)

; WANTEDS (Thoralf style)
; (One [],acHD)

(echo "givens-start-cycle-11")
(push 1)
(declare-const
   acHD
   (Array String Int))
(declare-const
   acHE
   (Array String Int))
(declare-const
   acLK
   (Array String Int))
(declare-const
   acLM
   (Array String Int))
(declare-const
   acLO
   (Array String Int))
(declare-const
   acLU
   (Array String Int))
(declare-const
   acLW
   (Array String Int))
(declare-const
   acLY
   (Array String Int))
(declare-const
   acM0
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acM0)
      :named
      given-11.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLO)
         acLU)
      :named
      given-11.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLU)
         acLW)
      :named
      given-11.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLW)
         acLY)
      :named
      given-11.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acHE)
         acLM)
      :named
      given-11.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLM)
         acLO)
      :named
      given-11.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHD
           acHD)
         acLK)
      :named
      given-11.7))
(assert
   (!
      (= acLY acM0)
      :named
      given-11.8))
(assert
   (!
      (= acLK acLO)
      :named
      given-11.9))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHD)))
      :named
      wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_acMi {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acMg {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acMj {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acMh)
; (*: [acHL,acHL],acMf)
; (acMf,acMh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
(push 1)
(declare-const
   acHL
   (Array String Int))
(declare-const
   acMf
   (Array String Int))
(declare-const
   acMh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acMh)
      :named
      given-12.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHL
           acHL)
         acMf)
      :named
      given-12.2))
(assert
   (!
      (= acMf acMh)
      :named
      given-12.3))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_acMi {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acMg {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acMj {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acMo} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acMh)
; (*: [acHL,acHL],acMf)
; (acMf,acMh)

; WANTEDS (Thoralf style)
; (One [],acHL)

(echo "givens-start-cycle-13")
(push 1)
(declare-const
   acHL
   (Array String Int))
(declare-const
   acMf
   (Array String Int))
(declare-const
   acMh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acMh)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHL
           acHL)
         acMf)
      :named
      given-13.2))
(assert
   (!
      (= acMf acMh)
      :named
      given-13.3))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHL)))
      :named
      wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_acMx {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acMs {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acMt {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acMA {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [acHS,acHS],acMw)
; (*: [acHS,acHT],acMr)
; (acMr,acHR)
; (acMw,acHS)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
(push 1)
(declare-const
   acHR
   (Array String Int))
(declare-const
   acHS
   (Array String Int))
(declare-const
   acHT
   (Array String Int))
(declare-const
   acMr
   (Array String Int))
(declare-const
   acMw
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHS)
         acMw)
      :named
      given-14.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHT)
         acMr)
      :named
      given-14.2))
(assert
   (!
      (= acMr acHR)
      :named
      given-14.3))
(assert
   (!
      (= acMw acHS)
      :named
      given-14.4))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_acMx {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acMs {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acMt {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acMA {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acHZ} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [acHS,acHS],acMw)
; (*: [acHS,acHT],acMr)
; (acMr,acHR)
; (acMw,acHS)

; WANTEDS (Thoralf style)
; (acHR,acHT)

(echo "givens-start-cycle-15")
(push 1)
(declare-const
   acHR
   (Array String Int))
(declare-const
   acHS
   (Array String Int))
(declare-const
   acHT
   (Array String Int))
(declare-const
   acMr
   (Array String Int))
(declare-const
   acMw
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHS)
         acMw)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHT)
         acMr)
      :named
      given-15.2))
(assert
   (!
      (= acMr acHR)
      :named
      given-15.3))
(assert
   (!
      (= acMw acHS)
      :named
      given-15.4))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
(assert
   (!
      (or
         false
         (not
            (= acHR acHT)))
      :named
      wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(exit)
; [1 of 5] Compiling Abelian
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1HX} {1}:: (u *: (One /: u))
;                       ~
;                       (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1HH,/: [One [],a1HH]],*: [a1HJ,/: [One [],a1HJ]])

(echo "givens-start-cycle-1")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
(declare-const
   a1HH
   (Array String Int))
(declare-const
   a1HJ
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1HH
                 (
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (
                     (as
                        const
                        (Array String Int))
                     0)
                   a1HH))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1HJ
                 (
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (
                     (as
                        const
                        (Array String Int))
                     0)
                   a1HJ)))))
      :named
      wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1IA} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{a1IF} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Ir,a1Iq],*: [a1Io,a1In])
; (*: [a1In,a1Io],*: [a1Iq,a1Ir])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const
   a1In
   (Array String Int))
(declare-const
   a1Io
   (Array String Int))
(declare-const
   a1Iq
   (Array String Int))
(declare-const
   a1Ir
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    a1Ir
                    a1Iq)
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    a1Io
                    a1In))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1In
                 a1Io)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Iq
                 a1Ir))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Ja} {1}:: ((u0 *: v0) *: w0)
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)
; [WD] hole{a1Jj} {1}:: (u *: (v *: w))
;                       ~
;                       (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1IV,a1IW],a1IX],*: [*: [a1IR,a1IS],a1IT])
; (*: [a1IR,*: [a1IS,a1IT]],*: [a1IV,*: [a1IW,a1IX]])

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(declare-const
   a1IR
   (Array String Int))
(declare-const
   a1IS
   (Array String Int))
(declare-const
   a1IT
   (Array String Int))
(declare-const
   a1IV
   (Array String Int))
(declare-const
   a1IW
   (Array String Int))
(declare-const
   a1IX
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      a1IV
                      a1IW)
                    a1IX)
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      a1IR
                      a1IS)
                    a1IT))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IR
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IS
                   a1IT))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IV
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IW
                   a1IX)))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1K7} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1Jl],Base [a1Jl]],One [])

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(declare-const a1Jl String)
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base a1Jl one)
                 (store base a1Jl one))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Kg} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Jv,/: [One [],a1Jv]],One [])

(echo "givens-start-cycle-5")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
(declare-const
   a1Jv
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Jv
                 (
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (
                     (as
                        const
                        (Array String Int))
                     0)
                   a1Jv))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
      :named
      wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Kl} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JC,One []],a1JC)

(echo "givens-start-cycle-6")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(declare-const
   a1JC
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JC
                 (
                   (as
                      const
                      (Array String Int))
                   0))
               a1JC)))
      :named
      wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Ks} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JI,a1JJ],*: [a1JJ,a1JI])

(echo "givens-start-cycle-7")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(declare-const
   a1JI
   (Array String Int))
(declare-const
   a1JJ
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JI
                 a1JJ)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JJ
                 a1JI))))
      :named
      wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1KD} {1}:: (u *: (v *: w))
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JQ,*: [a1JR,a1JS]],*: [*: [a1JQ,a1JR],a1JS])

(echo "givens-start-cycle-8")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(declare-const
   a1JQ
   (Array String Int))
(declare-const
   a1JR
   (Array String Int))
(declare-const
   a1JS
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JQ
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1JR
                   a1JS))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1JQ
                   a1JR)
                 a1JS))))
      :named
      wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; [2 of 5] Compiling Plugins.Thoralf.UnitDefs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(exit)
; [3 of 5] Compiling Defs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{abjd} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base "byte" one)
                 (store base "byte" one)))))
      :named
      wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(exit)
; [5 of 5] Compiling Main
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_acEH {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acDB {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDD {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDF {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDH {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDJ {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDL {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDN {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDP {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDR {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDT {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDV {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDX {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDZ {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE1 {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE3 {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE5 {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE7 {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE9 {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEb {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEd {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEf {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEh {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEj {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEl {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEn {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEp {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEr {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEt {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEv {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEx {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEz {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEB {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acED {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEF {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDt {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acDv {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDr {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acEK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acEL {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acEG)
; (*: [acDa,acDu],acDA)
; (*: [acDa,acDA],acDC)
; (*: [acDa,acDC],acDE)
; (*: [acDa,acDE],acDG)
; (*: [acDa,acDG],acDI)
; (*: [acDa,acDI],acDK)
; (*: [acDa,acDK],acDM)
; (*: [acDa,acDM],acDO)
; (*: [acDa,acDO],acDQ)
; (*: [acDa,acDQ],acDS)
; (*: [acDa,acDS],acDU)
; (*: [acDa,acDU],acDW)
; (*: [acDa,acDW],acDY)
; (*: [acDa,acDY],acE0)
; (*: [acDa,acE0],acE2)
; (*: [acDa,acE2],acE4)
; (*: [acDa,acE4],acE6)
; (*: [acDa,acE6],acE8)
; (*: [acDa,acE8],acEa)
; (*: [acDa,acEa],acEc)
; (*: [acDa,acEc],acEe)
; (*: [acDa,acEe],acEg)
; (*: [acDa,acEg],acEi)
; (*: [acDa,acEi],acEk)
; (*: [acDa,acEk],acEm)
; (*: [acDa,acEm],acEo)
; (*: [acDa,acEo],acEq)
; (*: [acDa,acEq],acEs)
; (*: [acDa,acEs],acEu)
; (*: [acDa,acEu],acEw)
; (*: [acDa,acEw],acEy)
; (*: [acDa,acEy],acEA)
; (*: [acDa,acEA],acEC)
; (*: [acDa,acEC],acEE)
; (*: [acDa,acDa],acDs)
; (*: [acDa,acDs],acDu)
; (*: [acD9,acD9],acDq)
; (acEE,acEG)
; (acDq,acDu)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
(push 1)
(declare-const
   acD9
   (Array String Int))
(declare-const
   acDa
   (Array String Int))
(declare-const
   acDq
   (Array String Int))
(declare-const
   acDs
   (Array String Int))
(declare-const
   acDu
   (Array String Int))
(declare-const
   acDA
   (Array String Int))
(declare-const
   acDC
   (Array String Int))
(declare-const
   acDE
   (Array String Int))
(declare-const
   acDG
   (Array String Int))
(declare-const
   acDI
   (Array String Int))
(declare-const
   acDK
   (Array String Int))
(declare-const
   acDM
   (Array String Int))
(declare-const
   acDO
   (Array String Int))
(declare-const
   acDQ
   (Array String Int))
(declare-const
   acDS
   (Array String Int))
(declare-const
   acDU
   (Array String Int))
(declare-const
   acDW
   (Array String Int))
(declare-const
   acDY
   (Array String Int))
(declare-const
   acE0
   (Array String Int))
(declare-const
   acE2
   (Array String Int))
(declare-const
   acE4
   (Array String Int))
(declare-const
   acE6
   (Array String Int))
(declare-const
   acE8
   (Array String Int))
(declare-const
   acEa
   (Array String Int))
(declare-const
   acEc
   (Array String Int))
(declare-const
   acEe
   (Array String Int))
(declare-const
   acEg
   (Array String Int))
(declare-const
   acEi
   (Array String Int))
(declare-const
   acEk
   (Array String Int))
(declare-const
   acEm
   (Array String Int))
(declare-const
   acEo
   (Array String Int))
(declare-const
   acEq
   (Array String Int))
(declare-const
   acEs
   (Array String Int))
(declare-const
   acEu
   (Array String Int))
(declare-const
   acEw
   (Array String Int))
(declare-const
   acEy
   (Array String Int))
(declare-const
   acEA
   (Array String Int))
(declare-const
   acEC
   (Array String Int))
(declare-const
   acEE
   (Array String Int))
(declare-const
   acEG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acEG)
      :named
      given-1.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDu)
         acDA)
      :named
      given-1.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDA)
         acDC)
      :named
      given-1.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDC)
         acDE)
      :named
      given-1.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDE)
         acDG)
      :named
      given-1.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDG)
         acDI)
      :named
      given-1.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDI)
         acDK)
      :named
      given-1.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDK)
         acDM)
      :named
      given-1.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDM)
         acDO)
      :named
      given-1.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDO)
         acDQ)
      :named
      given-1.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDQ)
         acDS)
      :named
      given-1.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDS)
         acDU)
      :named
      given-1.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDU)
         acDW)
      :named
      given-1.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDW)
         acDY)
      :named
      given-1.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDY)
         acE0)
      :named
      given-1.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE0)
         acE2)
      :named
      given-1.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE2)
         acE4)
      :named
      given-1.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE4)
         acE6)
      :named
      given-1.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE6)
         acE8)
      :named
      given-1.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE8)
         acEa)
      :named
      given-1.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEa)
         acEc)
      :named
      given-1.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEc)
         acEe)
      :named
      given-1.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEe)
         acEg)
      :named
      given-1.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEg)
         acEi)
      :named
      given-1.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEi)
         acEk)
      :named
      given-1.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEk)
         acEm)
      :named
      given-1.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEm)
         acEo)
      :named
      given-1.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEo)
         acEq)
      :named
      given-1.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEq)
         acEs)
      :named
      given-1.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEs)
         acEu)
      :named
      given-1.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEu)
         acEw)
      :named
      given-1.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEw)
         acEy)
      :named
      given-1.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEy)
         acEA)
      :named
      given-1.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEA)
         acEC)
      :named
      given-1.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEC)
         acEE)
      :named
      given-1.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDa)
         acDs)
      :named
      given-1.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDs)
         acDu)
      :named
      given-1.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acD9
           acD9)
         acDq)
      :named
      given-1.38))
(assert
   (!
      (= acEE acEG)
      :named
      given-1.39))
(assert
   (!
      (= acDq acDu)
      :named
      given-1.40))
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] cobox_acEH {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acDB {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDD {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDF {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDH {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDJ {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDL {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDN {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDP {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDR {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDT {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDV {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDX {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDZ {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE1 {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE3 {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE5 {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE7 {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE9 {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEb {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEd {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEf {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEh {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEj {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEl {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEn {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEp {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEr {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEt {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEv {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEx {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEz {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEB {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acED {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEF {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDt {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acDv {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDr {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acEK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acEL {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acEU} {2}:: (a0 *: a0) ~ (b *: (b *: b)) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acEG)
; (*: [acDa,acDu],acDA)
; (*: [acDa,acDA],acDC)
; (*: [acDa,acDC],acDE)
; (*: [acDa,acDE],acDG)
; (*: [acDa,acDG],acDI)
; (*: [acDa,acDI],acDK)
; (*: [acDa,acDK],acDM)
; (*: [acDa,acDM],acDO)
; (*: [acDa,acDO],acDQ)
; (*: [acDa,acDQ],acDS)
; (*: [acDa,acDS],acDU)
; (*: [acDa,acDU],acDW)
; (*: [acDa,acDW],acDY)
; (*: [acDa,acDY],acE0)
; (*: [acDa,acE0],acE2)
; (*: [acDa,acE2],acE4)
; (*: [acDa,acE4],acE6)
; (*: [acDa,acE6],acE8)
; (*: [acDa,acE8],acEa)
; (*: [acDa,acEa],acEc)
; (*: [acDa,acEc],acEe)
; (*: [acDa,acEe],acEg)
; (*: [acDa,acEg],acEi)
; (*: [acDa,acEi],acEk)
; (*: [acDa,acEk],acEm)
; (*: [acDa,acEm],acEo)
; (*: [acDa,acEo],acEq)
; (*: [acDa,acEq],acEs)
; (*: [acDa,acEs],acEu)
; (*: [acDa,acEu],acEw)
; (*: [acDa,acEw],acEy)
; (*: [acDa,acEy],acEA)
; (*: [acDa,acEA],acEC)
; (*: [acDa,acEC],acEE)
; (*: [acDa,acDa],acDs)
; (*: [acDa,acDs],acDu)
; (*: [acD9,acD9],acDq)
; (acEE,acEG)
; (acDq,acDu)

; WANTEDS (Thoralf style)
; (*: [acDd,acDd],*: [acDa,*: [acDa,acDa]])

(echo "givens-start-cycle-2")
(push 1)
(declare-const
   acD9
   (Array String Int))
(declare-const
   acDa
   (Array String Int))
(declare-const
   acDq
   (Array String Int))
(declare-const
   acDs
   (Array String Int))
(declare-const
   acDu
   (Array String Int))
(declare-const
   acDA
   (Array String Int))
(declare-const
   acDC
   (Array String Int))
(declare-const
   acDE
   (Array String Int))
(declare-const
   acDG
   (Array String Int))
(declare-const
   acDI
   (Array String Int))
(declare-const
   acDK
   (Array String Int))
(declare-const
   acDM
   (Array String Int))
(declare-const
   acDO
   (Array String Int))
(declare-const
   acDQ
   (Array String Int))
(declare-const
   acDS
   (Array String Int))
(declare-const
   acDU
   (Array String Int))
(declare-const
   acDW
   (Array String Int))
(declare-const
   acDY
   (Array String Int))
(declare-const
   acE0
   (Array String Int))
(declare-const
   acE2
   (Array String Int))
(declare-const
   acE4
   (Array String Int))
(declare-const
   acE6
   (Array String Int))
(declare-const
   acE8
   (Array String Int))
(declare-const
   acEa
   (Array String Int))
(declare-const
   acEc
   (Array String Int))
(declare-const
   acEe
   (Array String Int))
(declare-const
   acEg
   (Array String Int))
(declare-const
   acEi
   (Array String Int))
(declare-const
   acEk
   (Array String Int))
(declare-const
   acEm
   (Array String Int))
(declare-const
   acEo
   (Array String Int))
(declare-const
   acEq
   (Array String Int))
(declare-const
   acEs
   (Array String Int))
(declare-const
   acEu
   (Array String Int))
(declare-const
   acEw
   (Array String Int))
(declare-const
   acEy
   (Array String Int))
(declare-const
   acEA
   (Array String Int))
(declare-const
   acEC
   (Array String Int))
(declare-const
   acEE
   (Array String Int))
(declare-const
   acEG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acEG)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDu)
         acDA)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDA)
         acDC)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDC)
         acDE)
      :named
      given-2.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDE)
         acDG)
      :named
      given-2.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDG)
         acDI)
      :named
      given-2.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDI)
         acDK)
      :named
      given-2.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDK)
         acDM)
      :named
      given-2.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDM)
         acDO)
      :named
      given-2.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDO)
         acDQ)
      :named
      given-2.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDQ)
         acDS)
      :named
      given-2.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDS)
         acDU)
      :named
      given-2.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDU)
         acDW)
      :named
      given-2.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDW)
         acDY)
      :named
      given-2.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDY)
         acE0)
      :named
      given-2.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE0)
         acE2)
      :named
      given-2.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE2)
         acE4)
      :named
      given-2.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE4)
         acE6)
      :named
      given-2.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE6)
         acE8)
      :named
      given-2.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acE8)
         acEa)
      :named
      given-2.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEa)
         acEc)
      :named
      given-2.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEc)
         acEe)
      :named
      given-2.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEe)
         acEg)
      :named
      given-2.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEg)
         acEi)
      :named
      given-2.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEi)
         acEk)
      :named
      given-2.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEk)
         acEm)
      :named
      given-2.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEm)
         acEo)
      :named
      given-2.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEo)
         acEq)
      :named
      given-2.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEq)
         acEs)
      :named
      given-2.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEs)
         acEu)
      :named
      given-2.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEu)
         acEw)
      :named
      given-2.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEw)
         acEy)
      :named
      given-2.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEy)
         acEA)
      :named
      given-2.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEA)
         acEC)
      :named
      given-2.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acEC)
         acEE)
      :named
      given-2.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDa)
         acDs)
      :named
      given-2.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acDa
           acDs)
         acDu)
      :named
      given-2.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acD9
           acD9)
         acDq)
      :named
      given-2.38))
(assert
   (!
      (= acEE acEG)
      :named
      given-2.39))
(assert
   (!
      (= acDq acDu)
      :named
      given-2.40))
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const
   acDd
   (Array String Int))
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acDd
                 acDd)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acDa
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   acDa
                   acDa)))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_acFz {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acFt {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFv {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFx {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFl {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acFn {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFj {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acFC {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acFD {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acFy)
; (*: [acF7,acFm],acFs)
; (*: [acF7,acFs],acFu)
; (*: [acF7,acFu],acFw)
; (*: [acF7,acF7],acFk)
; (*: [acF7,acFk],acFm)
; (*: [acF6,acF6],acFi)
; (acFw,acFy)
; (acFi,acFm)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
(push 1)
(declare-const
   acF6
   (Array String Int))
(declare-const
   acF7
   (Array String Int))
(declare-const
   acFi
   (Array String Int))
(declare-const
   acFk
   (Array String Int))
(declare-const
   acFm
   (Array String Int))
(declare-const
   acFs
   (Array String Int))
(declare-const
   acFu
   (Array String Int))
(declare-const
   acFw
   (Array String Int))
(declare-const
   acFy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acFy)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFm)
         acFs)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFs)
         acFu)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFu)
         acFw)
      :named
      given-3.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acF7)
         acFk)
      :named
      given-3.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFk)
         acFm)
      :named
      given-3.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF6
           acF6)
         acFi)
      :named
      given-3.7))
(assert
   (!
      (= acFw acFy)
      :named
      given-3.8))
(assert
   (!
      (= acFi acFm)
      :named
      given-3.9))
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] cobox_acFz {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acFt {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFv {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFx {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFl {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acFn {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFj {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acFC {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acFD {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acFP} {3}:: (b0 *: (b0 *: b0))
;                       ~
;                       (b *: (b *: b)) (CNonCanonical)
; [WD] hole{acFY} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                       ~
;                       One (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acFy)
; (*: [acF7,acFm],acFs)
; (*: [acF7,acFs],acFu)
; (*: [acF7,acFu],acFw)
; (*: [acF7,acF7],acFk)
; (*: [acF7,acFk],acFm)
; (*: [acF6,acF6],acFi)
; (acFw,acFy)
; (acFi,acFm)

; WANTEDS (Thoralf style)
; (*: [acFb,*: [acFb,acFb]],*: [acF7,*: [acF7,acF7]])
; (*: [acFb,*: [acFb,*: [acFb,*: [acFb,*: [acFb,acFb]]]]],One [])

(echo "givens-start-cycle-4")
(push 1)
(declare-const
   acF6
   (Array String Int))
(declare-const
   acF7
   (Array String Int))
(declare-const
   acFi
   (Array String Int))
(declare-const
   acFk
   (Array String Int))
(declare-const
   acFm
   (Array String Int))
(declare-const
   acFs
   (Array String Int))
(declare-const
   acFu
   (Array String Int))
(declare-const
   acFw
   (Array String Int))
(declare-const
   acFy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acFy)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFm)
         acFs)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFs)
         acFu)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFu)
         acFw)
      :named
      given-4.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acF7)
         acFk)
      :named
      given-4.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF7
           acFk)
         acFm)
      :named
      given-4.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acF6
           acF6)
         acFi)
      :named
      given-4.7))
(assert
   (!
      (= acFw acFy)
      :named
      given-4.8))
(assert
   (!
      (= acFi acFm)
      :named
      given-4.9))
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(declare-const
   acFb
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acFb
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      acFb
                      acFb))
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acF7
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      acF7
                      acF7)))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acFb
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   acFb
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     acFb
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       acFb
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         acFb
                         acFb)))))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
      :named
      wanted-4))
(check-sat)
sat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_acGj {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acGh {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acGk {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acGi)
; (*: [acG8,acG8],acGg)
; (acGg,acGi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(declare-const
   acG8
   (Array String Int))
(declare-const
   acGg
   (Array String Int))
(declare-const
   acGi
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acGi)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acG8
           acG8)
         acGg)
      :named
      given-5.2))
(assert
   (!
      (= acGg acGi)
      :named
      given-5.3))
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
(assert
   (! false :named wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_acGW {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acGR {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acGS {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acGZ {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [acGB,acGB],acGV)
; (*: [acGB,acGC],acGQ)
; (acGQ,acGA)
; (acGV,acGB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
(push 1)
(declare-const
   acGA
   (Array String Int))
(declare-const
   acGB
   (Array String Int))
(declare-const
   acGC
   (Array String Int))
(declare-const
   acGQ
   (Array String Int))
(declare-const
   acGV
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGB)
         acGV)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGC)
         acGQ)
      :named
      given-6.2))
(assert
   (!
      (= acGQ acGA)
      :named
      given-6.3))
(assert
   (!
      (= acGV acGB)
      :named
      given-6.4))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_acGW {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acGR {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acGS {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acGZ {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acH9} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{acHe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [acGB,acGB],acGV)
; (*: [acGB,acGC],acGQ)
; (acGQ,acGA)
; (acGV,acGB)

; WANTEDS (Thoralf style)
; (*: [acGH,acGC],acGA)
; (*: [acGH,acGH],acGH)

(echo "givens-start-cycle-7")
(push 1)
(declare-const
   acGA
   (Array String Int))
(declare-const
   acGB
   (Array String Int))
(declare-const
   acGC
   (Array String Int))
(declare-const
   acGQ
   (Array String Int))
(declare-const
   acGV
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGB)
         acGV)
      :named
      given-7.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acGB
           acGC)
         acGQ)
      :named
      given-7.2))
(assert
   (!
      (= acGQ acGA)
      :named
      given-7.3))
(assert
   (!
      (= acGV acGB)
      :named
      given-7.4))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(declare-const
   acGH
   (Array String Int))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acGH
                    acGC)
                  acGA)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acGH
                 acGH)
               acGH)))
      :named
      wanted-7))
(check-sat)
sat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_acLw {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acKq {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKs {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKu {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKw {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKy {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKA {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKC {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKE {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKG {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKI {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKK {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKM {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKO {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKQ {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKS {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKU {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKW {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKY {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL0 {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL2 {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL4 {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL6 {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL8 {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLa {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLc {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLe {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLg {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLi {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLk {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLm {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLo {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLq {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLs {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLu {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKi {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acKk {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKg {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acLz {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acLA {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acLv)
; (*: [acHw,acKj],acKp)
; (*: [acHw,acKp],acKr)
; (*: [acHw,acKr],acKt)
; (*: [acHw,acKt],acKv)
; (*: [acHw,acKv],acKx)
; (*: [acHw,acKx],acKz)
; (*: [acHw,acKz],acKB)
; (*: [acHw,acKB],acKD)
; (*: [acHw,acKD],acKF)
; (*: [acHw,acKF],acKH)
; (*: [acHw,acKH],acKJ)
; (*: [acHw,acKJ],acKL)
; (*: [acHw,acKL],acKN)
; (*: [acHw,acKN],acKP)
; (*: [acHw,acKP],acKR)
; (*: [acHw,acKR],acKT)
; (*: [acHw,acKT],acKV)
; (*: [acHw,acKV],acKX)
; (*: [acHw,acKX],acKZ)
; (*: [acHw,acKZ],acL1)
; (*: [acHw,acL1],acL3)
; (*: [acHw,acL3],acL5)
; (*: [acHw,acL5],acL7)
; (*: [acHw,acL7],acL9)
; (*: [acHw,acL9],acLb)
; (*: [acHw,acLb],acLd)
; (*: [acHw,acLd],acLf)
; (*: [acHw,acLf],acLh)
; (*: [acHw,acLh],acLj)
; (*: [acHw,acLj],acLl)
; (*: [acHw,acLl],acLn)
; (*: [acHw,acLn],acLp)
; (*: [acHw,acLp],acLr)
; (*: [acHw,acLr],acLt)
; (*: [acHw,acHw],acKh)
; (*: [acHw,acKh],acKj)
; (*: [acHv,acHv],acKf)
; (acLt,acLv)
; (acKf,acKj)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
(push 1)
(declare-const
   acHv
   (Array String Int))
(declare-const
   acHw
   (Array String Int))
(declare-const
   acKf
   (Array String Int))
(declare-const
   acKh
   (Array String Int))
(declare-const
   acKj
   (Array String Int))
(declare-const
   acKp
   (Array String Int))
(declare-const
   acKr
   (Array String Int))
(declare-const
   acKt
   (Array String Int))
(declare-const
   acKv
   (Array String Int))
(declare-const
   acKx
   (Array String Int))
(declare-const
   acKz
   (Array String Int))
(declare-const
   acKB
   (Array String Int))
(declare-const
   acKD
   (Array String Int))
(declare-const
   acKF
   (Array String Int))
(declare-const
   acKH
   (Array String Int))
(declare-const
   acKJ
   (Array String Int))
(declare-const
   acKL
   (Array String Int))
(declare-const
   acKN
   (Array String Int))
(declare-const
   acKP
   (Array String Int))
(declare-const
   acKR
   (Array String Int))
(declare-const
   acKT
   (Array String Int))
(declare-const
   acKV
   (Array String Int))
(declare-const
   acKX
   (Array String Int))
(declare-const
   acKZ
   (Array String Int))
(declare-const
   acL1
   (Array String Int))
(declare-const
   acL3
   (Array String Int))
(declare-const
   acL5
   (Array String Int))
(declare-const
   acL7
   (Array String Int))
(declare-const
   acL9
   (Array String Int))
(declare-const
   acLb
   (Array String Int))
(declare-const
   acLd
   (Array String Int))
(declare-const
   acLf
   (Array String Int))
(declare-const
   acLh
   (Array String Int))
(declare-const
   acLj
   (Array String Int))
(declare-const
   acLl
   (Array String Int))
(declare-const
   acLn
   (Array String Int))
(declare-const
   acLp
   (Array String Int))
(declare-const
   acLr
   (Array String Int))
(declare-const
   acLt
   (Array String Int))
(declare-const
   acLv
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acLv)
      :named
      given-8.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKj)
         acKp)
      :named
      given-8.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKp)
         acKr)
      :named
      given-8.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKr)
         acKt)
      :named
      given-8.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKt)
         acKv)
      :named
      given-8.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKv)
         acKx)
      :named
      given-8.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKx)
         acKz)
      :named
      given-8.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKz)
         acKB)
      :named
      given-8.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKB)
         acKD)
      :named
      given-8.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKD)
         acKF)
      :named
      given-8.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKF)
         acKH)
      :named
      given-8.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKH)
         acKJ)
      :named
      given-8.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKJ)
         acKL)
      :named
      given-8.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKL)
         acKN)
      :named
      given-8.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKN)
         acKP)
      :named
      given-8.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKP)
         acKR)
      :named
      given-8.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKR)
         acKT)
      :named
      given-8.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKT)
         acKV)
      :named
      given-8.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKV)
         acKX)
      :named
      given-8.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKX)
         acKZ)
      :named
      given-8.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKZ)
         acL1)
      :named
      given-8.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL1)
         acL3)
      :named
      given-8.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL3)
         acL5)
      :named
      given-8.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL5)
         acL7)
      :named
      given-8.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL7)
         acL9)
      :named
      given-8.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL9)
         acLb)
      :named
      given-8.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLb)
         acLd)
      :named
      given-8.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLd)
         acLf)
      :named
      given-8.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLf)
         acLh)
      :named
      given-8.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLh)
         acLj)
      :named
      given-8.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLj)
         acLl)
      :named
      given-8.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLl)
         acLn)
      :named
      given-8.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLn)
         acLp)
      :named
      given-8.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLp)
         acLr)
      :named
      given-8.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLr)
         acLt)
      :named
      given-8.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acHw)
         acKh)
      :named
      given-8.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKh)
         acKj)
      :named
      given-8.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHv
           acHv)
         acKf)
      :named
      given-8.38))
(assert
   (!
      (= acLt acLv)
      :named
      given-8.39))
(assert
   (!
      (= acKf acKj)
      :named
      given-8.40))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_acLw {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acKq {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKs {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKu {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKw {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKy {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKA {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKC {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKE {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKG {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKI {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKK {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKM {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKO {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKQ {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKS {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKU {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKW {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKY {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL0 {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL2 {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL4 {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL6 {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL8 {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLa {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLc {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLe {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLg {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLi {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLk {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLm {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLo {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLq {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLs {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLu {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKi {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acKk {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKg {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acLz {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acLA {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acLH} {2}:: One ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acLv)
; (*: [acHw,acKj],acKp)
; (*: [acHw,acKp],acKr)
; (*: [acHw,acKr],acKt)
; (*: [acHw,acKt],acKv)
; (*: [acHw,acKv],acKx)
; (*: [acHw,acKx],acKz)
; (*: [acHw,acKz],acKB)
; (*: [acHw,acKB],acKD)
; (*: [acHw,acKD],acKF)
; (*: [acHw,acKF],acKH)
; (*: [acHw,acKH],acKJ)
; (*: [acHw,acKJ],acKL)
; (*: [acHw,acKL],acKN)
; (*: [acHw,acKN],acKP)
; (*: [acHw,acKP],acKR)
; (*: [acHw,acKR],acKT)
; (*: [acHw,acKT],acKV)
; (*: [acHw,acKV],acKX)
; (*: [acHw,acKX],acKZ)
; (*: [acHw,acKZ],acL1)
; (*: [acHw,acL1],acL3)
; (*: [acHw,acL3],acL5)
; (*: [acHw,acL5],acL7)
; (*: [acHw,acL7],acL9)
; (*: [acHw,acL9],acLb)
; (*: [acHw,acLb],acLd)
; (*: [acHw,acLd],acLf)
; (*: [acHw,acLf],acLh)
; (*: [acHw,acLh],acLj)
; (*: [acHw,acLj],acLl)
; (*: [acHw,acLl],acLn)
; (*: [acHw,acLn],acLp)
; (*: [acHw,acLp],acLr)
; (*: [acHw,acLr],acLt)
; (*: [acHw,acHw],acKh)
; (*: [acHw,acKh],acKj)
; (*: [acHv,acHv],acKf)
; (acLt,acLv)
; (acKf,acKj)

; WANTEDS (Thoralf style)
; (One [],acHw)

(echo "givens-start-cycle-9")
(push 1)
(declare-const
   acHv
   (Array String Int))
(declare-const
   acHw
   (Array String Int))
(declare-const
   acKf
   (Array String Int))
(declare-const
   acKh
   (Array String Int))
(declare-const
   acKj
   (Array String Int))
(declare-const
   acKp
   (Array String Int))
(declare-const
   acKr
   (Array String Int))
(declare-const
   acKt
   (Array String Int))
(declare-const
   acKv
   (Array String Int))
(declare-const
   acKx
   (Array String Int))
(declare-const
   acKz
   (Array String Int))
(declare-const
   acKB
   (Array String Int))
(declare-const
   acKD
   (Array String Int))
(declare-const
   acKF
   (Array String Int))
(declare-const
   acKH
   (Array String Int))
(declare-const
   acKJ
   (Array String Int))
(declare-const
   acKL
   (Array String Int))
(declare-const
   acKN
   (Array String Int))
(declare-const
   acKP
   (Array String Int))
(declare-const
   acKR
   (Array String Int))
(declare-const
   acKT
   (Array String Int))
(declare-const
   acKV
   (Array String Int))
(declare-const
   acKX
   (Array String Int))
(declare-const
   acKZ
   (Array String Int))
(declare-const
   acL1
   (Array String Int))
(declare-const
   acL3
   (Array String Int))
(declare-const
   acL5
   (Array String Int))
(declare-const
   acL7
   (Array String Int))
(declare-const
   acL9
   (Array String Int))
(declare-const
   acLb
   (Array String Int))
(declare-const
   acLd
   (Array String Int))
(declare-const
   acLf
   (Array String Int))
(declare-const
   acLh
   (Array String Int))
(declare-const
   acLj
   (Array String Int))
(declare-const
   acLl
   (Array String Int))
(declare-const
   acLn
   (Array String Int))
(declare-const
   acLp
   (Array String Int))
(declare-const
   acLr
   (Array String Int))
(declare-const
   acLt
   (Array String Int))
(declare-const
   acLv
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acLv)
      :named
      given-9.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKj)
         acKp)
      :named
      given-9.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKp)
         acKr)
      :named
      given-9.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKr)
         acKt)
      :named
      given-9.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKt)
         acKv)
      :named
      given-9.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKv)
         acKx)
      :named
      given-9.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKx)
         acKz)
      :named
      given-9.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKz)
         acKB)
      :named
      given-9.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKB)
         acKD)
      :named
      given-9.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKD)
         acKF)
      :named
      given-9.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKF)
         acKH)
      :named
      given-9.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKH)
         acKJ)
      :named
      given-9.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKJ)
         acKL)
      :named
      given-9.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKL)
         acKN)
      :named
      given-9.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKN)
         acKP)
      :named
      given-9.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKP)
         acKR)
      :named
      given-9.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKR)
         acKT)
      :named
      given-9.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKT)
         acKV)
      :named
      given-9.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKV)
         acKX)
      :named
      given-9.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKX)
         acKZ)
      :named
      given-9.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKZ)
         acL1)
      :named
      given-9.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL1)
         acL3)
      :named
      given-9.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL3)
         acL5)
      :named
      given-9.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL5)
         acL7)
      :named
      given-9.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL7)
         acL9)
      :named
      given-9.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL9)
         acLb)
      :named
      given-9.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLb)
         acLd)
      :named
      given-9.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLd)
         acLf)
      :named
      given-9.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLf)
         acLh)
      :named
      given-9.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLh)
         acLj)
      :named
      given-9.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLj)
         acLl)
      :named
      given-9.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLl)
         acLn)
      :named
      given-9.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLn)
         acLp)
      :named
      given-9.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLp)
         acLr)
      :named
      given-9.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLr)
         acLt)
      :named
      given-9.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acHw)
         acKh)
      :named
      given-9.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKh)
         acKj)
      :named
      given-9.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHv
           acHv)
         acKf)
      :named
      given-9.38))
(assert
   (!
      (= acLt acLv)
      :named
      given-9.39))
(assert
   (!
      (= acKf acKj)
      :named
      given-9.40))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHw)))
      :named
      wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_acM1 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acLV {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLX {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLZ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLN {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acLP {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLL {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acM4 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acM5 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acM0)
; (*: [acHE,acLO],acLU)
; (*: [acHE,acLU],acLW)
; (*: [acHE,acLW],acLY)
; (*: [acHE,acHE],acLM)
; (*: [acHE,acLM],acLO)
; (*: [acHD,acHD],acLK)
; (acLY,acM0)
; (acLK,acLO)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
(push 1)
(declare-const
   acHD
   (Array String Int))
(declare-const
   acHE
   (Array String Int))
(declare-const
   acLK
   (Array String Int))
(declare-const
   acLM
   (Array String Int))
(declare-const
   acLO
   (Array String Int))
(declare-const
   acLU
   (Array String Int))
(declare-const
   acLW
   (Array String Int))
(declare-const
   acLY
   (Array String Int))
(declare-const
   acM0
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acM0)
      :named
      given-10.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLO)
         acLU)
      :named
      given-10.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLU)
         acLW)
      :named
      given-10.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLW)
         acLY)
      :named
      given-10.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acHE)
         acLM)
      :named
      given-10.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLM)
         acLO)
      :named
      given-10.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHD
           acHD)
         acLK)
      :named
      given-10.7))
(assert
   (!
      (= acLY acM0)
      :named
      given-10.8))
(assert
   (!
      (= acLK acLO)
      :named
      given-10.9))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_acM1 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acLV {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLX {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLZ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLN {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acLP {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLL {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acM4 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acM5 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acMc} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acM0)
; (*: [acHE,acLO],acLU)
; (*: [acHE,acLU],acLW)
; (*: [acHE,acLW],acLY)
; (*: [acHE,acHE],acLM)
; (*: [acHE,acLM],acLO)
; (*: [acHD,acHD],acLK)
; (acLY,acM0)
; (acLK,acLO)

; WANTEDS (Thoralf style)
; (One [],acHD)

(echo "givens-start-cycle-11")
(push 1)
(declare-const
   acHD
   (Array String Int))
(declare-const
   acHE
   (Array String Int))
(declare-const
   acLK
   (Array String Int))
(declare-const
   acLM
   (Array String Int))
(declare-const
   acLO
   (Array String Int))
(declare-const
   acLU
   (Array String Int))
(declare-const
   acLW
   (Array String Int))
(declare-const
   acLY
   (Array String Int))
(declare-const
   acM0
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acM0)
      :named
      given-11.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLO)
         acLU)
      :named
      given-11.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLU)
         acLW)
      :named
      given-11.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLW)
         acLY)
      :named
      given-11.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acHE)
         acLM)
      :named
      given-11.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLM)
         acLO)
      :named
      given-11.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHD
           acHD)
         acLK)
      :named
      given-11.7))
(assert
   (!
      (= acLY acM0)
      :named
      given-11.8))
(assert
   (!
      (= acLK acLO)
      :named
      given-11.9))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHD)))
      :named
      wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_acMi {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acMg {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acMj {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],acMh)
; (*: [acHL,acHL],acMf)
; (acMf,acMh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
(push 1)
(declare-const
   acHL
   (Array String Int))
(declare-const
   acMf
   (Array String Int))
(declare-const
   acMh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acMh)
      :named
      given-12.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHL
           acHL)
         acMf)
      :named
      given-12.2))
(assert
   (!
      (= acMf acMh)
      :named
      given-12.3))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_acMi {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acMg {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acMj {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acMo} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acMh)
; (*: [acHL,acHL],acMf)
; (acMf,acMh)

; WANTEDS (Thoralf style)
; (One [],acHL)

(echo "givens-start-cycle-13")
(push 1)
(declare-const
   acHL
   (Array String Int))
(declare-const
   acMf
   (Array String Int))
(declare-const
   acMh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acMh)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHL
           acHL)
         acMf)
      :named
      given-13.2))
(assert
   (!
      (= acMf acMh)
      :named
      given-13.3))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHL)))
      :named
      wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_acMx {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acMs {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acMt {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acMA {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [acHS,acHS],acMw)
; (*: [acHS,acHT],acMr)
; (acMr,acHR)
; (acMw,acHS)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
(push 1)
(declare-const
   acHR
   (Array String Int))
(declare-const
   acHS
   (Array String Int))
(declare-const
   acHT
   (Array String Int))
(declare-const
   acMr
   (Array String Int))
(declare-const
   acMw
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHS)
         acMw)
      :named
      given-14.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHT)
         acMr)
      :named
      given-14.2))
(assert
   (!
      (= acMr acHR)
      :named
      given-14.3))
(assert
   (!
      (= acMw acHS)
      :named
      given-14.4))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_acMx {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acMs {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acMt {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acMA {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acHZ} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [acHS,acHS],acMw)
; (*: [acHS,acHT],acMr)
; (acMr,acHR)
; (acMw,acHS)

; WANTEDS (Thoralf style)
; (acHR,acHT)

(echo "givens-start-cycle-15")
(push 1)
(declare-const
   acHR
   (Array String Int))
(declare-const
   acHS
   (Array String Int))
(declare-const
   acHT
   (Array String Int))
(declare-const
   acMr
   (Array String Int))
(declare-const
   acMw
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHS)
         acMw)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHS
           acHT)
         acMr)
      :named
      given-15.2))
(assert
   (!
      (= acMr acHR)
      :named
      given-15.3))
(assert
   (!
      (= acMw acHS)
      :named
      given-15.4))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
(assert
   (!
      (or
         false
         (not
            (= acHR acHT)))
      :named
      wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(exit)
; Test suite units: RUNNING...
; Test suite units: PASS