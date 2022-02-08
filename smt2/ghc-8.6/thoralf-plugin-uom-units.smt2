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
; [WD] hole{co_a1Vv} {1}:: (u *: (One /: u))
;                          ~ (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Vf,/: [One [],a1Vf]],*: [a1Vh,/: [One [],a1Vh]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a1Vv} {1}:: (u *: (One /: u))
;                               ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Vf
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
;        a1Vf))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Vh
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
;        a1Vh)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_a1Vv} {1}:: (u *: (One /: u))
;                               ~ (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Vf
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
;        a1Vf))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Vh
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
;        a1Vh)))

; WANTEDS (names)
;  a1Vf  <=  u
;  a1Vh  <=  u_a1Vh
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Vf (Array String Int))
; (declare-const a1Vh (Array String Int))
(declare-const
   a1Vf
   (Array String Int))
(declare-const
   a1Vh
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
              a1Vf
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
                a1Vf))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1Vh
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
                a1Vh))))
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
;              a1Vf
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
;                a1Vf))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1Vh
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
;                a1Vh))))
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
; [WD] hole{co_a1Wg} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{co_a1Wl} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1W7,a1W6],*: [a1W4,a1W3])
; (*: [a1W3,a1W4],*: [a1W6,a1W7])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1Wg} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W7
;      a1W6)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W4
;      a1W3))

;      [WD] hole{co_a1Wl} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W3
;      a1W4)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W6
;      a1W7))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1Wg} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W7
;      a1W6)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W4
;      a1W3))

;      [WD] hole{co_a1Wl} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W3
;      a1W4)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1W6
;      a1W7))

; WANTEDS (names)
;  a1W3  <=  u
;  a1W4  <=  v
;  a1W6  <=  u_a1W6
;  a1W7  <=  v_a1W7
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1W3 (Array String Int))
; (declare-const a1W4 (Array String Int))
; (declare-const a1W6 (Array String Int))
; (declare-const a1W7 (Array String Int))
(declare-const
   a1W3
   (Array String Int))
(declare-const
   a1W4
   (Array String Int))
(declare-const
   a1W6
   (Array String Int))
(declare-const
   a1W7
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
                 a1W7
                 a1W6)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1W4
                 a1W3)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1W3
                 a1W4)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1W6
                 a1W7))))
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
;                 a1W7
;                 a1W6)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1W4
;                 a1W3)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1W3
;                 a1W4)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1W6
;                 a1W7)))))
;   (define-fun
;      a1W6
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
;      a1W3
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
;      a1W4
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
;      a1W7
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
; [WD] hole{co_a1WU} {1}:: ((u0 *: v0) *: w0)
;                          ~ ((u *: v) *: w) (CNonCanonical)
; [WD] hole{co_a1X3} {1}:: (u *: (v *: w))
;                          ~ (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1WF,a1WG],a1WH],*: [*: [a1WB,a1WC],a1WD])
; (*: [a1WB,*: [a1WC,a1WD]],*: [a1WF,*: [a1WG,a1WH]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1WU} {1}:: ((u0 *: v0) *: w0)
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
;        a1WF
;        a1WG)
;      a1WH)
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
;        a1WB
;        a1WC)
;      a1WD))

;      [WD] hole{co_a1X3} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1WB
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1WC
;        a1WD))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1WF
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1WG
;        a1WH)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1WU} {1}:: ((u0 *: v0) *: w0)
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
;        a1WF
;        a1WG)
;      a1WH)
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
;        a1WB
;        a1WC)
;      a1WD))

;      [WD] hole{co_a1X3} {1}:: (u *: (v *: w))
;                               ~ (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1WB
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1WC
;        a1WD))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1WF
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1WG
;        a1WH)))

; WANTEDS (names)
;  a1WB  <=  u
;  a1WC  <=  v
;  a1WD  <=  w
;  a1WF  <=  u_a1WF
;  a1WG  <=  v_a1WG
;  a1WH  <=  w_a1WH
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1WB (Array String Int))
; (declare-const a1WC (Array String Int))
; (declare-const a1WD (Array String Int))
; (declare-const a1WF (Array String Int))
; (declare-const a1WG (Array String Int))
; (declare-const a1WH (Array String Int))
(declare-const
   a1WB
   (Array String Int))
(declare-const
   a1WC
   (Array String Int))
(declare-const
   a1WD
   (Array String Int))
(declare-const
   a1WF
   (Array String Int))
(declare-const
   a1WG
   (Array String Int))
(declare-const
   a1WH
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
                   a1WF
                   a1WG)
                 a1WH)
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
                   a1WB
                   a1WC)
                 a1WD)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1WB
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1WC
                   a1WD))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1WF
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1WG
                   a1WH)))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a1WD
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
;                 a1WF
;                 a1WG
;                 a1WH)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1WB
;                 a1WC
;                 a1WD)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1WB
;                 a1WC
;                 a1WD)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1WF
;                 a1WG
;                 a1WH)))))
;   (define-fun
;      a1WB
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
;      a1WF
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
;      a1WG
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
;      a1WH
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
;      a1WC
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
; [WD] hole{co_a1XR} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1X5],Base [a1X5]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a1XR} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1X5 one)
;      (store base a1X5 one))
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
;      [WD] hole{co_a1XR} {1}:: (Base b /: Base b)
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1X5 one)
;      (store base a1X5 one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1X5  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1X5 String)
(declare-const a1X5 String)
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
              (store base a1X5 one)
              (store base a1X5 one))
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
;              (store base a1X5 one)
;              (store base a1X5 one))
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
; [WD] hole{co_a1Y0} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Xf,/: [One [],a1Xf]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1Y0} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xf
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
;        a1Xf))
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
;      [WD] hole{co_a1Y0} {1}:: (u *: (One /: u))
;                               ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xf
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
;        a1Xf))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1Xf  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Xf (Array String Int))
(declare-const
   a1Xf
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
              a1Xf
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
                a1Xf))
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
;              a1Xf
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
;                a1Xf))
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
; [WD] hole{co_a1Y5} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Xm,One []],a1Xm)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1Y5} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xm
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Xm)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1Y5} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xm
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Xm)

; WANTEDS (names)
;  a1Xm  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Xm (Array String Int))
(declare-const
   a1Xm
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
              a1Xm
              (
                (as
                   const
                   (Array String Int))
                0))
            a1Xm))
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
;              a1Xm
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a1Xm))
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
; [WD] hole{co_a1Yc} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Xs,a1Xt],*: [a1Xt,a1Xs])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a1Yc} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xs
;      a1Xt)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xt
;      a1Xs))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a1Yc} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xs
;      a1Xt)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Xt
;      a1Xs))

; WANTEDS (names)
;  a1Xs  <=  u
;  a1Xt  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Xs (Array String Int))
; (declare-const a1Xt (Array String Int))
(declare-const
   a1Xs
   (Array String Int))
(declare-const
   a1Xt
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
              a1Xs
              a1Xt)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1Xt
              a1Xs)))
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
;              a1Xs
;              a1Xt)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1Xt
;              a1Xs)))
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
; [WD] hole{co_a1Yn} {1}:: (u *: (v *: w))
;                          ~ ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1XA,*: [a1XB,a1XC]],*: [*: [a1XA,a1XB],a1XC])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1Yn} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1XA
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1XB
;        a1XC))
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
;        a1XA
;        a1XB)
;      a1XC))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1Yn} {1}:: (u *: (v *: w))
;                               ~ ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1XA
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1XB
;        a1XC))
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
;        a1XA
;        a1XB)
;      a1XC))

; WANTEDS (names)
;  a1XA  <=  u
;  a1XB  <=  v
;  a1XC  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1XA (Array String Int))
; (declare-const a1XB (Array String Int))
; (declare-const a1XC (Array String Int))
(declare-const
   a1XA
   (Array String Int))
(declare-const
   a1XB
   (Array String Int))
(declare-const
   a1XC
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
              a1XA
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a1XB
                a1XC))
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
                a1XA
                a1XB)
              a1XC)))
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
;              a1XA
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1XB
;                a1XC))
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
;                a1XA
;                a1XB)
;              a1XC)))
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
; [WD] hole{co_aegF} {2}:: One
;                          ~ (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aegF} {2}:: One
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
;      [WD] hole{co_aegF} {2}:: One
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
; [WD] hole{co_aeha} {2}:: One
;                          ~ (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aeha} {2}:: One
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
;      [WD] hole{co_aeha} {2}:: One
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
; [WD] hole{co_aehF} {2}:: One
;                          ~ (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aehF} {2}:: One
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
;      [WD] hole{co_aehF} {2}:: One
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
; [WD] hole{co_aeia} {2}:: One
;                          ~ (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aeia} {2}:: One
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
;      [WD] hole{co_aeia} {2}:: One
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
; [WD] hole{co_aeiF} {2}:: One
;                          ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aeiF} {2}:: One
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
;      [WD] hole{co_aeiF} {2}:: One
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
; [WD] hole{co_aeja} {2}:: One
;                          ~ (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aeja} {2}:: One
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
;      [WD] hole{co_aeja} {2}:: One
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
; [WD] hole{co_aejF} {2}:: One
;                          ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_aejF} {2}:: One
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
;      [WD] hole{co_aejF} {2}:: One
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
; [WD] irred_aeZa {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aeZa {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] irred_aeZa {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))
;  =>  (=
;    aeZ0
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
;      aeZ0))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] irred_aeZa {0}:: fsk0 ~~ (One *: fsk0) (CIrredCan(sol))
;  =>  (=
;    aeZ0
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
;      aeZ0))

