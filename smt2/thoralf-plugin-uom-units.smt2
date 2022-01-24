; Build profile: -w ghc-8.2.2 -O1
; [1 of 5] Compiling Abelian
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
                   a1HD)))))
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
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1HB
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)
;                   a1HB))
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1HD
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)
;                   a1HD)))))
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
                    a1Il
                    a1Ik)
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    a1Ii
                    a1Ih))))
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
;         false
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
                    a1IN))))
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
;         false
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
;         26285))
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
;         20537))
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
;         8945))
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
;         16122))
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
      (or
         false
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
                 0))))
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
;      (or
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (-
;                       (Int Int)
;                       Int))
;                 (store base a1Jf one)
;                 (store base a1Jf one))
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0))))
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
                 0))))
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
;                 a1Jp
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)
;                   a1Jp))
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0))))
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
                 a1Jw
                 (
                   (as
                      const
                      (Array String Int))
                   0))
               a1Jw)))
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
;                 a1Jw
;                 (
;                   (as
;                      const
;                      (Array String Int))
;                   0))
;               a1Jw)))
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
                 a1JC
                 a1JD)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JD
                 a1JC))))
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
;                 a1JC
;                 a1JD)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1JD
;                 a1JC))))
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
                 a1JM))))
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
;                 a1JK
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   a1JL
;                   a1JM))
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   a1JK
;                   a1JL)
;                 a1JM))))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; [2 of 5] Compiling Plugins.Thoralf.UnitDefs
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
; [3 of 5] Compiling Defs
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
; [WD] hole{abiW} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{abiW} {2}:: One
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
;      [WD] hole{abiW} {2}:: One
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
      (or
         false
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
                 (store base "byte" one)))))
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
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               (
;                 (_
;                    map
;                    (-
;                       (Int Int)
;                       Int))
;                 (store base "byte" one)
;                 (store base "byte" one)))))
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
; [4 of 5] Compiling UnQuantity
; [5 of 5] Compiling Main
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
; [G] cobox_aeE0 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_aeCU {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeCW {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeCY {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeD0 {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeD2 {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeD4 {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeD6 {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeD8 {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDa {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDc {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDe {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDg {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDi {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDk {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDm {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDo {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDq {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDs {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDu {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDw {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDy {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDA {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDC {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDE {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDG {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDI {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDK {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDM {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDO {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDQ {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDS {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDU {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDW {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeDY {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeCM {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aeCO {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeCK {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_aeE3 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_aeE4 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeEd} {2}:: (a0 *: a0) ~ (b *: (b *: b)) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aeDZ)
; (*: [aeCy,aeCN],aeCT)
; (*: [aeCy,aeCT],aeCV)
; (*: [aeCy,aeCV],aeCX)
; (*: [aeCy,aeCX],aeCZ)
; (*: [aeCy,aeCZ],aeD1)
; (*: [aeCy,aeD1],aeD3)
; (*: [aeCy,aeD3],aeD5)
; (*: [aeCy,aeD5],aeD7)
; (*: [aeCy,aeD7],aeD9)
; (*: [aeCy,aeD9],aeDb)
; (*: [aeCy,aeDb],aeDd)
; (*: [aeCy,aeDd],aeDf)
; (*: [aeCy,aeDf],aeDh)
; (*: [aeCy,aeDh],aeDj)
; (*: [aeCy,aeDj],aeDl)
; (*: [aeCy,aeDl],aeDn)
; (*: [aeCy,aeDn],aeDp)
; (*: [aeCy,aeDp],aeDr)
; (*: [aeCy,aeDr],aeDt)
; (*: [aeCy,aeDt],aeDv)
; (*: [aeCy,aeDv],aeDx)
; (*: [aeCy,aeDx],aeDz)
; (*: [aeCy,aeDz],aeDB)
; (*: [aeCy,aeDB],aeDD)
; (*: [aeCy,aeDD],aeDF)
; (*: [aeCy,aeDF],aeDH)
; (*: [aeCy,aeDH],aeDJ)
; (*: [aeCy,aeDJ],aeDL)
; (*: [aeCy,aeDL],aeDN)
; (*: [aeCy,aeDN],aeDP)
; (*: [aeCy,aeDP],aeDR)
; (*: [aeCy,aeDR],aeDT)
; (*: [aeCy,aeDT],aeDV)
; (*: [aeCy,aeDV],aeDX)
; (*: [aeCy,aeCy],aeCL)
; (*: [aeCy,aeCL],aeCN)
; (*: [aeCx,aeCx],aeCJ)
; (aeDX,aeDZ)
; (aeCJ,aeCN)

; WANTEDS (Thoralf style)
; (*: [aeCB,aeCB],*: [aeCy,*: [aeCy,aeCy]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aeEd} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeCB
;      aeCB)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeCy
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeCy
;        aeCy)))

; GIVENS (names)
;  aeCx  <=  a
;  aeCy  <=  b
;  aeCJ  <=  fsk_aeCJ
;  aeCL  <=  fsk_aeCL
;  aeCN  <=  fsk_aeCN
;  aeCT  <=  fsk_aeCT
;  aeCV  <=  fsk_aeCV
;  aeCX  <=  fsk_aeCX
;  aeCZ  <=  fsk_aeCZ
;  aeD1  <=  fsk_aeD1
;  aeD3  <=  fsk_aeD3
;  aeD5  <=  fsk_aeD5
;  aeD7  <=  fsk_aeD7
;  aeD9  <=  fsk_aeD9
;  aeDb  <=  fsk_aeDb
;  aeDd  <=  fsk_aeDd
;  aeDf  <=  fsk_aeDf
;  aeDh  <=  fsk_aeDh
;  aeDj  <=  fsk_aeDj
;  aeDl  <=  fsk_aeDl
;  aeDn  <=  fsk_aeDn
;  aeDp  <=  fsk_aeDp
;  aeDr  <=  fsk_aeDr
;  aeDt  <=  fsk_aeDt
;  aeDv  <=  fsk_aeDv
;  aeDx  <=  fsk_aeDx
;  aeDz  <=  fsk_aeDz
;  aeDB  <=  fsk_aeDB
;  aeDD  <=  fsk_aeDD
;  aeDF  <=  fsk_aeDF
;  aeDH  <=  fsk_aeDH
;  aeDJ  <=  fsk_aeDJ
;  aeDL  <=  fsk_aeDL
;  aeDN  <=  fsk_aeDN
;  aeDP  <=  fsk_aeDP
;  aeDR  <=  fsk_aeDR
;  aeDT  <=  fsk_aeDT
;  aeDV  <=  fsk_aeDV
;  aeDX  <=  fsk_aeDX
;  aeDZ  <=  fsk_aeDZ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeCJ (Array String Int))
; (declare-const aeCL (Array String Int))
; (declare-const aeCN (Array String Int))
; (declare-const aeCT (Array String Int))
; (declare-const aeCV (Array String Int))
; (declare-const aeCX (Array String Int))
; (declare-const aeCZ (Array String Int))
; (declare-const aeCx (Array String Int))
; (declare-const aeCy (Array String Int))
; (declare-const aeD1 (Array String Int))
; (declare-const aeD3 (Array String Int))
; (declare-const aeD5 (Array String Int))
; (declare-const aeD7 (Array String Int))
; (declare-const aeD9 (Array String Int))
; (declare-const aeDB (Array String Int))
; (declare-const aeDD (Array String Int))
; (declare-const aeDF (Array String Int))
; (declare-const aeDH (Array String Int))
; (declare-const aeDJ (Array String Int))
; (declare-const aeDL (Array String Int))
; (declare-const aeDN (Array String Int))
; (declare-const aeDP (Array String Int))
; (declare-const aeDR (Array String Int))
; (declare-const aeDT (Array String Int))
; (declare-const aeDV (Array String Int))
; (declare-const aeDX (Array String Int))
; (declare-const aeDZ (Array String Int))
; (declare-const aeDb (Array String Int))
; (declare-const aeDd (Array String Int))
; (declare-const aeDf (Array String Int))
; (declare-const aeDh (Array String Int))
; (declare-const aeDj (Array String Int))
; (declare-const aeDl (Array String Int))
; (declare-const aeDn (Array String Int))
; (declare-const aeDp (Array String Int))
; (declare-const aeDr (Array String Int))
; (declare-const aeDt (Array String Int))
; (declare-const aeDv (Array String Int))
; (declare-const aeDx (Array String Int))
; (declare-const aeDz (Array String Int))
(declare-const
   aeCx
   (Array String Int))
(declare-const
   aeCy
   (Array String Int))
(declare-const
   aeCJ
   (Array String Int))
(declare-const
   aeCL
   (Array String Int))
(declare-const
   aeCN
   (Array String Int))
(declare-const
   aeCT
   (Array String Int))
(declare-const
   aeCV
   (Array String Int))
(declare-const
   aeCX
   (Array String Int))
(declare-const
   aeCZ
   (Array String Int))
(declare-const
   aeD1
   (Array String Int))
(declare-const
   aeD3
   (Array String Int))
(declare-const
   aeD5
   (Array String Int))
(declare-const
   aeD7
   (Array String Int))
(declare-const
   aeD9
   (Array String Int))
(declare-const
   aeDb
   (Array String Int))
(declare-const
   aeDd
   (Array String Int))
(declare-const
   aeDf
   (Array String Int))
(declare-const
   aeDh
   (Array String Int))
(declare-const
   aeDj
   (Array String Int))
(declare-const
   aeDl
   (Array String Int))
(declare-const
   aeDn
   (Array String Int))
(declare-const
   aeDp
   (Array String Int))
(declare-const
   aeDr
   (Array String Int))
(declare-const
   aeDt
   (Array String Int))
(declare-const
   aeDv
   (Array String Int))
(declare-const
   aeDx
   (Array String Int))
(declare-const
   aeDz
   (Array String Int))
(declare-const
   aeDB
   (Array String Int))
(declare-const
   aeDD
   (Array String Int))
(declare-const
   aeDF
   (Array String Int))
(declare-const
   aeDH
   (Array String Int))
(declare-const
   aeDJ
   (Array String Int))
(declare-const
   aeDL
   (Array String Int))
(declare-const
   aeDN
   (Array String Int))
(declare-const
   aeDP
   (Array String Int))
(declare-const
   aeDR
   (Array String Int))
(declare-const
   aeDT
   (Array String Int))
(declare-const
   aeDV
   (Array String Int))
(declare-const
   aeDX
   (Array String Int))
(declare-const
   aeDZ
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aeDZ)
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
           aeCy
           aeCN)
         aeCT)
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
           aeCy
           aeCT)
         aeCV)
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
           aeCy
           aeCV)
         aeCX)
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
           aeCy
           aeCX)
         aeCZ)
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
           aeCy
           aeCZ)
         aeD1)
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
           aeCy
           aeD1)
         aeD3)
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
           aeCy
           aeD3)
         aeD5)
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
           aeCy
           aeD5)
         aeD7)
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
           aeCy
           aeD7)
         aeD9)
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
           aeCy
           aeD9)
         aeDb)
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
           aeCy
           aeDb)
         aeDd)
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
           aeCy
           aeDd)
         aeDf)
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
           aeCy
           aeDf)
         aeDh)
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
           aeCy
           aeDh)
         aeDj)
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
           aeCy
           aeDj)
         aeDl)
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
           aeCy
           aeDl)
         aeDn)
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
           aeCy
           aeDn)
         aeDp)
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
           aeCy
           aeDp)
         aeDr)
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
           aeCy
           aeDr)
         aeDt)
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
           aeCy
           aeDt)
         aeDv)
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
           aeCy
           aeDv)
         aeDx)
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
           aeCy
           aeDx)
         aeDz)
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
           aeCy
           aeDz)
         aeDB)
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
           aeCy
           aeDB)
         aeDD)
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
           aeCy
           aeDD)
         aeDF)
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
           aeCy
           aeDF)
         aeDH)
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
           aeCy
           aeDH)
         aeDJ)
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
           aeCy
           aeDJ)
         aeDL)
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
           aeCy
           aeDL)
         aeDN)
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
           aeCy
           aeDN)
         aeDP)
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
           aeCy
           aeDP)
         aeDR)
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
           aeCy
           aeDR)
         aeDT)
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
           aeCy
           aeDT)
         aeDV)
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
           aeCy
           aeDV)
         aeDX)
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
           aeCy
           aeCy)
         aeCL)
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
           aeCy
           aeCL)
         aeCN)
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
           aeCx
           aeCx)
         aeCJ)
      :named
      given-2.38))
