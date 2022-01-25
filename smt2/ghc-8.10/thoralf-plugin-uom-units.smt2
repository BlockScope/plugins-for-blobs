; Build profile: -w ghc-8.10.7 -O1
; [1 of 6] Compiling Abelian
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
; [WD] hole{co_aZp} {1}:: (u *: (One /: u))
;                         ~ (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [aZ9,/: [One [],aZ9]],*: [aZb,/: [One [],aZb]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aZp} {1}:: (u *: (One /: u))
;                              ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZ9
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
;        aZ9))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZb
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
;        aZb)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_aZp} {1}:: (u *: (One /: u))
;                              ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZ9
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
;        aZ9))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZb
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
;        aZb)))

; WANTEDS (names)
;  aZ9  <=  u
;  aZb  <=  u_aZb
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aZ9 (Array String Int))
; (declare-const aZb (Array String Int))
(declare-const
   aZ9
   (Array String Int))
(declare-const
   aZb
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
              aZ9
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
                aZ9))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aZb
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
                aZb))))
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
;              aZ9
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
;                aZ9))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aZb
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
;                aZb))))
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
; [WD] hole{co_aZY} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{co_a103} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [aZP,aZO],*: [aZM,aZL])
; (*: [aZL,aZM],*: [aZO,aZP])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aZY} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZP
;      aZO)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZM
;      aZL))

;      [WD] hole{co_a103} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZL
;      aZM)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZO
;      aZP))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aZY} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZP
;      aZO)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZM
;      aZL))

;      [WD] hole{co_a103} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZL
;      aZM)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZO
;      aZP))

; WANTEDS (names)
;  aZL  <=  u
;  aZM  <=  v
;  aZO  <=  u_aZO
;  aZP  <=  v_aZP
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aZL (Array String Int))
; (declare-const aZM (Array String Int))
; (declare-const aZO (Array String Int))
; (declare-const aZP (Array String Int))
(declare-const
   aZL
   (Array String Int))
(declare-const
   aZM
   (Array String Int))
(declare-const
   aZO
   (Array String Int))
(declare-const
   aZP
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
                 aZP
                 aZO)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aZM
                 aZL)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aZL
                 aZM)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aZO
                 aZP))))
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
;                 aZP
;                 aZO)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aZM
;                 aZL)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aZL
;                 aZM)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aZO
;                 aZP)))))
;   (define-fun
;      aZO
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
;      aZM
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
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aZP
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
;      aZL
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
; [WD] hole{co_a10w} {1}:: ((u0 *: v0) *: w0)
;                          ~ ((u *: v) *: w) (CNonCanonical)
; [WD] hole{co_a10F} {1}:: (u *: (v *: w))
;                          ~ (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a10h,a10i],a10j],*: [*: [a10d,a10e],a10f])
; (*: [a10d,*: [a10e,a10f]],*: [a10h,*: [a10i,a10j]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a10w} {1}:: ((u0 *: v0) *: w0)
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
;        a10h
;        a10i)
;      a10j)
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
;        a10d
;        a10e)
;      a10f))

;      [WD] hole{co_a10F} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10d
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10e
;        a10f))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10h
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10i
;        a10j)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a10w} {1}:: ((u0 *: v0) *: w0)
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
;        a10h
;        a10i)
;      a10j)
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
;        a10d
;        a10e)
;      a10f))

;      [WD] hole{co_a10F} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10d
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10e
;        a10f))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10h
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10i
;        a10j)))

; WANTEDS (names)
;  a10d  <=  u
;  a10e  <=  v
;  a10f  <=  w
;  a10h  <=  u_a10h
;  a10i  <=  v_a10i
;  a10j  <=  w_a10j
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10d (Array String Int))
; (declare-const a10e (Array String Int))
; (declare-const a10f (Array String Int))
; (declare-const a10h (Array String Int))
; (declare-const a10i (Array String Int))
; (declare-const a10j (Array String Int))
(declare-const
   a10d
   (Array String Int))
(declare-const
   a10e
   (Array String Int))
(declare-const
   a10f
   (Array String Int))
(declare-const
   a10h
   (Array String Int))
(declare-const
   a10i
   (Array String Int))
(declare-const
   a10j
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
                   a10h
                   a10i)
                 a10j)
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
                   a10d
                   a10e)
                 a10f)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a10d
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a10e
                   a10f))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a10h
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a10i
                   a10j)))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
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
;                 a10h
;                 a10i
;                 a10j)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a10d
;                 a10e
;                 a10f)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a10d
;                 a10e
;                 a10f)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a10h
;                 a10i
;                 a10j)))))
;   (define-fun
;      a10j
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
;      a10h
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
;      a10e
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
;      a10i
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
;      a10d
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
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a10f
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
; [WD] hole{co_a11s} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a10H],Base [a10H]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a11s} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a10H one)
;      (store base a10H one))
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
;      [WD] hole{co_a11s} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a10H one)
;      (store base a10H one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a10H  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10H String)
(declare-const a10H String)
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
              (store base a10H one)
              (store base a10H one))
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
;              (store base a10H one)
;              (store base a10H one))
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
; [WD] hole{co_a11B} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a10Q,/: [One [],a10Q]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a11B} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10Q
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
;        a10Q))
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
;      [WD] hole{co_a11B} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10Q
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
;        a10Q))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a10Q  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10Q (Array String Int))
(declare-const
   a10Q
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
              a10Q
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
                a10Q))
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
;              a10Q
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
;                a10Q))
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
; [WD] hole{co_a11G} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a10X,One []],a10X)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a11G} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10X
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a10X)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a11G} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10X
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a10X)

; WANTEDS (names)
;  a10X  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10X (Array String Int))
(declare-const
   a10X
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
              a10X
              (
                (as
                   const
                   (Array String Int))
                0))
            a10X))
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
;              a10X
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a10X))
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
; [WD] hole{co_a11N} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a113,a114],*: [a114,a113])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a11N} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a113
;      a114)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a114
;      a113))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a11N} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a113
;      a114)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a114
;      a113))

; WANTEDS (names)
;  a113  <=  u
;  a114  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a113 (Array String Int))
; (declare-const a114 (Array String Int))
(declare-const
   a113
   (Array String Int))
(declare-const
   a114
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
              a113
              a114)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a114
              a113)))
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
;              a113
;              a114)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a114
;              a113)))
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
; [WD] hole{co_a11Y} {1}:: (u *: (v *: w))
;                          ~ ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a11b,*: [a11c,a11d]],*: [*: [a11b,a11c],a11d])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a11Y} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a11b
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a11c
;        a11d))
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
;        a11b
;        a11c)
;      a11d))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a11Y} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a11b
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a11c
;        a11d))
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
;        a11b
;        a11c)
;      a11d))

; WANTEDS (names)
;  a11b  <=  u
;  a11c  <=  v
;  a11d  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a11b (Array String Int))
; (declare-const a11c (Array String Int))
; (declare-const a11d (Array String Int))
(declare-const
   a11b
   (Array String Int))
(declare-const
   a11c
   (Array String Int))
(declare-const
   a11d
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
              a11b
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a11c
                a11d))
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
                a11b
                a11c)
              a11d)))
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
;              a11b
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a11c
;                a11d))
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
;                a11b
;                a11c)
;              a11d)))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; [2 of 6] Compiling UnQuantity
; [3 of 6] Compiling UnitDefs
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
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a82i} {1}:: One
;                          ~ (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a82i} {1}:: One
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
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a82i} {1}:: One
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
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
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
;      wanted-16))
(get-unsat-core)
; (wanted-16)
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a82K} {1}:: One
;                          ~ (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{co_a82K} {1}:: One
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
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
;      [WD] hole{co_a82K} {1}:: One
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
      wanted-18))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-18")
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
;      wanted-18))
(get-unsat-core)
; (wanted-18)
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a83c} {1}:: One
;                          ~ (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{co_a83c} {1}:: One
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
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{co_a83c} {1}:: One
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
      wanted-20))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-20")
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
;      wanted-20))
(get-unsat-core)
; (wanted-20)
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a83E} {1}:: One
;                          ~ (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a83E} {1}:: One
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
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a83E} {1}:: One
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
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
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
;      wanted-22))
(get-unsat-core)
; (wanted-22)
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a846} {1}:: One
;                          ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{co_a846} {1}:: One
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
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
;      [WD] hole{co_a846} {1}:: One
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
      wanted-24))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-24")
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
;      wanted-24))
(get-unsat-core)
; (wanted-24)
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a84y} {1}:: One
;                          ~ (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-26")
; GIVENS (conversions)
;      [WD] hole{co_a84y} {1}:: One
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
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
; WANTEDS (conversions)
;      [WD] hole{co_a84y} {1}:: One
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
      wanted-26))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-26")
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
;      wanted-26))
(get-unsat-core)
; (wanted-26)
(pop 1)
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-27")
(echo "solver-finish-cycle-27")
(echo "solver-start-cycle-28")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a850} {1}:: One
;                          ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-28")
; GIVENS (conversions)
;      [WD] hole{co_a850} {1}:: One
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
(echo "givens-finish-cycle-28")
(echo "wanteds-start-cycle-28")
; WANTEDS (conversions)
;      [WD] hole{co_a850} {1}:: One
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
      wanted-28))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-28")
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
;      wanted-28))
(get-unsat-core)
; (wanted-28)
(pop 1)
(echo "solver-finish-cycle-28")
(exit)
; [4 of 6] Compiling Defs
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

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a8rp} {1}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a8rp} {1}:: One
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
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a8rp} {1}:: One
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
;              (store base "byte" one)
;              (store base "byte" one))))
;      :named
;      wanted-2))
(get-unsat-core)
; (wanted-2)
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(exit)
; [5 of 6] Compiling Main
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