; WANTEDS (names)
;  aeZ0  <=  fsk_aeZ0
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aeZ0 (Array String Int))
(declare-const
   aeZ0
   (Array String Int))
(assert
   (!
      (not
         (=
            aeZ0
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
              aeZ0)))
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
;            aeZ0
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
;              aeZ0)))
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
; [G] co_agie {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_agii {0}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_agig {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_agij {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_agir} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agid)
; (*: [agi4,agid],agih)
; (*: [agid,agi3],agif)
; (agif,agih)

; WANTEDS (Thoralf style)
; (*: [agi7,agid],agih)

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_agir} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agi7
;      agid)
;    agih)

; GIVENS (names)
;  agi3  <=  a
;  agi4  <=  b
;  agid  <=  fsk_agid
;  agif  <=  fsk_agif
;  agih  <=  fsk_agih
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const agi3 (Array String Int))
; (declare-const agi4 (Array String Int))
; (declare-const agid (Array String Int))
; (declare-const agif (Array String Int))
; (declare-const agih (Array String Int))
(declare-const
   agi3
   (Array String Int))
(declare-const
   agi4
   (Array String Int))
(declare-const
   agid
   (Array String Int))
(declare-const
   agif
   (Array String Int))
(declare-const
   agih
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agid)
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
           agi4
           agid)
         agih)
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
           agid
           agi3)
         agif)
      :named
      given-1.3))
(assert
   (!
      (= agif agih)
      :named
      given-1.4))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_agir} {3}:: (b0 *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      agi7
;      agid)
;    agih)

; WANTEDS (names)
;  agi7  <=  b_agi7
;  agid  <=  fsk_agid
;  agih  <=  fsk_agih
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const agi7 (Array String Int))
(declare-const
   agi7
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
              agi7
              agid)
            agih))
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
;         agid))
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
;           agid
;           agi3)
;         agif))
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
;      agi3
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
;           agi4
;           agid)
;         agih))
;   (define-fun
;      agih
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agid
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agi7
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
;      agif
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
;      (= agif agih))
;   (define-fun
;      agi4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;              agi7
;              agid)
;            agih)))
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
; [WD] irred_aht5 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aht5 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] irred_aht5 {0}:: Base "m"
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
;      [WD] irred_aht5 {0}:: Base "m"
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
; [WD] irred_ahtt {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahtt {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] irred_ahtt {0}:: Base "m"
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
;      [WD] irred_ahtt {0}:: Base "m"
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
; [WD] irred_ahtR {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahtR {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] irred_ahtR {0}:: Base "m"
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
;      [WD] irred_ahtR {0}:: Base "m"
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
; [WD] irred_ahug {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahug {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] irred_ahug {0}:: Base "m"
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
;      [WD] irred_ahug {0}:: Base "m"
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
; [WD] irred_ahuD {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahuD {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] irred_ahuD {0}:: Base "m"
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
;      [WD] irred_ahuD {0}:: Base "m"
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
; [WD] irred_ahv0 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahv0 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] irred_ahv0 {0}:: Base "m"
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
;      [WD] irred_ahv0 {0}:: Base "m"
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
; [WD] irred_ahvo {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahvo {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] irred_ahvo {0}:: Base "m"
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
;      [WD] irred_ahvo {0}:: Base "m"
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
; [WD] irred_ahvL {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahvL {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_ahvL {0}:: Base "m"
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
;      [WD] irred_ahvL {0}:: Base "m"
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
; [WD] irred_ahw8 {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahw8 {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_ahw8 {0}:: Base "m"
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
;      [WD] irred_ahw8 {0}:: Base "m"
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
; [WD] irred_ahww {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahww {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_ahww {0}:: Base "m"
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
;      [WD] irred_ahww {0}:: Base "m"
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
; [WD] irred_ahwT {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahwT {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] irred_ahwT {0}:: Base "m"
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
;      [WD] irred_ahwT {0}:: Base "m"
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
; [WD] irred_ahxg {0}:: Base "m"
;                       ~~ (One *: Base "m") (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_ahxg {0}:: Base "m"
                      ~~ (One *: Base "m") (CIrredCan(sol))

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] irred_ahxg {0}:: Base "m"
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
;      [WD] irred_ahxg {0}:: Base "m"
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
; [G] co_ahxu {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_ahxw {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahxs {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_ahxz {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ahxE} {1}:: Base "s" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [agun,agun],ahxt)
; (*: [agun,ahxt],ahxv)
; (*: [agum,agum],ahxr)
; (ahxr,ahxv)

; WANTEDS (Thoralf style)
; (Base ["s"],agum)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_ahxE} {1}:: Base "s" ~ a (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    agum)

; GIVENS (names)
;  agum  <=  a
;  agun  <=  b
;  ahxr  <=  fsk_ahxr
;  ahxt  <=  fsk_ahxt
;  ahxv  <=  fsk_ahxv
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const agum (Array String Int))
; (declare-const agun (Array String Int))
; (declare-const ahxr (Array String Int))
; (declare-const ahxt (Array String Int))
; (declare-const ahxv (Array String Int))
(declare-const
   agum
   (Array String Int))
(declare-const
   agun
   (Array String Int))
(declare-const
   ahxr
   (Array String Int))
(declare-const
   ahxt
   (Array String Int))
(declare-const
   ahxv
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
           agun
           agun)
         ahxt)
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
           agun
           ahxt)
         ahxv)
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
           agum
           agum)
         ahxr)
      :named
      given-14.3))
(assert
   (!
      (= ahxr ahxv)
      :named
      given-14.4))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_ahxE} {1}:: Base "s" ~ a (CNonCanonical)
;  =>  (=
;    (store base "s" one)
;    agum)

; WANTEDS (names)
;  agum  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "s" one)
            agum))
      :named
      wanted-14))
(check-sat)
; sat
(echo "wanteds-finish-cycle-14")
(get-model)
; (
;   (define-fun
;      ahxt
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      given-14.4
;      ()
;      Bool
;      (= ahxr ahxv))
;   (define-fun
;      wanted-14
;      ()
;      Bool
;      (not
;         (=
;            (store base "s" one)
;            agum)))
;   (define-fun
;      ahxr
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
;           agun
;           agun)
;         ahxt))
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
;           agun
;           ahxt)
;         ahxv))
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
;           agum
;           agum)
;         ahxr))
;   (define-fun
;      ahxv
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agum
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
;      agun
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
; [G] co_ahxM {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ahxQ {0}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahxO {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_ahxR {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ahxY} {2}:: Base "kg" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ahxL)
; (*: [aguT,ahxL],ahxP)
; (*: [ahxL,aguS],ahxN)
; (ahxN,ahxP)

; WANTEDS (Thoralf style)
; (Base ["kg"],aguS)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_ahxY} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aguS)

; GIVENS (names)
;  aguS  <=  a
;  aguT  <=  b
;  ahxL  <=  fsk_ahxL
;  ahxN  <=  fsk_ahxN
;  ahxP  <=  fsk_ahxP
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aguS (Array String Int))
; (declare-const aguT (Array String Int))
; (declare-const ahxL (Array String Int))
; (declare-const ahxN (Array String Int))
; (declare-const ahxP (Array String Int))
(declare-const
   aguS
   (Array String Int))
(declare-const
   aguT
   (Array String Int))
(declare-const
   ahxL
   (Array String Int))
(declare-const
   ahxN
   (Array String Int))
(declare-const
   ahxP
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ahxL)
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
           aguT
           ahxL)
         ahxP)
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
           ahxL
           aguS)
         ahxN)
      :named
      given-15.3))
(assert
   (!
      (= ahxN ahxP)
      :named
      given-15.4))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_ahxY} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aguS)

