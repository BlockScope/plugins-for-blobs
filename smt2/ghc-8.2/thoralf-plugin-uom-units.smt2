; Build profile: -w ghc-8.2.2 -O1
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
; [WD] hole{a1HR} {1}:: (u *: (One /: u))
;                       ~
;                       (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1HB,/: [One [],a1HB]],*: [a1HD,/: [One [],a1HD]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{a1HR} {1}:: (u *: (One /: u))
;                            ~
;                            (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HB
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
;        a1HB))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HD
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
;        a1HD)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{a1HR} {1}:: (u *: (One /: u))
;                            ~
;                            (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HB
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
;        a1HB))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HD
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
;        a1HD)))

; WANTEDS (names)
;  a1HB  <=  u
;  a1HD  <=  u_a1HD
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1HB (Array String Int))
; (declare-const a1HD (Array String Int))
(declare-const
   a1HB
   (Array String Int))
(declare-const
   a1HD
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
              a1HB
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
                a1HB))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1HD
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
                a1HD))))
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
;              a1HB
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
;                a1HB))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1HD
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
;                a1HD))))
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
; [WD] hole{a1Iu} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{a1Iz} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Il,a1Ik],*: [a1Ii,a1Ih])
; (*: [a1Ih,a1Ii],*: [a1Ik,a1Il])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a1Iu} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Il
;      a1Ik)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ii
;      a1Ih))

;      [WD] hole{a1Iz} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ih
;      a1Ii)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ik
;      a1Il))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a1Iu} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Il
;      a1Ik)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ii
;      a1Ih))

;      [WD] hole{a1Iz} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ih
;      a1Ii)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ik
;      a1Il))

; WANTEDS (names)
;  a1Ih  <=  u
;  a1Ii  <=  v
;  a1Ik  <=  u_a1Ik
;  a1Il  <=  v_a1Il
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Ih (Array String Int))
; (declare-const a1Ii (Array String Int))
; (declare-const a1Ik (Array String Int))
; (declare-const a1Il (Array String Int))
(declare-const
   a1Ih
   (Array String Int))
(declare-const
   a1Ii
   (Array String Int))
(declare-const
   a1Ik
   (Array String Int))
(declare-const
   a1Il
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
                 a1Il
                 a1Ik)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Ii
                 a1Ih)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Ih
                 a1Ii)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Ik
                 a1Il))))
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
;                 a1Il
;                 a1Ik)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Ii
;                 a1Ih)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Ih
;                 a1Ii)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Ik
;                 a1Il)))))
;   (define-fun
;      a1Ih
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
;      a1Ii
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
;      a1Il
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
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1Ik
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
; [WD] hole{a1J4} {1}:: ((u0 *: v0) *: w0)
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)
; [WD] hole{a1Jd} {1}:: (u *: (v *: w))
;                       ~
;                       (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1IP,a1IQ],a1IR],*: [*: [a1IL,a1IM],a1IN])
; (*: [a1IL,*: [a1IM,a1IN]],*: [a1IP,*: [a1IQ,a1IR]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a1J4} {1}:: ((u0 *: v0) *: w0)
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
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
;        a1IP
;        a1IQ)
;      a1IR)
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
;        a1IL
;        a1IM)
;      a1IN))

;      [WD] hole{a1Jd} {1}:: (u *: (v *: w))
;                            ~
;                            (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IL
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IM
;        a1IN))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IP
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IQ
;        a1IR)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a1J4} {1}:: ((u0 *: v0) *: w0)
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
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
;        a1IP
;        a1IQ)
;      a1IR)
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
;        a1IL
;        a1IM)
;      a1IN))

;      [WD] hole{a1Jd} {1}:: (u *: (v *: w))
;                            ~
;                            (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IL
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IM
;        a1IN))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IP
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IQ
;        a1IR)))

; WANTEDS (names)
;  a1IL  <=  u
;  a1IM  <=  v
;  a1IN  <=  w
;  a1IP  <=  u_a1IP
;  a1IQ  <=  v_a1IQ
;  a1IR  <=  w_a1IR
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1IL (Array String Int))
; (declare-const a1IM (Array String Int))
; (declare-const a1IN (Array String Int))
; (declare-const a1IP (Array String Int))
; (declare-const a1IQ (Array String Int))
; (declare-const a1IR (Array String Int))
(declare-const
   a1IL
   (Array String Int))
(declare-const
   a1IM
   (Array String Int))
(declare-const
   a1IN
   (Array String Int))
(declare-const
   a1IP
   (Array String Int))
(declare-const
   a1IQ
   (Array String Int))
(declare-const
   a1IR
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
                   a1IP
                   a1IQ)
                 a1IR)
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
                   a1IL
                   a1IM)
                 a1IN)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IL
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IM
                   a1IN))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IP
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IQ
                   a1IR)))))
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
;                 a1IP
;                 a1IQ
;                 a1IR)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1IL
;                 a1IM
;                 a1IN)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1IL
;                 a1IM
;                 a1IN)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1IP
;                 a1IQ
;                 a1IR)))))
;   (define-fun
;      a1IQ
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
;      a1IN
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
;      a1IL
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
;      a1IP
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
;      a1IR
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
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1IM
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
; [WD] hole{a1K1} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1Jf],Base [a1Jf]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{a1K1} {1}:: (Base b /: Base b) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1Jf one)
;      (store base a1Jf one))
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
;      [WD] hole{a1K1} {1}:: (Base b /: Base b) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1Jf one)
;      (store base a1Jf one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1Jf  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Jf String)
(declare-const a1Jf String)
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
              (store base a1Jf one)
              (store base a1Jf one))
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
;              (store base a1Jf one)
;              (store base a1Jf one))
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
; [WD] hole{a1Ka} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Jp,/: [One [],a1Jp]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a1Ka} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Jp
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
;        a1Jp))
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
;      [WD] hole{a1Ka} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Jp
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
;        a1Jp))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1Jp  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Jp (Array String Int))
(declare-const
   a1Jp
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
              a1Jp
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
                a1Jp))
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
;              a1Jp
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
;                a1Jp))
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
; [WD] hole{a1Kf} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Jw,One []],a1Jw)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{a1Kf} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Jw
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Jw)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{a1Kf} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Jw
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1Jw)

; WANTEDS (names)
;  a1Jw  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Jw (Array String Int))
(declare-const
   a1Jw
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
              a1Jw
              (
                (as
                   const
                   (Array String Int))
                0))
            a1Jw))
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
;              a1Jw
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a1Jw))
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
; [WD] hole{a1Km} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JC,a1JD],*: [a1JD,a1JC])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{a1Km} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JC
;      a1JD)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JD
;      a1JC))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{a1Km} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JC
;      a1JD)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JD
;      a1JC))

; WANTEDS (names)
;  a1JC  <=  u
;  a1JD  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1JC (Array String Int))
; (declare-const a1JD (Array String Int))
(declare-const
   a1JC
   (Array String Int))
(declare-const
   a1JD
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
              a1JC
              a1JD)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1JD
              a1JC)))
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
;              a1JC
;              a1JD)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1JD
;              a1JC)))
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
; [WD] hole{a1Kx} {1}:: (u *: (v *: w))
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JK,*: [a1JL,a1JM]],*: [*: [a1JK,a1JL],a1JM])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a1Kx} {1}:: (u *: (v *: w))
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JK
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1JL
;        a1JM))
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
;        a1JK
;        a1JL)
;      a1JM))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a1Kx} {1}:: (u *: (v *: w))
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JK
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1JL
;        a1JM))
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
;        a1JK
;        a1JL)
;      a1JM))

; WANTEDS (names)
;  a1JK  <=  u
;  a1JL  <=  v
;  a1JM  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1JK (Array String Int))
; (declare-const a1JL (Array String Int))
; (declare-const a1JM (Array String Int))
(declare-const
   a1JK
   (Array String Int))
(declare-const
   a1JL
   (Array String Int))
(declare-const
   a1JM
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
              a1JK
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a1JL
                a1JM))
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
                a1JK
                a1JL)
              a1JM)))
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
;              a1JK
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1JL
;                a1JM))
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
;                a1JK
;                a1JL)
;              a1JM)))
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
; [WD] hole{adVS} {2}:: One
;                       ~
;                       (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{adVS} {2}:: One
;                            ~
;                            (Base "cd" /: Base "cd") (CNonCanonical)
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
;      [WD] hole{adVS} {2}:: One
;                            ~
;                            (Base "cd" /: Base "cd") (CNonCanonical)
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
; [WD] hole{adWn} {2}:: One
;                       ~
;                       (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{adWn} {2}:: One
;                            ~
;                            (Base "mol" /: Base "mol") (CNonCanonical)
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
;      [WD] hole{adWn} {2}:: One
;                            ~
;                            (Base "mol" /: Base "mol") (CNonCanonical)
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
; [WD] hole{adWS} {2}:: One ~ (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{adWS} {2}:: One
;                            ~
;                            (Base "K" /: Base "K") (CNonCanonical)
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
;      [WD] hole{adWS} {2}:: One
;                            ~
;                            (Base "K" /: Base "K") (CNonCanonical)
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
; [WD] hole{adXn} {2}:: One ~ (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{adXn} {2}:: One
;                            ~
;                            (Base "A" /: Base "A") (CNonCanonical)
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
;      [WD] hole{adXn} {2}:: One
;                            ~
;                            (Base "A" /: Base "A") (CNonCanonical)
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
; [WD] hole{adXS} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{adXS} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
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
;      [WD] hole{adXS} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
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
; [WD] hole{adYn} {2}:: One
;                       ~
;                       (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-26")
; GIVENS (conversions)
;      [WD] hole{adYn} {2}:: One
;                            ~
;                            (Base "kg" /: Base "kg") (CNonCanonical)
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
;      [WD] hole{adYn} {2}:: One
;                            ~
;                            (Base "kg" /: Base "kg") (CNonCanonical)
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
; [WD] hole{adYS} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-28")
; GIVENS (conversions)
;      [WD] hole{adYS} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
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
;      [WD] hole{adYS} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
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
; [WD] hole{aeuN} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aeuN} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
;      [WD] hole{aeuN} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
; [G] cobox_afr5 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_afpZ {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afq1 {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afq3 {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afq5 {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afq7 {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afq9 {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqb {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqd {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqf {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqh {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqj {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afql {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqn {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqp {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqr {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqt {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqv {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqx {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqz {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqB {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqD {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqF {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqH {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqJ {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqL {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqN {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqP {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqR {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqT {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqV {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqX {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afqZ {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afr1 {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afr3 {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afpR {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_afpT {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afpP {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_afr8 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_afr9 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{afri} {2}:: (a0 *: a0) ~ (b *: (b *: b)) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],afr4)
; (*: [afpD,afpS],afpY)
; (*: [afpD,afpY],afq0)
; (*: [afpD,afq0],afq2)
; (*: [afpD,afq2],afq4)
; (*: [afpD,afq4],afq6)
; (*: [afpD,afq6],afq8)
; (*: [afpD,afq8],afqa)
; (*: [afpD,afqa],afqc)
; (*: [afpD,afqc],afqe)
; (*: [afpD,afqe],afqg)
; (*: [afpD,afqg],afqi)
; (*: [afpD,afqi],afqk)
; (*: [afpD,afqk],afqm)
; (*: [afpD,afqm],afqo)
; (*: [afpD,afqo],afqq)
; (*: [afpD,afqq],afqs)
; (*: [afpD,afqs],afqu)
; (*: [afpD,afqu],afqw)
; (*: [afpD,afqw],afqy)
; (*: [afpD,afqy],afqA)
; (*: [afpD,afqA],afqC)
; (*: [afpD,afqC],afqE)
; (*: [afpD,afqE],afqG)
; (*: [afpD,afqG],afqI)
; (*: [afpD,afqI],afqK)
; (*: [afpD,afqK],afqM)
; (*: [afpD,afqM],afqO)
; (*: [afpD,afqO],afqQ)
; (*: [afpD,afqQ],afqS)
; (*: [afpD,afqS],afqU)
; (*: [afpD,afqU],afqW)
; (*: [afpD,afqW],afqY)
; (*: [afpD,afqY],afr0)
; (*: [afpD,afr0],afr2)
; (*: [afpD,afpD],afpQ)
; (*: [afpD,afpQ],afpS)
; (*: [afpC,afpC],afpO)
; (afr2,afr4)
; (afpO,afpS)

; WANTEDS (Thoralf style)
; (*: [afpG,afpG],*: [afpD,*: [afpD,afpD]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{afri} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afpG
;      afpG)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afpD
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afpD
;        afpD)))

; GIVENS (names)
;  afpC  <=  a
;  afpD  <=  b
;  afpO  <=  fsk_afpO
;  afpQ  <=  fsk_afpQ
;  afpS  <=  fsk_afpS
;  afpY  <=  fsk_afpY
;  afq0  <=  fsk_afq0
;  afq2  <=  fsk_afq2
;  afq4  <=  fsk_afq4
;  afq6  <=  fsk_afq6
;  afq8  <=  fsk_afq8
;  afqa  <=  fsk_afqa
;  afqc  <=  fsk_afqc
;  afqe  <=  fsk_afqe
;  afqg  <=  fsk_afqg
;  afqi  <=  fsk_afqi
;  afqk  <=  fsk_afqk
;  afqm  <=  fsk_afqm
;  afqo  <=  fsk_afqo
;  afqq  <=  fsk_afqq
;  afqs  <=  fsk_afqs
;  afqu  <=  fsk_afqu
;  afqw  <=  fsk_afqw
;  afqy  <=  fsk_afqy
;  afqA  <=  fsk_afqA
;  afqC  <=  fsk_afqC
;  afqE  <=  fsk_afqE
;  afqG  <=  fsk_afqG
;  afqI  <=  fsk_afqI
;  afqK  <=  fsk_afqK
;  afqM  <=  fsk_afqM
;  afqO  <=  fsk_afqO
;  afqQ  <=  fsk_afqQ
;  afqS  <=  fsk_afqS
;  afqU  <=  fsk_afqU
;  afqW  <=  fsk_afqW
;  afqY  <=  fsk_afqY
;  afr0  <=  fsk_afr0
;  afr2  <=  fsk_afr2
;  afr4  <=  fsk_afr4
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afpC (Array String Int))
; (declare-const afpD (Array String Int))
; (declare-const afpO (Array String Int))
; (declare-const afpQ (Array String Int))
; (declare-const afpS (Array String Int))
; (declare-const afpY (Array String Int))
; (declare-const afq0 (Array String Int))
; (declare-const afq2 (Array String Int))
; (declare-const afq4 (Array String Int))
; (declare-const afq6 (Array String Int))
; (declare-const afq8 (Array String Int))
; (declare-const afqA (Array String Int))
; (declare-const afqC (Array String Int))
; (declare-const afqE (Array String Int))
; (declare-const afqG (Array String Int))
; (declare-const afqI (Array String Int))
; (declare-const afqK (Array String Int))
; (declare-const afqM (Array String Int))
; (declare-const afqO (Array String Int))
; (declare-const afqQ (Array String Int))
; (declare-const afqS (Array String Int))
; (declare-const afqU (Array String Int))
; (declare-const afqW (Array String Int))
; (declare-const afqY (Array String Int))
; (declare-const afqa (Array String Int))
; (declare-const afqc (Array String Int))
; (declare-const afqe (Array String Int))
; (declare-const afqg (Array String Int))
; (declare-const afqi (Array String Int))
; (declare-const afqk (Array String Int))
; (declare-const afqm (Array String Int))
; (declare-const afqo (Array String Int))
; (declare-const afqq (Array String Int))
; (declare-const afqs (Array String Int))
; (declare-const afqu (Array String Int))
; (declare-const afqw (Array String Int))
; (declare-const afqy (Array String Int))
; (declare-const afr0 (Array String Int))
; (declare-const afr2 (Array String Int))
; (declare-const afr4 (Array String Int))
(declare-const
   afpC
   (Array String Int))
(declare-const
   afpD
   (Array String Int))
(declare-const
   afpO
   (Array String Int))
(declare-const
   afpQ
   (Array String Int))
(declare-const
   afpS
   (Array String Int))
(declare-const
   afpY
   (Array String Int))
(declare-const
   afq0
   (Array String Int))
(declare-const
   afq2
   (Array String Int))
(declare-const
   afq4
   (Array String Int))
(declare-const
   afq6
   (Array String Int))
(declare-const
   afq8
   (Array String Int))
(declare-const
   afqa
   (Array String Int))
(declare-const
   afqc
   (Array String Int))
(declare-const
   afqe
   (Array String Int))
(declare-const
   afqg
   (Array String Int))
(declare-const
   afqi
   (Array String Int))
(declare-const
   afqk
   (Array String Int))
(declare-const
   afqm
   (Array String Int))
(declare-const
   afqo
   (Array String Int))
(declare-const
   afqq
   (Array String Int))
(declare-const
   afqs
   (Array String Int))
(declare-const
   afqu
   (Array String Int))
(declare-const
   afqw
   (Array String Int))
(declare-const
   afqy
   (Array String Int))
(declare-const
   afqA
   (Array String Int))
(declare-const
   afqC
   (Array String Int))
(declare-const
   afqE
   (Array String Int))
(declare-const
   afqG
   (Array String Int))
(declare-const
   afqI
   (Array String Int))
(declare-const
   afqK
   (Array String Int))
(declare-const
   afqM
   (Array String Int))
(declare-const
   afqO
   (Array String Int))
(declare-const
   afqQ
   (Array String Int))
(declare-const
   afqS
   (Array String Int))
(declare-const
   afqU
   (Array String Int))
(declare-const
   afqW
   (Array String Int))
(declare-const
   afqY
   (Array String Int))
(declare-const
   afr0
   (Array String Int))
(declare-const
   afr2
   (Array String Int))
(declare-const
   afr4
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         afr4)
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
           afpD
           afpS)
         afpY)
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
           afpD
           afpY)
         afq0)
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
           afpD
           afq0)
         afq2)
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
           afpD
           afq2)
         afq4)
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
           afpD
           afq4)
         afq6)
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
           afpD
           afq6)
         afq8)
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
           afpD
           afq8)
         afqa)
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
           afpD
           afqa)
         afqc)
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
           afpD
           afqc)
         afqe)
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
           afpD
           afqe)
         afqg)
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
           afpD
           afqg)
         afqi)
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
           afpD
           afqi)
         afqk)
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
           afpD
           afqk)
         afqm)
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
           afpD
           afqm)
         afqo)
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
           afpD
           afqo)
         afqq)
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
           afpD
           afqq)
         afqs)
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
           afpD
           afqs)
         afqu)
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
           afpD
           afqu)
         afqw)
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
           afpD
           afqw)
         afqy)
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
           afpD
           afqy)
         afqA)
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
           afpD
           afqA)
         afqC)
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
           afpD
           afqC)
         afqE)
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
           afpD
           afqE)
         afqG)
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
           afpD
           afqG)
         afqI)
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
           afpD
           afqI)
         afqK)
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
           afpD
           afqK)
         afqM)
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
           afpD
           afqM)
         afqO)
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
           afpD
           afqO)
         afqQ)
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
           afpD
           afqQ)
         afqS)
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
           afpD
           afqS)
         afqU)
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
           afpD
           afqU)
         afqW)
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
           afpD
           afqW)
         afqY)
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
           afpD
           afqY)
         afr0)
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
           afpD
           afr0)
         afr2)
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
           afpD
           afpD)
         afpQ)
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
           afpD
           afpQ)
         afpS)
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
           afpC
           afpC)
         afpO)
      :named
      given-2.38))