; GIVENS (GHC style)
; [G] co_a90d {1}:: One ~ fsk0 (CFunEqCan)
; [G] co_a8Z7 {35}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Z9 {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zb {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zd {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zf {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zh {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zj {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zl {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zn {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zp {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zr {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zt {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zv {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zx {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Zz {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZB {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZD {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZF {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZH {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZJ {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZL {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZN {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZP {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZR {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZT {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZV {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZX {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8ZZ {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a901 {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a903 {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a905 {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a907 {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a909 {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a90b {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8Z1 {3}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] co_a8Z3 {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a8YZ {2}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] co_a90f {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_a90h {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a90m} {1}:: (a0 *: a0) ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a90c)
; (*: [a8YO,a8Z2],a8Z6)
; (*: [a8YO,a8Z6],a8Z8)
; (*: [a8YO,a8Z8],a8Za)
; (*: [a8YO,a8Za],a8Zc)
; (*: [a8YO,a8Zc],a8Ze)
; (*: [a8YO,a8Ze],a8Zg)
; (*: [a8YO,a8Zg],a8Zi)
; (*: [a8YO,a8Zi],a8Zk)
; (*: [a8YO,a8Zk],a8Zm)
; (*: [a8YO,a8Zm],a8Zo)
; (*: [a8YO,a8Zo],a8Zq)
; (*: [a8YO,a8Zq],a8Zs)
; (*: [a8YO,a8Zs],a8Zu)
; (*: [a8YO,a8Zu],a8Zw)
; (*: [a8YO,a8Zw],a8Zy)
; (*: [a8YO,a8Zy],a8ZA)
; (*: [a8YO,a8ZA],a8ZC)
; (*: [a8YO,a8ZC],a8ZE)
; (*: [a8YO,a8ZE],a8ZG)
; (*: [a8YO,a8ZG],a8ZI)
; (*: [a8YO,a8ZI],a8ZK)
; (*: [a8YO,a8ZK],a8ZM)
; (*: [a8YO,a8ZM],a8ZO)
; (*: [a8YO,a8ZO],a8ZQ)
; (*: [a8YO,a8ZQ],a8ZS)
; (*: [a8YO,a8ZS],a8ZU)
; (*: [a8YO,a8ZU],a8ZW)
; (*: [a8YO,a8ZW],a8ZY)
; (*: [a8YO,a8ZY],a900)
; (*: [a8YO,a900],a902)
; (*: [a8YO,a902],a904)
; (*: [a8YO,a904],a906)
; (*: [a8YO,a906],a908)
; (*: [a8YO,a908],a90a)
; (*: [a8YO,a8YO],a8Z0)
; (*: [a8YO,a8Z0],a8Z2)
; (*: [a8YN,a8YN],a8YY)
; (a90a,a90c)
; (a8YY,a8Z2)

; WANTEDS (Thoralf style)
; (*: [a8YR,a8YR],a8Z2)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a90m} {1}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a8YR
;      a8YR)
;    a8Z2)

; GIVENS (names)
;  a8YN  <=  a
;  a8YO  <=  b
;  a8YY  <=  fsk_a8YY
;  a8Z0  <=  fsk_a8Z0
;  a8Z2  <=  fsk_a8Z2
;  a8Z6  <=  fsk_a8Z6
;  a8Z8  <=  fsk_a8Z8
;  a8Za  <=  fsk_a8Za
;  a8Zc  <=  fsk_a8Zc
;  a8Ze  <=  fsk_a8Ze
;  a8Zg  <=  fsk_a8Zg
;  a8Zi  <=  fsk_a8Zi
;  a8Zk  <=  fsk_a8Zk
;  a8Zm  <=  fsk_a8Zm
;  a8Zo  <=  fsk_a8Zo
;  a8Zq  <=  fsk_a8Zq
;  a8Zs  <=  fsk_a8Zs
;  a8Zu  <=  fsk_a8Zu
;  a8Zw  <=  fsk_a8Zw
;  a8Zy  <=  fsk_a8Zy
;  a8ZA  <=  fsk_a8ZA
;  a8ZC  <=  fsk_a8ZC
;  a8ZE  <=  fsk_a8ZE
;  a8ZG  <=  fsk_a8ZG
;  a8ZI  <=  fsk_a8ZI
;  a8ZK  <=  fsk_a8ZK
;  a8ZM  <=  fsk_a8ZM
;  a8ZO  <=  fsk_a8ZO
;  a8ZQ  <=  fsk_a8ZQ
;  a8ZS  <=  fsk_a8ZS
;  a8ZU  <=  fsk_a8ZU
;  a8ZW  <=  fsk_a8ZW
;  a8ZY  <=  fsk_a8ZY
;  a900  <=  fsk_a900
;  a902  <=  fsk_a902
;  a904  <=  fsk_a904
;  a906  <=  fsk_a906
;  a908  <=  fsk_a908
;  a90a  <=  fsk_a90a
;  a90c  <=  fsk_a90c
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a8YN (Array String Int))
; (declare-const a8YO (Array String Int))
; (declare-const a8YY (Array String Int))
; (declare-const a8Z0 (Array String Int))
; (declare-const a8Z2 (Array String Int))
; (declare-const a8Z6 (Array String Int))
; (declare-const a8Z8 (Array String Int))
; (declare-const a8ZA (Array String Int))
; (declare-const a8ZC (Array String Int))
; (declare-const a8ZE (Array String Int))
; (declare-const a8ZG (Array String Int))
; (declare-const a8ZI (Array String Int))
; (declare-const a8ZK (Array String Int))
; (declare-const a8ZM (Array String Int))
; (declare-const a8ZO (Array String Int))
; (declare-const a8ZQ (Array String Int))
; (declare-const a8ZS (Array String Int))
; (declare-const a8ZU (Array String Int))
; (declare-const a8ZW (Array String Int))
; (declare-const a8ZY (Array String Int))
; (declare-const a8Za (Array String Int))
; (declare-const a8Zc (Array String Int))
; (declare-const a8Ze (Array String Int))
; (declare-const a8Zg (Array String Int))
; (declare-const a8Zi (Array String Int))
; (declare-const a8Zk (Array String Int))
; (declare-const a8Zm (Array String Int))
; (declare-const a8Zo (Array String Int))
; (declare-const a8Zq (Array String Int))
; (declare-const a8Zs (Array String Int))
; (declare-const a8Zu (Array String Int))
; (declare-const a8Zw (Array String Int))
; (declare-const a8Zy (Array String Int))
; (declare-const a900 (Array String Int))
; (declare-const a902 (Array String Int))
; (declare-const a904 (Array String Int))
; (declare-const a906 (Array String Int))
; (declare-const a908 (Array String Int))
; (declare-const a90a (Array String Int))
; (declare-const a90c (Array String Int))
(declare-const
   a8YN
   (Array String Int))
(declare-const
   a8YO
   (Array String Int))
(declare-const
   a8YY
   (Array String Int))
(declare-const
   a8Z0
   (Array String Int))
(declare-const
   a8Z2
   (Array String Int))
(declare-const
   a8Z6
   (Array String Int))
(declare-const
   a8Z8
   (Array String Int))
(declare-const
   a8Za
   (Array String Int))
(declare-const
   a8Zc
   (Array String Int))
(declare-const
   a8Ze
   (Array String Int))
(declare-const
   a8Zg
   (Array String Int))
(declare-const
   a8Zi
   (Array String Int))
(declare-const
   a8Zk
   (Array String Int))
(declare-const
   a8Zm
   (Array String Int))
(declare-const
   a8Zo
   (Array String Int))
(declare-const
   a8Zq
   (Array String Int))
(declare-const
   a8Zs
   (Array String Int))
(declare-const
   a8Zu
   (Array String Int))
(declare-const
   a8Zw
   (Array String Int))
(declare-const
   a8Zy
   (Array String Int))
(declare-const
   a8ZA
   (Array String Int))
(declare-const
   a8ZC
   (Array String Int))
(declare-const
   a8ZE
   (Array String Int))
(declare-const
   a8ZG
   (Array String Int))
(declare-const
   a8ZI
   (Array String Int))
(declare-const
   a8ZK
   (Array String Int))
(declare-const
   a8ZM
   (Array String Int))
(declare-const
   a8ZO
   (Array String Int))
(declare-const
   a8ZQ
   (Array String Int))
(declare-const
   a8ZS
   (Array String Int))
(declare-const
   a8ZU
   (Array String Int))
(declare-const
   a8ZW
   (Array String Int))
(declare-const
   a8ZY
   (Array String Int))
(declare-const
   a900
   (Array String Int))
(declare-const
   a902
   (Array String Int))
(declare-const
   a904
   (Array String Int))
(declare-const
   a906
   (Array String Int))
(declare-const
   a908
   (Array String Int))
(declare-const
   a90a
   (Array String Int))
(declare-const
   a90c
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a90c)
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
           a8YO
           a8Z2)
         a8Z6)
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
           a8YO
           a8Z6)
         a8Z8)
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
           a8YO
           a8Z8)
         a8Za)
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
           a8YO
           a8Za)
         a8Zc)
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
           a8YO
           a8Zc)
         a8Ze)
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
           a8YO
           a8Ze)
         a8Zg)
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
           a8YO
           a8Zg)
         a8Zi)
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
           a8YO
           a8Zi)
         a8Zk)
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
           a8YO
           a8Zk)
         a8Zm)
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
           a8YO
           a8Zm)
         a8Zo)
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
           a8YO
           a8Zo)
         a8Zq)
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
           a8YO
           a8Zq)
         a8Zs)
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
           a8YO
           a8Zs)
         a8Zu)
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
           a8YO
           a8Zu)
         a8Zw)
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
           a8YO
           a8Zw)
         a8Zy)
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
           a8YO
           a8Zy)
         a8ZA)
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
           a8YO
           a8ZA)
         a8ZC)
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
           a8YO
           a8ZC)
         a8ZE)
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
           a8YO
           a8ZE)
         a8ZG)
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
           a8YO
           a8ZG)
         a8ZI)
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
           a8YO
           a8ZI)
         a8ZK)
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
           a8YO
           a8ZK)
         a8ZM)
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
           a8YO
           a8ZM)
         a8ZO)
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
           a8YO
           a8ZO)
         a8ZQ)
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
           a8YO
           a8ZQ)
         a8ZS)
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
           a8YO
           a8ZS)
         a8ZU)
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
           a8YO
           a8ZU)
         a8ZW)
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
           a8YO
           a8ZW)
         a8ZY)
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
           a8YO
           a8ZY)
         a900)
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
           a8YO
           a900)
         a902)
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
           a8YO
           a902)
         a904)
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
           a8YO
           a904)
         a906)
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
           a8YO
           a906)
         a908)
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
           a8YO
           a908)
         a90a)
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
           a8YO
           a8YO)
         a8Z0)
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
           a8YO
           a8Z0)
         a8Z2)
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
           a8YN
           a8YN)
         a8YY)
      :named
      given-2.38))