; WANTEDS (names)
;  aguS  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            aguS))
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
;            aguS)))
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
;           ahxL
;           aguS)
;         ahxN))
;   (define-fun
;      aguS
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
;      (= ahxN ahxP))
;   (define-fun
;      ahxL
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
;           aguT
;           ahxL)
;         ahxP))
;   (define-fun
;      ahxP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      ahxN
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aguT
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
;         ahxL))
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
; [G] co_ahy2 {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_ahy6 {0}:: (a *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_ahy4 {0}:: (fsk0 *: a) ~ fsk1 (CNonCanonical)
; [G] co_ahy7 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ahye} {2}:: Base "kg" ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ahy1)
; (*: [agv0,ahy1],ahy5)
; (*: [ahy1,agv0],ahy3)
; (ahy3,ahy5)

; WANTEDS (Thoralf style)
; (Base ["kg"],agv0)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_ahye} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    agv0)

; GIVENS (names)
;  agv0  <=  a
;  ahy1  <=  fsk_ahy1
;  ahy3  <=  fsk_ahy3
;  ahy5  <=  fsk_ahy5
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const agv0 (Array String Int))
; (declare-const ahy1 (Array String Int))
; (declare-const ahy3 (Array String Int))
; (declare-const ahy5 (Array String Int))
(declare-const
   agv0
   (Array String Int))
(declare-const
   ahy1
   (Array String Int))
(declare-const
   ahy3
   (Array String Int))
(declare-const
   ahy5
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ahy1)
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
           agv0
           ahy1)
         ahy5)
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
           ahy1
           agv0)
         ahy3)
      :named
      given-16.3))
(assert
   (!
      (= ahy3 ahy5)
      :named
      given-16.4))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_ahye} {2}:: Base "kg" ~ a (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    agv0)

; WANTEDS (names)
;  agv0  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            agv0))
      :named
      wanted-16))
(check-sat)
; sat
(echo "wanteds-finish-cycle-16")
(get-model)
; (
;   (define-fun
;      ahy5
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
;      ahy3
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
;            agv0)))
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
;      (= ahy3 ahy5))
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
;           ahy1
;           agv0)
;         ahy3))
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
;           agv0
;           ahy1)
;         ahy5))
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
;         ahy1))
;   (define-fun
;      ahy1
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      agv0
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
; [WD] hole{co_ahyi} {2}:: Base "s" ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["s"],Base ["m"])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_ahyi} {2}:: Base "s" ~ Base "m" (CNonCanonical)
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
;      [WD] hole{co_ahyi} {2}:: Base "s" ~ Base "m" (CNonCanonical)
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
; [WD] hole{co_ahyr} {3}:: Base "s" ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["s"],Base ["m"])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{co_ahyr} {3}:: Base "s" ~ Base "m" (CNonCanonical)
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
;      [WD] hole{co_ahyr} {3}:: Base "s" ~ Base "m" (CNonCanonical)
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
; [WD] hole{co_ahyI} {1}:: (Base "m" /: Base "s")
;                          ~ (Base "s" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base ["m"],Base ["s"]],/: [Base ["s"],Base ["m"]])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_ahyI} {1}:: (Base "m" /: Base "s")
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
;      [WD] hole{co_ahyI} {1}:: (Base "m" /: Base "s")
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
; [G] co_aiGY {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aiFS {34}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiFU {33}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiFW {32}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiFY {31}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiG0 {30}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiG2 {29}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiG4 {28}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiG6 {27}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiG8 {26}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGa {25}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGc {24}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGe {23}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGg {22}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGi {21}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGk {20}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGm {19}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGo {18}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGq {17}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGs {16}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGu {15}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGw {14}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGy {13}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGA {12}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGC {11}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGE {10}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGG {9}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGI {8}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGK {7}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGM {6}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGO {5}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGQ {4}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGS {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGU {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiGW {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiFK {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_aiFM {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiFI {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aiH1 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aiH4 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aiHb} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aiGX)
; (*: [aiFw,aiFL],aiFR)
; (*: [aiFw,aiFR],aiFT)
; (*: [aiFw,aiFT],aiFV)
; (*: [aiFw,aiFV],aiFX)
; (*: [aiFw,aiFX],aiFZ)
; (*: [aiFw,aiFZ],aiG1)
; (*: [aiFw,aiG1],aiG3)
; (*: [aiFw,aiG3],aiG5)
; (*: [aiFw,aiG5],aiG7)
; (*: [aiFw,aiG7],aiG9)
; (*: [aiFw,aiG9],aiGb)
; (*: [aiFw,aiGb],aiGd)
; (*: [aiFw,aiGd],aiGf)
; (*: [aiFw,aiGf],aiGh)
; (*: [aiFw,aiGh],aiGj)
; (*: [aiFw,aiGj],aiGl)
; (*: [aiFw,aiGl],aiGn)
; (*: [aiFw,aiGn],aiGp)
; (*: [aiFw,aiGp],aiGr)
; (*: [aiFw,aiGr],aiGt)
; (*: [aiFw,aiGt],aiGv)
; (*: [aiFw,aiGv],aiGx)
; (*: [aiFw,aiGx],aiGz)
; (*: [aiFw,aiGz],aiGB)
; (*: [aiFw,aiGB],aiGD)
; (*: [aiFw,aiGD],aiGF)
; (*: [aiFw,aiGF],aiGH)
; (*: [aiFw,aiGH],aiGJ)
; (*: [aiFw,aiGJ],aiGL)
; (*: [aiFw,aiGL],aiGN)
; (*: [aiFw,aiGN],aiGP)
; (*: [aiFw,aiGP],aiGR)
; (*: [aiFw,aiGR],aiGT)
; (*: [aiFw,aiGT],aiGV)
; (*: [aiFw,aiFw],aiFJ)
; (*: [aiFw,aiFJ],aiFL)
; (*: [aiFv,aiFv],aiFH)
; (aiGV,aiGX)
; (aiFH,aiFL)

; WANTEDS (Thoralf style)
; (*: [aiFz,aiFz],aiFL)

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_aiHb} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiFz
;      aiFz)
;    aiFL)

; GIVENS (names)
;  aiFv  <=  a
;  aiFw  <=  b
;  aiFH  <=  fsk_aiFH
;  aiFJ  <=  fsk_aiFJ
;  aiFL  <=  fsk_aiFL
;  aiFR  <=  fsk_aiFR
;  aiFT  <=  fsk_aiFT
;  aiFV  <=  fsk_aiFV
;  aiFX  <=  fsk_aiFX
;  aiFZ  <=  fsk_aiFZ
;  aiG1  <=  fsk_aiG1
;  aiG3  <=  fsk_aiG3
;  aiG5  <=  fsk_aiG5
;  aiG7  <=  fsk_aiG7
;  aiG9  <=  fsk_aiG9
;  aiGb  <=  fsk_aiGb
;  aiGd  <=  fsk_aiGd
;  aiGf  <=  fsk_aiGf
;  aiGh  <=  fsk_aiGh
;  aiGj  <=  fsk_aiGj
;  aiGl  <=  fsk_aiGl
;  aiGn  <=  fsk_aiGn
;  aiGp  <=  fsk_aiGp
;  aiGr  <=  fsk_aiGr
;  aiGt  <=  fsk_aiGt
;  aiGv  <=  fsk_aiGv
;  aiGx  <=  fsk_aiGx
;  aiGz  <=  fsk_aiGz
;  aiGB  <=  fsk_aiGB
;  aiGD  <=  fsk_aiGD
;  aiGF  <=  fsk_aiGF
;  aiGH  <=  fsk_aiGH
;  aiGJ  <=  fsk_aiGJ
;  aiGL  <=  fsk_aiGL
;  aiGN  <=  fsk_aiGN
;  aiGP  <=  fsk_aiGP
;  aiGR  <=  fsk_aiGR
;  aiGT  <=  fsk_aiGT
;  aiGV  <=  fsk_aiGV
;  aiGX  <=  fsk_aiGX
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aiFH (Array String Int))
; (declare-const aiFJ (Array String Int))
; (declare-const aiFL (Array String Int))
; (declare-const aiFR (Array String Int))
; (declare-const aiFT (Array String Int))
; (declare-const aiFV (Array String Int))
; (declare-const aiFX (Array String Int))
; (declare-const aiFZ (Array String Int))
; (declare-const aiFv (Array String Int))
; (declare-const aiFw (Array String Int))
; (declare-const aiG1 (Array String Int))
; (declare-const aiG3 (Array String Int))
; (declare-const aiG5 (Array String Int))
; (declare-const aiG7 (Array String Int))
; (declare-const aiG9 (Array String Int))
; (declare-const aiGB (Array String Int))
; (declare-const aiGD (Array String Int))
; (declare-const aiGF (Array String Int))
; (declare-const aiGH (Array String Int))
; (declare-const aiGJ (Array String Int))
; (declare-const aiGL (Array String Int))
; (declare-const aiGN (Array String Int))
; (declare-const aiGP (Array String Int))
; (declare-const aiGR (Array String Int))
; (declare-const aiGT (Array String Int))
; (declare-const aiGV (Array String Int))
; (declare-const aiGX (Array String Int))
; (declare-const aiGb (Array String Int))
; (declare-const aiGd (Array String Int))
; (declare-const aiGf (Array String Int))
; (declare-const aiGh (Array String Int))
; (declare-const aiGj (Array String Int))
; (declare-const aiGl (Array String Int))
; (declare-const aiGn (Array String Int))
; (declare-const aiGp (Array String Int))
; (declare-const aiGr (Array String Int))
; (declare-const aiGt (Array String Int))
; (declare-const aiGv (Array String Int))
; (declare-const aiGx (Array String Int))
; (declare-const aiGz (Array String Int))
(declare-const
   aiFv
   (Array String Int))
(declare-const
   aiFw
   (Array String Int))
(declare-const
   aiFH
   (Array String Int))
(declare-const
   aiFJ
   (Array String Int))
(declare-const
   aiFL
   (Array String Int))
(declare-const
   aiFR
   (Array String Int))
(declare-const
   aiFT
   (Array String Int))
(declare-const
   aiFV
   (Array String Int))
(declare-const
   aiFX
   (Array String Int))
(declare-const
   aiFZ
   (Array String Int))
(declare-const
   aiG1
   (Array String Int))
(declare-const
   aiG3
   (Array String Int))
(declare-const
   aiG5
   (Array String Int))
(declare-const
   aiG7
   (Array String Int))
(declare-const
   aiG9
   (Array String Int))
(declare-const
   aiGb
   (Array String Int))
(declare-const
   aiGd
   (Array String Int))
(declare-const
   aiGf
   (Array String Int))
(declare-const
   aiGh
   (Array String Int))
(declare-const
   aiGj
   (Array String Int))
(declare-const
   aiGl
   (Array String Int))
(declare-const
   aiGn
   (Array String Int))
(declare-const
   aiGp
   (Array String Int))
(declare-const
   aiGr
   (Array String Int))
(declare-const
   aiGt
   (Array String Int))
(declare-const
   aiGv
   (Array String Int))
(declare-const
   aiGx
   (Array String Int))
(declare-const
   aiGz
   (Array String Int))
(declare-const
   aiGB
   (Array String Int))
(declare-const
   aiGD
   (Array String Int))
(declare-const
   aiGF
   (Array String Int))
(declare-const
   aiGH
   (Array String Int))
(declare-const
   aiGJ
   (Array String Int))
(declare-const
   aiGL
   (Array String Int))
(declare-const
   aiGN
   (Array String Int))
(declare-const
   aiGP
   (Array String Int))
(declare-const
   aiGR
   (Array String Int))
(declare-const
   aiGT
   (Array String Int))
(declare-const
   aiGV
   (Array String Int))
(declare-const
   aiGX
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aiGX)
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
           aiFw
           aiFL)
         aiFR)
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
           aiFw
           aiFR)
         aiFT)
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
           aiFw
           aiFT)
         aiFV)
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
           aiFw
           aiFV)
         aiFX)
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
           aiFw
           aiFX)
         aiFZ)
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
           aiFw
           aiFZ)
         aiG1)
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
           aiFw
           aiG1)
         aiG3)
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
           aiFw
           aiG3)
         aiG5)
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
           aiFw
           aiG5)
         aiG7)
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
           aiFw
           aiG7)
         aiG9)
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
           aiFw
           aiG9)
         aiGb)
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
           aiFw
           aiGb)
         aiGd)
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
           aiFw
           aiGd)
         aiGf)
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
           aiFw
           aiGf)
         aiGh)
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
           aiFw
           aiGh)
         aiGj)
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
           aiFw
           aiGj)
         aiGl)
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
           aiFw
           aiGl)
         aiGn)
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
           aiFw
           aiGn)
         aiGp)
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
           aiFw
           aiGp)
         aiGr)
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
           aiFw
           aiGr)
         aiGt)
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
           aiFw
           aiGt)
         aiGv)
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
           aiFw
           aiGv)
         aiGx)
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
           aiFw
           aiGx)
         aiGz)
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
           aiFw
           aiGz)
         aiGB)
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
           aiFw
           aiGB)
         aiGD)
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
           aiFw
           aiGD)
         aiGF)
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
           aiFw
           aiGF)
         aiGH)
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
           aiFw
           aiGH)
         aiGJ)
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
           aiFw
           aiGJ)
         aiGL)
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
           aiFw
           aiGL)
         aiGN)
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
           aiFw
           aiGN)
         aiGP)
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
           aiFw
           aiGP)
         aiGR)
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
           aiFw
           aiGR)
         aiGT)
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
           aiFw
           aiGT)
         aiGV)
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
           aiFw
           aiFw)
         aiFJ)
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
           aiFw
           aiFJ)
         aiFL)
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
           aiFv
           aiFv)
         aiFH)
      :named
      given-1.38))