(assert
   (!
      (= afr2 afr4)
      :named
      given-2.39))
(assert
   (!
      (= afpO afpS)
      :named
      given-2.40))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{afri} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afpG
;      afpG)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afpD
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afpD
;        afpD)))

; WANTEDS (names)
;  afpD  <=  b
;  afpG  <=  a_afpG
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const afpG (Array String Int))
(declare-const
   afpG
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
              afpG
              afpG)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              afpD
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                afpD
                afpD))))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      afqi
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
;           afpD
;           afqY)
;         afr0))
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
;           afpD
;           afq4)
;         afq6))
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
;           afpD
;           afqQ)
;         afqS))
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
;           afpD
;           afqm)
;         afqo))
;   (define-fun
;      afpG
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
;      afqC
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
;           afpD
;           afpD)
;         afpQ))
;   (define-fun
;      afpY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           afpD
;           afqE)
;         afqG))
;   (define-fun
;      afqk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqK
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
;           afpD
;           afqo)
;         afqq))
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
;           afpD
;           afqu)
;         afqw))
;   (define-fun
;      afpQ
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
;      (= afpO afpS))
;   (define-fun
;      afqe
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afpO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           afpD
;           afqC)
;         afqE))
;   (define-fun
;      afqA
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
;           afpD
;           afqc)
;         afqe))
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
;           afpD
;           afqq)
;         afqs))
;   (define-fun
;      afpS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           afpD
;           afqS)
;         afqU))
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
;           afpD
;           afqM)
;         afqO))
;   (define-fun
;      afqE
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
;           afpD
;           afqe)
;         afqg))
;   (define-fun
;      afqY
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
;           afpD
;           afqw)
;         afqy))
;   (define-fun
;      afpC
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afr2
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afq6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afq4
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
;           afpD
;           afq2)
;         afq4))
;   (define-fun
;      afqa
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           afpD
;           afqU)
;         afqW))
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
;           afpD
;           afqO)
;         afqQ))
;   (define-fun
;      afqq
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqu
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
;           afpD
;           afqg)
;         afqi))
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
;           afpD
;           afqi)
;         afqk))
;   (define-fun
;      afqo
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
;           afpD
;           afpQ)
;         afpS))
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
;           afpD
;           afpS)
;         afpY))
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
;           afpD
;           afq8)
;         afqa))
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
;           afpD
;           afqA)
;         afqC))
;   (define-fun
;      afqc
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
;           afpD
;           afqW)
;         afqY))
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
;              afpG
;              afpG)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              afpD
;              afpD
;              afpD))))
;   (define-fun
;      given-2.39
;      ()
;      Bool
;      (= afr2 afr4))
;   (define-fun
;      afqs
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
;           afpD
;           afqk)
;         afqm))
;   (define-fun
;      afqm
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqW
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
;           afpD
;           afqs)
;         afqu))
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
;           afpD
;           afr0)
;         afr2))
;   (define-fun
;      afr4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afpD
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afq0
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afr0
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
;           afpC
;           afpC)
;         afpO))
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
;           afpD
;           afqK)
;         afqM))
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
;           afpD
;           afqy)
;         afqA))
;   (define-fun
;      afq2
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
;           afpD
;           afqa)
;         afqc))
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
;           afpD
;           afqG)
;         afqI))
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
;      afqS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqU
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqy
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           afpD
;           afpY)
;         afq0))
;   (define-fun
;      afqw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqM
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
;           (as
;              const
;              (Array String Int))
;           0)
;         afr4))
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
;           afpD
;           afqI)
;         afqK))
;   (define-fun
;      afq8
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
;           afpD
;           afq6)
;         afq8))
;   (define-fun
;      afqg
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afqI
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
;           afpD
;           afq0)
;         afq2))
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
; [G] cobox_afrX {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_afrR {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afrT {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afrV {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afrJ {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_afrL {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_afrH {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_afs0 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_afs1 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{afsd} {3}:: (b0 *: (b0 *: b0))
;                       ~
;                       (b *: (b *: b)) (CNonCanonical)
; [WD] hole{afsm} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                       ~
;                       One (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],afrW)
; (*: [afrv,afrK],afrQ)
; (*: [afrv,afrQ],afrS)
; (*: [afrv,afrS],afrU)
; (*: [afrv,afrv],afrI)
; (*: [afrv,afrI],afrK)
; (*: [afru,afru],afrG)
; (afrU,afrW)
; (afrG,afrK)

; WANTEDS (Thoralf style)
; (*: [afrz,*: [afrz,afrz]],*: [afrv,*: [afrv,afrv]])
; (*: [afrz,*: [afrz,*: [afrz,*: [afrz,*: [afrz,afrz]]]]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{afsd} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afrz
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afrz
;        afrz))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afrv
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afrv
;        afrv)))

;      [WD] hole{afsm} {2}:: (b0
;                             *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                            ~
;                            One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afrz
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afrz
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          afrz
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            afrz
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              afrz
;              afrz)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
;  afru  <=  a
;  afrv  <=  b
;  afrG  <=  fsk_afrG
;  afrI  <=  fsk_afrI
;  afrK  <=  fsk_afrK
;  afrQ  <=  fsk_afrQ
;  afrS  <=  fsk_afrS
;  afrU  <=  fsk_afrU
;  afrW  <=  fsk_afrW
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afrG (Array String Int))
; (declare-const afrI (Array String Int))
; (declare-const afrK (Array String Int))
; (declare-const afrQ (Array String Int))
; (declare-const afrS (Array String Int))
; (declare-const afrU (Array String Int))
; (declare-const afrW (Array String Int))
; (declare-const afru (Array String Int))
; (declare-const afrv (Array String Int))
(declare-const
   afru
   (Array String Int))
(declare-const
   afrv
   (Array String Int))
(declare-const
   afrG
   (Array String Int))
(declare-const
   afrI
   (Array String Int))
(declare-const
   afrK
   (Array String Int))
(declare-const
   afrQ
   (Array String Int))
(declare-const
   afrS
   (Array String Int))
(declare-const
   afrU
   (Array String Int))
(declare-const
   afrW
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         afrW)
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
           afrv
           afrK)
         afrQ)
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
           afrv
           afrQ)
         afrS)
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
           afrv
           afrS)
         afrU)
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
           afrv
           afrv)
         afrI)
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
           afrv
           afrI)
         afrK)
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
           afru
           afru)
         afrG)
      :named
      given-4.7))
(assert
   (!
      (= afrU afrW)
      :named
      given-4.8))
(assert
   (!
      (= afrG afrK)
      :named
      given-4.9))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{afsd} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afrz
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afrz
;        afrz))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afrv
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afrv
;        afrv)))

;      [WD] hole{afsm} {2}:: (b0
;                             *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                            ~
;                            One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      afrz
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        afrz
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          afrz
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            afrz
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              afrz
;              afrz)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  afrv  <=  b
;  afrz  <=  b_afrz
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const afrz (Array String Int))
(declare-const
   afrz
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
                 afrz
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   afrz
                   afrz))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 afrv
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   afrv
                   afrv))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 afrz
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   afrz
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     afrz
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       afrz
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         afrz
                         afrz)))))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
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
;           afru
;           afru)
;         afrG))
;   (define-fun
;      afrG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afrK
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
;           afrv
;           afrS)
;         afrU))
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
;      afrI
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afrU
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afrS
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
;           afrv
;           afrQ)
;         afrS))
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
;           afrv
;           afrv)
;         afrI))
;   (define-fun
;      afru
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
;           afrv
;           afrI)
;         afrK))
;   (define-fun
;      given-4.9
;      ()
;      Bool
;      (= afrG afrK))
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
;                      afrz
;                      afrz
;                      afrz
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        afrz
;                        afrz
;                        afrz))
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
;                    afrz
;                    afrz
;                    afrz)
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    afrv
;                    afrv
;                    afrv)))
;            a!1)))
;   (define-fun
;      afrv
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
;           afrv
;           afrK)
;         afrQ))
;   (define-fun
;      afrQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      afrz
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         (- 1)))
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
;         afrW))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= afrU afrW))
;   (define-fun
;      afrW
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
; [G] cobox_aftk {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_aftf {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_aftg {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_aftn {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aftx} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{aftC} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [afsZ,afsZ],aftj)
; (*: [afsZ,aft0],afte)
; (afte,afsY)
; (aftj,afsZ)

; WANTEDS (Thoralf style)
; (*: [aft5,aft0],afsY)
; (*: [aft5,aft5],aft5)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{aftx} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aft5
;      aft0)
;    afsY)

;      [WD] hole{aftC} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aft5
;      aft5)
;    aft5)

; GIVENS (names)
;  afsY  <=  u
;  afsZ  <=  v
;  aft0  <=  w
;  afte  <=  fsk_afte
;  aftj  <=  fsk_aftj
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const afsY (Array String Int))
; (declare-const afsZ (Array String Int))
; (declare-const aft0 (Array String Int))
; (declare-const afte (Array String Int))
; (declare-const aftj (Array String Int))
(declare-const
   afsY
   (Array String Int))
(declare-const
   afsZ
   (Array String Int))
(declare-const
   aft0
   (Array String Int))
(declare-const
   afte
   (Array String Int))
(declare-const
   aftj
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
           afsZ
           afsZ)
         aftj)
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
           afsZ
           aft0)
         afte)
      :named
      given-7.2))
(assert
   (!
      (= afte afsY)
      :named
      given-7.3))
(assert
   (!
      (= aftj afsZ)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{aftx} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aft5
;      aft0)
;    afsY)

;      [WD] hole{aftC} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aft5
;      aft5)
;    aft5)