(assert
   (!
      (= a90a a90c)
      :named
      given-2.39))
(assert
   (!
      (= a8YY a8Z2)
      :named
      given-2.40))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a90m} {1}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a8YR
;      a8YR)
;    a8Z2)

; WANTEDS (names)
;  a8YR  <=  a_a8YR
;  a8Z2  <=  fsk_a8Z2
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a8YR (Array String Int))
(declare-const
   a8YR
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
              a8YR
              a8YR)
            a8Z2))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      a8Zs
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Za
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Zy
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.34
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a906)
;         a908))
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
;           a8YO
;           a8Zc)
;         a8Ze))
;   (define-fun
;      given-2.30
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZY)
;         a900))
;   (define-fun
;      given-2.15
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zu)
;         a8Zw))
;   (define-fun
;      a8ZS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.36
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8YO)
;         a8Z0))
;   (define-fun
;      given-2.24
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZM)
;         a8ZO))
;   (define-fun
;      a8Zo
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZU
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8YY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.16
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zw)
;         a8Zy))
;   (define-fun
;      given-2.19
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZC)
;         a8ZE))
;   (define-fun
;      a8ZM
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Z2
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Ze
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
;      given-2.40
;      ()
;      Bool
;      (= a8YY a8Z2))
;   (define-fun
;      given-2.23
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZK)
;         a8ZM))
;   (define-fun
;      a8ZI
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Zi
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.10
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zk)
;         a8Zm))
;   (define-fun
;      given-2.17
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zy)
;         a8ZA))
;   (define-fun
;      given-2.31
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a900)
;         a902))
;   (define-fun
;      given-2.28
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZU)
;         a8ZW))
;   (define-fun
;      a90a
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Zc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.11
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zm)
;         a8Zo))
;   (define-fun
;      a8YO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a906
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.20
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZE)
;         a8ZG))
;   (define-fun
;      a8Zw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Zm
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8YR
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
;      a900
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
;           a8YO
;           a8Za)
;         a8Zc))
;   (define-fun
;      given-2.32
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a902)
;         a904))
;   (define-fun
;      given-2.29
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZW)
;         a8ZY))
;   (define-fun
;      a8Zq
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZC
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.12
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zo)
;         a8Zq))
;   (define-fun
;      given-2.13
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zq)
;         a8Zs))
;   (define-fun
;      a90c
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.37
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Z0)
;         a8Z2))
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
;           a8YO
;           a8Z2)
;         a8Z6))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zg)
;         a8Zi))
;   (define-fun
;      given-2.22
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZI)
;         a8ZK))
;   (define-fun
;      a8Zu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.33
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a904)
;         a906))
;   (define-fun
;      wanted-2
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
;              a8YR
;              a8YR)
;            a8Z2)))
;   (define-fun
;      given-2.39
;      ()
;      Bool
;      (= a90a a90c))
;   (define-fun
;      a8YN
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.14
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zs)
;         a8Zu))
;   (define-fun
;      a8Z0
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a904
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.18
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZA)
;         a8ZC))
;   (define-fun
;      given-2.35
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a908)
;         a90a))
;   (define-fun
;      a902
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a908
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8ZW
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.38
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YN
;           a8YN)
;         a8YY))
;   (define-fun
;      given-2.27
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZS)
;         a8ZU))
;   (define-fun
;      given-2.21
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZG)
;         a8ZI))
;   (define-fun
;      a8ZA
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
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8Zi)
;         a8Zk))
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
;      given-2.25
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZO)
;         a8ZQ))
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
;           a8YO
;           a8Z6)
;         a8Z8))
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
;         a90c))
;   (define-fun
;      a8Zk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Zg
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.26
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YO
;           a8ZQ)
;         a8ZS))
;   (define-fun
;      a8ZK
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           a8YO
;           a8Ze)
;         a8Zg))
;   (define-fun
;      a8Z6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a8Z8
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           a8YO
;           a8Z8)
;         a8Za))
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
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_a90W {1}:: One ~ fsk0 (CFunEqCan)
; [G] co_a90Q {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a90S {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a90U {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a90K {3}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] co_a90M {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_a90I {2}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] co_a90Y {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_a910 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a918} {2}:: (b0 *: (b0 *: b0)) ~ fsk0 (CNonCanonical)
; [WD] hole{co_a91g} {1}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                          ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a90V)
; (*: [a90x,a90L],a90P)
; (*: [a90x,a90P],a90R)
; (*: [a90x,a90R],a90T)
; (*: [a90x,a90x],a90J)
; (*: [a90x,a90J],a90L)
; (*: [a90w,a90w],a90H)
; (a90T,a90V)
; (a90H,a90L)

; WANTEDS (Thoralf style)
; (*: [a90B,*: [a90B,a90B]],a90L)
; (*: [a90B,*: [a90B,*: [a90B,*: [a90B,*: [a90B,a90B]]]]],a90V)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a918} {2}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a90B
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a90B
;        a90B))
;    a90L)