(assert
   (!
      (= aiGV aiGX)
      :named
      given-1.39))
(assert
   (!
      (= aiFH aiFL)
      :named
      given-1.40))
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{co_aiHb} {2}:: (a0 *: a0) ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiFz
;      aiFz)
;    aiFL)

; WANTEDS (names)
;  aiFz  <=  a_aiFz
;  aiFL  <=  fsk_aiFL
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aiFz (Array String Int))
(declare-const
   aiFz
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
              aiFz
              aiFz)
            aiFL))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      aiGl
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFX
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
;           aiFw
;           aiGR)
;         aiGT))
;   (define-fun
;      aiGD
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGh
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
;           aiFw
;           aiGF)
;         aiGH))
;   (define-fun
;      aiGV
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFV
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           aiFw
;           aiGn)
;         aiGp))
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
;           aiFw
;           aiGl)
;         aiGn))
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
;           aiFw
;           aiGv)
;         aiGx))
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
;           aiFw
;           aiFR)
;         aiFT))
;   (define-fun
;      aiGn
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFw
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
;           aiFw
;           aiGr)
;         aiGt))
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
;           aiFw
;           aiFX)
;         aiFZ))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aiFR
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
;           aiFw
;           aiGz)
;         aiGB))
;   (define-fun
;      aiFL
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
;           aiFw
;           aiFJ)
;         aiFL))
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
;           aiFw
;           aiFw)
;         aiFJ))
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
;           aiFw
;           aiFT)
;         aiFV))
;   (define-fun
;      aiG3
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGf
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
;           aiFw
;           aiGN)
;         aiGP))
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
;              aiFz
;              aiFz)
;            aiFL)))
;   (define-fun
;      aiGj
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
;           aiFw
;           aiGH)
;         aiGJ))
;   (define-fun
;      aiGt
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGJ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFZ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGH
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGN
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFJ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFH
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
;           aiFw
;           aiGD)
;         aiGF))
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
;           aiFw
;           aiG9)
;         aiGb))
;   (define-fun
;      aiG7
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
;           aiFw
;           aiG7)
;         aiG9))
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
;           aiFw
;           aiG5)
;         aiG7))
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
;           aiFw
;           aiFV)
;         aiFX))
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
;           aiFw
;           aiGj)
;         aiGl))
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
;           aiFw
;           aiFL)
;         aiFR))
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
;           aiFw
;           aiFZ)
;         aiG1))
;   (define-fun
;      aiGd
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiG9
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
;           aiFw
;           aiGh)
;         aiGj))
;   (define-fun
;      aiG1
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGx
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
;           aiFw
;           aiGf)
;         aiGh))
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
;           aiFw
;           aiG3)
;         aiG5))
;   (define-fun
;      aiG5
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
;      (= aiFH aiFL))
;   (define-fun
;      aiGF
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGR
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiFz
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
;           aiFw
;           aiGb)
;         aiGd))
;   (define-fun
;      aiGL
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGX
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
;           aiFw
;           aiGP)
;         aiGR))
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
;           aiFw
;           aiGT)
;         aiGV))
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
;           aiFw
;           aiGx)
;         aiGz))
;   (define-fun
;      aiGz
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
;           aiFw
;           aiGd)
;         aiGf))
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
;           aiFw
;           aiG1)
;         aiG3))
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
;      (= aiGV aiGX))
;   (define-fun
;      aiGv
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
;           aiFw
;           aiGp)
;         aiGr))
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
;           aiFv
;           aiFv)
;         aiFH))
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
;           aiFw
;           aiGL)
;         aiGN))
;   (define-fun
;      aiGB
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
;         aiGX))
;   (define-fun
;      aiFv
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGr
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiGb
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
;           aiFw
;           aiGJ)
;         aiGL))
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
;           aiFw
;           aiGB)
;         aiGD))
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
;           aiFw
;           aiGt)
;         aiGv))
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
; [G] co_aiHU {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aiHO {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiHQ {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiHS {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiHG {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_aiHI {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aiHE {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aiHX {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aiI0 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aiIa} {3}:: (b0 *: (b0 *: b0)) ~ fsk0 (CNonCanonical)
; [WD] hole{co_aiIj} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                          ~ fsk0 (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aiHT)
; (*: [aiHs,aiHH],aiHN)
; (*: [aiHs,aiHN],aiHP)
; (*: [aiHs,aiHP],aiHR)
; (*: [aiHs,aiHs],aiHF)
; (*: [aiHs,aiHF],aiHH)
; (*: [aiHr,aiHr],aiHD)
; (aiHR,aiHT)
; (aiHD,aiHH)

; WANTEDS (Thoralf style)
; (*: [aiHw,*: [aiHw,aiHw]],aiHH)
; (*: [aiHw,*: [aiHw,*: [aiHw,*: [aiHw,*: [aiHw,aiHw]]]]],aiHT)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aiIa} {3}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiHw
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aiHw
;        aiHw))
;    aiHH)

;      [WD] hole{co_aiIj} {2}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiHw
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aiHw
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aiHw
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aiHw
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aiHw
;              aiHw)))))
;    aiHT)

