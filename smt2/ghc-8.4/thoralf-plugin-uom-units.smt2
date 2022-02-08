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
; [WD] hole{co_a1Gv} {1}:: (u *: (One /: u))
;                          ~ (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Gf,/: [One [],a1Gf]],*: [a1Gh,/: [One [],a1Gh]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a1Gv} {1}:: (u *: (One /: u))
;                               ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gf
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gf))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gh
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gh)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_a1Gv} {1}:: (u *: (One /: u))
;                               ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gf
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gf))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gh
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gh)))

; WANTEDS (names)
;  a1Gf  <=  u
;  a1Gh  <=  u_a1Gh
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Gf (Array String Int))
; (declare-const a1Gh (Array String Int))
(declare-const
   a1Gf
   (Array String Int))
(declare-const
   a1Gh
   (Array String Int))
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
              a1Gf
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
                a1Gf))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1Gh
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
                a1Gh))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
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
;              a1Gf
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)
;                a1Gf))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1Gh
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)
;                a1Gh))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1H8} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{co_a1Hd} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1GZ,a1GY],*: [a1GW,a1GV])
; (*: [a1GV,a1GW],*: [a1GY,a1GZ])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1H8} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GZ
;      a1GY)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GW
;      a1GV))

;      [WD] hole{co_a1Hd} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GV
;      a1GW)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GY
;      a1GZ))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1H8} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GZ
;      a1GY)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GW
;      a1GV))

;      [WD] hole{co_a1Hd} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GV
;      a1GW)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1GY
;      a1GZ))

; WANTEDS (names)
;  a1GV  <=  u
;  a1GW  <=  v
;  a1GY  <=  u_a1GY
;  a1GZ  <=  v_a1GZ
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1GV (Array String Int))
; (declare-const a1GW (Array String Int))
; (declare-const a1GY (Array String Int))
; (declare-const a1GZ (Array String Int))
(declare-const
   a1GV
   (Array String Int))
(declare-const
   a1GW
   (Array String Int))
(declare-const
   a1GY
   (Array String Int))
(declare-const
   a1GZ
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1GZ
                 a1GY)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1GW
                 a1GV)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1GV
                 a1GW)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1GY
                 a1GZ))))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      wanted-2
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1GZ
;                 a1GY)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1GW
;                 a1GV)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1GV
;                 a1GW)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1GY
;                 a1GZ)))))
;   (define-fun
;      a1GZ
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         8365))
;   (define-fun
;      a1GV
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           11797)
;         "!0!"
;         30199))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1GW
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           8855)
;         "!0!"
;         10450))
;   (define-fun
;      a1GY
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         32285))
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
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1HI} {1}:: ((u0 *: v0) *: w0)
;                          ~ ((u *: v) *: w) (CNonCanonical)
; [WD] hole{co_a1HR} {1}:: (u *: (v *: w))
;                          ~ (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1Ht,a1Hu],a1Hv],*: [*: [a1Hp,a1Hq],a1Hr])
; (*: [a1Hp,*: [a1Hq,a1Hr]],*: [a1Ht,*: [a1Hu,a1Hv]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1HI} {1}:: ((u0 *: v0) *: w0)
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Ht
;        a1Hu)
;      a1Hv)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hp
;        a1Hq)
;      a1Hr))

;      [WD] hole{co_a1HR} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hp
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hq
;        a1Hr))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ht
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hu
;        a1Hv)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1HI} {1}:: ((u0 *: v0) *: w0)
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Ht
;        a1Hu)
;      a1Hv)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hp
;        a1Hq)
;      a1Hr))

;      [WD] hole{co_a1HR} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hp
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hq
;        a1Hr))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ht
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hu
;        a1Hv)))

; WANTEDS (names)
;  a1Hp  <=  u
;  a1Hq  <=  v
;  a1Hr  <=  w
;  a1Ht  <=  u_a1Ht
;  a1Hu  <=  v_a1Hu
;  a1Hv  <=  w_a1Hv
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Hp (Array String Int))
; (declare-const a1Hq (Array String Int))
; (declare-const a1Hr (Array String Int))
; (declare-const a1Ht (Array String Int))
; (declare-const a1Hu (Array String Int))
; (declare-const a1Hv (Array String Int))
(declare-const
   a1Hp
   (Array String Int))
(declare-const
   a1Hq
   (Array String Int))
(declare-const
   a1Hr
   (Array String Int))
(declare-const
   a1Ht
   (Array String Int))
(declare-const
   a1Hu
   (Array String Int))
(declare-const
   a1Hv
   (Array String Int))
(assert
   (!
      (or
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
                   a1Ht
                   a1Hu)
                 a1Hv)
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
                   a1Hp
                   a1Hq)
                 a1Hr)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Hp
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1Hq
                   a1Hr))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Ht
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1Hu
                   a1Hv)))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a1Hp
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         8945))
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Ht
;                 a1Hu
;                 a1Hv)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Hp
;                 a1Hq
;                 a1Hr)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Hp
;                 a1Hq
;                 a1Hr)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Ht
;                 a1Hu
;                 a1Hv)))))
;   (define-fun
;      a1Hu
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         2997))
;   (define-fun
;      a1Hq
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         15921))
;   (define-fun
;      a1Ht
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         16120))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1Hv
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         26285))
;   (define-fun
;      a1Hr
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         20537))
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
; [WD] hole{co_a1IF} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1HT],Base [a1HT]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a1IF} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1HT one)
;      (store base a1HT one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a1IF} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1HT one)
;      (store base a1HT one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1HT  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1HT String)
(declare-const a1HT String)
(assert
   (!
      (not
         (=
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              (store base a1HT one)
              (store base a1HT one))
            (
              (as
                 const
                 (Array String Int))
              0)))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
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
;                 (-
;                    (Int Int)
;                    Int))
;              (store base a1HT one)
;              (store base a1HT one))
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1IO} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1I3,/: [One [],a1I3]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1IO} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1I3
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1I3))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1IO} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1I3
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1I3))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1I3  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1I3 (Array String Int))
(declare-const
   a1I3
   (Array String Int))
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
              a1I3
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
                a1I3))
            (
              (as
                 const
                 (Array String Int))
              0)))
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
;              a1I3
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)
;                a1I3))
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1IT} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Ia,One []],a1Ia)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1IT} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ia
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Ia)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1IT} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ia
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Ia)

; WANTEDS (names)
;  a1Ia  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Ia (Array String Int))
(declare-const
   a1Ia
   (Array String Int))
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
              a1Ia
              (
                (as
                   const
                   (Array String Int))
                0))
            a1Ia))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
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
;              a1Ia
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a1Ia))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1J0} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Ig,a1Ih],*: [a1Ih,a1Ig])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a1J0} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ig
;      a1Ih)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ih
;      a1Ig))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a1J0} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ig
;      a1Ih)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ih
;      a1Ig))

; WANTEDS (names)
;  a1Ig  <=  u
;  a1Ih  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Ig (Array String Int))
; (declare-const a1Ih (Array String Int))
(declare-const
   a1Ig
   (Array String Int))
(declare-const
   a1Ih
   (Array String Int))
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
              a1Ig
              a1Ih)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1Ih
              a1Ig)))
      :named
      wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
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
;              a1Ig
;              a1Ih)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1Ih
;              a1Ig)))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Jb} {1}:: (u *: (v *: w))
;                          ~ ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Io,*: [a1Ip,a1Iq]],*: [*: [a1Io,a1Ip],a1Iq])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1Jb} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Io
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Ip
;        a1Iq))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Io
;        a1Ip)
;      a1Iq))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1Jb} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Io
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Ip
;        a1Iq))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Io
;        a1Ip)
;      a1Iq))

; WANTEDS (names)
;  a1Io  <=  u
;  a1Ip  <=  v
;  a1Iq  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Io (Array String Int))
; (declare-const a1Ip (Array String Int))
; (declare-const a1Iq (Array String Int))
(declare-const
   a1Io
   (Array String Int))
(declare-const
   a1Ip
   (Array String Int))
(declare-const
   a1Iq
   (Array String Int))
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
              a1Io
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a1Ip
                a1Iq))
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
                a1Io
                a1Ip)
              a1Iq)))
      :named
      wanted-8))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-8")
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
;              a1Io
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1Ip
;                a1Iq))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1Io
;                a1Ip)
;              a1Iq)))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
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
; [WD] hole{co_adDm} {2}:: One
;                          ~ (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_adDm} {2}:: One
;                               ~ (Base "cd" /: Base "cd") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "cd" one)
;      (store base "cd" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_adDm} {2}:: One
;                               ~ (Base "cd" /: Base "cd") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "cd" one)
;      (store base "cd" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "cd" one)
              (store base "cd" one))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "cd" one)
;              (store base "cd" one))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_adDR} {2}:: One
;                          ~ (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_adDR} {2}:: One
;                               ~ (Base "mol" /: Base "mol") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "mol" one)
;      (store base "mol" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_adDR} {2}:: One
;                               ~ (Base "mol" /: Base "mol") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "mol" one)
;      (store base "mol" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "mol" one)
              (store base "mol" one))))
      :named
      wanted-2))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-2")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "mol" one)
;              (store base "mol" one))))
;      :named
;      wanted-2))
(get-unsat-core)
; (wanted-2)
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_adEm} {2}:: One
;                          ~ (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_adEm} {2}:: One
;                               ~ (Base "K" /: Base "K") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "K" one)
;      (store base "K" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_adEm} {2}:: One
;                               ~ (Base "K" /: Base "K") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "K" one)
;      (store base "K" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "K" one)
              (store base "K" one))))
      :named
      wanted-3))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-3")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "K" one)
;              (store base "K" one))))
;      :named
;      wanted-3))
(get-unsat-core)
; (wanted-3)
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_adER} {2}:: One
;                          ~ (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_adER} {2}:: One
;                               ~ (Base "A" /: Base "A") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "A" one)
;      (store base "A" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_adER} {2}:: One
;                               ~ (Base "A" /: Base "A") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "A" one)
;      (store base "A" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "A" one)
              (store base "A" one))))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "A" one)
;              (store base "A" one))))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_adFm} {2}:: One
;                          ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_adFm} {2}:: One
;                               ~ (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_adFm} {2}:: One
;                               ~ (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "s" one)
              (store base "s" one))))
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
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "s" one)
;              (store base "s" one))))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_adFR} {2}:: One
;                          ~ (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_adFR} {2}:: One
;                               ~ (Base "kg" /: Base "kg") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "kg" one)
;      (store base "kg" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_adFR} {2}:: One
;                               ~ (Base "kg" /: Base "kg") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "kg" one)
;      (store base "kg" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "kg" one)
              (store base "kg" one))))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "kg" one)
;              (store base "kg" one))))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_adGm} {2}:: One
;                          ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_adGm} {2}:: One
;                               ~ (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_adGm} {2}:: One
;                               ~ (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "m" one)
              (store base "m" one))))
      :named
      wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "m" one)
;              (store base "m" one))))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(exit)
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
; [WD] irred_aemb {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aemb {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] irred_aemb {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))
;  =>  (=
;    aem1
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      aem1))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] irred_aemb {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))
;  =>  (=
;    aem1
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      aem1))

; WANTEDS (names)
;  aem1  <=  fsk_aem1
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aem1 (Array String Int))
(declare-const
   aem1
   (Array String Int))
(assert
   (!
      (not
         (=
            aem1
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              aem1)))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            aem1
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              aem1)))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
; [G] co_afp3 {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_afp7 {0}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_afp5 {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_afp8 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_afpg} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],afp2)
; (*: [afoT,afp2],afp6)
; (*: [afp2,afoS],afp4)
; (afp4,afp6)

; WANTEDS (Thoralf style)
; (*: [afoW,afp2],afp6)

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_afpg} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afoW
;      afp2)
;    afp6)

; GIVENS (names)
;  afoS  <=  a
;  afoT  <=  b
;  afp2  <=  fsk_afp2
;  afp4  <=  fsk_afp4
;  afp6  <=  fsk_afp6
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afoS (Array String Int))
; (declare-const afoT (Array String Int))
; (declare-const afp2 (Array String Int))
; (declare-const afp4 (Array String Int))
; (declare-const afp6 (Array String Int))
(declare-const
   afoS
   (Array String Int))
(declare-const
   afoT
   (Array String Int))
(declare-const
   afp2
   (Array String Int))
(declare-const
   afp4
   (Array String Int))
(declare-const
   afp6
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         afp2)
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
           afoT
           afp2)
         afp6)
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
           afp2
           afoS)
         afp4)
      :named
      given-1.3))
(assert
   (!
      (= afp4 afp6)
      :named
      given-1.4))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_afpg} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afoW
;      afp2)
;    afp6)

; WANTEDS (names)
;  afoW  <=  b_afoW
;  afp2  <=  fsk_afp2
;  afp6  <=  fsk_afp6
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const afoW (Array String Int))
(declare-const
   afoW
   (Array String Int))
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
              afoW
              afp2)
            afp6))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      given-1.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         afp2))
;   (define-fun
;      afp2
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afp6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-1.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afp2
;           afoS)
;         afp4))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      afoS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afoT
;           afp2)
;         afp6))
;   (define-fun
;      afoT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afp4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.4
;      ()
;      Bool
;      (= afp4 afp6))
;   (define-fun
;      wanted-1
;      ()
;      Bool
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              afoW
;              afp2)
;            afp6)))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      afoW
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           38)
;         "!0!"
;         1))
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

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agxr {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agxr {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] irred_agxr {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] irred_agxr {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-2))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-2")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-2))
(get-unsat-core)
; (wanted-2)
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agxP {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agxP {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] irred_agxP {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] irred_agxP {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-3))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-3")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-3))
(get-unsat-core)
; (wanted-3)
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agyd {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agyd {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] irred_agyd {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] irred_agyd {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agyC {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agyC {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] irred_agyC {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] irred_agyC {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
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
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agyZ {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agyZ {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] irred_agyZ {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] irred_agyZ {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agzm {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agzm {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] irred_agzm {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] irred_agzm {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agzK {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agzK {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] irred_agzK {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] irred_agzK {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-8))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-8")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agA7 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agA7 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_agA7 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] irred_agA7 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
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
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-9))
(get-unsat-core)
; (wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agAu {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agAu {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_agAu {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] irred_agAu {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-10))
(get-unsat-core)
; (wanted-10)
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agAS {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agAS {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_agAS {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] irred_agAS {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-11))
(get-unsat-core)
; (wanted-11)
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agBf {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agBf {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] irred_agBf {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] irred_agBf {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
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
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-12))
(get-unsat-core)
; (wanted-12)
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_agBC {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_agBC {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] irred_agBC {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] irred_agBC {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-13))
(get-unsat-core)
; (wanted-13)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] co_agBQ {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_agBS {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agBO {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_agBV {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agC0} {1}:: Base "s" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [afzT,afzT],agBP)
; (*: [afzT,agBP],agBR)
; (*: [afzS,afzS],agBN)
; (agBN,agBR)

; WANTEDS (Thoralf style)
; (Base ["s"],afzS)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_agC0} {1}:: Base "s" ~ a (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    afzS)

; GIVENS (names)
;  afzS  <=  a
;  afzT  <=  b
;  agBN  <=  fsk_agBN
;  agBP  <=  fsk_agBP
;  agBR  <=  fsk_agBR
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afzS (Array String Int))
; (declare-const afzT (Array String Int))
; (declare-const agBN (Array String Int))
; (declare-const agBP (Array String Int))
; (declare-const agBR (Array String Int))
(declare-const
   afzS
   (Array String Int))
(declare-const
   afzT
   (Array String Int))
(declare-const
   agBN
   (Array String Int))
(declare-const
   agBP
   (Array String Int))
(declare-const
   agBR
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
           afzT
           afzT)
         agBP)
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
           afzT
           agBP)
         agBR)
      :named
      given-14.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           afzS
           afzS)
         agBN)
      :named
      given-14.3))
(assert
   (!
      (= agBN agBR)
      :named
      given-14.4))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_agC0} {1}:: Base "s" ~ a (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    afzS)

; WANTEDS (names)
;  afzS  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            afzS))
      :named
      wanted-14))
(check-sat)
; sat
(echo "wanteds-finish-cycle-14")
(get-model)
; (
;   (define-fun
;      given-14.4
;      ()
;      Bool
;      (= agBN agBR))
;   (define-fun
;      wanted-14
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            afzS)))
;   (define-fun
;      agBP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-14.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afzT
;           afzT)
;         agBP))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-14.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afzT
;           agBP)
;         agBR))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      agBR
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afzS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-14.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afzS
;           afzS)
;         agBN))
;   (define-fun
;      afzT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agBN
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
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] co_agC8 {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_agCc {0}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agCa {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_agCd {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agCk} {2}:: Base "kg" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agC7)
; (*: [afAl,agC7],agCb)
; (*: [agC7,afAk],agC9)
; (agC9,agCb)

; WANTEDS (Thoralf style)
; (Base ["kg"],afAk)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_agCk} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    afAk)

; GIVENS (names)
;  afAk  <=  a
;  afAl  <=  b
;  agC7  <=  fsk_agC7
;  agC9  <=  fsk_agC9
;  agCb  <=  fsk_agCb
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afAk (Array String Int))
; (declare-const afAl (Array String Int))
; (declare-const agC7 (Array String Int))
; (declare-const agC9 (Array String Int))
; (declare-const agCb (Array String Int))
(declare-const
   afAk
   (Array String Int))
(declare-const
   afAl
   (Array String Int))
(declare-const
   agC7
   (Array String Int))
(declare-const
   agC9
   (Array String Int))
(declare-const
   agCb
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agC7)
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
           afAl
           agC7)
         agCb)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           agC7
           afAk)
         agC9)
      :named
      given-15.3))
