; Build profile: -w ghc-8.2.2 -O1
; [1 of 2] Compiling UoM
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
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

; GIVENS (GHC style)
; [G] cobox_a1Bz {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1Bx {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1BD {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1BB {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1BF {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1BH {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1BL {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],a1By)
; (Base ["m"],a1Bw)
; (Base ["s"],a1BC)
; (*: [a1Bw,a1By],a1BA)
; (*: [a1BC,a1By],a1BE)
; (/: [a1BA,a1BE],a1BG)
; (a1BG,a1u1)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
;  a1u1  <=  mps
;  a1Bw  <=  fsk_a1Bw
;  a1By  <=  fsk_a1By
;  a1BA  <=  fsk_a1BA
;  a1BC  <=  fsk_a1BC
;  a1BE  <=  fsk_a1BE
;  a1BG  <=  fsk_a1BG
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1BA (Array String Int))
; (declare-const a1BC (Array String Int))
; (declare-const a1BE (Array String Int))
; (declare-const a1BG (Array String Int))
; (declare-const a1Bw (Array String Int))
; (declare-const a1By (Array String Int))
; (declare-const a1u1 (Array String Int))
(declare-const
   a1u1
   (Array String Int))
(declare-const
   a1Bw
   (Array String Int))
(declare-const
   a1By
   (Array String Int))
(declare-const
   a1BA
   (Array String Int))
(declare-const
   a1BC
   (Array String Int))
(declare-const
   a1BE
   (Array String Int))
(declare-const
   a1BG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a1By)
      :named
      given-1.1))
(assert
   (!
      (=
         (store base "m" one)
         a1Bw)
      :named
      given-1.2))
(assert
   (!
      (=
         (store base "s" one)
         a1BC)
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
           a1Bw
           a1By)
         a1BA)
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
           a1BC
           a1By)
         a1BE)
      :named
      given-1.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           a1BA
           a1BE)
         a1BG)
      :named
      given-1.6))
(assert
   (!
      (= a1BG a1u1)
      :named
      given-1.7))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
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
;         a1By)
;      :named
;      given-1.1)
;   (!
;      (=
;         (store base "m" one)
;         a1Bw)
;      :named
;      given-1.2)
;   (!
;      (=
;         (store base "s" one)
;         a1BC)
;      :named
;      given-1.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1Bw
;           a1By)
;         a1BA)
;      :named
;      given-1.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1BC
;           a1By)
;         a1BE)
;      :named
;      given-1.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           a1BA
;           a1BE)
;         a1BG)
;      :named
;      given-1.6)
;   (!
;      (= a1BG a1u1)
;      :named
;      given-1.7)
;   (! false :named wanted-1))
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] cobox_a1Cw {1}:: (a /: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1CA {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (/: [a1Cl,a1Cm],a1Cv)
; (a1Cv,a1Cn)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-2")
; GIVENS (conversions)
; GIVENS (names)
;  a1Cl  <=  a
;  a1Cm  <=  b
;  a1Cn  <=  c
;  a1Cv  <=  fsk_a1Cv
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1Cl (Array String Int))
; (declare-const a1Cm (Array String Int))
; (declare-const a1Cn (Array String Int))
; (declare-const a1Cv (Array String Int))
(declare-const
   a1Cl
   (Array String Int))
(declare-const
   a1Cm
   (Array String Int))
(declare-const
   a1Cn
   (Array String Int))
(declare-const
   a1Cv
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           a1Cl
           a1Cm)
         a1Cv)
      :named
      given-2.1))
(assert
   (!
      (= a1Cv a1Cn)
      :named
      given-2.2))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-2))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-2")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           a1Cl
;           a1Cm)
;         a1Cv)
;      :named
;      given-2.1)
;   (!
;      (= a1Cv a1Cn)
;      :named
;      given-2.2)
;   (! false :named wanted-2))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_a1D9 {1}:: (a *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1Dd {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [a1CU,a1CV],a1D8)
; (a1D8,a1CW)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
; GIVENS (conversions)
; GIVENS (names)
;  a1CU  <=  a
;  a1CV  <=  b
;  a1CW  <=  c
;  a1D8  <=  fsk_a1D8
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1CU (Array String Int))
; (declare-const a1CV (Array String Int))
; (declare-const a1CW (Array String Int))
; (declare-const a1D8 (Array String Int))
(declare-const
   a1CU
   (Array String Int))
