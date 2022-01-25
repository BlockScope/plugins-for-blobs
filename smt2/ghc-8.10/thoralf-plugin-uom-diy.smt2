; Build profile: -w ghc-8.10.7 -O1
; [1 of 2] Compiling UoM
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(echo "solver-start-cycle-1")
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aVE} {2}:: (Base "m" *: One)
;                         ~ (((Base "m" *: One) /: (Base "s" *: One))
;                            *: (Base "s" *: One)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],One []],*: [/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],*: [Base ["s"],One []]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aVE} {2}:: (Base "m" *: One)
;                              ~ (((Base "m" *: One) /: (Base "s" *: One))
;                                 *: (Base "s" *: One)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "m" one)
;          (
;            (as
;               const
;               (Array String Int))
;            0))
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "s" one)
;          (
;            (as
;               const
;               (Array String Int))
;            0)))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        (store base "s" one)
;        (
;          (as
;             const
;             (Array String Int))
;          0))))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aVE} {2}:: (Base "m" *: One)
;                              ~ (((Base "m" *: One) /: (Base "s" *: One))
;                                 *: (Base "s" *: One)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "m" one)
;          (
;            (as
;               const
;               (Array String Int))
;            0))
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "s" one)
;          (
;            (as
;               const
;               (Array String Int))
;            0)))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        (store base "s" one)
;        (
;          (as
;             const
;             (Array String Int))
;          0))))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (store base "m" one)
              (
                (as
                   const
                   (Array String Int))
                0))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (_
                   map
                   (-
                      (Int Int)
                      Int))
                (
                  (_
                     map
                     (+
                        (Int Int)
                        Int))
                  (store base "m" one)
                  (
                    (as
                       const
                       (Array String Int))
                    0))
                (
                  (_
                     map
                     (+
                        (Int Int)
                        Int))
                  (store base "s" one)
                  (
                    (as
                       const
                       (Array String Int))
                    0)))
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                (store base "s" one)
                (
                  (as
                     const
                     (Array String Int))
                  0)))))
      :named
      wanted-5))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-5")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (store base "m" one)
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (_
;                     map
;                     (+
;                        (Int Int)
;                        Int))
;                  (store base "m" one)
;                  (
;                    (as
;                       const
;                       (Array String Int))
;                    0))
;                (
;                  (_
;                     map
;                     (+
;                        (Int Int)
;                        Int))
;                  (store base "s" one)
;                  (
;                    (as
;                       const
;                       (Array String Int))
;                    0)))
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                (store base "s" one)
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)))))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] co_aWd {4}:: One ~ fsk0 (CFunEqCan)
; [G] co_aWb {3}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] co_aWh {3}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] co_aWf {3}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_aWj {3}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_aWl {2}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_aWo {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aWx} {2}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aWc)
; (Base ["m"],aWa)
; (Base ["s"],aWg)
; (*: [aWa,aWc],aWe)
; (*: [aWg,aWc],aWi)
; (/: [aWe,aWi],aWk)
; (aWk,aUB)

; WANTEDS (Thoralf style)
; (*: [aUB,aWi],aWe)

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_aWx} {2}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aUB
;      aWi)
;    aWe)

; GIVENS (names)
;  aUB  <=  mps
;  aWa  <=  fsk_aWa
;  aWc  <=  fsk_aWc
;  aWe  <=  fsk_aWe
;  aWg  <=  fsk_aWg
;  aWi  <=  fsk_aWi
;  aWk  <=  fsk_aWk
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aUB (Array String Int))
; (declare-const aWa (Array String Int))
; (declare-const aWc (Array String Int))
; (declare-const aWe (Array String Int))
; (declare-const aWg (Array String Int))
; (declare-const aWi (Array String Int))
; (declare-const aWk (Array String Int))
(declare-const
   aUB
   (Array String Int))
(declare-const
   aWa
   (Array String Int))
(declare-const
   aWc
   (Array String Int))
(declare-const
   aWe
   (Array String Int))
(declare-const
   aWg
   (Array String Int))
(declare-const
   aWi
   (Array String Int))
(declare-const
   aWk
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aWc)
      :named
      given-9.1))
(assert
   (!
      (=
         (store base "m" one)
         aWa)
      :named
      given-9.2))
(assert
   (!
      (=
         (store base "s" one)
         aWg)
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
           aWa
           aWc)
         aWe)
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
           aWg
           aWc)
         aWi)
      :named
      given-9.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aWe
           aWi)
         aWk)
      :named
      given-9.6))
(assert
   (!
      (= aWk aUB)
      :named
      given-9.7))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_aWx} {2}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aUB
;      aWi)
;    aWe)

; WANTEDS (names)
;  aUB  <=  mps
;  aWe  <=  fsk_aWe
;  aWi  <=  fsk_aWi
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aUB
              aWi)
            aWe))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         aWc)
;      :named
;      given-9.1)
;   (!
;      (=
;         (store base "m" one)
;         aWa)
;      :named
;      given-9.2)
;   (!
;      (=
;         (store base "s" one)
;         aWg)
;      :named
;      given-9.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aWa
;           aWc)
;         aWe)
;      :named
;      given-9.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aWg
;           aWc)
;         aWi)
;      :named
;      given-9.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           aWe
;           aWi)
;         aWk)
;      :named
;      given-9.6)
;   (!
;      (= aWk aUB)
;      :named
;      given-9.7)
;   (!
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aUB
;              aWi)
;            aWe))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.4 given-9.6 given-9.7 wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(exit)
; [2 of 2] Compiling Main
; Test suite uom-diy: RUNNING...
; Test suite uom-diy: PASS