;      [WD] hole{co_a91g} {1}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a90B
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a90B
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          a90B
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            a90B
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a90B
;              a90B)))))
;    a90V)

; GIVENS (names)
;  a90w  <=  a
;  a90x  <=  b
;  a90H  <=  fsk_a90H
;  a90J  <=  fsk_a90J
;  a90L  <=  fsk_a90L
;  a90P  <=  fsk_a90P
;  a90R  <=  fsk_a90R
;  a90T  <=  fsk_a90T
;  a90V  <=  fsk_a90V
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a90H (Array String Int))
; (declare-const a90J (Array String Int))
; (declare-const a90L (Array String Int))
; (declare-const a90P (Array String Int))
; (declare-const a90R (Array String Int))
; (declare-const a90T (Array String Int))
; (declare-const a90V (Array String Int))
; (declare-const a90w (Array String Int))
; (declare-const a90x (Array String Int))
(declare-const
   a90w
   (Array String Int))
(declare-const
   a90x
   (Array String Int))
(declare-const
   a90H
   (Array String Int))
(declare-const
   a90J
   (Array String Int))
(declare-const
   a90L
   (Array String Int))
(declare-const
   a90P
   (Array String Int))
(declare-const
   a90R
   (Array String Int))
(declare-const
   a90T
   (Array String Int))
(declare-const
   a90V
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         a90V)
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
           a90x
           a90L)
         a90P)
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
           a90x
           a90P)
         a90R)
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
           a90x
           a90R)
         a90T)
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
           a90x
           a90x)
         a90J)
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
           a90x
           a90J)
         a90L)
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
           a90w
           a90w)
         a90H)
      :named
      given-4.7))
(assert
   (!
      (= a90T a90V)
      :named
      given-4.8))
(assert
   (!
      (= a90H a90L)
      :named
      given-4.9))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a918} {2}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a90B
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a90B
;        a90B))
;    a90L)

;      [WD] hole{co_a91g} {1}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a90B
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a90B
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          a90B
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            a90B
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a90B
;              a90B)))))
;    a90V)

; WANTEDS (names)
;  a90B  <=  b_a90B
;  a90L  <=  fsk_a90L
;  a90V  <=  fsk_a90V
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a90B (Array String Int))
(declare-const
   a90B
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
                 a90B
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a90B
                   a90B))
               a90L))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a90B
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a90B
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     a90B
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       a90B
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         a90B
                         a90B)))))
               a90V)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      given-4.7
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a90w
;           a90w)
;         a90H))
;   (define-fun
;      a90J
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a90R
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a90x
;           a90R)
;         a90T))
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
;      base
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        7))
;   (define-fun
;      a90V
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a90B
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
;      a90x
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a90x
;           a90P)
;         a90R))
;   (define-fun
;      given-4.5
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a90x
;           a90x)
;         a90J))
;   (define-fun
;      a90L
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-4.6
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a90x
;           a90J)
;         a90L))
;   (define-fun
;      given-4.9
;      ()
;      Bool
;      (= a90H a90L))
;   (define-fun
;      wanted-4
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
;                      a90B
;                      a90B
;                      a90B
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        a90B
;                        a90B
;                        a90B))
;                    a90V))))
;         (or
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    a90B
;                    a90B
;                    a90B)
;                  a90L))
;            a!1)))
;   (define-fun
;      a90T
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a90x
;           a90L)
;         a90P))
;   (define-fun
;      a90H
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a90P
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
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         a90V))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= a90T a90V))
;   (define-fun
;      a90w
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
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_a927 {2}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] co_a922 {1}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] co_a923 {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_a929 {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a92f} {2}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{co_a92j} {1}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [a91N,a91N],a926)
; (*: [a91N,a91O],a921)
; (a921,a91M)
; (a926,a91N)

; WANTEDS (Thoralf style)
; (*: [a91T,a91O],a91M)
; (*: [a91T,a91T],a91T)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a92f} {2}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a91T
;      a91O)
;    a91M)

;      [WD] hole{co_a92j} {1}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a91T
;      a91T)
;    a91T)

; GIVENS (names)
;  a91M  <=  u
;  a91N  <=  v
;  a91O  <=  w
;  a921  <=  fsk_a921
;  a926  <=  fsk_a926
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a91M (Array String Int))
; (declare-const a91N (Array String Int))
; (declare-const a91O (Array String Int))
; (declare-const a921 (Array String Int))
; (declare-const a926 (Array String Int))
(declare-const
   a91M
   (Array String Int))
(declare-const
   a91N
   (Array String Int))
(declare-const
   a91O
   (Array String Int))
(declare-const
   a921
   (Array String Int))
(declare-const
   a926
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
           a91N
           a91N)
         a926)
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
           a91N
           a91O)
         a921)
      :named
      given-7.2))
(assert
   (!
      (= a921 a91M)
      :named
      given-7.3))
(assert
   (!
      (= a926 a91N)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a92f} {2}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a91T
;      a91O)
;    a91M)

;      [WD] hole{co_a92j} {1}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a91T
;      a91T)
;    a91T)