(declare-const
   a1CV
   (Array String Int))
(declare-const
   a1CW
   (Array String Int))
(declare-const
   a1D8
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
           a1CU
           a1CV)
         a1D8)
      :named
      given-3.1))
(assert
   (!
      (= a1D8 a1CW)
      :named
      given-3.2))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-3))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-3")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1CU
;           a1CV)
;         a1D8)
;      :named
;      given-3.1)
;   (!
;      (= a1D8 a1CW)
;      :named
;      given-3.2)
;   (! false :named wanted-3))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] cobox_a1Ek {1}:: Enc s n ~ fsk0 (CFunEqCan)
; [G] cobox_a1Eo {1}:: fsk0 ~ b (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Enc [a1E5,a1E6],a1Ej)
; (a1Ej,a1E7)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
;  a1E5  <=  s
;  a1E6  <=  n
;  a1E7  <=  b
;  a1Ej  <=  fsk_a1Ej
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1E6))
; (declare-const a1E5 String)
; (declare-const a1E6 Int)
; (declare-const a1E7 (Array String Int))
; (declare-const a1Ej (Array String Int))
(declare-const a1E5 String)
(declare-const a1E6 Int)
(declare-const
   a1E7
   (Array String Int))
(declare-const
   a1Ej
   (Array String Int))
(assert
   (<= 0 a1E6))
(assert
   (!
      (=
         (store enc a1E5 a1E6)
         a1Ej)
      :named
      given-4.1))
(assert
   (!
      (= a1Ej a1E7)
      :named
      given-4.2))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (<= 0 a1E6)
;   (!
;      (=
;         (store enc a1E5 a1E6)
;         a1Ej)
;      :named
;      given-4.1)
;   (!
;      (= a1Ej a1E7)
;      :named
;      given-4.2)
;   (! false :named wanted-4))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Gp} {2}:: (Base "m" *: One)
;                       ~
;                       (((Base "m" *: One) /: (Base "s" *: One))
;                        *: (Base "s" *: One)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],One []],*: [/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],*: [Base ["s"],One []]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a1Gp} {2}:: (Base "m" *: One)
;                            ~
;                            (((Base "m" *: One) /: (Base "s" *: One))
;                             *: (Base "s" *: One)) (CNonCanonical)
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
;      [WD] hole{a1Gp} {2}:: (Base "m" *: One)
;                            ~
;                            (((Base "m" *: One) /: (Base "s" *: One))
;                             *: (Base "s" *: One)) (CNonCanonical)
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
                     0))))))
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
;      (or
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 (store base "m" one)
;                 (
;                   (as
;                      const
;                      (Array String Int))
;                   0))
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (_
;                        map
;                        (+
;                           (Int Int)
;                           Int))
;                     (store base "m" one)
;                     (
;                       (as
;                          const
;                          (Array String Int))
;                       0))
;                   (
;                     (_
;                        map
;                        (+
;                           (Int Int)
;                           Int))
;                     (store base "s" one)
;                     (
;                       (as
;                          const
;                          (Array String Int))
;                       0)))
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   (store base "s" one)
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0))))))
;      :named
;      wanted-5))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a1GP {1}:: (a /: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1GT {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (/: [a1EB,a1EC],a1GO)
; (a1GO,a1ED)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
;  a1EB  <=  a
;  a1EC  <=  b
;  a1ED  <=  c
;  a1GO  <=  fsk_a1GO
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1EB (Array String Int))
; (declare-const a1EC (Array String Int))
; (declare-const a1ED (Array String Int))
; (declare-const a1GO (Array String Int))
(declare-const
   a1EB
   (Array String Int))
(declare-const
   a1EC
   (Array String Int))
(declare-const
   a1ED
   (Array String Int))
(declare-const
   a1GO
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           a1EB
           a1EC)
         a1GO)
      :named
      given-6.1))
(assert
   (!
      (= a1GO a1ED)
      :named
      given-6.2))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           a1EB
