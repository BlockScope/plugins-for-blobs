; Compiling Abelian
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
; [WD] hole{co_aZj} {0}:: (u_aZi[tau:1] *: (One /: u_aZi[tau:1]))
;                         ~# (u_aZg[sk:1] *: (One /: u_aZg[sk:1])) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [aZi,/: [One [],aZi]],*: [aZg,/: [One [],aZg]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aZj} {0}:: (u_aZi[tau:1]
;                               *: (One /: u_aZi[tau:1]))
;                              ~# (u_aZg[sk:1] *: (One /: u_aZg[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZi
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
;        aZi))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZg
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
;        aZg)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_aZj} {0}:: (u_aZi[tau:1]
;                               *: (One /: u_aZi[tau:1]))
;                              ~# (u_aZg[sk:1] *: (One /: u_aZg[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZi
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
;        aZi))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZg
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
;        aZg)))

; WANTEDS (names)
;  aZg  <=  u_aZg[sk:1]
;  aZi  <=  u_aZi[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aZg (Array String Int))
; (declare-const aZi (Array String Int))
(declare-const
   aZg
   (Array String Int))
(declare-const
   aZi
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
              aZi
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
                aZi))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aZg
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
                aZg))))
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
;              aZi
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
;                aZi))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aZg
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
;                aZg))))
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
; [WD] hole{co_aZQ} {0}:: (u_aZO[tau:1] *: v_aZP[tau:1])
;                         ~# (u_aZL[sk:1] *: v_aZM[sk:1]) (CNonCanonical)
; [WD] hole{co_aZR} {0}:: (v_aZP[tau:1] *: u_aZO[tau:1])
;                         ~# (v_aZM[sk:1] *: u_aZL[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [aZO,aZP],*: [aZL,aZM])
; (*: [aZP,aZO],*: [aZM,aZL])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aZQ} {0}:: (u_aZO[tau:1] *: v_aZP[tau:1])
;                              ~# (u_aZL[sk:1] *: v_aZM[sk:1]) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZO
;      aZP)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZL
;      aZM))

;      [WD] hole{co_aZR} {0}:: (v_aZP[tau:1] *: u_aZO[tau:1])
;                              ~# (v_aZM[sk:1] *: u_aZL[sk:1]) (CNonCanonical)
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

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aZQ} {0}:: (u_aZO[tau:1] *: v_aZP[tau:1])
;                              ~# (u_aZL[sk:1] *: v_aZM[sk:1]) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZO
;      aZP)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aZL
;      aZM))

;      [WD] hole{co_aZR} {0}:: (v_aZP[tau:1] *: u_aZO[tau:1])
;                              ~# (v_aZM[sk:1] *: u_aZL[sk:1]) (CNonCanonical)
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

; WANTEDS (names)
;  aZL  <=  u_aZL[sk:1]
;  aZM  <=  v_aZM[sk:1]
;  aZO  <=  u_aZO[tau:1]
;  aZP  <=  v_aZP[tau:1]
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
                 aZO
                 aZP)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aZL
                 aZM)))
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
                 aZL))))
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
;                 aZO
;                 aZP)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aZL
;                 aZM)))
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
;                 aZL)))))
;   (define-fun
;      aZO
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         10450))
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
;           11797)
;         "!0!"
;         32285))
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
;           0)
;         "!0!"
;         30199))
;   (define-fun
;      aZL
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           8855)
;         "!0!"
;         8365))
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
; [WD] hole{co_a10c} {0}:: (u_a109[tau:1]
;                           *: (v_a10a[tau:1] *: w_a10b[tau:1]))
;                          ~# (u_a105[sk:1] *: (v_a106[sk:1] *: w_a107[sk:1])) (CNonCanonical)
; [WD] hole{co_a10d} {0}:: ((u_a109[tau:1] *: v_a10a[tau:1])
;                           *: w_a10b[tau:1])
;                          ~# ((u_a105[sk:1] *: v_a106[sk:1]) *: w_a107[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a109,*: [a10a,a10b]],*: [a105,*: [a106,a107]])
; (*: [*: [a109,a10a],a10b],*: [*: [a105,a106],a107])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a10c} {0}:: (u_a109[tau:1]
;                                *: (v_a10a[tau:1] *: w_a10b[tau:1]))
;                               ~# (u_a105[sk:1] *: (v_a106[sk:1] *: w_a107[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a109
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10a
;        a10b))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a105
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a106
;        a107)))

;      [WD] hole{co_a10d} {0}:: ((u_a109[tau:1] *: v_a10a[tau:1])
;                                *: w_a10b[tau:1])
;                               ~# ((u_a105[sk:1] *: v_a106[sk:1]) *: w_a107[sk:1]) (CNonCanonical)
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
;        a109
;        a10a)
;      a10b)
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
;        a105
;        a106)
;      a107))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a10c} {0}:: (u_a109[tau:1]
;                                *: (v_a10a[tau:1] *: w_a10b[tau:1]))
;                               ~# (u_a105[sk:1] *: (v_a106[sk:1] *: w_a107[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a109
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10a
;        a10b))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a105
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a106
;        a107)))

;      [WD] hole{co_a10d} {0}:: ((u_a109[tau:1] *: v_a10a[tau:1])
;                                *: w_a10b[tau:1])
;                               ~# ((u_a105[sk:1] *: v_a106[sk:1]) *: w_a107[sk:1]) (CNonCanonical)
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
;        a109
;        a10a)
;      a10b)
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
;        a105
;        a106)
;      a107))

; WANTEDS (names)
;  a105  <=  u_a105[sk:1]
;  a106  <=  v_a106[sk:1]
;  a107  <=  w_a107[sk:1]
;  a109  <=  u_a109[tau:1]
;  a10a  <=  v_a10a[tau:1]
;  a10b  <=  w_a10b[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a105 (Array String Int))
; (declare-const a106 (Array String Int))
; (declare-const a107 (Array String Int))
; (declare-const a109 (Array String Int))
; (declare-const a10a (Array String Int))
; (declare-const a10b (Array String Int))
(declare-const
   a105
   (Array String Int))
(declare-const
   a106
   (Array String Int))
(declare-const
   a107
   (Array String Int))
(declare-const
   a109
   (Array String Int))
(declare-const
   a10a
   (Array String Int))
(declare-const
   a10b
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
                 a109
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a10a
                   a10b))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a105
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a106
                   a107))))
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
                   a109
                   a10a)
                 a10b)
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
                   a105
                   a106)
                 a107))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a10a
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
;      a106
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
;                 a109
;                 a10a
;                 a10b)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a105
;                 a106
;                 a107)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a109
;                 a10a
;                 a10b)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a105
;                 a106
;                 a107)))))
;   (define-fun
;      a105
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
;      a107
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
;      a10b
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
;      a109
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
; [WD] hole{co_a10U} {0}:: (Base b_a10i[sk:1] /: Base b_a10i[sk:1])
;                          ~# One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a10i],Base [a10i]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a10U} {0}:: (Base b_a10i[sk:1]
;                                /: Base b_a10i[sk:1])
;                               ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a10i one)
;      (store base a10i one))
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
;      [WD] hole{co_a10U} {0}:: (Base b_a10i[sk:1]
;                                /: Base b_a10i[sk:1])
;                               ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a10i one)
;      (store base a10i one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a10i  <=  b_a10i[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10i String)
(declare-const a10i String)
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
              (store base a10i one)
              (store base a10i one))
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
;              (store base a10i one)
;              (store base a10i one))
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
; [WD] hole{co_a10V} {0}:: (u_a10r[sk:1] *: (One /: u_a10r[sk:1]))
;                          ~# One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a10r,/: [One [],a10r]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a10V} {0}:: (u_a10r[sk:1]
;                                *: (One /: u_a10r[sk:1]))
;                               ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10r
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
;        a10r))
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
;      [WD] hole{co_a10V} {0}:: (u_a10r[sk:1]
;                                *: (One /: u_a10r[sk:1]))
;                               ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10r
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
;        a10r))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a10r  <=  u_a10r[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10r (Array String Int))
(declare-const
   a10r
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
              a10r
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
                a10r))
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
;              a10r
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
;                a10r))
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
; [WD] hole{co_a10X} {1}:: (u_a10y[sk:1] *: One)
;                          ~# u_a10y[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a10y,One []],a10y)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a10X} {1}:: (u_a10y[sk:1] *: One)
;                               ~# u_a10y[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10y
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a10y)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a10X} {1}:: (u_a10y[sk:1] *: One)
;                               ~# u_a10y[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10y
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a10y)

; WANTEDS (names)
;  a10y  <=  u_a10y[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10y (Array String Int))
(declare-const
   a10y
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
              a10y
              (
                (as
                   const
                   (Array String Int))
                0))
            a10y))
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
;              a10y
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a10y))
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
; [WD] hole{co_a10Y} {0}:: (u_a10E[sk:1] *: v_a10F[sk:1])
;                          ~# (v_a10F[sk:1] *: u_a10E[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a10E,a10F],*: [a10F,a10E])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a10Y} {0}:: (u_a10E[sk:1] *: v_a10F[sk:1])
;                               ~# (v_a10F[sk:1] *: u_a10E[sk:1]) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10E
;      a10F)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10F
;      a10E))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a10Y} {0}:: (u_a10E[sk:1] *: v_a10F[sk:1])
;                               ~# (v_a10F[sk:1] *: u_a10E[sk:1]) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10E
;      a10F)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10F
;      a10E))

; WANTEDS (names)
;  a10E  <=  u_a10E[sk:1]
;  a10F  <=  v_a10F[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10E (Array String Int))
; (declare-const a10F (Array String Int))
(declare-const
   a10E
   (Array String Int))