; WANTEDS (names)
;  a91M  <=  u
;  a91O  <=  w
;  a91T  <=  v_a91T
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a91T (Array String Int))
(declare-const
   a91T
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
                 a91T
                 a91O)
               a91M))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a91T
                 a91T)
               a91T)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (define-fun
;      a926
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      a91T
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
;      given-7.4
;      ()
;      Bool
;      (= a926 a91N))
;   (define-fun
;      a921
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
;      a91M
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
;      given-7.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a91N
;           a91N)
;         a926))
;   (define-fun
;      a91O
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
;      wanted-7
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
;                 a91T
;                 a91O)
;               a91M))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a91T
;                 a91T)
;               a91T))))
;   (define-fun
;      a91N
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-7.3
;      ()
;      Bool
;      (= a921 a91M))
;   (define-fun
;      given-7.2
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a91N
;           a91O)
;         a921))
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
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
Parse Failed
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")
Parse Failed
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] co_aa8t {1}:: One ~ fsk0 (CFunEqCan)
; [G] co_aa7n {35}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7p {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7r {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7t {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7v {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7x {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7z {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7B {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7D {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7F {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7H {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7J {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7L {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7N {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7P {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7R {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7T {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7V {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7X {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7Z {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa81 {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa83 {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa85 {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa87 {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa89 {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8b {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8d {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8f {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8h {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8j {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8l {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8n {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8p {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8r {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7h {3}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] co_aa7j {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa7f {2}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] co_aa8v {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aa8x {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aa8B} {2}:: fsk0 ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aa8s)
; (*: [a9vH,aa7i],aa7m)
; (*: [a9vH,aa7m],aa7o)
; (*: [a9vH,aa7o],aa7q)
; (*: [a9vH,aa7q],aa7s)
; (*: [a9vH,aa7s],aa7u)
; (*: [a9vH,aa7u],aa7w)
; (*: [a9vH,aa7w],aa7y)
; (*: [a9vH,aa7y],aa7A)
; (*: [a9vH,aa7A],aa7C)
; (*: [a9vH,aa7C],aa7E)
; (*: [a9vH,aa7E],aa7G)
; (*: [a9vH,aa7G],aa7I)
; (*: [a9vH,aa7I],aa7K)
; (*: [a9vH,aa7K],aa7M)
; (*: [a9vH,aa7M],aa7O)
; (*: [a9vH,aa7O],aa7Q)
; (*: [a9vH,aa7Q],aa7S)
; (*: [a9vH,aa7S],aa7U)
; (*: [a9vH,aa7U],aa7W)
; (*: [a9vH,aa7W],aa7Y)
; (*: [a9vH,aa7Y],aa80)
; (*: [a9vH,aa80],aa82)
; (*: [a9vH,aa82],aa84)
; (*: [a9vH,aa84],aa86)
; (*: [a9vH,aa86],aa88)
; (*: [a9vH,aa88],aa8a)
; (*: [a9vH,aa8a],aa8c)
; (*: [a9vH,aa8c],aa8e)
; (*: [a9vH,aa8e],aa8g)
; (*: [a9vH,aa8g],aa8i)
; (*: [a9vH,aa8i],aa8k)
; (*: [a9vH,aa8k],aa8m)
; (*: [a9vH,aa8m],aa8o)
; (*: [a9vH,aa8o],aa8q)
; (*: [a9vH,a9vH],aa7g)
; (*: [a9vH,aa7g],aa7i)
; (*: [a9vG,a9vG],aa7e)
; (aa8q,aa8s)
; (aa7e,aa7i)

; WANTEDS (Thoralf style)
; (aa8s,a9vH)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_aa8B} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= aa8s a9vH)

; GIVENS (names)
;  a9vG  <=  a
;  a9vH  <=  b
;  aa7e  <=  fsk_aa7e
;  aa7g  <=  fsk_aa7g
;  aa7i  <=  fsk_aa7i
;  aa7m  <=  fsk_aa7m
;  aa7o  <=  fsk_aa7o
;  aa7q  <=  fsk_aa7q
;  aa7s  <=  fsk_aa7s
;  aa7u  <=  fsk_aa7u
;  aa7w  <=  fsk_aa7w
;  aa7y  <=  fsk_aa7y
;  aa7A  <=  fsk_aa7A
;  aa7C  <=  fsk_aa7C
;  aa7E  <=  fsk_aa7E
;  aa7G  <=  fsk_aa7G
;  aa7I  <=  fsk_aa7I
;  aa7K  <=  fsk_aa7K
;  aa7M  <=  fsk_aa7M
;  aa7O  <=  fsk_aa7O
;  aa7Q  <=  fsk_aa7Q
;  aa7S  <=  fsk_aa7S
;  aa7U  <=  fsk_aa7U
;  aa7W  <=  fsk_aa7W
;  aa7Y  <=  fsk_aa7Y
;  aa80  <=  fsk_aa80
;  aa82  <=  fsk_aa82
;  aa84  <=  fsk_aa84
;  aa86  <=  fsk_aa86
;  aa88  <=  fsk_aa88
;  aa8a  <=  fsk_aa8a
;  aa8c  <=  fsk_aa8c
;  aa8e  <=  fsk_aa8e
;  aa8g  <=  fsk_aa8g
;  aa8i  <=  fsk_aa8i
;  aa8k  <=  fsk_aa8k
;  aa8m  <=  fsk_aa8m
;  aa8o  <=  fsk_aa8o
;  aa8q  <=  fsk_aa8q
;  aa8s  <=  fsk_aa8s
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9vG (Array String Int))
; (declare-const a9vH (Array String Int))
; (declare-const aa7A (Array String Int))
; (declare-const aa7C (Array String Int))
; (declare-const aa7E (Array String Int))
; (declare-const aa7G (Array String Int))
; (declare-const aa7I (Array String Int))
; (declare-const aa7K (Array String Int))
; (declare-const aa7M (Array String Int))
; (declare-const aa7O (Array String Int))
; (declare-const aa7Q (Array String Int))
; (declare-const aa7S (Array String Int))
; (declare-const aa7U (Array String Int))
; (declare-const aa7W (Array String Int))
; (declare-const aa7Y (Array String Int))
; (declare-const aa7e (Array String Int))
; (declare-const aa7g (Array String Int))
; (declare-const aa7i (Array String Int))
; (declare-const aa7m (Array String Int))
; (declare-const aa7o (Array String Int))
; (declare-const aa7q (Array String Int))
; (declare-const aa7s (Array String Int))
; (declare-const aa7u (Array String Int))
; (declare-const aa7w (Array String Int))
; (declare-const aa7y (Array String Int))
; (declare-const aa80 (Array String Int))
; (declare-const aa82 (Array String Int))
; (declare-const aa84 (Array String Int))
; (declare-const aa86 (Array String Int))
; (declare-const aa88 (Array String Int))
; (declare-const aa8a (Array String Int))
; (declare-const aa8c (Array String Int))
; (declare-const aa8e (Array String Int))
; (declare-const aa8g (Array String Int))
; (declare-const aa8i (Array String Int))
; (declare-const aa8k (Array String Int))
; (declare-const aa8m (Array String Int))
; (declare-const aa8o (Array String Int))
; (declare-const aa8q (Array String Int))
; (declare-const aa8s (Array String Int))
(declare-const
   a9vG
   (Array String Int))
(declare-const
   a9vH
   (Array String Int))
(declare-const
   aa7e
   (Array String Int))
(declare-const
   aa7g
   (Array String Int))
(declare-const
   aa7i
   (Array String Int))
(declare-const
   aa7m
   (Array String Int))
(declare-const
   aa7o
   (Array String Int))
(declare-const
   aa7q
   (Array String Int))
(declare-const
   aa7s
   (Array String Int))
(declare-const
   aa7u
   (Array String Int))
(declare-const
   aa7w
   (Array String Int))
(declare-const
   aa7y
   (Array String Int))
(declare-const
   aa7A
   (Array String Int))
(declare-const
   aa7C
   (Array String Int))
(declare-const
   aa7E
   (Array String Int))
(declare-const
   aa7G
   (Array String Int))
(declare-const
   aa7I
   (Array String Int))
(declare-const
   aa7K
   (Array String Int))
(declare-const
   aa7M
   (Array String Int))
(declare-const
   aa7O
   (Array String Int))
(declare-const
   aa7Q
   (Array String Int))
(declare-const
   aa7S
   (Array String Int))
(declare-const
   aa7U
   (Array String Int))
(declare-const
   aa7W
   (Array String Int))
(declare-const
   aa7Y
   (Array String Int))
(declare-const
   aa80
   (Array String Int))
(declare-const
   aa82
   (Array String Int))
(declare-const
   aa84
   (Array String Int))
(declare-const
   aa86
   (Array String Int))
(declare-const
   aa88
   (Array String Int))
(declare-const
   aa8a
   (Array String Int))
(declare-const
   aa8c
   (Array String Int))
(declare-const
   aa8e
   (Array String Int))
(declare-const
   aa8g
   (Array String Int))
(declare-const
   aa8i
   (Array String Int))
(declare-const
   aa8k
   (Array String Int))
(declare-const
   aa8m
   (Array String Int))
(declare-const
   aa8o
   (Array String Int))
(declare-const
   aa8q
   (Array String Int))
(declare-const
   aa8s
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aa8s)
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
           a9vH
           aa7i)
         aa7m)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7m)
         aa7o)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7o)
         aa7q)
      :named
      given-13.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7q)
         aa7s)
      :named
      given-13.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7s)
         aa7u)
      :named
      given-13.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7u)
         aa7w)
      :named
      given-13.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7w)
         aa7y)
      :named
      given-13.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7y)
         aa7A)
      :named
      given-13.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7A)
         aa7C)
      :named
      given-13.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7C)
         aa7E)
      :named
      given-13.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7E)
         aa7G)
      :named
      given-13.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7G)
         aa7I)
      :named
      given-13.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7I)
         aa7K)
      :named
      given-13.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7K)
         aa7M)
      :named
      given-13.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7M)
         aa7O)
      :named
      given-13.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7O)
         aa7Q)
      :named
      given-13.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7Q)
         aa7S)
      :named
      given-13.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7S)
         aa7U)
      :named
      given-13.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7U)
         aa7W)
      :named
      given-13.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7W)
         aa7Y)
      :named
      given-13.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7Y)
         aa80)
      :named
      given-13.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa80)
         aa82)
      :named
      given-13.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa82)
         aa84)
      :named
      given-13.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa84)
         aa86)
      :named
      given-13.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa86)
         aa88)
      :named
      given-13.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa88)
         aa8a)
      :named
      given-13.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8a)
         aa8c)
      :named
      given-13.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8c)
         aa8e)
      :named
      given-13.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8e)
         aa8g)
      :named
      given-13.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8g)
         aa8i)
      :named
      given-13.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8i)
         aa8k)
      :named
      given-13.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8k)
         aa8m)
      :named
      given-13.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8m)
         aa8o)
      :named
      given-13.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa8o)
         aa8q)
      :named
      given-13.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           a9vH)
         aa7g)
      :named
      given-13.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vH
           aa7g)
         aa7i)
      :named
      given-13.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vG
           a9vG)
         aa7e)
      :named
      given-13.38))