(assert
   (!
      (= aeDX aeDZ)
      :named
      given-2.39))
(assert
   (!
      (= aeCJ aeCN)
      :named
      given-2.40))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aeEd} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeCB
;      aeCB)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeCy
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeCy
;        aeCy)))

; WANTEDS (names)
;  aeCy  <=  b
;  aeCB  <=  a_aeCB
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aeCB (Array String Int))
(declare-const
   aeCB
   (Array String Int))
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
                 aeCB
                 aeCB)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aeCy
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aeCy
                   aeCy)))))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      aeCT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeCZ
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
;           aeCy
;           aeDT)
;         aeDV))
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
;           aeCy
;           aeCZ)
;         aeD1))
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
;           aeCy
;           aeDL)
;         aeDN))
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
;           aeCy
;           aeDh)
;         aeDj))
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
;           aeCy
;           aeCy)
;         aeCL))
;   (define-fun
;      aeDp
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
;           aeCy
;           aeDz)
;         aeDB))
;   (define-fun
;      aeCX
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDx
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDL
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
;           aeCy
;           aeDj)
;         aeDl))
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
;           aeCy
;           aeDp)
;         aeDr))
;   (define-fun
;      aeD5
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeD1
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDj
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDz
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
;      (= aeCJ aeCN))
;   (define-fun
;      aeDh
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
;           aeCy
;           aeDx)
;         aeDz))
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
;           aeCy
;           aeD7)
;         aeD9))
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
;           aeCy
;           aeDl)
;         aeDn))
;   (define-fun
;      aeCJ
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
;           aeCy
;           aeDN)
;         aeDP))
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
;           aeCy
;           aeDH)
;         aeDJ))
;   (define-fun
;      aeDV
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeD3
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDJ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDR
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
;           aeCy
;           aeD9)
;         aeDb))
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
;           aeCy
;           aeDr)
;         aeDt))
;   (define-fun
;      aeDP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeCB
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
;           aeCy
;           aeCX)
;         aeCZ))
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
;           aeCy
;           aeDP)
;         aeDR))
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
;           aeCy
;           aeDJ)
;         aeDL))
;   (define-fun
;      aeDn
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
;           aeCy
;           aeDb)
;         aeDd))
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
;           aeCy
;           aeDd)
;         aeDf))
;   (define-fun
;      aeDf
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
;           aeCy
;           aeCL)
;         aeCN))
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
;           aeCy
;           aeCN)
;         aeCT))
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
;           aeCy
;           aeD3)
;         aeD5))
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
;           aeCy
;           aeDv)
;         aeDx))
;   (define-fun
;      aeD9
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
;           aeCy
;           aeDR)
;         aeDT))
;   (define-fun
;      wanted-2
;      ()
;      Bool
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
;                 aeCB
;                 aeCB)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aeCy
;                 aeCy
;                 aeCy)))))
;   (define-fun
;      given-2.39
;      ()
;      Bool
;      (= aeDX aeDZ))
;   (define-fun
;      aeDv
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
;           aeCy
;           aeDf)
;         aeDh))
;   (define-fun
;      aeCV
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDB
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDr
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
;           aeCy
;           aeDn)
;         aeDp))
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
;           aeCy
;           aeDV)
;         aeDX))
;   (define-fun
;      aeDF
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDH
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDd
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDt
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeCN
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
;           aeCx
;           aeCx)
;         aeCJ))
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
;           aeCy
;           aeDF)
;         aeDH))
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
;           aeCy
;           aeDt)
;         aeDv))
;   (define-fun
;      aeDN
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
;           aeCy
;           aeD5)
;         aeD7))
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
;           aeCy
;           aeDB)
;         aeDD))
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
;      aeCy
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeD7
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDT
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDX
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
;           aeCy
;           aeCT)
;         aeCV))
;   (define-fun
;      aeCx
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeDZ
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
;         aeDZ))
;   (define-fun
;      aeDl
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
;           aeCy
;           aeDD)
;         aeDF))
;   (define-fun
;      aeDb
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeCL
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
;           aeCy
;           aeD1)
;         aeD3))
;   (define-fun
;      aeDD
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
;           aeCy
;           aeCV)
;         aeCX))
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
; [G] cobox_aeES {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_aeEM {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeEO {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeEQ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeEE {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aeEG {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeEC {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_aeEV {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_aeEW {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeF8} {3}:: (b0 *: (b0 *: b0))
;                       ~
;                       (b *: (b *: b)) (CNonCanonical)
; [WD] hole{aeFh} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                       ~
;                       One (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aeER)
; (*: [aeEq,aeEF],aeEL)
; (*: [aeEq,aeEL],aeEN)
; (*: [aeEq,aeEN],aeEP)
; (*: [aeEq,aeEq],aeED)
; (*: [aeEq,aeED],aeEF)
; (*: [aeEp,aeEp],aeEB)
; (aeEP,aeER)
; (aeEB,aeEF)

; WANTEDS (Thoralf style)
; (*: [aeEu,*: [aeEu,aeEu]],*: [aeEq,*: [aeEq,aeEq]])
; (*: [aeEu,*: [aeEu,*: [aeEu,*: [aeEu,*: [aeEu,aeEu]]]]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{aeF8} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeEu
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeEu
;        aeEu))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeEq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeEq
;        aeEq)))

;      [WD] hole{aeFh} {2}:: (b0
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
;      aeEu
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeEu
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aeEu
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aeEu
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aeEu
;              aeEu)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
;  aeEp  <=  a
;  aeEq  <=  b
;  aeEB  <=  fsk_aeEB
;  aeED  <=  fsk_aeED
;  aeEF  <=  fsk_aeEF
;  aeEL  <=  fsk_aeEL
;  aeEN  <=  fsk_aeEN
;  aeEP  <=  fsk_aeEP
;  aeER  <=  fsk_aeER
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeEB (Array String Int))
; (declare-const aeED (Array String Int))
; (declare-const aeEF (Array String Int))
; (declare-const aeEL (Array String Int))
; (declare-const aeEN (Array String Int))
; (declare-const aeEP (Array String Int))
; (declare-const aeER (Array String Int))
; (declare-const aeEp (Array String Int))
; (declare-const aeEq (Array String Int))
(declare-const
   aeEp
   (Array String Int))
(declare-const
   aeEq
   (Array String Int))
(declare-const
   aeEB
   (Array String Int))
(declare-const
   aeED
   (Array String Int))
(declare-const
   aeEF
   (Array String Int))
(declare-const
   aeEL
   (Array String Int))
(declare-const
   aeEN
   (Array String Int))
(declare-const
   aeEP
   (Array String Int))
(declare-const
   aeER
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aeER)
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
           aeEq
           aeEF)
         aeEL)
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
           aeEq
           aeEL)
         aeEN)
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
           aeEq
           aeEN)
         aeEP)
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
           aeEq
           aeEq)
         aeED)
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
           aeEq
           aeED)
         aeEF)
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
           aeEp
           aeEp)
         aeEB)
      :named
      given-4.7))
(assert
   (!
      (= aeEP aeER)
      :named
      given-4.8))
(assert
   (!
      (= aeEB aeEF)
      :named
      given-4.9))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{aeF8} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeEu
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeEu
;        aeEu))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeEq
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeEq
;        aeEq)))

;      [WD] hole{aeFh} {2}:: (b0
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
;      aeEu
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        aeEu
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          aeEu
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            aeEu
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aeEu
;              aeEu)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  aeEq  <=  b
;  aeEu  <=  b_aeEu
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aeEu (Array String Int))
(declare-const
   aeEu
   (Array String Int))
(assert
   (!
      (or
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
                    aeEu
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      aeEu
                      aeEu))
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    aeEq
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      aeEq
                      aeEq)))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aeEu
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   aeEu
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     aeEu
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       aeEu
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         aeEu
                         aeEu)))))
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
;           aeEp
;           aeEp)
;         aeEB))
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
;           aeEq
;           aeEN)
;         aeEP))
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
;      aeEF
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
;           aeEq
;           aeEL)
;         aeEN))
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
;           aeEq
;           aeEq)
;         aeED))
;   (define-fun
;      aeEN
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
;           aeEq
;           aeED)
;         aeEF))
;   (define-fun
;      given-4.9
;      ()
;      Bool
;      (= aeEB aeEF))
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
;                      aeEu
;                      aeEu
;                      aeEu
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        aeEu
;                        aeEu
;                        aeEu))
;                    (
;                      (as
;                         const
;                         (Array String Int))
;                      0)))))
;         (or
;            false
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    aeEu
;                    aeEu
;                    aeEu)
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    aeEq
;                    aeEq
;                    aeEq)))
;            a!1)))
;   (define-fun
;      aeEB
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
;           aeEq
;           aeEF)
;         aeEL))
;   (define-fun
;      aeEq
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeER
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeEP
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeED
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeEp
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeEL
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
;         aeER))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= aeEP aeER))
;   (define-fun
;      aeEu
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
; [G] cobox_aeGf {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_aeGa {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_aeGb {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_aeGi {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeGs} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{aeGx} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aeFU,aeFU],aeGe)
; (*: [aeFU,aeFV],aeG9)
; (aeG9,aeFT)
; (aeGe,aeFU)

; WANTEDS (Thoralf style)
; (*: [aeG0,aeFV],aeFT)
; (*: [aeG0,aeG0],aeG0)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{aeGs} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeG0
;      aeFV)
;    aeFT)

;      [WD] hole{aeGx} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeG0
;      aeG0)
;    aeG0)

; GIVENS (names)
;  aeFT  <=  u
;  aeFU  <=  v
;  aeFV  <=  w
;  aeG9  <=  fsk_aeG9
;  aeGe  <=  fsk_aeGe
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeFT (Array String Int))
; (declare-const aeFU (Array String Int))
; (declare-const aeFV (Array String Int))
; (declare-const aeG9 (Array String Int))
; (declare-const aeGe (Array String Int))
(declare-const
   aeFT
   (Array String Int))
(declare-const
   aeFU
   (Array String Int))
(declare-const
   aeFV
   (Array String Int))
(declare-const
   aeG9
   (Array String Int))