(declare-const
   a10F
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
              a10E
              a10F)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a10F
              a10E)))
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
;              a10E
;              a10F)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a10F
;              a10E)))
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
; [WD] hole{co_a10Z} {0}:: (u_a10M[sk:1]
;                           *: (v_a10N[sk:1] *: w_a10O[sk:1]))
;                          ~# ((u_a10M[sk:1] *: v_a10N[sk:1]) *: w_a10O[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a10M,*: [a10N,a10O]],*: [*: [a10M,a10N],a10O])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a10Z} {0}:: (u_a10M[sk:1]
;                                *: (v_a10N[sk:1] *: w_a10O[sk:1]))
;                               ~# ((u_a10M[sk:1] *: v_a10N[sk:1]) *: w_a10O[sk:1]) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10M
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10N
;        a10O))
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
;        a10M
;        a10N)
;      a10O))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a10Z} {0}:: (u_a10M[sk:1]
;                                *: (v_a10N[sk:1] *: w_a10O[sk:1]))
;                               ~# ((u_a10M[sk:1] *: v_a10N[sk:1]) *: w_a10O[sk:1]) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a10M
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a10N
;        a10O))
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
;        a10M
;        a10N)
;      a10O))

; WANTEDS (names)
;  a10M  <=  u_a10M[sk:1]
;  a10N  <=  v_a10N[sk:1]
;  a10O  <=  w_a10O[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a10M (Array String Int))
; (declare-const a10N (Array String Int))
; (declare-const a10O (Array String Int))
(declare-const
   a10M
   (Array String Int))
(declare-const
   a10N
   (Array String Int))
(declare-const
   a10O
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
              a10M
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a10N
                a10O))
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
                a10M
                a10N)
              a10O)))
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
;              a10M
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a10N
;                a10O))
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
;                a10M
;                a10N)
;              a10O)))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; Compiling UnitDefs
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
; [WD] hole{co_a7Fv} {1}:: One
;                          ~# (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a7Fv} {1}:: One
;                               ~# (Base "cd" /: Base "cd") (CNonCanonical)
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
;      [WD] hole{co_a7Fv} {1}:: One
;                               ~# (Base "cd" /: Base "cd") (CNonCanonical)
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
; [WD] hole{co_a7FH} {1}:: One
;                          ~# (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a7FH} {1}:: One
;                               ~# (Base "mol" /: Base "mol") (CNonCanonical)
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
;      [WD] hole{co_a7FH} {1}:: One
;                               ~# (Base "mol" /: Base "mol") (CNonCanonical)
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
; [WD] hole{co_a7FT} {1}:: One
;                          ~# (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a7FT} {1}:: One
;                               ~# (Base "K" /: Base "K") (CNonCanonical)
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
;      [WD] hole{co_a7FT} {1}:: One
;                               ~# (Base "K" /: Base "K") (CNonCanonical)
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
; [WD] hole{co_a7G5} {1}:: One
;                          ~# (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a7G5} {1}:: One
;                               ~# (Base "A" /: Base "A") (CNonCanonical)
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
;      [WD] hole{co_a7G5} {1}:: One
;                               ~# (Base "A" /: Base "A") (CNonCanonical)
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
; [WD] hole{co_a7Gh} {1}:: One
;                          ~# (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a7Gh} {1}:: One
;                               ~# (Base "s" /: Base "s") (CNonCanonical)
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
;      [WD] hole{co_a7Gh} {1}:: One
;                               ~# (Base "s" /: Base "s") (CNonCanonical)
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
; [WD] hole{co_a7Gt} {1}:: One
;                          ~# (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a7Gt} {1}:: One
;                               ~# (Base "kg" /: Base "kg") (CNonCanonical)
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
;      [WD] hole{co_a7Gt} {1}:: One
;                               ~# (Base "kg" /: Base "kg") (CNonCanonical)
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
; [WD] hole{co_a7GF} {1}:: One
;                          ~# (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a7GF} {1}:: One
;                               ~# (Base "m" /: Base "m") (CNonCanonical)
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
;      [WD] hole{co_a7GF} {1}:: One
;                               ~# (Base "m" /: Base "m") (CNonCanonical)
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
; Compiling Literal
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
; [WD] irred_a7Xs {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a7Xs {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] irred_a7Xs {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] irred_a7Xs {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
; Compiling ErrorTests
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
; [G] co_a8Z4 {0}:: (One *: a_a8YW[sk:1])
;                   ~# (b_a8YX[sk:1] *: One) (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_a8Z8} {2}:: (b_a8Z0[tau:1] *: One)
;                          ~# (b_a8YX[sk:1] *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [One [],a8YW],*: [a8YX,One []])

; WANTEDS (Thoralf style)
; (*: [a8Z0,One []],*: [a8YX,One []])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a8Z8} {2}:: (b_a8Z0[tau:1] *: One)
;                               ~# (b_a8YX[sk:1] *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a8Z0
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
;      a8YX
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; GIVENS (names)
;  a8YW  <=  a_a8YW[sk:1]
;  a8YX  <=  b_a8YX[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a8YW (Array String Int))
; (declare-const a8YX (Array String Int))
(declare-const
   a8YW
   (Array String Int))
(declare-const
   a8YX
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
           (
             (as
                const
                (Array String Int))
             0)
           a8YW)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a8YX
           (
             (as
                const
                (Array String Int))
             0)))
      :named
      given-1.1))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_a8Z8} {2}:: (b_a8Z0[tau:1] *: One)
;                               ~# (b_a8YX[sk:1] *: One) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a8Z0
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
;      a8YX
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  a8YX  <=  b_a8YX[sk:1]
;  a8Z0  <=  b_a8Z0[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a8Z0 (Array String Int))
(declare-const
   a8Z0
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
              a8Z0
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
              a8YX
              (
                (as
                   const
                   (Array String Int))
                0))))
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
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           (
;             (as
;                const
;                (Array String Int))
;             0)
;           a8YW)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a8YX
;           (
;             (as
;                const
;                (Array String Int))
;             0))))
;   (define-fun
;      a8YW
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         6))
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
;      a8YX
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         6))
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
;              a8Z0
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
;              a8YX
;              (
;                (as
;                   const
;                   (Array String Int))
;                0)))))
;   (define-fun
;      a8Z0
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           38)
;         "!0!"
;         5))
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
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_a90l {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a90l {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] irred_a90l {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a90l {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a917 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a917 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] irred_a917 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a917 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a91T {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a91T {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] irred_a91T {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a91T {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a92F {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a92F {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] irred_a92F {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a92F {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a93r {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a93r {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] irred_a93r {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a93r {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a94d {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a94d {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] irred_a94d {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a94d {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a94Z {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a94Z {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] irred_a94Z {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a94Z {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a95L {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a95L {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_a95L {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a95L {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a96x {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a96x {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_a96x {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a96x {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a97j {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a97j {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_a97j {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a97j {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a985 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a985 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] irred_a985 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a985 {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [WD] irred_a98R {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_a98R {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(irred))

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] irred_a98R {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
;      [WD] irred_a98R {0}:: Base "m"
;                            ~~ (One *: Base "m") (CIrredCan(irred))
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
; [G] co_a9NC {1}:: (a_a99z[sk:1] *: a_a99z[sk:1])
;                   ~# (b_a99A[sk:1] *: (b_a99A[sk:1] *: b_a99A[sk:1])) (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_a9NG} {3}:: Base "s" ~# a_a99z[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [a99z,a99z],*: [a99A,*: [a99A,a99A]])

; WANTEDS (Thoralf style)
; (Base ["s"],a99z)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_a9NG} {3}:: Base "s"
;                               ~# a_a99z[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    a99z)

; GIVENS (names)
;  a99z  <=  a_a99z[sk:1]
;  a99A  <=  b_a99A[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a99A (Array String Int))
; (declare-const a99z (Array String Int))
(declare-const
   a99z
   (Array String Int))
(declare-const
   a99A
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
           a99z
           a99z)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a99A
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             a99A
             a99A)))
      :named
      given-14.1))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_a9NG} {3}:: Base "s"
;                               ~# a_a99z[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    a99z)

; WANTEDS (names)
;  a99z  <=  a_a99z[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            a99z))
      :named
      wanted-14))
(check-sat)
; sat
(echo "wanteds-finish-cycle-14")
(get-model)
; (
;   (define-fun
;      a99A
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
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2)
;         ""
;         7))
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
;         ""
;         7))
;   (define-fun
;      a99z
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
;           a99z
;           a99z)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a99A
;           a99A
;           a99A)))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-14
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            a99z)))
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
; [G] co_a9NI {0}:: (One *: a_a9a0[sk:1])
;                   ~# (b_a9a1[sk:1] *: One) (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_a9NL} {2}:: Base "kg" ~# a_a9a0[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [One [],a9a0],*: [a9a1,One []])

; WANTEDS (Thoralf style)
; (Base ["kg"],a9a0)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_a9NL} {2}:: Base "kg"
;                               ~# a_a9a0[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    a9a0)

; GIVENS (names)
;  a9a0  <=  a_a9a0[sk:1]
;  a9a1  <=  b_a9a1[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9a0 (Array String Int))
; (declare-const a9a1 (Array String Int))
(declare-const
   a9a0
   (Array String Int))
(declare-const
   a9a1
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
           (
             (as
                const
                (Array String Int))
             0)
           a9a0)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9a1
           (
             (as
                const
                (Array String Int))
             0)))
      :named
      given-15.1))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_a9NL} {2}:: Base "kg"
;                               ~# a_a9a0[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    a9a0)

; WANTEDS (names)
;  a9a0  <=  a_a9a0[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            a9a0))
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
;            a9a0)))
;   (define-fun
;      a9a0
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "kg"
;         5))
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
;      a9a1
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "kg"
;         5))
;   (define-fun
;      given-15.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           (
;             (as
;                const
;                (Array String Int))
;             0)
;           a9a0)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9a1
;           (
;             (as
;                const
;                (Array String Int))
;             0))))
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
; [G] co_a9NM {0}:: (One *: a_a9a8[sk:1])
;                   ~# (a_a9a8[sk:1] *: One) (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_a9NP} {2}:: Base "kg" ~# a_a9a8[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [One [],a9a8],*: [a9a8,One []])