; GIVENS (names)
;  aiHr  <=  a
;  aiHs  <=  b
;  aiHD  <=  fsk_aiHD
;  aiHF  <=  fsk_aiHF
;  aiHH  <=  fsk_aiHH
;  aiHN  <=  fsk_aiHN
;  aiHP  <=  fsk_aiHP
;  aiHR  <=  fsk_aiHR
;  aiHT  <=  fsk_aiHT
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aiHD (Array String Int))
; (declare-const aiHF (Array String Int))
; (declare-const aiHH (Array String Int))
; (declare-const aiHN (Array String Int))
; (declare-const aiHP (Array String Int))
; (declare-const aiHR (Array String Int))
; (declare-const aiHT (Array String Int))
; (declare-const aiHr (Array String Int))
; (declare-const aiHs (Array String Int))
(declare-const
   aiHr
   (Array String Int))
(declare-const
   aiHs
   (Array String Int))
(declare-const
   aiHD
   (Array String Int))
(declare-const
   aiHF
   (Array String Int))
(declare-const
   aiHH
   (Array String Int))
(declare-const
   aiHN
   (Array String Int))
(declare-const
   aiHP
   (Array String Int))
(declare-const
   aiHR
   (Array String Int))
(declare-const
   aiHT
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aiHT)
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
           aiHs
           aiHH)
         aiHN)
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
           aiHs
           aiHN)
         aiHP)
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
           aiHs
           aiHP)
         aiHR)
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
           aiHs
           aiHs)
         aiHF)
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
           aiHs
           aiHF)
         aiHH)
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
           aiHr
           aiHr)
         aiHD)
      :named
      given-2.7))
(assert
   (!
      (= aiHR aiHT)
      :named
      given-2.8))
(assert
   (!
      (= aiHD aiHH)
      :named
      given-2.9))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aiIa} {3}:: (b0 *: (b0 *: b0))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiHw
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aiHw
;        aiHw))
;    aiHH)

;      [WD] hole{co_aiIj} {2}:: (b0
;                                *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                               ~ fsk0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiHw
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aiHw
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aiHw
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aiHw
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aiHw
;              aiHw)))))
;    aiHT)

; WANTEDS (names)
;  aiHw  <=  b_aiHw
;  aiHH  <=  fsk_aiHH
;  aiHT  <=  fsk_aiHT
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aiHw (Array String Int))
(declare-const
   aiHw
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
                 aiHw
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aiHw
                   aiHw))
               aiHH))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aiHw
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aiHw
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     aiHw
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       aiHw
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         aiHw
                         aiHw)))))
               aiHT)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      aiHD
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiHT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiHs
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
;      (= aiHD aiHH))
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
;           aiHs
;           aiHN)
;         aiHP))
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
;         aiHT))
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
;           aiHr
;           aiHr)
;         aiHD))
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
;           aiHs
;           aiHP)
;         aiHR))
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
;                      aiHw
;                      aiHw
;                      aiHw
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aiHw
;                        aiHw
;                        aiHw))
;                    aiHT))))
;         (or
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    aiHw
;                    aiHw
;                    aiHw)
;                  aiHH))
;            a!1)))
;   (define-fun
;      aiHN
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
;           aiHs
;           aiHs)
;         aiHF))
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
;           aiHs
;           aiHF)
;         aiHH))
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
;           aiHs
;           aiHH)
;         aiHN))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aiHR aiHT))
;   (define-fun
;      aiHR
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiHr
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiHH
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiHw
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
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aiHP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiHF
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
; [G] co_aiJr {1}:: (v *: v) ~ fsk0 (CNonCanonical)
; [G] co_aiJk {0}:: (v *: w) ~ fsk0 (CNonCanonical)
; [G] co_aiJl {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_aiJu {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aiJC} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{co_aiJH} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aiJ4,aiJ4],aiJq)
; (*: [aiJ4,aiJ5],aiJj)
; (aiJj,aiJ3)
; (aiJq,aiJ4)

; WANTEDS (Thoralf style)
; (*: [aiJa,aiJ5],aiJ3)
; (*: [aiJa,aiJa],aiJa)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aiJC} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiJa
;      aiJ5)
;    aiJ3)

;      [WD] hole{co_aiJH} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiJa
;      aiJa)
;    aiJa)

; GIVENS (names)
;  aiJ3  <=  u
;  aiJ4  <=  v
;  aiJ5  <=  w
;  aiJj  <=  fsk_aiJj
;  aiJq  <=  fsk_aiJq
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aiJ3 (Array String Int))
; (declare-const aiJ4 (Array String Int))
; (declare-const aiJ5 (Array String Int))
; (declare-const aiJj (Array String Int))
; (declare-const aiJq (Array String Int))
(declare-const
   aiJ3
   (Array String Int))
(declare-const
   aiJ4
   (Array String Int))
(declare-const
   aiJ5
   (Array String Int))
(declare-const
   aiJj
   (Array String Int))
(declare-const
   aiJq
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
           aiJ4
           aiJ4)
         aiJq)
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
           aiJ4
           aiJ5)
         aiJj)
      :named
      given-3.2))
(assert
   (!
      (= aiJj aiJ3)
      :named
      given-3.3))
(assert
   (!
      (= aiJq aiJ4)
      :named
      given-3.4))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aiJC} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiJa
;      aiJ5)
;    aiJ3)

;      [WD] hole{co_aiJH} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aiJa
;      aiJa)
;    aiJa)

