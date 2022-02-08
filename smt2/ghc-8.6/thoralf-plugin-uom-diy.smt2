; Compiling UoM
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

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Cp} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1Cb,LiftedRep [])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a1Cp} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Cb
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_a1Cp} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Cb
;    (lit "63A"))

; WANTEDS (names)
;  a1Cb  <=  t_a1Cb
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Cb Type)
(declare-const a1Cb Type)
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1SG} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1Sz,LiftedRep [])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1SG} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Sz
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1SG} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Sz
;    (lit "63A"))

; WANTEDS (names)
;  a1Sz  <=  t_a1Sz
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Sz Type)
(declare-const a1Sz Type)
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1T0} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1SO,LiftedRep [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a1T0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1SO
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a1T0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1SO
;    (lit "63A"))

; WANTEDS (names)
;  a1SO  <=  t_a1SO
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1SO Type)
(declare-const a1SO Type)
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1TD} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1Tn,LiftedRep [])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1TD} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Tn
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1TD} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Tn
;    (lit "63A"))

; WANTEDS (names)
;  a1Tn  <=  t_a1Tn
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Tn Type)
(declare-const a1Tn Type)
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Ub} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1U4,LiftedRep [])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1Ub} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1U4
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1Ub} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1U4
;    (lit "63A"))

; WANTEDS (names)
;  a1U4  <=  t_a1U4
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1U4 Type)
(declare-const a1U4 Type)
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Us} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1Uj,LiftedRep [])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a1Us} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Uj
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a1Us} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1Uj
;    (lit "63A"))

; WANTEDS (names)
;  a1Uj  <=  t_a1Uj
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Uj Type)
(declare-const a1Uj Type)
(echo "wanteds-finish-cycle-9")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1V0} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1UA,LiftedRep [])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a1V0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1UA
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a1V0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1UA
;    (lit "63A"))

; WANTEDS (names)
;  a1UA  <=  t_a1UA
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1UA Type)
(declare-const a1UA Type)
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Xn} {2}:: (Base "m" *: One)
;                          ~ (((Base "m" *: One) /: (Base "s" *: One))
;                             *: (Base "s" *: One)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],One []],*: [/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],*: [Base ["s"],One []]])

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] hole{co_a1Xn} {2}:: (Base "m" *: One)
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
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] hole{co_a1Xn} {2}:: (Base "m" *: One)
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
      wanted-12))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-12")
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
;      wanted-12))
(get-unsat-core)
; (wanted-12)
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] co_a1Y7 {3}:: One ~ fsk0 (CFunEqCan)
; [G] co_a1Y5 {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] co_a1Yb {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] co_a1Y9 {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_a1Yd {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_a1Yf {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_a1Yj {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1Yu} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a1Y6)
; (Base ["m"],a1Y4)
; (Base ["s"],a1Ya)
; (*: [a1Y4,a1Y6],a1Y8)
; (*: [a1Ya,a1Y6],a1Yc)
; (/: [a1Y8,a1Yc],a1Ye)
; (a1Ye,a1Wi)

; WANTEDS (Thoralf style)
; (*: [a1Wi,a1Yc],a1Y8)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a1Yu} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Wi
;      a1Yc)
;    a1Y8)

; GIVENS (names)
;  a1Wi  <=  mps
;  a1Y4  <=  fsk_a1Y4
;  a1Y6  <=  fsk_a1Y6
;  a1Y8  <=  fsk_a1Y8
;  a1Ya  <=  fsk_a1Ya
;  a1Yc  <=  fsk_a1Yc
;  a1Ye  <=  fsk_a1Ye
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1Wi (Array String Int))
; (declare-const a1Y4 (Array String Int))
; (declare-const a1Y6 (Array String Int))
; (declare-const a1Y8 (Array String Int))
; (declare-const a1Ya (Array String Int))
; (declare-const a1Yc (Array String Int))
; (declare-const a1Ye (Array String Int))
(declare-const
   a1Wi
   (Array String Int))
(declare-const
   a1Y4
   (Array String Int))
(declare-const
   a1Y6
   (Array String Int))
(declare-const
   a1Y8
   (Array String Int))
(declare-const
   a1Ya
   (Array String Int))
(declare-const
   a1Yc
   (Array String Int))
(declare-const
   a1Ye
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a1Y6)
      :named
      given-16.1))
(assert
   (!
      (=
         (store base "m" one)
         a1Y4)
      :named
      given-16.2))
(assert
   (!
      (=
         (store base "s" one)
         a1Ya)
      :named
      given-16.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a1Y4
           a1Y6)
         a1Y8)
      :named
      given-16.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a1Ya
           a1Y6)
         a1Yc)
      :named
      given-16.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           a1Y8
           a1Yc)
         a1Ye)
      :named
      given-16.6))
(assert
   (!
      (= a1Ye a1Wi)
      :named
      given-16.7))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a1Yu} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Wi
;      a1Yc)
;    a1Y8)

; WANTEDS (names)
;  a1Wi  <=  mps
;  a1Y8  <=  fsk_a1Y8
;  a1Yc  <=  fsk_a1Yc
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
              a1Wi
              a1Yc)
            a1Y8))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
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
;         a1Y6)
;      :named
;      given-16.1)
;   (!
;      (=
;         (store base "m" one)
;         a1Y4)
;      :named
;      given-16.2)
;   (!
;      (=
;         (store base "s" one)
;         a1Ya)
;      :named
;      given-16.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1Y4
;           a1Y6)
;         a1Y8)
;      :named
;      given-16.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a1Ya
;           a1Y6)
;         a1Yc)
;      :named
;      given-16.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           a1Y8
;           a1Yc)
;         a1Ye)
;      :named
;      given-16.6)
;   (!
;      (= a1Ye a1Wi)
;      :named
;      given-16.7)
;   (!
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1Wi
;              a1Yc)
;            a1Y8))
;      :named
;      wanted-16))
(get-unsat-core)
; (given-16.4 given-16.6 given-16.7 wanted-16)
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(exit)