;           a1EC)
;         a1GO)
;      :named
;      given-6.1)
;   (!
;      (= a1GO a1ED)
;      :named
;      given-6.2)
;   (! false :named wanted-6))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a1GY {1}:: (a *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1H2 {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [a1ER,a1ES],a1GX)
; (a1GX,a1ET)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
;  a1ER  <=  a
;  a1ES  <=  b
;  a1ET  <=  c
;  a1GX  <=  fsk_a1GX
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1ER (Array String Int))
; (declare-const a1ES (Array String Int))
; (declare-const a1ET (Array String Int))
; (declare-const a1GX (Array String Int))
(declare-const
   a1ER
   (Array String Int))
(declare-const
   a1ES
   (Array String Int))
(declare-const
   a1ET
   (Array String Int))
(declare-const
   a1GX
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
           a1ER
           a1ES)
         a1GX)
      :named
      given-7.1))
(assert
   (!
      (= a1GX a1ET)
      :named
      given-7.2))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1ER
;           a1ES)
;         a1GX)
;      :named
;      given-7.1)
;   (!
;      (= a1GX a1ET)
;      :named
;      given-7.2)
;   (! false :named wanted-7))
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a1H9 {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1H7 {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hd {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hb {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hf {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hh {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hl {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],a1H8)
; (Base ["m"],a1H6)
; (Base ["s"],a1Hc)
; (*: [a1H6,a1H8],a1Ha)
; (*: [a1Hc,a1H8],a1He)
; (/: [a1Ha,a1He],a1Hg)
; (a1Hg,a1Fi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
; GIVENS (conversions)
; GIVENS (names)
;  a1Fi  <=  mps
;  a1H6  <=  fsk_a1H6
;  a1H8  <=  fsk_a1H8
;  a1Ha  <=  fsk_a1Ha
;  a1Hc  <=  fsk_a1Hc
;  a1He  <=  fsk_a1He
;  a1Hg  <=  fsk_a1Hg
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1Fi (Array String Int))
; (declare-const a1H6 (Array String Int))
; (declare-const a1H8 (Array String Int))
; (declare-const a1Ha (Array String Int))
; (declare-const a1Hc (Array String Int))
; (declare-const a1He (Array String Int))
; (declare-const a1Hg (Array String Int))
(declare-const
   a1Fi
   (Array String Int))
(declare-const
   a1H6
   (Array String Int))
(declare-const
   a1H8
   (Array String Int))
(declare-const
   a1Ha
   (Array String Int))
(declare-const
   a1Hc
   (Array String Int))
(declare-const
   a1He
   (Array String Int))
(declare-const
   a1Hg
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a1H8)
      :named
      given-8.1))
(assert
   (!
      (=
         (store base "m" one)
         a1H6)
      :named
      given-8.2))
(assert
   (!
      (=
         (store base "s" one)
         a1Hc)
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
           a1H6
           a1H8)
         a1Ha)
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
           a1Hc
           a1H8)
         a1He)
      :named
      given-8.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           a1Ha
           a1He)
         a1Hg)
      :named
      given-8.6))
(assert
   (!
      (= a1Hg a1Fi)
      :named
      given-8.7))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-8))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-8")
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
;         a1H8)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store base "m" one)
;         a1H6)
;      :named
;      given-8.2)
;   (!
;      (=
;         (store base "s" one)
;         a1Hc)
;      :named
;      given-8.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1H6
;           a1H8)
;         a1Ha)
;      :named
;      given-8.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1Hc
;           a1H8)
;         a1He)
;      :named
;      given-8.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           a1Ha
;           a1He)
;         a1Hg)
;      :named
;      given-8.6)
;   (!
;      (= a1Hg a1Fi)
;      :named
;      given-8.7)
;   (! false :named wanted-8))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a1H9 {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1H7 {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hd {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hb {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hf {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hh {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hl {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1Hw} {3}:: (mps *: (Base "s" *: One))
;                       ~
;                       (Base "m" *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a1H8)
; (Base ["m"],a1H6)
; (Base ["s"],a1Hc)
; (*: [a1H6,a1H8],a1Ha)
; (*: [a1Hc,a1H8],a1He)
; (/: [a1Ha,a1He],a1Hg)
; (a1Hg,a1Fi)

; WANTEDS (Thoralf style)
; (*: [a1Fi,*: [Base ["s"],One []]],*: [Base ["m"],One []])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{a1Hw} {3}:: (mps *: (Base "s" *: One))
;                            ~
;                            (Base "m" *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Fi
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
;          0)))
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
;        0)))

; GIVENS (names)
;  a1Fi  <=  mps
;  a1H6  <=  fsk_a1H6
;  a1H8  <=  fsk_a1H8
;  a1Ha  <=  fsk_a1Ha
;  a1Hc  <=  fsk_a1Hc
;  a1He  <=  fsk_a1He
;  a1Hg  <=  fsk_a1Hg
(push 1)
; DECS1 (seen) 
; (declare-const a1Fi (Array String Int))
; (declare-const a1H6 (Array String Int))
; (declare-const a1H8 (Array String Int))
; (declare-const a1Ha (Array String Int))
; (declare-const a1Hc (Array String Int))
; (declare-const a1He (Array String Int))
; (declare-const a1Hg (Array String Int))
; DECS1 (unseen) 
(declare-const
   a1Fi
   (Array String Int))
(declare-const
   a1H6
   (Array String Int))
(declare-const
   a1H8
   (Array String Int))
(declare-const
   a1Ha
   (Array String Int))
(declare-const
   a1Hc
   (Array String Int))
(declare-const
   a1He
   (Array String Int))
(declare-const
   a1Hg
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a1H8)
      :named
      given-9.1))