; WANTEDS (names)
;  aiJ3  <=  u
;  aiJ5  <=  w
;  aiJa  <=  v_aiJa
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aiJa (Array String Int))
(declare-const
   aiJa
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
                 aiJa
                 aiJ5)
               aiJ3))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aiJa
                 aiJa)
               aiJa)))
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
;           aiJ4
;           aiJ4)
;         aiJq))
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
;           aiJ4
;           aiJ5)
;         aiJj))
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
;      aiJ3
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
;      aiJ4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiJj
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
;      (= aiJj aiJ3))
;   (define-fun
;      aiJq
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aiJ5
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
;      aiJa
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
;                 aiJa
;                 aiJ5)
;               aiJ3))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aiJa
;                 aiJa)
;               aiJa))))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (= aiJq aiJ4))
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
; [G] co_aj6t {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aj5n {34}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5p {33}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5r {32}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5t {31}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5v {30}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5x {29}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5z {28}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5B {27}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5D {26}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5F {25}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5H {24}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5J {23}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5L {22}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5N {21}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5P {20}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5R {19}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5T {18}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5V {17}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5X {16}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5Z {15}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj61 {14}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj63 {13}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj65 {12}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj67 {11}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj69 {10}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6b {9}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6d {8}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6f {7}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6h {6}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6j {5}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6l {4}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6n {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6p {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6r {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5f {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_aj5h {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj5d {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aj6w {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aj6z {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aj6E} {2}:: fsk0 ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aj6s)
; (*: [aj1G,aj5g],aj5m)
; (*: [aj1G,aj5m],aj5o)
; (*: [aj1G,aj5o],aj5q)
; (*: [aj1G,aj5q],aj5s)
; (*: [aj1G,aj5s],aj5u)
; (*: [aj1G,aj5u],aj5w)
; (*: [aj1G,aj5w],aj5y)
; (*: [aj1G,aj5y],aj5A)
; (*: [aj1G,aj5A],aj5C)
; (*: [aj1G,aj5C],aj5E)
; (*: [aj1G,aj5E],aj5G)
; (*: [aj1G,aj5G],aj5I)
; (*: [aj1G,aj5I],aj5K)
; (*: [aj1G,aj5K],aj5M)
; (*: [aj1G,aj5M],aj5O)
; (*: [aj1G,aj5O],aj5Q)
; (*: [aj1G,aj5Q],aj5S)
; (*: [aj1G,aj5S],aj5U)
; (*: [aj1G,aj5U],aj5W)
; (*: [aj1G,aj5W],aj5Y)
; (*: [aj1G,aj5Y],aj60)
; (*: [aj1G,aj60],aj62)
; (*: [aj1G,aj62],aj64)
; (*: [aj1G,aj64],aj66)
; (*: [aj1G,aj66],aj68)
; (*: [aj1G,aj68],aj6a)
; (*: [aj1G,aj6a],aj6c)
; (*: [aj1G,aj6c],aj6e)
; (*: [aj1G,aj6e],aj6g)
; (*: [aj1G,aj6g],aj6i)
; (*: [aj1G,aj6i],aj6k)
; (*: [aj1G,aj6k],aj6m)
; (*: [aj1G,aj6m],aj6o)
; (*: [aj1G,aj6o],aj6q)
; (*: [aj1G,aj1G],aj5e)
; (*: [aj1G,aj5e],aj5g)
; (*: [aj1F,aj1F],aj5c)
; (aj6q,aj6s)
; (aj5c,aj5g)

; WANTEDS (Thoralf style)
; (aj6s,aj1G)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aj6E} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= aj6s aj1G)

; GIVENS (names)
;  aj1F  <=  a
;  aj1G  <=  b
;  aj5c  <=  fsk_aj5c
;  aj5e  <=  fsk_aj5e
;  aj5g  <=  fsk_aj5g
;  aj5m  <=  fsk_aj5m
;  aj5o  <=  fsk_aj5o
;  aj5q  <=  fsk_aj5q
;  aj5s  <=  fsk_aj5s
;  aj5u  <=  fsk_aj5u
;  aj5w  <=  fsk_aj5w
;  aj5y  <=  fsk_aj5y
;  aj5A  <=  fsk_aj5A
;  aj5C  <=  fsk_aj5C
;  aj5E  <=  fsk_aj5E
;  aj5G  <=  fsk_aj5G
;  aj5I  <=  fsk_aj5I
;  aj5K  <=  fsk_aj5K
;  aj5M  <=  fsk_aj5M
;  aj5O  <=  fsk_aj5O
;  aj5Q  <=  fsk_aj5Q
;  aj5S  <=  fsk_aj5S
;  aj5U  <=  fsk_aj5U
;  aj5W  <=  fsk_aj5W
;  aj5Y  <=  fsk_aj5Y
;  aj60  <=  fsk_aj60
;  aj62  <=  fsk_aj62
;  aj64  <=  fsk_aj64
;  aj66  <=  fsk_aj66
;  aj68  <=  fsk_aj68
;  aj6a  <=  fsk_aj6a
;  aj6c  <=  fsk_aj6c
;  aj6e  <=  fsk_aj6e
;  aj6g  <=  fsk_aj6g
;  aj6i  <=  fsk_aj6i
;  aj6k  <=  fsk_aj6k
;  aj6m  <=  fsk_aj6m
;  aj6o  <=  fsk_aj6o
;  aj6q  <=  fsk_aj6q
;  aj6s  <=  fsk_aj6s
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aj1F (Array String Int))
; (declare-const aj1G (Array String Int))
; (declare-const aj5A (Array String Int))
; (declare-const aj5C (Array String Int))
; (declare-const aj5E (Array String Int))
; (declare-const aj5G (Array String Int))
; (declare-const aj5I (Array String Int))
; (declare-const aj5K (Array String Int))
; (declare-const aj5M (Array String Int))
; (declare-const aj5O (Array String Int))
; (declare-const aj5Q (Array String Int))
; (declare-const aj5S (Array String Int))
; (declare-const aj5U (Array String Int))
; (declare-const aj5W (Array String Int))
; (declare-const aj5Y (Array String Int))
; (declare-const aj5c (Array String Int))
; (declare-const aj5e (Array String Int))
; (declare-const aj5g (Array String Int))
; (declare-const aj5m (Array String Int))
; (declare-const aj5o (Array String Int))
; (declare-const aj5q (Array String Int))
; (declare-const aj5s (Array String Int))
; (declare-const aj5u (Array String Int))
; (declare-const aj5w (Array String Int))
; (declare-const aj5y (Array String Int))
; (declare-const aj60 (Array String Int))
; (declare-const aj62 (Array String Int))
; (declare-const aj64 (Array String Int))
; (declare-const aj66 (Array String Int))
; (declare-const aj68 (Array String Int))
; (declare-const aj6a (Array String Int))
; (declare-const aj6c (Array String Int))
; (declare-const aj6e (Array String Int))
; (declare-const aj6g (Array String Int))
; (declare-const aj6i (Array String Int))
; (declare-const aj6k (Array String Int))
; (declare-const aj6m (Array String Int))
; (declare-const aj6o (Array String Int))
; (declare-const aj6q (Array String Int))
; (declare-const aj6s (Array String Int))
(declare-const
   aj1F
   (Array String Int))
(declare-const
   aj1G
   (Array String Int))
(declare-const
   aj5c
   (Array String Int))
(declare-const
   aj5e
   (Array String Int))
(declare-const
   aj5g
   (Array String Int))
(declare-const
   aj5m
   (Array String Int))
(declare-const
   aj5o
   (Array String Int))
(declare-const
   aj5q
   (Array String Int))
(declare-const
   aj5s
   (Array String Int))
(declare-const
   aj5u
   (Array String Int))
(declare-const
   aj5w
   (Array String Int))
(declare-const
   aj5y
   (Array String Int))
(declare-const
   aj5A
   (Array String Int))
(declare-const
   aj5C
   (Array String Int))
(declare-const
   aj5E
   (Array String Int))
(declare-const
   aj5G
   (Array String Int))
(declare-const
   aj5I
   (Array String Int))
(declare-const
   aj5K
   (Array String Int))
(declare-const
   aj5M
   (Array String Int))
(declare-const
   aj5O
   (Array String Int))
(declare-const
   aj5Q
   (Array String Int))
(declare-const
   aj5S
   (Array String Int))
(declare-const
   aj5U
   (Array String Int))
(declare-const
   aj5W
   (Array String Int))
(declare-const
   aj5Y
   (Array String Int))
(declare-const
   aj60
   (Array String Int))
(declare-const
   aj62
   (Array String Int))
(declare-const
   aj64
   (Array String Int))
(declare-const
   aj66
   (Array String Int))
(declare-const
   aj68
   (Array String Int))
(declare-const
   aj6a
   (Array String Int))
(declare-const
   aj6c
   (Array String Int))
(declare-const
   aj6e
   (Array String Int))
(declare-const
   aj6g
   (Array String Int))
(declare-const
   aj6i
   (Array String Int))
(declare-const
   aj6k
   (Array String Int))
(declare-const
   aj6m
   (Array String Int))
(declare-const
   aj6o
   (Array String Int))
(declare-const
   aj6q
   (Array String Int))
(declare-const
   aj6s
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aj6s)
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
           aj1G
           aj5g)
         aj5m)
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
           aj1G
           aj5m)
         aj5o)
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
           aj1G
           aj5o)
         aj5q)
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
           aj1G
           aj5q)
         aj5s)
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
           aj1G
           aj5s)
         aj5u)
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
           aj1G
           aj5u)
         aj5w)
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
           aj1G
           aj5w)
         aj5y)
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
           aj1G
           aj5y)
         aj5A)
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
           aj1G
           aj5A)
         aj5C)
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
           aj1G
           aj5C)
         aj5E)
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
           aj1G
           aj5E)
         aj5G)
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
           aj1G
           aj5G)
         aj5I)
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
           aj1G
           aj5I)
         aj5K)
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
           aj1G
           aj5K)
         aj5M)
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
           aj1G
           aj5M)
         aj5O)
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
           aj1G
           aj5O)
         aj5Q)
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
           aj1G
           aj5Q)
         aj5S)
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
           aj1G
           aj5S)
         aj5U)
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
           aj1G
           aj5U)
         aj5W)
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
           aj1G
           aj5W)
         aj5Y)
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
           aj1G
           aj5Y)
         aj60)
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
           aj1G
           aj60)
         aj62)
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
           aj1G
           aj62)
         aj64)
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
           aj1G
           aj64)
         aj66)
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
           aj1G
           aj66)
         aj68)
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
           aj1G
           aj68)
         aj6a)
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
           aj1G
           aj6a)
         aj6c)
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
           aj1G
           aj6c)
         aj6e)
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
           aj1G
           aj6e)
         aj6g)
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
           aj1G
           aj6g)
         aj6i)
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
           aj1G
           aj6i)
         aj6k)
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
           aj1G
           aj6k)
         aj6m)
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
           aj1G
           aj6m)
         aj6o)
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
           aj1G
           aj6o)
         aj6q)
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
           aj1G
           aj1G)
         aj5e)
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
           aj1G
           aj5e)
         aj5g)
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
           aj1F
           aj1F)
         aj5c)
      :named
      given-4.38))