(assert
   (!
      (= agC9 agCb)
      :named
      given-15.4))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_agCk} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    afAk)

; WANTEDS (names)
;  afAk  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            afAk))
      :named
      wanted-15))
(check-sat)
; sat
(echo "wanteds-finish-cycle-15")
(get-model)
; (
;   (define-fun
;      wanted-15
;      ()
;      Bool
;      (not
;         (=
;            (store base "kg" one)
;            afAk)))
;   (define-fun
;      given-15.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agC7
;           afAk)
;         agC9))
;   (define-fun
;      agCb
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agC9
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-15.4
;      ()
;      Bool
;      (= agC9 agCb))
;   (define-fun
;      given-15.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afAl
;           agC7)
;         agCb))
;   (define-fun
;      agC7
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afAl
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afAk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-15.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         agC7))
;   (define-fun
;      one
;      ()
;      Int
;      1)
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
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] co_agCo {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_agCs {0}:: (a *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agCq {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_agCt {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agCA} {2}:: Base "kg" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agCn)
; (*: [afAs,agCn],agCr)
; (*: [agCn,afAs],agCp)
; (agCp,agCr)

; WANTEDS (Thoralf style)
; (Base ["kg"],afAs)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_agCA} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    afAs)

; GIVENS (names)
;  afAs  <=  a
;  agCn  <=  fsk_agCn
;  agCp  <=  fsk_agCp
;  agCr  <=  fsk_agCr
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afAs (Array String Int))
; (declare-const agCn (Array String Int))
; (declare-const agCp (Array String Int))
; (declare-const agCr (Array String Int))
(declare-const
   afAs
   (Array String Int))
(declare-const
   agCn
   (Array String Int))
(declare-const
   agCp
   (Array String Int))
(declare-const
   agCr
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agCn)
      :named
      given-16.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           afAs
           agCn)
         agCr)
      :named
      given-16.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           agCn
           afAs)
         agCp)
      :named
      given-16.3))
(assert
   (!
      (= agCp agCr)
      :named
      given-16.4))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_agCA} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    afAs)

; WANTEDS (names)
;  afAs  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            afAs))
      :named
      wanted-16))
(check-sat)
; sat
(echo "wanteds-finish-cycle-16")
(get-model)
; (
;   (define-fun
;      agCp
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         21238))
;   (define-fun
;      agCn
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      wanted-16
;      ()
;      Bool
;      (not
;         (=
;            (store base "kg" one)
;            afAs)))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "k"
;         3))
;   (define-fun
;      given-16.4
;      ()
;      Bool
;      (= agCp agCr))
;   (define-fun
;      given-16.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agCn
;           afAs)
;         agCp))
;   (define-fun
;      given-16.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afAs
;           agCn)
;         agCr))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "k"
;         3))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      given-16.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         agCn))
;   (define-fun
;      afAs
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         21238))
;   (define-fun
;      agCr
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         21238))
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
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_agCE} {2}:: Base "s" ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["s"],Base ["m"])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_agCE} {2}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_agCE} {2}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            (store base "m" one)))
      :named
      wanted-17))
(check-sat)
; sat
(echo "wanteds-finish-cycle-17")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
;   (define-fun
;      wanted-17
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            (store base "m" one))))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
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
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_agCN} {3}:: Base "s" ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["s"],Base ["m"])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{co_agCN} {3}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
;      [WD] hole{co_agCN} {3}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            (store base "m" one)))
      :named
      wanted-18))
(check-sat)
; sat
(echo "wanteds-finish-cycle-18")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
;   (define-fun
;      wanted-18
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            (store base "m" one))))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
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
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_agD4} {1}:: (Base "m" /: Base "s")
;                          ~ (Base "s" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base ["m"],Base ["s"]],/: [Base ["s"],Base ["m"]])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_agD4} {1}:: (Base "m" /: Base "s")
;                               ~ (Base "s" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_agD4} {1}:: (Base "m" /: Base "s")
;                               ~ (Base "s" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "m" one)))

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
                 (-
                    (Int Int)
                    Int))
              (store base "m" one)
              (store base "s" one))
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              (store base "s" one)
              (store base "m" one))))
      :named
      wanted-19))
(check-sat)
; sat
(echo "wanteds-finish-cycle-19")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            "m"
;            11797)
;         "s"
;         8857))
;   (define-fun
;      wanted-19
;      ()
;      Bool
;      (not
;         (=
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "m" one)
;              (store base "s" one))
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "s" one)
;              (store base "m" one)))))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            "m"
;            11797)
;         "s"
;         8857))
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
(echo "solver-finish-cycle-19")
(exit)
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
; [G] co_ahPH {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ahOB {34}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOD {33}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOF {32}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOH {31}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOJ {30}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOL {29}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahON {28}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOP {27}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOR {26}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOT {25}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOV {24}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOX {23}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOZ {22}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahP1 {21}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahP3 {20}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahP5 {19}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahP7 {18}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahP9 {17}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPb {16}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPd {15}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPf {14}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPh {13}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPj {12}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPl {11}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPn {10}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPp {9}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPr {8}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPt {7}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPv {6}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPx {5}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPz {4}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPB {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPD {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahPF {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOt {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_ahOv {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahOr {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_ahPK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_ahPN {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ahPU} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ahPG)
; (*: [ahOf,ahOu],ahOA)
; (*: [ahOf,ahOA],ahOC)
; (*: [ahOf,ahOC],ahOE)
; (*: [ahOf,ahOE],ahOG)
; (*: [ahOf,ahOG],ahOI)
; (*: [ahOf,ahOI],ahOK)
; (*: [ahOf,ahOK],ahOM)
; (*: [ahOf,ahOM],ahOO)
; (*: [ahOf,ahOO],ahOQ)
; (*: [ahOf,ahOQ],ahOS)
; (*: [ahOf,ahOS],ahOU)
; (*: [ahOf,ahOU],ahOW)
; (*: [ahOf,ahOW],ahOY)
; (*: [ahOf,ahOY],ahP0)
; (*: [ahOf,ahP0],ahP2)
; (*: [ahOf,ahP2],ahP4)
; (*: [ahOf,ahP4],ahP6)
; (*: [ahOf,ahP6],ahP8)
; (*: [ahOf,ahP8],ahPa)
; (*: [ahOf,ahPa],ahPc)
; (*: [ahOf,ahPc],ahPe)
; (*: [ahOf,ahPe],ahPg)
; (*: [ahOf,ahPg],ahPi)
; (*: [ahOf,ahPi],ahPk)
; (*: [ahOf,ahPk],ahPm)
; (*: [ahOf,ahPm],ahPo)
; (*: [ahOf,ahPo],ahPq)
; (*: [ahOf,ahPq],ahPs)
; (*: [ahOf,ahPs],ahPu)
; (*: [ahOf,ahPu],ahPw)
; (*: [ahOf,ahPw],ahPy)
; (*: [ahOf,ahPy],ahPA)
; (*: [ahOf,ahPA],ahPC)
; (*: [ahOf,ahPC],ahPE)
; (*: [ahOf,ahOf],ahOs)
; (*: [ahOf,ahOs],ahOu)
; (*: [ahOe,ahOe],ahOq)
; (ahPE,ahPG)
; (ahOq,ahOu)

; WANTEDS (Thoralf style)
; (*: [ahOi,ahOi],ahOu)

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_ahPU} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahOi
;      ahOi)
;    ahOu)

; GIVENS (names)
;  ahOe  <=  a
;  ahOf  <=  b
;  ahOq  <=  fsk_ahOq
;  ahOs  <=  fsk_ahOs
;  ahOu  <=  fsk_ahOu
;  ahOA  <=  fsk_ahOA
;  ahOC  <=  fsk_ahOC
;  ahOE  <=  fsk_ahOE
;  ahOG  <=  fsk_ahOG
;  ahOI  <=  fsk_ahOI
;  ahOK  <=  fsk_ahOK
;  ahOM  <=  fsk_ahOM
;  ahOO  <=  fsk_ahOO
;  ahOQ  <=  fsk_ahOQ
;  ahOS  <=  fsk_ahOS
;  ahOU  <=  fsk_ahOU
;  ahOW  <=  fsk_ahOW
;  ahOY  <=  fsk_ahOY
;  ahP0  <=  fsk_ahP0
;  ahP2  <=  fsk_ahP2
;  ahP4  <=  fsk_ahP4
;  ahP6  <=  fsk_ahP6
;  ahP8  <=  fsk_ahP8
;  ahPa  <=  fsk_ahPa
;  ahPc  <=  fsk_ahPc
;  ahPe  <=  fsk_ahPe
;  ahPg  <=  fsk_ahPg
;  ahPi  <=  fsk_ahPi
;  ahPk  <=  fsk_ahPk
;  ahPm  <=  fsk_ahPm
;  ahPo  <=  fsk_ahPo
;  ahPq  <=  fsk_ahPq
;  ahPs  <=  fsk_ahPs
;  ahPu  <=  fsk_ahPu
;  ahPw  <=  fsk_ahPw
;  ahPy  <=  fsk_ahPy
;  ahPA  <=  fsk_ahPA
;  ahPC  <=  fsk_ahPC
;  ahPE  <=  fsk_ahPE
;  ahPG  <=  fsk_ahPG
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ahOA (Array String Int))
; (declare-const ahOC (Array String Int))
; (declare-const ahOE (Array String Int))
; (declare-const ahOG (Array String Int))
; (declare-const ahOI (Array String Int))
; (declare-const ahOK (Array String Int))
; (declare-const ahOM (Array String Int))
; (declare-const ahOO (Array String Int))
; (declare-const ahOQ (Array String Int))
; (declare-const ahOS (Array String Int))
; (declare-const ahOU (Array String Int))
; (declare-const ahOW (Array String Int))
; (declare-const ahOY (Array String Int))
; (declare-const ahOe (Array String Int))
; (declare-const ahOf (Array String Int))
; (declare-const ahOq (Array String Int))
; (declare-const ahOs (Array String Int))
; (declare-const ahOu (Array String Int))
; (declare-const ahP0 (Array String Int))
; (declare-const ahP2 (Array String Int))
; (declare-const ahP4 (Array String Int))
; (declare-const ahP6 (Array String Int))
; (declare-const ahP8 (Array String Int))
; (declare-const ahPA (Array String Int))
; (declare-const ahPC (Array String Int))
; (declare-const ahPE (Array String Int))
; (declare-const ahPG (Array String Int))
; (declare-const ahPa (Array String Int))
; (declare-const ahPc (Array String Int))
; (declare-const ahPe (Array String Int))
; (declare-const ahPg (Array String Int))
; (declare-const ahPi (Array String Int))
; (declare-const ahPk (Array String Int))
; (declare-const ahPm (Array String Int))
; (declare-const ahPo (Array String Int))
; (declare-const ahPq (Array String Int))
; (declare-const ahPs (Array String Int))
; (declare-const ahPu (Array String Int))
; (declare-const ahPw (Array String Int))
; (declare-const ahPy (Array String Int))
(declare-const
   ahOe
   (Array String Int))
(declare-const
   ahOf
   (Array String Int))
(declare-const
   ahOq
   (Array String Int))
(declare-const
   ahOs
   (Array String Int))
(declare-const
   ahOu
   (Array String Int))
(declare-const
   ahOA
   (Array String Int))
(declare-const
   ahOC
   (Array String Int))
(declare-const
   ahOE
   (Array String Int))
(declare-const
   ahOG
   (Array String Int))
(declare-const
   ahOI
   (Array String Int))
(declare-const
   ahOK
   (Array String Int))
(declare-const
   ahOM
   (Array String Int))
(declare-const
   ahOO
   (Array String Int))
(declare-const
   ahOQ
   (Array String Int))
(declare-const
   ahOS
   (Array String Int))
(declare-const
   ahOU
   (Array String Int))
(declare-const
   ahOW
   (Array String Int))
(declare-const
   ahOY
   (Array String Int))
(declare-const
   ahP0
   (Array String Int))
(declare-const
   ahP2
   (Array String Int))
(declare-const
   ahP4
   (Array String Int))
(declare-const
   ahP6
   (Array String Int))
(declare-const
   ahP8
   (Array String Int))
(declare-const
   ahPa
   (Array String Int))
(declare-const
   ahPc
   (Array String Int))
(declare-const
   ahPe
   (Array String Int))
(declare-const
   ahPg
   (Array String Int))
(declare-const
   ahPi
   (Array String Int))
(declare-const
   ahPk
   (Array String Int))
(declare-const
   ahPm
   (Array String Int))
(declare-const
   ahPo
   (Array String Int))
(declare-const
   ahPq
   (Array String Int))
(declare-const
   ahPs
   (Array String Int))
(declare-const
   ahPu
   (Array String Int))
(declare-const
   ahPw
   (Array String Int))
(declare-const
   ahPy
   (Array String Int))
(declare-const
   ahPA
   (Array String Int))
(declare-const
   ahPC
   (Array String Int))
(declare-const
   ahPE
   (Array String Int))
(declare-const
   ahPG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ahPG)
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
           ahOf
           ahOu)
         ahOA)
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
           ahOf
           ahOA)
         ahOC)
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
           ahOf
           ahOC)
         ahOE)
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
           ahOf
           ahOE)
         ahOG)
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
           ahOf
           ahOG)
         ahOI)
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
           ahOf
           ahOI)
         ahOK)
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
           ahOf
           ahOK)
         ahOM)
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
           ahOf
           ahOM)
         ahOO)
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
           ahOf
           ahOO)
         ahOQ)
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
           ahOf
           ahOQ)
         ahOS)
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
           ahOf
           ahOS)
         ahOU)
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
           ahOf
           ahOU)
         ahOW)
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
           ahOf
           ahOW)
         ahOY)
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
           ahOf
           ahOY)
         ahP0)
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
           ahOf
           ahP0)
         ahP2)
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
           ahOf
           ahP2)
         ahP4)
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
           ahOf
           ahP4)
         ahP6)
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
           ahOf
           ahP6)
         ahP8)
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
           ahOf
           ahP8)
         ahPa)
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
           ahOf
           ahPa)
         ahPc)
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
           ahOf
           ahPc)
         ahPe)
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
           ahOf
           ahPe)
         ahPg)
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
           ahOf
           ahPg)
         ahPi)
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
           ahOf
           ahPi)
         ahPk)
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
           ahOf
           ahPk)
         ahPm)
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
           ahOf
           ahPm)
         ahPo)
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
           ahOf
           ahPo)
         ahPq)
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
           ahOf
           ahPq)
         ahPs)
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
           ahOf
           ahPs)
         ahPu)
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
           ahOf
           ahPu)
         ahPw)
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
           ahOf
           ahPw)
         ahPy)
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
           ahOf
           ahPy)
         ahPA)
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
           ahOf
           ahPA)
         ahPC)
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
           ahOf
           ahPC)
         ahPE)
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
           ahOf
           ahOf)
         ahOs)
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
           ahOf
           ahOs)
         ahOu)
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
           ahOe
           ahOe)
         ahOq)
      :named
      given-1.38))
(assert
   (!
      (= ahPE ahPG)
      :named
      given-1.39))
(assert
   (!
      (= ahOq ahOu)
      :named
      given-1.40))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_ahPU} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahOi
;      ahOi)
;    ahOu)

; WANTEDS (names)
;  ahOi  <=  a_ahOi
;  ahOu  <=  fsk_ahOu
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ahOi (Array String Int))
(declare-const
   ahOi
   (Array String Int))
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
              ahOi
              ahOi)
            ahOu))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      ahOS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOq
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPi
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.34
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPA)
;         ahPC))
;   (define-fun
;      given-1.28
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPo)
;         ahPq))
;   (define-fun
;      given-1.19
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahP6)
;         ahP8))
;   (define-fun
;      given-1.18
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahP4)
;         ahP6))
;   (define-fun
;      given-1.23
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPe)
;         ahPg))
;   (define-fun
;      given-1.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOA)
;         ahOC))
;   (define-fun
;      ahOW
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPa
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.21
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPa)
;         ahPc))
;   (define-fun
;      given-1.6
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOG)
;         ahOI))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      ahOU
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPC
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahP6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOi
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           38)
;         "!0!"
;         (- 1)))
;   (define-fun
;      given-1.25
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPi)
;         ahPk))
;   (define-fun
;      given-1.37
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOs)
;         ahOu))
;   (define-fun
;      given-1.36
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOf)
;         ahOs))
;   (define-fun
;      given-1.4
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOC)
;         ahOE))
;   (define-fun
;      ahPo
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.32
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPw)
;         ahPy))
;   (define-fun
;      wanted-1
;      ()
;      Bool
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              ahOi
;              ahOi)
;            ahOu)))
;   (define-fun
;      ahOM
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.29
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPq)
;         ahPs))
;   (define-fun
;      ahP4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPA
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPm
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.27
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPm)
;         ahPo))
;   (define-fun
;      given-1.12
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOS)
;         ahOU))
;   (define-fun
;      given-1.11
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOQ)
;         ahOS))
;   (define-fun
;      given-1.10
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOO)
;         ahOQ))
;   (define-fun
;      given-1.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOu)
;         ahOA))
;   (define-fun
;      given-1.17
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahP2)
;         ahP4))
;   (define-fun
;      given-1.5
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOE)
;         ahOG))
;   (define-fun
;      given-1.7
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOI)
;         ahOK))
;   (define-fun
;      given-1.16
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahP0)
;         ahP2))
;   (define-fun
;      ahOG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPe
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOe
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.15
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOY)
;         ahP0))
;   (define-fun
;      given-1.9
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOM)
;         ahOO))
;   (define-fun
;      ahOu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.40
;      ()
;      Bool
;      (= ahOq ahOu))
;   (define-fun
;      ahP0
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.13
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOU)
;         ahOW))
;   (define-fun
;      ahP2
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.33
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPy)
;         ahPA))
;   (define-fun
;      given-1.35
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPC)
;         ahPE))
;   (define-fun
;      ahPg
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.24
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPg)
;         ahPi))
;   (define-fun
;      ahOI
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOK
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOC
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPq
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.14
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOW)
;         ahOY))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-1.8
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahOK)
;         ahOM))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-1.39
;      ()
;      Bool
;      (= ahPE ahPG))
;   (define-fun
;      ahOO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.20
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahP8)
;         ahPa))
;   (define-fun
;      ahPG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.38
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOe
;           ahOe)
;         ahOq))
;   (define-fun
;      given-1.31
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPu)
;         ahPw))
;   (define-fun
;      ahOf
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         ahPG))
;   (define-fun
;      ahOA
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPy
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahPs
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahOs
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.30
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPs)
;         ahPu))
;   (define-fun
;      given-1.26
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPk)
;         ahPm))
;   (define-fun
;      ahP8
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.22
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahOf
;           ahPc)
;         ahPe))
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

