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
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aaQH} {2}:: One
;                          ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aaQH} {2}:: One
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
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aaQH} {2}:: One
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
;              (store base "s" one)
;              (store base "s" one))))
;      :named
;      wanted-2))
(get-unsat-core)
; (wanted-2)
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aaRc} {2}:: One
;                          ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aaRc} {2}:: One
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
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aaRc} {2}:: One
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
;              (store base "m" one)
;              (store base "m" one))))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(exit)
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
; [WD] hole{co_ab10} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (ab0M,LiftedRep [])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_ab10} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab0M
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
;      [WD] hole{co_ab10} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab0M
;    (lit "63A"))

; WANTEDS (names)
;  ab0M  <=  t_ab0M
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ab0M Type)
(declare-const ab0M Type)
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
; [WD] hole{co_ab26} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (ab1Z,LiftedRep [])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_ab26} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab1Z
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
;      [WD] hole{co_ab26} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab1Z
;    (lit "63A"))

; WANTEDS (names)
;  ab1Z  <=  t_ab1Z
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ab1Z Type)
(declare-const ab1Z Type)
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
; [WD] hole{co_ab2q} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (ab2e,LiftedRep [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_ab2q} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab2e
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
;      [WD] hole{co_ab2q} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab2e
;    (lit "63A"))

; WANTEDS (names)
;  ab2e  <=  t_ab2e
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ab2e Type)
(declare-const ab2e Type)
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
; [WD] hole{co_ab33} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (ab2N,LiftedRep [])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_ab33} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab2N
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
;      [WD] hole{co_ab33} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab2N
;    (lit "63A"))

; WANTEDS (names)
;  ab2N  <=  t_ab2N
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ab2N Type)
(declare-const ab2N Type)
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
; [WD] hole{co_ab3B} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (ab3u,LiftedRep [])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_ab3B} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab3u
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
;      [WD] hole{co_ab3B} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab3u
;    (lit "63A"))

; WANTEDS (names)
;  ab3u  <=  t_ab3u
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ab3u Type)
(declare-const ab3u Type)
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
; [WD] hole{co_ab3S} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (ab3J,LiftedRep [])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_ab3S} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab3J
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
;      [WD] hole{co_ab3S} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    ab3J
;    (lit "63A"))

; WANTEDS (names)
;  ab3J  <=  t_ab3J
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const ab3J Type)
(declare-const ab3J Type)
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
; [W] hole{co_ab5L} {2}:: Base "m"
;                         ~ ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
; [D] _ {2}:: Base "m"
;             ~ ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["m"],*: [/: [Base ["m"],Base ["s"]],Base ["s"]])
; (Base ["m"],*: [/: [Base ["m"],Base ["s"]],Base ["s"]])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [W] hole{co_ab5L} {2}:: Base "m"
;                              ~ ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
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
;        (store base "s" one))
;      (store base "s" one)))

;      [D] _ {2}:: Base "m"
;                  ~ ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
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
;        (store base "s" one))
;      (store base "s" one)))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [W] hole{co_ab5L} {2}:: Base "m"
;                              ~ ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
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
;        (store base "s" one))
;      (store base "s" one)))

;      [D] _ {2}:: Base "m"
;                  ~ ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
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
;        (store base "s" one))
;      (store base "s" one)))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
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
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (store base "m" one)
                   (store base "s" one))
                 (store base "s" one))))
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
                   (_
                      map
                      (-
                         (Int Int)
                         Int))
                   (store base "m" one)
                   (store base "s" one))
                 (store base "s" one)))))
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
;               (store base "m" one)
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
;                   (store base "s" one))
;                 (store base "s" one))))
;         (not
;            (=
;               (store base "m" one)
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
;                   (store base "s" one))
;                 (store base "s" one)))))
;      :named
;      wanted-10))
(get-unsat-core)
; (wanted-10)
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] co_ab6j {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] co_ab6l {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] co_ab6n {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] co_ab6r {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_ab6C} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)

; GIVENS (Thoralf style)
; (Base ["m"],ab6i)
; (Base ["s"],ab6k)
; (/: [ab6i,ab6k],ab6m)
; (ab6m,ab55)

; WANTEDS (Thoralf style)
; (*: [ab55,ab6k],ab6i)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_ab6C} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ab55
;      ab6k)
;    ab6i)

; GIVENS (names)
;  ab55  <=  mps
;  ab6i  <=  fsk_ab6i
;  ab6k  <=  fsk_ab6k
;  ab6m  <=  fsk_ab6m
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const ab55 (Array String Int))
; (declare-const ab6i (Array String Int))
; (declare-const ab6k (Array String Int))
; (declare-const ab6m (Array String Int))
(declare-const
   ab55
   (Array String Int))
(declare-const
   ab6i
   (Array String Int))
(declare-const
   ab6k
   (Array String Int))
(declare-const
   ab6m
   (Array String Int))
(assert
   (!
      (=
         (store base "m" one)
         ab6i)
      :named
      given-14.1))
(assert
   (!
      (=
         (store base "s" one)
         ab6k)
      :named
      given-14.2))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           ab6i
           ab6k)
         ab6m)
      :named
      given-14.3))
(assert
   (!
      (= ab6m ab55)
      :named
      given-14.4))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_ab6C} {3}:: (mps *: fsk0) ~ fsk1 (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      ab55
;      ab6k)
;    ab6i)

; WANTEDS (names)
;  ab55  <=  mps
;  ab6i  <=  fsk_ab6i
;  ab6k  <=  fsk_ab6k
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
              ab55
              ab6k)
            ab6i))
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
;         (store base "m" one)
;         ab6i)
;      :named
;      given-14.1)
;   (!
;      (=
;         (store base "s" one)
;         ab6k)
;      :named
;      given-14.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           ab6i
;           ab6k)
;         ab6m)
;      :named
;      given-14.3)
;   (!
;      (= ab6m ab55)
;      :named
;      given-14.4)
;   (!
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              ab55
;              ab6k)
;            ab6i))
;      :named
;      wanted-14))
(get-unsat-core)
; (given-14.1 given-14.3 given-14.4 wanted-14)
(pop 1)
(echo "solver-finish-cycle-14")
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
(echo "solver-start-cycle-1")
(echo "solver-finish-cycle-1")
(exit)
