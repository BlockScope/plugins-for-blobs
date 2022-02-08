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
; [WD] hole{co_a5qA} {1}:: One
;                          ~# (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a5qA} {1}:: One
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
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a5qA} {1}:: One
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
; [WD] hole{co_a5qM} {1}:: One
;                          ~# (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a5qM} {1}:: One
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
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a5qM} {1}:: One
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
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a5Cs} {2}:: ((Base "m" /: Base "s") *: Base "s")
;                          ~# Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [/: [Base ["m"],Base ["s"]],Base ["s"]],Base ["m"])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a5Cs} {2}:: ((Base "m" /: Base "s") *: Base "s")
;                               ~# Base "m" (CNonCanonical)
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
;           (-
;              (Int Int)
;              Int))
;        (store base "m" one)
;        (store base "s" one))
;      (store base "s" one))
;    (store base "m" one))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a5Cs} {2}:: ((Base "m" /: Base "s") *: Base "s")
;                               ~# Base "m" (CNonCanonical)
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
;           (-
;              (Int Int)
;              Int))
;        (store base "m" one)
;        (store base "s" one))
;      (store base "s" one))
;    (store base "m" one))

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
              (
                (_
                   map
                   (-
                      (Int Int)
                      Int))
                (store base "m" one)
                (store base "s" one))
              (store base "s" one))
            (store base "m" one)))
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
;                 (+
;                    (Int Int)
;                    Int))
;              (
;                (_
;                   map
;                   (-
;                      (Int Int)
;                      Int))
;                (store base "m" one)
;                (store base "s" one))
;              (store base "s" one))
;            (store base "m" one)))
;      :named
;      wanted-4))
(get-unsat-core)
; (wanted-4)
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a5CD {1}:: (Base "m" /: Base "s") ~# mps_a5BP[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5CI} {1}:: Base "m"
;                          ~# (mps_a5BP[sk:1] *: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; (/: [Base ["m"],Base ["s"]],a5BP)

; WANTEDS (Thoralf style)
; (Base ["m"],*: [a5BP,Base ["s"]])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a5CI} {1}:: Base "m"
;                               ~# (mps_a5BP[sk:1] *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a5BP
;      (store base "s" one)))

; GIVENS (names)
;  a5BP  <=  mps_a5BP[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a5BP (Array String Int))
(declare-const
   a5BP
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
           (store base "m" one)
           (store base "s" one))
         a5BP)
      :named
      given-8.1))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a5CI} {1}:: Base "m"
;                               ~# (mps_a5BP[sk:1] *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      a5BP
;      (store base "s" one)))

; WANTEDS (names)
;  a5BP  <=  mps_a5BP[sk:1]
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
              a5BP
              (store base "s" one))))
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
;           (store base "m" one)
;           (store base "s" one))
;         a5BP)
;      :named
;      given-8.1)
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
;              a5BP
;              (store base "s" one))))
;      :named
;      wanted-8))
(get-unsat-core)
; (given-8.1 wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
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
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(exit)
