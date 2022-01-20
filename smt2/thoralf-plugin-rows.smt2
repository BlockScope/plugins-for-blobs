; Build profile: -w ghc-8.2.2 -O1
; [2 of 4] Compiling Nat
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
(declare-datatypes
   (T)
   (
     (Maybe
        nothing
        (just
           (fromJust T)))))
(push 1)
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
(declare-datatypes
   (T)
   (
     (Maybe
        nothing
        (just
           (fromJust T)))))
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
; [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Th,a2Ti],<? [a2Tk,a2Tl])
; (<? [a2Tj,a2Tl],<? [a2Tg,a2Ti])
; (<? [a2Tg,a2Th],<? [a2Tj,a2Tk])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const a2Tg Int)
(declare-const a2Th Int)
(declare-const a2Ti Int)
(declare-const a2Tj Int)
(declare-const a2Tk Int)
(declare-const a2Tl Int)
(assert
   (<= 0 a2Tg))
(assert
   (<= 0 a2Th))
(assert
   (<= 0 a2Ti))
(assert
   (<= 0 a2Tj))
(assert
   (<= 0 a2Tk))
(assert
   (<= 0 a2Tl))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a2Th a2Ti)
                     (< a2Tk a2Tl))))
            (not
               (=
                  (< a2Tj a2Tl)
                  (< a2Tg a2Ti))))
         (not
            (=
               (< a2Tg a2Th)
               (< a2Tj a2Tk))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Th,a2Ti],<? [a2Tk,a2Tl])
; (<? [a2Tj,a2Tl],<? [a2Tg,a2Ti])
; (<? [a2Tg,a2Th],<? [a2Tj,a2Tk])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const a2Tg Int)
(declare-const a2Th Int)
(declare-const a2Ti Int)
(declare-const a2Tj Int)
(declare-const a2Tk Int)
(declare-const a2Tl Int)
(assert
   (<= 0 a2Tg))
(assert
   (<= 0 a2Th))
(assert
   (<= 0 a2Ti))
(assert
   (<= 0 a2Tj))
(assert
   (<= 0 a2Tk))
(assert
   (<= 0 a2Tl))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a2Th a2Ti)
                     (< a2Tk a2Tl))))
            (not
               (=
                  (< a2Tj a2Tl)
                  (< a2Tg a2Ti))))
         (not
            (=
               (< a2Tg a2Th)
               (< a2Tj a2Tk))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U7,a2U8],+ [a2U5,a2U6])
; (+ [a2U8,a2U7],+ [a2U6,a2U5])

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(declare-const a2U5 Int)
(declare-const a2U6 Int)
(declare-const a2U7 Int)
(declare-const a2U8 Int)
(assert
   (<= 0 a2U5))
(assert
   (<= 0 a2U6))
(assert
   (<= 0 a2U7))
(assert
   (<= 0 a2U8))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a2U7 a2U8)
                  (+ a2U5 a2U6))))
         (not
            (=
               (+ a2U8 a2U7)
               (+ a2U6 a2U5))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U7,a2U8],+ [a2U5,a2U6])
; (+ [a2U8,a2U7],+ [a2U6,a2U5])

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(declare-const a2U5 Int)
(declare-const a2U6 Int)
(declare-const a2U7 Int)
(declare-const a2U8 Int)
(assert
   (<= 0 a2U5))
(assert
   (<= 0 a2U6))
(assert
   (<= 0 a2U7))