; GIVENS (GHC style)
; [G] co_ahQz {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ahQt {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahQv {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahQx {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahQl {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_ahQn {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahQj {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_ahQC {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_ahQF {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ahQP} {3}:: (b0 *: (b0 *: b0)) ~ fsk0 (CNonCanonical)
; [WD] hole{co_ahQY} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                          ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ahQy)
; (*: [ahQ7,ahQm],ahQs)
; (*: [ahQ7,ahQs],ahQu)
; (*: [ahQ7,ahQu],ahQw)
; (*: [ahQ7,ahQ7],ahQk)
; (*: [ahQ7,ahQk],ahQm)
; (*: [ahQ6,ahQ6],ahQi)
; (ahQw,ahQy)
; (ahQi,ahQm)

; WANTEDS (Thoralf style)
; (*: [ahQb,*: [ahQb,ahQb]],ahQm)
; (*: [ahQb,*: [ahQb,*: [ahQb,*: [ahQb,*: [ahQb,ahQb]]]]],ahQy)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_ahQP} {3}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahQb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        ahQb
;        ahQb))
;    ahQm)

;      [WD] hole{co_ahQY} {2}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahQb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        ahQb
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          ahQb
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            ahQb
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              ahQb
;              ahQb)))))
;    ahQy)

; GIVENS (names)
;  ahQ6  <=  a
;  ahQ7  <=  b
;  ahQi  <=  fsk_ahQi
;  ahQk  <=  fsk_ahQk
;  ahQm  <=  fsk_ahQm
;  ahQs  <=  fsk_ahQs
;  ahQu  <=  fsk_ahQu
;  ahQw  <=  fsk_ahQw
;  ahQy  <=  fsk_ahQy
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ahQ6 (Array String Int))
; (declare-const ahQ7 (Array String Int))
; (declare-const ahQi (Array String Int))
; (declare-const ahQk (Array String Int))
; (declare-const ahQm (Array String Int))
; (declare-const ahQs (Array String Int))
; (declare-const ahQu (Array String Int))
; (declare-const ahQw (Array String Int))
; (declare-const ahQy (Array String Int))
(declare-const
   ahQ6
   (Array String Int))
(declare-const
   ahQ7
   (Array String Int))
(declare-const
   ahQi
   (Array String Int))
(declare-const
   ahQk
   (Array String Int))
(declare-const
   ahQm
   (Array String Int))
(declare-const
   ahQs
   (Array String Int))
(declare-const
   ahQu
   (Array String Int))
(declare-const
   ahQw
   (Array String Int))
(declare-const
   ahQy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ahQy)
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
           ahQ7
           ahQm)
         ahQs)
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
           ahQ7
           ahQs)
         ahQu)
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
           ahQ7
           ahQu)
         ahQw)
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
           ahQ7
           ahQ7)
         ahQk)
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
           ahQ7
           ahQk)
         ahQm)
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
           ahQ6
           ahQ6)
         ahQi)
      :named
      given-2.7))
(assert
   (!
      (= ahQw ahQy)
      :named
      given-2.8))
(assert
   (!
      (= ahQi ahQm)
      :named
      given-2.9))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_ahQP} {3}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahQb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        ahQb
;        ahQb))
;    ahQm)

;      [WD] hole{co_ahQY} {2}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahQb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        ahQb
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          ahQb
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            ahQb
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              ahQb
;              ahQb)))))
;    ahQy)

; WANTEDS (names)
;  ahQb  <=  b_ahQb
;  ahQm  <=  fsk_ahQm
;  ahQy  <=  fsk_ahQy
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ahQb (Array String Int))
(declare-const
   ahQb
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ahQb
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   ahQb
                   ahQb))
               ahQm))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ahQb
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   ahQb
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     ahQb
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       ahQb
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         ahQb
                         ahQb)))))
               ahQy)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      ahQu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.9
;      ()
;      Bool
;      (= ahQi ahQm))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahQ7
;           ahQs)
;         ahQu))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        7))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         ahQy))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        7))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahQ6
;           ahQ6)
;         ahQi))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahQ7
;           ahQu)
;         ahQw))
;   (define-fun
;      wanted-2
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_
;                         map
;                         (+
;                            (Int Int)
;                            Int))
;                      ahQb
;                      ahQb
;                      ahQb
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        ahQb
;                        ahQb
;                        ahQb))
;                    ahQy))))
;         (or
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    ahQb
;                    ahQb
;                    ahQb)
;                  ahQm))
;            a!1)))
;   (define-fun
;      ahQm
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahQk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahQ6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahQ7
;           ahQ7)
;         ahQk))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahQ7
;           ahQk)
;         ahQm))
;   (define-fun
;      ahQb
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         1))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahQ7
;           ahQm)
;         ahQs))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= ahQw ahQy))
;   (define-fun
;      ahQy
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahQw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahQi
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahQs
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
;      ahQ7
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
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] co_ahRY {1}:: (v *: v) ~ fsk0 (CNonCanonical)
; [G] co_ahRR {0}:: (v *: w) ~ fsk0 (CNonCanonical)
; [G] co_ahRS {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_ahS1 {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ahS9} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{co_ahSe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [ahRB,ahRB],ahRX)
; (*: [ahRB,ahRC],ahRQ)
; (ahRQ,ahRA)
; (ahRX,ahRB)

; WANTEDS (Thoralf style)
; (*: [ahRH,ahRC],ahRA)
; (*: [ahRH,ahRH],ahRH)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_ahS9} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahRH
;      ahRC)
;    ahRA)

;      [WD] hole{co_ahSe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahRH
;      ahRH)
;    ahRH)

; GIVENS (names)
;  ahRA  <=  u
;  ahRB  <=  v
;  ahRC  <=  w
;  ahRQ  <=  fsk_ahRQ
;  ahRX  <=  fsk_ahRX
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ahRA (Array String Int))
; (declare-const ahRB (Array String Int))
; (declare-const ahRC (Array String Int))
; (declare-const ahRQ (Array String Int))
; (declare-const ahRX (Array String Int))
(declare-const
   ahRA
   (Array String Int))
(declare-const
   ahRB
   (Array String Int))
(declare-const
   ahRC
   (Array String Int))
(declare-const
   ahRQ
   (Array String Int))
(declare-const
   ahRX
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
           ahRB
           ahRB)
         ahRX)
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
           ahRB
           ahRC)
         ahRQ)
      :named
      given-3.2))
(assert
   (!
      (= ahRQ ahRA)
      :named
      given-3.3))
(assert
   (!
      (= ahRX ahRB)
      :named
      given-3.4))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_ahS9} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahRH
;      ahRC)
;    ahRA)

;      [WD] hole{co_ahSe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ahRH
;      ahRH)
;    ahRH)

; WANTEDS (names)
;  ahRA  <=  u
;  ahRC  <=  w
;  ahRH  <=  v_ahRH
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ahRH (Array String Int))
(declare-const
   ahRH
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ahRH
                 ahRC)
               ahRA))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ahRH
                 ahRH)
               ahRH)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahRB
;           ahRB)
;         ahRX))
;   (define-fun
;      ahRB
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahRA
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         20652))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ahRB
;           ahRC)
;         ahRQ))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        3))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        3))
;   (define-fun
;      ahRX
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahRC
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         20652))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (= ahRQ ahRA))
;   (define-fun
;      ahRQ
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         20652))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      ahRH
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         1))
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 ahRH
;                 ahRC)
;               ahRA))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 ahRH
;                 ahRH)
;               ahRH))))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (= ahRX ahRB))
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
; [G] co_aiec {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aid6 {34}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aid8 {33}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aida {32}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidc {31}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aide {30}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidg {29}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidi {28}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidk {27}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidm {26}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aido {25}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidq {24}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aids {23}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidu {22}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidw {21}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidy {20}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidA {19}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidC {18}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidE {17}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidG {16}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidI {15}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidK {14}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidM {13}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidO {12}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidQ {11}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidS {10}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidU {9}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidW {8}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aidY {7}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aie0 {6}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aie2 {5}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aie4 {4}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aie6 {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aie8 {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiea {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aicY {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_aid0 {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aicW {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aief {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aiei {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aien} {2}:: fsk0 ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aieb)
; (*: [ai9C,aicZ],aid5)
; (*: [ai9C,aid5],aid7)
; (*: [ai9C,aid7],aid9)
; (*: [ai9C,aid9],aidb)
; (*: [ai9C,aidb],aidd)
; (*: [ai9C,aidd],aidf)
; (*: [ai9C,aidf],aidh)
; (*: [ai9C,aidh],aidj)
; (*: [ai9C,aidj],aidl)
; (*: [ai9C,aidl],aidn)
; (*: [ai9C,aidn],aidp)
; (*: [ai9C,aidp],aidr)
; (*: [ai9C,aidr],aidt)
; (*: [ai9C,aidt],aidv)
; (*: [ai9C,aidv],aidx)
; (*: [ai9C,aidx],aidz)
; (*: [ai9C,aidz],aidB)
; (*: [ai9C,aidB],aidD)
; (*: [ai9C,aidD],aidF)
; (*: [ai9C,aidF],aidH)
; (*: [ai9C,aidH],aidJ)
; (*: [ai9C,aidJ],aidL)
; (*: [ai9C,aidL],aidN)
; (*: [ai9C,aidN],aidP)
; (*: [ai9C,aidP],aidR)
; (*: [ai9C,aidR],aidT)
; (*: [ai9C,aidT],aidV)
; (*: [ai9C,aidV],aidX)
; (*: [ai9C,aidX],aidZ)
; (*: [ai9C,aidZ],aie1)
; (*: [ai9C,aie1],aie3)
; (*: [ai9C,aie3],aie5)
; (*: [ai9C,aie5],aie7)
; (*: [ai9C,aie7],aie9)
; (*: [ai9C,ai9C],aicX)
; (*: [ai9C,aicX],aicZ)
; (*: [ai9B,ai9B],aicV)
; (aie9,aieb)
; (aicV,aicZ)

; WANTEDS (Thoralf style)
; (aieb,ai9C)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aien} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= aieb ai9C)

; GIVENS (names)
;  ai9B  <=  a
;  ai9C  <=  b
;  aicV  <=  fsk_aicV
;  aicX  <=  fsk_aicX
;  aicZ  <=  fsk_aicZ
;  aid5  <=  fsk_aid5
;  aid7  <=  fsk_aid7
;  aid9  <=  fsk_aid9
;  aidb  <=  fsk_aidb
;  aidd  <=  fsk_aidd
;  aidf  <=  fsk_aidf
;  aidh  <=  fsk_aidh
;  aidj  <=  fsk_aidj
;  aidl  <=  fsk_aidl
;  aidn  <=  fsk_aidn
;  aidp  <=  fsk_aidp
;  aidr  <=  fsk_aidr
;  aidt  <=  fsk_aidt
;  aidv  <=  fsk_aidv
;  aidx  <=  fsk_aidx
;  aidz  <=  fsk_aidz
;  aidB  <=  fsk_aidB
;  aidD  <=  fsk_aidD
;  aidF  <=  fsk_aidF
;  aidH  <=  fsk_aidH
;  aidJ  <=  fsk_aidJ
;  aidL  <=  fsk_aidL
;  aidN  <=  fsk_aidN
;  aidP  <=  fsk_aidP
;  aidR  <=  fsk_aidR
;  aidT  <=  fsk_aidT
;  aidV  <=  fsk_aidV
;  aidX  <=  fsk_aidX
;  aidZ  <=  fsk_aidZ
;  aie1  <=  fsk_aie1
;  aie3  <=  fsk_aie3
;  aie5  <=  fsk_aie5
;  aie7  <=  fsk_aie7
;  aie9  <=  fsk_aie9
;  aieb  <=  fsk_aieb
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ai9B (Array String Int))
; (declare-const ai9C (Array String Int))
; (declare-const aicV (Array String Int))
; (declare-const aicX (Array String Int))
; (declare-const aicZ (Array String Int))
; (declare-const aid5 (Array String Int))
; (declare-const aid7 (Array String Int))
; (declare-const aid9 (Array String Int))
; (declare-const aidB (Array String Int))
; (declare-const aidD (Array String Int))
; (declare-const aidF (Array String Int))
; (declare-const aidH (Array String Int))
; (declare-const aidJ (Array String Int))
; (declare-const aidL (Array String Int))
; (declare-const aidN (Array String Int))
; (declare-const aidP (Array String Int))
; (declare-const aidR (Array String Int))
; (declare-const aidT (Array String Int))
; (declare-const aidV (Array String Int))
; (declare-const aidX (Array String Int))
; (declare-const aidZ (Array String Int))
; (declare-const aidb (Array String Int))
; (declare-const aidd (Array String Int))
; (declare-const aidf (Array String Int))
; (declare-const aidh (Array String Int))
; (declare-const aidj (Array String Int))
; (declare-const aidl (Array String Int))
; (declare-const aidn (Array String Int))
; (declare-const aidp (Array String Int))
; (declare-const aidr (Array String Int))
; (declare-const aidt (Array String Int))
; (declare-const aidv (Array String Int))
; (declare-const aidx (Array String Int))
; (declare-const aidz (Array String Int))
; (declare-const aie1 (Array String Int))
; (declare-const aie3 (Array String Int))
; (declare-const aie5 (Array String Int))
; (declare-const aie7 (Array String Int))
; (declare-const aie9 (Array String Int))
; (declare-const aieb (Array String Int))
(declare-const
   ai9B
   (Array String Int))
(declare-const
   ai9C
   (Array String Int))
(declare-const
   aicV
   (Array String Int))
(declare-const
   aicX
   (Array String Int))
(declare-const
   aicZ
   (Array String Int))
(declare-const
   aid5
   (Array String Int))
(declare-const
   aid7
   (Array String Int))
(declare-const
   aid9
   (Array String Int))
(declare-const
   aidb
   (Array String Int))
(declare-const
   aidd
   (Array String Int))
(declare-const
   aidf
   (Array String Int))
(declare-const
   aidh
   (Array String Int))
(declare-const
   aidj
   (Array String Int))
(declare-const
   aidl
   (Array String Int))
(declare-const
   aidn
   (Array String Int))
(declare-const
   aidp
   (Array String Int))
(declare-const
   aidr
   (Array String Int))
(declare-const
   aidt
   (Array String Int))
(declare-const
   aidv
   (Array String Int))
(declare-const
   aidx
   (Array String Int))
(declare-const
   aidz
   (Array String Int))
(declare-const
   aidB
   (Array String Int))
(declare-const
   aidD
   (Array String Int))
(declare-const
   aidF
   (Array String Int))
(declare-const
   aidH
   (Array String Int))
(declare-const
   aidJ
   (Array String Int))
(declare-const
   aidL
   (Array String Int))
(declare-const
   aidN
   (Array String Int))
(declare-const
   aidP
   (Array String Int))
(declare-const
   aidR
   (Array String Int))
(declare-const
   aidT
   (Array String Int))
(declare-const
   aidV
   (Array String Int))
(declare-const
   aidX
   (Array String Int))
(declare-const
   aidZ
   (Array String Int))
(declare-const
   aie1
   (Array String Int))
(declare-const
   aie3
   (Array String Int))
(declare-const
   aie5
   (Array String Int))
(declare-const
   aie7
   (Array String Int))
(declare-const
   aie9
   (Array String Int))
(declare-const
   aieb
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aieb)
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
           ai9C
           aicZ)
         aid5)
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
           ai9C
           aid5)
         aid7)
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
           ai9C
           aid7)
         aid9)
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
           ai9C
           aid9)
         aidb)
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
           ai9C
           aidb)
         aidd)
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
           ai9C
           aidd)
         aidf)
      :named
      given-4.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidf)
         aidh)
      :named
      given-4.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidh)
         aidj)
      :named
      given-4.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidj)
         aidl)
      :named
      given-4.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidl)
         aidn)
      :named
      given-4.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidn)
         aidp)
      :named
      given-4.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidp)
         aidr)
      :named
      given-4.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidr)
         aidt)
      :named
      given-4.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidt)
         aidv)
      :named
      given-4.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidv)
         aidx)
      :named
      given-4.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidx)
         aidz)
      :named
      given-4.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidz)
         aidB)
      :named
      given-4.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidB)
         aidD)
      :named
      given-4.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidD)
         aidF)
      :named
      given-4.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidF)
         aidH)
      :named
      given-4.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidH)
         aidJ)
      :named
      given-4.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidJ)
         aidL)
      :named
      given-4.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidL)
         aidN)
      :named
      given-4.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidN)
         aidP)
      :named
      given-4.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidP)
         aidR)
      :named
      given-4.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidR)
         aidT)
      :named
      given-4.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidT)
         aidV)
      :named
      given-4.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidV)
         aidX)
      :named
      given-4.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidX)
         aidZ)
      :named
      given-4.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aidZ)
         aie1)
      :named
      given-4.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aie1)
         aie3)
      :named
      given-4.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aie3)
         aie5)
      :named
      given-4.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aie5)
         aie7)
      :named
      given-4.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aie7)
         aie9)
      :named
      given-4.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           ai9C)
         aicX)
      :named
      given-4.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9C
           aicX)
         aicZ)
      :named
      given-4.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9B
           ai9B)
         aicV)
      :named
      given-4.38))
