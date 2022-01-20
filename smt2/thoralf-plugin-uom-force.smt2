; Build profile: -w ghc-8.2.2 -O1
; [1 of 2] Compiling UnitDefs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
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
(push 1)
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
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
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
; [WD] hole{aaIy} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
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
                 (store base "s" one)
                 (store base "s" one)))))
      :named
      wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaJ3} {2}:: One
;                       ~
;                       (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
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
                 (store base "kg" one)
                 (store base "kg" one)))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
(assert
   (! false :named wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaJy} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-6")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
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
                 (store base "m" one)
                 (store base "m" one)))))
      :named
      wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(exit)
; [2 of 2] Compiling Main
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
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
(push 1)
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
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
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
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(assert
   (! false :named wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(exit)
; [1 of 2] Compiling UnitDefs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
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
(push 1)
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
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
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
; [WD] hole{aaIy} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
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
                 (store base "s" one)
                 (store base "s" one)))))
      :named
      wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaJ3} {2}:: One
;                       ~
;                       (Base "kg" /: Base "kg") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["kg"],Base ["kg"]])

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
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
                 (store base "kg" one)
                 (store base "kg" one)))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
(assert
   (! false :named wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaJy} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-6")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
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
                 (store base "m" one)
                 (store base "m" one)))))
      :named
      wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(exit)
; [2 of 2] Compiling Main
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
(declare-datatypes
   ()
   (
     (Type
        (apply
           (fst Type)
           (snd Type))
        (lit
           (getstr String)))))
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
(push 1)
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
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
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
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(assert
   (! false :named wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(exit)
; Test suite force: RUNNING...
; Test suite force: PASS