(assert
   (!
      (= aa8q aa8s)
      :named
      given-13.39))
(assert
   (!
      (= aa7e aa7i)
      :named
      given-13.40))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_aa8B} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= aa8s a9vH)

; WANTEDS (names)
;  a9vH  <=  b
;  aa8s  <=  fsk_aa8s
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aa8s a9vH))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         aa8s)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7i)
;         aa7m)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7m)
;         aa7o)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7o)
;         aa7q)
;      :named
;      given-13.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7q)
;         aa7s)
;      :named
;      given-13.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7s)
;         aa7u)
;      :named
;      given-13.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7u)
;         aa7w)
;      :named
;      given-13.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7w)
;         aa7y)
;      :named
;      given-13.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7y)
;         aa7A)
;      :named
;      given-13.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7A)
;         aa7C)
;      :named
;      given-13.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7C)
;         aa7E)
;      :named
;      given-13.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7E)
;         aa7G)
;      :named
;      given-13.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7G)
;         aa7I)
;      :named
;      given-13.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7I)
;         aa7K)
;      :named
;      given-13.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7K)
;         aa7M)
;      :named
;      given-13.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7M)
;         aa7O)
;      :named
;      given-13.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7O)
;         aa7Q)
;      :named
;      given-13.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7Q)
;         aa7S)
;      :named
;      given-13.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7S)
;         aa7U)
;      :named
;      given-13.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7U)
;         aa7W)
;      :named
;      given-13.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7W)
;         aa7Y)
;      :named
;      given-13.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7Y)
;         aa80)
;      :named
;      given-13.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa80)
;         aa82)
;      :named
;      given-13.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa82)
;         aa84)
;      :named
;      given-13.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa84)
;         aa86)
;      :named
;      given-13.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa86)
;         aa88)
;      :named
;      given-13.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa88)
;         aa8a)
;      :named
;      given-13.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8a)
;         aa8c)
;      :named
;      given-13.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8c)
;         aa8e)
;      :named
;      given-13.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8e)
;         aa8g)
;      :named
;      given-13.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8g)
;         aa8i)
;      :named
;      given-13.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8i)
;         aa8k)
;      :named
;      given-13.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8k)
;         aa8m)
;      :named
;      given-13.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8m)
;         aa8o)
;      :named
;      given-13.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa8o)
;         aa8q)
;      :named
;      given-13.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           a9vH)
;         aa7g)
;      :named
;      given-13.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vH
;           aa7g)
;         aa7i)
;      :named
;      given-13.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vG
;           a9vG)
;         aa7e)
;      :named
;      given-13.38)
;   (!
;      (= aa8q aa8s)
;      :named
;      given-13.39)
;   (!
;      (= aa7e aa7i)
;      :named
;      given-13.40)
;   (!
;      (not
;         (= aa8s a9vH))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.23
;    given-13.22
;    given-13.21
;    given-13.3
;    given-13.20
;    given-13.19
;    given-13.18
;    given-13.17
;    given-13.16
;    given-13.15
;    given-13.14
;    given-13.13
;    given-13.4
;    given-13.1
;    given-13.9
;    given-13.11
;    given-13.8
;    given-13.6
;    given-13.2
;    given-13.29
;    given-13.30
;    given-13.31
;    given-13.28
;    given-13.27
;    given-13.26
;    given-13.25
;    given-13.24
;    given-13.7
;    given-13.10
;    wanted-13
;    given-13.39
;    given-13.37
;    given-13.36
;    given-13.35
;    given-13.34
;    given-13.33
;    given-13.32
;    given-13.12
;    given-13.5)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] co_aa8S {1}:: One ~ fsk0 (CFunEqCan)
; [G] co_aa8M {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8O {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8Q {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8G {3}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] co_aa8I {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa8E {2}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] co_aa8U {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aa8W {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aa90} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aa8R)
; (*: [a9vP,aa8H],aa8L)
; (*: [a9vP,aa8L],aa8N)
; (*: [a9vP,aa8N],aa8P)
; (*: [a9vP,a9vP],aa8F)
; (*: [a9vP,aa8F],aa8H)
; (*: [a9vO,a9vO],aa8D)
; (aa8P,aa8R)
; (aa8D,aa8H)

; WANTEDS (Thoralf style)
; (aa8R,a9vO)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_aa90} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aa8R a9vO)

; GIVENS (names)
;  a9vO  <=  a
;  a9vP  <=  b
;  aa8D  <=  fsk_aa8D
;  aa8F  <=  fsk_aa8F
;  aa8H  <=  fsk_aa8H
;  aa8L  <=  fsk_aa8L
;  aa8N  <=  fsk_aa8N
;  aa8P  <=  fsk_aa8P
;  aa8R  <=  fsk_aa8R
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9vO (Array String Int))
; (declare-const a9vP (Array String Int))
; (declare-const aa8D (Array String Int))
; (declare-const aa8F (Array String Int))
; (declare-const aa8H (Array String Int))
; (declare-const aa8L (Array String Int))
; (declare-const aa8N (Array String Int))
; (declare-const aa8P (Array String Int))
; (declare-const aa8R (Array String Int))
(declare-const
   a9vO
   (Array String Int))
(declare-const
   a9vP
   (Array String Int))
(declare-const
   aa8D
   (Array String Int))
(declare-const
   aa8F
   (Array String Int))
(declare-const
   aa8H
   (Array String Int))
(declare-const
   aa8L
   (Array String Int))
(declare-const
   aa8N
   (Array String Int))
(declare-const
   aa8P
   (Array String Int))
(declare-const
   aa8R
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aa8R)
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
           a9vP
           aa8H)
         aa8L)
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
           a9vP
           aa8L)
         aa8N)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vP
           aa8N)
         aa8P)
      :named
      given-15.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vP
           a9vP)
         aa8F)
      :named
      given-15.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vP
           aa8F)
         aa8H)
      :named
      given-15.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vO
           a9vO)
         aa8D)
      :named
      given-15.7))
(assert
   (!
      (= aa8P aa8R)
      :named
      given-15.8))
(assert
   (!
      (= aa8D aa8H)
      :named
      given-15.9))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_aa90} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aa8R a9vO)

; WANTEDS (names)
;  a9vO  <=  a
;  aa8R  <=  fsk_aa8R
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aa8R a9vO))
      :named
      wanted-15))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-15")
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
;         aa8R)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vP
;           aa8H)
;         aa8L)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vP
;           aa8L)
;         aa8N)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vP
;           aa8N)
;         aa8P)
;      :named
;      given-15.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vP
;           a9vP)
;         aa8F)
;      :named
;      given-15.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vP
;           aa8F)
;         aa8H)
;      :named
;      given-15.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vO
;           a9vO)
;         aa8D)
;      :named
;      given-15.7)
;   (!
;      (= aa8P aa8R)
;      :named
;      given-15.8)
;   (!
;      (= aa8D aa8H)
;      :named
;      given-15.9)
;   (!
;      (not
;         (= aa8R a9vO))
;      :named
;      wanted-15))
(get-unsat-core)
; (wanted-15
;    given-15.9
;    given-15.8
;    given-15.7
;    given-15.6
;    given-15.5
;    given-15.4
;    given-15.3
;    given-15.1
;    given-15.2)
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] co_aa95 {1}:: One ~ fsk0 (CFunEqCan)
; [G] co_aa93 {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] co_aa96 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aa9a} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aa94)
; (*: [a9vW,a9vW],aa92)
; (aa92,aa94)

; WANTEDS (Thoralf style)
; (aa94,a9vW)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_aa9a} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aa94 a9vW)

; GIVENS (names)
;  a9vW  <=  a
;  aa92  <=  fsk_aa92
;  aa94  <=  fsk_aa94
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9vW (Array String Int))
; (declare-const aa92 (Array String Int))
; (declare-const aa94 (Array String Int))
(declare-const
   a9vW
   (Array String Int))
(declare-const
   aa92
   (Array String Int))
(declare-const
   aa94
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aa94)
      :named
      given-17.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9vW
           a9vW)
         aa92)
      :named
      given-17.2))
(assert
   (!
      (= aa92 aa94)
      :named
      given-17.3))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_aa9a} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aa94 a9vW)