(declare-const
   aeGe
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
           aeFU
           aeFU)
         aeGe)
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
           aeFU
           aeFV)
         aeG9)
      :named
      given-7.2))
(assert
   (!
      (= aeG9 aeFT)
      :named
      given-7.3))
(assert
   (!
      (= aeGe aeFU)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{aeGs} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeG0
;      aeFV)
;    aeFT)

;      [WD] hole{aeGx} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aeG0
;      aeG0)
;    aeG0)

; WANTEDS (names)
;  aeFT  <=  u
;  aeFV  <=  w
;  aeG0  <=  v_aeG0
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aeG0 (Array String Int))
(declare-const
   aeG0
   (Array String Int))
(assert
   (!
      (or
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
                    aeG0
                    aeFV)
                  aeFT)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aeG0
                 aeG0)
               aeG0)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
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
;      given-7.4
;      ()
;      Bool
;      (= aeGe aeFU))
;   (define-fun
;      aeFT
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
;           aeFU
;           aeFU)
;         aeGe))
;   (define-fun
;      aeGe
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      aeFV
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
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aeG0
;                 aeFV)
;               aeFT))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 aeG0
;                 aeG0)
;               aeG0))))
;   (define-fun
;      aeG0
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         (- 1)))
;   (define-fun
;      given-7.3
;      ()
;      Bool
;      (= aeG9 aeFT))
;   (define-fun
;      aeG9
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
;           aeFU
;           aeFV)
;         aeG9))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      aeFU
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
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_aeKN {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_aeJH {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJJ {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJL {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJN {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJP {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJR {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJT {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJV {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJX {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJZ {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeK1 {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeK3 {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeK5 {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeK7 {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeK9 {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKb {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKd {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKf {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKh {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKj {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKl {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKn {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKp {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKr {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKt {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKv {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKx {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKz {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKB {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKD {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKF {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKH {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKJ {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeKL {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJz {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aeJB {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeJx {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_aeKQ {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_aeKR {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeKY} {2}:: One ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aeKM)
; (*: [aeGM,aeJA],aeJG)
; (*: [aeGM,aeJG],aeJI)
; (*: [aeGM,aeJI],aeJK)
; (*: [aeGM,aeJK],aeJM)
; (*: [aeGM,aeJM],aeJO)
; (*: [aeGM,aeJO],aeJQ)
; (*: [aeGM,aeJQ],aeJS)
; (*: [aeGM,aeJS],aeJU)
; (*: [aeGM,aeJU],aeJW)
; (*: [aeGM,aeJW],aeJY)
; (*: [aeGM,aeJY],aeK0)
; (*: [aeGM,aeK0],aeK2)
; (*: [aeGM,aeK2],aeK4)
; (*: [aeGM,aeK4],aeK6)
; (*: [aeGM,aeK6],aeK8)
; (*: [aeGM,aeK8],aeKa)
; (*: [aeGM,aeKa],aeKc)
; (*: [aeGM,aeKc],aeKe)
; (*: [aeGM,aeKe],aeKg)
; (*: [aeGM,aeKg],aeKi)
; (*: [aeGM,aeKi],aeKk)
; (*: [aeGM,aeKk],aeKm)
; (*: [aeGM,aeKm],aeKo)
; (*: [aeGM,aeKo],aeKq)
; (*: [aeGM,aeKq],aeKs)
; (*: [aeGM,aeKs],aeKu)
; (*: [aeGM,aeKu],aeKw)
; (*: [aeGM,aeKw],aeKy)
; (*: [aeGM,aeKy],aeKA)
; (*: [aeGM,aeKA],aeKC)
; (*: [aeGM,aeKC],aeKE)
; (*: [aeGM,aeKE],aeKG)
; (*: [aeGM,aeKG],aeKI)
; (*: [aeGM,aeKI],aeKK)
; (*: [aeGM,aeGM],aeJy)
; (*: [aeGM,aeJy],aeJA)
; (*: [aeGL,aeGL],aeJw)
; (aeKK,aeKM)
; (aeJw,aeJA)

; WANTEDS (Thoralf style)
; (One [],aeGM)

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{aeKY} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeGM)

; GIVENS (names)
;  aeGL  <=  a
;  aeGM  <=  b
;  aeJw  <=  fsk_aeJw
;  aeJy  <=  fsk_aeJy
;  aeJA  <=  fsk_aeJA
;  aeJG  <=  fsk_aeJG
;  aeJI  <=  fsk_aeJI
;  aeJK  <=  fsk_aeJK
;  aeJM  <=  fsk_aeJM
;  aeJO  <=  fsk_aeJO
;  aeJQ  <=  fsk_aeJQ
;  aeJS  <=  fsk_aeJS
;  aeJU  <=  fsk_aeJU
;  aeJW  <=  fsk_aeJW
;  aeJY  <=  fsk_aeJY
;  aeK0  <=  fsk_aeK0
;  aeK2  <=  fsk_aeK2
;  aeK4  <=  fsk_aeK4
;  aeK6  <=  fsk_aeK6
;  aeK8  <=  fsk_aeK8
;  aeKa  <=  fsk_aeKa
;  aeKc  <=  fsk_aeKc
;  aeKe  <=  fsk_aeKe
;  aeKg  <=  fsk_aeKg
;  aeKi  <=  fsk_aeKi
;  aeKk  <=  fsk_aeKk
;  aeKm  <=  fsk_aeKm
;  aeKo  <=  fsk_aeKo
;  aeKq  <=  fsk_aeKq
;  aeKs  <=  fsk_aeKs
;  aeKu  <=  fsk_aeKu
;  aeKw  <=  fsk_aeKw
;  aeKy  <=  fsk_aeKy
;  aeKA  <=  fsk_aeKA
;  aeKC  <=  fsk_aeKC
;  aeKE  <=  fsk_aeKE
;  aeKG  <=  fsk_aeKG
;  aeKI  <=  fsk_aeKI
;  aeKK  <=  fsk_aeKK
;  aeKM  <=  fsk_aeKM
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeGL (Array String Int))
; (declare-const aeGM (Array String Int))
; (declare-const aeJA (Array String Int))
; (declare-const aeJG (Array String Int))
; (declare-const aeJI (Array String Int))
; (declare-const aeJK (Array String Int))
; (declare-const aeJM (Array String Int))
; (declare-const aeJO (Array String Int))
; (declare-const aeJQ (Array String Int))
; (declare-const aeJS (Array String Int))
; (declare-const aeJU (Array String Int))
; (declare-const aeJW (Array String Int))
; (declare-const aeJY (Array String Int))
; (declare-const aeJw (Array String Int))
; (declare-const aeJy (Array String Int))
; (declare-const aeK0 (Array String Int))
; (declare-const aeK2 (Array String Int))
; (declare-const aeK4 (Array String Int))
; (declare-const aeK6 (Array String Int))
; (declare-const aeK8 (Array String Int))
; (declare-const aeKA (Array String Int))
; (declare-const aeKC (Array String Int))
; (declare-const aeKE (Array String Int))
; (declare-const aeKG (Array String Int))
; (declare-const aeKI (Array String Int))
; (declare-const aeKK (Array String Int))
; (declare-const aeKM (Array String Int))
; (declare-const aeKa (Array String Int))
; (declare-const aeKc (Array String Int))
; (declare-const aeKe (Array String Int))
; (declare-const aeKg (Array String Int))
; (declare-const aeKi (Array String Int))
; (declare-const aeKk (Array String Int))
; (declare-const aeKm (Array String Int))
; (declare-const aeKo (Array String Int))
; (declare-const aeKq (Array String Int))
; (declare-const aeKs (Array String Int))
; (declare-const aeKu (Array String Int))
; (declare-const aeKw (Array String Int))
; (declare-const aeKy (Array String Int))
(declare-const
   aeGL
   (Array String Int))
(declare-const
   aeGM
   (Array String Int))
(declare-const
   aeJw
   (Array String Int))
(declare-const
   aeJy
   (Array String Int))
(declare-const
   aeJA
   (Array String Int))
(declare-const
   aeJG
   (Array String Int))
(declare-const
   aeJI
   (Array String Int))
(declare-const
   aeJK
   (Array String Int))
(declare-const
   aeJM
   (Array String Int))
(declare-const
   aeJO
   (Array String Int))
(declare-const
   aeJQ
   (Array String Int))
(declare-const
   aeJS
   (Array String Int))
(declare-const
   aeJU
   (Array String Int))
(declare-const
   aeJW
   (Array String Int))
(declare-const
   aeJY
   (Array String Int))
(declare-const
   aeK0
   (Array String Int))
(declare-const
   aeK2
   (Array String Int))
(declare-const
   aeK4
   (Array String Int))
(declare-const
   aeK6
   (Array String Int))
(declare-const
   aeK8
   (Array String Int))
(declare-const
   aeKa
   (Array String Int))
(declare-const
   aeKc
   (Array String Int))
(declare-const
   aeKe
   (Array String Int))
(declare-const
   aeKg
   (Array String Int))
(declare-const
   aeKi
   (Array String Int))
(declare-const
   aeKk
   (Array String Int))
(declare-const
   aeKm
   (Array String Int))
(declare-const
   aeKo
   (Array String Int))
(declare-const
   aeKq
   (Array String Int))
(declare-const
   aeKs
   (Array String Int))
(declare-const
   aeKu
   (Array String Int))
(declare-const
   aeKw
   (Array String Int))
(declare-const
   aeKy
   (Array String Int))
(declare-const
   aeKA
   (Array String Int))
(declare-const
   aeKC
   (Array String Int))
(declare-const
   aeKE
   (Array String Int))
(declare-const
   aeKG
   (Array String Int))
(declare-const
   aeKI
   (Array String Int))
(declare-const
   aeKK
   (Array String Int))
(declare-const
   aeKM
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aeKM)
      :named
      given-9.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJA)
         aeJG)
      :named
      given-9.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJG)
         aeJI)
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
           aeGM
           aeJI)
         aeJK)
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
           aeGM
           aeJK)
         aeJM)
      :named
      given-9.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJM)
         aeJO)
      :named
      given-9.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJO)
         aeJQ)
      :named
      given-9.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJQ)
         aeJS)
      :named
      given-9.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJS)
         aeJU)
      :named
      given-9.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJU)
         aeJW)
      :named
      given-9.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJW)
         aeJY)
      :named
      given-9.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJY)
         aeK0)
      :named
      given-9.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeK0)
         aeK2)
      :named
      given-9.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeK2)
         aeK4)
      :named
      given-9.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeK4)
         aeK6)
      :named
      given-9.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeK6)
         aeK8)
      :named
      given-9.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeK8)
         aeKa)
      :named
      given-9.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKa)
         aeKc)
      :named
      given-9.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKc)
         aeKe)
      :named
      given-9.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKe)
         aeKg)
      :named
      given-9.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKg)
         aeKi)
      :named
      given-9.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKi)
         aeKk)
      :named
      given-9.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKk)
         aeKm)
      :named
      given-9.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKm)
         aeKo)
      :named
      given-9.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKo)
         aeKq)
      :named
      given-9.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKq)
         aeKs)
      :named
      given-9.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKs)
         aeKu)
      :named
      given-9.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKu)
         aeKw)
      :named
      given-9.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKw)
         aeKy)
      :named
      given-9.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKy)
         aeKA)
      :named
      given-9.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKA)
         aeKC)
      :named
      given-9.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKC)
         aeKE)
      :named
      given-9.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKE)
         aeKG)
      :named
      given-9.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKG)
         aeKI)
      :named
      given-9.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeKI)
         aeKK)
      :named
      given-9.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeGM)
         aeJy)
      :named
      given-9.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGM
           aeJy)
         aeJA)
      :named
      given-9.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGL
           aeGL)
         aeJw)
      :named
      given-9.38))