; WANTEDS (names)
;  afsY  <=  u
;  aft0  <=  w
;  aft5  <=  v_aft5
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aft5 (Array String Int))
(declare-const
   aft5
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
                 aft5
                 aft0)
               afsY))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aft5
                 aft5)
               aft5)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (define-fun
;      afsZ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aft0
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         8855))
;   (define-fun
;      afte
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         8855))
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
;      (= aftj afsZ))
;   (define-fun
;      aftj
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           afsZ
;           afsZ)
;         aftj))
;   (define-fun
;      afsY
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         8855))
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
;                 aft5
;                 aft0)
;               afsY))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aft5
;                 aft5)
;               aft5))))
;   (define-fun
;      given-7.3
;      ()
;      Bool
;      (= afte afsY))
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
;           afsZ
;           aft0)
;         afte))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aft5
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
Parse Failed
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_agL3 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_agJX {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agJZ {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agK1 {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agK3 {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agK5 {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agK7 {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agK9 {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKb {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKd {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKf {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKh {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKj {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKl {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKn {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKp {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKr {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKt {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKv {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKx {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKz {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKB {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKD {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKF {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKH {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKJ {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKL {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKN {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKP {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKR {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKT {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKV {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKX {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agKZ {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agL1 {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agJP {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_agJR {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agJN {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_agL6 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_agL7 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{agLe} {2}:: One ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agL2)
; (*: [ag4C,agJQ],agJW)
; (*: [ag4C,agJW],agJY)
; (*: [ag4C,agJY],agK0)
; (*: [ag4C,agK0],agK2)
; (*: [ag4C,agK2],agK4)
; (*: [ag4C,agK4],agK6)
; (*: [ag4C,agK6],agK8)
; (*: [ag4C,agK8],agKa)
; (*: [ag4C,agKa],agKc)
; (*: [ag4C,agKc],agKe)
; (*: [ag4C,agKe],agKg)
; (*: [ag4C,agKg],agKi)
; (*: [ag4C,agKi],agKk)
; (*: [ag4C,agKk],agKm)
; (*: [ag4C,agKm],agKo)
; (*: [ag4C,agKo],agKq)
; (*: [ag4C,agKq],agKs)
; (*: [ag4C,agKs],agKu)
; (*: [ag4C,agKu],agKw)
; (*: [ag4C,agKw],agKy)
; (*: [ag4C,agKy],agKA)
; (*: [ag4C,agKA],agKC)
; (*: [ag4C,agKC],agKE)
; (*: [ag4C,agKE],agKG)
; (*: [ag4C,agKG],agKI)
; (*: [ag4C,agKI],agKK)
; (*: [ag4C,agKK],agKM)
; (*: [ag4C,agKM],agKO)
; (*: [ag4C,agKO],agKQ)
; (*: [ag4C,agKQ],agKS)
; (*: [ag4C,agKS],agKU)
; (*: [ag4C,agKU],agKW)
; (*: [ag4C,agKW],agKY)
; (*: [ag4C,agKY],agL0)
; (*: [ag4C,ag4C],agJO)
; (*: [ag4C,agJO],agJQ)
; (*: [ag4B,ag4B],agJM)
; (agL0,agL2)
; (agJM,agJQ)

; WANTEDS (Thoralf style)
; (One [],ag4C)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{agLe} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    ag4C)

; GIVENS (names)
;  ag4B  <=  a
;  ag4C  <=  b
;  agJM  <=  fsk_agJM
;  agJO  <=  fsk_agJO
;  agJQ  <=  fsk_agJQ
;  agJW  <=  fsk_agJW
;  agJY  <=  fsk_agJY
;  agK0  <=  fsk_agK0
;  agK2  <=  fsk_agK2
;  agK4  <=  fsk_agK4
;  agK6  <=  fsk_agK6
;  agK8  <=  fsk_agK8
;  agKa  <=  fsk_agKa
;  agKc  <=  fsk_agKc
;  agKe  <=  fsk_agKe
;  agKg  <=  fsk_agKg
;  agKi  <=  fsk_agKi
;  agKk  <=  fsk_agKk
;  agKm  <=  fsk_agKm
;  agKo  <=  fsk_agKo
;  agKq  <=  fsk_agKq
;  agKs  <=  fsk_agKs
;  agKu  <=  fsk_agKu
;  agKw  <=  fsk_agKw
;  agKy  <=  fsk_agKy
;  agKA  <=  fsk_agKA
;  agKC  <=  fsk_agKC
;  agKE  <=  fsk_agKE
;  agKG  <=  fsk_agKG
;  agKI  <=  fsk_agKI
;  agKK  <=  fsk_agKK
;  agKM  <=  fsk_agKM
;  agKO  <=  fsk_agKO
;  agKQ  <=  fsk_agKQ
;  agKS  <=  fsk_agKS
;  agKU  <=  fsk_agKU
;  agKW  <=  fsk_agKW
;  agKY  <=  fsk_agKY
;  agL0  <=  fsk_agL0
;  agL2  <=  fsk_agL2
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ag4B (Array String Int))
; (declare-const ag4C (Array String Int))
; (declare-const agJM (Array String Int))
; (declare-const agJO (Array String Int))
; (declare-const agJQ (Array String Int))
; (declare-const agJW (Array String Int))
; (declare-const agJY (Array String Int))
; (declare-const agK0 (Array String Int))
; (declare-const agK2 (Array String Int))
; (declare-const agK4 (Array String Int))
; (declare-const agK6 (Array String Int))
; (declare-const agK8 (Array String Int))
; (declare-const agKA (Array String Int))
; (declare-const agKC (Array String Int))
; (declare-const agKE (Array String Int))
; (declare-const agKG (Array String Int))
; (declare-const agKI (Array String Int))
; (declare-const agKK (Array String Int))
; (declare-const agKM (Array String Int))
; (declare-const agKO (Array String Int))
; (declare-const agKQ (Array String Int))
; (declare-const agKS (Array String Int))
; (declare-const agKU (Array String Int))
; (declare-const agKW (Array String Int))
; (declare-const agKY (Array String Int))
; (declare-const agKa (Array String Int))
; (declare-const agKc (Array String Int))
; (declare-const agKe (Array String Int))
; (declare-const agKg (Array String Int))
; (declare-const agKi (Array String Int))
; (declare-const agKk (Array String Int))
; (declare-const agKm (Array String Int))
; (declare-const agKo (Array String Int))
; (declare-const agKq (Array String Int))
; (declare-const agKs (Array String Int))
; (declare-const agKu (Array String Int))
; (declare-const agKw (Array String Int))
; (declare-const agKy (Array String Int))
; (declare-const agL0 (Array String Int))
; (declare-const agL2 (Array String Int))
(declare-const
   ag4B
   (Array String Int))
(declare-const
   ag4C
   (Array String Int))
(declare-const
   agJM
   (Array String Int))
(declare-const
   agJO
   (Array String Int))
(declare-const
   agJQ
   (Array String Int))
(declare-const
   agJW
   (Array String Int))
(declare-const
   agJY
   (Array String Int))
(declare-const
   agK0
   (Array String Int))
(declare-const
   agK2
   (Array String Int))
(declare-const
   agK4
   (Array String Int))
(declare-const
   agK6
   (Array String Int))
(declare-const
   agK8
   (Array String Int))
(declare-const
   agKa
   (Array String Int))
(declare-const
   agKc
   (Array String Int))
(declare-const
   agKe
   (Array String Int))
(declare-const
   agKg
   (Array String Int))
(declare-const
   agKi
   (Array String Int))
(declare-const
   agKk
   (Array String Int))
(declare-const
   agKm
   (Array String Int))
(declare-const
   agKo
   (Array String Int))
(declare-const
   agKq
   (Array String Int))
(declare-const
   agKs
   (Array String Int))
(declare-const
   agKu
   (Array String Int))
(declare-const
   agKw
   (Array String Int))
(declare-const
   agKy
   (Array String Int))
(declare-const
   agKA
   (Array String Int))
(declare-const
   agKC
   (Array String Int))
(declare-const
   agKE
   (Array String Int))
(declare-const
   agKG
   (Array String Int))
(declare-const
   agKI
   (Array String Int))
(declare-const
   agKK
   (Array String Int))
(declare-const
   agKM
   (Array String Int))
(declare-const
   agKO
   (Array String Int))
(declare-const
   agKQ
   (Array String Int))
(declare-const
   agKS
   (Array String Int))
(declare-const
   agKU
   (Array String Int))
(declare-const
   agKW
   (Array String Int))
(declare-const
   agKY
   (Array String Int))
(declare-const
   agL0
   (Array String Int))
(declare-const
   agL2
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agL2)
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
           ag4C
           agJQ)
         agJW)
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
           ag4C
           agJW)
         agJY)
      :named
      given-14.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agJY)
         agK0)
      :named
      given-14.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agK0)
         agK2)
      :named
      given-14.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agK2)
         agK4)
      :named
      given-14.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agK4)
         agK6)
      :named
      given-14.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agK6)
         agK8)
      :named
      given-14.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agK8)
         agKa)
      :named
      given-14.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKa)
         agKc)
      :named
      given-14.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKc)
         agKe)
      :named
      given-14.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKe)
         agKg)
      :named
      given-14.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKg)
         agKi)
      :named
      given-14.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKi)
         agKk)
      :named
      given-14.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKk)
         agKm)
      :named
      given-14.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKm)
         agKo)
      :named
      given-14.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKo)
         agKq)
      :named
      given-14.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKq)
         agKs)
      :named
      given-14.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKs)
         agKu)
      :named
      given-14.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKu)
         agKw)
      :named
      given-14.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKw)
         agKy)
      :named
      given-14.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKy)
         agKA)
      :named
      given-14.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKA)
         agKC)
      :named
      given-14.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKC)
         agKE)
      :named
      given-14.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKE)
         agKG)
      :named
      given-14.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKG)
         agKI)
      :named
      given-14.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKI)
         agKK)
      :named
      given-14.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKK)
         agKM)
      :named
      given-14.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKM)
         agKO)
      :named
      given-14.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKO)
         agKQ)
      :named
      given-14.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKQ)
         agKS)
      :named
      given-14.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKS)
         agKU)
      :named
      given-14.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKU)
         agKW)
      :named
      given-14.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKW)
         agKY)
      :named
      given-14.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agKY)
         agL0)
      :named
      given-14.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           ag4C)
         agJO)
      :named
      given-14.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4C
           agJO)
         agJQ)
      :named
      given-14.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4B
           ag4B)
         agJM)
      :named
      given-14.38))
(assert
   (!
      (= agL0 agL2)
      :named
      given-14.39))
(assert
   (!
      (= agJM agJQ)
      :named
      given-14.40))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{agLe} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    ag4C)

; WANTEDS (names)
;  ag4C  <=  b
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
            ag4C))
      :named
      wanted-14))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-14")
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
;         agL2)
;      :named
;      given-14.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agJQ)
;         agJW)
;      :named
;      given-14.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agJW)
;         agJY)
;      :named
;      given-14.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agJY)
;         agK0)
;      :named
;      given-14.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agK0)
;         agK2)
;      :named
;      given-14.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agK2)
;         agK4)
;      :named
;      given-14.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agK4)
;         agK6)
;      :named
;      given-14.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agK6)
;         agK8)
;      :named
;      given-14.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agK8)
;         agKa)
;      :named
;      given-14.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKa)
;         agKc)
;      :named
;      given-14.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKc)
;         agKe)
;      :named
;      given-14.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKe)
;         agKg)
;      :named
;      given-14.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKg)
;         agKi)
;      :named
;      given-14.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKi)
;         agKk)
;      :named
;      given-14.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKk)
;         agKm)
;      :named
;      given-14.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKm)
;         agKo)
;      :named
;      given-14.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKo)
;         agKq)
;      :named
;      given-14.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKq)
;         agKs)
;      :named
;      given-14.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKs)
;         agKu)
;      :named
;      given-14.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKu)
;         agKw)
;      :named
;      given-14.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKw)
;         agKy)
;      :named
;      given-14.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKy)
;         agKA)
;      :named
;      given-14.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKA)
;         agKC)
;      :named
;      given-14.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKC)
;         agKE)
;      :named
;      given-14.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKE)
;         agKG)
;      :named
;      given-14.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKG)
;         agKI)
;      :named
;      given-14.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKI)
;         agKK)
;      :named
;      given-14.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKK)
;         agKM)
;      :named
;      given-14.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKM)
;         agKO)
;      :named
;      given-14.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKO)
;         agKQ)
;      :named
;      given-14.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKQ)
;         agKS)
;      :named
;      given-14.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKS)
;         agKU)
;      :named
;      given-14.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKU)
;         agKW)
;      :named
;      given-14.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKW)
;         agKY)
;      :named
;      given-14.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agKY)
;         agL0)
;      :named
;      given-14.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           ag4C)
;         agJO)
;      :named
;      given-14.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4C
;           agJO)
;         agJQ)
;      :named
;      given-14.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4B
;           ag4B)
;         agJM)
;      :named
;      given-14.38)
;   (!
;      (= agL0 agL2)
;      :named
;      given-14.39)
;   (!
;      (= agJM agJQ)
;      :named
;      given-14.40)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            ag4C))
;      :named
;      wanted-14))
(get-unsat-core)
; (given-14.19
;    given-14.20
;    given-14.18
;    given-14.17
;    given-14.16
;    given-14.15
;    given-14.14
;    given-14.13
;    given-14.11
;    given-14.4
;    given-14.1
;    given-14.10
;    given-14.7
;    given-14.9
;    given-14.3
;    given-14.6
;    given-14.5
;    given-14.29
;    given-14.30
;    given-14.28
;    given-14.27
;    given-14.26
;    given-14.25
;    given-14.24
;    given-14.23
;    given-14.21
;    given-14.22
;    given-14.2
;    given-14.8
;    wanted-14
;    given-14.39
;    given-14.37
;    given-14.36
;    given-14.35
;    given-14.34
;    given-14.33
;    given-14.32
;    given-14.31
;    given-14.12)
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_agLy {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_agLs {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agLu {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agLw {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agLk {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_agLm {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agLi {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_agLB {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_agLC {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{agLJ} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agLx)
; (*: [ag4K,agLl],agLr)
; (*: [ag4K,agLr],agLt)
; (*: [ag4K,agLt],agLv)
; (*: [ag4K,ag4K],agLj)
; (*: [ag4K,agLj],agLl)
; (*: [ag4J,ag4J],agLh)
; (agLv,agLx)
; (agLh,agLl)

; WANTEDS (Thoralf style)
; (One [],ag4J)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{agLJ} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    ag4J)

; GIVENS (names)
;  ag4J  <=  a
;  ag4K  <=  b
;  agLh  <=  fsk_agLh
;  agLj  <=  fsk_agLj
;  agLl  <=  fsk_agLl
;  agLr  <=  fsk_agLr
;  agLt  <=  fsk_agLt
;  agLv  <=  fsk_agLv
;  agLx  <=  fsk_agLx
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ag4J (Array String Int))
; (declare-const ag4K (Array String Int))
; (declare-const agLh (Array String Int))
; (declare-const agLj (Array String Int))
; (declare-const agLl (Array String Int))
; (declare-const agLr (Array String Int))
; (declare-const agLt (Array String Int))
; (declare-const agLv (Array String Int))
; (declare-const agLx (Array String Int))
(declare-const
   ag4J
   (Array String Int))
(declare-const
   ag4K
   (Array String Int))
(declare-const
   agLh
   (Array String Int))
(declare-const
   agLj
   (Array String Int))
(declare-const
   agLl
   (Array String Int))
(declare-const
   agLr
   (Array String Int))
(declare-const
   agLt
   (Array String Int))
(declare-const
   agLv
   (Array String Int))
(declare-const
   agLx
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agLx)
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
           ag4K
           agLl)
         agLr)
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
           ag4K
           agLr)
         agLt)
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
           ag4K
           agLt)
         agLv)
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
           ag4K
           ag4K)
         agLj)
      :named
      given-16.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4K
           agLj)
         agLl)
      :named
      given-16.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4J
           ag4J)
         agLh)
      :named
      given-16.7))
