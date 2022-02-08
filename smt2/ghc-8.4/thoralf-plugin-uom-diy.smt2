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
; [WD] hole{co_a1Im} {2}:: (Base "m" *: One)
;                          ~ (((Base "m" *: One) /: (Base "s" *: One))
;                             *: (Base "s" *: One)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],One []],*: [/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],*: [Base ["s"],One []]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1Im} {2}:: (Base "m" *: One)
;                               ~ (((Base "m" *: One) /: (Base "s" *: One))
;                                  *: (Base "s" *: One)) (CNonCanonical)
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
;      [WD] hole{co_a1Im} {2}:: (Base "m" *: One)
;                               ~ (((Base "m" *: One) /: (Base "s" *: One))
;                                  *: (Base "s" *: One)) (CNonCanonical)
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
; [G] co_a1J6 {3}:: One ~ fsk0 (CFunEqCan)
; [G] co_a1J4 {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] co_a1Ja {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] co_a1J8 {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_a1Jc {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_a1Je {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_a1Ji {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1Jt} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a1J5)
; (Base ["m"],a1J3)
; (Base ["s"],a1J9)
; (*: [a1J3,a1J5],a1J7)
; (*: [a1J9,a1J5],a1Jb)
; (/: [a1J7,a1Jb],a1Jd)
; (a1Jd,a1Hj)

; WANTEDS (Thoralf style)
; (*: [a1Hj,a1Jb],a1J7)

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a1Jt} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hj
;      a1Jb)
;    a1J7)

; GIVENS (names)
;  a1Hj  <=  mps
;  a1J3  <=  fsk_a1J3
;  a1J5  <=  fsk_a1J5
;  a1J7  <=  fsk_a1J7
;  a1J9  <=  fsk_a1J9
;  a1Jb  <=  fsk_a1Jb
;  a1Jd  <=  fsk_a1Jd
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1Hj (Array String Int))
; (declare-const a1J3 (Array String Int))
; (declare-const a1J5 (Array String Int))
; (declare-const a1J7 (Array String Int))
; (declare-const a1J9 (Array String Int))
; (declare-const a1Jb (Array String Int))
; (declare-const a1Jd (Array String Int))
(declare-const
   a1Hj
   (Array String Int))
(declare-const
   a1J3
   (Array String Int))
(declare-const
   a1J5
   (Array String Int))
(declare-const
   a1J7
   (Array String Int))
(declare-const
   a1J9
   (Array String Int))
(declare-const
   a1Jb
   (Array String Int))
(declare-const
   a1Jd
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a1J5)
      :named
      given-9.1))
(assert
   (!
      (=
         (store base "m" one)
         a1J3)
      :named
      given-9.2))
(assert
   (!
      (=
         (store base "s" one)
         a1J9)
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
           a1J3
           a1J5)
         a1J7)
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
           a1J9
           a1J5)
         a1Jb)
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
           a1J7
           a1Jb)
         a1Jd)
      :named
      given-9.6))
(assert
   (!
      (= a1Jd a1Hj)
      :named
      given-9.7))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a1Jt} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hj
;      a1Jb)
;    a1J7)

; WANTEDS (names)
;  a1Hj  <=  mps
;  a1J7  <=  fsk_a1J7
;  a1Jb  <=  fsk_a1Jb
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
              a1Hj
              a1Jb)
            a1J7))
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
;         a1J5)
;      :named
;      given-9.1)
;   (!
;      (=
;         (store base "m" one)
;         a1J3)
;      :named
;      given-9.2)
;   (!
;      (=
;         (store base "s" one)
;         a1J9)
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
;           a1J3
;           a1J5)
;         a1J7)
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
;           a1J9
;           a1J5)
;         a1Jb)
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
;           a1J7
;           a1Jb)
;         a1Jd)
;      :named
;      given-9.6)
;   (!
;      (= a1Jd a1Hj)
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
;              a1Hj
;              a1Jb)
;            a1J7))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.4 given-9.6 given-9.7 wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(exit)