(assert
   (!
      (= aeKK aeKM)
      :named
      given-9.39))
(assert
   (!
      (= aeJw aeJA)
      :named
      given-9.40))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{aeKY} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeGM)

; WANTEDS (names)
;  aeGM  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               aeGM)))
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
;         aeKM)
;      :named
;      given-9.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJA)
;         aeJG)
;      :named
;      given-9.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJG)
;         aeJI)
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
;           aeGM
;           aeJI)
;         aeJK)
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
;           aeGM
;           aeJK)
;         aeJM)
;      :named
;      given-9.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJM)
;         aeJO)
;      :named
;      given-9.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJO)
;         aeJQ)
;      :named
;      given-9.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJQ)
;         aeJS)
;      :named
;      given-9.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJS)
;         aeJU)
;      :named
;      given-9.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJU)
;         aeJW)
;      :named
;      given-9.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJW)
;         aeJY)
;      :named
;      given-9.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJY)
;         aeK0)
;      :named
;      given-9.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeK0)
;         aeK2)
;      :named
;      given-9.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeK2)
;         aeK4)
;      :named
;      given-9.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeK4)
;         aeK6)
;      :named
;      given-9.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeK6)
;         aeK8)
;      :named
;      given-9.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeK8)
;         aeKa)
;      :named
;      given-9.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKa)
;         aeKc)
;      :named
;      given-9.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKc)
;         aeKe)
;      :named
;      given-9.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKe)
;         aeKg)
;      :named
;      given-9.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKg)
;         aeKi)
;      :named
;      given-9.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKi)
;         aeKk)
;      :named
;      given-9.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKk)
;         aeKm)
;      :named
;      given-9.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKm)
;         aeKo)
;      :named
;      given-9.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKo)
;         aeKq)
;      :named
;      given-9.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKq)
;         aeKs)
;      :named
;      given-9.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKs)
;         aeKu)
;      :named
;      given-9.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKu)
;         aeKw)
;      :named
;      given-9.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKw)
;         aeKy)
;      :named
;      given-9.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKy)
;         aeKA)
;      :named
;      given-9.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKA)
;         aeKC)
;      :named
;      given-9.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKC)
;         aeKE)
;      :named
;      given-9.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKE)
;         aeKG)
;      :named
;      given-9.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKG)
;         aeKI)
;      :named
;      given-9.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeKI)
;         aeKK)
;      :named
;      given-9.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeGM)
;         aeJy)
;      :named
;      given-9.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGM
;           aeJy)
;         aeJA)
;      :named
;      given-9.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGL
;           aeGL)
;         aeJw)
;      :named
;      given-9.38)
;   (!
;      (= aeKK aeKM)
;      :named
;      given-9.39)
;   (!
;      (= aeJw aeJA)
;      :named
;      given-9.40)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               aeGM)))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.21
;    given-9.20
;    given-9.19
;    given-9.18
;    given-9.6
;    given-9.17
;    given-9.15
;    given-9.3
;    given-9.14
;    given-9.12
;    given-9.16
;    given-9.5
;    given-9.1
;    given-9.9
;    given-9.11
;    given-9.10
;    given-9.4
;    given-9.7
;    given-9.8
;    given-9.29
;    given-9.30
;    given-9.31
;    given-9.28
;    given-9.27
;    given-9.26
;    given-9.25
;    given-9.24
;    given-9.23
;    given-9.22
;    wanted-9
;    given-9.39
;    given-9.37
;    given-9.36
;    given-9.35
;    given-9.34
;    given-9.33
;    given-9.2
;    given-9.13
;    given-9.32)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_aeLi {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_aeLc {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeLe {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeLg {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeL4 {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aeL6 {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_aeL2 {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_aeLl {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_aeLm {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeLt} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aeLh)
; (*: [aeGU,aeL5],aeLb)
; (*: [aeGU,aeLb],aeLd)
; (*: [aeGU,aeLd],aeLf)
; (*: [aeGU,aeGU],aeL3)
; (*: [aeGU,aeL3],aeL5)
; (*: [aeGT,aeGT],aeL1)
; (aeLf,aeLh)
; (aeL1,aeL5)

; WANTEDS (Thoralf style)
; (One [],aeGT)

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{aeLt} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeGT)

; GIVENS (names)
;  aeGT  <=  a
;  aeGU  <=  b
;  aeL1  <=  fsk_aeL1
;  aeL3  <=  fsk_aeL3
;  aeL5  <=  fsk_aeL5
;  aeLb  <=  fsk_aeLb
;  aeLd  <=  fsk_aeLd
;  aeLf  <=  fsk_aeLf
;  aeLh  <=  fsk_aeLh
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeGT (Array String Int))
; (declare-const aeGU (Array String Int))
; (declare-const aeL1 (Array String Int))
; (declare-const aeL3 (Array String Int))
; (declare-const aeL5 (Array String Int))
; (declare-const aeLb (Array String Int))
; (declare-const aeLd (Array String Int))
; (declare-const aeLf (Array String Int))
; (declare-const aeLh (Array String Int))
(declare-const
   aeGT
   (Array String Int))
(declare-const
   aeGU
   (Array String Int))
(declare-const
   aeL1
   (Array String Int))
(declare-const
   aeL3
   (Array String Int))
(declare-const
   aeL5
   (Array String Int))
(declare-const
   aeLb
   (Array String Int))
(declare-const
   aeLd
   (Array String Int))
(declare-const
   aeLf
   (Array String Int))
(declare-const
   aeLh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aeLh)
      :named
      given-11.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGU
           aeL5)
         aeLb)
      :named
      given-11.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGU
           aeLb)
         aeLd)
      :named
      given-11.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGU
           aeLd)
         aeLf)
      :named
      given-11.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGU
           aeGU)
         aeL3)
      :named
      given-11.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGU
           aeL3)
         aeL5)
      :named
      given-11.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aeGT
           aeGT)
         aeL1)
      :named
      given-11.7))
(assert
   (!
      (= aeLf aeLh)
      :named
      given-11.8))
(assert
   (!
      (= aeL1 aeL5)
      :named
      given-11.9))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{aeLt} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeGT)

; WANTEDS (names)
;  aeGT  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               aeGT)))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         aeLh)
;      :named
;      given-11.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGU
;           aeL5)
;         aeLb)
;      :named
;      given-11.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGU
;           aeLb)
;         aeLd)
;      :named
;      given-11.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGU
;           aeLd)
;         aeLf)
;      :named
;      given-11.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGU
;           aeGU)
;         aeL3)
;      :named
;      given-11.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGU
;           aeL3)
;         aeL5)
;      :named
;      given-11.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeGT
;           aeGT)
;         aeL1)
;      :named
;      given-11.7)
;   (!
;      (= aeLf aeLh)
;      :named
;      given-11.8)
;   (!
;      (= aeL1 aeL5)
;      :named
;      given-11.9)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               aeGT)))
;      :named
;      wanted-11))
(get-unsat-core)
; (wanted-11
;    given-11.9
;    given-11.8
;    given-11.7
;    given-11.6
;    given-11.5
;    given-11.4
;    given-11.3
;    given-11.1
;    given-11.2)
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_aeLz {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_aeLx {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_aeLA {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeLF} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],aeLy)
; (*: [aeH1,aeH1],aeLw)
; (aeLw,aeLy)

; WANTEDS (Thoralf style)
; (One [],aeH1)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{aeLF} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeH1)

; GIVENS (names)
;  aeH1  <=  a
;  aeLw  <=  fsk_aeLw
;  aeLy  <=  fsk_aeLy
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeH1 (Array String Int))
; (declare-const aeLw (Array String Int))
; (declare-const aeLy (Array String Int))
(declare-const
   aeH1
   (Array String Int))
(declare-const
   aeLw
   (Array String Int))
(declare-const
   aeLy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         aeLy)
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
           aeH1
           aeH1)
         aeLw)
      :named
      given-13.2))
(assert
   (!
      (= aeLw aeLy)
      :named
      given-13.3))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{aeLF} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    aeH1)

; WANTEDS (names)
;  aeH1  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               aeH1)))
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
;         aeLy)
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
;           aeH1
;           aeH1)
;         aeLw)
;      :named
;      given-13.2)
;   (!
;      (= aeLw aeLy)
;      :named
;      given-13.3)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               aeH1)))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1 wanted-13 given-13.2 given-13.3)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_aeLO {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_aeLJ {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_aeLK {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_aeLR {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aeHf} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [aeH8,aeH8],aeLN)
; (*: [aeH8,aeH9],aeLI)
; (aeLI,aeH7)
; (aeLN,aeH8)

; WANTEDS (Thoralf style)
; (aeH7,aeH9)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{aeHf} {0}:: u ~ w (CNonCanonical)
;  =>  (= aeH7 aeH9)

; GIVENS (names)
;  aeH7  <=  u
;  aeH8  <=  v
;  aeH9  <=  w
;  aeLI  <=  fsk_aeLI
;  aeLN  <=  fsk_aeLN
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aeH7 (Array String Int))
; (declare-const aeH8 (Array String Int))
; (declare-const aeH9 (Array String Int))
; (declare-const aeLI (Array String Int))
; (declare-const aeLN (Array String Int))
(declare-const
   aeH7
   (Array String Int))
(declare-const
   aeH8
   (Array String Int))
(declare-const
   aeH9
   (Array String Int))
(declare-const
   aeLI
   (Array String Int))
(declare-const
   aeLN
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
           aeH8
           aeH8)
         aeLN)
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
           aeH8
           aeH9)
         aeLI)
      :named
      given-15.2))
(assert
   (!
      (= aeLI aeH7)
      :named
      given-15.3))
(assert
   (!
      (= aeLN aeH8)
      :named
      given-15.4))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{aeHf} {0}:: u ~ w (CNonCanonical)
;  =>  (= aeH7 aeH9)

