; Build profile: -w ghc-8.2.2 -O1
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
(get-unsat-core)
; (given-9.2
;    given-9.3
;    given-9.4
;    given-9.5
;    given-9.6
;    given-9.7
;    wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(exit)
; [2 of 2] Compiling Main
; Test suite uom-diy: RUNNING...
; Test suite uom-diy: PASS