; WANTEDS (names)
;  a9vW  <=  a
;  aa94  <=  fsk_aa94
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aa94 a9vW))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
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
;         aa94)
;      :named
;      given-17.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9vW
;           a9vW)
;         aa92)
;      :named
;      given-17.2)
;   (!
;      (= aa92 aa94)
;      :named
;      given-17.3)
;   (!
;      (not
;         (= aa94 a9vW))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.2 given-17.1 wanted-17 given-17.3)
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] co_aa9i {2}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] co_aa9d {1}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] co_aa9e {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_aa9k {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a9wa} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [a9w3,a9w3],aa9h)
; (*: [a9w3,a9w4],aa9c)
; (aa9c,a9w2)
; (aa9h,a9w3)

; WANTEDS (Thoralf style)
; (a9w2,a9w4)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a9wa} {0}:: u ~ w (CNonCanonical)
;  =>  (= a9w2 a9w4)

; GIVENS (names)
;  a9w2  <=  u
;  a9w3  <=  v
;  a9w4  <=  w
;  aa9c  <=  fsk_aa9c
;  aa9h  <=  fsk_aa9h
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9w2 (Array String Int))
; (declare-const a9w3 (Array String Int))
; (declare-const a9w4 (Array String Int))
; (declare-const aa9c (Array String Int))
; (declare-const aa9h (Array String Int))
(declare-const
   a9w2
   (Array String Int))
(declare-const
   a9w3
   (Array String Int))
(declare-const
   a9w4
   (Array String Int))
(declare-const
   aa9c
   (Array String Int))
(declare-const
   aa9h
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
           a9w3
           a9w3)
         aa9h)
      :named
      given-19.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9w3
           a9w4)
         aa9c)
      :named
      given-19.2))
(assert
   (!
      (= aa9c a9w2)
      :named
      given-19.3))
(assert
   (!
      (= aa9h a9w3)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a9wa} {0}:: u ~ w (CNonCanonical)
;  =>  (= a9w2 a9w4)

; WANTEDS (names)
;  a9w2  <=  u
;  a9w4  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a9w2 a9w4))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
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
;           a9w3
;           a9w3)
;         aa9h)
;      :named
;      given-19.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9w3
;           a9w4)
;         aa9c)
;      :named
;      given-19.2)
;   (!
;      (= aa9c a9w2)
;      :named
;      given-19.3)
;   (!
;      (= aa9h a9w3)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= a9w2 a9w4))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.1 given-19.2 given-19.4 given-19.3 wanted-19)
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] co_aa9o {1}:: One ~ fsk0 (CFunEqCan)
; [G] co_aa9u {3}:: Base "kg" ~ fsk0 (CFunEqCan)
; [G] co_aa9q {2}:: (w *: w) ~ fsk0 (CFunEqCan)
; [G] co_aa9w {2}:: (fsk0 *: fsk0) ~ fsk1 (CFunEqCan)
; [G] co_aa9y {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_aa9s {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_aa9A {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aa9E} {2}:: fsk0 ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aa9n)
; (Base ["kg"],aa9t)
; (*: [a9wc,a9wc],aa9p)
; (*: [aa9t,aa9t],aa9v)
; (/: [aa9n,aa9v],aa9x)
; (/: [aa9n,aa9p],aa9r)
; (aa9r,aa9x)

; WANTEDS (Thoralf style)
; (aa9t,a9wc)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{co_aa9E} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= aa9t a9wc)

; GIVENS (names)
;  a9wc  <=  w
;  aa9n  <=  fsk_aa9n
;  aa9p  <=  fsk_aa9p
;  aa9r  <=  fsk_aa9r
;  aa9t  <=  fsk_aa9t
;  aa9v  <=  fsk_aa9v
;  aa9x  <=  fsk_aa9x
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9wc (Array String Int))
; (declare-const aa9n (Array String Int))
; (declare-const aa9p (Array String Int))
; (declare-const aa9r (Array String Int))
; (declare-const aa9t (Array String Int))
; (declare-const aa9v (Array String Int))
; (declare-const aa9x (Array String Int))
(declare-const
   a9wc
   (Array String Int))
(declare-const
   aa9n
   (Array String Int))
(declare-const
   aa9p
   (Array String Int))
(declare-const
   aa9r
   (Array String Int))
(declare-const
   aa9t
   (Array String Int))
(declare-const
   aa9v
   (Array String Int))
(declare-const
   aa9x
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aa9n)
      :named
      given-21.1))
(assert
   (!
      (=
         (store base "kg" one)
         aa9t)
      :named
      given-21.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9wc
           a9wc)
         aa9p)
      :named
      given-21.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aa9t
           aa9t)
         aa9v)
      :named
      given-21.4))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aa9n
           aa9v)
         aa9x)
      :named
      given-21.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aa9n
           aa9p)
         aa9r)
      :named
      given-21.6))
(assert
   (!
      (= aa9r aa9x)
      :named
      given-21.7))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{co_aa9E} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= aa9t a9wc)

; WANTEDS (names)
;  a9wc  <=  w
;  aa9t  <=  fsk_aa9t
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aa9t a9wc))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
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
;         aa9n)
;      :named
;      given-21.1)
;   (!
;      (=
;         (store base "kg" one)
;         aa9t)
;      :named
;      given-21.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9wc
;           a9wc)
;         aa9p)
;      :named
;      given-21.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aa9t
;           aa9t)
;         aa9v)
;      :named
;      given-21.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           aa9n
;           aa9v)
;         aa9x)
;      :named
;      given-21.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           aa9n
;           aa9p)
;         aa9r)
;      :named
;      given-21.6)
;   (!
;      (= aa9r aa9x)
;      :named
;      given-21.7)
;   (!
;      (not
;         (= aa9t a9wc))
;      :named
;      wanted-21))
(get-unsat-core)
; (given-21.4
;    given-21.5
;    given-21.3
;    given-21.6
;    given-21.7
;    given-21.2
;    wanted-21)
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")
Parse Failed
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-27")
(echo "solver-finish-cycle-27")
(echo "solver-start-cycle-28")
(echo "solver-finish-cycle-28")
(echo "solver-start-cycle-29")
(echo "solver-finish-cycle-29")
(echo "solver-start-cycle-30")
(echo "solver-finish-cycle-30")
(echo "solver-start-cycle-31")
(echo "solver-finish-cycle-31")
(echo "solver-start-cycle-32")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aahe} {6}:: (fsk0 /: fsk0) ~ fsk0 (CNonCanonical)
; [WD] hole{co_aah6} {6}:: ((fsk0 *: (fsk1 *: (fsk1 *: fsk2)))
;                           /: fsk2)
;                          ~ fsk3 (CNonCanonical)
; [WD] hole{co_aahb} {5}:: ((fsk1 *: fsk0) /: fsk0)
;                          ~ fsk1 (CNonCanonical)
; [WD] hole{co_aahh} {6}:: ((fsk0 *: fsk2) /: (fsk1 *: fsk2))
;                          ~ fsk3 (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [aa2X,aa2X],aa2X)
; (/: [*: [aa2N,*: [aa2P,*: [aa2P,aa2X]]],aa2X],aa2T)
; (/: [*: [aa2N,aa2X],aa2X],aa2N)
; (/: [*: [aa2N,aa2X],*: [aa2P,aa2X]],aa31)

(echo "givens-start-cycle-32")
; GIVENS (conversions)
;      [WD] hole{co_aahe} {6}:: (fsk0 /: fsk0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aa2X
;      aa2X)
;    aa2X)

;      [WD] hole{co_aah6} {6}:: ((fsk0 *: (fsk1 *: (fsk1 *: fsk2)))
;                                /: fsk2)
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aa2P
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aa2P
;            aa2X)))
;      aa2X)
;    aa2T)

;      [WD] hole{co_aahb} {5}:: ((fsk1 *: fsk0) /: fsk0)
;                               ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      aa2X)
;    aa2N)

;      [WD] hole{co_aahh} {6}:: ((fsk0 *: fsk2) /: (fsk1 *: fsk2))
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2P
;        aa2X))
;    aa31)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-32")
(echo "wanteds-start-cycle-32")
; WANTEDS (conversions)
;      [WD] hole{co_aahe} {6}:: (fsk0 /: fsk0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aa2X
;      aa2X)
;    aa2X)

;      [WD] hole{co_aah6} {6}:: ((fsk0 *: (fsk1 *: (fsk1 *: fsk2)))
;                                /: fsk2)
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aa2P
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aa2P
;            aa2X)))
;      aa2X)
;    aa2T)

;      [WD] hole{co_aahb} {5}:: ((fsk1 *: fsk0) /: fsk0)
;                               ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      aa2X)
;    aa2N)