; WANTEDS (names)
;  aeH7  <=  u
;  aeH9  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (= aeH7 aeH9)))
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
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           aeH8
;           aeH8)
;         aeLN)
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
;           aeH8
;           aeH9)
;         aeLI)
;      :named
;      given-15.2)
;   (!
;      (= aeLI aeH7)
;      :named
;      given-15.3)
;   (!
;      (= aeLN aeH8)
;      :named
;      given-15.4)
;   (!
;      (or
;         false
;         (not
;            (= aeH7 aeH9)))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.2 given-15.3 given-15.4 wanted-15 given-15.1)
(pop 1)
(echo "solver-finish-cycle-15")
(exit)
; [1 of 5] Compiling Abelian
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
                   a1HJ)))))
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
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1HH
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)
;                   a1HH))
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1HJ
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)
;                   a1HJ)))))
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
                    a1Ir
                    a1Iq)
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    a1Io
                    a1In))))
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
;         false
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
                    a1IT))))
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
;         false
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
;      enc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        2))
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
;         20537))
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
;         26285))
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
;         2997))
;   (define-fun
;      one
;      ()
;      Int
;      1)
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
;         8945))
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
;         16122))
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
      (or
         false
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
                 0))))
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
;      (or
;         false
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (-
;                       (Int Int)
;                       Int))
;                 (store base a1Jl one)
;                 (store base a1Jl one))
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0))))
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
                 0))))
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
;                 a1Jv
;                 (
;                   (_
;                      map
;                      (-
;                         (Int Int)
;                         Int))
;                   (
;                     (as
;                        const
;                        (Array String Int))
;                     0)
;                   a1Jv))
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0))))
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
                 a1JC
                 (
                   (as
                      const
                      (Array String Int))
                   0))
               a1JC)))
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
;                 a1JC
;                 (
;                   (as
;                      const
;                      (Array String Int))
;                   0))
;               a1JC)))
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
                 a1JI
                 a1JJ)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 a1JJ
                 a1JI))))
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
;                 a1JI
;                 a1JJ)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 a1JJ
;                 a1JI))))
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
                 a1JS))))
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
;                 a1JQ
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   a1JR
;                   a1JS))
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 (
;                   (_
;                      map
;                      (+
;                         (Int Int)
;                         Int))
;                   a1JQ
;                   a1JR)
;                 a1JS))))
;      :named
;      wanted-8))
(get-unsat-core)
; (wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; [2 of 5] Compiling Plugins.Thoralf.UnitDefs
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
; [3 of 5] Compiling Defs
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
; [WD] hole{abjd} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{abjd} {2}:: One
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
;      [WD] hole{abjd} {2}:: One
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
      (or
         false
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
                 (store base "byte" one)))))
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
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               (
;                 (_
;                    map
;                    (-
;                       (Int Int)
;                       Int))
;                 (store base "byte" one)
;                 (store base "byte" one)))))
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
; [5 of 5] Compiling Main
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
; [G] cobox_acEH {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acDB {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDD {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDF {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDH {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDJ {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDL {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDN {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDP {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDR {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDT {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDV {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDX {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDZ {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE1 {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE3 {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE5 {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE7 {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acE9 {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEb {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEd {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEf {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEh {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEj {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEl {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEn {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEp {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEr {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEt {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEv {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEx {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEz {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEB {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acED {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acEF {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDt {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acDv {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acDr {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acEK {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acEL {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acEU} {2}:: (a0 *: a0) ~ (b *: (b *: b)) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acEG)
; (*: [acDa,acDu],acDA)
; (*: [acDa,acDA],acDC)
; (*: [acDa,acDC],acDE)
; (*: [acDa,acDE],acDG)
; (*: [acDa,acDG],acDI)
; (*: [acDa,acDI],acDK)
; (*: [acDa,acDK],acDM)
; (*: [acDa,acDM],acDO)
; (*: [acDa,acDO],acDQ)
; (*: [acDa,acDQ],acDS)
; (*: [acDa,acDS],acDU)
; (*: [acDa,acDU],acDW)
; (*: [acDa,acDW],acDY)
; (*: [acDa,acDY],acE0)
; (*: [acDa,acE0],acE2)
; (*: [acDa,acE2],acE4)
; (*: [acDa,acE4],acE6)
; (*: [acDa,acE6],acE8)
; (*: [acDa,acE8],acEa)
; (*: [acDa,acEa],acEc)
; (*: [acDa,acEc],acEe)
; (*: [acDa,acEe],acEg)
; (*: [acDa,acEg],acEi)
; (*: [acDa,acEi],acEk)
; (*: [acDa,acEk],acEm)
; (*: [acDa,acEm],acEo)
; (*: [acDa,acEo],acEq)
; (*: [acDa,acEq],acEs)
; (*: [acDa,acEs],acEu)
; (*: [acDa,acEu],acEw)
; (*: [acDa,acEw],acEy)
; (*: [acDa,acEy],acEA)
; (*: [acDa,acEA],acEC)
; (*: [acDa,acEC],acEE)
; (*: [acDa,acDa],acDs)
; (*: [acDa,acDs],acDu)
; (*: [acD9,acD9],acDq)
; (acEE,acEG)
; (acDq,acDu)

; WANTEDS (Thoralf style)
; (*: [acDd,acDd],*: [acDa,*: [acDa,acDa]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{acEU} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acDd
;      acDd)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acDa
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acDa
;        acDa)))

; GIVENS (names)
;  acD9  <=  a
;  acDa  <=  b
;  acDq  <=  fsk_acDq
;  acDs  <=  fsk_acDs
;  acDu  <=  fsk_acDu
;  acDA  <=  fsk_acDA
;  acDC  <=  fsk_acDC
;  acDE  <=  fsk_acDE
;  acDG  <=  fsk_acDG
;  acDI  <=  fsk_acDI
;  acDK  <=  fsk_acDK
;  acDM  <=  fsk_acDM
;  acDO  <=  fsk_acDO
;  acDQ  <=  fsk_acDQ
;  acDS  <=  fsk_acDS
;  acDU  <=  fsk_acDU
;  acDW  <=  fsk_acDW
;  acDY  <=  fsk_acDY
;  acE0  <=  fsk_acE0
;  acE2  <=  fsk_acE2
;  acE4  <=  fsk_acE4
;  acE6  <=  fsk_acE6
;  acE8  <=  fsk_acE8
;  acEa  <=  fsk_acEa
;  acEc  <=  fsk_acEc
;  acEe  <=  fsk_acEe
;  acEg  <=  fsk_acEg
;  acEi  <=  fsk_acEi
;  acEk  <=  fsk_acEk
;  acEm  <=  fsk_acEm
;  acEo  <=  fsk_acEo
;  acEq  <=  fsk_acEq
;  acEs  <=  fsk_acEs
;  acEu  <=  fsk_acEu
;  acEw  <=  fsk_acEw
;  acEy  <=  fsk_acEy
;  acEA  <=  fsk_acEA
;  acEC  <=  fsk_acEC
;  acEE  <=  fsk_acEE
;  acEG  <=  fsk_acEG
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acD9 (Array String Int))
; (declare-const acDA (Array String Int))
; (declare-const acDC (Array String Int))
; (declare-const acDE (Array String Int))
; (declare-const acDG (Array String Int))
; (declare-const acDI (Array String Int))
; (declare-const acDK (Array String Int))
; (declare-const acDM (Array String Int))
; (declare-const acDO (Array String Int))
; (declare-const acDQ (Array String Int))
; (declare-const acDS (Array String Int))
; (declare-const acDU (Array String Int))
; (declare-const acDW (Array String Int))
; (declare-const acDY (Array String Int))
; (declare-const acDa (Array String Int))
; (declare-const acDq (Array String Int))
; (declare-const acDs (Array String Int))
; (declare-const acDu (Array String Int))
; (declare-const acE0 (Array String Int))
; (declare-const acE2 (Array String Int))
; (declare-const acE4 (Array String Int))
; (declare-const acE6 (Array String Int))
; (declare-const acE8 (Array String Int))
; (declare-const acEA (Array String Int))
; (declare-const acEC (Array String Int))
; (declare-const acEE (Array String Int))
; (declare-const acEG (Array String Int))
; (declare-const acEa (Array String Int))
; (declare-const acEc (Array String Int))
; (declare-const acEe (Array String Int))
; (declare-const acEg (Array String Int))
; (declare-const acEi (Array String Int))
; (declare-const acEk (Array String Int))
; (declare-const acEm (Array String Int))
; (declare-const acEo (Array String Int))
; (declare-const acEq (Array String Int))
; (declare-const acEs (Array String Int))
; (declare-const acEu (Array String Int))
; (declare-const acEw (Array String Int))
; (declare-const acEy (Array String Int))
(declare-const
   acD9
   (Array String Int))
(declare-const
   acDa
   (Array String Int))
(declare-const
   acDq
   (Array String Int))
(declare-const
   acDs
   (Array String Int))
(declare-const
   acDu
   (Array String Int))
(declare-const
   acDA
   (Array String Int))
(declare-const
   acDC
   (Array String Int))
(declare-const
   acDE
   (Array String Int))
(declare-const
   acDG
   (Array String Int))
(declare-const
   acDI
   (Array String Int))
(declare-const
   acDK
   (Array String Int))
(declare-const
   acDM
   (Array String Int))
(declare-const
   acDO
   (Array String Int))
(declare-const
   acDQ
   (Array String Int))
(declare-const
   acDS
   (Array String Int))
(declare-const
   acDU
   (Array String Int))
(declare-const
   acDW
   (Array String Int))
(declare-const
   acDY
   (Array String Int))
(declare-const
   acE0
   (Array String Int))
(declare-const
   acE2
   (Array String Int))
(declare-const
   acE4
   (Array String Int))
(declare-const
   acE6
   (Array String Int))
(declare-const
   acE8
   (Array String Int))
(declare-const
   acEa
   (Array String Int))
(declare-const
   acEc
   (Array String Int))
(declare-const
   acEe
   (Array String Int))
(declare-const
   acEg
   (Array String Int))
(declare-const
   acEi
   (Array String Int))
(declare-const
   acEk
   (Array String Int))
(declare-const
   acEm
   (Array String Int))
(declare-const
   acEo
   (Array String Int))
(declare-const
   acEq
   (Array String Int))
(declare-const
   acEs
   (Array String Int))
(declare-const
   acEu
   (Array String Int))
(declare-const
   acEw
   (Array String Int))
(declare-const
   acEy
   (Array String Int))
(declare-const
   acEA
   (Array String Int))
(declare-const
   acEC
   (Array String Int))
(declare-const
   acEE
   (Array String Int))
(declare-const
   acEG
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acEG)
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
           acDa
           acDu)
         acDA)
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
           acDa
           acDA)
         acDC)
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
           acDa
           acDC)
         acDE)
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
           acDa
           acDE)
         acDG)
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
           acDa
           acDG)
         acDI)
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
           acDa
           acDI)
         acDK)
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
           acDa
           acDK)
         acDM)
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
           acDa
           acDM)
         acDO)
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
           acDa
           acDO)
         acDQ)
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
           acDa
           acDQ)
         acDS)
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
           acDa
           acDS)
         acDU)
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
           acDa
           acDU)
         acDW)
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
           acDa
           acDW)
         acDY)
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
           acDa
           acDY)
         acE0)
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
           acDa
           acE0)
         acE2)
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
           acDa
           acE2)
         acE4)
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
           acDa
           acE4)
         acE6)
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
           acDa
           acE6)
         acE8)
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
           acDa
           acE8)
         acEa)
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
           acDa
           acEa)
         acEc)
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
           acDa
           acEc)
         acEe)
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
           acDa
           acEe)
         acEg)
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
           acDa
           acEg)
         acEi)
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
           acDa
           acEi)
         acEk)
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
           acDa
           acEk)
         acEm)
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
           acDa
           acEm)
         acEo)
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
           acDa
           acEo)
         acEq)
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
           acDa
           acEq)
         acEs)
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
           acDa
           acEs)
         acEu)
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
           acDa
           acEu)
         acEw)
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
           acDa
           acEw)
         acEy)
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
           acDa
           acEy)
         acEA)
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
           acDa
           acEA)
         acEC)
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
           acDa
           acEC)
         acEE)
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
           acDa
           acDa)
         acDs)
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
           acDa
           acDs)
         acDu)
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
           acD9
           acD9)
         acDq)
      :named
      given-2.38))