; WANTEDS (Thoralf style)
; (Base ["kg"],a9a8)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a9NP} {2}:: Base "kg"
;                               ~# a_a9a8[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    a9a8)

; GIVENS (names)
;  a9a8  <=  a_a9a8[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a9a8 (Array String Int))
(declare-const
   a9a8
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
           (
             (as
                const
                (Array String Int))
             0)
           a9a8)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           a9a8
           (
             (as
                const
                (Array String Int))
             0)))
      :named
      given-16.1))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a9NP} {2}:: Base "kg"
;                               ~# a_a9a8[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    a9a8)

; WANTEDS (names)
;  a9a8  <=  a_a9a8[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            a9a8))
      :named
      wanted-16))
(check-sat)
; sat
(echo "wanteds-finish-cycle-16")
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
;         "k"
;         3))
;   (define-fun
;      given-16.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           (
;             (as
;                const
;                (Array String Int))
;             0)
;           a9a8)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           a9a8
;           (
;             (as
;                const
;                (Array String Int))
;             0))))
;   (define-fun
;      wanted-16
;      ()
;      Bool
;      (not
;         (=
;            (store base "kg" one)
;            a9a8)))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a9a8
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           7719)
;         "k"
;         4))
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
; [WD] hole{co_a9NR} {1}:: Base "m" ~# Base "s" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["m"],Base ["s"])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a9NR} {1}:: Base "m" ~# Base "s" (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (store base "s" one))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a9NR} {1}:: Base "m" ~# Base "s" (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (store base "s" one))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "m" one)
            (store base "s" one)))
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
;            (store base "m" one)
;            (store base "s" one))))
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
; [WD] hole{co_a9NV} {1}:: (Base "m" /: Base "s")
;                          ~# (Base "s" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base ["m"],Base ["s"]],/: [Base ["s"],Base ["m"]])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{co_a9NV} {1}:: (Base "m" /: Base "s")
;                               ~# (Base "s" /: Base "m") (CNonCanonical)
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
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
;      [WD] hole{co_a9NV} {1}:: (Base "m" /: Base "s")
;                               ~# (Base "s" /: Base "m") (CNonCanonical)
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
;         (store
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            "s"
;            8855)
;         "m"
;         (- 2437)))
;   (define-fun
;      wanted-18
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
;            "s"
;            8855)
;         "m"
;         (- 2437)))
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
(exit)
; Compiling DelayEq
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
; [G] co_aaH2 {1}:: (a_aaGQ[sk:1] *: a_aaGQ[sk:1])
;                   ~# (b_aaGR[sk:1] *: (b_aaGR[sk:1] *: b_aaGR[sk:1])) (CNonCanonical)
; [G] co_aaH6 {1}:: (b_aaGR[sk:1]
;                    *: (b_aaGR[sk:1]
;                        *: (b_aaGR[sk:1]
;                            *: (b_aaGR[sk:1]
;                                *: (b_aaGR[sk:1]
;                                    *: (b_aaGR[sk:1]
;                                        *: (b_aaGR[sk:1]
;                                            *: (b_aaGR[sk:1]
;                                                *: (b_aaGR[sk:1]
;                                                    *: (b_aaGR[sk:1]
;                                                        *: (b_aaGR[sk:1]
;                                                            *: (b_aaGR[sk:1]
;                                                                *: (b_aaGR[sk:1]
;                                                                    *: (b_aaGR[sk:1]
;                                                                        *: (b_aaGR[sk:1]
;                                                                            *: (b_aaGR[sk:1]
;                                                                                *: (b_aaGR[sk:1]
;                                                                                    *: (b_aaGR[sk:1]
;                                                                                        *: (b_aaGR[sk:1]
;                                                                                            *: (b_aaGR[sk:1]
;                                                                                                *: (b_aaGR[sk:1]
;                                                                                                    *: (b_aaGR[sk:1]
;                                                                                                        *: (b_aaGR[sk:1]
;                                                                                                            *: (b_aaGR[sk:1]
;                                                                                                                *: (b_aaGR[sk:1]
;                                                                                                                    *: (b_aaGR[sk:1]
;                                                                                                                        *: (b_aaGR[sk:1]
;                                                                                                                            *: (b_aaGR[sk:1]
;                                                                                                                                *: (b_aaGR[sk:1]
;                                                                                                                                    *: (b_aaGR[sk:1]
;                                                                                                                                        *: (b_aaGR[sk:1]
;                                                                                                                                            *: (b_aaGR[sk:1]
;                                                                                                                                                *: (b_aaGR[sk:1]
;                                                                                                                                                    *: (b_aaGR[sk:1]
;                                                                                                                                                        *: (b_aaGR[sk:1]
;                                                                                                                                                            *: (b_aaGR[sk:1]
;                                                                                                                                                                *: b_aaGR[sk:1]))))))))))))))))))))))))))))))))))))
;                   ~# One (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaH9} {1}:: (a_aaGU[tau:1] *: a_aaGU[tau:1])
;                          ~# (b_aaGR[sk:1] *: (b_aaGR[sk:1] *: b_aaGR[sk:1])) (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaGQ,aaGQ],*: [aaGR,*: [aaGR,aaGR]])
; (*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,*: [aaGR,aaGR]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]],One [])

; WANTEDS (Thoralf style)
; (*: [aaGU,aaGU],*: [aaGR,*: [aaGR,aaGR]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aaH9} {1}:: (a_aaGU[tau:1] *: a_aaGU[tau:1])
;                               ~# (b_aaGR[sk:1] *: (b_aaGR[sk:1] *: b_aaGR[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaGU
;      aaGU)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaGR
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaGR
;        aaGR)))

; GIVENS (names)
;  aaGQ  <=  a_aaGQ[sk:1]
;  aaGR  <=  b_aaGR[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaGQ (Array String Int))
; (declare-const aaGR (Array String Int))
(declare-const
   aaGQ
   (Array String Int))
(declare-const
   aaGR
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
           aaGQ
           aaGQ)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aaGR
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaGR
             aaGR)))
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
           aaGR
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaGR
             (
               (_
                  map
                  (+
                     (Int Int)
                     Int))
               aaGR
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaGR
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aaGR
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     aaGR
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       aaGR
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         aaGR
                         (
                           (_
                              map
                              (+
                                 (Int Int)
                                 Int))
                           aaGR
                           (
                             (_
                                map
                                (+
                                   (Int Int)
                                   Int))
                             aaGR
                             (
                               (_
                                  map
                                  (+
                                     (Int Int)
                                     Int))
                               aaGR
                               (
                                 (_
                                    map
                                    (+
                                       (Int Int)
                                       Int))
                                 aaGR
                                 (
                                   (_
                                      map
                                      (+
                                         (Int Int)
                                         Int))
                                   aaGR
                                   (
                                     (_
                                        map
                                        (+
                                           (Int Int)
                                           Int))
                                     aaGR
                                     (
                                       (_
                                          map
                                          (+
                                             (Int Int)
                                             Int))
                                       aaGR
                                       (
                                         (_
                                            map
                                            (+
                                               (Int Int)
                                               Int))
                                         aaGR
                                         (
                                           (_
                                              map
                                              (+
                                                 (Int Int)
                                                 Int))
                                           aaGR
                                           (
                                             (_
                                                map
                                                (+
                                                   (Int Int)
                                                   Int))
                                             aaGR
                                             (
                                               (_
                                                  map
                                                  (+
                                                     (Int Int)
                                                     Int))
                                               aaGR
                                               (
                                                 (_
                                                    map
                                                    (+
                                                       (Int Int)
                                                       Int))
                                                 aaGR
                                                 (
                                                   (_
                                                      map
                                                      (+
                                                         (Int Int)
                                                         Int))
                                                   aaGR
                                                   (
                                                     (_
                                                        map
                                                        (+
                                                           (Int Int)
                                                           Int))
                                                     aaGR
                                                     (
                                                       (_
                                                          map
                                                          (+
                                                             (Int Int)
                                                             Int))
                                                       aaGR
                                                       (
                                                         (_
                                                            map
                                                            (+
                                                               (Int Int)
                                                               Int))
                                                         aaGR
                                                         (
                                                           (_
                                                              map
                                                              (+
                                                                 (Int Int)
                                                                 Int))
                                                           aaGR
                                                           (
                                                             (_
                                                                map
                                                                (+
                                                                   (Int Int)
                                                                   Int))
                                                             aaGR
                                                             (
                                                               (_
                                                                  map
                                                                  (+
                                                                     (Int Int)
                                                                     Int))
                                                               aaGR
                                                               (
                                                                 (_
                                                                    map
                                                                    (+
                                                                       (Int Int)
                                                                       Int))
                                                                 aaGR
                                                                 (
                                                                   (_
                                                                      map
                                                                      (+
                                                                         (Int Int)
                                                                         Int))
                                                                   aaGR
                                                                   (
                                                                     (_
                                                                        map
                                                                        (+
                                                                           (Int Int)
                                                                           Int))
                                                                     aaGR
                                                                     (
                                                                       (_
                                                                          map
                                                                          (+
                                                                             (Int Int)
                                                                             Int))
                                                                       aaGR
                                                                       (
                                                                         (_
                                                                            map
                                                                            (+
                                                                               (Int Int)
                                                                               Int))
                                                                         aaGR
                                                                         (
                                                                           (_
                                                                              map
                                                                              (+
                                                                                 (Int Int)
                                                                                 Int))
                                                                           aaGR
                                                                           (
                                                                             (_
                                                                                map
                                                                                (+
                                                                                   (Int Int)
                                                                                   Int))
                                                                             aaGR
                                                                             (
                                                                               (_
                                                                                  map
                                                                                  (+
                                                                                     (Int Int)
                                                                                     Int))
                                                                               aaGR
                                                                               (
                                                                                 (_
                                                                                    map
                                                                                    (+
                                                                                       (Int Int)
                                                                                       Int))
                                                                                 aaGR
                                                                                 aaGR))))))))))))))))))))))))))))))))))))
         (
           (as
              const
              (Array String Int))
           0))
      :named
      given-1.2))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_aaH9} {1}:: (a_aaGU[tau:1] *: a_aaGU[tau:1])