(assert
   (!
      (= aj6q aj6s)
      :named
      given-4.39))
(assert
   (!
      (= aj5c aj5g)
      :named
      given-4.40))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aj6E} {2}:: fsk0 ~ b (CNonCanonical)
;  =>  (= aj6s aj1G)

; WANTEDS (names)
;  aj1G  <=  b
;  aj6s  <=  fsk_aj6s
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aj6s aj1G))
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
;         aj6s)
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
;           aj1G
;           aj5g)
;         aj5m)
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
;           aj1G
;           aj5m)
;         aj5o)
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
;           aj1G
;           aj5o)
;         aj5q)
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
;           aj1G
;           aj5q)
;         aj5s)
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
;           aj1G
;           aj5s)
;         aj5u)
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
;           aj1G
;           aj5u)
;         aj5w)
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
;           aj1G
;           aj5w)
;         aj5y)
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
;           aj1G
;           aj5y)
;         aj5A)
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
;           aj1G
;           aj5A)
;         aj5C)
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
;           aj1G
;           aj5C)
;         aj5E)
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
;           aj1G
;           aj5E)
;         aj5G)
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
;           aj1G
;           aj5G)
;         aj5I)
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
;           aj1G
;           aj5I)
;         aj5K)
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
;           aj1G
;           aj5K)
;         aj5M)
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
;           aj1G
;           aj5M)
;         aj5O)
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
;           aj1G
;           aj5O)
;         aj5Q)
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
;           aj1G
;           aj5Q)
;         aj5S)
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
;           aj1G
;           aj5S)
;         aj5U)
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
;           aj1G
;           aj5U)
;         aj5W)
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
;           aj1G
;           aj5W)
;         aj5Y)
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
;           aj1G
;           aj5Y)
;         aj60)
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
;           aj1G
;           aj60)
;         aj62)
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
;           aj1G
;           aj62)
;         aj64)
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
;           aj1G
;           aj64)
;         aj66)
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
;           aj1G
;           aj66)
;         aj68)
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
;           aj1G
;           aj68)
;         aj6a)
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
;           aj1G
;           aj6a)
;         aj6c)
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
;           aj1G
;           aj6c)
;         aj6e)
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
;           aj1G
;           aj6e)
;         aj6g)
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
;           aj1G
;           aj6g)
;         aj6i)
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
;           aj1G
;           aj6i)
;         aj6k)
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
;           aj1G
;           aj6k)
;         aj6m)
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
;           aj1G
;           aj6m)
;         aj6o)
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
;           aj1G
;           aj6o)
;         aj6q)
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
;           aj1G
;           aj1G)
;         aj5e)
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
;           aj1G
;           aj5e)
;         aj5g)
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
;           aj1F
;           aj1F)
;         aj5c)
;      :named
;      given-4.38)
;   (!
;      (= aj6q aj6s)
;      :named
;      given-4.39)
;   (!
;      (= aj5c aj5g)
;      :named
;      given-4.40)
;   (!
;      (not
;         (= aj6s aj1G))
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
; [G] co_aj6Y {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aj6S {3}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6U {2}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6W {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6K {2}:: (b *: b) ~ fsk0 (CNonCanonical)
; [G] co_aj6M {1}:: (b *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj6I {1}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aj71 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] co_aj74 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aj79} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aj6X)
; (*: [aj1O,aj6L],aj6R)
; (*: [aj1O,aj6R],aj6T)
; (*: [aj1O,aj6T],aj6V)
; (*: [aj1O,aj1O],aj6J)
; (*: [aj1O,aj6J],aj6L)
; (*: [aj1N,aj1N],aj6H)
; (aj6V,aj6X)
; (aj6H,aj6L)

; WANTEDS (Thoralf style)
; (aj6X,aj1N)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aj79} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aj6X aj1N)

; GIVENS (names)
;  aj1N  <=  a
;  aj1O  <=  b
;  aj6H  <=  fsk_aj6H
;  aj6J  <=  fsk_aj6J
;  aj6L  <=  fsk_aj6L
;  aj6R  <=  fsk_aj6R
;  aj6T  <=  fsk_aj6T
;  aj6V  <=  fsk_aj6V
;  aj6X  <=  fsk_aj6X
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aj1N (Array String Int))
; (declare-const aj1O (Array String Int))
; (declare-const aj6H (Array String Int))
; (declare-const aj6J (Array String Int))
; (declare-const aj6L (Array String Int))
; (declare-const aj6R (Array String Int))
; (declare-const aj6T (Array String Int))
; (declare-const aj6V (Array String Int))
; (declare-const aj6X (Array String Int))
(declare-const
   aj1N
   (Array String Int))
(declare-const
   aj1O
   (Array String Int))
(declare-const
   aj6H
   (Array String Int))
(declare-const
   aj6J
   (Array String Int))
(declare-const
   aj6L
   (Array String Int))
(declare-const
   aj6R
   (Array String Int))
(declare-const
   aj6T
   (Array String Int))
(declare-const
   aj6V
   (Array String Int))
(declare-const
   aj6X
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aj6X)
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
           aj1O
           aj6L)
         aj6R)
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
           aj1O
           aj6R)
         aj6T)
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
           aj1O
           aj6T)
         aj6V)
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
           aj1O
           aj1O)
         aj6J)
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
           aj1O
           aj6J)
         aj6L)
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
           aj1N
           aj1N)
         aj6H)
      :named
      given-5.7))
(assert
   (!
      (= aj6V aj6X)
      :named
      given-5.8))
(assert
   (!
      (= aj6H aj6L)
      :named
      given-5.9))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aj79} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aj6X aj1N)

; WANTEDS (names)
;  aj1N  <=  a
;  aj6X  <=  fsk_aj6X
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aj6X aj1N))
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
;         aj6X)
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
;           aj1O
;           aj6L)
;         aj6R)
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
;           aj1O
;           aj6R)
;         aj6T)
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
;           aj1O
;           aj6T)
;         aj6V)
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
;           aj1O
;           aj1O)
;         aj6J)
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
;           aj1O
;           aj6J)
;         aj6L)
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
;           aj1N
;           aj1N)
;         aj6H)
;      :named
;      given-5.7)
;   (!
;      (= aj6V aj6X)
;      :named
;      given-5.8)
;   (!
;      (= aj6H aj6L)
;      :named
;      given-5.9)
;   (!
;      (not
;         (= aj6X aj1N))
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
; [G] co_aj7f {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aj7d {0}:: (a *: a) ~ fsk0 (CNonCanonical)
; [G] co_aj7g {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aj7l} {2}:: fsk0 ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aj7e)
; (*: [aj1V,aj1V],aj7c)
; (aj7c,aj7e)

; WANTEDS (Thoralf style)
; (aj7e,aj1V)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aj7l} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aj7e aj1V)

; GIVENS (names)
;  aj1V  <=  a
;  aj7c  <=  fsk_aj7c
;  aj7e  <=  fsk_aj7e
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aj1V (Array String Int))
; (declare-const aj7c (Array String Int))
; (declare-const aj7e (Array String Int))
(declare-const
   aj1V
   (Array String Int))
(declare-const
   aj7c
   (Array String Int))
(declare-const
   aj7e
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aj7e)
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
           aj1V
           aj1V)
         aj7c)
      :named
      given-6.2))
(assert
   (!
      (= aj7c aj7e)
      :named
      given-6.3))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aj7l} {2}:: fsk0 ~ a (CNonCanonical)
;  =>  (= aj7e aj1V)

; WANTEDS (names)
;  aj1V  <=  a
;  aj7e  <=  fsk_aj7e
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aj7e aj1V))
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
;         aj7e)
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
;           aj1V
;           aj1V)
;         aj7c)
;      :named
;      given-6.2)
;   (!
;      (= aj7c aj7e)
;      :named
;      given-6.3)
;   (!
;      (not
;         (= aj7e aj1V))
;      :named
;      wanted-6))
(get-unsat-core)
; (given-6.2 given-6.1 wanted-6 given-6.3)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_aj7w {1}:: (v *: v) ~ fsk0 (CNonCanonical)
; [G] co_aj7p {0}:: (v *: w) ~ fsk0 (CNonCanonical)
; [G] co_aj7q {1}:: fsk0 ~ u (CTyEqCan)
; [G] co_aj7z {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aj29} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aj22,aj22],aj7v)
; (*: [aj22,aj23],aj7o)
; (aj7o,aj21)
; (aj7v,aj22)