(assert
   (!
      (= acEE acEG)
      :named
      given-2.39))
(assert
   (!
      (= acDq acDu)
      :named
      given-2.40))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{acEU} {2}:: (a0 *: a0)
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acDd
;      acDd)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acDa
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acDa
;        acDa)))

; WANTEDS (names)
;  acDa  <=  b
;  acDd  <=  a_acDd
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const acDd (Array String Int))
(declare-const
   acDd
   (Array String Int))
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
                 acDd
                 acDd)
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acDa
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   acDa
                   acDa)))))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (define-fun
;      acDq
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
;           acDa
;           acEA)
;         acEC))
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
;           acDa
;           acDG)
;         acDI))
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
;           acDa
;           acEs)
;         acEu))
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
;           acDa
;           acDY)
;         acE0))
;   (define-fun
;      acDQ
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEi
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
;           acDa
;           acDa)
;         acDs))
;   (define-fun
;      acEy
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
;           acDa
;           acEg)
;         acEi))
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
;           acDa
;           acE0)
;         acE2))
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
;           acDa
;           acE6)
;         acE8))
;   (define-fun
;      acDC
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acE8
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
;      (= acDq acDu))
;   (define-fun
;      acEA
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
;           acDa
;           acEe)
;         acEg))
;   (define-fun
;      acDS
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEg
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
;           acDa
;           acDO)
;         acDQ))
;   (define-fun
;      acDM
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
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
;           acDa
;           acE2)
;         acE4))
;   (define-fun
;      acDa
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
;           acDa
;           acEu)
;         acEw))
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
;           acDa
;           acEo)
;         acEq))
;   (define-fun
;      acDO
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEs
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEo
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEa
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEk
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
;           acDa
;           acDQ)
;         acDS))
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
;           acDa
;           acE8)
;         acEa))
;   (define-fun
;      acEG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEe
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acE2
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEc
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acDA
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acDW
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acE0
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
;           acDa
;           acDE)
;         acDG))
;   (define-fun
;      acEm
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
;           acDa
;           acEw)
;         acEy))
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
;           acDa
;           acEq)
;         acEs))
;   (define-fun
;      acDs
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
;           acDa
;           acDS)
;         acDU))
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
;           acDa
;           acDU)
;         acDW))
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
;           acDa
;           acDs)
;         acDu))
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
;           acDa
;           acDu)
;         acDA))
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
;           acDa
;           acDK)
;         acDM))
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
;           acDa
;           acEc)
;         acEe))
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
;           acDa
;           acEy)
;         acEA))
;   (define-fun
;      wanted-2
;      ()
;      Bool
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
;                 acDd
;                 acDd)
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 acDa
;                 acDa
;                 acDa)))))
;   (define-fun
;      given-2.39
;      ()
;      Bool
;      (= acEE acEG))
;   (define-fun
;      acDu
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
;           acDa
;           acDW)
;         acDY))
;   (define-fun
;      acE6
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acDY
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
;           acDa
;           acE4)
;         acE6))
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
;           acDa
;           acEC)
;         acEE))
;   (define-fun
;      acDK
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
;           acD9
;           acD9)
;         acDq))
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
;           acDa
;           acEm)
;         acEo))
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
;           acDa
;           acEa)
;         acEc))
;   (define-fun
;      acDI
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
;           acDa
;           acDM)
;         acDO))
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
;           acDa
;           acEi)
;         acEk))
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
;      acDE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acDG
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acD9
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
;           acDa
;           acDA)
;         acDC))
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
;         acEG))
;   (define-fun
;      acEC
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acDU
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
;           acDa
;           acEk)
;         acEm))
;   (define-fun
;      acEq
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
;           acDa
;           acDI)
;         acDK))
;   (define-fun
;      acE4
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acEE
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acDd
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
;           acDa
;           acDC)
;         acDE))
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
; [G] cobox_acFz {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acFt {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFv {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFx {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFl {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acFn {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acFj {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acFC {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acFD {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acFP} {3}:: (b0 *: (b0 *: b0))
;                       ~
;                       (b *: (b *: b)) (CNonCanonical)
; [WD] hole{acFY} {2}:: (b0 *: (b0 *: (b0 *: (b0 *: (b0 *: b0)))))
;                       ~
;                       One (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acFy)
; (*: [acF7,acFm],acFs)
; (*: [acF7,acFs],acFu)
; (*: [acF7,acFu],acFw)
; (*: [acF7,acF7],acFk)
; (*: [acF7,acFk],acFm)
; (*: [acF6,acF6],acFi)
; (acFw,acFy)
; (acFi,acFm)

; WANTEDS (Thoralf style)
; (*: [acFb,*: [acFb,acFb]],*: [acF7,*: [acF7,acF7]])
; (*: [acFb,*: [acFb,*: [acFb,*: [acFb,*: [acFb,acFb]]]]],One [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{acFP} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acFb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acFb
;        acFb))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acF7
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acF7
;        acF7)))

;      [WD] hole{acFY} {2}:: (b0
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
;      acFb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acFb
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          acFb
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            acFb
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              acFb
;              acFb)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; GIVENS (names)
;  acF6  <=  a
;  acF7  <=  b
;  acFi  <=  fsk_acFi
;  acFk  <=  fsk_acFk
;  acFm  <=  fsk_acFm
;  acFs  <=  fsk_acFs
;  acFu  <=  fsk_acFu
;  acFw  <=  fsk_acFw
;  acFy  <=  fsk_acFy
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acF6 (Array String Int))
; (declare-const acF7 (Array String Int))
; (declare-const acFi (Array String Int))
; (declare-const acFk (Array String Int))
; (declare-const acFm (Array String Int))
; (declare-const acFs (Array String Int))
; (declare-const acFu (Array String Int))
; (declare-const acFw (Array String Int))
; (declare-const acFy (Array String Int))
(declare-const
   acF6
   (Array String Int))
(declare-const
   acF7
   (Array String Int))
(declare-const
   acFi
   (Array String Int))
(declare-const
   acFk
   (Array String Int))
(declare-const
   acFm
   (Array String Int))
(declare-const
   acFs
   (Array String Int))
(declare-const
   acFu
   (Array String Int))
(declare-const
   acFw
   (Array String Int))
(declare-const
   acFy
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acFy)
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
           acF7
           acFm)
         acFs)
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
           acF7
           acFs)
         acFu)
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
           acF7
           acFu)
         acFw)
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
           acF7
           acF7)
         acFk)
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
           acF7
           acFk)
         acFm)
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
           acF6
           acF6)
         acFi)
      :named
      given-4.7))
(assert
   (!
      (= acFw acFy)
      :named
      given-4.8))
(assert
   (!
      (= acFi acFm)
      :named
      given-4.9))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{acFP} {3}:: (b0 *: (b0 *: b0))
;                            ~
;                            (b *: (b *: b)) (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acFb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acFb
;        acFb))
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acF7
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acF7
;        acF7)))

;      [WD] hole{acFY} {2}:: (b0
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
;      acFb
;      (
;        (_
;           map
;           (+
;              (Int Int)
;              Int))
;        acFb
;        (
;          (_
;             map
;             (+
;                (Int Int)
;                Int))
;          acFb
;          (
;            (_
;               map
;               (+
;                  (Int Int)
;                  Int))
;            acFb
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              acFb
;              acFb)))))
;    (
;      (as
;         const
;         (Array String Int))
;      0))

; WANTEDS (names)
;  acF7  <=  b
;  acFb  <=  b_acFb
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const acFb (Array String Int))
(declare-const
   acFb
   (Array String Int))
(assert
   (!
      (or
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
                    acFb
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      acFb
                      acFb))
                  (
                    (_
                       map
                       (+
                          (Int Int)
                          Int))
                    acF7
                    (
                      (_
                         map
                         (+
                            (Int Int)
                            Int))
                      acF7
                      acF7)))))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acFb
                 (
                   (_
                      map
                      (+
                         (Int Int)
                         Int))
                   acFb
                   (
                     (_
                        map
                        (+
                           (Int Int)
                           Int))
                     acFb
                     (
                       (_
                          map
                          (+
                             (Int Int)
                             Int))
                       acFb
                       (
                         (_
                            map
                            (+
                               (Int Int)
                               Int))
                         acFb
                         acFb)))))
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
;           acF6
;           acF6)
;         acFi))
;   (define-fun
;      acFk
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acF7
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acFy
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acFb
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
;           acF7
;           acFu)
;         acFw))
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
;      acFu
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acFi
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
;           acF7
;           acFs)
;         acFu))
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
;           acF7
;           acF7)
;         acFk))
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
;           acF7
;           acFk)
;         acFm))
;   (define-fun
;      given-4.9
;      ()
;      Bool
;      (= acFi acFm))
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
;                      acFb
;                      acFb
;                      acFb
;                      (
;                        (_
;                           map
;                           (+
;                              (Int Int)
;                              Int))
;                        acFb
;                        acFb
;                        acFb))
;                    (
;                      (as
;                         const
;                         (Array String Int))
;                      0)))))
;         (or
;            false
;            (not
;               (=
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    acFb
;                    acFb
;                    acFb)
;                  (
;                    (_
;                       map
;                       (+
;                          (Int Int)
;                          Int))
;                    acF7
;                    acF7
;                    acF7)))
;            a!1)))
;   (define-fun
;      acFm
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
;           acF7
;           acFm)
;         acFs))
;   (define-fun
;      acFw
;      ()
;      (Array String Int)
;      (
;        (as
;           const
;           (Array String Int))
;        0))
;   (define-fun
;      acF6
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
;         acFy))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= acFw acFy))
;   (define-fun
;      acFs
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
; [G] cobox_acGW {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acGR {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acGS {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acGZ {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acH9} {3}:: (v0 *: w) ~ u (CNonCanonical)
; [WD] hole{acHe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [acGB,acGB],acGV)
; (*: [acGB,acGC],acGQ)
; (acGQ,acGA)
; (acGV,acGB)

; WANTEDS (Thoralf style)
; (*: [acGH,acGC],acGA)
; (*: [acGH,acGH],acGH)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{acH9} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acGH
;      acGC)
;    acGA)

;      [WD] hole{acHe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acGH
;      acGH)
;    acGH)

; GIVENS (names)
;  acGA  <=  u
;  acGB  <=  v
;  acGC  <=  w
;  acGQ  <=  fsk_acGQ
;  acGV  <=  fsk_acGV
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acGA (Array String Int))
; (declare-const acGB (Array String Int))
; (declare-const acGC (Array String Int))
; (declare-const acGQ (Array String Int))
; (declare-const acGV (Array String Int))
(declare-const
   acGA
   (Array String Int))
(declare-const
   acGB
   (Array String Int))
(declare-const
   acGC
   (Array String Int))
(declare-const
   acGQ
   (Array String Int))
(declare-const
   acGV
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
           acGB
           acGB)
         acGV)
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
           acGB
           acGC)
         acGQ)
      :named
      given-7.2))
(assert
   (!
      (= acGQ acGA)
      :named
      given-7.3))
(assert
   (!
      (= acGV acGB)
      :named
      given-7.4))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{acH9} {3}:: (v0 *: w) ~ u (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acGH
;      acGC)
;    acGA)