(assert
   (!
      (= agLv agLx)
      :named
      given-16.8))
(assert
   (!
      (= agLh agLl)
      :named
      given-16.9))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{agLJ} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    ag4J)

; WANTEDS (names)
;  ag4J  <=  a
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
            ag4J))
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
;         agLx)
;      :named
;      given-16.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4K
;           agLl)
;         agLr)
;      :named
;      given-16.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4K
;           agLr)
;         agLt)
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
;           ag4K
;           agLt)
;         agLv)
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
;           ag4K
;           ag4K)
;         agLj)
;      :named
;      given-16.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4K
;           agLj)
;         agLl)
;      :named
;      given-16.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4J
;           ag4J)
;         agLh)
;      :named
;      given-16.7)
;   (!
;      (= agLv agLx)
;      :named
;      given-16.8)
;   (!
;      (= agLh agLl)
;      :named
;      given-16.9)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            ag4J))
;      :named
;      wanted-16))
(get-unsat-core)
; (wanted-16
;    given-16.9
;    given-16.8
;    given-16.7
;    given-16.6
;    given-16.5
;    given-16.4
;    given-16.3
;    given-16.1
;    given-16.2)
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_agLP {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_agLN {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_agLQ {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{agLV} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agLO)
; (*: [ag4R,ag4R],agLM)
; (agLM,agLO)

; WANTEDS (Thoralf style)
; (One [],ag4R)

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{agLV} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    ag4R)

; GIVENS (names)
;  ag4R  <=  a
;  agLM  <=  fsk_agLM
;  agLO  <=  fsk_agLO
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ag4R (Array String Int))
; (declare-const agLM (Array String Int))
; (declare-const agLO (Array String Int))
(declare-const
   ag4R
   (Array String Int))
(declare-const
   agLM
   (Array String Int))
(declare-const
   agLO
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agLO)
      :named
      given-18.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4R
           ag4R)
         agLM)
      :named
      given-18.2))
(assert
   (!
      (= agLM agLO)
      :named
      given-18.3))
(check-sat)
; sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
;      [WD] hole{agLV} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    ag4R)

; WANTEDS (names)
;  ag4R  <=  a
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
            ag4R))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         agLO)
;      :named
;      given-18.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4R
;           ag4R)
;         agLM)
;      :named
;      given-18.2)
;   (!
;      (= agLM agLO)
;      :named
;      given-18.3)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            ag4R))
;      :named
;      wanted-18))
(get-unsat-core)
; (given-18.1 wanted-18 given-18.2 given-18.3)
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_agM4 {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_agLZ {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_agM0 {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_agM7 {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{ag55} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [ag4Y,ag4Y],agM3)
; (*: [ag4Y,ag4Z],agLY)
; (agLY,ag4X)
; (agM3,ag4Y)

; WANTEDS (Thoralf style)
; (ag4X,ag4Z)

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{ag55} {0}:: u ~ w (CNonCanonical)
;  =>  (= ag4X ag4Z)

; GIVENS (names)
;  ag4X  <=  u
;  ag4Y  <=  v
;  ag4Z  <=  w
;  agLY  <=  fsk_agLY
;  agM3  <=  fsk_agM3
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ag4X (Array String Int))
; (declare-const ag4Y (Array String Int))
; (declare-const ag4Z (Array String Int))
; (declare-const agLY (Array String Int))
; (declare-const agM3 (Array String Int))
(declare-const
   ag4X
   (Array String Int))
(declare-const
   ag4Y
   (Array String Int))
(declare-const
   ag4Z
   (Array String Int))
(declare-const
   agLY
   (Array String Int))
(declare-const
   agM3
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
           ag4Y
           ag4Y)
         agM3)
      :named
      given-20.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag4Y
           ag4Z)
         agLY)
      :named
      given-20.2))
(assert
   (!
      (= agLY ag4X)
      :named
      given-20.3))
(assert
   (!
      (= agM3 ag4Y)
      :named
      given-20.4))
(check-sat)
; sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{ag55} {0}:: u ~ w (CNonCanonical)
;  =>  (= ag4X ag4Z)

; WANTEDS (names)
;  ag4X  <=  u
;  ag4Z  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= ag4X ag4Z))
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
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4Y
;           ag4Y)
;         agM3)
;      :named
;      given-20.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag4Y
;           ag4Z)
;         agLY)
;      :named
;      given-20.2)
;   (!
;      (= agLY ag4X)
;      :named
;      given-20.3)
;   (!
;      (= agM3 ag4Y)
;      :named
;      given-20.4)
;   (!
;      (not
;         (= ag4X ag4Z))
;      :named
;      wanted-20))
(get-unsat-core)
; (given-20.2 given-20.4 wanted-20 given-20.3 given-20.1)
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; [G] cobox_agMf {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_agMl {2}:: Base "kg" ~ fsk0 (CFunEqCan)
; [G] cobox_agMh {1}:: (w *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_agMn {1}:: (fsk0 *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_agMp {0}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_agMj {0}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_agMs {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{agMx} {2}:: Base "kg" ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],agMe)
; (Base ["kg"],agMk)
; (*: [ag57,ag57],agMg)
; (*: [agMk,agMk],agMm)
; (/: [agMe,agMm],agMo)
; (/: [agMe,agMg],agMi)
; (agMi,agMo)

; WANTEDS (Thoralf style)
; (Base ["kg"],ag57)

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{agMx} {2}:: Base "kg" ~ w (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    ag57)

; GIVENS (names)
;  ag57  <=  w
;  agMe  <=  fsk_agMe
;  agMg  <=  fsk_agMg
;  agMi  <=  fsk_agMi
;  agMk  <=  fsk_agMk
;  agMm  <=  fsk_agMm
;  agMo  <=  fsk_agMo
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ag57 (Array String Int))
; (declare-const agMe (Array String Int))
; (declare-const agMg (Array String Int))
; (declare-const agMi (Array String Int))
; (declare-const agMk (Array String Int))
; (declare-const agMm (Array String Int))
; (declare-const agMo (Array String Int))
(declare-const
   ag57
   (Array String Int))
(declare-const
   agMe
   (Array String Int))
(declare-const
   agMg
   (Array String Int))
(declare-const
   agMi
   (Array String Int))
(declare-const
   agMk
   (Array String Int))
(declare-const
   agMm
   (Array String Int))
(declare-const
   agMo
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         agMe)
      :named
      given-22.1))
(assert
   (!
      (=
         (store base "kg" one)
         agMk)
      :named
      given-22.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag57
           ag57)
         agMg)
      :named
      given-22.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           agMk
           agMk)
         agMm)
      :named
      given-22.4))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           agMe
           agMm)
         agMo)
      :named
      given-22.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           agMe
           agMg)
         agMi)
      :named
      given-22.6))
(assert
   (!
      (= agMi agMo)
      :named
      given-22.7))
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{agMx} {2}:: Base "kg" ~ w (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    ag57)

; WANTEDS (names)
;  ag57  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            ag57))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         agMe)
;      :named
;      given-22.1)
;   (!
;      (=
;         (store base "kg" one)
;         agMk)
;      :named
;      given-22.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag57
;           ag57)
;         agMg)
;      :named
;      given-22.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           agMk
;           agMk)
;         agMm)
;      :named
;      given-22.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           agMe
;           agMm)
;         agMo)
;      :named
;      given-22.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           agMe
;           agMg)
;         agMi)
;      :named
;      given-22.6)
;   (!
;      (= agMi agMo)
;      :named
;      given-22.7)
;   (!
;      (not
;         (=
;            (store base "kg" one)
;            ag57))
;      :named
;      wanted-22))
(get-unsat-core)
; (given-22.7
;    given-22.2
;    given-22.6
;    given-22.5
;    wanted-22
;    given-22.4
;    given-22.3)
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")
Parse Failed
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
(echo "solver-finish-cycle-32")
(echo "solver-start-cycle-33")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{agUu} {8}:: ((Base "m" *: One) /: (Base "s" *: One))
;                       ~
;                       (Base "m" /: Base "s") (CNonCanonical)
; [WD] hole{agUk} {8}:: ((Base "m"
;                         *: (Base "s" *: (Base "s" *: One)))
;                        /: One)
;                       ~
;                       (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
; [WD] hole{agUn} {8}:: (One /: One) ~ One (CNonCanonical)
; [WD] hole{agUx} {6}:: ((Base "m" *: One) /: One)
;                       ~
;                       Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],/: [Base ["m"],Base ["s"]])
; (/: [*: [Base ["m"],*: [Base ["s"],*: [Base ["s"],One []]]],One []],*: [Base ["m"],*: [Base ["s"],Base ["s"]]])
; (/: [One [],One []],One [])
; (/: [*: [Base ["m"],One []],One []],Base ["m"])

(echo "givens-start-cycle-33")
; GIVENS (conversions)
;      [WD] hole{agUu} {8}:: ((Base "m" *: One) /: (Base "s" *: One))
;                            ~
;                            (Base "m" /: Base "s") (CNonCanonical)
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

;      [WD] hole{agUk} {8}:: ((Base "m"
;                              *: (Base "s" *: (Base "s" *: One)))
;                             /: One)
;                            ~
;                            (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
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

;      [WD] hole{agUn} {8}:: (One /: One) ~ One (CNonCanonical)
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

;      [WD] hole{agUx} {6}:: ((Base "m" *: One) /: One)
;                            ~
;                            Base "m" (CNonCanonical)
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

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-33")
(echo "wanteds-start-cycle-33")
; WANTEDS (conversions)
;      [WD] hole{agUu} {8}:: ((Base "m" *: One) /: (Base "s" *: One))
;                            ~
;                            (Base "m" /: Base "s") (CNonCanonical)
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

;      [WD] hole{agUk} {8}:: ((Base "m"
;                              *: (Base "s" *: (Base "s" *: One)))
;                             /: One)
;                            ~
;                            (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
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

;      [WD] hole{agUn} {8}:: (One /: One) ~ One (CNonCanonical)
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

;      [WD] hole{agUx} {6}:: ((Base "m" *: One) /: One)
;                            ~
;                            Base "m" (CNonCanonical)
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

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
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
                       (store base "s" one))))
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
      :named
      wanted-33))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-33")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (or
;         (or
;            (or
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
;                         (_
;                            map
;                            (+
;                               (Int Int)
;                               Int))
;                         (store base "s" one)
;                         (
;                           (as
;                              const
;                              (Array String Int))
;                           0)))
;                     (
;                       (_
;                          map
;                          (-
;                             (Int Int)
;                             Int))
;                       (store base "m" one)
;                       (store base "s" one))))
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
;                           (_
;                              map
;                              (+
;                                 (Int Int)
;                                 Int))
;                           (store base "s" one)
;                           (
;                             (_
;                                map
;                                (+
;                                   (Int Int)
;                                   Int))
;                             (store base "s" one)
;                             (
;                               (as
;                                  const
;                                  (Array String Int))
;                               0))))
;                       (
;                         (as
;                            const
;                            (Array String Int))
;                         0))
;                     (
;                       (_
;                          map
;                          (+
;                             (Int Int)
;                             Int))
;                       (store base "m" one)
;                       (
;                         (_
;                            map
;                            (+
;                               (Int Int)
;                               Int))
;                         (store base "s" one)
;                         (store base "s" one))))))
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
;                   (store base "m" one)
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0))
;                 (
;                   (as
;                      const
;                      (Array String Int))
;                   0))
;               (store base "m" one))))
;      :named
;      wanted-33))
(get-unsat-core)
; (wanted-33)
(pop 1)
(echo "solver-finish-cycle-33")
(exit)
; [6 of 6] Compiling UnitDefsTests
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
; [WD] hole{amJ9} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{amJ9} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
;      [WD] hole{amJ9} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
; [WD] hole{a1HX} {1}:: (u *: (One /: u))
;                       ~
;                       (u0 *: (One /: u0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1HH,/: [One [],a1HH]],*: [a1HJ,/: [One [],a1HJ]])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{a1HX} {1}:: (u *: (One /: u))
;                            ~
;                            (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HH
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
;        a1HH))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HJ
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
;        a1HJ)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
;      [WD] hole{a1HX} {1}:: (u *: (One /: u))
;                            ~
;                            (u0 *: (One /: u0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HH
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
;        a1HH))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1HJ
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
;        a1HJ)))

; WANTEDS (names)
;  a1HH  <=  u
;  a1HJ  <=  u_a1HJ
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1HH (Array String Int))
; (declare-const a1HJ (Array String Int))
(declare-const
   a1HH
   (Array String Int))
(declare-const
   a1HJ
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
              a1HH
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
                a1HH))
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1HJ
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
                a1HJ))))
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
;              a1HH
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
;                a1HH))
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1HJ
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
;                a1HJ))))
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
; [WD] hole{a1IA} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
; [WD] hole{a1IF} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Ir,a1Iq],*: [a1Io,a1In])
; (*: [a1In,a1Io],*: [a1Iq,a1Ir])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a1IA} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ir
;      a1Iq)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Io
;      a1In))

;      [WD] hole{a1IF} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1In
;      a1Io)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Iq
;      a1Ir))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a1IA} {1}:: (v0 *: u0) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Ir
;      a1Iq)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Io
;      a1In))