;                               ~# (b_aaGR[sk:1] *: (b_aaGR[sk:1] *: b_aaGR[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaGU
;      aaGU)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaGR
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaGR
;        aaGR)))

; WANTEDS (names)
;  aaGR  <=  b_aaGR[sk:1]
;  aaGU  <=  a_aaGU[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aaGU (Array String Int))
(declare-const
   aaGU
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
              aaGU
              aaGU)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aaGR
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                aaGR
                aaGR))))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
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
;              aaGU
;              aaGU)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaGR
;              aaGR
;              aaGR))))
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
;      aaGQ
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
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR
;           aaGR)
;         (
;           (as
;              const
;              (Array String Int))
;           0)))
;   (define-fun
;      aaGR
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
;      aaGU
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
;      given-1.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaGQ
;           aaGQ)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaGR
;           aaGR
;           aaGR)))
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
; [G] co_aaHx {1}:: (a_aaHl[sk:1] *: a_aaHl[sk:1])
;                   ~# (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])) (CNonCanonical)
; [G] co_aaHB {1}:: (b_aaHm[sk:1]
;                    *: (b_aaHm[sk:1]
;                        *: (b_aaHm[sk:1]
;                            *: (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])))))
;                   ~# One (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaHF} {2}:: (b_aaHq[tau:1]
;                           *: (b_aaHq[tau:1] *: b_aaHq[tau:1]))
;                          ~# (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])) (CNonCanonical)
; [W] hole{co_aaHH} {1}:: (b_aaHq[tau:1]
;                          *: (b_aaHq[tau:1]
;                              *: (b_aaHq[tau:1]
;                                  *: (b_aaHq[tau:1] *: (b_aaHq[tau:1] *: b_aaHq[tau:1])))))
;                         ~# One (CNonCanonical)
; [D] _ {1}:: (b_aaHq[tau:1]
;              *: (b_aaHq[tau:1]
;                  *: (b_aaHq[tau:1]
;                      *: (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])))))
;             ~# One (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaHl,aaHl],*: [aaHm,*: [aaHm,aaHm]])
; (*: [aaHm,*: [aaHm,*: [aaHm,*: [aaHm,*: [aaHm,aaHm]]]]],One [])

; WANTEDS (Thoralf style)
; (*: [aaHq,*: [aaHq,aaHq]],*: [aaHm,*: [aaHm,aaHm]])
; (*: [aaHq,*: [aaHq,*: [aaHq,*: [aaHq,*: [aaHq,aaHq]]]]],One [])
; (*: [aaHq,*: [aaHq,*: [aaHq,*: [aaHm,*: [aaHm,aaHm]]]]],One [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aaHF} {2}:: (b_aaHq[tau:1]
;                                *: (b_aaHq[tau:1] *: b_aaHq[tau:1]))
;                               ~# (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHq
;        aaHq))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHm
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHm
;        aaHm)))

;      [W] hole{co_aaHH} {1}:: (b_aaHq[tau:1]
;                               *: (b_aaHq[tau:1]
;                                   *: (b_aaHq[tau:1]
;                                       *: (b_aaHq[tau:1] *: (b_aaHq[tau:1] *: b_aaHq[tau:1])))))
;                              ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHq
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aaHq
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aaHq
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaHq
;              aaHq)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

;      [D] _ {1}:: (b_aaHq[tau:1]
;                   *: (b_aaHq[tau:1]
;                       *: (b_aaHq[tau:1]
;                           *: (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])))))
;                  ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHq
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aaHq
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aaHm
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaHm
;              aaHm)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
;  aaHl  <=  a_aaHl[sk:1]
;  aaHm  <=  b_aaHm[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaHl (Array String Int))
; (declare-const aaHm (Array String Int))
(declare-const
   aaHl
   (Array String Int))
(declare-const
   aaHm
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
           aaHl
           aaHl)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aaHm
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaHm
             aaHm)))
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
           aaHm
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaHm
             (
               (_
                  map
                  (+
                     (Int Int)
                     Int))
               aaHm
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaHm
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aaHm
                   aaHm)))))
         (
           (as
              const
              (Array String Int))
           0))
      :named
      given-2.2))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aaHF} {2}:: (b_aaHq[tau:1]
;                                *: (b_aaHq[tau:1] *: b_aaHq[tau:1]))
;                               ~# (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHq
;        aaHq))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHm
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHm
;        aaHm)))

;      [W] hole{co_aaHH} {1}:: (b_aaHq[tau:1]
;                               *: (b_aaHq[tau:1]
;                                   *: (b_aaHq[tau:1]
;                                       *: (b_aaHq[tau:1] *: (b_aaHq[tau:1] *: b_aaHq[tau:1])))))
;                              ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHq
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aaHq
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aaHq
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaHq
;              aaHq)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

;      [D] _ {1}:: (b_aaHq[tau:1]
;                   *: (b_aaHq[tau:1]
;                       *: (b_aaHq[tau:1]
;                           *: (b_aaHm[sk:1] *: (b_aaHm[sk:1] *: b_aaHm[sk:1])))))
;                  ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaHq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aaHq
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aaHq
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aaHm
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaHm
;              aaHm)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  aaHm  <=  b_aaHm[sk:1]
;  aaHq  <=  b_aaHq[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aaHq (Array String Int))
(declare-const
   aaHq
   (Array String Int))
(assert
   (!
      (or
         (or
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    aaHq
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      aaHq
                      aaHq))
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    aaHm
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      aaHm
                      aaHm))))
            (not
               (=
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    aaHq
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      aaHq
                      (
                        (_
                           map
                           (+
                              (Int Int)
                              Int))
                        aaHq
                        (
                          (_
                             map
                             (+
                                (Int Int)
                                Int))
                          aaHq
                          (
                            (_
                               map
                               (+
                                  (Int Int)
                                  Int))
                            aaHq
                            aaHq)))))
                  (
                    (as
                       const
                       (Array String Int))
                    0))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaHq
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aaHq
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     aaHq
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       aaHm
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         aaHm
                         aaHm)))))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
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
;                      aaHq
;                      aaHq
;                      aaHq
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aaHq
;                        aaHq
;                        aaHq))
;                    (
;                      (as
;                         const
;                         (Array String Int))
;                      0))))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_
;                         map
;                         (+
;                            (Int Int)
;                            Int))
;                      aaHq
;                      aaHq
;                      aaHq
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aaHm
;                        aaHm
;                        aaHm))
;                    (
;                      (as
;                         const
;                         (Array String Int))
;                      0)))))
;         (or
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    aaHq
;                    aaHq
;                    aaHq)
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    aaHm
;                    aaHm
;                    aaHm)))
;            a!1
;            a!2)))
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
;           aaHm
;           aaHm
;           aaHm
;           aaHm
;           aaHm
;           aaHm)
;         (
;           (as
;              const
;              (Array String Int))
;           0)))
;   (define-fun
;      aaHm
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaHl
;           aaHl)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaHm
;           aaHm
;           aaHm)))
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
;      aaHq
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         (- 7720)))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aaHl
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
; [G] co_aaIr {1}:: (v_aaId[sk:1] *: w_aaIe[sk:1])
;                   ~# u_aaIc[sk:1] (CNonCanonical)
; [G] co_aaIx {3}:: (v_aaId[sk:1] *: v_aaId[sk:1])
;                   ~# v_aaId[sk:1] (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaIA} {2}:: (v_aaIj[tau:1] *: w_aaIe[sk:1])
;                          ~# u_aaIc[sk:1] (CNonCanonical)
; [WD] hole{co_aaIE} {3}:: (v_aaIj[tau:1] *: v_aaIj[tau:1])
;                          ~# v_aaIj[tau:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaId,aaIe],aaIc)
; (*: [aaId,aaId],aaId)

; WANTEDS (Thoralf style)
; (*: [aaIj,aaIe],aaIc)
; (*: [aaIj,aaIj],aaIj)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aaIA} {2}:: (v_aaIj[tau:1] *: w_aaIe[sk:1])
;                               ~# u_aaIc[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaIj
;      aaIe)
;    aaIc)

;      [WD] hole{co_aaIE} {3}:: (v_aaIj[tau:1] *: v_aaIj[tau:1])
;                               ~# v_aaIj[tau:1] (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaIj
;      aaIj)
;    aaIj)

; GIVENS (names)
;  aaIc  <=  u_aaIc[sk:1]
;  aaId  <=  v_aaId[sk:1]
;  aaIe  <=  w_aaIe[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaIc (Array String Int))
; (declare-const aaId (Array String Int))
; (declare-const aaIe (Array String Int))
(declare-const
   aaIc
   (Array String Int))
