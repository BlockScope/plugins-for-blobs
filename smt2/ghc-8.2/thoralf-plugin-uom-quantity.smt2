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
; [WD] hole{aaHI} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aaHI} {2}:: One
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
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aaHI} {2}:: One
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
; [WD] hole{aaId} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{aaId} {2}:: One
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
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{aaId} {2}:: One
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
; [W] hole{aaWJ} {2}:: Base "m"
;                      ~
;                      ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
; [D] _ {2}:: Base "m"
;             ~
;             ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["m"],*: [/: [Base ["m"],Base ["s"]],Base ["s"]])
; (Base ["m"],*: [/: [Base ["m"],Base ["s"]],Base ["s"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [W] hole{aaWJ} {2}:: Base "m"
;                           ~
;                           ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
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
;                  ~
;                  ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
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
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [W] hole{aaWJ} {2}:: Base "m"
;                           ~
;                           ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
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
;                  ~
;                  ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
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
; [G] cobox_aaXh {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_aaXj {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_aaXl {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_aaXp {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aaXA} {3}:: (mps *: Base "s") ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; (Base ["m"],aaXg)
; (Base ["s"],aaXi)
; (/: [aaXg,aaXi],aaXk)
; (aaXk,aaW3)

; WANTEDS (Thoralf style)
; (*: [aaW3,Base ["s"]],Base ["m"])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{aaXA} {3}:: (mps *: Base "s")
;                            ~
;                            Base "m" (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaW3
;      (store base "s" one))
;    (store base "m" one))

; GIVENS (names)
;  aaW3  <=  mps
;  aaXg  <=  fsk_aaXg
;  aaXi  <=  fsk_aaXi
;  aaXk  <=  fsk_aaXk
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aaW3 (Array String Int))
; (declare-const aaXg (Array String Int))
; (declare-const aaXi (Array String Int))
; (declare-const aaXk (Array String Int))
(declare-const
   aaW3
   (Array String Int))
(declare-const
   aaXg
   (Array String Int))
(declare-const
   aaXi
   (Array String Int))
(declare-const
   aaXk
   (Array String Int))
(assert
   (!
      (=
         (store base "m" one)
         aaXg)
      :named
      given-8.1))
(assert
   (!
      (=
         (store base "s" one)
         aaXi)
      :named
      given-8.2))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aaXg
           aaXi)
         aaXk)
      :named
      given-8.3))
(assert
   (!
      (= aaXk aaW3)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{aaXA} {3}:: (mps *: Base "s")
;                            ~
;                            Base "m" (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaW3
;      (store base "s" one))
;    (store base "m" one))

; WANTEDS (names)
;  aaW3  <=  mps
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
              aaW3
              (store base "s" one))
            (store base "m" one)))
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
;         (store base "m" one)
;         aaXg)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store base "s" one)
;         aaXi)
;      :named
;      given-8.2)
;   (!
;      (=
;         (
;           (_
;              map
;              (-
;                 (Int Int)
;                 Int))
;           aaXg
;           aaXi)
;         aaXk)
;      :named
;      given-8.3)
;   (!
;      (= aaXk aaW3)
;      :named
;      given-8.4)
;   (!
;      (not
;         (=
;            (
;              (_
;                 map
;                 (+
;                    (Int Int)
;                    Int))
;              aaW3
;              (store base "s" one))
;            (store base "m" one)))
;      :named
;      wanted-8))
(get-unsat-core)
; (given-8.1 given-8.2 given-8.3 given-8.4 wanted-8)
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
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaHX} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aaHX} {2}:: One
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
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aaHX} {2}:: One
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
; [WD] hole{aaIs} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{aaIs} {2}:: One
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
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{aaIs} {2}:: One
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