(assert
   (!
      (= aie9 aieb)
      :named
      given-4.39))
(assert
   (!
      (= aicV aicZ)
      :named
      given-4.40))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aien} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= aieb ai9C)

; WANTEDS (names)
;  ai9C  <=  b
;  aieb  <=  fsk_aieb
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aieb ai9C))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
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
;         aieb)
;      :named
;      given-4.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aicZ)
;         aid5)
;      :named
;      given-4.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aid5)
;         aid7)
;      :named
;      given-4.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aid7)
;         aid9)
;      :named
;      given-4.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aid9)
;         aidb)
;      :named
;      given-4.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidb)
;         aidd)
;      :named
;      given-4.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidd)
;         aidf)
;      :named
;      given-4.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidf)
;         aidh)
;      :named
;      given-4.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidh)
;         aidj)
;      :named
;      given-4.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidj)
;         aidl)
;      :named
;      given-4.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidl)
;         aidn)
;      :named
;      given-4.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidn)
;         aidp)
;      :named
;      given-4.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidp)
;         aidr)
;      :named
;      given-4.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidr)
;         aidt)
;      :named
;      given-4.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidt)
;         aidv)
;      :named
;      given-4.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidv)
;         aidx)
;      :named
;      given-4.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidx)
;         aidz)
;      :named
;      given-4.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidz)
;         aidB)
;      :named
;      given-4.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidB)
;         aidD)
;      :named
;      given-4.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidD)
;         aidF)
;      :named
;      given-4.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidF)
;         aidH)
;      :named
;      given-4.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidH)
;         aidJ)
;      :named
;      given-4.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidJ)
;         aidL)
;      :named
;      given-4.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidL)
;         aidN)
;      :named
;      given-4.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidN)
;         aidP)
;      :named
;      given-4.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidP)
;         aidR)
;      :named
;      given-4.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidR)
;         aidT)
;      :named
;      given-4.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidT)
;         aidV)
;      :named
;      given-4.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidV)
;         aidX)
;      :named
;      given-4.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidX)
;         aidZ)
;      :named
;      given-4.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aidZ)
;         aie1)
;      :named
;      given-4.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aie1)
;         aie3)
;      :named
;      given-4.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aie3)
;         aie5)
;      :named
;      given-4.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aie5)
;         aie7)
;      :named
;      given-4.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aie7)
;         aie9)
;      :named
;      given-4.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           ai9C)
;         aicX)
;      :named
;      given-4.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9C
;           aicX)
;         aicZ)
;      :named
;      given-4.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9B
;           ai9B)
;         aicV)
;      :named
;      given-4.38)
;   (!
;      (= aie9 aieb)
;      :named
;      given-4.39)
;   (!
;      (= aicV aicZ)
;      :named
;      given-4.40)
;   (!
;      (not
;         (= aieb ai9C))
;      :named
;      wanted-4))
(get-unsat-core)
; (given-4.23
;    given-4.22
;    given-4.21
;    given-4.3
;    given-4.20
;    given-4.19
;    given-4.18
;    given-4.17
;    given-4.16
;    given-4.15
;    given-4.14
;    given-4.13
;    given-4.4
;    given-4.1
;    given-4.9
;    given-4.11
;    given-4.8
;    given-4.6
;    given-4.2
;    given-4.29
;    given-4.30
;    given-4.31
;    given-4.28
;    given-4.27
;    given-4.26
;    given-4.25
;    given-4.24
;    given-4.7
;    given-4.10
;    wanted-4
;    given-4.39
;    given-4.37
;    given-4.36
;    given-4.35
;    given-4.34
;    given-4.33
;    given-4.12
;    given-4.32
;    given-4.5)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_aieH {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aieB {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aieD {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aieF {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiet {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_aiev {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aier {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aieK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aieN {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aieS} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aieG)
; (*: [ai9K,aieu],aieA)
; (*: [ai9K,aieA],aieC)
; (*: [ai9K,aieC],aieE)
; (*: [ai9K,ai9K],aies)
; (*: [ai9K,aies],aieu)
; (*: [ai9J,ai9J],aieq)
; (aieE,aieG)
; (aieq,aieu)

; WANTEDS (Thoralf style)
; (aieG,ai9J)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aieS} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aieG ai9J)

; GIVENS (names)
;  ai9J  <=  a
;  ai9K  <=  b
;  aieq  <=  fsk_aieq
;  aies  <=  fsk_aies
;  aieu  <=  fsk_aieu
;  aieA  <=  fsk_aieA
;  aieC  <=  fsk_aieC
;  aieE  <=  fsk_aieE
;  aieG  <=  fsk_aieG
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ai9J (Array String Int))
; (declare-const ai9K (Array String Int))
; (declare-const aieA (Array String Int))
; (declare-const aieC (Array String Int))
; (declare-const aieE (Array String Int))
; (declare-const aieG (Array String Int))
; (declare-const aieq (Array String Int))
; (declare-const aies (Array String Int))
; (declare-const aieu (Array String Int))
(declare-const
   ai9J
   (Array String Int))
(declare-const
   ai9K
   (Array String Int))
(declare-const
   aieq
   (Array String Int))
(declare-const
   aies
   (Array String Int))
(declare-const
   aieu
   (Array String Int))
(declare-const
   aieA
   (Array String Int))
(declare-const
   aieC
   (Array String Int))
(declare-const
   aieE
   (Array String Int))
(declare-const
   aieG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aieG)
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
           ai9K
           aieu)
         aieA)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9K
           aieA)
         aieC)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9K
           aieC)
         aieE)
      :named
      given-5.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9K
           ai9K)
         aies)
      :named
      given-5.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9K
           aies)
         aieu)
      :named
      given-5.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ai9J
           ai9J)
         aieq)
      :named
      given-5.7))
(assert
   (!
      (= aieE aieG)
      :named
      given-5.8))
(assert
   (!
      (= aieq aieu)
      :named
      given-5.9))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aieS} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aieG ai9J)

; WANTEDS (names)
;  ai9J  <=  a
;  aieG  <=  fsk_aieG
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aieG ai9J))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         aieG)
;      :named
;      given-5.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9K
;           aieu)
;         aieA)
;      :named
;      given-5.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9K
;           aieA)
;         aieC)
;      :named
;      given-5.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9K
;           aieC)
;         aieE)
;      :named
;      given-5.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9K
;           ai9K)
;         aies)
;      :named
;      given-5.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9K
;           aies)
;         aieu)
;      :named
;      given-5.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9J
;           ai9J)
;         aieq)
;      :named
;      given-5.7)
;   (!
;      (= aieE aieG)
;      :named
;      given-5.8)
;   (!
;      (= aieq aieu)
;      :named
;      given-5.9)
;   (!
;      (not
;         (= aieG ai9J))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5
;    given-5.9
;    given-5.8
;    given-5.7
;    given-5.6
;    given-5.5
;    given-5.4
;    given-5.3
;    given-5.1
;    given-5.2)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aieY {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aieW {0}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aieZ {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aif4} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aieX)
; (*: [ai9R,ai9R],aieV)
; (aieV,aieX)

; WANTEDS (Thoralf style)
; (aieX,ai9R)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aif4} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aieX ai9R)

; GIVENS (names)
;  ai9R  <=  a
;  aieV  <=  fsk_aieV
;  aieX  <=  fsk_aieX
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ai9R (Array String Int))
; (declare-const aieV (Array String Int))
; (declare-const aieX (Array String Int))
(declare-const
   ai9R
   (Array String Int))
(declare-const
   aieV
   (Array String Int))
(declare-const
   aieX
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aieX)
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
           ai9R
           ai9R)
         aieV)
      :named
      given-6.2))
(assert
   (!
      (= aieV aieX)
      :named
      given-6.3))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aif4} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aieX ai9R)

; WANTEDS (names)
;  ai9R  <=  a
;  aieX  <=  fsk_aieX
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aieX ai9R))
      :named
      wanted-6))
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
;           (as
;              const
;              (Array String Int))
;           0)
;         aieX)
;      :named
;      given-6.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9R
;           ai9R)
;         aieV)
;      :named
;      given-6.2)
;   (!
;      (= aieV aieX)
;      :named
;      given-6.3)
;   (!
;      (not
;         (= aieX ai9R))
;      :named
;      wanted-6))
(get-unsat-core)
; (given-6.2 given-6.1 wanted-6 given-6.3)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_aiff {1}:: (v *: v) ~ fsk0 (CNonCanonical)
; [G] co_aif8 {0}:: (v *: w) ~ fsk0 (CNonCanonical)
; [G] co_aif9 {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_aifi {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aia5} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [ai9Y,ai9Y],aife)
; (*: [ai9Y,ai9Z],aif7)
; (aif7,ai9X)
; (aife,ai9Y)

; WANTEDS (Thoralf style)
; (ai9X,ai9Z)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_aia5} {0}:: u ~ w (CNonCanonical)
;  =>  (= ai9X ai9Z)

; GIVENS (names)
;  ai9X  <=  u
;  ai9Y  <=  v
;  ai9Z  <=  w
;  aif7  <=  fsk_aif7
;  aife  <=  fsk_aife
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ai9X (Array String Int))
; (declare-const ai9Y (Array String Int))
; (declare-const ai9Z (Array String Int))
; (declare-const aif7 (Array String Int))
; (declare-const aife (Array String Int))
(declare-const
   ai9X
   (Array String Int))
(declare-const
   ai9Y
   (Array String Int))
(declare-const
   ai9Z
   (Array String Int))
(declare-const
   aif7
   (Array String Int))
(declare-const
   aife
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
           ai9Y
           ai9Y)
         aife)
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
           ai9Y
           ai9Z)
         aif7)
      :named
      given-7.2))
(assert
   (!
      (= aif7 ai9X)
      :named
      given-7.3))
(assert
   (!
      (= aife ai9Y)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_aia5} {0}:: u ~ w (CNonCanonical)
;  =>  (= ai9X ai9Z)

; WANTEDS (names)
;  ai9X  <=  u
;  ai9Z  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ai9X ai9Z))
      :named
      wanted-7))
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
;           ai9Y
;           ai9Y)
;         aife)
;      :named
;      given-7.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ai9Y
;           ai9Z)
;         aif7)
;      :named
;      given-7.2)
;   (!
;      (= aif7 ai9X)
;      :named
;      given-7.3)
;   (!
;      (= aife ai9Y)
;      :named
;      given-7.4)
;   (!
;      (not
;         (= ai9X ai9Z))
;      :named
;      wanted-7))
(get-unsat-core)
; (given-7.1 given-7.2 given-7.4 given-7.3 wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aifo {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aifu {2}:: Base "kg" ~ fsk0 (CNonCanonical)
; [G] co_aifq {1}:: (w *: w) ~ fsk0 (CNonCanonical)
; [G] co_aifw {1}:: (fsk0 *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aify {0}:: (fsk0 /: fsk1) ~ fsk2 (CNonCanonical)
; [G] co_aifs {0}:: (fsk0 /: fsk1) ~ fsk2 (CNonCanonical)
; [G] co_aifB {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aifG} {2}:: fsk0 ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aifn)
; (Base ["kg"],aift)
; (*: [aia7,aia7],aifp)
; (*: [aift,aift],aifv)
; (/: [aifn,aifv],aifx)
; (/: [aifn,aifp],aifr)
; (aifr,aifx)

; WANTEDS (Thoralf style)
; (aift,aia7)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aifG} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= aift aia7)

; GIVENS (names)
;  aia7  <=  w
;  aifn  <=  fsk_aifn
;  aifp  <=  fsk_aifp
;  aifr  <=  fsk_aifr
;  aift  <=  fsk_aift
;  aifv  <=  fsk_aifv
;  aifx  <=  fsk_aifx
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aia7 (Array String Int))
; (declare-const aifn (Array String Int))
; (declare-const aifp (Array String Int))
; (declare-const aifr (Array String Int))
; (declare-const aift (Array String Int))
; (declare-const aifv (Array String Int))
; (declare-const aifx (Array String Int))
(declare-const
   aia7
   (Array String Int))
(declare-const
   aifn
   (Array String Int))
(declare-const
   aifp
   (Array String Int))
(declare-const
   aifr
   (Array String Int))
(declare-const
   aift
   (Array String Int))
(declare-const
   aifv
   (Array String Int))
(declare-const
   aifx
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aifn)
      :named
      given-8.1))
(assert
   (!
      (=
         (store base "kg" one)
         aift)
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
           aia7
           aia7)
         aifp)
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
           aift
           aift)
         aifv)
      :named
      given-8.4))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aifn
           aifv)
         aifx)
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
           aifn
           aifp)
         aifr)
      :named
      given-8.6))
(assert
   (!
      (= aifr aifx)
      :named
      given-8.7))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aifG} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= aift aia7)

; WANTEDS (names)
;  aia7  <=  w
;  aift  <=  fsk_aift
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aift aia7))
      :named
      wanted-8))
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
;         aifn)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store base "kg" one)
;         aift)
;      :named
;      given-8.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aia7
;           aia7)
;         aifp)
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
;           aift
;           aift)
;         aifv)
;      :named
;      given-8.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           aifn
;           aifv)
;         aifx)
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
;           aifn
;           aifp)
;         aifr)
;      :named
;      given-8.6)
;   (!
;      (= aifr aifx)
;      :named
;      given-8.7)
;   (!
;      (not
;         (= aift aia7))
;      :named
;      wanted-8))
(get-unsat-core)
; (given-8.4
;    given-8.5
;    given-8.3
;    given-8.6
;    given-8.7
;    given-8.2
;    wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_aig3 {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aig3 {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_aig3 {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiaf
;      aias)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiaf
;      aias))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] irred_aig3 {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiaf
;      aias)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiaf
;      aias))

; WANTEDS (names)
;  aiaf  <=  u
;  aias  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aiaf (Array String Int))
; (declare-const aias (Array String Int))
(declare-const
   aiaf
   (Array String Int))
(declare-const
   aias
   (Array String Int))
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
              aiaf
              aias)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aiaf
              aias)))
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
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aiaf
;              aias)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aiaf
;              aias)))
;      :named
;      wanted-9))
(get-unsat-core)
; (wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_aigi {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
; [WD] irred_aign {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aigi {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
; [WD] irred_aign {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_aigi {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibo
;      aibp)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibo
;      aibp))

;      [WD] irred_aign {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibo
;      aibp)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibp
;      aibo))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] irred_aigi {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibo
;      aibp)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibo
;      aibp))

;      [WD] irred_aign {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibo
;      aibp)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aibp
;      aibo))

; WANTEDS (names)
;  aibo  <=  u
;  aibp  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aibo (Array String Int))
; (declare-const aibp (Array String Int))
(declare-const
   aibo
   (Array String Int))
(declare-const
   aibp
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aibo
                 aibp)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aibo
                 aibp)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aibo
                 aibp)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aibp
                 aibo))))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aibo
;                 aibp)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aibo
;                 aibp)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aibo
;                 aibp)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aibp
;                 aibo))))
;      :named
;      wanted-10))
(get-unsat-core)
; (wanted-10)
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_aigw {0}:: u ~~ (u /: One) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aigw {0}:: u ~~ (u /: One) (CIrredCan(sol))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_aigw {0}:: u ~~ (u /: One) (CIrredCan(sol))
;  =>  (=
;    aicw
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aicw
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] irred_aigw {0}:: u ~~ (u /: One) (CIrredCan(sol))
;  =>  (=
;    aicw
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aicw
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  aicw  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aicw (Array String Int))
(declare-const
   aicw
   (Array String Int))
(assert
   (!
      (not
         (=
            aicw
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              aicw
              (
                (as
                   const
                   (Array String Int))
                0))))
      :named
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            aicw
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              aicw
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))))
;      :named
;      wanted-11))
(get-unsat-core)
; (wanted-11)
(pop 1)
(echo "solver-finish-cycle-11")
(exit)
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
; [WD] hole{co_aiOP} {2}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aiOP} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_aiOP} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "byte" one))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "byte" one)
;              (store base "byte" one))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
(exit)
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
; [WD] hole{co_al3l} {2}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_al3l} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_al3l} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "byte" one))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "byte" one)
;              (store base "byte" one))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
; [WD] hole{co_allm} {2}:: (One *: a0) ~ (a0 *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [One [],alk8],*: [alk8,One []])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_allm} {2}:: (One *: a0)
;                               ~ (a0 *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      alk8)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      alk8
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_allm} {2}:: (One *: a0)
;                               ~ (a0 *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      alk8)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      alk8
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  alk8  <=  a_alk8
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const alk8 (Array String Int))
(declare-const
   alk8
   (Array String Int))
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
              (
                (as
                   const
                   (Array String Int))
                0)
              alk8)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              alk8
              (
                (as
                   const
                   (Array String Int))
                0))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
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
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              alk8)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              alk8
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
(exit)
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
; [WD] hole{co_a1GB} {1}:: (u *: (One /: u))
;                          ~ (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Gl,/: [One [],a1Gl]],*: [a1Gn,/: [One [],a1Gn]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a1GB} {1}:: (u *: (One /: u))
;                               ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gl
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gl))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gn
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gn)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_a1GB} {1}:: (u *: (One /: u))
;                               ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gl
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gl))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Gn
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1Gn)))