; WANTEDS (Thoralf style)
; (aj21,aj23)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_aj29} {0}:: u ~ w (CNonCanonical)
;  =>  (= aj21 aj23)

; GIVENS (names)
;  aj21  <=  u
;  aj22  <=  v
;  aj23  <=  w
;  aj7o  <=  fsk_aj7o
;  aj7v  <=  fsk_aj7v
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aj21 (Array String Int))
; (declare-const aj22 (Array String Int))
; (declare-const aj23 (Array String Int))
; (declare-const aj7o (Array String Int))
; (declare-const aj7v (Array String Int))
(declare-const
   aj21
   (Array String Int))
(declare-const
   aj22
   (Array String Int))
(declare-const
   aj23
   (Array String Int))
(declare-const
   aj7o
   (Array String Int))
(declare-const
   aj7v
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
           aj22
           aj22)
         aj7v)
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
           aj22
           aj23)
         aj7o)
      :named
      given-7.2))
(assert
   (!
      (= aj7o aj21)
      :named
      given-7.3))
(assert
   (!
      (= aj7v aj22)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_aj29} {0}:: u ~ w (CNonCanonical)
;  =>  (= aj21 aj23)

; WANTEDS (names)
;  aj21  <=  u
;  aj23  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aj21 aj23))
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
;           aj22
;           aj22)
;         aj7v)
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
;           aj22
;           aj23)
;         aj7o)
;      :named
;      given-7.2)
;   (!
;      (= aj7o aj21)
;      :named
;      given-7.3)
;   (!
;      (= aj7v aj22)
;      :named
;      given-7.4)
;   (!
;      (not
;         (= aj21 aj23))
;      :named
;      wanted-7))
(get-unsat-core)
; (given-7.1 given-7.2 given-7.4 given-7.3 wanted-7)
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aj7F {0}:: One ~ fsk0 (CNonCanonical)
; [G] co_aj7L {2}:: Base "kg" ~ fsk0 (CNonCanonical)
; [G] co_aj7H {1}:: (w *: w) ~ fsk0 (CNonCanonical)
; [G] co_aj7N {1}:: (fsk0 *: fsk0) ~ fsk1 (CNonCanonical)
; [G] co_aj7P {0}:: (fsk0 /: fsk1) ~ fsk2 (CNonCanonical)
; [G] co_aj7J {0}:: (fsk0 /: fsk1) ~ fsk2 (CNonCanonical)
; [G] co_aj7S {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aj7X} {2}:: fsk0 ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aj7E)
; (Base ["kg"],aj7K)
; (*: [aj2b,aj2b],aj7G)
; (*: [aj7K,aj7K],aj7M)
; (/: [aj7E,aj7M],aj7O)
; (/: [aj7E,aj7G],aj7I)
; (aj7I,aj7O)

; WANTEDS (Thoralf style)
; (aj7K,aj2b)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aj7X} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= aj7K aj2b)

; GIVENS (names)
;  aj2b  <=  w
;  aj7E  <=  fsk_aj7E
;  aj7G  <=  fsk_aj7G
;  aj7I  <=  fsk_aj7I
;  aj7K  <=  fsk_aj7K
;  aj7M  <=  fsk_aj7M
;  aj7O  <=  fsk_aj7O
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aj2b (Array String Int))
; (declare-const aj7E (Array String Int))
; (declare-const aj7G (Array String Int))
; (declare-const aj7I (Array String Int))
; (declare-const aj7K (Array String Int))
; (declare-const aj7M (Array String Int))
; (declare-const aj7O (Array String Int))
(declare-const
   aj2b
   (Array String Int))
(declare-const
   aj7E
   (Array String Int))
(declare-const
   aj7G
   (Array String Int))
(declare-const
   aj7I
   (Array String Int))
(declare-const
   aj7K
   (Array String Int))
(declare-const
   aj7M
   (Array String Int))
(declare-const
   aj7O
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aj7E)
      :named
      given-8.1))
(assert
   (!
      (=
         (store base "kg" one)
         aj7K)
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
           aj2b
           aj2b)
         aj7G)
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
           aj7K
           aj7K)
         aj7M)
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
           aj7E
           aj7M)
         aj7O)
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
           aj7E
           aj7G)
         aj7I)
      :named
      given-8.6))
(assert
   (!
      (= aj7I aj7O)
      :named
      given-8.7))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aj7X} {2}:: fsk0 ~ w (CNonCanonical)
;  =>  (= aj7K aj2b)

; WANTEDS (names)
;  aj2b  <=  w
;  aj7K  <=  fsk_aj7K
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aj7K aj2b))
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
;         aj7E)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store base "kg" one)
;         aj7K)
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
;           aj2b
;           aj2b)
;         aj7G)
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
;           aj7K
;           aj7K)
;         aj7M)
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
;           aj7E
;           aj7M)
;         aj7O)
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
;           aj7E
;           aj7G)
;         aj7I)
;      :named
;      given-8.6)
;   (!
;      (= aj7I aj7O)
;      :named
;      given-8.7)
;   (!
;      (not
;         (= aj7K aj2b))
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
; [WD] irred_aj8k {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aj8k {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] irred_aj8k {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj2j
;      aj2A)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj2j
;      aj2A))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] irred_aj8k {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj2j
;      aj2A)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj2j
;      aj2A))

; WANTEDS (names)
;  aj2j  <=  u
;  aj2A  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aj2A (Array String Int))
; (declare-const aj2j (Array String Int))
(declare-const
   aj2j
   (Array String Int))
(declare-const
   aj2A
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
              aj2j
              aj2A)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              aj2j
              aj2A)))
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
;              aj2j
;              aj2A)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aj2j
;              aj2A)))
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
; [WD] irred_aj8z {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
; [WD] irred_aj8E {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aj8z {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
; [WD] irred_aj8E {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] irred_aj8z {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3E
;      aj3F)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3E
;      aj3F))

;      [WD] irred_aj8E {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3E
;      aj3F)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3F
;      aj3E))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] irred_aj8z {0}:: (u *: v) ~~ (u *: v) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3E
;      aj3F)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3E
;      aj3F))

;      [WD] irred_aj8E {0}:: (u *: v) ~~ (v *: u) (CIrredCan(sol))
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3E
;      aj3F)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aj3F
;      aj3E))

; WANTEDS (names)
;  aj3E  <=  u
;  aj3F  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aj3E (Array String Int))
; (declare-const aj3F (Array String Int))
(declare-const
   aj3E
   (Array String Int))
(declare-const
   aj3F
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
                 aj3E
                 aj3F)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aj3E
                 aj3F)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aj3E
                 aj3F)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aj3F
                 aj3E))))
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
;                 aj3E
;                 aj3F)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aj3E
;                 aj3F)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aj3E
;                 aj3F)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aj3F
;                 aj3E))))
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
; [WD] irred_aj8N {0}:: u ~~ (u /: One) (CIrredCan(sol))

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; [WD] irred_aj8N {0}:: u ~~ (u /: One) (CIrredCan(sol))

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] irred_aj8N {0}:: u ~~ (u /: One) (CIrredCan(sol))
;  =>  (=
;    aj4M
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aj4M
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
;      [WD] irred_aj8N {0}:: u ~~ (u /: One) (CIrredCan(sol))
;  =>  (=
;    aj4M
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      aj4M
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  aj4M  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aj4M (Array String Int))
(declare-const
   aj4M
   (Array String Int))
(assert
   (!
      (not
         (=
            aj4M
            (
              (_
                 map
                 (-
                    (Int Int)
                    Int))
              aj4M
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
;            aj4M
;            (
;              (_
;                 map
;                 (-
;                    (Int Int)
;                    Int))
;              aj4M
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
; [WD] hole{co_ajHT} {2}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_ajHT} {2}:: One
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
;      [WD] hole{co_ajHT} {2}:: One
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
; [WD] hole{co_am3g} {2}:: One
;                          ~ (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_am3g} {2}:: One
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
;      [WD] hole{co_am3g} {2}:: One
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
; [WD] hole{co_amkV} {2}:: (One *: a0) ~ (a0 *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [One [],amjH],*: [amjH,One []])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_amkV} {2}:: (One *: a0)
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
;      amjH)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      amjH
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
;      [WD] hole{co_amkV} {2}:: (One *: a0)
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
;      amjH)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      amjH
;      (
;        (as
;           const
;           (Array String Int))
;        0)))

; WANTEDS (names)
;  amjH  <=  a_amjH
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const amjH (Array String Int))
(declare-const
   amjH
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
              amjH)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              amjH
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
;              amjH)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              amjH
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