(declare-const
   aaId
   (Array String Int))
(declare-const
   aaIe
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
           aaId
           aaIe)
         aaIc)
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
           aaId
           aaId)
         aaId)
      :named
      given-3.2))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aaIA} {2}:: (v_aaIj[tau:1] *: w_aaIe[sk:1])
;                               ~# u_aaIc[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaIj
;      aaIe)
;    aaIc)

;      [WD] hole{co_aaIE} {3}:: (v_aaIj[tau:1] *: v_aaIj[tau:1])
;                               ~# v_aaIj[tau:1] (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaIj
;      aaIj)
;    aaIj)

; WANTEDS (names)
;  aaIc  <=  u_aaIc[sk:1]
;  aaIe  <=  w_aaIe[sk:1]
;  aaIj  <=  v_aaIj[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aaIj (Array String Int))
(declare-const
   aaIj
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
                 aaIj
                 aaIe)
               aaIc))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaIj
                 aaIj)
               aaIj)))
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
;           aaId
;           aaIe)
;         aaIc))
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
;                 aaIj
;                 aaIe)
;               aaIc))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aaIj
;                 aaIj)
;               aaIj))))
;   (define-fun
;      aaIe
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           23675)
;         "!0!"
;         20162))
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
;           aaId
;           aaId)
;         aaId))
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
;      aaId
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
;      aaIj
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           8855)
;         "!0!"
;         (- 1)))
;   (define-fun
;      aaIc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           23675)
;         "!0!"
;         20162))
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
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_aaUA {1}:: (a_aaRw[sk:1] *: a_aaRw[sk:1])
;                   ~# (b_aaRx[sk:1] *: (b_aaRx[sk:1] *: b_aaRx[sk:1])) (CNonCanonical)
; [G] co_aaUE {1}:: (b_aaRx[sk:1]
;                    *: (b_aaRx[sk:1]
;                        *: (b_aaRx[sk:1]
;                            *: (b_aaRx[sk:1]
;                                *: (b_aaRx[sk:1]
;                                    *: (b_aaRx[sk:1]
;                                        *: (b_aaRx[sk:1]
;                                            *: (b_aaRx[sk:1]
;                                                *: (b_aaRx[sk:1]
;                                                    *: (b_aaRx[sk:1]
;                                                        *: (b_aaRx[sk:1]
;                                                            *: (b_aaRx[sk:1]
;                                                                *: (b_aaRx[sk:1]
;                                                                    *: (b_aaRx[sk:1]
;                                                                        *: (b_aaRx[sk:1]
;                                                                            *: (b_aaRx[sk:1]
;                                                                                *: (b_aaRx[sk:1]
;                                                                                    *: (b_aaRx[sk:1]
;                                                                                        *: (b_aaRx[sk:1]
;                                                                                            *: (b_aaRx[sk:1]
;                                                                                                *: (b_aaRx[sk:1]
;                                                                                                    *: (b_aaRx[sk:1]
;                                                                                                        *: (b_aaRx[sk:1]
;                                                                                                            *: (b_aaRx[sk:1]
;                                                                                                                *: (b_aaRx[sk:1]
;                                                                                                                    *: (b_aaRx[sk:1]
;                                                                                                                        *: (b_aaRx[sk:1]
;                                                                                                                            *: (b_aaRx[sk:1]
;                                                                                                                                *: (b_aaRx[sk:1]
;                                                                                                                                    *: (b_aaRx[sk:1]
;                                                                                                                                        *: (b_aaRx[sk:1]
;                                                                                                                                            *: (b_aaRx[sk:1]
;                                                                                                                                                *: (b_aaRx[sk:1]
;                                                                                                                                                    *: (b_aaRx[sk:1]
;                                                                                                                                                        *: (b_aaRx[sk:1]
;                                                                                                                                                            *: (b_aaRx[sk:1]
;                                                                                                                                                                *: b_aaRx[sk:1]))))))))))))))))))))))))))))))))))))
;                   ~# One (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaUG} {1}:: One ~# b_aaRx[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaRw,aaRw],*: [aaRx,*: [aaRx,aaRx]])
; (*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,*: [aaRx,aaRx]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]],One [])

; WANTEDS (Thoralf style)
; (One [],aaRx)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aaUG} {1}:: One ~# b_aaRx[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aaRx)

; GIVENS (names)
;  aaRw  <=  a_aaRw[sk:1]
;  aaRx  <=  b_aaRx[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaRw (Array String Int))
; (declare-const aaRx (Array String Int))
(declare-const
   aaRw
   (Array String Int))
(declare-const
   aaRx
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
           aaRw
           aaRw)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aaRx
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaRx
             aaRx)))
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
           aaRx
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaRx
             (
               (_
                  map
                  (+
                     (Int Int)
                     Int))
               aaRx
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaRx
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aaRx
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     aaRx
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       aaRx
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         aaRx
                         (
                           (_
                              map
                              (+
                                 (Int Int)
                                 Int))
                           aaRx
                           (
                             (_
                                map
                                (+
                                   (Int Int)
                                   Int))
                             aaRx
                             (
                               (_
                                  map
                                  (+
                                     (Int Int)
                                     Int))
                               aaRx
                               (
                                 (_
                                    map
                                    (+
                                       (Int Int)
                                       Int))
                                 aaRx
                                 (
                                   (_
                                      map
                                      (+
                                         (Int Int)
                                         Int))
                                   aaRx
                                   (
                                     (_
                                        map
                                        (+
                                           (Int Int)
                                           Int))
                                     aaRx
                                     (
                                       (_
                                          map
                                          (+
                                             (Int Int)
                                             Int))
                                       aaRx
                                       (
                                         (_
                                            map
                                            (+
                                               (Int Int)
                                               Int))
                                         aaRx
                                         (
                                           (_
                                              map
                                              (+
                                                 (Int Int)
                                                 Int))
                                           aaRx
                                           (
                                             (_
                                                map
                                                (+
                                                   (Int Int)
                                                   Int))
                                             aaRx
                                             (
                                               (_
                                                  map
                                                  (+
                                                     (Int Int)
                                                     Int))
                                               aaRx
                                               (
                                                 (_
                                                    map
                                                    (+
                                                       (Int Int)
                                                       Int))
                                                 aaRx
                                                 (
                                                   (_
                                                      map
                                                      (+
                                                         (Int Int)
                                                         Int))
                                                   aaRx
                                                   (
                                                     (_
                                                        map
                                                        (+
                                                           (Int Int)
                                                           Int))
                                                     aaRx
                                                     (
                                                       (_
                                                          map
                                                          (+
                                                             (Int Int)
                                                             Int))
                                                       aaRx
                                                       (
                                                         (_
                                                            map
                                                            (+
                                                               (Int Int)
                                                               Int))
                                                         aaRx
                                                         (
                                                           (_
                                                              map
                                                              (+
                                                                 (Int Int)
                                                                 Int))
                                                           aaRx
                                                           (
                                                             (_
                                                                map
                                                                (+
                                                                   (Int Int)
                                                                   Int))
                                                             aaRx
                                                             (
                                                               (_
                                                                  map
                                                                  (+
                                                                     (Int Int)
                                                                     Int))
                                                               aaRx
                                                               (
                                                                 (_
                                                                    map
                                                                    (+
                                                                       (Int Int)
                                                                       Int))
                                                                 aaRx
                                                                 (
                                                                   (_
                                                                      map
                                                                      (+
                                                                         (Int Int)
                                                                         Int))
                                                                   aaRx
                                                                   (
                                                                     (_
                                                                        map
                                                                        (+
                                                                           (Int Int)
                                                                           Int))
                                                                     aaRx
                                                                     (
                                                                       (_
                                                                          map
                                                                          (+
                                                                             (Int Int)
                                                                             Int))
                                                                       aaRx
                                                                       (
                                                                         (_
                                                                            map
                                                                            (+
                                                                               (Int Int)
                                                                               Int))
                                                                         aaRx
                                                                         (
                                                                           (_
                                                                              map
                                                                              (+
                                                                                 (Int Int)
                                                                                 Int))
                                                                           aaRx
                                                                           (
                                                                             (_
                                                                                map
                                                                                (+
                                                                                   (Int Int)
                                                                                   Int))
                                                                             aaRx
                                                                             (
                                                                               (_
                                                                                  map
                                                                                  (+
                                                                                     (Int Int)
                                                                                     Int))
                                                                               aaRx
                                                                               (
                                                                                 (_
                                                                                    map
                                                                                    (+
                                                                                       (Int Int)
                                                                                       Int))
                                                                                 aaRx
                                                                                 aaRx))))))))))))))))))))))))))))))))))))
         (
           (as
              const
              (Array String Int))
           0))
      :named
      given-4.2))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aaUG} {1}:: One ~# b_aaRx[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aaRx)