; WANTEDS (names)
;  a1Gl  <=  u
;  a1Gn  <=  u_a1Gn
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Gl (Array String Int))
; (declare-const a1Gn (Array String Int))
(declare-const
   a1Gl
   (Array String Int))
(declare-const
   a1Gn
   (Array String Int))
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
              a1Gl
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
                a1Gl))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1Gn
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
                a1Gn))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
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
;              a1Gl
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)
;                a1Gl))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1Gn
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)
;                a1Gn))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1He} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{co_a1Hj} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1H5,a1H4],*: [a1H2,a1H1])
; (*: [a1H1,a1H2],*: [a1H4,a1H5])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1He} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H5
;      a1H4)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H2
;      a1H1))

;      [WD] hole{co_a1Hj} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H1
;      a1H2)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H4
;      a1H5))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1He} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H5
;      a1H4)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H2
;      a1H1))

;      [WD] hole{co_a1Hj} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H1
;      a1H2)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1H4
;      a1H5))

; WANTEDS (names)
;  a1H1  <=  u
;  a1H2  <=  v
;  a1H4  <=  u_a1H4
;  a1H5  <=  v_a1H5
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1H1 (Array String Int))
; (declare-const a1H2 (Array String Int))
; (declare-const a1H4 (Array String Int))
; (declare-const a1H5 (Array String Int))
(declare-const
   a1H1
   (Array String Int))
(declare-const
   a1H2
   (Array String Int))
(declare-const
   a1H4
   (Array String Int))
(declare-const
   a1H5
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1H5
                 a1H4)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1H2
                 a1H1)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1H1
                 a1H2)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1H4
                 a1H5))))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      wanted-2
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1H5
;                 a1H4)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1H2
;                 a1H1)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1H1
;                 a1H2)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1H4
;                 a1H5)))))
;   (define-fun
;      a1H5
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         8365))
;   (define-fun
;      a1H1
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           11797)
;         "!0!"
;         30199))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      a1H4
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         32285))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1H2
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           8855)
;         "!0!"
;         10450))
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
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1HO} {1}:: ((u0 *: v0) *: w0)
;                          ~ ((u *: v) *: w) (CNonCanonical)
; [WD] hole{co_a1HX} {1}:: (u *: (v *: w))
;                          ~ (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1Hz,a1HA],a1HB],*: [*: [a1Hv,a1Hw],a1Hx])
; (*: [a1Hv,*: [a1Hw,a1Hx]],*: [a1Hz,*: [a1HA,a1HB]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1HO} {1}:: ((u0 *: v0) *: w0)
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hz
;        a1HA)
;      a1HB)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hv
;        a1Hw)
;      a1Hx))

;      [WD] hole{co_a1HX} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hv
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hw
;        a1Hx))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hz
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1HA
;        a1HB)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1HO} {1}:: ((u0 *: v0) *: w0)
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hz
;        a1HA)
;      a1HB)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hv
;        a1Hw)
;      a1Hx))

;      [WD] hole{co_a1HX} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hv
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Hw
;        a1Hx))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Hz
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1HA
;        a1HB)))

; WANTEDS (names)
;  a1Hv  <=  u
;  a1Hw  <=  v
;  a1Hx  <=  w
;  a1Hz  <=  u_a1Hz
;  a1HA  <=  v_a1HA
;  a1HB  <=  w_a1HB
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1HA (Array String Int))
; (declare-const a1HB (Array String Int))
; (declare-const a1Hv (Array String Int))
; (declare-const a1Hw (Array String Int))
; (declare-const a1Hx (Array String Int))
; (declare-const a1Hz (Array String Int))
(declare-const
   a1Hv
   (Array String Int))
(declare-const
   a1Hw
   (Array String Int))
(declare-const
   a1Hx
   (Array String Int))
(declare-const
   a1Hz
   (Array String Int))
(declare-const
   a1HA
   (Array String Int))
(declare-const
   a1HB
   (Array String Int))
(assert
   (!
      (or
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
                   a1Hz
                   a1HA)
                 a1HB)
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
                   a1Hv
                   a1Hw)
                 a1Hx)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Hv
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1Hw
                   a1Hx))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Hz
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1HA
                   a1HB)))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a1HB
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         20537))
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Hz
;                 a1HA
;                 a1HB)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Hv
;                 a1Hw
;                 a1Hx)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Hv
;                 a1Hw
;                 a1Hx)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Hz
;                 a1HA
;                 a1HB)))))
;   (define-fun
;      a1Hw
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         2997))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      a1Hx
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         26285))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      a1HA
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         15921))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1Hv
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         16122))
;   (define-fun
;      a1Hz
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         8945))
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
; [WD] hole{co_a1IL} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1HZ],Base [a1HZ]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a1IL} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1HZ one)
;      (store base a1HZ one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a1IL} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1HZ one)
;      (store base a1HZ one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1HZ  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1HZ String)
(declare-const a1HZ String)
(assert
   (!
      (not
         (=
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              (store base a1HZ one)
              (store base a1HZ one))
            (
              (as
                 const
                 (Array String Int))
              0)))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
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
;                 (-
;                    (Int Int)
;                    Int))
;              (store base a1HZ one)
;              (store base a1HZ one))
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1IU} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1I9,/: [One [],a1I9]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1IU} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1I9
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1I9))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1IU} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1I9
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (
;          (as
;             const
;             (Array String Int))
;          0)
;        a1I9))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1I9  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1I9 (Array String Int))
(declare-const
   a1I9
   (Array String Int))
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
              a1I9
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
                a1I9))
            (
              (as
                 const
                 (Array String Int))
              0)))
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
;              a1I9
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (
;                  (as
;                     const
;                     (Array String Int))
;                  0)
;                a1I9))
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1IZ} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Ig,One []],a1Ig)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1IZ} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ig
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Ig)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1IZ} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ig
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Ig)

; WANTEDS (names)
;  a1Ig  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Ig (Array String Int))
(declare-const
   a1Ig
   (Array String Int))
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
              a1Ig
              (
                (as
                   const
                   (Array String Int))
                0))
            a1Ig))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
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
;              a1Ig
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a1Ig))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1J6} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Im,a1In],*: [a1In,a1Im])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a1J6} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Im
;      a1In)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1In
;      a1Im))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a1J6} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Im
;      a1In)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1In
;      a1Im))

; WANTEDS (names)
;  a1Im  <=  u
;  a1In  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Im (Array String Int))
; (declare-const a1In (Array String Int))
(declare-const
   a1Im
   (Array String Int))
(declare-const
   a1In
   (Array String Int))
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
              a1Im
              a1In)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1In
              a1Im)))
      :named
      wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
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
;              a1Im
;              a1In)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1In
;              a1Im)))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Jh} {1}:: (u *: (v *: w))
;                          ~ ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Iu,*: [a1Iv,a1Iw]],*: [*: [a1Iu,a1Iv],a1Iw])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1Jh} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Iu
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Iv
;        a1Iw))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Iu
;        a1Iv)
;      a1Iw))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1Jh} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Iu
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Iv
;        a1Iw))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1Iu
;        a1Iv)
;      a1Iw))

; WANTEDS (names)
;  a1Iu  <=  u
;  a1Iv  <=  v
;  a1Iw  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Iu (Array String Int))
; (declare-const a1Iv (Array String Int))
; (declare-const a1Iw (Array String Int))
(declare-const
   a1Iu
   (Array String Int))
(declare-const
   a1Iv
   (Array String Int))
(declare-const
   a1Iw
   (Array String Int))
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
              a1Iu
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a1Iv
                a1Iw))
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
                a1Iu
                a1Iv)
              a1Iw)))
      :named
      wanted-8))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-8")
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
;              a1Iu
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1Iv
;                a1Iw))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1Iu
;                a1Iv)
;              a1Iw)))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
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
; [WD] hole{co_ab4s} {2}:: One
;                          ~ (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_ab4s} {2}:: One
;                               ~ (Base "cd" /: Base "cd") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "cd" one)
;      (store base "cd" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_ab4s} {2}:: One
;                               ~ (Base "cd" /: Base "cd") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "cd" one)
;      (store base "cd" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "cd" one)
              (store base "cd" one))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "cd" one)
;              (store base "cd" one))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_ab4X} {2}:: One
;                          ~ (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_ab4X} {2}:: One
;                               ~ (Base "mol" /: Base "mol") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "mol" one)
;      (store base "mol" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_ab4X} {2}:: One
;                               ~ (Base "mol" /: Base "mol") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "mol" one)
;      (store base "mol" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "mol" one)
              (store base "mol" one))))
      :named
      wanted-2))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-2")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "mol" one)
;              (store base "mol" one))))
;      :named
;      wanted-2))
(get-unsat-core)
; (wanted-2)
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_ab5s} {2}:: One
;                          ~ (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_ab5s} {2}:: One
;                               ~ (Base "K" /: Base "K") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "K" one)
;      (store base "K" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_ab5s} {2}:: One
;                               ~ (Base "K" /: Base "K") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "K" one)
;      (store base "K" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "K" one)
              (store base "K" one))))
      :named
      wanted-3))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-3")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "K" one)
;              (store base "K" one))))
;      :named
;      wanted-3))
(get-unsat-core)
; (wanted-3)
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_ab5X} {2}:: One
;                          ~ (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_ab5X} {2}:: One
;                               ~ (Base "A" /: Base "A") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "A" one)
;      (store base "A" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_ab5X} {2}:: One
;                               ~ (Base "A" /: Base "A") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "A" one)
;      (store base "A" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "A" one)
              (store base "A" one))))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "A" one)
;              (store base "A" one))))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_ab6s} {2}:: One
;                          ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_ab6s} {2}:: One
;                               ~ (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_ab6s} {2}:: One
;                               ~ (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "s" one)
              (store base "s" one))))
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
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "s" one)
;              (store base "s" one))))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_ab6X} {2}:: One
;                          ~ (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_ab6X} {2}:: One
;                               ~ (Base "kg" /: Base "kg") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "kg" one)
;      (store base "kg" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_ab6X} {2}:: One
;                               ~ (Base "kg" /: Base "kg") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "kg" one)
;      (store base "kg" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "kg" one)
              (store base "kg" one))))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "kg" one)
;              (store base "kg" one))))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_ab7s} {2}:: One
;                          ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_ab7s} {2}:: One
;                               ~ (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_ab7s} {2}:: One
;                               ~ (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "m" one)
              (store base "m" one))))
      :named
      wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "m" one)
;              (store base "m" one))))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(exit)
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
; [WD] irred_acZA {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_acZA {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] irred_acZA {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))
;  =>  (=
;    acZq
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      acZq))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] irred_acZA {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))
;  =>  (=
;    acZq
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      acZq))

; WANTEDS (names)
;  acZq  <=  fsk_acZq
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const acZq (Array String Int))
(declare-const
   acZq
   (Array String Int))
(assert
   (!
      (not
         (=
            acZq
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              acZq)))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            acZq
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              acZq)))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
; [G] co_aehS {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aehW {0}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aehU {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_aehX {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aei5} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aehR)
; (*: [aehI,aehR],aehV)
; (*: [aehR,aehH],aehT)
; (aehT,aehV)

; WANTEDS (Thoralf style)
; (*: [aehL,aehR],aehV)

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aei5} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aehL
;      aehR)
;    aehV)

; GIVENS (names)
;  aehH  <=  a
;  aehI  <=  b
;  aehR  <=  fsk_aehR
;  aehT  <=  fsk_aehT
;  aehV  <=  fsk_aehV
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aehH (Array String Int))
; (declare-const aehI (Array String Int))
; (declare-const aehR (Array String Int))
; (declare-const aehT (Array String Int))
; (declare-const aehV (Array String Int))
(declare-const
   aehH
   (Array String Int))
(declare-const
   aehI
   (Array String Int))
(declare-const
   aehR
   (Array String Int))
(declare-const
   aehT
   (Array String Int))
(declare-const
   aehV
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aehR)
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
           aehI
           aehR)
         aehV)
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
           aehR
           aehH)
         aehT)
      :named
      given-1.3))
(assert
   (!
      (= aehT aehV)
      :named
      given-1.4))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_aei5} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aehL
;      aehR)
;    aehV)

; WANTEDS (names)
;  aehL  <=  b_aehL
;  aehR  <=  fsk_aehR
;  aehV  <=  fsk_aehV
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aehL (Array String Int))
(declare-const
   aehL
   (Array String Int))
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
              aehL
              aehR)
            aehV))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      aehL
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           38)
;         "!0!"
;         1))
;   (define-fun
;      given-1.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         aehR))
;   (define-fun
;      aehT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-1.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aehR
;           aehH)
;         aehT))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      aehI
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aehI
;           aehR)
;         aehV))
;   (define-fun
;      aehV
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.4
;      ()
;      Bool
;      (= aehT aehV))
;   (define-fun
;      wanted-1
;      ()
;      Bool
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aehL
;              aehR)
;            aehV)))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aehH
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aehR
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

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afqi {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afqi {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] irred_afqi {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] irred_afqi {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-2))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-2")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-2))
(get-unsat-core)
; (wanted-2)
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afqG {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afqG {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] irred_afqG {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] irred_afqG {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-3))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-3")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-3))
(get-unsat-core)
; (wanted-3)
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afr4 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afr4 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] irred_afr4 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] irred_afr4 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afrt {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afrt {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] irred_afrt {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] irred_afrt {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
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
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afrQ {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afrQ {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] irred_afrQ {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] irred_afrQ {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afsd {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afsd {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] irred_afsd {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] irred_afsd {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-7))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-7")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afsB {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afsB {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] irred_afsB {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] irred_afsB {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-8))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-8")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afsY {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afsY {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_afsY {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] irred_afsY {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
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
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-9))
(get-unsat-core)
; (wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_aftl {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aftl {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_aftl {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] irred_aftl {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-10))
(get-unsat-core)
; (wanted-10)
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_aftJ {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aftJ {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_aftJ {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] irred_aftJ {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-11))
(get-unsat-core)
; (wanted-11)
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afu6 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afu6 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] irred_afu6 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] irred_afu6 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
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
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-12))
(get-unsat-core)
; (wanted-12)
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_afut {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_afut {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] irred_afut {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] irred_afut {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(sol))
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (store base "m" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              (
                (as
                   const
                   (Array String Int))
                0)
              (store base "m" one))))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (store base "m" one)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              (store base "m" one))))
;      :named
;      wanted-13))
(get-unsat-core)
; (wanted-13)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] co_afuH {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_afuJ {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_afuF {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_afuM {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_afuR} {1}:: Base "s" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aesI,aesI],afuG)
; (*: [aesI,afuG],afuI)
; (*: [aesH,aesH],afuE)
; (afuE,afuI)

; WANTEDS (Thoralf style)
; (Base ["s"],aesH)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_afuR} {1}:: Base "s" ~ a (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    aesH)

; GIVENS (names)
;  aesH  <=  a
;  aesI  <=  b
;  afuE  <=  fsk_afuE
;  afuG  <=  fsk_afuG
;  afuI  <=  fsk_afuI
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aesH (Array String Int))
; (declare-const aesI (Array String Int))
; (declare-const afuE (Array String Int))
; (declare-const afuG (Array String Int))
; (declare-const afuI (Array String Int))
(declare-const
   aesH
   (Array String Int))
(declare-const
   aesI
   (Array String Int))
(declare-const
   afuE
   (Array String Int))
(declare-const
   afuG
   (Array String Int))
(declare-const
   afuI
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
           aesI
           aesI)
         afuG)
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
           aesI
           afuG)
         afuI)
      :named
      given-14.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aesH
           aesH)
         afuE)
      :named
      given-14.3))
(assert
   (!
      (= afuE afuI)
      :named
      given-14.4))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_afuR} {1}:: Base "s" ~ a (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    aesH)

; WANTEDS (names)
;  aesH  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            aesH))
      :named
      wanted-14))
(check-sat)
; sat
(echo "wanteds-finish-cycle-14")
(get-model)
; (
;   (define-fun
;      given-14.4
;      ()
;      Bool
;      (= afuE afuI))
;   (define-fun
;      wanted-14
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            aesH)))
;   (define-fun
;      given-14.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aesI
;           aesI)
;         afuG))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-14.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aesI
;           afuG)
;         afuI))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      afuG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afuE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-14.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aesH
;           aesH)
;         afuE))
;   (define-fun
;      aesH
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aesI
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
;      afuI
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
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] co_afuZ {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_afv3 {0}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_afv1 {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_afv4 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_afvb} {2}:: Base "kg" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],afuY)
; (*: [aeta,afuY],afv2)
; (*: [afuY,aet9],afv0)
; (afv0,afv2)

; WANTEDS (Thoralf style)
; (Base ["kg"],aet9)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_afvb} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aet9)

; GIVENS (names)
;  aet9  <=  a
;  aeta  <=  b
;  afuY  <=  fsk_afuY
;  afv0  <=  fsk_afv0
;  afv2  <=  fsk_afv2
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aet9 (Array String Int))
; (declare-const aeta (Array String Int))
; (declare-const afuY (Array String Int))
; (declare-const afv0 (Array String Int))
; (declare-const afv2 (Array String Int))
(declare-const
   aet9
   (Array String Int))
(declare-const
   aeta
   (Array String Int))
(declare-const
   afuY
   (Array String Int))
(declare-const
   afv0
   (Array String Int))
