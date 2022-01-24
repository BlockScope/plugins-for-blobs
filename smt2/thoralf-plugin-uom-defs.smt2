; Build profile: -w ghc-8.2.2 -O1
; [1 of 2] Compiling Defs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
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
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaGw} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aaGw} {2}:: One
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
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aaGw} {2}:: One
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
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(exit)
; [2 of 2] Compiling Main
; [1 of 2] Compiling Defs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
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
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaGH} {2}:: One
;                       ~
;                       (Base "byte" /: Base "byte") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["byte"],Base ["byte"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aaGH} {2}:: One
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
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aaGH} {2}:: One
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
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(exit)
; Test suite defs: RUNNING...
; Test suite defs: PASS