;      [WD] hole{co_aahh} {6}:: ((fsk0 *: fsk2) /: (fsk1 *: fsk2))
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2P
;        aa2X))
;    aa31)

; WANTEDS (names)
;  aa2N  <=  fsk_aa2N
;  aa2P  <=  fsk_aa2P
;  aa2T  <=  fsk_aa2T
;  aa2X  <=  fsk_aa2X
;  aa31  <=  fsk_aa31
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aa2N (Array String Int))
; (declare-const aa2P (Array String Int))
; (declare-const aa2T (Array String Int))
; (declare-const aa2X (Array String Int))
; (declare-const aa31 (Array String Int))
(declare-const
   aa2N
   (Array String Int))
(declare-const
   aa2P
   (Array String Int))
(declare-const
   aa2T
   (Array String Int))
(declare-const
   aa2X
   (Array String Int))
(declare-const
   aa31
   (Array String Int))
(assert
   (!
      (or
         (or
            (or
               (not
                  (=
                     (
                       (_
                          map
                          (-
                             (Int Int)
                             Int))
                       aa2X
                       aa2X)
                     aa2X))
               (not
                  (=
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
                         aa2N
                         (
                           (_
                              map
                              (+
                                 (Int Int)
                                 Int))
                           aa2P
                           (
                             (_
                                map
                                (+
                                   (Int Int)
                                   Int))
                             aa2P
                             aa2X)))
                       aa2X)
                     aa2T)))
            (not
               (=
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
                      aa2N
                      aa2X)
                    aa2X)
                  aa2N)))
         (not
            (=
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
                   aa2N
                   aa2X)
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aa2P
                   aa2X))
               aa31)))
      :named
      wanted-32))
(check-sat)
; sat
(echo "wanteds-finish-cycle-32")
(get-model)
; (
;   (define-fun
;      aa2N
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         10450))
;   (define-fun
;      aa2X
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         5853))
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
;      wanted-32
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (=
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
;                     aa2N
;                     aa2P
;                     (
;                       (_
;                          map
;                          (+
;                             (Int Int)
;                             Int))
;                       aa2P
;                       aa2X))
;                   aa2X)
;                 aa2T))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_
;                         map
;                         (-
;                            (Int Int)
;                            Int))
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aa2N
;                        aa2X)
;                      aa2X)
;                    aa2N)))
;           (a!3
;              (not
;                 (=
;                    (
;                      (_
;                         map
;                         (-
;                            (Int Int)
;                            Int))
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aa2N
;                        aa2X)
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aa2P
;                        aa2X))
;                    aa31))))
;         (or
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (-
;                          (Int Int)
;                          Int))
;                    aa2X
;                    aa2X)
;                  aa2X))
;            (not a!1)
;            a!2
;            a!3)))
;   (define-fun
;      aa2T
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           5)
;         "!0!"
;         11))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aa2P
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         30612))
;   (define-fun
;      aa31
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
(echo "solver-finish-cycle-32")
(echo "solver-start-cycle-33")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aahB} {6}:: ((fsk1 *: fsk0) /: fsk0)
;                          ~ fsk1 (CNonCanonical)
; [WD] hole{co_aahn} {7}:: (fsk0 /: fsk0) ~ fsk0 (CNonCanonical)
; [WD] hole{co_aahw} {7}:: ((fsk0 *: (fsk1 *: (fsk1 *: fsk2)))
;                           /: fsk2)
;                          ~ fsk3 (CNonCanonical)
; [WD] hole{co_aahE} {7}:: ((fsk0 *: fsk2) /: (fsk1 *: fsk2))
;                          ~ fsk3 (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [*: [aa2N,aa2X],aa2X],aa2N)
; (/: [aa2X,aa2X],aa2X)
; (/: [*: [aa2N,*: [aa2P,*: [aa2P,aa2X]]],aa2X],aa2T)
; (/: [*: [aa2N,aa2X],*: [aa2P,aa2X]],aa31)

(echo "givens-start-cycle-33")
; GIVENS (conversions)
;      [WD] hole{co_aahB} {6}:: ((fsk1 *: fsk0) /: fsk0)
;                               ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      aa2X)
;    aa2N)

;      [WD] hole{co_aahn} {7}:: (fsk0 /: fsk0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aa2X
;      aa2X)
;    aa2X)

;      [WD] hole{co_aahw} {7}:: ((fsk0 *: (fsk1 *: (fsk1 *: fsk2)))
;                                /: fsk2)
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aa2P
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aa2P
;            aa2X)))
;      aa2X)
;    aa2T)

;      [WD] hole{co_aahE} {7}:: ((fsk0 *: fsk2) /: (fsk1 *: fsk2))
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2P
;        aa2X))
;    aa31)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-33")
(echo "wanteds-start-cycle-33")
; WANTEDS (conversions)
;      [WD] hole{co_aahB} {6}:: ((fsk1 *: fsk0) /: fsk0)
;                               ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      aa2X)
;    aa2N)

;      [WD] hole{co_aahn} {7}:: (fsk0 /: fsk0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aa2X
;      aa2X)
;    aa2X)

;      [WD] hole{co_aahw} {7}:: ((fsk0 *: (fsk1 *: (fsk1 *: fsk2)))
;                                /: fsk2)
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aa2P
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aa2P
;            aa2X)))
;      aa2X)
;    aa2T)

;      [WD] hole{co_aahE} {7}:: ((fsk0 *: fsk2) /: (fsk1 *: fsk2))
;                               ~ fsk3 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2N
;        aa2X)
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aa2P
;        aa2X))
;    aa31)

; WANTEDS (names)
;  aa2N  <=  fsk_aa2N
;  aa2P  <=  fsk_aa2P
;  aa2T  <=  fsk_aa2T
;  aa2X  <=  fsk_aa2X
;  aa31  <=  fsk_aa31
; DECS2 (seen) 
; (declare-const aa2N (Array String Int))
; (declare-const aa2P (Array String Int))
; (declare-const aa2T (Array String Int))
; (declare-const aa2X (Array String Int))
; (declare-const aa31 (Array String Int))
; DECS2 (unseen) 
(declare-const
   aa2N
   (Array String Int))
(declare-const
   aa2P
   (Array String Int))
(declare-const
   aa2T
   (Array String Int))
(declare-const
   aa2X
   (Array String Int))
(declare-const
   aa31
   (Array String Int))
(assert
   (!
      (or
         (or
            (or
               (not
                  (=
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
                         aa2N
                         aa2X)
                       aa2X)
                     aa2N))
               (not
                  (=
                     (
                       (_
                          map
                          (-
                             (Int Int)
                             Int))
                       aa2X
                       aa2X)
                     aa2X)))
            (not
               (=
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
                      aa2N
                      (
                        (_
                           map
                           (+
                              (Int Int)
                              Int))
                        aa2P
                        (
                          (_
                             map
                             (+
                                (Int Int)
                                Int))
                          aa2P
                          aa2X)))
                    aa2X)
                  aa2T)))
         (not
            (=
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
                   aa2N
                   aa2X)
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aa2P
                   aa2X))
               aa31)))
      :named
      wanted-33))
(check-sat)
; sat
(echo "wanteds-finish-cycle-33")
(get-model)
; (
;   (define-fun
;      aa2N
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         1142))
;   (define-fun
;      aa2X
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         281))
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
;      aa31
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           6)
;         "!0!"
;         11))
;   (define-fun
;      wanted-33
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
;                         (-
;                            (Int Int)
;                            Int))
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aa2N
;                        aa2X)
;                      aa2X)
;                    aa2N)))
;           (a!2
;              (=
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
;                     aa2N
;                     aa2P
;                     (
;                       (_
;                          map
;                          (+
;                             (Int Int)
;                             Int))
;                       aa2P
;                       aa2X))
;                   aa2X)
;                 aa2T))
;           (a!3
;              (not
;                 (=
;                    (
;                      (_
;                         map
;                         (-
;                            (Int Int)
;                            Int))
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aa2N
;                        aa2X)
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aa2P
;                        aa2X))
;                    aa31))))
;         (or
;            a!1
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (-
;                          (Int Int)
;                          Int))
;                    aa2X
;                    aa2X)
;                  aa2X))
;            (not a!2)
;            a!3)))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aa2P
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         28100))
;   (define-fun
;      exp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aa2T
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0)))
(pop 1)
(echo "solver-finish-cycle-33")
(exit)