; WANTEDS (names)
;  aaRx  <=  b_aaRx[sk:1]
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
            aaRx))
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
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaRw
;           aaRw)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaRx
;           (
;             (_
;                map
;                (+
;                   (Int Int)
;                   Int))
;             aaRx
;             aaRx)))
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
;           aaRx
;           (
;             (_
;                map
;                (+
;                   (Int Int)
;                   Int))
;             aaRx
;             (
;               (_
;                  map
;                  (+
;                     (Int Int)
;                     Int))
;               aaRx
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aaRx
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   aaRx
;                   (
;                     (_
;                        map
;                        (+
;                           (Int Int)
;                           Int))
;                     aaRx
;                     (
;                       (_
;                          map
;                          (+
;                             (Int Int)
;                             Int))
;                       aaRx
;                       (
;                         (_
;                            map
;                            (+
;                               (Int Int)
;                               Int))
;                         aaRx
;                         (
;                           (_
;                              map
;                              (+
;                                 (Int Int)
;                                 Int))
;                           aaRx
;                           (
;                             (_
;                                map
;                                (+
;                                   (Int Int)
;                                   Int))
;                             aaRx
;                             (
;                               (_
;                                  map
;                                  (+
;                                     (Int Int)
;                                     Int))
;                               aaRx
;                               (
;                                 (_
;                                    map
;                                    (+
;                                       (Int Int)
;                                       Int))
;                                 aaRx
;                                 (
;                                   (_
;                                      map
;                                      (+
;                                         (Int Int)
;                                         Int))
;                                   aaRx
;                                   (
;                                     (_
;                                        map
;                                        (+
;                                           (Int Int)
;                                           Int))
;                                     aaRx
;                                     (
;                                       (_
;                                          map
;                                          (+
;                                             (Int Int)
;                                             Int))
;                                       aaRx
;                                       (
;                                         (_
;                                            map
;                                            (+
;                                               (Int Int)
;                                               Int))
;                                         aaRx
;                                         (
;                                           (_
;                                              map
;                                              (+
;                                                 (Int Int)
;                                                 Int))
;                                           aaRx
;                                           (
;                                             (_
;                                                map
;                                                (+
;                                                   (Int Int)
;                                                   Int))
;                                             aaRx
;                                             (
;                                               (_
;                                                  map
;                                                  (+
;                                                     (Int Int)
;                                                     Int))
;                                               aaRx
;                                               (
;                                                 (_
;                                                    map
;                                                    (+
;                                                       (Int Int)
;                                                       Int))
;                                                 aaRx
;                                                 (
;                                                   (_
;                                                      map
;                                                      (+
;                                                         (Int Int)
;                                                         Int))
;                                                   aaRx
;                                                   (
;                                                     (_
;                                                        map
;                                                        (+
;                                                           (Int Int)
;                                                           Int))
;                                                     aaRx
;                                                     (
;                                                       (_
;                                                          map
;                                                          (+
;                                                             (Int Int)
;                                                             Int))
;                                                       aaRx
;                                                       (
;                                                         (_
;                                                            map
;                                                            (+
;                                                               (Int Int)
;                                                               Int))
;                                                         aaRx
;                                                         (
;                                                           (_
;                                                              map
;                                                              (+
;                                                                 (Int Int)
;                                                                 Int))
;                                                           aaRx
;                                                           (
;                                                             (_
;                                                                map
;                                                                (+
;                                                                   (Int Int)
;                                                                   Int))
;                                                             aaRx
;                                                             (
;                                                               (_
;                                                                  map
;                                                                  (+
;                                                                     (Int Int)
;                                                                     Int))
;                                                               aaRx
;                                                               (
;                                                                 (_
;                                                                    map
;                                                                    (+
;                                                                       (Int Int)
;                                                                       Int))
;                                                                 aaRx
;                                                                 (
;                                                                   (_
;                                                                      map
;                                                                      (+
;                                                                         (Int Int)
;                                                                         Int))
;                                                                   aaRx
;                                                                   (
;                                                                     (_
;                                                                        map
;                                                                        (+
;                                                                           (Int Int)
;                                                                           Int))
;                                                                     aaRx
;                                                                     (
;                                                                       (_
;                                                                          map
;                                                                          (+
;                                                                             (Int Int)
;                                                                             Int))
;                                                                       aaRx
;                                                                       (
;                                                                         (_
;                                                                            map
;                                                                            (+
;                                                                               (Int Int)
;                                                                               Int))
;                                                                         aaRx
;                                                                         (
;                                                                           (_
;                                                                              map
;                                                                              (+
;                                                                                 (Int Int)
;                                                                                 Int))
;                                                                           aaRx
;                                                                           (
;                                                                             (_
;                                                                                map
;                                                                                (+
;                                                                                   (Int Int)
;                                                                                   Int))
;                                                                             aaRx
;                                                                             (
;                                                                               (_
;                                                                                  map
;                                                                                  (+
;                                                                                     (Int Int)
;                                                                                     Int))
;                                                                               aaRx
;                                                                               (
;                                                                                 (_
;                                                                                    map
;                                                                                    (+
;                                                                                       (Int Int)
;                                                                                       Int))
;                                                                                 aaRx
;                                                                                 aaRx))))))))))))))))))))))))))))))))))))
;         (
;           (as
;              const
;              (Array String Int))
;           0))
;      :named
;      given-4.2)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            aaRx))
;      :named
;      wanted-4))
(get-unsat-core)
; (given-4.2 wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_aaUJ {1}:: (a_aaRE[sk:1] *: a_aaRE[sk:1])
;                   ~# (b_aaRF[sk:1] *: (b_aaRF[sk:1] *: b_aaRF[sk:1])) (CNonCanonical)
; [G] co_aaUN {1}:: (b_aaRF[sk:1]
;                    *: (b_aaRF[sk:1]
;                        *: (b_aaRF[sk:1]
;                            *: (b_aaRF[sk:1] *: (b_aaRF[sk:1] *: b_aaRF[sk:1])))))
;                   ~# One (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaUP} {1}:: One ~# a_aaRE[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaRE,aaRE],*: [aaRF,*: [aaRF,aaRF]])
; (*: [aaRF,*: [aaRF,*: [aaRF,*: [aaRF,*: [aaRF,aaRF]]]]],One [])

; WANTEDS (Thoralf style)
; (One [],aaRE)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aaUP} {1}:: One ~# a_aaRE[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aaRE)

; GIVENS (names)
;  aaRE  <=  a_aaRE[sk:1]
;  aaRF  <=  b_aaRF[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaRE (Array String Int))
; (declare-const aaRF (Array String Int))
(declare-const
   aaRE
   (Array String Int))
(declare-const
   aaRF
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
           aaRE
           aaRE)
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aaRF
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaRF
             aaRF)))
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
           aaRF
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaRF
             (
               (_
                  map
                  (+
                     (Int Int)
                     Int))
               aaRF
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaRF
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aaRF
                   aaRF)))))
         (
           (as
              const
              (Array String Int))
           0))
      :named
      given-5.2))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aaUP} {1}:: One ~# a_aaRE[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aaRE)

; WANTEDS (names)
;  aaRE  <=  a_aaRE[sk:1]
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
            aaRE))
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
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaRE
;           aaRE)
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaRF
;           (
;             (_
;                map
;                (+
;                   (Int Int)
;                   Int))
;             aaRF
;             aaRF)))
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
;           aaRF
;           (
;             (_
;                map
;                (+
;                   (Int Int)
;                   Int))
;             aaRF
;             (
;               (_
;                  map
;                  (+
;                     (Int Int)
;                     Int))
;               aaRF
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aaRF
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   aaRF
;                   aaRF)))))
;         (
;           (as
;              const
;              (Array String Int))
;           0))
;      :named
;      given-5.2)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            aaRE))
;      :named
;      wanted-5))
(get-unsat-core)
; (given-5.2 given-5.1 wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aaUQ {0}:: (a_aaRM[sk:1] *: a_aaRM[sk:1])
;                   ~# One (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaUS} {1}:: One ~# a_aaRM[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaRM,aaRM],One [])

; WANTEDS (Thoralf style)
; (One [],aaRM)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aaUS} {1}:: One ~# a_aaRM[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aaRM)

; GIVENS (names)
;  aaRM  <=  a_aaRM[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaRM (Array String Int))
(declare-const
   aaRM
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
           aaRM
           aaRM)
         (
           (as
              const
              (Array String Int))
           0))
      :named
      given-6.1))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aaUS} {1}:: One ~# a_aaRM[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aaRM)

; WANTEDS (names)
;  aaRM  <=  a_aaRM[sk:1]
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
            aaRM))
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
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aaRM
;           aaRM)
;         (
;           (as
;              const
;              (Array String Int))
;           0))
;      :named
;      given-6.1)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            aaRM))
;      :named
;      wanted-6))
(get-unsat-core)
; (given-6.1 wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_aaUU {1}:: (v_aaRT[sk:1] *: w_aaRU[sk:1])
;                   ~# u_aaRS[sk:1] (CNonCanonical)
; [G] co_aaV0 {3}:: (v_aaRT[sk:1] *: v_aaRT[sk:1])
;                   ~# v_aaRT[sk:1] (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaRZ} {0}:: u_aaRS[sk:1]
;                          ~# w_aaRU[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aaRT,aaRU],aaRS)
; (*: [aaRT,aaRT],aaRT)

; WANTEDS (Thoralf style)
; (aaRS,aaRU)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_aaRZ} {0}:: u_aaRS[sk:1]
;                               ~# w_aaRU[sk:1] (CNonCanonical)
;  =>  (= aaRS aaRU)

; GIVENS (names)
;  aaRS  <=  u_aaRS[sk:1]
;  aaRT  <=  v_aaRT[sk:1]
;  aaRU  <=  w_aaRU[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaRS (Array String Int))
; (declare-const aaRT (Array String Int))
; (declare-const aaRU (Array String Int))
(declare-const
   aaRS
   (Array String Int))
(declare-const
   aaRT
   (Array String Int))
(declare-const
   aaRU
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
           aaRT
           aaRU)
         aaRS)
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
           aaRT
           aaRT)
         aaRT)
      :named
      given-7.2))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_aaRZ} {0}:: u_aaRS[sk:1]
;                               ~# w_aaRU[sk:1] (CNonCanonical)
;  =>  (= aaRS aaRU)