;      [WD] hole{a1IF} {1}:: (u *: v) ~ (u0 *: v0) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1In
;      a1Io)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Iq
;      a1Ir))

; WANTEDS (names)
;  a1In  <=  u
;  a1Io  <=  v
;  a1Iq  <=  u_a1Iq
;  a1Ir  <=  v_a1Ir
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1In (Array String Int))
; (declare-const a1Io (Array String Int))
; (declare-const a1Iq (Array String Int))
; (declare-const a1Ir (Array String Int))
(declare-const
   a1In
   (Array String Int))
(declare-const
   a1Io
   (Array String Int))
(declare-const
   a1Iq
   (Array String Int))
(declare-const
   a1Ir
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
                 a1Ir
                 a1Iq)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Io
                 a1In)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1In
                 a1Io)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1Iq
                 a1Ir))))
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
;                 a1Ir
;                 a1Iq)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Io
;                 a1In)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1In
;                 a1Io)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1Iq
;                 a1Ir)))))
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
;      a1Io
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
;      a1Ir
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
;      a1Iq
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
;      a1In
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
; [WD] hole{a1Ja} {1}:: ((u0 *: v0) *: w0)
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)
; [WD] hole{a1Jj} {1}:: (u *: (v *: w))
;                       ~
;                       (u0 *: (v0 *: w0)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [*: [a1IV,a1IW],a1IX],*: [*: [a1IR,a1IS],a1IT])
; (*: [a1IR,*: [a1IS,a1IT]],*: [a1IV,*: [a1IW,a1IX]])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a1Ja} {1}:: ((u0 *: v0) *: w0)
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
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
;        a1IV
;        a1IW)
;      a1IX)
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
;        a1IR
;        a1IS)
;      a1IT))

;      [WD] hole{a1Jj} {1}:: (u *: (v *: w))
;                            ~
;                            (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IR
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IS
;        a1IT))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IV
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IW
;        a1IX)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a1Ja} {1}:: ((u0 *: v0) *: w0)
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
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
;        a1IV
;        a1IW)
;      a1IX)
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
;        a1IR
;        a1IS)
;      a1IT))

;      [WD] hole{a1Jj} {1}:: (u *: (v *: w))
;                            ~
;                            (u0 *: (v0 *: w0)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IR
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IS
;        a1IT))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1IV
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1IW
;        a1IX)))

; WANTEDS (names)
;  a1IR  <=  u
;  a1IS  <=  v
;  a1IT  <=  w
;  a1IV  <=  u_a1IV
;  a1IW  <=  v_a1IW
;  a1IX  <=  w_a1IX
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1IR (Array String Int))
; (declare-const a1IS (Array String Int))
; (declare-const a1IT (Array String Int))
; (declare-const a1IV (Array String Int))
; (declare-const a1IW (Array String Int))
; (declare-const a1IX (Array String Int))
(declare-const
   a1IR
   (Array String Int))
(declare-const
   a1IS
   (Array String Int))
(declare-const
   a1IT
   (Array String Int))
(declare-const
   a1IV
   (Array String Int))
(declare-const
   a1IW
   (Array String Int))
(declare-const
   a1IX
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
                   a1IV
                   a1IW)
                 a1IX)
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
                   a1IR
                   a1IS)
                 a1IT)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IR
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IS
                   a1IT))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1IV
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   a1IW
                   a1IX)))))
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
;                 a1IV
;                 a1IW
;                 a1IX)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1IR
;                 a1IS
;                 a1IT)))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1IR
;                 a1IS
;                 a1IT)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1IV
;                 a1IW
;                 a1IX)))))
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
;      a1IT
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
;      a1IR
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
;      a1IV
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
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      a1IS
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
;      a1IW
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
;      a1IX
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
; [WD] hole{a1K7} {1}:: (Base b /: Base b) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [Base [a1Jl],Base [a1Jl]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{a1K7} {1}:: (Base b /: Base b) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1Jl one)
;      (store base a1Jl one))
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
;      [WD] hole{a1K7} {1}:: (Base b /: Base b) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base a1Jl one)
;      (store base a1Jl one))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1Jl  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Jl String)
(declare-const a1Jl String)
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
              (store base a1Jl one)
              (store base a1Jl one))
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
;              (store base a1Jl one)
;              (store base a1Jl one))
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
; [WD] hole{a1Kg} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1Jv,/: [One [],a1Jv]],One [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a1Kg} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Jv
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
;        a1Jv))
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
;      [WD] hole{a1Kg} {1}:: (u *: (One /: u)) ~ One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1Jv
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
;        a1Jv))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  a1Jv  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1Jv (Array String Int))
(declare-const
   a1Jv
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
              a1Jv
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
                a1Jv))
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
;              a1Jv
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
;                a1Jv))
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
; [WD] hole{a1Kl} {1}:: (u *: One) ~ u (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JC,One []],a1JC)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{a1Kl} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JC
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1JC)

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{a1Kl} {1}:: (u *: One) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JC
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;    a1JC)

; WANTEDS (names)
;  a1JC  <=  u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1JC (Array String Int))
(declare-const
   a1JC
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
              a1JC
              (
                (as
                   const
                   (Array String Int))
                0))
            a1JC))
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
;              a1JC
;              (
;                (as
;                   const
;                   (Array String Int))
;                0))
;            a1JC))
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
; [WD] hole{a1Ks} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JI,a1JJ],*: [a1JJ,a1JI])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{a1Ks} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JI
;      a1JJ)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JJ
;      a1JI))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{a1Ks} {1}:: (u *: v) ~ (v *: u) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JI
;      a1JJ)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JJ
;      a1JI))

; WANTEDS (names)
;  a1JI  <=  u
;  a1JJ  <=  v
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1JI (Array String Int))
; (declare-const a1JJ (Array String Int))
(declare-const
   a1JI
   (Array String Int))
(declare-const
   a1JJ
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
              a1JI
              a1JJ)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              a1JJ
              a1JI)))
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
;              a1JI
;              a1JJ)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              a1JJ
;              a1JI)))
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
; [WD] hole{a1KD} {1}:: (u *: (v *: w))
;                       ~
;                       ((u *: v) *: w) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [a1JQ,*: [a1JR,a1JS]],*: [*: [a1JQ,a1JR],a1JS])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a1KD} {1}:: (u *: (v *: w))
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JQ
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1JR
;        a1JS))
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
;        a1JQ
;        a1JR)
;      a1JS))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a1KD} {1}:: (u *: (v *: w))
;                            ~
;                            ((u *: v) *: w) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a1JQ
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        a1JR
;        a1JS))
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
;        a1JQ
;        a1JR)
;      a1JS))

; WANTEDS (names)
;  a1JQ  <=  u
;  a1JR  <=  v
;  a1JS  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1JQ (Array String Int))
; (declare-const a1JR (Array String Int))
; (declare-const a1JS (Array String Int))
(declare-const
   a1JQ
   (Array String Int))
(declare-const
   a1JR
   (Array String Int))
(declare-const
   a1JS
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
              a1JQ
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                a1JR
                a1JS))
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
                a1JQ
                a1JR)
              a1JS)))
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
;              a1JQ
;              (
;                (_
;                   map
;                   (+
;                      (Int Int)
;                      Int))
;                a1JR
;                a1JS))
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
;                a1JQ
;                a1JR)
;              a1JS)))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
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
; [WD] hole{abr4} {2}:: One
;                       ~
;                       (Base "cd" /: Base "cd") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["cd"],Base ["cd"]])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{abr4} {2}:: One
;                            ~
;                            (Base "cd" /: Base "cd") (CNonCanonical)
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
;      [WD] hole{abr4} {2}:: One
;                            ~
;                            (Base "cd" /: Base "cd") (CNonCanonical)
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
; [WD] hole{abrz} {2}:: One
;                       ~
;                       (Base "mol" /: Base "mol") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["mol"],Base ["mol"]])

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{abrz} {2}:: One
;                            ~
;                            (Base "mol" /: Base "mol") (CNonCanonical)
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
;      [WD] hole{abrz} {2}:: One
;                            ~
;                            (Base "mol" /: Base "mol") (CNonCanonical)
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
; [WD] hole{abs4} {2}:: One ~ (Base "K" /: Base "K") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["K"],Base ["K"]])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{abs4} {2}:: One
;                            ~
;                            (Base "K" /: Base "K") (CNonCanonical)
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
;      [WD] hole{abs4} {2}:: One
;                            ~
;                            (Base "K" /: Base "K") (CNonCanonical)
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
; [WD] hole{absz} {2}:: One ~ (Base "A" /: Base "A") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["A"],Base ["A"]])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{absz} {2}:: One
;                            ~
;                            (Base "A" /: Base "A") (CNonCanonical)
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
;      [WD] hole{absz} {2}:: One
;                            ~
;                            (Base "A" /: Base "A") (CNonCanonical)
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
; [WD] hole{abt4} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{abt4} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
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
;      [WD] hole{abt4} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
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
; [WD] hole{abtz} {2}:: One
;                       ~
;                       (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-26")
; GIVENS (conversions)
;      [WD] hole{abtz} {2}:: One
;                            ~
;                            (Base "kg" /: Base "kg") (CNonCanonical)
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
;      [WD] hole{abtz} {2}:: One
;                            ~
;                            (Base "kg" /: Base "kg") (CNonCanonical)
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
; [WD] hole{abu4} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-28")
; GIVENS (conversions)
;      [WD] hole{abu4} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
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
;      [WD] hole{abu4} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
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
; [WD] hole{acch} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{acch} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
;      [WD] hole{acch} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
; [G] cobox_adLj {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_adKd {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKf {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKh {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKj {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKl {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKn {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKp {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKr {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKt {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKv {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKx {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKz {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKB {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKD {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKF {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKH {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKJ {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKL {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKN {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKP {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKR {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKT {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKV {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKX {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adKZ {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adL1 {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adL3 {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adL5 {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adL7 {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adL9 {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adLb {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adLd {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adLf {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adLh {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adK5 {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_adK7 {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adK3 {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_adLm {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_adLn {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{adLw} {2}:: (a0 *: a0) ~ (b *: (b *: b)) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],adLi)
; (*: [adJR,adK6],adKc)
; (*: [adJR,adKc],adKe)
; (*: [adJR,adKe],adKg)
; (*: [adJR,adKg],adKi)
; (*: [adJR,adKi],adKk)
; (*: [adJR,adKk],adKm)
; (*: [adJR,adKm],adKo)
; (*: [adJR,adKo],adKq)
; (*: [adJR,adKq],adKs)
; (*: [adJR,adKs],adKu)
; (*: [adJR,adKu],adKw)
; (*: [adJR,adKw],adKy)
; (*: [adJR,adKy],adKA)
; (*: [adJR,adKA],adKC)
; (*: [adJR,adKC],adKE)
; (*: [adJR,adKE],adKG)
; (*: [adJR,adKG],adKI)
; (*: [adJR,adKI],adKK)
; (*: [adJR,adKK],adKM)
; (*: [adJR,adKM],adKO)
; (*: [adJR,adKO],adKQ)
; (*: [adJR,adKQ],adKS)
; (*: [adJR,adKS],adKU)
; (*: [adJR,adKU],adKW)
; (*: [adJR,adKW],adKY)
; (*: [adJR,adKY],adL0)
; (*: [adJR,adL0],adL2)
; (*: [adJR,adL2],adL4)
; (*: [adJR,adL4],adL6)
; (*: [adJR,adL6],adL8)
; (*: [adJR,adL8],adLa)
; (*: [adJR,adLa],adLc)
; (*: [adJR,adLc],adLe)
; (*: [adJR,adLe],adLg)
; (*: [adJR,adJR],adK4)
; (*: [adJR,adK4],adK6)
; (*: [adJQ,adJQ],adK2)
; (adLg,adLi)
; (adK2,adK6)

; WANTEDS (Thoralf style)
; (*: [adJU,adJU],*: [adJR,*: [adJR,adJR]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{adLw} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adJU
;      adJU)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adJR
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adJR
;        adJR)))

; GIVENS (names)
;  adJQ  <=  a
;  adJR  <=  b
;  adK2  <=  fsk_adK2
;  adK4  <=  fsk_adK4
;  adK6  <=  fsk_adK6
;  adKc  <=  fsk_adKc
;  adKe  <=  fsk_adKe
;  adKg  <=  fsk_adKg
;  adKi  <=  fsk_adKi
;  adKk  <=  fsk_adKk
;  adKm  <=  fsk_adKm
;  adKo  <=  fsk_adKo
;  adKq  <=  fsk_adKq
;  adKs  <=  fsk_adKs
;  adKu  <=  fsk_adKu
;  adKw  <=  fsk_adKw
;  adKy  <=  fsk_adKy
;  adKA  <=  fsk_adKA
;  adKC  <=  fsk_adKC
;  adKE  <=  fsk_adKE
;  adKG  <=  fsk_adKG
;  adKI  <=  fsk_adKI
;  adKK  <=  fsk_adKK
;  adKM  <=  fsk_adKM
;  adKO  <=  fsk_adKO
;  adKQ  <=  fsk_adKQ
;  adKS  <=  fsk_adKS
;  adKU  <=  fsk_adKU
;  adKW  <=  fsk_adKW
;  adKY  <=  fsk_adKY
;  adL0  <=  fsk_adL0
;  adL2  <=  fsk_adL2
;  adL4  <=  fsk_adL4
;  adL6  <=  fsk_adL6
;  adL8  <=  fsk_adL8
;  adLa  <=  fsk_adLa
;  adLc  <=  fsk_adLc
;  adLe  <=  fsk_adLe
;  adLg  <=  fsk_adLg
;  adLi  <=  fsk_adLi
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const adJQ (Array String Int))
; (declare-const adJR (Array String Int))
; (declare-const adK2 (Array String Int))
; (declare-const adK4 (Array String Int))
; (declare-const adK6 (Array String Int))
; (declare-const adKA (Array String Int))
; (declare-const adKC (Array String Int))
; (declare-const adKE (Array String Int))
; (declare-const adKG (Array String Int))
; (declare-const adKI (Array String Int))
; (declare-const adKK (Array String Int))
; (declare-const adKM (Array String Int))
; (declare-const adKO (Array String Int))
; (declare-const adKQ (Array String Int))
; (declare-const adKS (Array String Int))
; (declare-const adKU (Array String Int))
; (declare-const adKW (Array String Int))
; (declare-const adKY (Array String Int))
; (declare-const adKc (Array String Int))
; (declare-const adKe (Array String Int))
; (declare-const adKg (Array String Int))
; (declare-const adKi (Array String Int))
; (declare-const adKk (Array String Int))
; (declare-const adKm (Array String Int))
; (declare-const adKo (Array String Int))
; (declare-const adKq (Array String Int))
; (declare-const adKs (Array String Int))
; (declare-const adKu (Array String Int))
; (declare-const adKw (Array String Int))
; (declare-const adKy (Array String Int))
; (declare-const adL0 (Array String Int))
; (declare-const adL2 (Array String Int))
; (declare-const adL4 (Array String Int))
; (declare-const adL6 (Array String Int))
; (declare-const adL8 (Array String Int))
; (declare-const adLa (Array String Int))
; (declare-const adLc (Array String Int))
; (declare-const adLe (Array String Int))
; (declare-const adLg (Array String Int))
; (declare-const adLi (Array String Int))
(declare-const
   adJQ
   (Array String Int))
(declare-const
   adJR
   (Array String Int))
(declare-const
   adK2
   (Array String Int))
(declare-const
   adK4
   (Array String Int))
(declare-const
   adK6
   (Array String Int))
(declare-const
   adKc
   (Array String Int))
(declare-const
   adKe
   (Array String Int))
(declare-const
   adKg
   (Array String Int))
(declare-const
   adKi
   (Array String Int))
(declare-const
   adKk
   (Array String Int))
(declare-const
   adKm
   (Array String Int))
(declare-const
   adKo
   (Array String Int))
(declare-const
   adKq
   (Array String Int))
(declare-const
   adKs
   (Array String Int))
(declare-const
   adKu
   (Array String Int))
(declare-const
   adKw
   (Array String Int))
(declare-const
   adKy
   (Array String Int))
(declare-const
   adKA
   (Array String Int))
(declare-const
   adKC
   (Array String Int))
(declare-const
   adKE
   (Array String Int))
(declare-const
   adKG
   (Array String Int))
(declare-const
   adKI
   (Array String Int))
(declare-const
   adKK
   (Array String Int))
(declare-const
   adKM
   (Array String Int))
(declare-const
   adKO
   (Array String Int))
(declare-const
   adKQ
   (Array String Int))
(declare-const
   adKS
   (Array String Int))
(declare-const
   adKU
   (Array String Int))
(declare-const
   adKW
   (Array String Int))
(declare-const
   adKY
   (Array String Int))
(declare-const
   adL0
   (Array String Int))
(declare-const
   adL2
   (Array String Int))
(declare-const
   adL4
   (Array String Int))
(declare-const
   adL6
   (Array String Int))
(declare-const
   adL8
   (Array String Int))
(declare-const
   adLa
   (Array String Int))
(declare-const
   adLc
   (Array String Int))
(declare-const
   adLe
   (Array String Int))
(declare-const
   adLg
   (Array String Int))
(declare-const
   adLi
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         adLi)
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
           adJR
           adK6)
         adKc)
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
           adJR
           adKc)
         adKe)
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
           adJR
           adKe)
         adKg)
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
           adJR
           adKg)
         adKi)
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
           adJR
           adKi)
         adKk)
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
           adJR
           adKk)
         adKm)
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
           adJR
           adKm)
         adKo)
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
           adJR
           adKo)
         adKq)
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
           adJR
           adKq)
         adKs)
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
           adJR
           adKs)
         adKu)
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
           adJR
           adKu)
         adKw)
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
           adJR
           adKw)
         adKy)
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
           adJR
           adKy)
         adKA)
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
           adJR
           adKA)
         adKC)
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
           adJR
           adKC)
         adKE)
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
           adJR
           adKE)
         adKG)
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
           adJR
           adKG)
         adKI)
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
           adJR
           adKI)
         adKK)
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
           adJR
           adKK)
         adKM)
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
           adJR
           adKM)
         adKO)
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
           adJR
           adKO)
         adKQ)
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
           adJR
           adKQ)
         adKS)
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
           adJR
           adKS)
         adKU)
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
           adJR
           adKU)
         adKW)
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
           adJR
           adKW)
         adKY)
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
           adJR
           adKY)
         adL0)
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
           adJR
           adL0)
         adL2)
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
           adJR
           adL2)
         adL4)
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
           adJR
           adL4)
         adL6)
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
           adJR
           adL6)
         adL8)
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
           adJR
           adL8)
         adLa)
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
           adJR
           adLa)
         adLc)
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
           adJR
           adLc)
         adLe)
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
           adJR
           adLe)
         adLg)
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
           adJR
           adJR)
         adK4)
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
           adJR
           adK4)
         adK6)
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
           adJQ
           adJQ)
         adK2)
      :named
      given-2.38))