(assert
   (!
      (=
         (store base "m" one)
         a1H6)
      :named
      given-9.2))
(assert
   (!
      (=
         (store base "s" one)
         a1Hc)
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
           a1H6
           a1H8)
         a1Ha)
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
           a1Hc
           a1H8)
         a1He)
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
           a1Ha
           a1He)
         a1Hg)
      :named
      given-9.6))
(assert
   (!
      (= a1Hg a1Fi)
      :named
      given-9.7))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{a1Hw} {3}:: (mps *: (Base "s" *: One))
;                            ~
;                            (Base "m" *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Fi
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
;          0)))
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
;        0)))

; WANTEDS (names)
;  a1Fi  <=  mps
; DECS2 (seen) 
; DECS2 (unseen) 
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
                 a1Fi
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
                 (store base "m" one)
                 (
                   (as
                      const
                      (Array String Int))
                   0)))))
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
;         a1H8)
;      :named
;      given-9.1)
;   (!
;      (=
;         (store base "m" one)
;         a1H6)
;      :named
;      given-9.2)
;   (!
;      (=
;         (store base "s" one)
;         a1Hc)
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
;           a1H6
;           a1H8)
;         a1Ha)
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
;           a1Hc
;           a1H8)
;         a1He)
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
;           a1Ha
;           a1He)
;         a1Hg)
;      :named
;      given-9.6)
;   (!
;      (= a1Hg a1Fi)
;      :named
;      given-9.7)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Fi
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   (store base "s" one)
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)))
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 (store base "m" one)
;                 (
;                   (as
;                      const
;                      (Array String Int))
;                   0)))))
;      :named
;      wanted-9))
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a1Hy {1}:: Enc s n ~ fsk0 (CFunEqCan)
; [G] cobox_a1HC {1}:: fsk0 ~ b (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Enc [a1FE,a1FF],a1Hx)
; (a1Hx,a1FG)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
;  a1FE  <=  s
;  a1FF  <=  n
;  a1FG  <=  b
;  a1Hx  <=  fsk_a1Hx
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1FF))
; (declare-const a1FE String)
; (declare-const a1FF Int)
; (declare-const a1FG (Array String Int))
; (declare-const a1Hx (Array String Int))
(declare-const a1FE String)
(declare-const a1FF Int)
(declare-const
   a1FG
   (Array String Int))
(declare-const
   a1Hx
   (Array String Int))
(assert
   (<= 0 a1FF))
(assert
   (!
      (=
         (store enc a1FE a1FF)
         a1Hx)
      :named
      given-10.1))
(assert
   (!
      (= a1Hx a1FG)
      :named
      given-10.2))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (! false :named wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (<= 0 a1FF)
;   (!
;      (=
;         (store enc a1FE a1FF)
;         a1Hx)
;      :named
;      given-10.1)
;   (!
;      (= a1Hx a1FG)
;      :named
;      given-10.2)
;   (! false :named wanted-10))
(pop 1)
(echo "solver-finish-cycle-10")
(exit)
; [2 of 2] Compiling Main
; Test suite uom-diy: RUNNING...
; Test suite uom-diy: PASS