(declare-const
   afv2
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         afuY)
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
           aeta
           afuY)
         afv2)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           afuY
           aet9)
         afv0)
      :named
      given-15.3))
(assert
   (!
      (= afv0 afv2)
      :named
      given-15.4))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_afvb} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aet9)

; WANTEDS (names)
;  aet9  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            aet9))
      :named
      wanted-15))
(check-sat)
; sat
(echo "wanteds-finish-cycle-15")
(get-model)
; (
;   (define-fun
;      wanted-15
;      ()
;      Bool
;      (not
;         (=
;            (store base "kg" one)
;            aet9)))
;   (define-fun
;      given-15.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afuY
;           aet9)
;         afv0))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      afuY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-15.4
;      ()
;      Bool
;      (= afv0 afv2))
;   (define-fun
;      afv0
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aet9
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeta
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-15.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeta
;           afuY)
;         afv2))
;   (define-fun
;      given-15.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         afuY))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      afv2
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
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] co_afvf {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_afvj {0}:: (a *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_afvh {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_afvk {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_afvr} {2}:: Base "kg" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],afve)
; (*: [aeth,afve],afvi)
; (*: [afve,aeth],afvg)
; (afvg,afvi)

; WANTEDS (Thoralf style)
; (Base ["kg"],aeth)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_afvr} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aeth)

; GIVENS (names)
;  aeth  <=  a
;  afve  <=  fsk_afve
;  afvg  <=  fsk_afvg
;  afvi  <=  fsk_afvi
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeth (Array String Int))
; (declare-const afve (Array String Int))
; (declare-const afvg (Array String Int))
; (declare-const afvi (Array String Int))
(declare-const
   aeth
   (Array String Int))
(declare-const
   afve
   (Array String Int))
(declare-const
   afvg
   (Array String Int))
(declare-const
   afvi
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         afve)
      :named
      given-16.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeth
           afve)
         afvi)
      :named
      given-16.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           afve
           aeth)
         afvg)
      :named
      given-16.3))
(assert
   (!
      (= afvg afvi)
      :named
      given-16.4))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_afvr} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aeth)

; WANTEDS (names)
;  aeth  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            aeth))
      :named
      wanted-16))
(check-sat)
; sat
(echo "wanteds-finish-cycle-16")
(get-model)
; (
;   (define-fun
;      afve
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afvi
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         21238))
;   (define-fun
;      wanted-16
;      ()
;      Bool
;      (not
;         (=
;            (store base "kg" one)
;            aeth)))
;   (define-fun
;      afvg
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         21238))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "k"
;         3))
;   (define-fun
;      given-16.4
;      ()
;      Bool
;      (= afvg afvi))
;   (define-fun
;      given-16.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           afve
;           aeth)
;         afvg))
;   (define-fun
;      given-16.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeth
;           afve)
;         afvi))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "k"
;         3))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      given-16.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         afve))
;   (define-fun
;      aeth
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         21238))
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
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_afvv} {2}:: Base "s" ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["s"],Base ["m"])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_afvv} {2}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_afvv} {2}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            (store base "m" one)))
      :named
      wanted-17))
(check-sat)
; sat
(echo "wanteds-finish-cycle-17")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
;   (define-fun
;      wanted-17
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            (store base "m" one))))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
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
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_afvE} {3}:: Base "s" ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["s"],Base ["m"])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{co_afvE} {3}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
;      [WD] hole{co_afvE} {3}:: Base "s" ~ Base "m" (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    (store base "m" one))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            (store base "m" one)))
      :named
      wanted-18))
(check-sat)
; sat
(echo "wanteds-finish-cycle-18")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
;   (define-fun
;      wanted-18
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            (store base "m" one))))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         "m"
;         3))
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
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_afvV} {1}:: (Base "m" /: Base "s")
;                          ~ (Base "s" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base ["m"],Base ["s"]],/: [Base ["s"],Base ["m"]])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_afvV} {1}:: (Base "m" /: Base "s")
;                               ~ (Base "s" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_afvV} {1}:: (Base "m" /: Base "s")
;                               ~ (Base "s" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "m" one)))

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
                 (-
                    (Int Int)
                    Int))
              (store base "m" one)
              (store base "s" one))
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              (store base "s" one)
              (store base "m" one))))
      :named
      wanted-19))
(check-sat)
; sat
(echo "wanteds-finish-cycle-19")
(get-model)
; (
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            "m"
;            11797)
;         "s"
;         8857))
;   (define-fun
;      wanted-19
;      ()
;      Bool
;      (not
;         (=
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "m" one)
;              (store base "s" one))
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "s" one)
;              (store base "m" one)))))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            "m"
;            11797)
;         "s"
;         8857))
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
(echo "solver-finish-cycle-19")
(exit)
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
; [G] co_agHq {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_agGk {34}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGm {33}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGo {32}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGq {31}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGs {30}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGu {29}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGw {28}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGy {27}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGA {26}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGC {25}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGE {24}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGG {23}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGI {22}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGK {21}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGM {20}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGO {19}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGQ {18}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGS {17}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGU {16}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGW {15}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGY {14}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agH0 {13}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agH2 {12}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agH4 {11}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agH6 {10}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agH8 {9}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHa {8}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHc {7}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHe {6}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHg {5}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHi {4}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHk {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHm {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agHo {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGc {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_agGe {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agGa {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_agHt {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_agHw {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agHD} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agHp)
; (*: [agFY,agGd],agGj)
; (*: [agFY,agGj],agGl)
; (*: [agFY,agGl],agGn)
; (*: [agFY,agGn],agGp)
; (*: [agFY,agGp],agGr)
; (*: [agFY,agGr],agGt)
; (*: [agFY,agGt],agGv)
; (*: [agFY,agGv],agGx)
; (*: [agFY,agGx],agGz)
; (*: [agFY,agGz],agGB)
; (*: [agFY,agGB],agGD)
; (*: [agFY,agGD],agGF)
; (*: [agFY,agGF],agGH)
; (*: [agFY,agGH],agGJ)
; (*: [agFY,agGJ],agGL)
; (*: [agFY,agGL],agGN)
; (*: [agFY,agGN],agGP)
; (*: [agFY,agGP],agGR)
; (*: [agFY,agGR],agGT)
; (*: [agFY,agGT],agGV)
; (*: [agFY,agGV],agGX)
; (*: [agFY,agGX],agGZ)
; (*: [agFY,agGZ],agH1)
; (*: [agFY,agH1],agH3)
; (*: [agFY,agH3],agH5)
; (*: [agFY,agH5],agH7)
; (*: [agFY,agH7],agH9)
; (*: [agFY,agH9],agHb)
; (*: [agFY,agHb],agHd)
; (*: [agFY,agHd],agHf)
; (*: [agFY,agHf],agHh)
; (*: [agFY,agHh],agHj)
; (*: [agFY,agHj],agHl)
; (*: [agFY,agHl],agHn)
; (*: [agFY,agFY],agGb)
; (*: [agFY,agGb],agGd)
; (*: [agFX,agFX],agG9)
; (agHn,agHp)
; (agG9,agGd)

; WANTEDS (Thoralf style)
; (*: [agG1,agG1],agGd)

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_agHD} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agG1
;      agG1)
;    agGd)

; GIVENS (names)
;  agFX  <=  a
;  agFY  <=  b
;  agG9  <=  fsk_agG9
;  agGb  <=  fsk_agGb
;  agGd  <=  fsk_agGd
;  agGj  <=  fsk_agGj
;  agGl  <=  fsk_agGl
;  agGn  <=  fsk_agGn
;  agGp  <=  fsk_agGp
;  agGr  <=  fsk_agGr
;  agGt  <=  fsk_agGt
;  agGv  <=  fsk_agGv
;  agGx  <=  fsk_agGx
;  agGz  <=  fsk_agGz
;  agGB  <=  fsk_agGB
;  agGD  <=  fsk_agGD
;  agGF  <=  fsk_agGF
;  agGH  <=  fsk_agGH
;  agGJ  <=  fsk_agGJ
;  agGL  <=  fsk_agGL
;  agGN  <=  fsk_agGN
;  agGP  <=  fsk_agGP
;  agGR  <=  fsk_agGR
;  agGT  <=  fsk_agGT
;  agGV  <=  fsk_agGV
;  agGX  <=  fsk_agGX
;  agGZ  <=  fsk_agGZ
;  agH1  <=  fsk_agH1
;  agH3  <=  fsk_agH3
;  agH5  <=  fsk_agH5
;  agH7  <=  fsk_agH7
;  agH9  <=  fsk_agH9
;  agHb  <=  fsk_agHb
;  agHd  <=  fsk_agHd
;  agHf  <=  fsk_agHf
;  agHh  <=  fsk_agHh
;  agHj  <=  fsk_agHj
;  agHl  <=  fsk_agHl
;  agHn  <=  fsk_agHn
;  agHp  <=  fsk_agHp
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const agFX (Array String Int))
; (declare-const agFY (Array String Int))
; (declare-const agG9 (Array String Int))
; (declare-const agGB (Array String Int))
; (declare-const agGD (Array String Int))
; (declare-const agGF (Array String Int))
; (declare-const agGH (Array String Int))
; (declare-const agGJ (Array String Int))
; (declare-const agGL (Array String Int))
; (declare-const agGN (Array String Int))
; (declare-const agGP (Array String Int))
; (declare-const agGR (Array String Int))
; (declare-const agGT (Array String Int))
; (declare-const agGV (Array String Int))
; (declare-const agGX (Array String Int))
; (declare-const agGZ (Array String Int))
; (declare-const agGb (Array String Int))
; (declare-const agGd (Array String Int))
; (declare-const agGj (Array String Int))
; (declare-const agGl (Array String Int))
; (declare-const agGn (Array String Int))
; (declare-const agGp (Array String Int))
; (declare-const agGr (Array String Int))
; (declare-const agGt (Array String Int))
; (declare-const agGv (Array String Int))
; (declare-const agGx (Array String Int))
; (declare-const agGz (Array String Int))
; (declare-const agH1 (Array String Int))
; (declare-const agH3 (Array String Int))
; (declare-const agH5 (Array String Int))
; (declare-const agH7 (Array String Int))
; (declare-const agH9 (Array String Int))
; (declare-const agHb (Array String Int))
; (declare-const agHd (Array String Int))
; (declare-const agHf (Array String Int))
; (declare-const agHh (Array String Int))
; (declare-const agHj (Array String Int))
; (declare-const agHl (Array String Int))
; (declare-const agHn (Array String Int))
; (declare-const agHp (Array String Int))
(declare-const
   agFX
   (Array String Int))
(declare-const
   agFY
   (Array String Int))
(declare-const
   agG9
   (Array String Int))
(declare-const
   agGb
   (Array String Int))
(declare-const
   agGd
   (Array String Int))
(declare-const
   agGj
   (Array String Int))
(declare-const
   agGl
   (Array String Int))
(declare-const
   agGn
   (Array String Int))
(declare-const
   agGp
   (Array String Int))
(declare-const
   agGr
   (Array String Int))
(declare-const
   agGt
   (Array String Int))
(declare-const
   agGv
   (Array String Int))
(declare-const
   agGx
   (Array String Int))
(declare-const
   agGz
   (Array String Int))
(declare-const
   agGB
   (Array String Int))
(declare-const
   agGD
   (Array String Int))
(declare-const
   agGF
   (Array String Int))
(declare-const
   agGH
   (Array String Int))
(declare-const
   agGJ
   (Array String Int))
(declare-const
   agGL
   (Array String Int))
(declare-const
   agGN
   (Array String Int))
(declare-const
   agGP
   (Array String Int))
(declare-const
   agGR
   (Array String Int))
(declare-const
   agGT
   (Array String Int))
(declare-const
   agGV
   (Array String Int))
(declare-const
   agGX
   (Array String Int))
(declare-const
   agGZ
   (Array String Int))
(declare-const
   agH1
   (Array String Int))
(declare-const
   agH3
   (Array String Int))
(declare-const
   agH5
   (Array String Int))
(declare-const
   agH7
   (Array String Int))
(declare-const
   agH9
   (Array String Int))
(declare-const
   agHb
   (Array String Int))
(declare-const
   agHd
   (Array String Int))
(declare-const
   agHf
   (Array String Int))
(declare-const
   agHh
   (Array String Int))
(declare-const
   agHj
   (Array String Int))
(declare-const
   agHl
   (Array String Int))
(declare-const
   agHn
   (Array String Int))
(declare-const
   agHp
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agHp)
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
           agFY
           agGd)
         agGj)
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
           agFY
           agGj)
         agGl)
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
           agFY
           agGl)
         agGn)
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
           agFY
           agGn)
         agGp)
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
           agFY
           agGp)
         agGr)
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
           agFY
           agGr)
         agGt)
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
           agFY
           agGt)
         agGv)
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
           agFY
           agGv)
         agGx)
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
           agFY
           agGx)
         agGz)
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
           agFY
           agGz)
         agGB)
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
           agFY
           agGB)
         agGD)
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
           agFY
           agGD)
         agGF)
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
           agFY
           agGF)
         agGH)
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
           agFY
           agGH)
         agGJ)
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
           agFY
           agGJ)
         agGL)
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
           agFY
           agGL)
         agGN)
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
           agFY
           agGN)
         agGP)
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
           agFY
           agGP)
         agGR)
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
           agFY
           agGR)
         agGT)
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
           agFY
           agGT)
         agGV)
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
           agFY
           agGV)
         agGX)
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
           agFY
           agGX)
         agGZ)
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
           agFY
           agGZ)
         agH1)
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
           agFY
           agH1)
         agH3)
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
           agFY
           agH3)
         agH5)
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
           agFY
           agH5)
         agH7)
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
           agFY
           agH7)
         agH9)
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
           agFY
           agH9)
         agHb)
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
           agFY
           agHb)
         agHd)
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
           agFY
           agHd)
         agHf)
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
           agFY
           agHf)
         agHh)
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
           agFY
           agHh)
         agHj)
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
           agFY
           agHj)
         agHl)
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
           agFY
           agHl)
         agHn)
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
           agFY
           agFY)
         agGb)
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
           agFY
           agGb)
         agGd)
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
           agFX
           agFX)
         agG9)
      :named
      given-1.38))
(assert
   (!
      (= agHn agHp)
      :named
      given-1.39))
(assert
   (!
      (= agG9 agGd)
      :named
      given-1.40))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_agHD} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agG1
;      agG1)
;    agGd)

; WANTEDS (names)
;  agG1  <=  a_agG1
;  agGd  <=  fsk_agGd
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const agG1 (Array String Int))
(declare-const
   agG1
   (Array String Int))
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
              agG1
              agG1)
            agGd))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      agGV
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agHl
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGB
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.34
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agHj)
;         agHl))
;   (define-fun
;      agGn
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.28
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agH7)
;         agH9))
;   (define-fun
;      given-1.19
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGP)
;         agGR))
;   (define-fun
;      given-1.18
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGN)
;         agGP))
;   (define-fun
;      given-1.23
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGX)
;         agGZ))
;   (define-fun
;      given-1.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGj)
;         agGl))
;   (define-fun
;      agFY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agH7
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agHf
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGR
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.21
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGT)
;         agGV))
;   (define-fun
;      given-1.6
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGp)
;         agGr))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      agGr
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agH5
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agH9
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGL
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.25
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agH1)
;         agH3))
;   (define-fun
;      agGb
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.37
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGb)
;         agGd))
;   (define-fun
;      given-1.36
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agFY)
;         agGb))
;   (define-fun
;      given-1.4
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGl)
;         agGn))
;   (define-fun
;      given-1.32
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agHf)
;         agHh))
;   (define-fun
;      wanted-1
;      ()
;      Bool
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              agG1
;              agG1)
;            agGd)))
;   (define-fun
;      given-1.29
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agH9)
;         agHb))
;   (define-fun
;      agH3
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agFX
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGl
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agG1
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           38)
;         "!0!"
;         (- 1)))
;   (define-fun
;      agHb
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agHn
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.27
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agH5)
;         agH7))
;   (define-fun
;      given-1.12
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGB)
;         agGD))
;   (define-fun
;      agGH
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.11
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGz)
;         agGB))
;   (define-fun
;      given-1.10
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGx)
;         agGz))
;   (define-fun
;      given-1.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGd)
;         agGj))
;   (define-fun
;      given-1.17
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGL)
;         agGN))
;   (define-fun
;      given-1.5
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGn)
;         agGp))
;   (define-fun
;      given-1.7
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGr)
;         agGt))
;   (define-fun
;      agGj
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.16
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGJ)
;         agGL))
;   (define-fun
;      given-1.15
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGH)
;         agGJ))
;   (define-fun
;      given-1.9
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGv)
;         agGx))
;   (define-fun
;      agH1
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.40
;      ()
;      Bool
;      (= agG9 agGd))
;   (define-fun
;      agHj
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGJ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.13
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGD)
;         agGF))
;   (define-fun
;      agHd
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.33
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agHh)
;         agHj))
;   (define-fun
;      given-1.35
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agHl)
;         agHn))
;   (define-fun
;      agGD
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.24
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGZ)
;         agH1))
;   (define-fun
;      agGz
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agHh
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.14
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGF)
;         agGH))
;   (define-fun
;      agGF
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGx
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-1.8
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGt)
;         agGv))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
;   (define-fun
;      given-1.39
;      ()
;      Bool
;      (= agHn agHp))
;   (define-fun
;      agGZ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.20
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGR)
;         agGT))
;   (define-fun
;      agGv
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGX
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.38
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFX
;           agFX)
;         agG9))
;   (define-fun
;      given-1.31
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agHd)
;         agHf))
;   (define-fun
;      agG9
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         agHp))
;   (define-fun
;      agGN
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agGt
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agHp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.30
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agHb)
;         agHd))
;   (define-fun
;      given-1.26
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agH3)
;         agH5))
;   (define-fun
;      agGd
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-1.22
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agFY
;           agGV)
;         agGX))
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