(assert
   (!
      (= adLg adLi)
      :named
      given-2.39))
(assert
   (!
      (= adK2 adK6)
      :named
      given-2.40))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{adLw} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adJU
;      adJU)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adJR
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adJR
;        adJR)))

; WANTEDS (names)
;  adJR  <=  b
;  adJU  <=  a_adJU
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const adJU (Array String Int))
(declare-const
   adJU
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
              adJU
              adJU)
            (
              (_
                 map
                 (+
                    (Int Int)
                    Int))
              adJR
              (
                (_
                   map
                   (+
                      (Int Int)
                      Int))
                adJR
                adJR))))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      adKk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKi
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
;           adJR
;           adLc)
;         adLe))
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
;           adJR
;           adKi)
;         adKk))
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
;           adJR
;           adL4)
;         adL6))
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
;           adJR
;           adKA)
;         adKC))
;   (define-fun
;      adJR
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKq
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
;           adJR
;           adJR)
;         adK4))
;   (define-fun
;      adKW
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           adJR
;           adKS)
;         adKU))
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
;           adJR
;           adKC)
;         adKE))
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
;           adJR
;           adKI)
;         adKK))
;   (define-fun
;      adLc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adL2
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adLe
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adJQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKe
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
;      (= adK2 adK6))
;   (define-fun
;      adKg
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKm
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           adJR
;           adKQ)
;         adKS))
;   (define-fun
;      adK6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adJU
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
;      adKc
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
;           adJR
;           adKq)
;         adKs))
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
;           adJR
;           adKE)
;         adKG))
;   (define-fun
;      adKY
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           adJR
;           adL6)
;         adL8))
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
;           adJR
;           adL0)
;         adL2))
;   (define-fun
;      adL4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKs
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
;           adJR
;           adKs)
;         adKu))
;   (define-fun
;      adL6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKM
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
;           adJR
;           adKK)
;         adKM))
;   (define-fun
;      adKO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKo
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
;           adJR
;           adKg)
;         adKi))
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
;           adJR
;           adL8)
;         adLa))
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
;           adJR
;           adL2)
;         adL4))
;   (define-fun
;      adKC
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
;           adJR
;           adKu)
;         adKw))
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
;           adJR
;           adKw)
;         adKy))
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
;           adJR
;           adK4)
;         adK6))
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
;           adJR
;           adK6)
;         adKc))
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
;           adJR
;           adKm)
;         adKo))
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
;           adJR
;           adKO)
;         adKQ))
;   (define-fun
;      adKA
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
;           adJR
;           adLa)
;         adLc))
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
;              adJU
;              adJU)
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              adJR
;              adJR
;              adJR))))
;   (define-fun
;      given-2.39
;      ()
;      Bool
;      (= adLg adLi))
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
;           adJR
;           adKy)
;         adKA))
;   (define-fun
;      adKI
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adL8
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
;           adJR
;           adKG)
;         adKI))
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
;           adJR
;           adLe)
;         adLg))
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
;           adJQ
;           adJQ)
;         adK2))
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
;           adJR
;           adKY)
;         adL0))
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
;           adJR
;           adKM)
;         adKO))
;   (define-fun
;      adKy
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
;           adJR
;           adKo)
;         adKq))
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
;           adJR
;           adKU)
;         adKW))
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
;      adKw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKK
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           adJR
;           adKc)
;         adKe))
;   (define-fun
;      adKQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adKU
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
;           (as
;              const
;              (Array String Int))
;           0)
;         adLi))
;   (define-fun
;      adKE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adL0
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adLa
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
;           adJR
;           adKW)
;         adKY))
;   (define-fun
;      adLg
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adK4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adK2
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
;           adJR
;           adKk)
;         adKm))
;   (define-fun
;      adLi
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
;           adJR
;           adKe)
;         adKg))
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
; [G] cobox_adMb {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_adM5 {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adM7 {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adM9 {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adLX {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_adLZ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_adLV {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_adMe {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_adMf {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{adMr} {3}:: (b0 *: (b0 *: b0))
;                       ~
;                       (b *: (b *: b)) (CNonCanonical)
; [WD] hole{adMA} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                       ~
;                       One (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],adMa)
; (*: [adLJ,adLY],adM4)
; (*: [adLJ,adM4],adM6)
; (*: [adLJ,adM6],adM8)
; (*: [adLJ,adLJ],adLW)
; (*: [adLJ,adLW],adLY)
; (*: [adLI,adLI],adLU)
; (adM8,adMa)
; (adLU,adLY)

; WANTEDS (Thoralf style)
; (*: [adLN,*: [adLN,adLN]],*: [adLJ,*: [adLJ,adLJ]])
; (*: [adLN,*: [adLN,*: [adLN,*: [adLN,*: [adLN,adLN]]]]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{adMr} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adLN
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adLN
;        adLN))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adLJ
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adLJ
;        adLJ)))

;      [WD] hole{adMA} {2}:: (b0
;                             *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                            ~
;                            One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adLN
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adLN
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          adLN
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            adLN
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              adLN
;              adLN)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
;  adLI  <=  a
;  adLJ  <=  b
;  adLU  <=  fsk_adLU
;  adLW  <=  fsk_adLW
;  adLY  <=  fsk_adLY
;  adM4  <=  fsk_adM4
;  adM6  <=  fsk_adM6
;  adM8  <=  fsk_adM8
;  adMa  <=  fsk_adMa
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const adLI (Array String Int))
; (declare-const adLJ (Array String Int))
; (declare-const adLU (Array String Int))
; (declare-const adLW (Array String Int))
; (declare-const adLY (Array String Int))
; (declare-const adM4 (Array String Int))
; (declare-const adM6 (Array String Int))
; (declare-const adM8 (Array String Int))
; (declare-const adMa (Array String Int))
(declare-const
   adLI
   (Array String Int))
(declare-const
   adLJ
   (Array String Int))
(declare-const
   adLU
   (Array String Int))
(declare-const
   adLW
   (Array String Int))
(declare-const
   adLY
   (Array String Int))
(declare-const
   adM4
   (Array String Int))
(declare-const
   adM6
   (Array String Int))
(declare-const
   adM8
   (Array String Int))
(declare-const
   adMa
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         adMa)
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
           adLJ
           adLY)
         adM4)
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
           adLJ
           adM4)
         adM6)
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
           adLJ
           adM6)
         adM8)
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
           adLJ
           adLJ)
         adLW)
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
           adLJ
           adLW)
         adLY)
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
           adLI
           adLI)
         adLU)
      :named
      given-4.7))
(assert
   (!
      (= adM8 adMa)
      :named
      given-4.8))
(assert
   (!
      (= adLU adLY)
      :named
      given-4.9))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{adMr} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adLN
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adLN
;        adLN))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adLJ
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adLJ
;        adLJ)))

;      [WD] hole{adMA} {2}:: (b0
;                             *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                            ~
;                            One (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adLN
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        adLN
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          adLN
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            adLN
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              adLN
;              adLN)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  adLJ  <=  b
;  adLN  <=  b_adLN
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const adLN (Array String Int))
(declare-const
   adLN
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
                 adLN
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   adLN
                   adLN))
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 adLJ
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   adLJ
                   adLJ))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 adLN
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   adLN
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     adLN
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       adLN
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         adLN
                         adLN)))))
               (
                 (as
                    const
                    (Array String Int))
                 0))))
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
;           adLI
;           adLI)
;         adLU))
;   (define-fun
;      adM8
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
;           adLJ
;           adM6)
;         adM8))
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
;      adLU
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
;           adLJ
;           adM4)
;         adM6))
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
;           adLJ
;           adLJ)
;         adLW))
;   (define-fun
;      adLY
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
;           adLJ
;           adLW)
;         adLY))
;   (define-fun
;      given-4.9
;      ()
;      Bool
;      (= adLU adLY))
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
;                      adLN
;                      adLN
;                      adLN
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        adLN
;                        adLN
;                        adLN))
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
;                    adLN
;                    adLN
;                    adLN)
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    adLJ
;                    adLJ
;                    adLJ)))
;            a!1)))
;   (define-fun
;      adM6
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
;           adLJ
;           adLY)
;         adM4))
;   (define-fun
;      adLI
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adLN
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         "!0!"
;         (- 1)))
;   (define-fun
;      adLJ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adM4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adMa
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
;         adMa))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= adM8 adMa))
;   (define-fun
;      adLW
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
; [G] cobox_adNy {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_adNt {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_adNu {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_adNB {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{adNL} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{adNQ} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [adNd,adNd],adNx)
; (*: [adNd,adNe],adNs)
; (adNs,adNc)
; (adNx,adNd)

; WANTEDS (Thoralf style)
; (*: [adNj,adNe],adNc)
; (*: [adNj,adNj],adNj)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{adNL} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adNj
;      adNe)
;    adNc)

;      [WD] hole{adNQ} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adNj
;      adNj)
;    adNj)

; GIVENS (names)
;  adNc  <=  u
;  adNd  <=  v
;  adNe  <=  w
;  adNs  <=  fsk_adNs
;  adNx  <=  fsk_adNx
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const adNc (Array String Int))
; (declare-const adNd (Array String Int))
; (declare-const adNe (Array String Int))
; (declare-const adNs (Array String Int))
; (declare-const adNx (Array String Int))
(declare-const
   adNc
   (Array String Int))
(declare-const
   adNd
   (Array String Int))
(declare-const
   adNe
   (Array String Int))
(declare-const
   adNs
   (Array String Int))
(declare-const
   adNx
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
           adNd
           adNd)
         adNx)
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
           adNd
           adNe)
         adNs)
      :named
      given-7.2))
(assert
   (!
      (= adNs adNc)
      :named
      given-7.3))
(assert
   (!
      (= adNx adNd)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{adNL} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adNj
;      adNe)
;    adNc)

;      [WD] hole{adNQ} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      adNj
;      adNj)
;    adNj)