; WANTEDS (names)
;  aaRS  <=  u_aaRS[sk:1]
;  aaRU  <=  w_aaRU[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aaRS aaRU))
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
;           aaRT
;           aaRU)
;         aaRS)
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
;           aaRT
;           aaRT)
;         aaRT)
;      :named
;      given-7.2)
;   (!
;      (not
;         (= aaRS aaRU))
;      :named
;      wanted-7))
(get-unsat-core)
; (wanted-7 given-7.2 given-7.1)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aaV4 {1}:: (One /: (w_aaS2[sk:1] *: w_aaS2[sk:1]))
;                   ~# (One /: (Base "kg" *: Base "kg")) (CNonCanonical)

; WANTEDS (GHC style)
; [WD] hole{co_aaV7} {2}:: Base "kg" ~# w_aaS2[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (/: [One [],*: [aaS2,aaS2]],/: [One [],*: [Base ["kg"],Base ["kg"]]])

; WANTEDS (Thoralf style)
; (Base ["kg"],aaS2)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aaV7} {2}:: Base "kg"
;                               ~# w_aaS2[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aaS2)

; GIVENS (names)
;  aaS2  <=  w_aaS2[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaS2 (Array String Int))
(declare-const
   aaS2
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
           (
             (as
                const
                (Array String Int))
             0)
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             aaS2
             aaS2))
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
           (
             (_
                map
                (+
                   (Int Int)
                   Int))
             (store base "kg" one)
             (store base "kg" one))))
      :named
      given-8.1))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aaV7} {2}:: Base "kg"
;                               ~# w_aaS2[sk:1] (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aaS2)

; WANTEDS (names)
;  aaS2  <=  w_aaS2[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            aaS2))
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
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           (
;             (as
;                const
;                (Array String Int))
;             0)
;           (
;             (_
;                map
;                (+
;                   (Int Int)
;                   Int))
;             aaS2
;             aaS2))
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           (
;             (as
;                const
;                (Array String Int))
;             0)
;           (
;             (_
;                map
;                (+
;                   (Int Int)
;                   Int))
;             (store base "kg" one)
;             (store base "kg" one))))
;      :named
;      given-8.1)
;   (!
;      (not
;         (=
;            (store base "kg" one)
;            aaS2))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8 given-8.1)
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] irred_aaSA {0}:: (u_aaSa[sk:1] *: v_aaSp[sk:2])
;                       ~~ (u_aaSa[sk:1] *: v_aaSp[sk:2]) (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aaSA {0}:: (u_aaSa[sk:1] *: v_aaSp[sk:2])
                      ~~ (u_aaSa[sk:1] *: v_aaSp[sk:2]) (CIrredCan(irred))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_aaSA {0}:: (u_aaSa[sk:1] *: v_aaSp[sk:2])
;                            ~~ (u_aaSa[sk:1] *: v_aaSp[sk:2]) (CIrredCan(irred))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaSa
;      aaSp)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaSa
;      aaSp))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] irred_aaSA {0}:: (u_aaSa[sk:1] *: v_aaSp[sk:2])
;                            ~~ (u_aaSa[sk:1] *: v_aaSp[sk:2]) (CIrredCan(irred))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaSa
;      aaSp)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaSa
;      aaSp))

; WANTEDS (names)
;  aaSa  <=  u_aaSa[sk:1]
;  aaSp  <=  v_aaSp[sk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aaSa (Array String Int))
; (declare-const aaSp (Array String Int))
(declare-const
   aaSa
   (Array String Int))
(declare-const
   aaSp
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
              aaSa
              aaSp)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aaSa
              aaSp)))
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
;              aaSa
;              aaSp)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaSa
;              aaSp)))
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
; [WD] irred_aaTz {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
;                       ~~ (u_aaTn[sk:1] *: v_aaTo[sk:1]) (CIrredCan(irred))
; [WD] irred_aaTF {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
;                       ~~ (v_aaTo[sk:1] *: u_aaTn[sk:1]) (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aaTz {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
                      ~~ (u_aaTn[sk:1] *: v_aaTo[sk:1]) (CIrredCan(irred))
; [WD] irred_aaTF {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
                      ~~ (v_aaTo[sk:1] *: u_aaTn[sk:1]) (CIrredCan(irred))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_aaTz {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
;                            ~~ (u_aaTn[sk:1] *: v_aaTo[sk:1]) (CIrredCan(irred))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTn
;      aaTo)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTn
;      aaTo))

;      [WD] irred_aaTF {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
;                            ~~ (v_aaTo[sk:1] *: u_aaTn[sk:1]) (CIrredCan(irred))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTn
;      aaTo)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTo
;      aaTn))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] irred_aaTz {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
;                            ~~ (u_aaTn[sk:1] *: v_aaTo[sk:1]) (CIrredCan(irred))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTn
;      aaTo)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTn
;      aaTo))

;      [WD] irred_aaTF {0}:: (u_aaTn[sk:1] *: v_aaTo[sk:1])
;                            ~~ (v_aaTo[sk:1] *: u_aaTn[sk:1]) (CIrredCan(irred))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTn
;      aaTo)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaTo
;      aaTn))

; WANTEDS (names)
;  aaTn  <=  u_aaTn[sk:1]
;  aaTo  <=  v_aaTo[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aaTn (Array String Int))
; (declare-const aaTo (Array String Int))
(declare-const
   aaTn
   (Array String Int))
(declare-const
   aaTo
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
                 aaTn
                 aaTo)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaTn
                 aaTo)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaTn
                 aaTo)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaTo
                 aaTn))))
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
;                 aaTn
;                 aaTo)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aaTn
;                 aaTo)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aaTn
;                 aaTo)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aaTo
;                 aaTn))))
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
; [WD] irred_aaUn {0}:: u_aaUd[sk:1]
;                       ~~ (u_aaUd[sk:1] /: One) (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aaUn {0}:: u_aaUd[sk:1]
                      ~~ (u_aaUd[sk:1] /: One) (CIrredCan(irred))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_aaUn {0}:: u_aaUd[sk:1]
;                            ~~ (u_aaUd[sk:1] /: One) (CIrredCan(irred))
;  =>  (=
;    aaUd
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aaUd
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
;      [WD] irred_aaUn {0}:: u_aaUd[sk:1]
;                            ~~ (u_aaUd[sk:1] /: One) (CIrredCan(irred))
;  =>  (=
;    aaUd
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aaUd
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  aaUd  <=  u_aaUd[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aaUd (Array String Int))
(declare-const
   aaUd
   (Array String Int))
(assert
   (!
      (not
         (=
            aaUd
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              aaUd
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
;            aaUd
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              aaUd
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
; Compiling Defs
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
; [WD] hole{co_abfM} {1}:: One
;                          ~# (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_abfM} {1}:: One
;                               ~# (Base "byte" /: Base "byte") (CNonCanonical)
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
;      [WD] hole{co_abfM} {1}:: One
;                               ~# (Base "byte" /: Base "byte") (CNonCanonical)
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
; Compiling Basic
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
; [WD] hole{co_acbF} {1}:: (Base "m" *: Base "s")
;                          ~# (Base "s" *: Base "m") (CNonCanonical)
; [WD] hole{co_acbI} {1}:: (Base "kg" *: Base "s")
;                          ~# (Base "s" *: Base "kg") (CNonCanonical)
; [WD] hole{co_ackP} {4}:: ((Base "m"
;                            *: (Base "s" *: (Base "s" *: One)))
;                           /: One)
;                          ~# (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
; [WD] hole{co_ackQ} {4}:: ((Base "m" *: One) /: (Base "s" *: One))
;                          ~# (Base "m" /: Base "s") (CNonCanonical)
; [WD] hole{co_ackR} {4}:: ((Base "m" *: One) /: One)
;                          ~# Base "m" (CNonCanonical)
; [WD] hole{co_ackS} {4}:: (One /: One) ~# One (CNonCanonical)
; [WD] irred_acan {0}:: ((Base "kg" *: Base "m")
;                        /: (Base "s" *: Base "s"))
;                       ~~ ((Base "m" /: (Base "s" *: Base "s"))
;                           *: Base "kg") (CIrredCan(irred))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],Base ["s"]],*: [Base ["s"],Base ["m"]])
; (*: [Base ["kg"],Base ["s"]],*: [Base ["s"],Base ["kg"]])
; (/: [*: [Base ["m"],*: [Base ["s"],*: [Base ["s"],One []]]],One []],*: [Base ["m"],*: [Base ["s"],Base ["s"]]])
; (/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],/: [Base ["m"],Base ["s"]])
; (/: [*: [Base ["m"],One []],One []],Base ["m"])
; (/: [One [],One []],One [])
; [WD] irred_acan {0}:: ((Base "kg" *: Base "m")
                       /: (Base "s" *: Base "s"))
                      ~~ ((Base "m" /: (Base "s" *: Base "s"))
                          *: Base "kg") (CIrredCan(irred))

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_acbF} {1}:: (Base "m" *: Base "s")
;                               ~# (Base "s" *: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "m" one)))

;      [WD] hole{co_acbI} {1}:: (Base "kg" *: Base "s")
;                               ~# (Base "s" *: Base "kg") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "kg" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "kg" one)))

;      [WD] hole{co_ackP} {4}:: ((Base "m"
;                                 *: (Base "s" *: (Base "s" *: One)))
;                                /: One)
;                               ~# (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
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
;        (store base "m" one)
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "s" one)
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            (store base "s" one)
;            (
;              (as
;                 const
;                 (Array String Int))
;              0))))
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
;      (store base "m" one)
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        (store base "s" one)
;        (store base "s" one))))

;      [WD] hole{co_ackQ} {4}:: ((Base "m" *: One)
;                                /: (Base "s" *: One))
;                               ~# (Base "m" /: Base "s") (CNonCanonical)
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
;        (store base "m" one)
;        (
;          (as
;             const
;             (Array String Int))
;          0))
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
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one)))