; GIVENS (GHC style)
; [G] co_agIi {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_agIc {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agIe {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agIg {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agI4 {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_agI6 {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agI2 {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_agIl {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_agIo {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agIy} {3}:: (b0 *: (b0 *: b0)) ~ fsk0 (CNonCanonical)
; [WD] hole{co_agIH} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                          ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agIh)
; (*: [agHQ,agI5],agIb)
; (*: [agHQ,agIb],agId)
; (*: [agHQ,agId],agIf)
; (*: [agHQ,agHQ],agI3)
; (*: [agHQ,agI3],agI5)
; (*: [agHP,agHP],agI1)
; (agIf,agIh)
; (agI1,agI5)

; WANTEDS (Thoralf style)
; (*: [agHU,*: [agHU,agHU]],agI5)
; (*: [agHU,*: [agHU,*: [agHU,*: [agHU,*: [agHU,agHU]]]]],agIh)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_agIy} {3}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agHU
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        agHU
;        agHU))
;    agI5)

;      [WD] hole{co_agIH} {2}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agHU
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        agHU
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          agHU
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            agHU
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              agHU
;              agHU)))))
;    agIh)

; GIVENS (names)
;  agHP  <=  a
;  agHQ  <=  b
;  agI1  <=  fsk_agI1
;  agI3  <=  fsk_agI3
;  agI5  <=  fsk_agI5
;  agIb  <=  fsk_agIb
;  agId  <=  fsk_agId
;  agIf  <=  fsk_agIf
;  agIh  <=  fsk_agIh
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const agHP (Array String Int))
; (declare-const agHQ (Array String Int))
; (declare-const agI1 (Array String Int))
; (declare-const agI3 (Array String Int))
; (declare-const agI5 (Array String Int))
; (declare-const agIb (Array String Int))
; (declare-const agId (Array String Int))
; (declare-const agIf (Array String Int))
; (declare-const agIh (Array String Int))
(declare-const
   agHP
   (Array String Int))
(declare-const
   agHQ
   (Array String Int))
(declare-const
   agI1
   (Array String Int))
(declare-const
   agI3
   (Array String Int))
(declare-const
   agI5
   (Array String Int))
(declare-const
   agIb
   (Array String Int))
(declare-const
   agId
   (Array String Int))
(declare-const
   agIf
   (Array String Int))
(declare-const
   agIh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agIh)
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
           agHQ
           agI5)
         agIb)
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
           agHQ
           agIb)
         agId)
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
           agHQ
           agId)
         agIf)
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
           agHQ
           agHQ)
         agI3)
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
           agHQ
           agI3)
         agI5)
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
           agHP
           agHP)
         agI1)
      :named
      given-2.7))
(assert
   (!
      (= agIf agIh)
      :named
      given-2.8))
(assert
   (!
      (= agI1 agI5)
      :named
      given-2.9))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_agIy} {3}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agHU
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        agHU
;        agHU))
;    agI5)

;      [WD] hole{co_agIH} {2}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agHU
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        agHU
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          agHU
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            agHU
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              agHU
;              agHU)))))
;    agIh)

; WANTEDS (names)
;  agHU  <=  b_agHU
;  agI5  <=  fsk_agI5
;  agIh  <=  fsk_agIh
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const agHU (Array String Int))
(declare-const
   agHU
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 agHU
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   agHU
                   agHU))
               agI5))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 agHU
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   agHU
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     agHU
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       agHU
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         agHU
                         agHU)))))
               agIh)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      agHU
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         1))
;   (define-fun
;      given-2.9
;      ()
;      Bool
;      (= agI1 agI5))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agHQ
;           agIb)
;         agId))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        7))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         agIh))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        7))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agHP
;           agHP)
;         agI1))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agHQ
;           agId)
;         agIf))
;   (define-fun
;      wanted-2
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_
;                         map
;                         (+
;                            (Int Int)
;                            Int))
;                      agHU
;                      agHU
;                      agHU
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        agHU
;                        agHU
;                        agHU))
;                    agIh))))
;         (or
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    agHU
;                    agHU
;                    agHU)
;                  agI5))
;            a!1)))
;   (define-fun
;      agI5
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agIf
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agHQ
;           agHQ)
;         agI3))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agHQ
;           agI3)
;         agI5))
;   (define-fun
;      agI1
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agHQ
;           agI5)
;         agIb))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= agIf agIh))
;   (define-fun
;      agHQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agI3
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agIh
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agHP
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
;      agIb
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agId
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
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] co_agJH {1}:: (v *: v) ~ fsk0 (CNonCanonical)
; [G] co_agJA {0}:: (v *: w) ~ fsk0 (CNonCanonical)
; [G] co_agJB {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_agJK {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agJS} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{co_agJX} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [agJk,agJk],agJG)
; (*: [agJk,agJl],agJz)
; (agJz,agJj)
; (agJG,agJk)

; WANTEDS (Thoralf style)
; (*: [agJq,agJl],agJj)
; (*: [agJq,agJq],agJq)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_agJS} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agJq
;      agJl)
;    agJj)

;      [WD] hole{co_agJX} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agJq
;      agJq)
;    agJq)

; GIVENS (names)
;  agJj  <=  u
;  agJk  <=  v
;  agJl  <=  w
;  agJz  <=  fsk_agJz
;  agJG  <=  fsk_agJG
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const agJG (Array String Int))
; (declare-const agJj (Array String Int))
; (declare-const agJk (Array String Int))
; (declare-const agJl (Array String Int))
; (declare-const agJz (Array String Int))
(declare-const
   agJj
   (Array String Int))
(declare-const
   agJk
   (Array String Int))
(declare-const
   agJl
   (Array String Int))
(declare-const
   agJz
   (Array String Int))
(declare-const
   agJG
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
           agJk
           agJk)
         agJG)
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
           agJk
           agJl)
         agJz)
      :named
      given-3.2))
(assert
   (!
      (= agJz agJj)
      :named
      given-3.3))
(assert
   (!
      (= agJG agJk)
      :named
      given-3.4))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_agJS} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agJq
;      agJl)
;    agJj)

;      [WD] hole{co_agJX} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agJq
;      agJq)
;    agJq)

; WANTEDS (names)
;  agJj  <=  u
;  agJl  <=  w
;  agJq  <=  v_agJq
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const agJq (Array String Int))
(declare-const
   agJq
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 agJq
                 agJl)
               agJj))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 agJq
                 agJq)
               agJq)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agJk
;           agJk)
;         agJG))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agJk
;           agJl)
;         agJz))
;   (define-fun
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        3))
;   (define-fun
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        3))
;   (define-fun
;      agJl
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         20652))
;   (define-fun
;      agJj
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         20652))
;   (define-fun
;      agJq
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         1))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (= agJz agJj))
;   (define-fun
;      agJG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agJz
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         20652))
;   (define-fun
;      agJk
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
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 agJq
;                 agJl)
;               agJj))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 agJq
;                 agJq)
;               agJq))))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (= agJG agJk))
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
; [G] co_ah6m {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ah5g {34}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5i {33}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5k {32}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5m {31}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5o {30}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5q {29}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5s {28}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5u {27}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5w {26}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5y {25}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5A {24}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5C {23}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5E {22}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5G {21}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5I {20}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5K {19}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5M {18}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5O {17}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5Q {16}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5S {15}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5U {14}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5W {13}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah5Y {12}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah60 {11}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah62 {10}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah64 {9}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah66 {8}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah68 {7}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6a {6}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6c {5}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6e {4}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6g {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6i {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6k {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah58 {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_ah5a {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah56 {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_ah6p {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_ah6s {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ah6x} {2}:: fsk0 ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ah6l)
; (*: [ah1M,ah59],ah5f)
; (*: [ah1M,ah5f],ah5h)
; (*: [ah1M,ah5h],ah5j)
; (*: [ah1M,ah5j],ah5l)
; (*: [ah1M,ah5l],ah5n)
; (*: [ah1M,ah5n],ah5p)
; (*: [ah1M,ah5p],ah5r)
; (*: [ah1M,ah5r],ah5t)
; (*: [ah1M,ah5t],ah5v)
; (*: [ah1M,ah5v],ah5x)
; (*: [ah1M,ah5x],ah5z)
; (*: [ah1M,ah5z],ah5B)
; (*: [ah1M,ah5B],ah5D)
; (*: [ah1M,ah5D],ah5F)
; (*: [ah1M,ah5F],ah5H)
; (*: [ah1M,ah5H],ah5J)
; (*: [ah1M,ah5J],ah5L)
; (*: [ah1M,ah5L],ah5N)
; (*: [ah1M,ah5N],ah5P)
; (*: [ah1M,ah5P],ah5R)
; (*: [ah1M,ah5R],ah5T)
; (*: [ah1M,ah5T],ah5V)
; (*: [ah1M,ah5V],ah5X)
; (*: [ah1M,ah5X],ah5Z)
; (*: [ah1M,ah5Z],ah61)
; (*: [ah1M,ah61],ah63)
; (*: [ah1M,ah63],ah65)
; (*: [ah1M,ah65],ah67)
; (*: [ah1M,ah67],ah69)
; (*: [ah1M,ah69],ah6b)
; (*: [ah1M,ah6b],ah6d)
; (*: [ah1M,ah6d],ah6f)
; (*: [ah1M,ah6f],ah6h)
; (*: [ah1M,ah6h],ah6j)
; (*: [ah1M,ah1M],ah57)
; (*: [ah1M,ah57],ah59)
; (*: [ah1L,ah1L],ah55)
; (ah6j,ah6l)
; (ah55,ah59)

; WANTEDS (Thoralf style)
; (ah6l,ah1M)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_ah6x} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= ah6l ah1M)

; GIVENS (names)
;  ah1L  <=  a
;  ah1M  <=  b
;  ah55  <=  fsk_ah55
;  ah57  <=  fsk_ah57
;  ah59  <=  fsk_ah59
;  ah5f  <=  fsk_ah5f
;  ah5h  <=  fsk_ah5h
;  ah5j  <=  fsk_ah5j
;  ah5l  <=  fsk_ah5l
;  ah5n  <=  fsk_ah5n
;  ah5p  <=  fsk_ah5p
;  ah5r  <=  fsk_ah5r
;  ah5t  <=  fsk_ah5t
;  ah5v  <=  fsk_ah5v
;  ah5x  <=  fsk_ah5x
;  ah5z  <=  fsk_ah5z
;  ah5B  <=  fsk_ah5B
;  ah5D  <=  fsk_ah5D
;  ah5F  <=  fsk_ah5F
;  ah5H  <=  fsk_ah5H
;  ah5J  <=  fsk_ah5J
;  ah5L  <=  fsk_ah5L
;  ah5N  <=  fsk_ah5N
;  ah5P  <=  fsk_ah5P
;  ah5R  <=  fsk_ah5R
;  ah5T  <=  fsk_ah5T
;  ah5V  <=  fsk_ah5V
;  ah5X  <=  fsk_ah5X
;  ah5Z  <=  fsk_ah5Z
;  ah61  <=  fsk_ah61
;  ah63  <=  fsk_ah63
;  ah65  <=  fsk_ah65
;  ah67  <=  fsk_ah67
;  ah69  <=  fsk_ah69
;  ah6b  <=  fsk_ah6b
;  ah6d  <=  fsk_ah6d
;  ah6f  <=  fsk_ah6f
;  ah6h  <=  fsk_ah6h
;  ah6j  <=  fsk_ah6j
;  ah6l  <=  fsk_ah6l
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ah1L (Array String Int))
; (declare-const ah1M (Array String Int))
; (declare-const ah55 (Array String Int))
; (declare-const ah57 (Array String Int))
; (declare-const ah59 (Array String Int))
; (declare-const ah5B (Array String Int))
; (declare-const ah5D (Array String Int))
; (declare-const ah5F (Array String Int))
; (declare-const ah5H (Array String Int))
; (declare-const ah5J (Array String Int))
; (declare-const ah5L (Array String Int))
; (declare-const ah5N (Array String Int))
; (declare-const ah5P (Array String Int))
; (declare-const ah5R (Array String Int))
; (declare-const ah5T (Array String Int))
; (declare-const ah5V (Array String Int))
; (declare-const ah5X (Array String Int))
; (declare-const ah5Z (Array String Int))
; (declare-const ah5f (Array String Int))
; (declare-const ah5h (Array String Int))
; (declare-const ah5j (Array String Int))
; (declare-const ah5l (Array String Int))
; (declare-const ah5n (Array String Int))
; (declare-const ah5p (Array String Int))
; (declare-const ah5r (Array String Int))
; (declare-const ah5t (Array String Int))
; (declare-const ah5v (Array String Int))
; (declare-const ah5x (Array String Int))
; (declare-const ah5z (Array String Int))
; (declare-const ah61 (Array String Int))
; (declare-const ah63 (Array String Int))
; (declare-const ah65 (Array String Int))
; (declare-const ah67 (Array String Int))
; (declare-const ah69 (Array String Int))
; (declare-const ah6b (Array String Int))
; (declare-const ah6d (Array String Int))
; (declare-const ah6f (Array String Int))
; (declare-const ah6h (Array String Int))
; (declare-const ah6j (Array String Int))
; (declare-const ah6l (Array String Int))
(declare-const
   ah1L
   (Array String Int))
(declare-const
   ah1M
   (Array String Int))
(declare-const
   ah55
   (Array String Int))
(declare-const
   ah57
   (Array String Int))
(declare-const
   ah59
   (Array String Int))
(declare-const
   ah5f
   (Array String Int))
(declare-const
   ah5h
   (Array String Int))
(declare-const
   ah5j
   (Array String Int))
(declare-const
   ah5l
   (Array String Int))
(declare-const
   ah5n
   (Array String Int))
(declare-const
   ah5p
   (Array String Int))
(declare-const
   ah5r
   (Array String Int))
(declare-const
   ah5t
   (Array String Int))
(declare-const
   ah5v
   (Array String Int))
(declare-const
   ah5x
   (Array String Int))
(declare-const
   ah5z
   (Array String Int))
(declare-const
   ah5B
   (Array String Int))
(declare-const
   ah5D
   (Array String Int))
(declare-const
   ah5F
   (Array String Int))
(declare-const
   ah5H
   (Array String Int))
(declare-const
   ah5J
   (Array String Int))
(declare-const
   ah5L
   (Array String Int))
(declare-const
   ah5N
   (Array String Int))
(declare-const
   ah5P
   (Array String Int))
(declare-const
   ah5R
   (Array String Int))
(declare-const
   ah5T
   (Array String Int))
(declare-const
   ah5V
   (Array String Int))
(declare-const
   ah5X
   (Array String Int))
(declare-const
   ah5Z
   (Array String Int))
(declare-const
   ah61
   (Array String Int))
(declare-const
   ah63
   (Array String Int))
(declare-const
   ah65
   (Array String Int))
(declare-const
   ah67
   (Array String Int))
(declare-const
   ah69
   (Array String Int))
(declare-const
   ah6b
   (Array String Int))
(declare-const
   ah6d
   (Array String Int))
(declare-const
   ah6f
   (Array String Int))
(declare-const
   ah6h
   (Array String Int))
(declare-const
   ah6j
   (Array String Int))
(declare-const
   ah6l
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ah6l)
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
           ah1M
           ah59)
         ah5f)
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
           ah1M
           ah5f)
         ah5h)
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
           ah1M
           ah5h)
         ah5j)
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
           ah1M
           ah5j)
         ah5l)
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
           ah1M
           ah5l)
         ah5n)
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
           ah1M
           ah5n)
         ah5p)
      :named
      given-4.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5p)
         ah5r)
      :named
      given-4.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5r)
         ah5t)
      :named
      given-4.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5t)
         ah5v)
      :named
      given-4.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5v)
         ah5x)
      :named
      given-4.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5x)
         ah5z)
      :named
      given-4.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5z)
         ah5B)
      :named
      given-4.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5B)
         ah5D)
      :named
      given-4.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5D)
         ah5F)
      :named
      given-4.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5F)
         ah5H)
      :named
      given-4.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5H)
         ah5J)
      :named
      given-4.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5J)
         ah5L)
      :named
      given-4.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5L)
         ah5N)
      :named
      given-4.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5N)
         ah5P)
      :named
      given-4.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5P)
         ah5R)
      :named
      given-4.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5R)
         ah5T)
      :named
      given-4.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5T)
         ah5V)
      :named
      given-4.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5V)
         ah5X)
      :named
      given-4.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5X)
         ah5Z)
      :named
      given-4.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah5Z)
         ah61)
      :named
      given-4.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah61)
         ah63)
      :named
      given-4.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah63)
         ah65)
      :named
      given-4.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah65)
         ah67)
      :named
      given-4.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah67)
         ah69)
      :named
      given-4.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah69)
         ah6b)
      :named
      given-4.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah6b)
         ah6d)
      :named
      given-4.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah6d)
         ah6f)
      :named
      given-4.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah6f)
         ah6h)
      :named
      given-4.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah6h)
         ah6j)
      :named
      given-4.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah1M)
         ah57)
      :named
      given-4.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1M
           ah57)
         ah59)
      :named
      given-4.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1L
           ah1L)
         ah55)
      :named
      given-4.38))
(assert
   (!
      (= ah6j ah6l)
      :named
      given-4.39))
(assert
   (!
      (= ah55 ah59)
      :named
      given-4.40))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_ah6x} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= ah6l ah1M)