; WANTEDS (names)
;  adNc  <=  u
;  adNe  <=  w
;  adNj  <=  v_adNj
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const adNj (Array String Int))
(declare-const
   adNj
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
                 adNj
                 adNe)
               adNc))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 adNj
                 adNj)
               adNj)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (define-fun
;      adNe
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         8855))
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
;      (= adNx adNd))
;   (define-fun
;      adNd
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      adNc
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         8855))
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
;           adNd
;           adNd)
;         adNx))
;   (define-fun
;      adNx
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;                 adNj
;                 adNe)
;               adNc))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 adNj
;                 adNj)
;               adNj))))
;   (define-fun
;      adNj
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
;      adNs
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           28957)
;         "!0!"
;         8855))
;   (define-fun
;      given-7.3
;      ()
;      Bool
;      (= adNs adNc))
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
;           adNd
;           adNe)
;         adNs))
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
Parse Failed
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_ag5c {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_ag46 {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag48 {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4a {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4c {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4e {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4g {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4i {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4k {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4m {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4o {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4q {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4s {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4u {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4w {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4y {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4A {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4C {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4E {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4G {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4I {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4K {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4M {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4O {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4Q {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4S {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4U {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4W {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag4Y {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag50 {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag52 {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag54 {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag56 {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag58 {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag5a {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag3Y {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_ag40 {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag3W {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_ag5f {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_ag5g {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{ag5n} {2}:: One ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ag5b)
; (*: [aeJZ,ag3Z],ag45)
; (*: [aeJZ,ag45],ag47)
; (*: [aeJZ,ag47],ag49)
; (*: [aeJZ,ag49],ag4b)
; (*: [aeJZ,ag4b],ag4d)
; (*: [aeJZ,ag4d],ag4f)
; (*: [aeJZ,ag4f],ag4h)
; (*: [aeJZ,ag4h],ag4j)
; (*: [aeJZ,ag4j],ag4l)
; (*: [aeJZ,ag4l],ag4n)
; (*: [aeJZ,ag4n],ag4p)
; (*: [aeJZ,ag4p],ag4r)
; (*: [aeJZ,ag4r],ag4t)
; (*: [aeJZ,ag4t],ag4v)
; (*: [aeJZ,ag4v],ag4x)
; (*: [aeJZ,ag4x],ag4z)
; (*: [aeJZ,ag4z],ag4B)
; (*: [aeJZ,ag4B],ag4D)
; (*: [aeJZ,ag4D],ag4F)
; (*: [aeJZ,ag4F],ag4H)
; (*: [aeJZ,ag4H],ag4J)
; (*: [aeJZ,ag4J],ag4L)
; (*: [aeJZ,ag4L],ag4N)
; (*: [aeJZ,ag4N],ag4P)
; (*: [aeJZ,ag4P],ag4R)
; (*: [aeJZ,ag4R],ag4T)
; (*: [aeJZ,ag4T],ag4V)
; (*: [aeJZ,ag4V],ag4X)
; (*: [aeJZ,ag4X],ag4Z)
; (*: [aeJZ,ag4Z],ag51)
; (*: [aeJZ,ag51],ag53)
; (*: [aeJZ,ag53],ag55)
; (*: [aeJZ,ag55],ag57)
; (*: [aeJZ,ag57],ag59)
; (*: [aeJZ,aeJZ],ag3X)
; (*: [aeJZ,ag3X],ag3Z)
; (*: [aeJY,aeJY],ag3V)
; (ag59,ag5b)
; (ag3V,ag3Z)

; WANTEDS (Thoralf style)
; (One [],aeJZ)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{ag5n} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeJZ)

; GIVENS (names)
;  aeJY  <=  a
;  aeJZ  <=  b
;  ag3V  <=  fsk_ag3V
;  ag3X  <=  fsk_ag3X
;  ag3Z  <=  fsk_ag3Z
;  ag45  <=  fsk_ag45
;  ag47  <=  fsk_ag47
;  ag49  <=  fsk_ag49
;  ag4b  <=  fsk_ag4b
;  ag4d  <=  fsk_ag4d
;  ag4f  <=  fsk_ag4f
;  ag4h  <=  fsk_ag4h
;  ag4j  <=  fsk_ag4j
;  ag4l  <=  fsk_ag4l
;  ag4n  <=  fsk_ag4n
;  ag4p  <=  fsk_ag4p
;  ag4r  <=  fsk_ag4r
;  ag4t  <=  fsk_ag4t
;  ag4v  <=  fsk_ag4v
;  ag4x  <=  fsk_ag4x
;  ag4z  <=  fsk_ag4z
;  ag4B  <=  fsk_ag4B
;  ag4D  <=  fsk_ag4D
;  ag4F  <=  fsk_ag4F
;  ag4H  <=  fsk_ag4H
;  ag4J  <=  fsk_ag4J
;  ag4L  <=  fsk_ag4L
;  ag4N  <=  fsk_ag4N
;  ag4P  <=  fsk_ag4P
;  ag4R  <=  fsk_ag4R
;  ag4T  <=  fsk_ag4T
;  ag4V  <=  fsk_ag4V
;  ag4X  <=  fsk_ag4X
;  ag4Z  <=  fsk_ag4Z
;  ag51  <=  fsk_ag51
;  ag53  <=  fsk_ag53
;  ag55  <=  fsk_ag55
;  ag57  <=  fsk_ag57
;  ag59  <=  fsk_ag59
;  ag5b  <=  fsk_ag5b
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeJY (Array String Int))
; (declare-const aeJZ (Array String Int))
; (declare-const ag3V (Array String Int))
; (declare-const ag3X (Array String Int))
; (declare-const ag3Z (Array String Int))
; (declare-const ag45 (Array String Int))
; (declare-const ag47 (Array String Int))
; (declare-const ag49 (Array String Int))
; (declare-const ag4B (Array String Int))
; (declare-const ag4D (Array String Int))
; (declare-const ag4F (Array String Int))
; (declare-const ag4H (Array String Int))
; (declare-const ag4J (Array String Int))
; (declare-const ag4L (Array String Int))
; (declare-const ag4N (Array String Int))
; (declare-const ag4P (Array String Int))
; (declare-const ag4R (Array String Int))
; (declare-const ag4T (Array String Int))
; (declare-const ag4V (Array String Int))
; (declare-const ag4X (Array String Int))
; (declare-const ag4Z (Array String Int))
; (declare-const ag4b (Array String Int))
; (declare-const ag4d (Array String Int))
; (declare-const ag4f (Array String Int))
; (declare-const ag4h (Array String Int))
; (declare-const ag4j (Array String Int))
; (declare-const ag4l (Array String Int))
; (declare-const ag4n (Array String Int))
; (declare-const ag4p (Array String Int))
; (declare-const ag4r (Array String Int))
; (declare-const ag4t (Array String Int))
; (declare-const ag4v (Array String Int))
; (declare-const ag4x (Array String Int))
; (declare-const ag4z (Array String Int))
; (declare-const ag51 (Array String Int))
; (declare-const ag53 (Array String Int))
; (declare-const ag55 (Array String Int))
; (declare-const ag57 (Array String Int))
; (declare-const ag59 (Array String Int))
; (declare-const ag5b (Array String Int))
(declare-const
   aeJY
   (Array String Int))
(declare-const
   aeJZ
   (Array String Int))
(declare-const
   ag3V
   (Array String Int))
(declare-const
   ag3X
   (Array String Int))
(declare-const
   ag3Z
   (Array String Int))
(declare-const
   ag45
   (Array String Int))
(declare-const
   ag47
   (Array String Int))
(declare-const
   ag49
   (Array String Int))
(declare-const
   ag4b
   (Array String Int))
(declare-const
   ag4d
   (Array String Int))
(declare-const
   ag4f
   (Array String Int))
(declare-const
   ag4h
   (Array String Int))
(declare-const
   ag4j
   (Array String Int))
(declare-const
   ag4l
   (Array String Int))
(declare-const
   ag4n
   (Array String Int))
(declare-const
   ag4p
   (Array String Int))
(declare-const
   ag4r
   (Array String Int))
(declare-const
   ag4t
   (Array String Int))
(declare-const
   ag4v
   (Array String Int))
(declare-const
   ag4x
   (Array String Int))
(declare-const
   ag4z
   (Array String Int))
(declare-const
   ag4B
   (Array String Int))
(declare-const
   ag4D
   (Array String Int))
(declare-const
   ag4F
   (Array String Int))
(declare-const
   ag4H
   (Array String Int))
(declare-const
   ag4J
   (Array String Int))
(declare-const
   ag4L
   (Array String Int))
(declare-const
   ag4N
   (Array String Int))
(declare-const
   ag4P
   (Array String Int))
(declare-const
   ag4R
   (Array String Int))
(declare-const
   ag4T
   (Array String Int))
(declare-const
   ag4V
   (Array String Int))
(declare-const
   ag4X
   (Array String Int))
(declare-const
   ag4Z
   (Array String Int))
(declare-const
   ag51
   (Array String Int))
(declare-const
   ag53
   (Array String Int))
(declare-const
   ag55
   (Array String Int))
(declare-const
   ag57
   (Array String Int))
(declare-const
   ag59
   (Array String Int))
(declare-const
   ag5b
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ag5b)
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
           aeJZ
           ag3Z)
         ag45)
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
           aeJZ
           ag45)
         ag47)
      :named
      given-14.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag47)
         ag49)
      :named
      given-14.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag49)
         ag4b)
      :named
      given-14.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4b)
         ag4d)
      :named
      given-14.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4d)
         ag4f)
      :named
      given-14.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4f)
         ag4h)
      :named
      given-14.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4h)
         ag4j)
      :named
      given-14.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4j)
         ag4l)
      :named
      given-14.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4l)
         ag4n)
      :named
      given-14.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4n)
         ag4p)
      :named
      given-14.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4p)
         ag4r)
      :named
      given-14.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4r)
         ag4t)
      :named
      given-14.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4t)
         ag4v)
      :named
      given-14.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4v)
         ag4x)
      :named
      given-14.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4x)
         ag4z)
      :named
      given-14.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4z)
         ag4B)
      :named
      given-14.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4B)
         ag4D)
      :named
      given-14.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4D)
         ag4F)
      :named
      given-14.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4F)
         ag4H)
      :named
      given-14.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4H)
         ag4J)
      :named
      given-14.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4J)
         ag4L)
      :named
      given-14.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4L)
         ag4N)
      :named
      given-14.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4N)
         ag4P)
      :named
      given-14.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4P)
         ag4R)
      :named
      given-14.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4R)
         ag4T)
      :named
      given-14.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4T)
         ag4V)
      :named
      given-14.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4V)
         ag4X)
      :named
      given-14.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4X)
         ag4Z)
      :named
      given-14.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag4Z)
         ag51)
      :named
      given-14.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag51)
         ag53)
      :named
      given-14.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag53)
         ag55)
      :named
      given-14.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag55)
         ag57)
      :named
      given-14.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag57)
         ag59)
      :named
      given-14.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           aeJZ)
         ag3X)
      :named
      given-14.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJZ
           ag3X)
         ag3Z)
      :named
      given-14.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeJY
           aeJY)
         ag3V)
      :named
      given-14.38))
(assert
   (!
      (= ag59 ag5b)
      :named
      given-14.39))
(assert
   (!
      (= ag3V ag3Z)
      :named
      given-14.40))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{ag5n} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeJZ)

; WANTEDS (names)
;  aeJZ  <=  b
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
            aeJZ))
      :named
      wanted-14))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-14")
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
;         ag5b)
;      :named
;      given-14.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag3Z)
;         ag45)
;      :named
;      given-14.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag45)
;         ag47)
;      :named
;      given-14.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag47)
;         ag49)
;      :named
;      given-14.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag49)
;         ag4b)
;      :named
;      given-14.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4b)
;         ag4d)
;      :named
;      given-14.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4d)
;         ag4f)
;      :named
;      given-14.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4f)
;         ag4h)
;      :named
;      given-14.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4h)
;         ag4j)
;      :named
;      given-14.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4j)
;         ag4l)
;      :named
;      given-14.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4l)
;         ag4n)
;      :named
;      given-14.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4n)
;         ag4p)
;      :named
;      given-14.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4p)
;         ag4r)
;      :named
;      given-14.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4r)
;         ag4t)
;      :named
;      given-14.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4t)
;         ag4v)
;      :named
;      given-14.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4v)
;         ag4x)
;      :named
;      given-14.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4x)
;         ag4z)
;      :named
;      given-14.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4z)
;         ag4B)
;      :named
;      given-14.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4B)
;         ag4D)
;      :named
;      given-14.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4D)
;         ag4F)
;      :named
;      given-14.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4F)
;         ag4H)
;      :named
;      given-14.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4H)
;         ag4J)
;      :named
;      given-14.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4J)
;         ag4L)
;      :named
;      given-14.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4L)
;         ag4N)
;      :named
;      given-14.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4N)
;         ag4P)
;      :named
;      given-14.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4P)
;         ag4R)
;      :named
;      given-14.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4R)
;         ag4T)
;      :named
;      given-14.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4T)
;         ag4V)
;      :named
;      given-14.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4V)
;         ag4X)
;      :named
;      given-14.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4X)
;         ag4Z)
;      :named
;      given-14.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag4Z)
;         ag51)
;      :named
;      given-14.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag51)
;         ag53)
;      :named
;      given-14.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag53)
;         ag55)
;      :named
;      given-14.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag55)
;         ag57)
;      :named
;      given-14.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag57)
;         ag59)
;      :named
;      given-14.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           aeJZ)
;         ag3X)
;      :named
;      given-14.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJZ
;           ag3X)
;         ag3Z)
;      :named
;      given-14.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeJY
;           aeJY)
;         ag3V)
;      :named
;      given-14.38)
;   (!
;      (= ag59 ag5b)
;      :named
;      given-14.39)
;   (!
;      (= ag3V ag3Z)
;      :named
;      given-14.40)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            aeJZ))
;      :named
;      wanted-14))
(get-unsat-core)
; (given-14.19
;    given-14.20
;    given-14.18
;    given-14.17
;    given-14.16
;    given-14.15
;    given-14.14
;    given-14.13
;    given-14.11
;    given-14.4
;    given-14.1
;    given-14.10
;    given-14.7
;    given-14.9
;    given-14.3
;    given-14.6
;    given-14.5
;    given-14.29
;    given-14.30
;    given-14.28
;    given-14.27
;    given-14.26
;    given-14.25
;    given-14.24
;    given-14.23
;    given-14.21
;    given-14.22
;    given-14.2
;    given-14.8
;    wanted-14
;    given-14.39
;    given-14.37
;    given-14.36
;    given-14.35
;    given-14.34
;    given-14.33
;    given-14.32
;    given-14.12
;    given-14.31)
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_ag5H {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_ag5B {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag5D {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag5F {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag5t {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_ag5v {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag5r {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_ag5K {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_ag5L {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{ag5S} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ag5G)
; (*: [aeK7,ag5u],ag5A)
; (*: [aeK7,ag5A],ag5C)
; (*: [aeK7,ag5C],ag5E)
; (*: [aeK7,aeK7],ag5s)
; (*: [aeK7,ag5s],ag5u)
; (*: [aeK6,aeK6],ag5q)
; (ag5E,ag5G)
; (ag5q,ag5u)

; WANTEDS (Thoralf style)
; (One [],aeK6)

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{ag5S} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeK6)

; GIVENS (names)
;  aeK6  <=  a
;  aeK7  <=  b
;  ag5q  <=  fsk_ag5q
;  ag5s  <=  fsk_ag5s
;  ag5u  <=  fsk_ag5u
;  ag5A  <=  fsk_ag5A
;  ag5C  <=  fsk_ag5C
;  ag5E  <=  fsk_ag5E
;  ag5G  <=  fsk_ag5G
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeK6 (Array String Int))
; (declare-const aeK7 (Array String Int))
; (declare-const ag5A (Array String Int))
; (declare-const ag5C (Array String Int))
; (declare-const ag5E (Array String Int))
; (declare-const ag5G (Array String Int))
; (declare-const ag5q (Array String Int))
; (declare-const ag5s (Array String Int))
; (declare-const ag5u (Array String Int))
(declare-const
   aeK6
   (Array String Int))
(declare-const
   aeK7
   (Array String Int))
(declare-const
   ag5q
   (Array String Int))
(declare-const
   ag5s
   (Array String Int))
(declare-const
   ag5u
   (Array String Int))
(declare-const
   ag5A
   (Array String Int))
(declare-const
   ag5C
   (Array String Int))
(declare-const
   ag5E
   (Array String Int))
(declare-const
   ag5G
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ag5G)
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
           aeK7
           ag5u)
         ag5A)
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
           aeK7
           ag5A)
         ag5C)
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
           aeK7
           ag5C)
         ag5E)
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
           aeK7
           aeK7)
         ag5s)
      :named
      given-16.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeK7
           ag5s)
         ag5u)
      :named
      given-16.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeK6
           aeK6)
         ag5q)
      :named
      given-16.7))