;      [WD] hole{acHe} {2}:: (v0 *: v0) ~ v0 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      acGH
;      acGH)
;    acGH)

; WANTEDS (names)
;  acGA  <=  u
;  acGC  <=  w
;  acGH  <=  v_acGH
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const acGH (Array String Int))
(declare-const
   acGH
   (Array String Int))
(assert
   (!
      (or
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
                    acGH
                    acGC)
                  acGA)))
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 acGH
                 acGH)
               acGH)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (define-fun
;      acGQ
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
;      acGH
;      ()
;      (Array String Int)
;      (store
;         (
;           (as
;              const
;              (Array String Int))
;           2437)
;         "!0!"
;         (- 1)))
;   (define-fun
;      acGV
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
;      given-7.4
;      ()
;      Bool
;      (= acGV acGB))
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
;           acGB
;           acGB)
;         acGV))
;   (define-fun
;      wanted-7
;      ()
;      Bool
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
;                 acGH
;                 acGC)
;               acGA))
;         (not
;            (=
;               (
;                 (_
;                    map
;                    (+
;                       (Int Int)
;                       Int))
;                 acGH
;                 acGH)
;               acGH))))
;   (define-fun
;      acGC
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
;      acGA
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
;      (= acGQ acGA))
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
;           acGB
;           acGC)
;         acGQ))
;   (define-fun
;      one
;      ()
;      Int
;      1)
;   (define-fun
;      acGB
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
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_acLw {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acKq {34}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKs {33}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKu {32}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKw {31}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKy {30}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKA {29}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKC {28}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKE {27}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKG {26}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKI {25}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKK {24}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKM {23}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKO {22}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKQ {21}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKS {20}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKU {19}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKW {18}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKY {17}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL0 {16}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL2 {15}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL4 {14}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL6 {13}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acL8 {12}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLa {11}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLc {10}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLe {9}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLg {8}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLi {7}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLk {6}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLm {5}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLo {4}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLq {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLs {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLu {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKi {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acKk {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acKg {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acLz {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acLA {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acLH} {2}:: One ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acLv)
; (*: [acHw,acKj],acKp)
; (*: [acHw,acKp],acKr)
; (*: [acHw,acKr],acKt)
; (*: [acHw,acKt],acKv)
; (*: [acHw,acKv],acKx)
; (*: [acHw,acKx],acKz)
; (*: [acHw,acKz],acKB)
; (*: [acHw,acKB],acKD)
; (*: [acHw,acKD],acKF)
; (*: [acHw,acKF],acKH)
; (*: [acHw,acKH],acKJ)
; (*: [acHw,acKJ],acKL)
; (*: [acHw,acKL],acKN)
; (*: [acHw,acKN],acKP)
; (*: [acHw,acKP],acKR)
; (*: [acHw,acKR],acKT)
; (*: [acHw,acKT],acKV)
; (*: [acHw,acKV],acKX)
; (*: [acHw,acKX],acKZ)
; (*: [acHw,acKZ],acL1)
; (*: [acHw,acL1],acL3)
; (*: [acHw,acL3],acL5)
; (*: [acHw,acL5],acL7)
; (*: [acHw,acL7],acL9)
; (*: [acHw,acL9],acLb)
; (*: [acHw,acLb],acLd)
; (*: [acHw,acLd],acLf)
; (*: [acHw,acLf],acLh)
; (*: [acHw,acLh],acLj)
; (*: [acHw,acLj],acLl)
; (*: [acHw,acLl],acLn)
; (*: [acHw,acLn],acLp)
; (*: [acHw,acLp],acLr)
; (*: [acHw,acLr],acLt)
; (*: [acHw,acHw],acKh)
; (*: [acHw,acKh],acKj)
; (*: [acHv,acHv],acKf)
; (acLt,acLv)
; (acKf,acKj)

; WANTEDS (Thoralf style)
; (One [],acHw)

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{acLH} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    acHw)

; GIVENS (names)
;  acHv  <=  a
;  acHw  <=  b
;  acKf  <=  fsk_acKf
;  acKh  <=  fsk_acKh
;  acKj  <=  fsk_acKj
;  acKp  <=  fsk_acKp
;  acKr  <=  fsk_acKr
;  acKt  <=  fsk_acKt
;  acKv  <=  fsk_acKv
;  acKx  <=  fsk_acKx
;  acKz  <=  fsk_acKz
;  acKB  <=  fsk_acKB
;  acKD  <=  fsk_acKD
;  acKF  <=  fsk_acKF
;  acKH  <=  fsk_acKH
;  acKJ  <=  fsk_acKJ
;  acKL  <=  fsk_acKL
;  acKN  <=  fsk_acKN
;  acKP  <=  fsk_acKP
;  acKR  <=  fsk_acKR
;  acKT  <=  fsk_acKT
;  acKV  <=  fsk_acKV
;  acKX  <=  fsk_acKX
;  acKZ  <=  fsk_acKZ
;  acL1  <=  fsk_acL1
;  acL3  <=  fsk_acL3
;  acL5  <=  fsk_acL5
;  acL7  <=  fsk_acL7
;  acL9  <=  fsk_acL9
;  acLb  <=  fsk_acLb
;  acLd  <=  fsk_acLd
;  acLf  <=  fsk_acLf
;  acLh  <=  fsk_acLh
;  acLj  <=  fsk_acLj
;  acLl  <=  fsk_acLl
;  acLn  <=  fsk_acLn
;  acLp  <=  fsk_acLp
;  acLr  <=  fsk_acLr
;  acLt  <=  fsk_acLt
;  acLv  <=  fsk_acLv
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acHv (Array String Int))
; (declare-const acHw (Array String Int))
; (declare-const acKB (Array String Int))
; (declare-const acKD (Array String Int))
; (declare-const acKF (Array String Int))
; (declare-const acKH (Array String Int))
; (declare-const acKJ (Array String Int))
; (declare-const acKL (Array String Int))
; (declare-const acKN (Array String Int))
; (declare-const acKP (Array String Int))
; (declare-const acKR (Array String Int))
; (declare-const acKT (Array String Int))
; (declare-const acKV (Array String Int))
; (declare-const acKX (Array String Int))
; (declare-const acKZ (Array String Int))
; (declare-const acKf (Array String Int))
; (declare-const acKh (Array String Int))
; (declare-const acKj (Array String Int))
; (declare-const acKp (Array String Int))
; (declare-const acKr (Array String Int))
; (declare-const acKt (Array String Int))
; (declare-const acKv (Array String Int))
; (declare-const acKx (Array String Int))
; (declare-const acKz (Array String Int))
; (declare-const acL1 (Array String Int))
; (declare-const acL3 (Array String Int))
; (declare-const acL5 (Array String Int))
; (declare-const acL7 (Array String Int))
; (declare-const acL9 (Array String Int))
; (declare-const acLb (Array String Int))
; (declare-const acLd (Array String Int))
; (declare-const acLf (Array String Int))
; (declare-const acLh (Array String Int))
; (declare-const acLj (Array String Int))
; (declare-const acLl (Array String Int))
; (declare-const acLn (Array String Int))
; (declare-const acLp (Array String Int))
; (declare-const acLr (Array String Int))
; (declare-const acLt (Array String Int))
; (declare-const acLv (Array String Int))
(declare-const
   acHv
   (Array String Int))
(declare-const
   acHw
   (Array String Int))
(declare-const
   acKf
   (Array String Int))
(declare-const
   acKh
   (Array String Int))
(declare-const
   acKj
   (Array String Int))
(declare-const
   acKp
   (Array String Int))
(declare-const
   acKr
   (Array String Int))
(declare-const
   acKt
   (Array String Int))
(declare-const
   acKv
   (Array String Int))
(declare-const
   acKx
   (Array String Int))
(declare-const
   acKz
   (Array String Int))
(declare-const
   acKB
   (Array String Int))
(declare-const
   acKD
   (Array String Int))
(declare-const
   acKF
   (Array String Int))
(declare-const
   acKH
   (Array String Int))
(declare-const
   acKJ
   (Array String Int))
(declare-const
   acKL
   (Array String Int))
(declare-const
   acKN
   (Array String Int))
(declare-const
   acKP
   (Array String Int))
(declare-const
   acKR
   (Array String Int))
(declare-const
   acKT
   (Array String Int))
(declare-const
   acKV
   (Array String Int))
(declare-const
   acKX
   (Array String Int))
(declare-const
   acKZ
   (Array String Int))
(declare-const
   acL1
   (Array String Int))
(declare-const
   acL3
   (Array String Int))
(declare-const
   acL5
   (Array String Int))
(declare-const
   acL7
   (Array String Int))
(declare-const
   acL9
   (Array String Int))
(declare-const
   acLb
   (Array String Int))
(declare-const
   acLd
   (Array String Int))
(declare-const
   acLf
   (Array String Int))
(declare-const
   acLh
   (Array String Int))
(declare-const
   acLj
   (Array String Int))
(declare-const
   acLl
   (Array String Int))
(declare-const
   acLn
   (Array String Int))
(declare-const
   acLp
   (Array String Int))
(declare-const
   acLr
   (Array String Int))
(declare-const
   acLt
   (Array String Int))
(declare-const
   acLv
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acLv)
      :named
      given-9.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKj)
         acKp)
      :named
      given-9.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKp)
         acKr)
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
           acHw
           acKr)
         acKt)
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
           acHw
           acKt)
         acKv)
      :named
      given-9.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKv)
         acKx)
      :named
      given-9.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKx)
         acKz)
      :named
      given-9.7))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKz)
         acKB)
      :named
      given-9.8))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKB)
         acKD)
      :named
      given-9.9))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKD)
         acKF)
      :named
      given-9.10))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKF)
         acKH)
      :named
      given-9.11))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKH)
         acKJ)
      :named
      given-9.12))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKJ)
         acKL)
      :named
      given-9.13))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKL)
         acKN)
      :named
      given-9.14))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKN)
         acKP)
      :named
      given-9.15))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKP)
         acKR)
      :named
      given-9.16))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKR)
         acKT)
      :named
      given-9.17))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKT)
         acKV)
      :named
      given-9.18))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKV)
         acKX)
      :named
      given-9.19))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKX)
         acKZ)
      :named
      given-9.20))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKZ)
         acL1)
      :named
      given-9.21))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL1)
         acL3)
      :named
      given-9.22))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL3)
         acL5)
      :named
      given-9.23))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL5)
         acL7)
      :named
      given-9.24))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL7)
         acL9)
      :named
      given-9.25))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acL9)
         acLb)
      :named
      given-9.26))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLb)
         acLd)
      :named
      given-9.27))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLd)
         acLf)
      :named
      given-9.28))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLf)
         acLh)
      :named
      given-9.29))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLh)
         acLj)
      :named
      given-9.30))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLj)
         acLl)
      :named
      given-9.31))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLl)
         acLn)
      :named
      given-9.32))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLn)
         acLp)
      :named
      given-9.33))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLp)
         acLr)
      :named
      given-9.34))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acLr)
         acLt)
      :named
      given-9.35))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acHw)
         acKh)
      :named
      given-9.36))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHw
           acKh)
         acKj)
      :named
      given-9.37))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHv
           acHv)
         acKf)
      :named
      given-9.38))