;      [WD] hole{co_ackR} {4}:: ((Base "m" *: One) /: One)
;                               ~# Base "m" (CNonCanonical)
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
;        (store base "m" one)
;        (
;          (as
;             const
;             (Array String Int))
;          0))
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    (store base "m" one))

;      [WD] hole{co_ackS} {4}:: (One /: One) ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

;      [WD] irred_acan {0}:: ((Base "kg" *: Base "m")
;                             /: (Base "s" *: Base "s"))
;                            ~~ ((Base "m" /: (Base "s" *: Base "s"))
;                                *: Base "kg") (CIrredCan(irred))
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
;        (store base "kg" one)
;        (store base "m" one))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        (store base "s" one)
;        (store base "s" one)))
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
;        (store base "m" one)
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "s" one)
;          (store base "s" one)))
;      (store base "kg" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_acbF} {1}:: (Base "m" *: Base "s")
;                               ~# (Base "s" *: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "m" one)))

;      [WD] hole{co_acbI} {1}:: (Base "kg" *: Base "s")
;                               ~# (Base "s" *: Base "kg") (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "kg" one)
;      (store base "s" one))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "kg" one)))

;      [WD] hole{co_ackP} {4}:: ((Base "m"
;                                 *: (Base "s" *: (Base "s" *: One)))
;                                /: One)
;                               ~# (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
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
;        (store base "m" one)
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "s" one)
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            (store base "s" one)
;            (
;              (as
;                 const
;                 (Array String Int))
;              0))))
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
;      (store base "m" one)
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        (store base "s" one)
;        (store base "s" one))))

;      [WD] hole{co_ackQ} {4}:: ((Base "m" *: One)
;                                /: (Base "s" *: One))
;                               ~# (Base "m" /: Base "s") (CNonCanonical)
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
;        (store base "m" one)
;        (
;          (as
;             const
;             (Array String Int))
;          0))
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
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "s" one)))

;      [WD] hole{co_ackR} {4}:: ((Base "m" *: One) /: One)
;                               ~# Base "m" (CNonCanonical)
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
;        (store base "m" one)
;        (
;          (as
;             const
;             (Array String Int))
;          0))
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    (store base "m" one))

;      [WD] hole{co_ackS} {4}:: (One /: One) ~# One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (
;        (as
;           const
;           (Array String Int))
;        0)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

;      [WD] irred_acan {0}:: ((Base "kg" *: Base "m")
;                             /: (Base "s" *: Base "s"))
;                            ~~ ((Base "m" /: (Base "s" *: Base "s"))
;                                *: Base "kg") (CIrredCan(irred))
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
;        (store base "kg" one)
;        (store base "m" one))
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        (store base "s" one)
;        (store base "s" one)))
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
;        (store base "m" one)
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          (store base "s" one)
;          (store base "s" one)))
;      (store base "kg" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         (or
            (or
               (or
                  (or
                     (or
                        (not
                           (=
                              (
                                (_
                                   map
                                   (+
                                      (Int Int)
                                      Int))
                                (store base "m" one)
                                (store base "s" one))
                              (
                                (_
                                   map
                                   (+
                                      (Int Int)
                                      Int))
                                (store base "s" one)
                                (store base "m" one))))
                        (not
                           (=
                              (
                                (_
                                   map
                                   (+
                                      (Int Int)
                                      Int))
                                (store base "kg" one)
                                (store base "s" one))
                              (
                                (_
                                   map
                                   (+
                                      (Int Int)
                                      Int))
                                (store base "s" one)
                                (store base "kg" one)))))
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
                               (store base "m" one)
                               (
                                 (_
                                    map
                                    (+
                                       (Int Int)
                                       Int))
                                 (store base "s" one)
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
                                     0))))
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
                             (store base "m" one)
                             (
                               (_
                                  map
                                  (+
                                     (Int Int)
                                     Int))
                               (store base "s" one)
                               (store base "s" one))))))
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
                             (-
                                (Int Int)
                                Int))
                          (store base "m" one)
                          (store base "s" one)))))
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
                         (store base "m" one)
                         (
                           (as
                              const
                              (Array String Int))
                           0))
                       (
                         (as
                            const
                            (Array String Int))
                         0))
                     (store base "m" one))))
            (not
               (=
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
                    (
                      (as
                         const
                         (Array String Int))
                      0))
                  (
                    (as
                       const
                       (Array String Int))
                    0))))
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
                   (store base "kg" one)
                   (store base "m" one))
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   (store base "s" one)
                   (store base "s" one)))
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
                   (store base "m" one)
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     (store base "s" one)
                     (store base "s" one)))
                 (store base "kg" one)))))
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
;      (or
;         (or
;            (or
;               (or
;                  (or
;                     (or
;                        (not
;                           (=
;                              (
;                                (_
;                                   map
;                                   (+
;                                      (Int Int)
;                                      Int))
;                                (store base "m" one)
;                                (store base "s" one))
;                              (
;                                (_
;                                   map
;                                   (+
;                                      (Int Int)
;                                      Int))
;                                (store base "s" one)
;                                (store base "m" one))))
;                        (not
;                           (=
;                              (
;                                (_
;                                   map
;                                   (+
;                                      (Int Int)
;                                      Int))
;                                (store base "kg" one)
;                                (store base "s" one))
;                              (
;                                (_
;                                   map
;                                   (+
;                                      (Int Int)
;                                      Int))
;                                (store base "s" one)
;                                (store base "kg" one)))))
;                     (not
;                        (=
;                           (
;                             (_
;                                map
;                                (-
;                                   (Int Int)
;                                   Int))
;                             (
;                               (_
;                                  map
;                                  (+
;                                     (Int Int)
;                                     Int))
;                               (store base "m" one)
;                               (
;                                 (_
;                                    map
;                                    (+
;                                       (Int Int)
;                                       Int))
;                                 (store base "s" one)
;                                 (
;                                   (_
;                                      map
;                                      (+
;                                         (Int Int)
;                                         Int))
;                                   (store base "s" one)
;                                   (
;                                     (as
;                                        const
;                                        (Array String Int))
;                                     0))))
;                             (
;                               (as
;                                  const
;                                  (Array String Int))
;                               0))
;                           (
;                             (_
;                                map
;                                (+
;                                   (Int Int)
;                                   Int))
;                             (store base "m" one)
;                             (
;                               (_
;                                  map
;                                  (+
;                                     (Int Int)
;                                     Int))
;                               (store base "s" one)
;                               (store base "s" one))))))
;                  (not
;                     (=
;                        (
;                          (_
;                             map
;                             (-
;                                (Int Int)
;                                Int))
;                          (
;                            (_
;                               map
;                               (+
;                                  (Int Int)
;                                  Int))
;                            (store base "m" one)
;                            (
;                              (as
;                                 const
;                                 (Array String Int))
;                              0))
;                          (
;                            (_
;                               map
;                               (+
;                                  (Int Int)
;                                  Int))
;                            (store base "s" one)
;                            (
;                              (as
;                                 const
;                                 (Array String Int))
;                              0)))
;                        (
;                          (_
;                             map
;                             (-
;                                (Int Int)
;                                Int))
;                          (store base "m" one)
;                          (store base "s" one)))))
;               (not
;                  (=
;                     (
;                       (_
;                          map
;                          (-
;                             (Int Int)
;                             Int))
;                       (
;                         (_
;                            map
;                            (+
;                               (Int Int)
;                               Int))
;                         (store base "m" one)
;                         (
;                           (as
;                              const
;                              (Array String Int))
;                           0))
;                       (
;                         (as
;                            const
;                            (Array String Int))
;                         0))
;                     (store base "m" one))))
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (-
;                          (Int Int)
;                          Int))
;                    (
;                      (as
;                         const
;                         (Array String Int))
;                      0)
;                    (
;                      (as
;                         const
;                         (Array String Int))
;                      0))
;                  (
;                    (as
;                       const
;                       (Array String Int))
;                    0))))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (-
;                       (Int Int)
;                       Int))
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   (store base "kg" one)
;                   (store base "m" one))
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   (store base "s" one)
;                   (store base "s" one)))
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
;                   (store base "m" one)
;                   (
;                     (_
;                        map
;                        (+
;                           (Int Int)
;                           Int))
;                     (store base "s" one)
;                     (store base "s" one)))
;                 (store base "kg" one)))))
;      :named
;      wanted-1))
(get-unsat-core)
; (wanted-1)
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
; Compiling UnitDefsTests
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
; [WD] hole{co_aezy} {1}:: One
;                          ~# (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aezy} {1}:: One
;                               ~# (Base "byte" /: Base "byte") (CNonCanonical)
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
;      [WD] hole{co_aezy} {1}:: One
;                               ~# (Base "byte" /: Base "byte") (CNonCanonical)
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
; Compiling ErrorTestGroups
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
; [WD] hole{co_aeMw} {1}:: (One *: a_aeLk[tau:0])
;                          ~# (a_aeLk[tau:0] *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [One [],aeLk],*: [aeLk,One []])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aeMw} {1}:: (One *: a_aeLk[tau:0])
;                               ~# (a_aeLk[tau:0] *: One) (CNonCanonical)
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
;      aeLk)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeLk
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
;      [WD] hole{co_aeMw} {1}:: (One *: a_aeLk[tau:0])
;                               ~# (a_aeLk[tau:0] *: One) (CNonCanonical)
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
;      aeLk)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeLk
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  aeLk  <=  a_aeLk[tau:0]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aeLk (Array String Int))
(declare-const
   aeLk
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
              aeLk)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aeLk
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
;              aeLk)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aeLk
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
; Compiling Main
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
