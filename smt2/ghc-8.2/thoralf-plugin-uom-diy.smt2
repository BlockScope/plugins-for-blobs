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
; [WD] hole{a1DD} {2}:: (Base "m" *: One)
;                       ~
;                       (((Base "m" *: One) /: (Base "s" *: One))
;                        *: (Base "s" *: One)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],One []],*: [/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],*: [Base ["s"],One []]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a1DD} {2}:: (Base "m" *: One)
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
;      [WD] hole{a1DD} {2}:: (Base "m" *: One)
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
; [G] cobox_a1En {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1El {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Er {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Ep {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Et {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Ev {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Ez {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1EK} {3}:: (mps *: (Base "s" *: One))
;                       ~
;                       (Base "m" *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a1Em)
; (Base ["m"],a1Ek)
; (Base ["s"],a1Eq)
; (*: [a1Ek,a1Em],a1Eo)
; (*: [a1Eq,a1Em],a1Es)
; (/: [a1Eo,a1Es],a1Eu)
; (a1Eu,a1Cw)

; WANTEDS (Thoralf style)
; (*: [a1Cw,*: [Base ["s"],One []]],*: [Base ["m"],One []])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{a1EK} {3}:: (mps *: (Base "s" *: One))
;                            ~
;                            (Base "m" *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Cw
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
;  a1Cw  <=  mps
;  a1Ek  <=  fsk_a1Ek
;  a1Em  <=  fsk_a1Em
;  a1Eo  <=  fsk_a1Eo
;  a1Eq  <=  fsk_a1Eq
;  a1Es  <=  fsk_a1Es
;  a1Eu  <=  fsk_a1Eu
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1Cw (Array String Int))
; (declare-const a1Ek (Array String Int))
; (declare-const a1Em (Array String Int))
; (declare-const a1Eo (Array String Int))
; (declare-const a1Eq (Array String Int))
; (declare-const a1Es (Array String Int))
; (declare-const a1Eu (Array String Int))
(declare-const
   a1Cw
   (Array String Int))
(declare-const
   a1Ek
   (Array String Int))
(declare-const
   a1Em
   (Array String Int))
(declare-const
   a1Eo
   (Array String Int))
(declare-const
   a1Eq
   (Array String Int))
(declare-const
   a1Es
   (Array String Int))
(declare-const
   a1Eu
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a1Em)
      :named
      given-9.1))
(assert
   (!
      (=
         (store base "m" one)
         a1Ek)
      :named
      given-9.2))
(assert
   (!
      (=
         (store base "s" one)
         a1Eq)
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
           a1Ek
           a1Em)
         a1Eo)
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
           a1Eq
           a1Em)
         a1Es)
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
           a1Eo
           a1Es)
         a1Eu)
      :named
      given-9.6))
(assert
   (!
      (= a1Eu a1Cw)
      :named
      given-9.7))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{a1EK} {3}:: (mps *: (Base "s" *: One))
;                            ~
;                            (Base "m" *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Cw
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
;  a1Cw  <=  mps
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
              a1Cw
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
                0))))
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
;         a1Em)
;      :named
;      given-9.1)
;   (!
;      (=
;         (store base "m" one)
;         a1Ek)
;      :named
;      given-9.2)
;   (!
;      (=
;         (store base "s" one)
;         a1Eq)
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
;           a1Ek
;           a1Em)
;         a1Eo)
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
;           a1Eq
;           a1Em)
;         a1Es)
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
;           a1Eo
;           a1Es)
;         a1Eu)
;      :named
;      given-9.6)
;   (!
;      (= a1Eu a1Cw)
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
;              a1Cw
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
;                  0)))
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
;                0))))
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