; WANTEDS (names)
;  ah1M  <=  b
;  ah6l  <=  fsk_ah6l
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ah6l ah1M))
      :named
      wanted-4))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-4")
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
;         ah6l)
;      :named
;      given-4.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah59)
;         ah5f)
;      :named
;      given-4.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5f)
;         ah5h)
;      :named
;      given-4.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5h)
;         ah5j)
;      :named
;      given-4.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5j)
;         ah5l)
;      :named
;      given-4.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5l)
;         ah5n)
;      :named
;      given-4.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5n)
;         ah5p)
;      :named
;      given-4.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5p)
;         ah5r)
;      :named
;      given-4.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5r)
;         ah5t)
;      :named
;      given-4.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5t)
;         ah5v)
;      :named
;      given-4.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5v)
;         ah5x)
;      :named
;      given-4.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5x)
;         ah5z)
;      :named
;      given-4.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5z)
;         ah5B)
;      :named
;      given-4.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5B)
;         ah5D)
;      :named
;      given-4.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5D)
;         ah5F)
;      :named
;      given-4.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5F)
;         ah5H)
;      :named
;      given-4.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5H)
;         ah5J)
;      :named
;      given-4.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5J)
;         ah5L)
;      :named
;      given-4.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5L)
;         ah5N)
;      :named
;      given-4.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5N)
;         ah5P)
;      :named
;      given-4.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5P)
;         ah5R)
;      :named
;      given-4.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5R)
;         ah5T)
;      :named
;      given-4.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5T)
;         ah5V)
;      :named
;      given-4.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5V)
;         ah5X)
;      :named
;      given-4.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5X)
;         ah5Z)
;      :named
;      given-4.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah5Z)
;         ah61)
;      :named
;      given-4.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah61)
;         ah63)
;      :named
;      given-4.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah63)
;         ah65)
;      :named
;      given-4.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah65)
;         ah67)
;      :named
;      given-4.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah67)
;         ah69)
;      :named
;      given-4.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah69)
;         ah6b)
;      :named
;      given-4.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah6b)
;         ah6d)
;      :named
;      given-4.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah6d)
;         ah6f)
;      :named
;      given-4.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah6f)
;         ah6h)
;      :named
;      given-4.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah6h)
;         ah6j)
;      :named
;      given-4.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah1M)
;         ah57)
;      :named
;      given-4.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1M
;           ah57)
;         ah59)
;      :named
;      given-4.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1L
;           ah1L)
;         ah55)
;      :named
;      given-4.38)
;   (!
;      (= ah6j ah6l)
;      :named
;      given-4.39)
;   (!
;      (= ah55 ah59)
;      :named
;      given-4.40)
;   (!
;      (not
;         (= ah6l ah1M))
;      :named
;      wanted-4))
(get-unsat-core)
; (given-4.23
;    given-4.22
;    given-4.21
;    given-4.3
;    given-4.20
;    given-4.19
;    given-4.18
;    given-4.17
;    given-4.16
;    given-4.15
;    given-4.14
;    given-4.13
;    given-4.4
;    given-4.1
;    given-4.9
;    given-4.11
;    given-4.8
;    given-4.6
;    given-4.2
;    given-4.29
;    given-4.30
;    given-4.31
;    given-4.28
;    given-4.27
;    given-4.26
;    given-4.25
;    given-4.24
;    given-4.7
;    given-4.10
;    wanted-4
;    given-4.39
;    given-4.37
;    given-4.36
;    given-4.35
;    given-4.34
;    given-4.33
;    given-4.12
;    given-4.32
;    given-4.5)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_ah6R {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ah6L {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6N {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6P {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6D {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_ah6F {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah6B {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_ah6U {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_ah6X {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ah72} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ah6Q)
; (*: [ah1U,ah6E],ah6K)
; (*: [ah1U,ah6K],ah6M)
; (*: [ah1U,ah6M],ah6O)
; (*: [ah1U,ah1U],ah6C)
; (*: [ah1U,ah6C],ah6E)
; (*: [ah1T,ah1T],ah6A)
; (ah6O,ah6Q)
; (ah6A,ah6E)

; WANTEDS (Thoralf style)
; (ah6Q,ah1T)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_ah72} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= ah6Q ah1T)

; GIVENS (names)
;  ah1T  <=  a
;  ah1U  <=  b
;  ah6A  <=  fsk_ah6A
;  ah6C  <=  fsk_ah6C
;  ah6E  <=  fsk_ah6E
;  ah6K  <=  fsk_ah6K
;  ah6M  <=  fsk_ah6M
;  ah6O  <=  fsk_ah6O
;  ah6Q  <=  fsk_ah6Q
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ah1T (Array String Int))
; (declare-const ah1U (Array String Int))
; (declare-const ah6A (Array String Int))
; (declare-const ah6C (Array String Int))
; (declare-const ah6E (Array String Int))
; (declare-const ah6K (Array String Int))
; (declare-const ah6M (Array String Int))
; (declare-const ah6O (Array String Int))
; (declare-const ah6Q (Array String Int))
(declare-const
   ah1T
   (Array String Int))
(declare-const
   ah1U
   (Array String Int))
(declare-const
   ah6A
   (Array String Int))
(declare-const
   ah6C
   (Array String Int))
(declare-const
   ah6E
   (Array String Int))
(declare-const
   ah6K
   (Array String Int))
(declare-const
   ah6M
   (Array String Int))
(declare-const
   ah6O
   (Array String Int))
(declare-const
   ah6Q
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ah6Q)
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
           ah1U
           ah6E)
         ah6K)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1U
           ah6K)
         ah6M)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1U
           ah6M)
         ah6O)
      :named
      given-5.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1U
           ah1U)
         ah6C)
      :named
      given-5.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1U
           ah6C)
         ah6E)
      :named
      given-5.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ah1T
           ah1T)
         ah6A)
      :named
      given-5.7))
(assert
   (!
      (= ah6O ah6Q)
      :named
      given-5.8))
(assert
   (!
      (= ah6A ah6E)
      :named
      given-5.9))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_ah72} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= ah6Q ah1T)

; WANTEDS (names)
;  ah1T  <=  a
;  ah6Q  <=  fsk_ah6Q
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ah6Q ah1T))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         ah6Q)
;      :named
;      given-5.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1U
;           ah6E)
;         ah6K)
;      :named
;      given-5.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1U
;           ah6K)
;         ah6M)
;      :named
;      given-5.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1U
;           ah6M)
;         ah6O)
;      :named
;      given-5.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1U
;           ah1U)
;         ah6C)
;      :named
;      given-5.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1U
;           ah6C)
;         ah6E)
;      :named
;      given-5.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah1T
;           ah1T)
;         ah6A)
;      :named
;      given-5.7)
;   (!
;      (= ah6O ah6Q)
;      :named
;      given-5.8)
;   (!
;      (= ah6A ah6E)
;      :named
;      given-5.9)
;   (!
;      (not
;         (= ah6Q ah1T))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5
;    given-5.9
;    given-5.8
;    given-5.7
;    given-5.6
;    given-5.5
;    given-5.4
;    given-5.3
;    given-5.1
;    given-5.2)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_ah78 {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ah76 {0}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_ah79 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ah7e} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ah77)
; (*: [ah21,ah21],ah75)
; (ah75,ah77)

; WANTEDS (Thoralf style)
; (ah77,ah21)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_ah7e} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= ah77 ah21)

; GIVENS (names)
;  ah21  <=  a
;  ah75  <=  fsk_ah75
;  ah77  <=  fsk_ah77
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ah21 (Array String Int))
; (declare-const ah75 (Array String Int))
; (declare-const ah77 (Array String Int))
(declare-const
   ah21
   (Array String Int))
(declare-const
   ah75
   (Array String Int))
(declare-const
   ah77
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ah77)
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
           ah21
           ah21)
         ah75)
      :named
      given-6.2))
(assert
   (!
      (= ah75 ah77)
      :named
      given-6.3))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_ah7e} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= ah77 ah21)

; WANTEDS (names)
;  ah21  <=  a
;  ah77  <=  fsk_ah77
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ah77 ah21))
      :named
      wanted-6))
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
;           (as
;              const
;              (Array String Int))
;           0)
;         ah77)
;      :named
;      given-6.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah21
;           ah21)
;         ah75)
;      :named
;      given-6.2)
;   (!
;      (= ah75 ah77)
;      :named
;      given-6.3)
;   (!
;      (not
;         (= ah77 ah21))
;      :named
;      wanted-6))
(get-unsat-core)
; (given-6.2 given-6.1 wanted-6 given-6.3)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_ah7p {1}:: (v *: v) ~ fsk0 (CNonCanonical)
; [G] co_ah7i {0}:: (v *: w) ~ fsk0 (CNonCanonical)
; [G] co_ah7j {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_ah7s {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ah2f} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [ah28,ah28],ah7o)
; (*: [ah28,ah29],ah7h)
; (ah7h,ah27)
; (ah7o,ah28)

; WANTEDS (Thoralf style)
; (ah27,ah29)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_ah2f} {0}:: u ~ w (CNonCanonical)
;  =>  (= ah27 ah29)

; GIVENS (names)
;  ah27  <=  u
;  ah28  <=  v
;  ah29  <=  w
;  ah7h  <=  fsk_ah7h
;  ah7o  <=  fsk_ah7o
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ah27 (Array String Int))
; (declare-const ah28 (Array String Int))
; (declare-const ah29 (Array String Int))
; (declare-const ah7h (Array String Int))
; (declare-const ah7o (Array String Int))
(declare-const
   ah27
   (Array String Int))
(declare-const
   ah28
   (Array String Int))
(declare-const
   ah29
   (Array String Int))
(declare-const
   ah7h
   (Array String Int))
(declare-const
   ah7o
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
           ah28
           ah28)
         ah7o)
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
           ah28
           ah29)
         ah7h)
      :named
      given-7.2))
(assert
   (!
      (= ah7h ah27)
      :named
      given-7.3))
(assert
   (!
      (= ah7o ah28)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_ah2f} {0}:: u ~ w (CNonCanonical)
;  =>  (= ah27 ah29)

; WANTEDS (names)
;  ah27  <=  u
;  ah29  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ah27 ah29))
      :named
      wanted-7))
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
;           ah28
;           ah28)
;         ah7o)
;      :named
;      given-7.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah28
;           ah29)
;         ah7h)
;      :named
;      given-7.2)
;   (!
;      (= ah7h ah27)
;      :named
;      given-7.3)
;   (!
;      (= ah7o ah28)
;      :named
;      given-7.4)
;   (!
;      (not
;         (= ah27 ah29))
;      :named
;      wanted-7))
(get-unsat-core)
; (given-7.1 given-7.2 given-7.4 given-7.3 wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_ah7y {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ah7E {2}:: Base "kg" ~ fsk0 (CNonCanonical)
; [G] co_ah7A {1}:: (w *: w) ~ fsk0 (CNonCanonical)
; [G] co_ah7G {1}:: (fsk0 *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ah7I {0}:: (fsk0 /: fsk1) ~ fsk2 (CNonCanonical)
; [G] co_ah7C {0}:: (fsk0 /: fsk1) ~ fsk2 (CNonCanonical)
; [G] co_ah7L {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ah7Q} {2}:: fsk0 ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ah7x)
; (Base ["kg"],ah7D)
; (*: [ah2h,ah2h],ah7z)
; (*: [ah7D,ah7D],ah7F)
; (/: [ah7x,ah7F],ah7H)
; (/: [ah7x,ah7z],ah7B)
; (ah7B,ah7H)

; WANTEDS (Thoralf style)
; (ah7D,ah2h)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_ah7Q} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= ah7D ah2h)

; GIVENS (names)
;  ah2h  <=  w
;  ah7x  <=  fsk_ah7x
;  ah7z  <=  fsk_ah7z
;  ah7B  <=  fsk_ah7B
;  ah7D  <=  fsk_ah7D
;  ah7F  <=  fsk_ah7F
;  ah7H  <=  fsk_ah7H
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ah2h (Array String Int))
; (declare-const ah7B (Array String Int))
; (declare-const ah7D (Array String Int))
; (declare-const ah7F (Array String Int))
; (declare-const ah7H (Array String Int))
; (declare-const ah7x (Array String Int))
; (declare-const ah7z (Array String Int))
(declare-const
   ah2h
   (Array String Int))
(declare-const
   ah7x
   (Array String Int))
(declare-const
   ah7z
   (Array String Int))
(declare-const
   ah7B
   (Array String Int))
(declare-const
   ah7D
   (Array String Int))
(declare-const
   ah7F
   (Array String Int))
(declare-const
   ah7H
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ah7x)
      :named
      given-8.1))
(assert
   (!
      (=
         (store base "kg" one)
         ah7D)
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
           ah2h
           ah2h)
         ah7z)
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
           ah7D
           ah7D)
         ah7F)
      :named
      given-8.4))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           ah7x
           ah7F)
         ah7H)
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
           ah7x
           ah7z)
         ah7B)
      :named
      given-8.6))
(assert
   (!
      (= ah7B ah7H)
      :named
      given-8.7))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_ah7Q} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= ah7D ah2h)

; WANTEDS (names)
;  ah2h  <=  w
;  ah7D  <=  fsk_ah7D
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ah7D ah2h))
      :named
      wanted-8))
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
;         ah7x)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store base "kg" one)
;         ah7D)
;      :named
;      given-8.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ah2h
;           ah2h)
;         ah7z)
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
;           ah7D
;           ah7D)
;         ah7F)
;      :named
;      given-8.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           ah7x
;           ah7F)
;         ah7H)
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
;           ah7x
;           ah7z)
;         ah7B)
;      :named
;      given-8.6)
;   (!
;      (= ah7B ah7H)
;      :named
;      given-8.7)
;   (!
;      (not
;         (= ah7D ah2h))
;      :named
;      wanted-8))
(get-unsat-core)
; (given-8.4
;    given-8.5
;    given-8.3
;    given-8.6
;    given-8.7
;    given-8.2
;    wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_ah8d {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ah8d {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_ah8d {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah2p
;      ah2C)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah2p
;      ah2C))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] irred_ah8d {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah2p
;      ah2C)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah2p
;      ah2C))

; WANTEDS (names)
;  ah2p  <=  u
;  ah2C  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ah2C (Array String Int))
; (declare-const ah2p (Array String Int))
(declare-const
   ah2p
   (Array String Int))
(declare-const
   ah2C
   (Array String Int))
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
              ah2p
              ah2C)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              ah2p
              ah2C)))
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
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              ah2p
;              ah2C)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              ah2p
;              ah2C)))
;      :named
;      wanted-9))
(get-unsat-core)
; (wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_ah8s {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
; [WD] irred_ah8x {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ah8s {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
; [WD] irred_ah8x {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_ah8s {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3y
;      ah3z)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3y
;      ah3z))

;      [WD] irred_ah8x {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3y
;      ah3z)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3z
;      ah3y))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] irred_ah8s {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3y
;      ah3z)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3y
;      ah3z))

;      [WD] irred_ah8x {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3y
;      ah3z)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ah3z
;      ah3y))

; WANTEDS (names)
;  ah3y  <=  u
;  ah3z  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ah3y (Array String Int))
; (declare-const ah3z (Array String Int))
(declare-const
   ah3y
   (Array String Int))
(declare-const
   ah3z
   (Array String Int))
(assert
   (!
      (or
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ah3y
                 ah3z)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ah3y
                 ah3z)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ah3y
                 ah3z)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 ah3z
                 ah3y))))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (or
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 ah3y
;                 ah3z)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 ah3y
;                 ah3z)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 ah3y
;                 ah3z)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 ah3z
;                 ah3y))))
;      :named
;      wanted-10))
(get-unsat-core)
; (wanted-10)
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_ah8H {0}:: u ~~ (u /: One) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ah8H {0}:: u ~~ (u /: One) (CIrredCan(sol))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_ah8H {0}:: u ~~ (u /: One) (CIrredCan(sol))
;  =>  (=
;    ah4G
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      ah4G
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] irred_ah8H {0}:: u ~~ (u /: One) (CIrredCan(sol))
;  =>  (=
;    ah4G
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      ah4G
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  ah4G  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ah4G (Array String Int))
(declare-const
   ah4G
   (Array String Int))
(assert
   (!
      (not
         (=
            ah4G
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              ah4G
              (
                (as
                   const
                   (Array String Int))
                0))))
      :named
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            ah4G
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              ah4G
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))))
;      :named
;      wanted-11))
(get-unsat-core)
; (wanted-11)
(pop 1)
(echo "solver-finish-cycle-11")
(exit)
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
; [WD] hole{co_ahH3} {2}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_ahH3} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_ahH3} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "byte" one))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "byte" one)
;              (store base "byte" one))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
(exit)
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
; [WD] hole{co_akJQ} {2}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_akJQ} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_akJQ} {2}:: One
;                               ~ (Base "byte" /: Base "byte") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "byte" one)
;      (store base "byte" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
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
              (store base "byte" one))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              (store base "byte" one)
;              (store base "byte" one))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
; [WD] hole{co_al3l} {2}:: (One *: a0) ~ (a0 *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [One [],al27],*: [al27,One []])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_al3l} {2}:: (One *: a0)
;                               ~ (a0 *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      al27)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      al27
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_al3l} {2}:: (One *: a0)
;                               ~ (a0 *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      al27)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      al27
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  al27  <=  a_al27
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const al27 (Array String Int))
(declare-const
   al27
   (Array String Int))
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
              (
                (as
                   const
                   (Array String Int))
                0)
              al27)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              al27
              (
                (as
                   const
                   (Array String Int))
                0))))
      :named
      wanted-1))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-1")
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
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)
;              al27)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              al27
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
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
(exit)