(assert
   (!
      (= ag5E ag5G)
      :named
      given-16.8))
(assert
   (!
      (= ag5q ag5u)
      :named
      given-16.9))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{ag5S} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeK6)

; WANTEDS (names)
;  aeK6  <=  a
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
            aeK6))
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
;         ag5G)
;      :named
;      given-16.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeK7
;           ag5u)
;         ag5A)
;      :named
;      given-16.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeK7
;           ag5A)
;         ag5C)
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
;           aeK7
;           ag5C)
;         ag5E)
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
;           aeK7
;           aeK7)
;         ag5s)
;      :named
;      given-16.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeK7
;           ag5s)
;         ag5u)
;      :named
;      given-16.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeK6
;           aeK6)
;         ag5q)
;      :named
;      given-16.7)
;   (!
;      (= ag5E ag5G)
;      :named
;      given-16.8)
;   (!
;      (= ag5q ag5u)
;      :named
;      given-16.9)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            aeK6))
;      :named
;      wanted-16))
(get-unsat-core)
; (wanted-16
;    given-16.9
;    given-16.8
;    given-16.7
;    given-16.6
;    given-16.5
;    given-16.4
;    given-16.3
;    given-16.1
;    given-16.2)
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_ag5Y {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_ag5W {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_ag5Z {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{ag64} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ag5X)
; (*: [aeKe,aeKe],ag5V)
; (ag5V,ag5X)

; WANTEDS (Thoralf style)
; (One [],aeKe)

(echo "givens-start-cycle-18")
; GIVENS (conversions)
;      [WD] hole{ag64} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeKe)

; GIVENS (names)
;  aeKe  <=  a
;  ag5V  <=  fsk_ag5V
;  ag5X  <=  fsk_ag5X
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeKe (Array String Int))
; (declare-const ag5V (Array String Int))
; (declare-const ag5X (Array String Int))
(declare-const
   aeKe
   (Array String Int))
(declare-const
   ag5V
   (Array String Int))
(declare-const
   ag5X
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ag5X)
      :named
      given-18.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeKe
           aeKe)
         ag5V)
      :named
      given-18.2))
(assert
   (!
      (= ag5V ag5X)
      :named
      given-18.3))
(check-sat)
; sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
;      [WD] hole{ag64} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeKe)

; WANTEDS (names)
;  aeKe  <=  a
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
            aeKe))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         ag5X)
;      :named
;      given-18.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeKe
;           aeKe)
;         ag5V)
;      :named
;      given-18.2)
;   (!
;      (= ag5V ag5X)
;      :named
;      given-18.3)
;   (!
;      (not
;         (=
;            (
;              (as
;                 const
;                 (Array String Int))
;              0)
;            aeKe))
;      :named
;      wanted-18))
(get-unsat-core)
; (given-18.1 wanted-18 given-18.2 given-18.3)
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_ag6d {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_ag68 {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_ag69 {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_ag6g {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeKs} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aeKl,aeKl],ag6c)
; (*: [aeKl,aeKm],ag67)
; (ag67,aeKk)
; (ag6c,aeKl)

; WANTEDS (Thoralf style)
; (aeKk,aeKm)

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{aeKs} {0}:: u ~ w (CNonCanonical)
;  =>  (= aeKk aeKm)

; GIVENS (names)
;  aeKk  <=  u
;  aeKl  <=  v
;  aeKm  <=  w
;  ag67  <=  fsk_ag67
;  ag6c  <=  fsk_ag6c
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeKk (Array String Int))
; (declare-const aeKl (Array String Int))
; (declare-const aeKm (Array String Int))
; (declare-const ag67 (Array String Int))
; (declare-const ag6c (Array String Int))
(declare-const
   aeKk
   (Array String Int))
(declare-const
   aeKl
   (Array String Int))
(declare-const
   aeKm
   (Array String Int))
(declare-const
   ag67
   (Array String Int))
(declare-const
   ag6c
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
           aeKl
           aeKl)
         ag6c)
      :named
      given-20.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeKl
           aeKm)
         ag67)
      :named
      given-20.2))
(assert
   (!
      (= ag67 aeKk)
      :named
      given-20.3))
(assert
   (!
      (= ag6c aeKl)
      :named
      given-20.4))
(check-sat)
; sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{aeKs} {0}:: u ~ w (CNonCanonical)
;  =>  (= aeKk aeKm)

; WANTEDS (names)
;  aeKk  <=  u
;  aeKm  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aeKk aeKm))
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
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeKl
;           aeKl)
;         ag6c)
;      :named
;      given-20.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeKl
;           aeKm)
;         ag67)
;      :named
;      given-20.2)
;   (!
;      (= ag67 aeKk)
;      :named
;      given-20.3)
;   (!
;      (= ag6c aeKl)
;      :named
;      given-20.4)
;   (!
;      (not
;         (= aeKk aeKm))
;      :named
;      wanted-20))
(get-unsat-core)
; (given-20.2 given-20.4 wanted-20 given-20.3 given-20.1)
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; [G] cobox_ag6o {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_ag6u {2}:: Base "kg" ~ fsk0 (CFunEqCan)
; [G] cobox_ag6q {1}:: (w *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_ag6w {1}:: (fsk0 *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_ag6y {0}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_ag6s {0}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_ag6B {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{ag6G} {2}:: Base "kg" ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],ag6n)
; (Base ["kg"],ag6t)
; (*: [aeKu,aeKu],ag6p)
; (*: [ag6t,ag6t],ag6v)
; (/: [ag6n,ag6v],ag6x)
; (/: [ag6n,ag6p],ag6r)
; (ag6r,ag6x)

; WANTEDS (Thoralf style)
; (Base ["kg"],aeKu)

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{ag6G} {2}:: Base "kg" ~ w (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aeKu)

; GIVENS (names)
;  aeKu  <=  w
;  ag6n  <=  fsk_ag6n
;  ag6p  <=  fsk_ag6p
;  ag6r  <=  fsk_ag6r
;  ag6t  <=  fsk_ag6t
;  ag6v  <=  fsk_ag6v
;  ag6x  <=  fsk_ag6x
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeKu (Array String Int))
; (declare-const ag6n (Array String Int))
; (declare-const ag6p (Array String Int))
; (declare-const ag6r (Array String Int))
; (declare-const ag6t (Array String Int))
; (declare-const ag6v (Array String Int))
; (declare-const ag6x (Array String Int))
(declare-const
   aeKu
   (Array String Int))
(declare-const
   ag6n
   (Array String Int))
(declare-const
   ag6p
   (Array String Int))
(declare-const
   ag6r
   (Array String Int))
(declare-const
   ag6t
   (Array String Int))
(declare-const
   ag6v
   (Array String Int))
(declare-const
   ag6x
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         ag6n)
      :named
      given-22.1))
(assert
   (!
      (=
         (store base "kg" one)
         ag6t)
      :named
      given-22.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeKu
           aeKu)
         ag6p)
      :named
      given-22.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           ag6t
           ag6t)
         ag6v)
      :named
      given-22.4))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           ag6n
           ag6v)
         ag6x)
      :named
      given-22.5))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           ag6n
           ag6p)
         ag6r)
      :named
      given-22.6))
(assert
   (!
      (= ag6r ag6x)
      :named
      given-22.7))
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{ag6G} {2}:: Base "kg" ~ w (CNonCanonical)
;  =>  (=
;    (store base "kg" one)
;    aeKu)

; WANTEDS (names)
;  aeKu  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store base "kg" one)
            aeKu))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         ag6n)
;      :named
;      given-22.1)
;   (!
;      (=
;         (store base "kg" one)
;         ag6t)
;      :named
;      given-22.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeKu
;           aeKu)
;         ag6p)
;      :named
;      given-22.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           ag6t
;           ag6t)
;         ag6v)
;      :named
;      given-22.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           ag6n
;           ag6v)
;         ag6x)
;      :named
;      given-22.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           ag6n
;           ag6p)
;         ag6r)
;      :named
;      given-22.6)
;   (!
;      (= ag6r ag6x)
;      :named
;      given-22.7)
;   (!
;      (not
;         (=
;            (store base "kg" one)
;            aeKu))
;      :named
;      wanted-22))
(get-unsat-core)
; (given-22.7
;    given-22.2
;    given-22.6
;    given-22.5
;    wanted-22
;    given-22.4
;    given-22.3)
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")
Parse Failed
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
(echo "solver-finish-cycle-32")
(echo "solver-start-cycle-33")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{ageD} {8}:: ((Base "m" *: One) /: (Base "s" *: One))
;                       ~
;                       (Base "m" /: Base "s") (CNonCanonical)
; [WD] hole{aget} {8}:: ((Base "m"
;                         *: (Base "s" *: (Base "s" *: One)))
;                        /: One)
;                       ~
;                       (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
; [WD] hole{agew} {8}:: (One /: One) ~ One (CNonCanonical)
; [WD] hole{ageG} {6}:: ((Base "m" *: One) /: One)
;                       ~
;                       Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],/: [Base ["m"],Base ["s"]])
; (/: [*: [Base ["m"],*: [Base ["s"],*: [Base ["s"],One []]]],One []],*: [Base ["m"],*: [Base ["s"],Base ["s"]]])
; (/: [One [],One []],One [])
; (/: [*: [Base ["m"],One []],One []],Base ["m"])

(echo "givens-start-cycle-33")
; GIVENS (conversions)
;      [WD] hole{ageD} {8}:: ((Base "m" *: One) /: (Base "s" *: One))
;                            ~
;                            (Base "m" /: Base "s") (CNonCanonical)
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

;      [WD] hole{aget} {8}:: ((Base "m"
;                              *: (Base "s" *: (Base "s" *: One)))
;                             /: One)
;                            ~
;                            (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
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

;      [WD] hole{agew} {8}:: (One /: One) ~ One (CNonCanonical)
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

;      [WD] hole{ageG} {6}:: ((Base "m" *: One) /: One)
;                            ~
;                            Base "m" (CNonCanonical)
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

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-33")
(echo "wanteds-start-cycle-33")
; WANTEDS (conversions)
;      [WD] hole{ageD} {8}:: ((Base "m" *: One) /: (Base "s" *: One))
;                            ~
;                            (Base "m" /: Base "s") (CNonCanonical)
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

;      [WD] hole{aget} {8}:: ((Base "m"
;                              *: (Base "s" *: (Base "s" *: One)))
;                             /: One)
;                            ~
;                            (Base "m" *: (Base "s" *: Base "s")) (CNonCanonical)
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

;      [WD] hole{agew} {8}:: (One /: One) ~ One (CNonCanonical)
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

;      [WD] hole{ageG} {6}:: ((Base "m" *: One) /: One)
;                            ~
;                            Base "m" (CNonCanonical)
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

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
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
                       (store base "s" one))))
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
      :named
      wanted-33))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-33")
(get-assertions)
; (
;   (= one 1)
;   (= enc base)
;   (!
;      (or
;         (or
;            (or
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
;                         (_
;                            map
;                            (+
;                               (Int Int)
;                               Int))
;                         (store base "s" one)
;                         (
;                           (as
;                              const
;                              (Array String Int))
;                           0)))
;                     (
;                       (_
;                          map
;                          (-
;                             (Int Int)
;                             Int))
;                       (store base "m" one)
;                       (store base "s" one))))
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
;                           (_
;                              map
;                              (+
;                                 (Int Int)
;                                 Int))
;                           (store base "s" one)
;                           (
;                             (_
;                                map
;                                (+
;                                   (Int Int)
;                                   Int))
;                             (store base "s" one)
;                             (
;                               (as
;                                  const
;                                  (Array String Int))
;                               0))))
;                       (
;                         (as
;                            const
;                            (Array String Int))
;                         0))
;                     (
;                       (_
;                          map
;                          (+
;                             (Int Int)
;                             Int))
;                       (store base "m" one)
;                       (
;                         (_
;                            map
;                            (+
;                               (Int Int)
;                               Int))
;                         (store base "s" one)
;                         (store base "s" one))))))
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
;                   (store base "m" one)
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0))
;                 (
;                   (as
;                      const
;                      (Array String Int))
;                   0))
;               (store base "m" one))))
;      :named
;      wanted-33))
(get-unsat-core)
; (wanted-33)
(pop 1)
(echo "solver-finish-cycle-33")
(exit)
; [6 of 6] Compiling UnitDefsTests
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
; [WD] hole{amow} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{amow} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
;      [WD] hole{amow} {2}:: One
;                            ~
;                            (Base "byte" /: Base "byte") (CNonCanonical)
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
; Test suite units: RUNNING...
; Test suite units: PASS