(assert
   (<= 0 a2U8))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a2U7 a2U8)
                  (+ a2U5 a2U6))))
         (not
            (=
               (+ a2U8 a2U7)
               (+ a2U6 a2U5))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a2UT {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UP,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(declare-const a2UP Int)
(assert
   (<= 0 a2UP))
(assert
   (!
      (= a2UP 0)
      :named
      given-5.1))
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
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a2UT {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UP,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(declare-const a2UP Int)
(assert
   (<= 0 a2UP))
(assert
   (!
      (= a2UP 0)
      :named
      given-5.1))
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
; [G] cobox_a2UX {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
(push 1)
(declare-const a2UQ Int)
(assert
   (<= 0 a2UQ))
(assert
   (!
      (= a2UQ 0)
      :named
      given-6.1))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a2UX {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
(push 1)
(declare-const a2UQ Int)
(assert
   (<= 0 a2UQ))
(assert
   (!
      (= a2UQ 0)
      :named
      given-6.1))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (a3cg,a2UP)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
(push 1)
(declare-const a2UP Int)
(declare-const a2V1 Int)
(declare-const a3cg Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a3cg))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-7.1))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-7.2))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(assert
   (! false :named wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (a3cg,a2UP)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
(push 1)
(declare-const a2UP Int)
(declare-const a2V1 Int)
(declare-const a3cg Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a3cg))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-7.1))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-7.2))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(assert
   (! false :named wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-8.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-8.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-8.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-8.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cr} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; (- [a2V3,a2V1],- [a2UQ,a2UP])

(echo "givens-start-cycle-9")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-9.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-9.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
(assert
   (!
      (or
         false
         (not
            (=
               (- a2V3 a2V1)
               (- a2UQ a2UP))))
      :named
      wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-9.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-9.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a2Vk {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2Vi,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
(push 1)
(declare-const a2Vi Int)
(assert
   (<= 0 a2Vi))
(assert
   (!
      (= a2Vi 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a2Vk {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2Vi,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
(push 1)
(declare-const a2Vi Int)
(assert
   (<= 0 a2Vi))
(assert
   (!
      (= a2Vi 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3cz {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cA {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2Vq],a3cy)
; (a3cy,a2Vi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
(push 1)
(declare-const a2Vi Int)
(declare-const a2Vq Int)
(declare-const a3cy Int)
(assert
   (<= 0 a2Vi))
(assert
   (<= 0 a2Vq))
(assert
   (<= 0 a3cy))
(assert
   (!
      (=
         (+ 1 a2Vq)
         a3cy)
      :named
      given-11.1))
(assert
   (!
      (= a3cy a2Vi)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3cz {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cA {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2Vq],a3cy)
; (a3cy,a2Vi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
(push 1)
(declare-const a2Vi Int)
(declare-const a2Vq Int)
(declare-const a3cy Int)
(assert
   (<= 0 a2Vi))
(assert
   (<= 0 a2Vq))
(assert
   (<= 0 a3cy))
(assert
   (!
      (=
         (+ 1 a2Vq)
         a3cy)
      :named
      given-11.1))
(assert
   (!
      (= a3cy a2Vi)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a2VD {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VA,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
(push 1)
(declare-const a2VA Int)
(assert
   (<= 0 a2VA))
(assert
   (!
      (= a2VA 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a2VD {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VA,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
(push 1)
(declare-const a2VA Int)
(assert
   (<= 0 a2VA))
(assert
   (!
      (= a2VA 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3cF {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cG {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VH],a3cE)
; (a3cE,a2VA)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
(push 1)
(declare-const a2VA Int)
(declare-const a2VH Int)
(declare-const a3cE Int)
(assert
   (<= 0 a2VA))
(assert
   (<= 0 a2VH))
(assert
   (<= 0 a3cE))
(assert
   (!
      (=
         (+ 1 a2VH)
         a3cE)
      :named
      given-13.1))
(assert
   (!
      (= a3cE a2VA)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3cF {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cG {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VH],a3cE)
; (a3cE,a2VA)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
(push 1)
(declare-const a2VA Int)
(declare-const a2VH Int)
(declare-const a3cE Int)
(assert
   (<= 0 a2VA))
(assert
   (<= 0 a2VH))
(assert
   (<= 0 a3cE))
(assert
   (!
      (=
         (+ 1 a2VH)
         a3cE)
      :named
      given-13.1))
(assert
   (!
      (= a3cE a2VA)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a2VU {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
(push 1)
(declare-const a2VQ Int)
(assert
   (<= 0 a2VQ))
(assert
   (!
      (= a2VQ 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a2VU {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
(push 1)
(declare-const a2VQ Int)
(assert
   (<= 0 a2VQ))
(assert
   (!
      (= a2VQ 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-15.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-15.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cT} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; (+ [1,+ [a2VX,a2VS]],+ [a2VQ,a2VS])

(echo "givens-start-cycle-16")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-16.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
(declare-const a2VS Int)
(assert
   (<= 0 a2VS))
(assert
   (!
      (or
         false
         (not
            (=
               (+
                  1
                  (+ a2VX a2VS))
               (+ a2VQ a2VS))))
      :named
      wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-16")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-16.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
(assert
   (! false :named wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (a3cU,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3cU Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-17.1))
(assert
   (!
      (= a3cU true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (a3cU,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3cU Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-17.1))
(assert
   (!
      (= a3cU true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-18.2))
(assert
   (!
      (= a3cU true)
      :named
      given-18.3))
(assert
   (!
      (= a3cX true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-18.2))
(assert
   (!
      (= a3cU true)
      :named
      given-18.3))
(assert
   (!
      (= a3cX true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3d3} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; (<? [a3ac,a3ae],True [])

(echo "givens-start-cycle-19")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-19.2))
(assert
   (!
      (= a3cU true)
      :named
      given-19.3))
(assert
   (!
      (= a3cX true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
(assert
   (!
      (or
         false
         (not
            (=
               (< a3ac a3ae)
               true)))
      :named
      wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-19")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-19.2))
(assert
   (!
      (= a3cU true)
      :named
      given-19.3))
(assert
   (!
      (= a3cX true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
(assert
   (! false :named wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-20.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-20.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3au} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; (a3ao,a3ap)

(echo "givens-start-cycle-21")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-21.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
(assert
   (!
      (or
         false
         (not
            (= a3ao a3ap)))
      :named
      wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-21")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-21.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
(assert
   (! false :named wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3db} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ax,a3ay],+ [a3ay,a3ax])

(echo "givens-start-cycle-22")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
(declare-const a3ax Int)
(declare-const a3ay Int)
(assert
   (<= 0 a3ax))
(assert
   (<= 0 a3ay))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3ax a3ay)
               (+ a3ay a3ax))))
      :named
      wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-22")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
(assert
   (! false :named wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3dj} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3aF,1],+ [1,a3aF])

(echo "givens-start-cycle-23")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
(declare-const a3aF Int)
(assert
   (<= 0 a3aF))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3aF 1)
               (+ 1 a3aF))))
      :named
      wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-23")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
(assert
   (! false :named wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3aX {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3aQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
(push 1)
(declare-const a3aQ Int)
(assert
   (<= 0 a3aQ))
(assert
   (!
      (= a3aQ 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3aX {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3aQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
(push 1)
(declare-const a3aQ Int)
(assert
   (<= 0 a3aQ))
(assert
   (!
      (= a3aQ 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3dp {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3dq {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3b0],a3do)
; (a3do,a3aQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
(push 1)
(declare-const a3aQ Int)
(declare-const a3b0 Int)
(declare-const a3do Int)
(assert
   (<= 0 a3aQ))
(assert
   (<= 0 a3b0))
(assert
   (<= 0 a3do))
(assert
   (!
      (=
         (+ 1 a3b0)
         a3do)
      :named
      given-26.1))
(assert
   (!
      (= a3do a3aQ)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3dp {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3dq {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3b0],a3do)
; (a3do,a3aQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
(push 1)
(declare-const a3aQ Int)
(declare-const a3b0 Int)
(declare-const a3do Int)
(assert
   (<= 0 a3aQ))
(assert
   (<= 0 a3b0))
(assert
   (<= 0 a3do))
(assert
   (!
      (=
         (+ 1 a3b0)
         a3do)
      :named
      given-26.1))
(assert
   (!
      (= a3do a3aQ)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(exit)
(exit)
; [2 of 4] Compiling Nat
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
(declare-datatypes
   (T)
   (
     (Maybe
        nothing
        (just
           (fromJust T)))))
(push 1)
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
(declare-datatypes
   (T)
   (
     (Maybe
        nothing
        (just
           (fromJust T)))))
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
; [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Th,a2Ti],<? [a2Tk,a2Tl])
; (<? [a2Tj,a2Tl],<? [a2Tg,a2Ti])
; (<? [a2Tg,a2Th],<? [a2Tj,a2Tk])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const a2Tg Int)
(declare-const a2Th Int)
(declare-const a2Ti Int)
(declare-const a2Tj Int)
(declare-const a2Tk Int)
(declare-const a2Tl Int)
(assert
   (<= 0 a2Tg))
(assert
   (<= 0 a2Th))
(assert
   (<= 0 a2Ti))
(assert
   (<= 0 a2Tj))
(assert
   (<= 0 a2Tk))
(assert
   (<= 0 a2Tl))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a2Th a2Ti)
                     (< a2Tk a2Tl))))
            (not
               (=
                  (< a2Tj a2Tl)
                  (< a2Tg a2Ti))))
         (not
            (=
               (< a2Tg a2Th)
               (< a2Tj a2Tk))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Th,a2Ti],<? [a2Tk,a2Tl])
; (<? [a2Tj,a2Tl],<? [a2Tg,a2Ti])
; (<? [a2Tg,a2Th],<? [a2Tj,a2Tk])

(echo "givens-start-cycle-2")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
(declare-const a2Tg Int)
(declare-const a2Th Int)
(declare-const a2Ti Int)
(declare-const a2Tj Int)
(declare-const a2Tk Int)
(declare-const a2Tl Int)
(assert
   (<= 0 a2Tg))
(assert
   (<= 0 a2Th))
(assert
   (<= 0 a2Ti))
(assert
   (<= 0 a2Tj))
(assert
   (<= 0 a2Tk))
(assert
   (<= 0 a2Tl))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a2Th a2Ti)
                     (< a2Tk a2Tl))))
            (not
               (=
                  (< a2Tj a2Tl)
                  (< a2Tg a2Ti))))
         (not
            (=
               (< a2Tg a2Th)
               (< a2Tj a2Tk))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U7,a2U8],+ [a2U5,a2U6])
; (+ [a2U8,a2U7],+ [a2U6,a2U5])

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(declare-const a2U5 Int)
(declare-const a2U6 Int)
(declare-const a2U7 Int)
(declare-const a2U8 Int)
(assert
   (<= 0 a2U5))
(assert
   (<= 0 a2U6))
(assert
   (<= 0 a2U7))
(assert
   (<= 0 a2U8))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a2U7 a2U8)
                  (+ a2U5 a2U6))))
         (not
            (=
               (+ a2U8 a2U7)
               (+ a2U6 a2U5))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U7,a2U8],+ [a2U5,a2U6])
; (+ [a2U8,a2U7],+ [a2U6,a2U5])

(echo "givens-start-cycle-3")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
(declare-const a2U5 Int)
(declare-const a2U6 Int)
(declare-const a2U7 Int)
(declare-const a2U8 Int)
(assert
   (<= 0 a2U5))
(assert
   (<= 0 a2U6))
(assert
   (<= 0 a2U7))
(assert
   (<= 0 a2U8))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a2U7 a2U8)
                  (+ a2U5 a2U6))))
         (not
            (=
               (+ a2U8 a2U7)
               (+ a2U6 a2U5))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a2UT {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UP,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(declare-const a2UP Int)
(assert
   (<= 0 a2UP))
(assert
   (!
      (= a2UP 0)
      :named
      given-5.1))
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
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a2UT {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UP,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
(push 1)
(declare-const a2UP Int)
(assert
   (<= 0 a2UP))
(assert
   (!
      (= a2UP 0)
      :named
      given-5.1))
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
; [G] cobox_a2UX {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
(push 1)
(declare-const a2UQ Int)
(assert
   (<= 0 a2UQ))
(assert
   (!
      (= a2UQ 0)
      :named
      given-6.1))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a2UX {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
(push 1)
(declare-const a2UQ Int)
(assert
   (<= 0 a2UQ))
(assert
   (!
      (= a2UQ 0)
      :named
      given-6.1))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (a3cg,a2UP)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
(push 1)
(declare-const a2UP Int)
(declare-const a2V1 Int)
(declare-const a3cg Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a3cg))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-7.1))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-7.2))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(assert
   (! false :named wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (a3cg,a2UP)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
(push 1)
(declare-const a2UP Int)
(declare-const a2V1 Int)
(declare-const a3cg Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a3cg))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-7.1))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-7.2))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
(assert
   (! false :named wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-8.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-8.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-8.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-8.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cr} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; (- [a2V3,a2V1],- [a2UQ,a2UP])

(echo "givens-start-cycle-9")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-9.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-9.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
(assert
   (!
      (or
         false
         (not
            (=
               (- a2V3 a2V1)
               (- a2UQ a2UP))))
      :named
      wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-9.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-9.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a2Vk {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2Vi,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
(push 1)
(declare-const a2Vi Int)
(assert
   (<= 0 a2Vi))
(assert
   (!
      (= a2Vi 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a2Vk {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2Vi,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
(push 1)
(declare-const a2Vi Int)
(assert
   (<= 0 a2Vi))
(assert
   (!
      (= a2Vi 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3cz {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cA {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2Vq],a3cy)
; (a3cy,a2Vi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
(push 1)
(declare-const a2Vi Int)
(declare-const a2Vq Int)
(declare-const a3cy Int)
(assert
   (<= 0 a2Vi))
(assert
   (<= 0 a2Vq))
(assert
   (<= 0 a3cy))
(assert
   (!
      (=
         (+ 1 a2Vq)
         a3cy)
      :named
      given-11.1))
(assert
   (!
      (= a3cy a2Vi)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3cz {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cA {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2Vq],a3cy)
; (a3cy,a2Vi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
(push 1)
(declare-const a2Vi Int)
(declare-const a2Vq Int)
(declare-const a3cy Int)
(assert
   (<= 0 a2Vi))
(assert
   (<= 0 a2Vq))
(assert
   (<= 0 a3cy))
(assert
   (!
      (=
         (+ 1 a2Vq)
         a3cy)
      :named
      given-11.1))
(assert
   (!
      (= a3cy a2Vi)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a2VD {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VA,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
(push 1)
(declare-const a2VA Int)
(assert
   (<= 0 a2VA))
(assert
   (!
      (= a2VA 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a2VD {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VA,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
(push 1)
(declare-const a2VA Int)
(assert
   (<= 0 a2VA))
(assert
   (!
      (= a2VA 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3cF {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cG {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VH],a3cE)
; (a3cE,a2VA)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
(push 1)
(declare-const a2VA Int)
(declare-const a2VH Int)
(declare-const a3cE Int)
(assert
   (<= 0 a2VA))
(assert
   (<= 0 a2VH))
(assert
   (<= 0 a3cE))
(assert
   (!
      (=
         (+ 1 a2VH)
         a3cE)
      :named
      given-13.1))
(assert
   (!
      (= a3cE a2VA)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3cF {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cG {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VH],a3cE)
; (a3cE,a2VA)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
(push 1)
(declare-const a2VA Int)
(declare-const a2VH Int)
(declare-const a3cE Int)
(assert
   (<= 0 a2VA))
(assert
   (<= 0 a2VH))
(assert
   (<= 0 a3cE))
(assert
   (!
      (=
         (+ 1 a2VH)
         a3cE)
      :named
      given-13.1))
(assert
   (!
      (= a3cE a2VA)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a2VU {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
(push 1)
(declare-const a2VQ Int)
(assert
   (<= 0 a2VQ))
(assert
   (!
      (= a2VQ 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a2VU {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
(push 1)
(declare-const a2VQ Int)
(assert
   (<= 0 a2VQ))
(assert
   (!
      (= a2VQ 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-15.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-15.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cT} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; (+ [1,+ [a2VX,a2VS]],+ [a2VQ,a2VS])

(echo "givens-start-cycle-16")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-16.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
(declare-const a2VS Int)
(assert
   (<= 0 a2VS))
(assert
   (!
      (or
         false
         (not
            (=
               (+
                  1
                  (+ a2VX a2VS))
               (+ a2VQ a2VS))))
      :named
      wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-16")
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-16.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
(assert
   (! false :named wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (a3cU,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3cU Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-17.1))
(assert
   (!
      (= a3cU true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (a3cU,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3cU Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-17.1))
(assert
   (!
      (= a3cU true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-18.2))
(assert
   (!
      (= a3cU true)
      :named
      given-18.3))
(assert
   (!
      (= a3cX true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-18.2))
(assert
   (!
      (= a3cU true)
      :named
      given-18.3))
(assert
   (!
      (= a3cX true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3d3} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; (<? [a3ac,a3ae],True [])

(echo "givens-start-cycle-19")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-19.2))
(assert
   (!
      (= a3cU true)
      :named
      given-19.3))
(assert
   (!
      (= a3cX true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
(assert
   (!
      (or
         false
         (not
            (=
               (< a3ac a3ae)
               true)))
      :named
      wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-19")
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-19.2))
(assert
   (!
      (= a3cU true)
      :named
      given-19.3))
(assert
   (!
      (= a3cX true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
(assert
   (! false :named wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-20.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-20.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3au} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; (a3ao,a3ap)

(echo "givens-start-cycle-21")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-21.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
(assert
   (!
      (or
         false
         (not
            (= a3ao a3ap)))
      :named
      wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-21")
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-21.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
(assert
   (! false :named wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3db} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ax,a3ay],+ [a3ay,a3ax])

(echo "givens-start-cycle-22")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
(declare-const a3ax Int)
(declare-const a3ay Int)
(assert
   (<= 0 a3ax))
(assert
   (<= 0 a3ay))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3ax a3ay)
               (+ a3ay a3ax))))
      :named
      wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-22")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
(assert
   (! false :named wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3dj} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3aF,1],+ [1,a3aF])

(echo "givens-start-cycle-23")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
(declare-const a3aF Int)
(assert
   (<= 0 a3aF))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3aF 1)
               (+ 1 a3aF))))
      :named
      wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-23")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
(assert
   (! false :named wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3aX {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3aQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
(push 1)
(declare-const a3aQ Int)
(assert
   (<= 0 a3aQ))
(assert
   (!
      (= a3aQ 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3aX {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3aQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
(push 1)
(declare-const a3aQ Int)
(assert
   (<= 0 a3aQ))
(assert
   (!
      (= a3aQ 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3dp {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3dq {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3b0],a3do)
; (a3do,a3aQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
(push 1)
(declare-const a3aQ Int)
(declare-const a3b0 Int)
(declare-const a3do Int)
(assert
   (<= 0 a3aQ))
(assert
   (<= 0 a3b0))
(assert
   (<= 0 a3do))
(assert
   (!
      (=
         (+ 1 a3b0)
         a3do)
      :named
      given-26.1))
(assert
   (!
      (= a3do a3aQ)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3dp {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3dq {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3b0],a3do)
; (a3do,a3aQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
(push 1)
(declare-const a3aQ Int)
(declare-const a3b0 Int)
(declare-const a3do Int)
(assert
   (<= 0 a3aQ))
(assert
   (<= 0 a3b0))
(assert
   (<= 0 a3do))
(assert
   (!
      (=
         (+ 1 a3b0)
         a3do)
      :named
      given-26.1))
(assert
   (!
      (= a3do a3aQ)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(exit)
(exit)
; Test suite rows: RUNNING...
; Test suite rows: PASS