(assert
   (!
      (= acLt acLv)
      :named
      given-9.39))
(assert
   (!
      (= acKf acKj)
      :named
      given-9.40))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{acLH} {2}:: One ~ b (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    acHw)

; WANTEDS (names)
;  acHw  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHw)))
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
;         acLv)
;      :named
;      given-9.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKj)
;         acKp)
;      :named
;      given-9.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKp)
;         acKr)
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
;           acHw
;           acKr)
;         acKt)
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
;           acHw
;           acKt)
;         acKv)
;      :named
;      given-9.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKv)
;         acKx)
;      :named
;      given-9.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKx)
;         acKz)
;      :named
;      given-9.7)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKz)
;         acKB)
;      :named
;      given-9.8)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKB)
;         acKD)
;      :named
;      given-9.9)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKD)
;         acKF)
;      :named
;      given-9.10)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKF)
;         acKH)
;      :named
;      given-9.11)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKH)
;         acKJ)
;      :named
;      given-9.12)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKJ)
;         acKL)
;      :named
;      given-9.13)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKL)
;         acKN)
;      :named
;      given-9.14)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKN)
;         acKP)
;      :named
;      given-9.15)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKP)
;         acKR)
;      :named
;      given-9.16)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKR)
;         acKT)
;      :named
;      given-9.17)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKT)
;         acKV)
;      :named
;      given-9.18)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKV)
;         acKX)
;      :named
;      given-9.19)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKX)
;         acKZ)
;      :named
;      given-9.20)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKZ)
;         acL1)
;      :named
;      given-9.21)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acL1)
;         acL3)
;      :named
;      given-9.22)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acL3)
;         acL5)
;      :named
;      given-9.23)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acL5)
;         acL7)
;      :named
;      given-9.24)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acL7)
;         acL9)
;      :named
;      given-9.25)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acL9)
;         acLb)
;      :named
;      given-9.26)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLb)
;         acLd)
;      :named
;      given-9.27)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLd)
;         acLf)
;      :named
;      given-9.28)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLf)
;         acLh)
;      :named
;      given-9.29)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLh)
;         acLj)
;      :named
;      given-9.30)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLj)
;         acLl)
;      :named
;      given-9.31)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLl)
;         acLn)
;      :named
;      given-9.32)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLn)
;         acLp)
;      :named
;      given-9.33)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLp)
;         acLr)
;      :named
;      given-9.34)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acLr)
;         acLt)
;      :named
;      given-9.35)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acHw)
;         acKh)
;      :named
;      given-9.36)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHw
;           acKh)
;         acKj)
;      :named
;      given-9.37)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHv
;           acHv)
;         acKf)
;      :named
;      given-9.38)
;   (!
;      (= acLt acLv)
;      :named
;      given-9.39)
;   (!
;      (= acKf acKj)
;      :named
;      given-9.40)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               acHw)))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.21
;    given-9.20
;    given-9.19
;    given-9.18
;    given-9.6
;    given-9.17
;    given-9.15
;    given-9.3
;    given-9.14
;    given-9.12
;    given-9.16
;    given-9.5
;    given-9.1
;    given-9.9
;    given-9.11
;    given-9.10
;    given-9.4
;    given-9.7
;    given-9.8
;    given-9.29
;    given-9.30
;    given-9.31
;    given-9.28
;    given-9.27
;    given-9.26
;    given-9.25
;    given-9.24
;    given-9.23
;    given-9.22
;    wanted-9
;    given-9.39
;    given-9.37
;    given-9.36
;    given-9.35
;    given-9.34
;    given-9.33
;    given-9.2
;    given-9.13
;    given-9.32)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_acM1 {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acLV {3}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLX {2}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLZ {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLN {2}:: (b *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_acLP {1}:: (b *: fsk0) ~ fsk1 (CFunEqCan)
; [G] cobox_acLL {1}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acM4 {1}:: fsk0 ~ fsk1 (CTyEqCan)
; [G] cobox_acM5 {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acMc} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acM0)
; (*: [acHE,acLO],acLU)
; (*: [acHE,acLU],acLW)
; (*: [acHE,acLW],acLY)
; (*: [acHE,acHE],acLM)
; (*: [acHE,acLM],acLO)
; (*: [acHD,acHD],acLK)
; (acLY,acM0)
; (acLK,acLO)

; WANTEDS (Thoralf style)
; (One [],acHD)

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{acMc} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    acHD)

; GIVENS (names)
;  acHD  <=  a
;  acHE  <=  b
;  acLK  <=  fsk_acLK
;  acLM  <=  fsk_acLM
;  acLO  <=  fsk_acLO
;  acLU  <=  fsk_acLU
;  acLW  <=  fsk_acLW
;  acLY  <=  fsk_acLY
;  acM0  <=  fsk_acM0
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acHD (Array String Int))
; (declare-const acHE (Array String Int))
; (declare-const acLK (Array String Int))
; (declare-const acLM (Array String Int))
; (declare-const acLO (Array String Int))
; (declare-const acLU (Array String Int))
; (declare-const acLW (Array String Int))
; (declare-const acLY (Array String Int))
; (declare-const acM0 (Array String Int))
(declare-const
   acHD
   (Array String Int))
(declare-const
   acHE
   (Array String Int))
(declare-const
   acLK
   (Array String Int))
(declare-const
   acLM
   (Array String Int))
(declare-const
   acLO
   (Array String Int))
(declare-const
   acLU
   (Array String Int))
(declare-const
   acLW
   (Array String Int))
(declare-const
   acLY
   (Array String Int))
(declare-const
   acM0
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acM0)
      :named
      given-11.1))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLO)
         acLU)
      :named
      given-11.2))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLU)
         acLW)
      :named
      given-11.3))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLW)
         acLY)
      :named
      given-11.4))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acHE)
         acLM)
      :named
      given-11.5))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHE
           acLM)
         acLO)
      :named
      given-11.6))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           acHD
           acHD)
         acLK)
      :named
      given-11.7))
(assert
   (!
      (= acLY acM0)
      :named
      given-11.8))
(assert
   (!
      (= acLK acLO)
      :named
      given-11.9))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{acMc} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    acHD)

; WANTEDS (names)
;  acHD  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHD)))
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
;      (=
;         (
;           (as
;              const
;              (Array String Int))
;           0)
;         acM0)
;      :named
;      given-11.1)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHE
;           acLO)
;         acLU)
;      :named
;      given-11.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHE
;           acLU)
;         acLW)
;      :named
;      given-11.3)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHE
;           acLW)
;         acLY)
;      :named
;      given-11.4)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHE
;           acHE)
;         acLM)
;      :named
;      given-11.5)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHE
;           acLM)
;         acLO)
;      :named
;      given-11.6)
;   (!
;      (=
;         (
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHD
;           acHD)
;         acLK)
;      :named
;      given-11.7)
;   (!
;      (= acLY acM0)
;      :named
;      given-11.8)
;   (!
;      (= acLK acLO)
;      :named
;      given-11.9)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               acHD)))
;      :named
;      wanted-11))
(get-unsat-core)
; (wanted-11
;    given-11.9
;    given-11.8
;    given-11.7
;    given-11.6
;    given-11.5
;    given-11.4
;    given-11.3
;    given-11.1
;    given-11.2)
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_acMi {0}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_acMg {0}:: (a *: a) ~ fsk0 (CFunEqCan)
; [G] cobox_acMj {1}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acMo} {2}:: One ~ a (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],acMh)
; (*: [acHL,acHL],acMf)
; (acMf,acMh)

; WANTEDS (Thoralf style)
; (One [],acHL)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{acMo} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    acHL)

; GIVENS (names)
;  acHL  <=  a
;  acMf  <=  fsk_acMf
;  acMh  <=  fsk_acMh
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acHL (Array String Int))
; (declare-const acMf (Array String Int))
; (declare-const acMh (Array String Int))
(declare-const
   acHL
   (Array String Int))
(declare-const
   acMf
   (Array String Int))
(declare-const
   acMh
   (Array String Int))
(assert
   (!
      (=
         (
           (as
              const
              (Array String Int))
           0)
         acMh)
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
           acHL
           acHL)
         acMf)
      :named
      given-13.2))
(assert
   (!
      (= acMf acMh)
      :named
      given-13.3))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{acMo} {2}:: One ~ a (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    acHL)

; WANTEDS (names)
;  acHL  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               acHL)))
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
;         acMh)
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
;           acHL
;           acHL)
;         acMf)
;      :named
;      given-13.2)
;   (!
;      (= acMf acMh)
;      :named
;      given-13.3)
;   (!
;      (or
;         false
;         (not
;            (=
;               (
;                 (as
;                    const
;                    (Array String Int))
;                 0)
;               acHL)))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1 wanted-13 given-13.2 given-13.3)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_acMx {1}:: (v *: v) ~ fsk0 (CFunEqCan)
; [G] cobox_acMs {0}:: (v *: w) ~ fsk0 (CFunEqCan)
; [G] cobox_acMt {1}:: fsk0 ~ u (CTyEqCan)
; [G] cobox_acMA {1}:: fsk0 ~ v (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{acHZ} {0}:: u ~ w (CNonCanonical)

; GIVENS (Thoralf style)
; (*: [acHS,acHS],acMw)
; (*: [acHS,acHT],acMr)
; (acMr,acHR)
; (acMw,acHS)

; WANTEDS (Thoralf style)
; (acHR,acHT)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{acHZ} {0}:: u ~ w (CNonCanonical)
;  =>  (= acHR acHT)

; GIVENS (names)
;  acHR  <=  u
;  acHS  <=  v
;  acHT  <=  w
;  acMr  <=  fsk_acMr
;  acMw  <=  fsk_acMw
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const acHR (Array String Int))
; (declare-const acHS (Array String Int))
; (declare-const acHT (Array String Int))
; (declare-const acMr (Array String Int))
; (declare-const acMw (Array String Int))
(declare-const
   acHR
   (Array String Int))
(declare-const
   acHS
   (Array String Int))
(declare-const
   acHT
   (Array String Int))
(declare-const
   acMr
   (Array String Int))
(declare-const
   acMw
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
           acHS
           acHS)
         acMw)
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
           acHS
           acHT)
         acMr)
      :named
      given-15.2))
(assert
   (!
      (= acMr acHR)
      :named
      given-15.3))
(assert
   (!
      (= acMw acHS)
      :named
      given-15.4))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{acHZ} {0}:: u ~ w (CNonCanonical)
;  =>  (= acHR acHT)

; WANTEDS (names)
;  acHR  <=  u
;  acHT  <=  w
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         false
         (not
            (= acHR acHT)))
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
;           (_
;              map
;              (+
;                 (Int Int)
;                 Int))
;           acHS
;           acHS)
;         acMw)
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
;           acHS
;           acHT)
;         acMr)
;      :named
;      given-15.2)
;   (!
;      (= acMr acHR)
;      :named
;      given-15.3)
;   (!
;      (= acMw acHS)
;      :named
;      given-15.4)
;   (!
;      (or
;         false
;         (not
;            (= acHR acHT)))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.2 given-15.3 given-15.4 wanted-15 given-15.1)
(pop 1)
(echo "solver-finish-cycle-15")
(exit)
; Test suite units: RUNNING...
; Test suite units: PASS