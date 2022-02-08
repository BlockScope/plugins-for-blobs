; Compiling FiniteMaps
; Compiling FiniteMaps
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1bF} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1b9,LiftedRep [])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a1bF} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1b9
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
;      [WD] hole{co_a1bF} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1b9
;    (lit "63A"))

; WANTEDS (names)
;  a1b9  <=  t_a1b9
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1b9 Type)
(declare-const a1b9 Type)
(assert
   (!
      (not
         (=
            a1b9
            (lit "63A")))
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
;            a1b9
;            (lit "63A"))))
;   (define-fun
;      a1b9
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1bF} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1b9,LiftedRep [])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a1bF} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1b9
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
;      [WD] hole{co_a1bF} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1b9
;    (lit "63A"))

; WANTEDS (names)
;  a1b9  <=  t_a1b9
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1b9 Type)
(declare-const a1b9 Type)
(assert
   (!
      (not
         (=
            a1b9
            (lit "63A")))
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
;            a1b9
;            (lit "63A"))))
;   (define-fun
;      a1b9
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] co_a1n2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1mV {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1n9 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1mO {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1n3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1mP {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1mW {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1na {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1ns} {3}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1nE} {3}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1mj,a1mk,a1mm,a1mo],a1n1)
; (IntersectL [a1mj,a1mk,a1mn,a1mo],a1mU)
; (IntersectL [a1mj,a1mk,a1ml,a1mq],a1n8)
; (IntersectL [a1mj,a1mk,a1ml,a1mm],a1mN)
; (a1n1,a1mq)
; (a1mN,a1mn)
; (a1mU,a1mp)
; (a1n8,a1mr)

; WANTEDS (Thoralf style)
; (IntersectL [a1mj,a1mk,IntersectL [a1mj,a1mk,a1my,a1mz],a1mB],a1mp)
; (IntersectL [a1mj,a1mk,a1my,IntersectL [a1mj,a1mk,a1mz,a1mB]],a1mr)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1ns} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nE} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; GIVENS (names)
;  a1ml  <=  a
;  a1mm  <=  b
;  a1mn  <=  ab
;  a1mo  <=  c
;  a1mp  <=  abc
;  a1mq  <=  bc
;  a1mr  <=  abc'
;  a1mN  <=  fsk_a1mN
;  a1mU  <=  fsk_a1mU
;  a1n1  <=  fsk_a1n1
;  a1n8  <=  fsk_a1n8
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1mk)) (y (Maybe Sorta1mk))) (=> (and ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) x) ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) y)) (= (both8563735787106086637 x y) x))))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 y (as nothing (Maybe Sorta1mk))) (as nothing (Maybe Sorta1mk)))))
; (declare-const a1mN (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mU (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1ml (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mm (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mn (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mo (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mp (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mq (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mr (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n1 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n8 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-fun both8563735787106086637 ((Maybe Sorta1mk) (Maybe Sorta1mk)) (Maybe Sorta1mk))
; (declare-sort Sorta1mj)
; (declare-sort Sorta1mk)
(declare-sort Sorta1mj)
(declare-sort Sorta1mk)
(declare-const
   a1ml
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mm
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mn
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mo
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mp
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mq
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mr
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mN
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mU
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n1
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n8
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-fun
   both8563735787106086637
   (
     (Maybe Sorta1mk)
     (Maybe Sorta1mk))
   (Maybe Sorta1mk))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637
            y
            (as
               nothing
               (Maybe Sorta1mk)))
         (as
            nothing
            (Maybe Sorta1mk)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1mk))
        (y
           (Maybe Sorta1mk)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              y))
         (=
            (both8563735787106086637 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mm
           a1mo)
         a1n1)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mn
           a1mo)
         a1mU)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mq)
         a1n8)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mm)
         a1mN)
      :named
      given-3.4))
(assert
   (!
      (= a1n1 a1mq)
      :named
      given-3.5))
(assert
   (!
      (= a1mN a1mn)
      :named
      given-3.6))
(assert
   (!
      (= a1mU a1mp)
      :named
      given-3.7))
(assert
   (!
      (= a1n8 a1mr)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1ns} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nE} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; WANTEDS (names)
;  a1mp  <=  abc
;  a1mr  <=  abc'
;  a1my  <=  a_a1my
;  a1mz  <=  b_a1mz
;  a1mB  <=  c_a1mB
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1mB (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1my (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mz (Array Sorta1mj (Maybe Sorta1mk)))
(declare-const
   a1my
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mz
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mB
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 (
                   (_ map both8563735787106086637)
                   a1my
                   a1mz)
                 a1mB)
               a1mp))
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 a1my
                 (
                   (_ map both8563735787106086637)
                   a1mz
                   a1mB))
               a1mr)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta1mk!val!0
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!1
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!2
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!4
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!3
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!5
;      ()
;      Sorta1mk)
;   (forall
;      (
;        (x Sorta1mk))
;      (or
;         (= x Sorta1mk!val!0)
;         (= x Sorta1mk!val!1)
;         (= x Sorta1mk!val!2)
;         (= x Sorta1mk!val!4)
;         (= x Sorta1mk!val!3)
;         (= x Sorta1mk!val!5)))
;   (declare-fun
;      Sorta1mj!val!0
;      ()
;      Sorta1mj)
;   (forall
;      (
;        (x Sorta1mj))
;      (= x Sorta1mj!val!0))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mm
;           a1mo)
;         a1n1))
;   (define-fun
;      a1n1
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mm)
;         a1mN))
;   (define-fun
;      a1mo
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1mU
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1n8
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a1n8 a1mr))
;   (define-fun
;      a1mN
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1mz
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!1))
;         Sorta1mj!val!0
;         (just Sorta1mk!val!3)))
;   (define-fun
;      a1mB
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mm
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mq)
;         a1n8))
;   (define-fun
;      a1mp
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a1mN a1mn))
;   (define-fun
;      a1mq
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a1mU a1mp))
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map both8563735787106086637)
;                      (
;                        (_ map both8563735787106086637)
;                        a1my
;                        a1mz)
;                      a1mB)
;                    a1mp)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8563735787106086637)
;                      a1my
;                      (
;                        (_ map both8563735787106086637)
;                        a1mz
;                        a1mB))
;                    a1mr))))
;         (or a!1 a!2)))
;   (define-fun
;      a1mn
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1mr
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1my
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!0))
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      a1ml
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!5))
;         Sorta1mj!val!0
;         nothing))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mn
;           a1mo)
;         a1mU))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a1n1 a1mq))
;   (define-fun
;      both8563735787106086637
;      (
;        (x!0
;           (Maybe Sorta1mk))
;        (x!1
;           (Maybe Sorta1mk)))
;      (Maybe Sorta1mk)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1mk!val!5))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1mk!val!0))
;               (=
;                  x!1
;                  (just Sorta1mk!val!1)))
;            (just Sorta1mk!val!0)
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1mk!val!1))
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1mk!val!0))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta1mk!val!3))
;                        (=
;                           x!1
;                           (just Sorta1mk!val!2)))
;                     (just Sorta1mk!val!3)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1mk!val!4))
;                           (=
;                              x!1
;                              (just Sorta1mk!val!3)))
;                        (just Sorta1mk!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (= x!1 nothing))
;                           nothing
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1mk!val!4))
;                                 (=
;                                    x!1
;                                    (just Sorta1mk!val!2)))
;                              (just Sorta1mk!val!4)
;                              (ite
;                                 (and
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    (
;                                      (_ is just)
;                                      x!1))
;                                 x!0
;                                 nothing)))))))))))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] co_a1n2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1mV {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1n9 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1mO {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1n3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1mP {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1mW {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1na {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1ns} {3}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1nE} {3}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1mj,a1mk,a1mm,a1mo],a1n1)
; (IntersectL [a1mj,a1mk,a1mn,a1mo],a1mU)
; (IntersectL [a1mj,a1mk,a1ml,a1mq],a1n8)
; (IntersectL [a1mj,a1mk,a1ml,a1mm],a1mN)
; (a1n1,a1mq)
; (a1mN,a1mn)
; (a1mU,a1mp)
; (a1n8,a1mr)

; WANTEDS (Thoralf style)
; (IntersectL [a1mj,a1mk,IntersectL [a1mj,a1mk,a1my,a1mz],a1mB],a1mp)
; (IntersectL [a1mj,a1mk,a1my,IntersectL [a1mj,a1mk,a1mz,a1mB]],a1mr)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1ns} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nE} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; GIVENS (names)
;  a1ml  <=  a
;  a1mm  <=  b
;  a1mn  <=  ab
;  a1mo  <=  c
;  a1mp  <=  abc
;  a1mq  <=  bc
;  a1mr  <=  abc'
;  a1mN  <=  fsk_a1mN
;  a1mU  <=  fsk_a1mU
;  a1n1  <=  fsk_a1n1
;  a1n8  <=  fsk_a1n8
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1mk)) (y (Maybe Sorta1mk))) (=> (and ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) x) ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) y)) (= (both8563735787106086637 x y) x))))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 y (as nothing (Maybe Sorta1mk))) (as nothing (Maybe Sorta1mk)))))
; (declare-const a1mN (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mU (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1ml (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mm (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mn (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mo (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mp (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mq (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mr (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n1 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n8 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-fun both8563735787106086637 ((Maybe Sorta1mk) (Maybe Sorta1mk)) (Maybe Sorta1mk))
; (declare-sort Sorta1mj)
; (declare-sort Sorta1mk)
(declare-sort Sorta1mj)
(declare-sort Sorta1mk)
(declare-const
   a1ml
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mm
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mn
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mo
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mp
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mq
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mr
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mN
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mU
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n1
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n8
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-fun
   both8563735787106086637
   (
     (Maybe Sorta1mk)
     (Maybe Sorta1mk))
   (Maybe Sorta1mk))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637
            y
            (as
               nothing
               (Maybe Sorta1mk)))
         (as
            nothing
            (Maybe Sorta1mk)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1mk))
        (y
           (Maybe Sorta1mk)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              y))
         (=
            (both8563735787106086637 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mm
           a1mo)
         a1n1)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mn
           a1mo)
         a1mU)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mq)
         a1n8)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mm)
         a1mN)
      :named
      given-3.4))
(assert
   (!
      (= a1n1 a1mq)
      :named
      given-3.5))
(assert
   (!
      (= a1mN a1mn)
      :named
      given-3.6))
(assert
   (!
      (= a1mU a1mp)
      :named
      given-3.7))
(assert
   (!
      (= a1n8 a1mr)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1ns} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nE} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; WANTEDS (names)
;  a1mp  <=  abc
;  a1mr  <=  abc'
;  a1my  <=  a_a1my
;  a1mz  <=  b_a1mz
;  a1mB  <=  c_a1mB
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1mB (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1my (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mz (Array Sorta1mj (Maybe Sorta1mk)))
(declare-const
   a1my
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mz
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mB
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 (
                   (_ map both8563735787106086637)
                   a1my
                   a1mz)
                 a1mB)
               a1mp))
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 a1my
                 (
                   (_ map both8563735787106086637)
                   a1mz
                   a1mB))
               a1mr)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta1mk!val!0
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!1
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!2
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!4
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!3
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!5
;      ()
;      Sorta1mk)
;   (forall
;      (
;        (x Sorta1mk))
;      (or
;         (= x Sorta1mk!val!0)
;         (= x Sorta1mk!val!1)
;         (= x Sorta1mk!val!2)
;         (= x Sorta1mk!val!4)
;         (= x Sorta1mk!val!3)
;         (= x Sorta1mk!val!5)))
;   (declare-fun
;      Sorta1mj!val!0
;      ()
;      Sorta1mj)
;   (forall
;      (
;        (x Sorta1mj))
;      (= x Sorta1mj!val!0))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mm
;           a1mo)
;         a1n1))
;   (define-fun
;      a1n1
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mm)
;         a1mN))
;   (define-fun
;      a1mo
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1mU
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1n8
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a1n8 a1mr))
;   (define-fun
;      a1mN
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1mz
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!1))
;         Sorta1mj!val!0
;         (just Sorta1mk!val!3)))
;   (define-fun
;      a1mB
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mm
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mq)
;         a1n8))
;   (define-fun
;      a1mp
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a1mN a1mn))
;   (define-fun
;      a1mq
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a1mU a1mp))
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map both8563735787106086637)
;                      (
;                        (_ map both8563735787106086637)
;                        a1my
;                        a1mz)
;                      a1mB)
;                    a1mp)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8563735787106086637)
;                      a1my
;                      (
;                        (_ map both8563735787106086637)
;                        a1mz
;                        a1mB))
;                    a1mr))))
;         (or a!1 a!2)))
;   (define-fun
;      a1mn
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1mr
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      a1my
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!0))
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      a1ml
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!5))
;         Sorta1mj!val!0
;         nothing))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mn
;           a1mo)
;         a1mU))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a1n1 a1mq))
;   (define-fun
;      both8563735787106086637
;      (
;        (x!0
;           (Maybe Sorta1mk))
;        (x!1
;           (Maybe Sorta1mk)))
;      (Maybe Sorta1mk)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1mk!val!5))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1mk!val!0))
;               (=
;                  x!1
;                  (just Sorta1mk!val!1)))
;            (just Sorta1mk!val!0)
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1mk!val!1))
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1mk!val!0))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta1mk!val!3))
;                        (=
;                           x!1
;                           (just Sorta1mk!val!2)))
;                     (just Sorta1mk!val!3)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1mk!val!4))
;                           (=
;                              x!1
;                              (just Sorta1mk!val!3)))
;                        (just Sorta1mk!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (= x!1 nothing))
;                           nothing
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1mk!val!4))
;                                 (=
;                                    x!1
;                                    (just Sorta1mk!val!2)))
;                              (just Sorta1mk!val!4)
;                              (ite
;                                 (and
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    (
;                                      (_ is just)
;                                      x!1))
;                                 x!0
;                                 nothing)))))))))))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_a1n2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1mV {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1n9 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1mO {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1n3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1mP {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1mW {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1na {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1nJ} {4}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1nO} {4}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1mj,a1mk,a1mm,a1mo],a1n1)
; (IntersectL [a1mj,a1mk,a1mn,a1mo],a1mU)
; (IntersectL [a1mj,a1mk,a1ml,a1mq],a1n8)
; (IntersectL [a1mj,a1mk,a1ml,a1mm],a1mN)
; (a1n1,a1mq)
; (a1mN,a1mn)
; (a1mU,a1mp)
; (a1n8,a1mr)

; WANTEDS (Thoralf style)
; (IntersectL [a1mj,a1mk,IntersectL [a1mj,a1mk,a1my,a1mz],a1mB],a1mp)
; (IntersectL [a1mj,a1mk,a1my,IntersectL [a1mj,a1mk,a1mz,a1mB]],a1mr)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a1nJ} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nO} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; GIVENS (names)
;  a1ml  <=  a
;  a1mm  <=  b
;  a1mn  <=  ab
;  a1mo  <=  c
;  a1mp  <=  abc
;  a1mq  <=  bc
;  a1mr  <=  abc'
;  a1mN  <=  fsk_a1mN
;  a1mU  <=  fsk_a1mU
;  a1n1  <=  fsk_a1n1
;  a1n8  <=  fsk_a1n8
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1mk)) (y (Maybe Sorta1mk))) (=> (and ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) x) ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) y)) (= (both8563735787106086637 x y) x))))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 y (as nothing (Maybe Sorta1mk))) (as nothing (Maybe Sorta1mk)))))
; (declare-const a1mN (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mU (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1ml (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mm (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mn (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mo (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mp (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mq (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mr (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n1 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n8 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-fun both8563735787106086637 ((Maybe Sorta1mk) (Maybe Sorta1mk)) (Maybe Sorta1mk))
; (declare-sort Sorta1mj)
; (declare-sort Sorta1mk)
; DECS1 (unseen) 
(declare-sort Sorta1mj)
(declare-sort Sorta1mk)
(declare-const
   a1ml
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mm
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mn
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mo
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mp
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mq
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mr
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mN
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mU
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n1
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n8
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-fun
   both8563735787106086637
   (
     (Maybe Sorta1mk)
     (Maybe Sorta1mk))
   (Maybe Sorta1mk))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637
            y
            (as
               nothing
               (Maybe Sorta1mk)))
         (as
            nothing
            (Maybe Sorta1mk)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1mk))
        (y
           (Maybe Sorta1mk)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              y))
         (=
            (both8563735787106086637 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mm
           a1mo)
         a1n1)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mn
           a1mo)
         a1mU)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mq)
         a1n8)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mm)
         a1mN)
      :named
      given-4.4))
(assert
   (!
      (= a1n1 a1mq)
      :named
      given-4.5))
(assert
   (!
      (= a1mN a1mn)
      :named
      given-4.6))
(assert
   (!
      (= a1mU a1mp)
      :named
      given-4.7))
(assert
   (!
      (= a1n8 a1mr)
      :named
      given-4.8))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a1nJ} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nO} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; WANTEDS (names)
;  a1mp  <=  abc
;  a1mr  <=  abc'
;  a1my  <=  a_a1my
;  a1mz  <=  b_a1mz
;  a1mB  <=  c_a1mB
; DECS2 (seen) 
; (declare-const a1mB (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1my (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mz (Array Sorta1mj (Maybe Sorta1mk)))
; DECS2 (unseen) 
(declare-const
   a1my
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mz
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mB
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 (
                   (_ map both8563735787106086637)
                   a1my
                   a1mz)
                 a1mB)
               a1mp))
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 a1my
                 (
                   (_ map both8563735787106086637)
                   a1mz
                   a1mB))
               a1mr)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (declare-fun
;      Sorta1mk!val!0
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!1
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!2
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!4
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!3
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!5
;      ()
;      Sorta1mk)
;   (forall
;      (
;        (x Sorta1mk))
;      (or
;         (= x Sorta1mk!val!0)
;         (= x Sorta1mk!val!1)
;         (= x Sorta1mk!val!2)
;         (= x Sorta1mk!val!4)
;         (= x Sorta1mk!val!3)
;         (= x Sorta1mk!val!5)))
;   (declare-fun
;      Sorta1mj!val!0
;      ()
;      Sorta1mj)
;   (forall
;      (
;        (x Sorta1mj))
;      (= x Sorta1mj!val!0))
;   (define-fun
;      given-4.6
;      ()
;      Bool
;      (= a1mN a1mn))
;   (define-fun
;      a1n8
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mN
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mo
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!3)))
;   (define-fun
;      a1mU
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mz
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!1))
;         Sorta1mj!val!0
;         nothing))
;   (define-fun
;      given-4.7
;      ()
;      Bool
;      (= a1mU a1mp))
;   (define-fun
;      a1mB
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= a1n8 a1mr))
;   (define-fun
;      a1mm
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mn
;           a1mo)
;         a1mU))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mm)
;         a1mN))
;   (define-fun
;      given-4.5
;      ()
;      Bool
;      (= a1n1 a1mq))
;   (define-fun
;      a1mp
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mm
;           a1mo)
;         a1n1))
;   (define-fun
;      a1mq
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      a1mn
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mr
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1my
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!0))
;         Sorta1mj!val!0
;         nothing))
;   (define-fun
;      a1ml
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!5))
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
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
;                      (_ map both8563735787106086637)
;                      (
;                        (_ map both8563735787106086637)
;                        a1my
;                        a1mz)
;                      a1mB)
;                    a1mp)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8563735787106086637)
;                      a1my
;                      (
;                        (_ map both8563735787106086637)
;                        a1mz
;                        a1mB))
;                    a1mr))))
;         (or a!1 a!2)))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mq)
;         a1n8))
;   (define-fun
;      a1n1
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      both8563735787106086637
;      (
;        (x!0
;           (Maybe Sorta1mk))
;        (x!1
;           (Maybe Sorta1mk)))
;      (Maybe Sorta1mk)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1mk!val!5))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1mk!val!0))
;               (=
;                  x!1
;                  (just Sorta1mk!val!1)))
;            (just Sorta1mk!val!0)
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1mk!val!1))
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1mk!val!0))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1mk!val!2))
;                           (=
;                              x!1
;                              (just Sorta1mk!val!3)))
;                        (just Sorta1mk!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1mk!val!4))
;                              (=
;                                 x!1
;                                 (just Sorta1mk!val!3)))
;                           (just Sorta1mk!val!4)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1mk!val!2))
;                                 (=
;                                    x!1
;                                    (just Sorta1mk!val!4)))
;                              (just Sorta1mk!val!2)
;                              (ite
;                                 (and
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    (
;                                      (_ is just)
;                                      x!1))
;                                 x!0
;                                 nothing)))))))))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_a1n2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1mV {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1n9 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1mO {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1n3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1mP {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1mW {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1na {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1nJ} {4}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1nO} {4}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1mj,a1mk,a1mm,a1mo],a1n1)
; (IntersectL [a1mj,a1mk,a1mn,a1mo],a1mU)
; (IntersectL [a1mj,a1mk,a1ml,a1mq],a1n8)
; (IntersectL [a1mj,a1mk,a1ml,a1mm],a1mN)
; (a1n1,a1mq)
; (a1mN,a1mn)
; (a1mU,a1mp)
; (a1n8,a1mr)

; WANTEDS (Thoralf style)
; (IntersectL [a1mj,a1mk,IntersectL [a1mj,a1mk,a1my,a1mz],a1mB],a1mp)
; (IntersectL [a1mj,a1mk,a1my,IntersectL [a1mj,a1mk,a1mz,a1mB]],a1mr)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a1nJ} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nO} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; GIVENS (names)
;  a1ml  <=  a
;  a1mm  <=  b
;  a1mn  <=  ab
;  a1mo  <=  c
;  a1mp  <=  abc
;  a1mq  <=  bc
;  a1mr  <=  abc'
;  a1mN  <=  fsk_a1mN
;  a1mU  <=  fsk_a1mU
;  a1n1  <=  fsk_a1n1
;  a1n8  <=  fsk_a1n8
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1mk)) (y (Maybe Sorta1mk))) (=> (and ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) x) ((_ is (just (Sorta1mk) (Maybe Sorta1mk))) y)) (= (both8563735787106086637 x y) x))))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1mk))) (= (both8563735787106086637 y (as nothing (Maybe Sorta1mk))) (as nothing (Maybe Sorta1mk)))))
; (declare-const a1mN (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mU (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1ml (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mm (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mn (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mo (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mp (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mq (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mr (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n1 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1n8 (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-fun both8563735787106086637 ((Maybe Sorta1mk) (Maybe Sorta1mk)) (Maybe Sorta1mk))
; (declare-sort Sorta1mj)
; (declare-sort Sorta1mk)
; DECS1 (unseen) 
(declare-sort Sorta1mj)
(declare-sort Sorta1mk)
(declare-const
   a1ml
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mm
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mn
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mo
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mp
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mq
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mr
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mN
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mU
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n1
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1n8
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-fun
   both8563735787106086637
   (
     (Maybe Sorta1mk)
     (Maybe Sorta1mk))
   (Maybe Sorta1mk))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637
            y
            (as
               nothing
               (Maybe Sorta1mk)))
         (as
            nothing
            (Maybe Sorta1mk)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1mk)))
      (=
         (both8563735787106086637 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1mk))
        (y
           (Maybe Sorta1mk)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1mk)
                    (Maybe Sorta1mk)))
              y))
         (=
            (both8563735787106086637 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mm
           a1mo)
         a1n1)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1mn
           a1mo)
         a1mU)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mq)
         a1n8)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map both8563735787106086637)
           a1ml
           a1mm)
         a1mN)
      :named
      given-4.4))
(assert
   (!
      (= a1n1 a1mq)
      :named
      given-4.5))
(assert
   (!
      (= a1mN a1mn)
      :named
      given-4.6))
(assert
   (!
      (= a1mU a1mp)
      :named
      given-4.7))
(assert
   (!
      (= a1n8 a1mr)
      :named
      given-4.8))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a1nJ} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      (
;        (_ map both8563735787106086637)
;        a1my
;        a1mz)
;      a1mB)
;    a1mp)

;      [WD] hole{co_a1nO} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8563735787106086637)
;      a1my
;      (
;        (_ map both8563735787106086637)
;        a1mz
;        a1mB))
;    a1mr)

; WANTEDS (names)
;  a1mp  <=  abc
;  a1mr  <=  abc'
;  a1my  <=  a_a1my
;  a1mz  <=  b_a1mz
;  a1mB  <=  c_a1mB
; DECS2 (seen) 
; (declare-const a1mB (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1my (Array Sorta1mj (Maybe Sorta1mk)))
; (declare-const a1mz (Array Sorta1mj (Maybe Sorta1mk)))
; DECS2 (unseen) 
(declare-const
   a1my
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mz
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(declare-const
   a1mB
   (Array
      Sorta1mj
      (Maybe Sorta1mk)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 (
                   (_ map both8563735787106086637)
                   a1my
                   a1mz)
                 a1mB)
               a1mp))
         (not
            (=
               (
                 (_ map both8563735787106086637)
                 a1my
                 (
                   (_ map both8563735787106086637)
                   a1mz
                   a1mB))
               a1mr)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (declare-fun
;      Sorta1mk!val!0
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!1
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!2
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!4
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!3
;      ()
;      Sorta1mk)
;   (declare-fun
;      Sorta1mk!val!5
;      ()
;      Sorta1mk)
;   (forall
;      (
;        (x Sorta1mk))
;      (or
;         (= x Sorta1mk!val!0)
;         (= x Sorta1mk!val!1)
;         (= x Sorta1mk!val!2)
;         (= x Sorta1mk!val!4)
;         (= x Sorta1mk!val!3)
;         (= x Sorta1mk!val!5)))
;   (declare-fun
;      Sorta1mj!val!0
;      ()
;      Sorta1mj)
;   (forall
;      (
;        (x Sorta1mj))
;      (= x Sorta1mj!val!0))
;   (define-fun
;      given-4.6
;      ()
;      Bool
;      (= a1mN a1mn))
;   (define-fun
;      a1n8
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mN
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mo
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!3)))
;   (define-fun
;      a1mU
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mz
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!1))
;         Sorta1mj!val!0
;         nothing))
;   (define-fun
;      given-4.7
;      ()
;      Bool
;      (= a1mU a1mp))
;   (define-fun
;      a1mB
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (
;        (as
;           const
;           (Array
;              Sorta1mj
;              (Maybe Sorta1mk)))
;        nothing))
;   (define-fun
;      given-4.8
;      ()
;      Bool
;      (= a1n8 a1mr))
;   (define-fun
;      a1mm
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mn
;           a1mo)
;         a1mU))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mm)
;         a1mN))
;   (define-fun
;      given-4.5
;      ()
;      Bool
;      (= a1n1 a1mq))
;   (define-fun
;      a1mp
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1mm
;           a1mo)
;         a1n1))
;   (define-fun
;      a1mq
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      a1mn
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1mr
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
;   (define-fun
;      a1my
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!0))
;         Sorta1mj!val!0
;         nothing))
;   (define-fun
;      a1ml
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           (just Sorta1mk!val!5))
;         Sorta1mj!val!0
;         (just Sorta1mk!val!2)))
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
;                      (_ map both8563735787106086637)
;                      (
;                        (_ map both8563735787106086637)
;                        a1my
;                        a1mz)
;                      a1mB)
;                    a1mp)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8563735787106086637)
;                      a1my
;                      (
;                        (_ map both8563735787106086637)
;                        a1mz
;                        a1mB))
;                    a1mr))))
;         (or a!1 a!2)))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8563735787106086637)
;           a1ml
;           a1mq)
;         a1n8))
;   (define-fun
;      a1n1
;      ()
;      (Array
;         Sorta1mj
;         (Maybe Sorta1mk))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1mj
;                 (Maybe Sorta1mk)))
;           nothing)
;         Sorta1mj!val!0
;         (just Sorta1mk!val!4)))
;   (define-fun
;      both8563735787106086637
;      (
;        (x!0
;           (Maybe Sorta1mk))
;        (x!1
;           (Maybe Sorta1mk)))
;      (Maybe Sorta1mk)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1mk!val!5))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1mk!val!0))
;               (=
;                  x!1
;                  (just Sorta1mk!val!1)))
;            (just Sorta1mk!val!0)
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1mk!val!1))
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1mk!val!0))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1mk!val!2))
;                           (=
;                              x!1
;                              (just Sorta1mk!val!3)))
;                        (just Sorta1mk!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1mk!val!4))
;                              (=
;                                 x!1
;                                 (just Sorta1mk!val!3)))
;                           (just Sorta1mk!val!4)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1mk!val!2))
;                                 (=
;                                    x!1
;                                    (just Sorta1mk!val!4)))
;                              (just Sorta1mk!val!2)
;                              (ite
;                                 (and
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    (
;                                      (_ is just)
;                                      x!1))
;                                 x!0
;                                 nothing)))))))))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1og} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1nP,LiftedRep [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1og} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1nP
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1og} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1nP
;    (lit "63A"))

; WANTEDS (names)
;  a1nP  <=  t_a1nP
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1nP Type)
(declare-const a1nP Type)
(assert
   (!
      (not
         (=
            a1nP
            (lit "63A")))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (define-fun
;      wanted-5
;      ()
;      Bool
;      (not
;         (=
;            a1nP
;            (lit "63A"))))
;   (define-fun
;      a1nP
;      ()
;      Type
;      (lit "6")))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1og} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1nP,LiftedRep [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1og} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1nP
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1og} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1nP
;    (lit "63A"))

; WANTEDS (names)
;  a1nP  <=  t_a1nP
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1nP Type)
(declare-const a1nP Type)
(assert
   (!
      (not
         (=
            a1nP
            (lit "63A")))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (define-fun
;      wanted-5
;      ()
;      Bool
;      (not
;         (=
;            a1nP
;            (lit "63A"))))
;   (define-fun
;      a1nP
;      ()
;      Type
;      (lit "6")))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_a1p5 {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1oY {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1pc {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1oR {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1p6 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1oS {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1oZ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1pd {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1pr} {3}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1pD} {3}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1om,a1on,a1op,a1or],a1p4)
; (UnionL [a1om,a1on,a1oq,a1or],a1oX)
; (UnionL [a1om,a1on,a1oo,a1ot],a1pb)
; (UnionL [a1om,a1on,a1oo,a1op],a1oQ)
; (a1p4,a1ot)
; (a1oQ,a1oq)
; (a1oX,a1os)
; (a1pb,a1ou)

; WANTEDS (Thoralf style)
; (UnionL [a1om,a1on,UnionL [a1om,a1on,a1oB,a1oC],a1oE],a1os)
; (UnionL [a1om,a1on,a1oB,UnionL [a1om,a1on,a1oC,a1oE]],a1ou)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a1pr} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pD} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; GIVENS (names)
;  a1oo  <=  a
;  a1op  <=  b
;  a1oq  <=  ab
;  a1or  <=  c
;  a1os  <=  abc
;  a1ot  <=  bc
;  a1ou  <=  abc'
;  a1oQ  <=  fsk_a1oQ
;  a1oX  <=  fsk_a1oX
;  a1p4  <=  fsk_a1p4
;  a1pb  <=  fsk_a1pb
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1on)) (y (Maybe Sorta1on))) (=> ((_ is (just (Sorta1on) (Maybe Sorta1on))) x) (= (either8565735798757423996 x y) x))))
; (assert (forall ((y (Maybe Sorta1on))) (= (either8565735798757423996 (as nothing (Maybe Sorta1on)) y) y)))
; (declare-const a1oQ (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oX (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oo (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1op (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oq (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1or (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1os (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ot (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ou (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1p4 (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1pb (Array Sorta1om (Maybe Sorta1on)))
; (declare-fun either8565735798757423996 ((Maybe Sorta1on) (Maybe Sorta1on)) (Maybe Sorta1on))
; (declare-sort Sorta1om)
; (declare-sort Sorta1on)
(declare-sort Sorta1om)
(declare-sort Sorta1on)
(declare-const
   a1oo
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1op
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oq
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1or
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1os
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ot
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ou
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oQ
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oX
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1p4
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1pb
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-fun
   either8565735798757423996
   (
     (Maybe Sorta1on)
     (Maybe Sorta1on))
   (Maybe Sorta1on))
(assert
   (forall
      (
        (y
           (Maybe Sorta1on)))
      (=
         (either8565735798757423996
            (as
               nothing
               (Maybe Sorta1on))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1on))
        (y
           (Maybe Sorta1on)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1on)
                 (Maybe Sorta1on)))
           x)
         (=
            (either8565735798757423996 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1op
           a1or)
         a1p4)
      :named
      given-7.1))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oq
           a1or)
         a1oX)
      :named
      given-7.2))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1ot)
         a1pb)
      :named
      given-7.3))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1op)
         a1oQ)
      :named
      given-7.4))
(assert
   (!
      (= a1p4 a1ot)
      :named
      given-7.5))
(assert
   (!
      (= a1oQ a1oq)
      :named
      given-7.6))
(assert
   (!
      (= a1oX a1os)
      :named
      given-7.7))
(assert
   (!
      (= a1pb a1ou)
      :named
      given-7.8))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a1pr} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pD} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; WANTEDS (names)
;  a1os  <=  abc
;  a1ou  <=  abc'
;  a1oB  <=  a_a1oB
;  a1oC  <=  b_a1oC
;  a1oE  <=  c_a1oE
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1oB (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oC (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oE (Array Sorta1om (Maybe Sorta1on)))
(declare-const
   a1oB
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oC
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oE
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 (
                   (_ map either8565735798757423996)
                   a1oB
                   a1oC)
                 a1oE)
               a1os))
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 a1oB
                 (
                   (_ map either8565735798757423996)
                   a1oC
                   a1oE))
               a1ou)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (declare-fun
;      Sorta1om!val!1
;      ()
;      Sorta1om)
;   (declare-fun
;      Sorta1om!val!0
;      ()
;      Sorta1om)
;   (forall
;      (
;        (x Sorta1om))
;      (or
;         (= x Sorta1om!val!1)
;         (= x Sorta1om!val!0)))
;   (declare-fun
;      Sorta1on!val!5
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!3
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!0
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!1
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!4
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!2
;      ()
;      Sorta1on)
;   (forall
;      (
;        (x Sorta1on))
;      (or
;         (= x Sorta1on!val!5)
;         (= x Sorta1on!val!3)
;         (= x Sorta1on!val!0)
;         (= x Sorta1on!val!1)
;         (= x Sorta1on!val!4)
;         (= x Sorta1on!val!2)))
;   (define-fun
;      wanted-7
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      (
;                        (_ map either8565735798757423996)
;                        a1oB
;                        a1oC)
;                      a1oE)
;                    a1os)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      a1oB
;                      (
;                        (_ map either8565735798757423996)
;                        a1oC
;                        a1oE))
;                    a1ou))))
;         (or a!1 a!2)))
;   (define-fun
;      given-7.6
;      ()
;      Bool
;      (= a1oQ a1oq))
;   (define-fun
;      a1pb
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1or
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              nothing)
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1ot
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!5)))
;   (define-fun
;      given-7.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1op)
;         a1oQ))
;   (define-fun
;      a1oq
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            nothing)
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      given-7.7
;      ()
;      Bool
;      (= a1oX a1os))
;   (define-fun
;      a1p4
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!5)))
;   (define-fun
;      a1op
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            nothing)
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      a1os
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-7.5
;      ()
;      Bool
;      (= a1p4 a1ot))
;   (define-fun
;      given-7.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1ot)
;         a1pb))
;   (define-fun
;      a1oB
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oQ
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            nothing)
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      a1oo
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      given-7.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oq
;           a1or)
;         a1oX))
;   (define-fun
;      a1oX
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1oC
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      given-7.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1op
;           a1or)
;         a1p4))
;   (define-fun
;      given-7.8
;      ()
;      Bool
;      (= a1pb a1ou))
;   (define-fun
;      a1oE
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!0))
;            Sorta1om!val!0
;            (just Sorta1on!val!1))
;         Sorta1om!val!1
;         (just Sorta1on!val!2)))
;   (define-fun
;      a1ou
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      either8565735798757423996
;      (
;        (x!0
;           (Maybe Sorta1on))
;        (x!1
;           (Maybe Sorta1on)))
;      (Maybe Sorta1on)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1on!val!3))
;            (= x!1 nothing))
;         (just Sorta1on!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1on!val!3)))
;            (just Sorta1on!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (=
;                        x!1
;                        (just Sorta1on!val!0)))
;                  (just Sorta1on!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1on!val!1)))
;                     (just Sorta1on!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1on!val!4)))
;                        (just Sorta1on!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta1on!val!2)))
;                           (just Sorta1on!val!2)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1on!val!5)))
;                              (just Sorta1on!val!5)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1))))))))))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!2)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!1)
;            (just Sorta1on!val!0))))
;   (define-fun
;      k!71
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!5)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!4)
;            (just Sorta1on!val!3)))))
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] co_a1p5 {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1oY {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1pc {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1oR {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1p6 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1oS {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1oZ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1pd {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1pr} {3}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1pD} {3}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1om,a1on,a1op,a1or],a1p4)
; (UnionL [a1om,a1on,a1oq,a1or],a1oX)
; (UnionL [a1om,a1on,a1oo,a1ot],a1pb)
; (UnionL [a1om,a1on,a1oo,a1op],a1oQ)
; (a1p4,a1ot)
; (a1oQ,a1oq)
; (a1oX,a1os)
; (a1pb,a1ou)

; WANTEDS (Thoralf style)
; (UnionL [a1om,a1on,UnionL [a1om,a1on,a1oB,a1oC],a1oE],a1os)
; (UnionL [a1om,a1on,a1oB,UnionL [a1om,a1on,a1oC,a1oE]],a1ou)

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a1pr} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pD} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; GIVENS (names)
;  a1oo  <=  a
;  a1op  <=  b
;  a1oq  <=  ab
;  a1or  <=  c
;  a1os  <=  abc
;  a1ot  <=  bc
;  a1ou  <=  abc'
;  a1oQ  <=  fsk_a1oQ
;  a1oX  <=  fsk_a1oX
;  a1p4  <=  fsk_a1p4
;  a1pb  <=  fsk_a1pb
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1on)) (y (Maybe Sorta1on))) (=> ((_ is (just (Sorta1on) (Maybe Sorta1on))) x) (= (either8565735798757423996 x y) x))))
; (assert (forall ((y (Maybe Sorta1on))) (= (either8565735798757423996 (as nothing (Maybe Sorta1on)) y) y)))
; (declare-const a1oQ (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oX (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oo (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1op (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oq (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1or (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1os (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ot (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ou (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1p4 (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1pb (Array Sorta1om (Maybe Sorta1on)))
; (declare-fun either8565735798757423996 ((Maybe Sorta1on) (Maybe Sorta1on)) (Maybe Sorta1on))
; (declare-sort Sorta1om)
; (declare-sort Sorta1on)
(declare-sort Sorta1om)
(declare-sort Sorta1on)
(declare-const
   a1oo
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1op
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oq
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1or
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1os
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ot
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ou
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oQ
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oX
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1p4
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1pb
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-fun
   either8565735798757423996
   (
     (Maybe Sorta1on)
     (Maybe Sorta1on))
   (Maybe Sorta1on))
(assert
   (forall
      (
        (y
           (Maybe Sorta1on)))
      (=
         (either8565735798757423996
            (as
               nothing
               (Maybe Sorta1on))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1on))
        (y
           (Maybe Sorta1on)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1on)
                 (Maybe Sorta1on)))
           x)
         (=
            (either8565735798757423996 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1op
           a1or)
         a1p4)
      :named
      given-7.1))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oq
           a1or)
         a1oX)
      :named
      given-7.2))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1ot)
         a1pb)
      :named
      given-7.3))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1op)
         a1oQ)
      :named
      given-7.4))
(assert
   (!
      (= a1p4 a1ot)
      :named
      given-7.5))
(assert
   (!
      (= a1oQ a1oq)
      :named
      given-7.6))
(assert
   (!
      (= a1oX a1os)
      :named
      given-7.7))
(assert
   (!
      (= a1pb a1ou)
      :named
      given-7.8))
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a1pr} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pD} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; WANTEDS (names)
;  a1os  <=  abc
;  a1ou  <=  abc'
;  a1oB  <=  a_a1oB
;  a1oC  <=  b_a1oC
;  a1oE  <=  c_a1oE
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1oB (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oC (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oE (Array Sorta1om (Maybe Sorta1on)))
(declare-const
   a1oB
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oC
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oE
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 (
                   (_ map either8565735798757423996)
                   a1oB
                   a1oC)
                 a1oE)
               a1os))
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 a1oB
                 (
                   (_ map either8565735798757423996)
                   a1oC
                   a1oE))
               a1ou)))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (declare-fun
;      Sorta1om!val!1
;      ()
;      Sorta1om)
;   (declare-fun
;      Sorta1om!val!0
;      ()
;      Sorta1om)
;   (forall
;      (
;        (x Sorta1om))
;      (or
;         (= x Sorta1om!val!1)
;         (= x Sorta1om!val!0)))
;   (declare-fun
;      Sorta1on!val!5
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!3
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!0
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!1
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!4
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!2
;      ()
;      Sorta1on)
;   (forall
;      (
;        (x Sorta1on))
;      (or
;         (= x Sorta1on!val!5)
;         (= x Sorta1on!val!3)
;         (= x Sorta1on!val!0)
;         (= x Sorta1on!val!1)
;         (= x Sorta1on!val!4)
;         (= x Sorta1on!val!2)))
;   (define-fun
;      wanted-7
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      (
;                        (_ map either8565735798757423996)
;                        a1oB
;                        a1oC)
;                      a1oE)
;                    a1os)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      a1oB
;                      (
;                        (_ map either8565735798757423996)
;                        a1oC
;                        a1oE))
;                    a1ou))))
;         (or a!1 a!2)))
;   (define-fun
;      given-7.6
;      ()
;      Bool
;      (= a1oQ a1oq))
;   (define-fun
;      a1pb
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1or
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              nothing)
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1ot
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!5)))
;   (define-fun
;      given-7.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1op)
;         a1oQ))
;   (define-fun
;      a1oq
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            nothing)
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      given-7.7
;      ()
;      Bool
;      (= a1oX a1os))
;   (define-fun
;      a1p4
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!5)))
;   (define-fun
;      a1op
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            nothing)
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      a1os
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-7.5
;      ()
;      Bool
;      (= a1p4 a1ot))
;   (define-fun
;      given-7.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1ot)
;         a1pb))
;   (define-fun
;      a1oB
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oQ
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            nothing)
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      a1oo
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      given-7.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oq
;           a1or)
;         a1oX))
;   (define-fun
;      a1oX
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1oC
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      given-7.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1op
;           a1or)
;         a1p4))
;   (define-fun
;      given-7.8
;      ()
;      Bool
;      (= a1pb a1ou))
;   (define-fun
;      a1oE
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!0))
;            Sorta1om!val!0
;            (just Sorta1on!val!1))
;         Sorta1om!val!1
;         (just Sorta1on!val!2)))
;   (define-fun
;      a1ou
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!5))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      either8565735798757423996
;      (
;        (x!0
;           (Maybe Sorta1on))
;        (x!1
;           (Maybe Sorta1on)))
;      (Maybe Sorta1on)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1on!val!3))
;            (= x!1 nothing))
;         (just Sorta1on!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1on!val!3)))
;            (just Sorta1on!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (=
;                        x!1
;                        (just Sorta1on!val!0)))
;                  (just Sorta1on!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1on!val!1)))
;                     (just Sorta1on!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1on!val!4)))
;                        (just Sorta1on!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta1on!val!2)))
;                           (just Sorta1on!val!2)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1on!val!5)))
;                              (just Sorta1on!val!5)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1))))))))))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!2)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!1)
;            (just Sorta1on!val!0))))
;   (define-fun
;      k!71
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!5)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!4)
;            (just Sorta1on!val!3)))))
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a1p5 {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1oY {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1pc {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1oR {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1p6 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1oS {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1oZ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1pd {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1pI} {4}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1pN} {4}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1om,a1on,a1op,a1or],a1p4)
; (UnionL [a1om,a1on,a1oq,a1or],a1oX)
; (UnionL [a1om,a1on,a1oo,a1ot],a1pb)
; (UnionL [a1om,a1on,a1oo,a1op],a1oQ)
; (a1p4,a1ot)
; (a1oQ,a1oq)
; (a1oX,a1os)
; (a1pb,a1ou)

; WANTEDS (Thoralf style)
; (UnionL [a1om,a1on,UnionL [a1om,a1on,a1oB,a1oC],a1oE],a1os)
; (UnionL [a1om,a1on,a1oB,UnionL [a1om,a1on,a1oC,a1oE]],a1ou)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1pI} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pN} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; GIVENS (names)
;  a1oo  <=  a
;  a1op  <=  b
;  a1oq  <=  ab
;  a1or  <=  c
;  a1os  <=  abc
;  a1ot  <=  bc
;  a1ou  <=  abc'
;  a1oQ  <=  fsk_a1oQ
;  a1oX  <=  fsk_a1oX
;  a1p4  <=  fsk_a1p4
;  a1pb  <=  fsk_a1pb
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1on)) (y (Maybe Sorta1on))) (=> ((_ is (just (Sorta1on) (Maybe Sorta1on))) x) (= (either8565735798757423996 x y) x))))
; (assert (forall ((y (Maybe Sorta1on))) (= (either8565735798757423996 (as nothing (Maybe Sorta1on)) y) y)))
; (declare-const a1oQ (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oX (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oo (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1op (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oq (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1or (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1os (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ot (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ou (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1p4 (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1pb (Array Sorta1om (Maybe Sorta1on)))
; (declare-fun either8565735798757423996 ((Maybe Sorta1on) (Maybe Sorta1on)) (Maybe Sorta1on))
; (declare-sort Sorta1om)
; (declare-sort Sorta1on)
; DECS1 (unseen) 
(declare-sort Sorta1om)
(declare-sort Sorta1on)
(declare-const
   a1oo
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1op
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oq
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1or
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1os
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ot
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ou
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oQ
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oX
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1p4
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1pb
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-fun
   either8565735798757423996
   (
     (Maybe Sorta1on)
     (Maybe Sorta1on))
   (Maybe Sorta1on))
(assert
   (forall
      (
        (y
           (Maybe Sorta1on)))
      (=
         (either8565735798757423996
            (as
               nothing
               (Maybe Sorta1on))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1on))
        (y
           (Maybe Sorta1on)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1on)
                 (Maybe Sorta1on)))
           x)
         (=
            (either8565735798757423996 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1op
           a1or)
         a1p4)
      :named
      given-8.1))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oq
           a1or)
         a1oX)
      :named
      given-8.2))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1ot)
         a1pb)
      :named
      given-8.3))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1op)
         a1oQ)
      :named
      given-8.4))
(assert
   (!
      (= a1p4 a1ot)
      :named
      given-8.5))
(assert
   (!
      (= a1oQ a1oq)
      :named
      given-8.6))
(assert
   (!
      (= a1oX a1os)
      :named
      given-8.7))
(assert
   (!
      (= a1pb a1ou)
      :named
      given-8.8))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1pI} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pN} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; WANTEDS (names)
;  a1os  <=  abc
;  a1ou  <=  abc'
;  a1oB  <=  a_a1oB
;  a1oC  <=  b_a1oC
;  a1oE  <=  c_a1oE
; DECS2 (seen) 
; (declare-const a1oB (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oC (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oE (Array Sorta1om (Maybe Sorta1on)))
; DECS2 (unseen) 
(declare-const
   a1oB
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oC
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oE
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 (
                   (_ map either8565735798757423996)
                   a1oB
                   a1oC)
                 a1oE)
               a1os))
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 a1oB
                 (
                   (_ map either8565735798757423996)
                   a1oC
                   a1oE))
               a1ou)))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (declare-fun
;      Sorta1om!val!1
;      ()
;      Sorta1om)
;   (declare-fun
;      Sorta1om!val!0
;      ()
;      Sorta1om)
;   (forall
;      (
;        (x Sorta1om))
;      (or
;         (= x Sorta1om!val!1)
;         (= x Sorta1om!val!0)))
;   (declare-fun
;      Sorta1on!val!5
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!3
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!0
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!1
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!4
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!2
;      ()
;      Sorta1on)
;   (forall
;      (
;        (x Sorta1on))
;      (or
;         (= x Sorta1on!val!5)
;         (= x Sorta1on!val!3)
;         (= x Sorta1on!val!0)
;         (= x Sorta1on!val!1)
;         (= x Sorta1on!val!4)
;         (= x Sorta1on!val!2)))
;   (define-fun
;      given-8.7
;      ()
;      Bool
;      (= a1oX a1os))
;   (define-fun
;      a1pb
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-8.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1ot)
;         a1pb))
;   (define-fun
;      given-8.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1op)
;         a1oQ))
;   (define-fun
;      a1or
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1om
;                 (Maybe Sorta1on)))
;           nothing)
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1ot
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!2)))
;   (define-fun
;      a1oq
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      given-8.6
;      ()
;      Bool
;      (= a1oQ a1oq))
;   (define-fun
;      a1p4
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!2)))
;   (define-fun
;      a1op
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      given-8.8
;      ()
;      Bool
;      (= a1pb a1ou))
;   (define-fun
;      a1os
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1op
;           a1or)
;         a1p4))
;   (define-fun
;      a1oB
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oQ
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      a1oo
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oC
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oX
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-8.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oq
;           a1or)
;         a1oX))
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      (
;                        (_ map either8565735798757423996)
;                        a1oB
;                        a1oC)
;                      a1oE)
;                    a1os)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      a1oB
;                      (
;                        (_ map either8565735798757423996)
;                        a1oC
;                        a1oE))
;                    a1ou))))
;         (or a!1 a!2)))
;   (define-fun
;      a1oE
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!0))
;            Sorta1om!val!0
;            (just Sorta1on!val!1))
;         Sorta1om!val!1
;         (just Sorta1on!val!5)))
;   (define-fun
;      given-8.5
;      ()
;      Bool
;      (= a1p4 a1ot))
;   (define-fun
;      a1ou
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      either8565735798757423996
;      (
;        (x!0
;           (Maybe Sorta1on))
;        (x!1
;           (Maybe Sorta1on)))
;      (Maybe Sorta1on)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1on!val!3))
;            (= x!1 nothing))
;         (just Sorta1on!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1on!val!3)))
;            (just Sorta1on!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (=
;                        x!1
;                        (just Sorta1on!val!0)))
;                  (just Sorta1on!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1on!val!1)))
;                     (just Sorta1on!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1on!val!4)))
;                        (just Sorta1on!val!4)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1on!val!2))
;                              (= x!1 nothing))
;                           (just Sorta1on!val!2)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1on!val!2)))
;                              (just Sorta1on!val!2)
;                              (ite
;                                 (and
;                                    (= x!0 nothing)
;                                    (=
;                                       x!1
;                                       (just Sorta1on!val!5)))
;                                 (just Sorta1on!val!5)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1)))))))))))
;   (define-fun
;      k!98
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!2)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!4)
;            (just Sorta1on!val!3))))
;   (define-fun
;      k!106
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!5)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!1)
;            (just Sorta1on!val!0)))))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a1p5 {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1oY {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1pc {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1oR {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1p6 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1oS {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1oZ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1pd {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1pI} {4}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1pN} {4}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1om,a1on,a1op,a1or],a1p4)
; (UnionL [a1om,a1on,a1oq,a1or],a1oX)
; (UnionL [a1om,a1on,a1oo,a1ot],a1pb)
; (UnionL [a1om,a1on,a1oo,a1op],a1oQ)
; (a1p4,a1ot)
; (a1oQ,a1oq)
; (a1oX,a1os)
; (a1pb,a1ou)

; WANTEDS (Thoralf style)
; (UnionL [a1om,a1on,UnionL [a1om,a1on,a1oB,a1oC],a1oE],a1os)
; (UnionL [a1om,a1on,a1oB,UnionL [a1om,a1on,a1oC,a1oE]],a1ou)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1pI} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pN} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; GIVENS (names)
;  a1oo  <=  a
;  a1op  <=  b
;  a1oq  <=  ab
;  a1or  <=  c
;  a1os  <=  abc
;  a1ot  <=  bc
;  a1ou  <=  abc'
;  a1oQ  <=  fsk_a1oQ
;  a1oX  <=  fsk_a1oX
;  a1p4  <=  fsk_a1p4
;  a1pb  <=  fsk_a1pb
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1on)) (y (Maybe Sorta1on))) (=> ((_ is (just (Sorta1on) (Maybe Sorta1on))) x) (= (either8565735798757423996 x y) x))))
; (assert (forall ((y (Maybe Sorta1on))) (= (either8565735798757423996 (as nothing (Maybe Sorta1on)) y) y)))
; (declare-const a1oQ (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oX (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oo (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1op (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oq (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1or (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1os (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ot (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1ou (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1p4 (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1pb (Array Sorta1om (Maybe Sorta1on)))
; (declare-fun either8565735798757423996 ((Maybe Sorta1on) (Maybe Sorta1on)) (Maybe Sorta1on))
; (declare-sort Sorta1om)
; (declare-sort Sorta1on)
; DECS1 (unseen) 
(declare-sort Sorta1om)
(declare-sort Sorta1on)
(declare-const
   a1oo
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1op
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oq
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1or
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1os
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ot
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1ou
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oQ
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oX
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1p4
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1pb
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-fun
   either8565735798757423996
   (
     (Maybe Sorta1on)
     (Maybe Sorta1on))
   (Maybe Sorta1on))
(assert
   (forall
      (
        (y
           (Maybe Sorta1on)))
      (=
         (either8565735798757423996
            (as
               nothing
               (Maybe Sorta1on))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1on))
        (y
           (Maybe Sorta1on)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1on)
                 (Maybe Sorta1on)))
           x)
         (=
            (either8565735798757423996 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1op
           a1or)
         a1p4)
      :named
      given-8.1))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oq
           a1or)
         a1oX)
      :named
      given-8.2))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1ot)
         a1pb)
      :named
      given-8.3))
(assert
   (!
      (=
         (
           (_ map either8565735798757423996)
           a1oo
           a1op)
         a1oQ)
      :named
      given-8.4))
(assert
   (!
      (= a1p4 a1ot)
      :named
      given-8.5))
(assert
   (!
      (= a1oQ a1oq)
      :named
      given-8.6))
(assert
   (!
      (= a1oX a1os)
      :named
      given-8.7))
(assert
   (!
      (= a1pb a1ou)
      :named
      given-8.8))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1pI} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      (
;        (_ map either8565735798757423996)
;        a1oB
;        a1oC)
;      a1oE)
;    a1os)

;      [WD] hole{co_a1pN} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8565735798757423996)
;      a1oB
;      (
;        (_ map either8565735798757423996)
;        a1oC
;        a1oE))
;    a1ou)

; WANTEDS (names)
;  a1os  <=  abc
;  a1ou  <=  abc'
;  a1oB  <=  a_a1oB
;  a1oC  <=  b_a1oC
;  a1oE  <=  c_a1oE
; DECS2 (seen) 
; (declare-const a1oB (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oC (Array Sorta1om (Maybe Sorta1on)))
; (declare-const a1oE (Array Sorta1om (Maybe Sorta1on)))
; DECS2 (unseen) 
(declare-const
   a1oB
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oC
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(declare-const
   a1oE
   (Array
      Sorta1om
      (Maybe Sorta1on)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 (
                   (_ map either8565735798757423996)
                   a1oB
                   a1oC)
                 a1oE)
               a1os))
         (not
            (=
               (
                 (_ map either8565735798757423996)
                 a1oB
                 (
                   (_ map either8565735798757423996)
                   a1oC
                   a1oE))
               a1ou)))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (declare-fun
;      Sorta1om!val!1
;      ()
;      Sorta1om)
;   (declare-fun
;      Sorta1om!val!0
;      ()
;      Sorta1om)
;   (forall
;      (
;        (x Sorta1om))
;      (or
;         (= x Sorta1om!val!1)
;         (= x Sorta1om!val!0)))
;   (declare-fun
;      Sorta1on!val!5
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!3
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!0
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!1
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!4
;      ()
;      Sorta1on)
;   (declare-fun
;      Sorta1on!val!2
;      ()
;      Sorta1on)
;   (forall
;      (
;        (x Sorta1on))
;      (or
;         (= x Sorta1on!val!5)
;         (= x Sorta1on!val!3)
;         (= x Sorta1on!val!0)
;         (= x Sorta1on!val!1)
;         (= x Sorta1on!val!4)
;         (= x Sorta1on!val!2)))
;   (define-fun
;      given-8.7
;      ()
;      Bool
;      (= a1oX a1os))
;   (define-fun
;      a1pb
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-8.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1ot)
;         a1pb))
;   (define-fun
;      given-8.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oo
;           a1op)
;         a1oQ))
;   (define-fun
;      a1or
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1om
;                 (Maybe Sorta1on)))
;           nothing)
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      a1ot
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!2)))
;   (define-fun
;      a1oq
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      given-8.6
;      ()
;      Bool
;      (= a1oQ a1oq))
;   (define-fun
;      a1p4
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!0
;            (just Sorta1on!val!4))
;         Sorta1om!val!1
;         (just Sorta1on!val!2)))
;   (define-fun
;      a1op
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      given-8.8
;      ()
;      Bool
;      (= a1pb a1ou))
;   (define-fun
;      a1os
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1op
;           a1or)
;         a1p4))
;   (define-fun
;      a1oB
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oQ
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         nothing))
;   (define-fun
;      a1oo
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oC
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (
;        (as
;           const
;           (Array
;              Sorta1om
;              (Maybe Sorta1on)))
;        nothing))
;   (define-fun
;      a1oX
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      given-8.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8565735798757423996)
;           a1oq
;           a1or)
;         a1oX))
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      (
;                        (_ map either8565735798757423996)
;                        a1oB
;                        a1oC)
;                      a1oE)
;                    a1os)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8565735798757423996)
;                      a1oB
;                      (
;                        (_ map either8565735798757423996)
;                        a1oC
;                        a1oE))
;                    a1ou))))
;         (or a!1 a!2)))
;   (define-fun
;      a1oE
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!0))
;            Sorta1om!val!0
;            (just Sorta1on!val!1))
;         Sorta1om!val!1
;         (just Sorta1on!val!5)))
;   (define-fun
;      given-8.5
;      ()
;      Bool
;      (= a1p4 a1ot))
;   (define-fun
;      a1ou
;      ()
;      (Array
;         Sorta1om
;         (Maybe Sorta1on))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1om
;                    (Maybe Sorta1on)))
;              (just Sorta1on!val!3))
;            Sorta1om!val!1
;            (just Sorta1on!val!2))
;         Sorta1om!val!0
;         (just Sorta1on!val!4)))
;   (define-fun
;      either8565735798757423996
;      (
;        (x!0
;           (Maybe Sorta1on))
;        (x!1
;           (Maybe Sorta1on)))
;      (Maybe Sorta1on)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1on!val!3))
;            (= x!1 nothing))
;         (just Sorta1on!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1on!val!3)))
;            (just Sorta1on!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (= x!1 nothing))
;               nothing
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (=
;                        x!1
;                        (just Sorta1on!val!0)))
;                  (just Sorta1on!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1on!val!1)))
;                     (just Sorta1on!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1on!val!4)))
;                        (just Sorta1on!val!4)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1on!val!2))
;                              (= x!1 nothing))
;                           (just Sorta1on!val!2)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1on!val!2)))
;                              (just Sorta1on!val!2)
;                              (ite
;                                 (and
;                                    (= x!0 nothing)
;                                    (=
;                                       x!1
;                                       (just Sorta1on!val!5)))
;                                 (just Sorta1on!val!5)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1)))))))))))
;   (define-fun
;      k!98
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!2)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!4)
;            (just Sorta1on!val!3))))
;   (define-fun
;      k!106
;      (
;        (x!0 Sorta1om))
;      (Maybe Sorta1on)
;      (ite
;         (= x!0 Sorta1om!val!1)
;         (just Sorta1on!val!5)
;         (ite
;            (= x!0 Sorta1om!val!0)
;            (just Sorta1on!val!1)
;            (just Sorta1on!val!0)))))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1q8} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1pO,LiftedRep [])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a1q8} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1pO
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
;      [WD] hole{co_a1q8} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1pO
;    (lit "63A"))

; WANTEDS (names)
;  a1pO  <=  t_a1pO
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1pO Type)
(declare-const a1pO Type)
(assert
   (!
      (not
         (=
            a1pO
            (lit "63A")))
      :named
      wanted-9))
(check-sat)
; sat
(echo "wanteds-finish-cycle-9")
(get-model)
; (
;   (define-fun
;      a1pO
;      ()
;      Type
;      (lit "6"))
;   (define-fun
;      wanted-9
;      ()
;      Bool
;      (not
;         (=
;            a1pO
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1q8} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1pO,LiftedRep [])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a1q8} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1pO
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
;      [WD] hole{co_a1q8} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1pO
;    (lit "63A"))

; WANTEDS (names)
;  a1pO  <=  t_a1pO
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1pO Type)
(declare-const a1pO Type)
(assert
   (!
      (not
         (=
            a1pO
            (lit "63A")))
      :named
      wanted-9))
(check-sat)
; sat
(echo "wanteds-finish-cycle-9")
(get-model)
; (
;   (define-fun
;      a1pO
;      ()
;      Type
;      (lit "6"))
;   (define-fun
;      wanted-9
;      ()
;      Bool
;      (not
;         (=
;            a1pO
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] co_a1qv {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1qr {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1qw {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1qz {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1qG} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1qd,"ok",2],a1qu)
; (Alter [Symbol [],Nat [],a1qc,"ok",2],a1qq)
; (a1qu,a1qe)
; (a1qq,a1qd)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1qh,"ok",2],a1qd)

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a1qG} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1qh
;       "ok"
;       (just 2))
;    a1qd)

; GIVENS (names)
;  a1qc  <=  m1
;  a1qd  <=  m2
;  a1qe  <=  m3
;  a1qq  <=  fsk_a1qq
;  a1qu  <=  fsk_a1qu
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1qc (Array String (Maybe Int)))
; (declare-const a1qd (Array String (Maybe Int)))
; (declare-const a1qe (Array String (Maybe Int)))
; (declare-const a1qq (Array String (Maybe Int)))
; (declare-const a1qu (Array String (Maybe Int)))
(declare-const
   a1qc
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qd
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qe
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qq
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qu
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1qd
            "ok"
            (just 2))
         a1qu)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a1qc
            "ok"
            (just 2))
         a1qq)
      :named
      given-11.2))
(assert
   (!
      (= a1qu a1qe)
      :named
      given-11.3))
(assert
   (!
      (= a1qq a1qd)
      :named
      given-11.4))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a1qG} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1qh
;       "ok"
;       (just 2))
;    a1qd)

; WANTEDS (names)
;  a1qd  <=  m2
;  a1qh  <=  m1_a1qh
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1qh (Array String (Maybe Int)))
(declare-const
   a1qh
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1qh
               "ok"
               (just 2))
            a1qd))
      :named
      wanted-11))
(check-sat)
; sat
(echo "wanteds-finish-cycle-11")
(get-model)
; (
;   (define-fun
;      given-11.1
;      ()
;      Bool
;      (=
;         (store
;            a1qd
;            "ok"
;            (just 2))
;         a1qu))
;   (define-fun
;      wanted-11
;      ()
;      Bool
;      (not
;         (=
;            (store
;               a1qh
;               "ok"
;               (just 2))
;            a1qd)))
;   (define-fun
;      a1qc
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Int)))
;           (just 4))
;         "o"
;         (just 3)))
;   (define-fun
;      given-11.2
;      ()
;      Bool
;      (=
;         (store
;            a1qc
;            "ok"
;            (just 2))
;         a1qq))
;   (define-fun
;      a1qd
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      a1qu
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      given-11.4
;      ()
;      Bool
;      (= a1qq a1qd))
;   (define-fun
;      a1qq
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      given-11.3
;      ()
;      Bool
;      (= a1qu a1qe))
;   (define-fun
;      a1qh
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Int)))
;           (just 5))
;         "o"
;         nothing))
;   (define-fun
;      a1qe
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2))))
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] co_a1qv {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1qr {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1qw {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1qz {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1qG} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1qd,"ok",2],a1qu)
; (Alter [Symbol [],Nat [],a1qc,"ok",2],a1qq)
; (a1qu,a1qe)
; (a1qq,a1qd)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1qh,"ok",2],a1qd)

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a1qG} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1qh
;       "ok"
;       (just 2))
;    a1qd)

; GIVENS (names)
;  a1qc  <=  m1
;  a1qd  <=  m2
;  a1qe  <=  m3
;  a1qq  <=  fsk_a1qq
;  a1qu  <=  fsk_a1qu
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1qc (Array String (Maybe Int)))
; (declare-const a1qd (Array String (Maybe Int)))
; (declare-const a1qe (Array String (Maybe Int)))
; (declare-const a1qq (Array String (Maybe Int)))
; (declare-const a1qu (Array String (Maybe Int)))
(declare-const
   a1qc
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qd
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qe
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qq
   (Array
      String
      (Maybe Int)))
(declare-const
   a1qu
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1qd
            "ok"
            (just 2))
         a1qu)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a1qc
            "ok"
            (just 2))
         a1qq)
      :named
      given-11.2))
(assert
   (!
      (= a1qu a1qe)
      :named
      given-11.3))
(assert
   (!
      (= a1qq a1qd)
      :named
      given-11.4))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a1qG} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1qh
;       "ok"
;       (just 2))
;    a1qd)

; WANTEDS (names)
;  a1qd  <=  m2
;  a1qh  <=  m1_a1qh
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1qh (Array String (Maybe Int)))
(declare-const
   a1qh
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1qh
               "ok"
               (just 2))
            a1qd))
      :named
      wanted-11))
(check-sat)
; sat
(echo "wanteds-finish-cycle-11")
(get-model)
; (
;   (define-fun
;      given-11.1
;      ()
;      Bool
;      (=
;         (store
;            a1qd
;            "ok"
;            (just 2))
;         a1qu))
;   (define-fun
;      wanted-11
;      ()
;      Bool
;      (not
;         (=
;            (store
;               a1qh
;               "ok"
;               (just 2))
;            a1qd)))
;   (define-fun
;      a1qc
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Int)))
;           (just 4))
;         "o"
;         (just 3)))
;   (define-fun
;      given-11.2
;      ()
;      Bool
;      (=
;         (store
;            a1qc
;            "ok"
;            (just 2))
;         a1qq))
;   (define-fun
;      a1qd
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      a1qu
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      given-11.4
;      ()
;      Bool
;      (= a1qq a1qd))
;   (define-fun
;      a1qq
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      given-11.3
;      ()
;      Bool
;      (= a1qu a1qe))
;   (define-fun
;      a1qh
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Int)))
;           (just 5))
;         "o"
;         nothing))
;   (define-fun
;      a1qe
;      ()
;      (Array
;         String
;         (Maybe Int))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Int)))
;              (just 4))
;            "o"
;            (just 3))
;         "ok"
;         (just 2))))
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1r0} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1qH,LiftedRep [])

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] hole{co_a1r0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1qH
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] hole{co_a1r0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1qH
;    (lit "63A"))

; WANTEDS (names)
;  a1qH  <=  t_a1qH
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1qH Type)
(declare-const a1qH Type)
(assert
   (!
      (not
         (=
            a1qH
            (lit "63A")))
      :named
      wanted-12))
(check-sat)
; sat
(echo "wanteds-finish-cycle-12")
(get-model)
; (
;   (define-fun
;      a1qH
;      ()
;      Type
;      (lit "6"))
;   (define-fun
;      wanted-12
;      ()
;      Bool
;      (not
;         (=
;            a1qH
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1r0} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a1qH,LiftedRep [])

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] hole{co_a1r0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1qH
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] hole{co_a1r0} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a1qH
;    (lit "63A"))

; WANTEDS (names)
;  a1qH  <=  t_a1qH
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1qH Type)
(declare-const a1qH Type)
(assert
   (!
      (not
         (=
            a1qH
            (lit "63A")))
      :named
      wanted-12))
(check-sat)
; sat
(echo "wanteds-finish-cycle-12")
(get-model)
; (
;   (define-fun
;      a1qH
;      ()
;      Type
;      (lit "6"))
;   (define-fun
;      wanted-12
;      ()
;      Bool
;      (not
;         (=
;            a1qH
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] co_a1rq {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1rm {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1rr {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1ru {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1rB} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1r5,a1r7,"bob"],a1rp)
; (Delete [Symbol [],a1r5,a1r6,"bob"],a1rl)
; (a1rp,a1r8)
; (a1rl,a1r7)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1r5,a1rc,"bob"],a1r7)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_a1rB} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1rc
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1r5)))
;    a1r7)

; GIVENS (names)
;  a1r6  <=  m1
;  a1r7  <=  m2
;  a1r8  <=  m3
;  a1rl  <=  fsk_a1rl
;  a1rp  <=  fsk_a1rp
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1r6 (Array String (Maybe Sorta1r5)))
; (declare-const a1r7 (Array String (Maybe Sorta1r5)))
; (declare-const a1r8 (Array String (Maybe Sorta1r5)))
; (declare-const a1rl (Array String (Maybe Sorta1r5)))
; (declare-const a1rp (Array String (Maybe Sorta1r5)))
; (declare-sort Sorta1r5)
(declare-sort Sorta1r5)
(declare-const
   a1r6
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1r7
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1r8
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1rl
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1rp
   (Array
      String
      (Maybe Sorta1r5)))
(assert
   (!
      (=
         (store
            a1r7
            "bob"
            (as
               nothing
               (Maybe Sorta1r5)))
         a1rp)
      :named
      given-14.1))
(assert
   (!
      (=
         (store
            a1r6
            "bob"
            (as
               nothing
               (Maybe Sorta1r5)))
         a1rl)
      :named
      given-14.2))
(assert
   (!
      (= a1rp a1r8)
      :named
      given-14.3))
(assert
   (!
      (= a1rl a1r7)
      :named
      given-14.4))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_a1rB} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1rc
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1r5)))
;    a1r7)

; WANTEDS (names)
;  a1r7  <=  m2
;  a1rc  <=  m1_a1rc
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1rc (Array String (Maybe Sorta1r5)))
(declare-const
   a1rc
   (Array
      String
      (Maybe Sorta1r5)))
(assert
   (!
      (not
         (=
            (store
               a1rc
               "bob"
               (as
                  nothing
                  (Maybe Sorta1r5)))
            a1r7))
      :named
      wanted-14))
(check-sat)
; sat
(echo "wanteds-finish-cycle-14")
(get-model)
; (
;   (declare-fun
;      Sorta1r5!val!0
;      ()
;      Sorta1r5)
;   (declare-fun
;      Sorta1r5!val!1
;      ()
;      Sorta1r5)
;   (declare-fun
;      Sorta1r5!val!2
;      ()
;      Sorta1r5)
;   (forall
;      (
;        (x Sorta1r5))
;      (or
;         (= x Sorta1r5!val!0)
;         (= x Sorta1r5!val!1)
;         (= x Sorta1r5!val!2)))
;   (define-fun
;      given-14.1
;      ()
;      Bool
;      (=
;         (store a1r7 "bob" nothing)
;         a1rp))
;   (define-fun
;      a1rc
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1r5)))
;           (just Sorta1r5!val!2))
;         "b"
;         (just Sorta1r5!val!0)))
;   (define-fun
;      given-14.2
;      ()
;      Bool
;      (=
;         (store a1r6 "bob" nothing)
;         a1rl))
;   (define-fun
;      a1r6
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1r5)))
;           (just Sorta1r5!val!1))
;         "b"
;         nothing))
;   (define-fun
;      given-14.3
;      ()
;      Bool
;      (= a1rp a1r8))
;   (define-fun
;      given-14.4
;      ()
;      Bool
;      (= a1rl a1r7))
;   (define-fun
;      a1r7
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      a1rp
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      a1rl
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      a1r8
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      wanted-14
;      ()
;      Bool
;      (not
;         (=
;            (store a1rc "bob" nothing)
;            a1r7))))
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] co_a1rq {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1rm {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1rr {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1ru {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1rB} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1r5,a1r7,"bob"],a1rp)
; (Delete [Symbol [],a1r5,a1r6,"bob"],a1rl)
; (a1rp,a1r8)
; (a1rl,a1r7)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1r5,a1rc,"bob"],a1r7)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_a1rB} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1rc
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1r5)))
;    a1r7)

; GIVENS (names)
;  a1r6  <=  m1
;  a1r7  <=  m2
;  a1r8  <=  m3
;  a1rl  <=  fsk_a1rl
;  a1rp  <=  fsk_a1rp
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1r6 (Array String (Maybe Sorta1r5)))
; (declare-const a1r7 (Array String (Maybe Sorta1r5)))
; (declare-const a1r8 (Array String (Maybe Sorta1r5)))
; (declare-const a1rl (Array String (Maybe Sorta1r5)))
; (declare-const a1rp (Array String (Maybe Sorta1r5)))
; (declare-sort Sorta1r5)
(declare-sort Sorta1r5)
(declare-const
   a1r6
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1r7
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1r8
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1rl
   (Array
      String
      (Maybe Sorta1r5)))
(declare-const
   a1rp
   (Array
      String
      (Maybe Sorta1r5)))
(assert
   (!
      (=
         (store
            a1r7
            "bob"
            (as
               nothing
               (Maybe Sorta1r5)))
         a1rp)
      :named
      given-14.1))
(assert
   (!
      (=
         (store
            a1r6
            "bob"
            (as
               nothing
               (Maybe Sorta1r5)))
         a1rl)
      :named
      given-14.2))
(assert
   (!
      (= a1rp a1r8)
      :named
      given-14.3))
(assert
   (!
      (= a1rl a1r7)
      :named
      given-14.4))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_a1rB} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1rc
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1r5)))
;    a1r7)

; WANTEDS (names)
;  a1r7  <=  m2
;  a1rc  <=  m1_a1rc
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1rc (Array String (Maybe Sorta1r5)))
(declare-const
   a1rc
   (Array
      String
      (Maybe Sorta1r5)))
(assert
   (!
      (not
         (=
            (store
               a1rc
               "bob"
               (as
                  nothing
                  (Maybe Sorta1r5)))
            a1r7))
      :named
      wanted-14))
(check-sat)
; sat
(echo "wanteds-finish-cycle-14")
(get-model)
; (
;   (declare-fun
;      Sorta1r5!val!0
;      ()
;      Sorta1r5)
;   (declare-fun
;      Sorta1r5!val!1
;      ()
;      Sorta1r5)
;   (declare-fun
;      Sorta1r5!val!2
;      ()
;      Sorta1r5)
;   (forall
;      (
;        (x Sorta1r5))
;      (or
;         (= x Sorta1r5!val!0)
;         (= x Sorta1r5!val!1)
;         (= x Sorta1r5!val!2)))
;   (define-fun
;      given-14.1
;      ()
;      Bool
;      (=
;         (store a1r7 "bob" nothing)
;         a1rp))
;   (define-fun
;      a1rc
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1r5)))
;           (just Sorta1r5!val!2))
;         "b"
;         (just Sorta1r5!val!0)))
;   (define-fun
;      given-14.2
;      ()
;      Bool
;      (=
;         (store a1r6 "bob" nothing)
;         a1rl))
;   (define-fun
;      a1r6
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1r5)))
;           (just Sorta1r5!val!1))
;         "b"
;         nothing))
;   (define-fun
;      given-14.3
;      ()
;      Bool
;      (= a1rp a1r8))
;   (define-fun
;      given-14.4
;      ()
;      Bool
;      (= a1rl a1r7))
;   (define-fun
;      a1r7
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      a1rp
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      a1rl
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      a1r8
;      ()
;      (Array
;         String
;         (Maybe Sorta1r5))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1r5)))
;              (just Sorta1r5!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      wanted-14
;      ()
;      Bool
;      (not
;         (=
;            (store a1rc "bob" nothing)
;            a1r7))))
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1t7} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                          ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_a1t7} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                               ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
;  =>  (=
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  Int
;                  (Maybe String)))
;            nothing)
;          1
;          (just "ok"))
;       2
;       (just "hi"))
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  Int
;                  (Maybe String)))
;            nothing)
;          2
;          (just "hi"))
;       1
;       (just "ok")))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_a1t7} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                               ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
;  =>  (=
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  Int
;                  (Maybe String)))
;            nothing)
;          1
;          (just "ok"))
;       2
;       (just "hi"))
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  Int
;                  (Maybe String)))
;            nothing)
;          2
;          (just "hi"))
;       1
;       (just "ok")))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               (store
                  (
                    (as
                       const
                       (Array
                          Int
                          (Maybe String)))
                    nothing)
                  1
                  (just "ok"))
               2
               (just "hi"))
            (store
               (store
                  (
                    (as
                       const
                       (Array
                          Int
                          (Maybe String)))
                    nothing)
                  2
                  (just "hi"))
               1
               (just "ok"))))
      :named
      wanted-15))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-15")
(get-assertions)
; (
;   (!
;      (not
;         (=
;            (store
;               (store
;                  (
;                    (as
;                       const
;                       (Array
;                          Int
;                          (Maybe String)))
;                    nothing)
;                  1
;                  (just "ok"))
;               2
;               (just "hi"))
;            (store
;               (store
;                  (
;                    (as
;                       const
;                       (Array
;                          Int
;                          (Maybe String)))
;                    nothing)
;                  2
;                  (just "hi"))
;               1
;               (just "ok"))))
;      :named
;      wanted-15))
(get-unsat-core)
; (wanted-15)
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] co_a1tv {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1to {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1tC {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1th {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1tw {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1ti {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1tp {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1tD {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1s7} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1rQ,a1rR,a1rT,a1rV],a1tu)
; (IntersectL [a1rQ,a1rR,a1rU,a1rV],a1tn)
; (IntersectL [a1rQ,a1rR,a1rS,a1rX],a1tB)
; (IntersectL [a1rQ,a1rR,a1rS,a1rT],a1tg)
; (a1tu,a1rX)
; (a1tg,a1rU)
; (a1tn,a1rW)
; (a1tB,a1rY)

; WANTEDS (Thoralf style)
; (a1rW,a1rY)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a1s7} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1rW a1rY)

; GIVENS (names)
;  a1rS  <=  a
;  a1rT  <=  b
;  a1rU  <=  ab
;  a1rV  <=  c
;  a1rW  <=  abc
;  a1rX  <=  bc
;  a1rY  <=  abc'
;  a1tg  <=  fsk_a1tg
;  a1tn  <=  fsk_a1tn
;  a1tu  <=  fsk_a1tu
;  a1tB  <=  fsk_a1tB
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1rR)) (y (Maybe Sorta1rR))) (=> (and ((_ is (just (Sorta1rR) (Maybe Sorta1rR))) x) ((_ is (just (Sorta1rR) (Maybe Sorta1rR))) y)) (= (both8585938225410199169 x y) x))))
; (assert (forall ((y (Maybe Sorta1rR))) (= (both8585938225410199169 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1rR))) (= (both8585938225410199169 y (as nothing (Maybe Sorta1rR))) (as nothing (Maybe Sorta1rR)))))
; (declare-const a1rS (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1rT (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1rU (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1rV (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1rW (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1rX (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1rY (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1tB (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1tg (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1tn (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-const a1tu (Array Sorta1rQ (Maybe Sorta1rR)))
; (declare-fun both8585938225410199169 ((Maybe Sorta1rR) (Maybe Sorta1rR)) (Maybe Sorta1rR))
; (declare-sort Sorta1rQ)
; (declare-sort Sorta1rR)
(declare-sort Sorta1rQ)
(declare-sort Sorta1rR)
(declare-const
   a1rS
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1rT
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1rU
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1rV
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1rW
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1rX
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1rY
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1tg
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1tn
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1tu
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-const
   a1tB
   (Array
      Sorta1rQ
      (Maybe Sorta1rR)))
(declare-fun
   both8585938225410199169
   (
     (Maybe Sorta1rR)
     (Maybe Sorta1rR))
   (Maybe Sorta1rR))
(assert
   (forall
      (
        (y
           (Maybe Sorta1rR)))
      (=
         (both8585938225410199169
            y
            (as
               nothing
               (Maybe Sorta1rR)))
         (as
            nothing
            (Maybe Sorta1rR)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1rR)))
      (=
         (both8585938225410199169 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1rR))
        (y
           (Maybe Sorta1rR)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1rR)
                    (Maybe Sorta1rR)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1rR)
                    (Maybe Sorta1rR)))
              y))
         (=
            (both8585938225410199169 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8585938225410199169)
           a1rT
           a1rV)
         a1tu)
      :named
      given-17.1))
(assert
   (!
      (=
         (
           (_ map both8585938225410199169)
           a1rU
           a1rV)
         a1tn)
      :named
      given-17.2))
(assert
   (!
      (=
         (
           (_ map both8585938225410199169)
           a1rS
           a1rX)
         a1tB)
      :named
      given-17.3))
(assert
   (!
      (=
         (
           (_ map both8585938225410199169)
           a1rS
           a1rT)
         a1tg)
      :named
      given-17.4))
(assert
   (!
      (= a1tu a1rX)
      :named
      given-17.5))
(assert
   (!
      (= a1tg a1rU)
      :named
      given-17.6))
(assert
   (!
      (= a1tn a1rW)
      :named
      given-17.7))
(assert
   (!
      (= a1tB a1rY)
      :named
      given-17.8))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a1s7} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1rW a1rY)

; WANTEDS (names)
;  a1rW  <=  abc
;  a1rY  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1rW a1rY))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (forall
;      (
;        (y
;           (Maybe Sorta1rR)))
;      (=
;         (both8585938225410199169
;            y
;            (as
;               nothing
;               (Maybe Sorta1rR)))
;         (as
;            nothing
;            (Maybe Sorta1rR))))
;   (forall
;      (
;        (y
;           (Maybe Sorta1rR)))
;      (=
;         (both8585938225410199169 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe Sorta1rR))
;        (y
;           (Maybe Sorta1rR)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1rR)
;                    (Maybe Sorta1rR)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1rR)
;                    (Maybe Sorta1rR)))
;              y))
;         (=
;            (both8585938225410199169 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both8585938225410199169)
;           a1rT
;           a1rV)
;         a1tu)
;      :named
;      given-17.1)
;   (!
;      (=
;         (
;           (_ map both8585938225410199169)
;           a1rU
;           a1rV)
;         a1tn)
;      :named
;      given-17.2)
;   (!
;      (=
;         (
;           (_ map both8585938225410199169)
;           a1rS
;           a1rX)
;         a1tB)
;      :named
;      given-17.3)
;   (!
;      (=
;         (
;           (_ map both8585938225410199169)
;           a1rS
;           a1rT)
;         a1tg)
;      :named
;      given-17.4)
;   (!
;      (= a1tu a1rX)
;      :named
;      given-17.5)
;   (!
;      (= a1tg a1rU)
;      :named
;      given-17.6)
;   (!
;      (= a1tn a1rW)
;      :named
;      given-17.7)
;   (!
;      (= a1tB a1rY)
;      :named
;      given-17.8)
;   (!
;      (not
;         (= a1rW a1rY))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.8
;    given-17.5
;    given-17.1
;    given-17.4
;    given-17.6
;    given-17.7
;    wanted-17
;    given-17.3
;    given-17.2)
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] co_a1tX {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1tQ {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1u4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1tJ {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1tY {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1tK {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1tR {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1u5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1sp} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1s9,a1sa,a1sc,a1se],a1tW)
; (UnionL [a1s9,a1sa,a1sd,a1se],a1tP)
; (UnionL [a1s9,a1sa,a1sb,a1sg],a1u3)
; (UnionL [a1s9,a1sa,a1sb,a1sc],a1tI)
; (a1tW,a1sg)
; (a1tI,a1sd)
; (a1tP,a1sf)
; (a1u3,a1sh)

; WANTEDS (Thoralf style)
; (a1sf,a1sh)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a1sp} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1sf a1sh)

; GIVENS (names)
;  a1sb  <=  a
;  a1sc  <=  b
;  a1sd  <=  ab
;  a1se  <=  c
;  a1sf  <=  abc
;  a1sg  <=  bc
;  a1sh  <=  abc'
;  a1tI  <=  fsk_a1tI
;  a1tP  <=  fsk_a1tP
;  a1tW  <=  fsk_a1tW
;  a1u3  <=  fsk_a1u3
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1sa)) (y (Maybe Sorta1sa))) (=> ((_ is (just (Sorta1sa) (Maybe Sorta1sa))) x) (= (either8584857405479856981 x y) x))))
; (assert (forall ((y (Maybe Sorta1sa))) (= (either8584857405479856981 (as nothing (Maybe Sorta1sa)) y) y)))
; (declare-const a1sb (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1sc (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1sd (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1se (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1sf (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1sg (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1sh (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1tI (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1tP (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1tW (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-const a1u3 (Array Sorta1s9 (Maybe Sorta1sa)))
; (declare-fun either8584857405479856981 ((Maybe Sorta1sa) (Maybe Sorta1sa)) (Maybe Sorta1sa))
; (declare-sort Sorta1s9)
; (declare-sort Sorta1sa)
(declare-sort Sorta1s9)
(declare-sort Sorta1sa)
(declare-const
   a1sb
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1sc
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1sd
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1se
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1sf
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1sg
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1sh
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1tI
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1tP
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1tW
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-const
   a1u3
   (Array
      Sorta1s9
      (Maybe Sorta1sa)))
(declare-fun
   either8584857405479856981
   (
     (Maybe Sorta1sa)
     (Maybe Sorta1sa))
   (Maybe Sorta1sa))
(assert
   (forall
      (
        (y
           (Maybe Sorta1sa)))
      (=
         (either8584857405479856981
            (as
               nothing
               (Maybe Sorta1sa))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1sa))
        (y
           (Maybe Sorta1sa)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1sa)
                 (Maybe Sorta1sa)))
           x)
         (=
            (either8584857405479856981 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8584857405479856981)
           a1sc
           a1se)
         a1tW)
      :named
      given-19.1))
(assert
   (!
      (=
         (
           (_ map either8584857405479856981)
           a1sd
           a1se)
         a1tP)
      :named
      given-19.2))
(assert
   (!
      (=
         (
           (_ map either8584857405479856981)
           a1sb
           a1sg)
         a1u3)
      :named
      given-19.3))
(assert
   (!
      (=
         (
           (_ map either8584857405479856981)
           a1sb
           a1sc)
         a1tI)
      :named
      given-19.4))
(assert
   (!
      (= a1tW a1sg)
      :named
      given-19.5))
(assert
   (!
      (= a1tI a1sd)
      :named
      given-19.6))
(assert
   (!
      (= a1tP a1sf)
      :named
      given-19.7))
(assert
   (!
      (= a1u3 a1sh)
      :named
      given-19.8))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a1sp} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1sf a1sh)

; WANTEDS (names)
;  a1sf  <=  abc
;  a1sh  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1sf a1sh))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (forall
;      (
;        (y
;           (Maybe Sorta1sa)))
;      (=
;         (either8584857405479856981
;            (as
;               nothing
;               (Maybe Sorta1sa))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe Sorta1sa))
;        (y
;           (Maybe Sorta1sa)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (Sorta1sa)
;                 (Maybe Sorta1sa)))
;           x)
;         (=
;            (either8584857405479856981 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either8584857405479856981)
;           a1sc
;           a1se)
;         a1tW)
;      :named
;      given-19.1)
;   (!
;      (=
;         (
;           (_ map either8584857405479856981)
;           a1sd
;           a1se)
;         a1tP)
;      :named
;      given-19.2)
;   (!
;      (=
;         (
;           (_ map either8584857405479856981)
;           a1sb
;           a1sg)
;         a1u3)
;      :named
;      given-19.3)
;   (!
;      (=
;         (
;           (_ map either8584857405479856981)
;           a1sb
;           a1sc)
;         a1tI)
;      :named
;      given-19.4)
;   (!
;      (= a1tW a1sg)
;      :named
;      given-19.5)
;   (!
;      (= a1tI a1sd)
;      :named
;      given-19.6)
;   (!
;      (= a1tP a1sf)
;      :named
;      given-19.7)
;   (!
;      (= a1u3 a1sh)
;      :named
;      given-19.8)
;   (!
;      (not
;         (= a1sf a1sh))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.3
;    given-19.2
;    given-19.4
;    given-19.7
;    given-19.6
;    given-19.5
;    given-19.8
;    given-19.1
;    wanted-19)
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] co_a1uf {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1ub {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1ug {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1uj {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1sz} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ss,"ok",2],a1ue)
; (Alter [Symbol [],Nat [],a1sr,"ok",2],a1ua)
; (a1ue,a1st)
; (a1ua,a1ss)

; WANTEDS (Thoralf style)
; (a1ss,a1st)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{co_a1sz} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ss a1st)

; GIVENS (names)
;  a1sr  <=  m1
;  a1ss  <=  m2
;  a1st  <=  m3
;  a1ua  <=  fsk_a1ua
;  a1ue  <=  fsk_a1ue
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1sr (Array String (Maybe Int)))
; (declare-const a1ss (Array String (Maybe Int)))
; (declare-const a1st (Array String (Maybe Int)))
; (declare-const a1ua (Array String (Maybe Int)))
; (declare-const a1ue (Array String (Maybe Int)))
(declare-const
   a1sr
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ss
   (Array
      String
      (Maybe Int)))
(declare-const
   a1st
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ua
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ue
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ss
            "ok"
            (just 2))
         a1ue)
      :named
      given-21.1))
(assert
   (!
      (=
         (store
            a1sr
            "ok"
            (just 2))
         a1ua)
      :named
      given-21.2))
(assert
   (!
      (= a1ue a1st)
      :named
      given-21.3))
(assert
   (!
      (= a1ua a1ss)
      :named
      given-21.4))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{co_a1sz} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ss a1st)

; WANTEDS (names)
;  a1ss  <=  m2
;  a1st  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1ss a1st))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a1ss
;            "ok"
;            (just 2))
;         a1ue)
;      :named
;      given-21.1)
;   (!
;      (=
;         (store
;            a1sr
;            "ok"
;            (just 2))
;         a1ua)
;      :named
;      given-21.2)
;   (!
;      (= a1ue a1st)
;      :named
;      given-21.3)
;   (!
;      (= a1ua a1ss)
;      :named
;      given-21.4)
;   (!
;      (not
;         (= a1ss a1st))
;      :named
;      wanted-21))
(get-unsat-core)
; (given-21.3 given-21.4 given-21.2 wanted-21 given-21.1)
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; [G] co_a1ut {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1up {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1uu {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1ux {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1sK} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1sB,a1sD,"bob"],a1us)
; (Delete [Symbol [],a1sB,a1sC,"bob"],a1uo)
; (a1us,a1sE)
; (a1uo,a1sD)

; WANTEDS (Thoralf style)
; (a1sD,a1sE)

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a1sK} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1sD a1sE)

; GIVENS (names)
;  a1sC  <=  m1
;  a1sD  <=  m2
;  a1sE  <=  m3
;  a1uo  <=  fsk_a1uo
;  a1us  <=  fsk_a1us
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1sC (Array String (Maybe Sorta1sB)))
; (declare-const a1sD (Array String (Maybe Sorta1sB)))
; (declare-const a1sE (Array String (Maybe Sorta1sB)))
; (declare-const a1uo (Array String (Maybe Sorta1sB)))
; (declare-const a1us (Array String (Maybe Sorta1sB)))
; (declare-sort Sorta1sB)
(declare-sort Sorta1sB)
(declare-const
   a1sC
   (Array
      String
      (Maybe Sorta1sB)))
(declare-const
   a1sD
   (Array
      String
      (Maybe Sorta1sB)))
(declare-const
   a1sE
   (Array
      String
      (Maybe Sorta1sB)))
(declare-const
   a1uo
   (Array
      String
      (Maybe Sorta1sB)))
(declare-const
   a1us
   (Array
      String
      (Maybe Sorta1sB)))
(assert
   (!
      (=
         (store
            a1sD
            "bob"
            (as
               nothing
               (Maybe Sorta1sB)))
         a1us)
      :named
      given-23.1))
(assert
   (!
      (=
         (store
            a1sC
            "bob"
            (as
               nothing
               (Maybe Sorta1sB)))
         a1uo)
      :named
      given-23.2))
(assert
   (!
      (= a1us a1sE)
      :named
      given-23.3))
(assert
   (!
      (= a1uo a1sD)
      :named
      given-23.4))
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a1sK} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1sD a1sE)

; WANTEDS (names)
;  a1sD  <=  m2
;  a1sE  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1sD a1sE))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a1sD
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1sB)))
;         a1us)
;      :named
;      given-23.1)
;   (!
;      (=
;         (store
;            a1sC
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1sB)))
;         a1uo)
;      :named
;      given-23.2)
;   (!
;      (= a1us a1sE)
;      :named
;      given-23.3)
;   (!
;      (= a1uo a1sD)
;      :named
;      given-23.4)
;   (!
;      (not
;         (= a1sD a1sE))
;      :named
;      wanted-23))
(get-unsat-core)
; (given-23.3 wanted-23 given-23.4 given-23.1 given-23.2)
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(exit)
(exit)
; Compiling Nat
; Compiling Nat
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3iR} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3iA,LiftedRep [])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a3iR} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3iA
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
;      [WD] hole{co_a3iR} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3iA
;    (lit "63A"))

; WANTEDS (names)
;  a3iA  <=  t_a3iA
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3iA Type)
(declare-const a3iA Type)
(assert
   (!
      (not
         (=
            a3iA
            (lit "63A")))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      a3iA
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A")))
;   (define-fun
;      wanted-1
;      ()
;      Bool
;      (not
;         (=
;            a3iA
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3iR} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3iA,LiftedRep [])

(echo "givens-start-cycle-1")
; GIVENS (conversions)
;      [WD] hole{co_a3iR} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3iA
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
;      [WD] hole{co_a3iR} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3iA
;    (lit "63A"))

; WANTEDS (names)
;  a3iA  <=  t_a3iA
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3iA Type)
(declare-const a3iA Type)
(assert
   (!
      (not
         (=
            a3iA
            (lit "63A")))
      :named
      wanted-1))
(check-sat)
; sat
(echo "wanteds-finish-cycle-1")
(get-model)
; (
;   (define-fun
;      a3iA
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A")))
;   (define-fun
;      wanted-1
;      ()
;      Bool
;      (not
;         (=
;            a3iA
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3qu} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qm,LiftedRep [])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a3qu} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qm
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
;      [WD] hole{co_a3qu} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qm
;    (lit "63A"))

; WANTEDS (names)
;  a3qm  <=  t_a3qm
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qm Type)
(declare-const a3qm Type)
(assert
   (!
      (not
         (=
            a3qm
            (lit "63A")))
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
;      (not
;         (=
;            a3qm
;            (lit "63A"))))
;   (define-fun
;      a3qm
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3qu} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qm,LiftedRep [])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a3qu} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qm
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
;      [WD] hole{co_a3qu} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qm
;    (lit "63A"))

; WANTEDS (names)
;  a3qm  <=  t_a3qm
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qm Type)
(declare-const a3qm Type)
(assert
   (!
      (not
         (=
            a3qm
            (lit "63A")))
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
;      (not
;         (=
;            a3qm
;            (lit "63A"))))
;   (define-fun
;      a3qm
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3qN} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qD,LiftedRep [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a3qN} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qD
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
;      [WD] hole{co_a3qN} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qD
;    (lit "63A"))

; WANTEDS (names)
;  a3qD  <=  t_a3qD
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qD Type)
(declare-const a3qD Type)
(assert
   (!
      (not
         (=
            a3qD
            (lit "63A")))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (not
;         (=
;            a3qD
;            (lit "63A"))))
;   (define-fun
;      a3qD
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3qN} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qD,LiftedRep [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a3qN} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qD
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
;      [WD] hole{co_a3qN} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qD
;    (lit "63A"))

; WANTEDS (names)
;  a3qD  <=  t_a3qD
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qD Type)
(declare-const a3qD Type)
(assert
   (!
      (not
         (=
            a3qD
            (lit "63A")))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (not
;         (=
;            a3qD
;            (lit "63A"))))
;   (define-fun
;      a3qD
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3r9} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qY,LiftedRep [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a3r9} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qY
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a3r9} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qY
;    (lit "63A"))

; WANTEDS (names)
;  a3qY  <=  t_a3qY
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qY Type)
(declare-const a3qY Type)
(assert
   (!
      (not
         (=
            a3qY
            (lit "63A")))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (define-fun
;      wanted-5
;      ()
;      Bool
;      (not
;         (=
;            a3qY
;            (lit "63A"))))
;   (define-fun
;      a3qY
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3r9} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qY,LiftedRep [])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a3r9} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qY
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a3r9} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qY
;    (lit "63A"))

; WANTEDS (names)
;  a3qY  <=  t_a3qY
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qY Type)
(declare-const a3qY Type)
(assert
   (!
      (not
         (=
            a3qY
            (lit "63A")))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (define-fun
;      wanted-5
;      ()
;      Bool
;      (not
;         (=
;            a3qY
;            (lit "63A"))))
;   (define-fun
;      a3qY
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3rD} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3rm,LiftedRep [])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a3rD} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3rm
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
;      [WD] hole{co_a3rD} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3rm
;    (lit "63A"))

; WANTEDS (names)
;  a3rm  <=  t_a3rm
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3rm Type)
(declare-const a3rm Type)
(assert
   (!
      (not
         (=
            a3rm
            (lit "63A")))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (define-fun
;      a3rm
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A")))
;   (define-fun
;      wanted-6
;      ()
;      Bool
;      (not
;         (=
;            a3rm
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3rD} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3rm,LiftedRep [])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a3rD} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3rm
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
;      [WD] hole{co_a3rD} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3rm
;    (lit "63A"))

; WANTEDS (names)
;  a3rm  <=  t_a3rm
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3rm Type)
(declare-const a3rm Type)
(assert
   (!
      (not
         (=
            a3rm
            (lit "63A")))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (define-fun
;      a3rm
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A")))
;   (define-fun
;      wanted-6
;      ()
;      Bool
;      (not
;         (=
;            a3rm
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3s1} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a3rW} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a3s6} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3rI,a3rJ],<? [a3rL,a3rM])
; (<? [a3rK,a3rM],<? [a3rH,a3rJ])
; (<? [a3rH,a3rI],<? [a3rK,a3rL])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a3s1} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3rI a3rJ)
;    (< a3rL a3rM))

;      [WD] hole{co_a3rW} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3rK a3rM)
;    (< a3rH a3rJ))

;      [WD] hole{co_a3s6} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3rH a3rI)
;    (< a3rK a3rL))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a3s1} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3rI a3rJ)
;    (< a3rL a3rM))

;      [WD] hole{co_a3rW} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3rK a3rM)
;    (< a3rH a3rJ))

;      [WD] hole{co_a3s6} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3rH a3rI)
;    (< a3rK a3rL))

; WANTEDS (names)
;  a3rH  <=  a
;  a3rI  <=  b
;  a3rJ  <=  c
;  a3rK  <=  a_a3rK
;  a3rL  <=  b_a3rL
;  a3rM  <=  c_a3rM
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3rH))
; (assert (<= 0 a3rI))
; (assert (<= 0 a3rJ))
; (assert (<= 0 a3rK))
; (assert (<= 0 a3rL))
; (assert (<= 0 a3rM))
; (declare-const a3rH Int)
; (declare-const a3rI Int)
; (declare-const a3rJ Int)
; (declare-const a3rK Int)
; (declare-const a3rL Int)
; (declare-const a3rM Int)
(declare-const a3rH Int)
(declare-const a3rI Int)
(declare-const a3rJ Int)
(declare-const a3rK Int)
(declare-const a3rL Int)
(declare-const a3rM Int)
(assert
   (<= 0 a3rH))
(assert
   (<= 0 a3rI))
(assert
   (<= 0 a3rJ))
(assert
   (<= 0 a3rK))
(assert
   (<= 0 a3rL))
(assert
   (<= 0 a3rM))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3rI a3rJ)
                  (< a3rL a3rM)))
            (not
               (=
                  (< a3rK a3rM)
                  (< a3rH a3rJ))))
         (not
            (=
               (< a3rH a3rI)
               (< a3rK a3rL))))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (define-fun
;      a3rJ
;      ()
;      Int
;      1)
;   (define-fun
;      a3rI
;      ()
;      Int
;      0)
;   (define-fun
;      a3rM
;      ()
;      Int
;      0)
;   (define-fun
;      a3rK
;      ()
;      Int
;      0)
;   (define-fun
;      wanted-7
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (< a3rI a3rJ)
;               (< a3rL a3rM)))
;         (not
;            (=
;               (< a3rK a3rM)
;               (< a3rH a3rJ)))
;         (not
;            (=
;               (< a3rH a3rI)
;               (< a3rK a3rL)))))
;   (define-fun
;      a3rH
;      ()
;      Int
;      0)
;   (define-fun
;      a3rL
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3s1} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a3rW} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a3s6} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3rI,a3rJ],<? [a3rL,a3rM])
; (<? [a3rK,a3rM],<? [a3rH,a3rJ])
; (<? [a3rH,a3rI],<? [a3rK,a3rL])

(echo "givens-start-cycle-7")
; GIVENS (conversions)
;      [WD] hole{co_a3s1} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3rI a3rJ)
;    (< a3rL a3rM))

;      [WD] hole{co_a3rW} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3rK a3rM)
;    (< a3rH a3rJ))

;      [WD] hole{co_a3s6} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3rH a3rI)
;    (< a3rK a3rL))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
;      [WD] hole{co_a3s1} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3rI a3rJ)
;    (< a3rL a3rM))

;      [WD] hole{co_a3rW} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3rK a3rM)
;    (< a3rH a3rJ))

;      [WD] hole{co_a3s6} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3rH a3rI)
;    (< a3rK a3rL))

; WANTEDS (names)
;  a3rH  <=  a
;  a3rI  <=  b
;  a3rJ  <=  c
;  a3rK  <=  a_a3rK
;  a3rL  <=  b_a3rL
;  a3rM  <=  c_a3rM
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3rH))
; (assert (<= 0 a3rI))
; (assert (<= 0 a3rJ))
; (assert (<= 0 a3rK))
; (assert (<= 0 a3rL))
; (assert (<= 0 a3rM))
; (declare-const a3rH Int)
; (declare-const a3rI Int)
; (declare-const a3rJ Int)
; (declare-const a3rK Int)
; (declare-const a3rL Int)
; (declare-const a3rM Int)
(declare-const a3rH Int)
(declare-const a3rI Int)
(declare-const a3rJ Int)
(declare-const a3rK Int)
(declare-const a3rL Int)
(declare-const a3rM Int)
(assert
   (<= 0 a3rH))
(assert
   (<= 0 a3rI))
(assert
   (<= 0 a3rJ))
(assert
   (<= 0 a3rK))
(assert
   (<= 0 a3rL))
(assert
   (<= 0 a3rM))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3rI a3rJ)
                  (< a3rL a3rM)))
            (not
               (=
                  (< a3rK a3rM)
                  (< a3rH a3rJ))))
         (not
            (=
               (< a3rH a3rI)
               (< a3rK a3rL))))
      :named
      wanted-7))
(check-sat)
; sat
(echo "wanteds-finish-cycle-7")
(get-model)
; (
;   (define-fun
;      a3rJ
;      ()
;      Int
;      1)
;   (define-fun
;      a3rI
;      ()
;      Int
;      0)
;   (define-fun
;      a3rM
;      ()
;      Int
;      0)
;   (define-fun
;      a3rK
;      ()
;      Int
;      0)
;   (define-fun
;      wanted-7
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (< a3rI a3rJ)
;               (< a3rL a3rM)))
;         (not
;            (=
;               (< a3rK a3rM)
;               (< a3rH a3rJ)))
;         (not
;            (=
;               (< a3rH a3rI)
;               (< a3rK a3rL)))))
;   (define-fun
;      a3rH
;      ()
;      Int
;      0)
;   (define-fun
;      a3rL
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3sh} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3s7,LiftedRep [])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a3sh} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3s7
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
;      [WD] hole{co_a3sh} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3s7
;    (lit "63A"))

; WANTEDS (names)
;  a3s7  <=  t_a3s7
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3s7 Type)
(declare-const a3s7 Type)
(assert
   (!
      (not
         (=
            a3s7
            (lit "63A")))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            a3s7
;            (lit "63A"))))
;   (define-fun
;      a3s7
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3sh} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3s7,LiftedRep [])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a3sh} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3s7
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
;      [WD] hole{co_a3sh} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3s7
;    (lit "63A"))

; WANTEDS (names)
;  a3s7  <=  t_a3s7
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3s7 Type)
(declare-const a3s7 Type)
(assert
   (!
      (not
         (=
            a3s7
            (lit "63A")))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            a3s7
;            (lit "63A"))))
;   (define-fun
;      a3s7
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3sA} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3st,LiftedRep [])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a3sA} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3st
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
;      [WD] hole{co_a3sA} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3st
;    (lit "63A"))

; WANTEDS (names)
;  a3st  <=  t_a3st
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3st Type)
(declare-const a3st Type)
(assert
   (!
      (not
         (=
            a3st
            (lit "63A")))
      :named
      wanted-9))
(check-sat)
; sat
(echo "wanteds-finish-cycle-9")
(get-model)
; (
;   (define-fun
;      a3st
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A")))
;   (define-fun
;      wanted-9
;      ()
;      Bool
;      (not
;         (=
;            a3st
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3sA} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3st,LiftedRep [])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a3sA} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3st
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
;      [WD] hole{co_a3sA} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3st
;    (lit "63A"))

; WANTEDS (names)
;  a3st  <=  t_a3st
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3st Type)
(declare-const a3st Type)
(assert
   (!
      (not
         (=
            a3st
            (lit "63A")))
      :named
      wanted-9))
(check-sat)
; sat
(echo "wanteds-finish-cycle-9")
(get-model)
; (
;   (define-fun
;      a3st
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A")))
;   (define-fun
;      wanted-9
;      ()
;      Bool
;      (not
;         (=
;            a3st
;            (lit "63A")))))
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3sQ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a3sV} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3sG,a3sH],+ [a3sE,a3sF])
; (+ [a3sH,a3sG],+ [a3sF,a3sE])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a3sQ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3sG a3sH)
;    (+ a3sE a3sF))

;      [WD] hole{co_a3sV} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3sH a3sG)
;    (+ a3sF a3sE))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a3sQ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3sG a3sH)
;    (+ a3sE a3sF))

;      [WD] hole{co_a3sV} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3sH a3sG)
;    (+ a3sF a3sE))

; WANTEDS (names)
;  a3sE  <=  a
;  a3sF  <=  b
;  a3sG  <=  a_a3sG
;  a3sH  <=  b_a3sH
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3sE))
; (assert (<= 0 a3sF))
; (assert (<= 0 a3sG))
; (assert (<= 0 a3sH))
; (declare-const a3sE Int)
; (declare-const a3sF Int)
; (declare-const a3sG Int)
; (declare-const a3sH Int)
(declare-const a3sE Int)
(declare-const a3sF Int)
(declare-const a3sG Int)
(declare-const a3sH Int)
(assert
   (<= 0 a3sE))
(assert
   (<= 0 a3sF))
(assert
   (<= 0 a3sG))
(assert
   (<= 0 a3sH))
(assert
   (!
      (or
         (not
            (=
               (+ a3sG a3sH)
               (+ a3sE a3sF)))
         (not
            (=
               (+ a3sH a3sG)
               (+ a3sF a3sE))))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (define-fun
;      a3sE
;      ()
;      Int
;      0)
;   (define-fun
;      a3sH
;      ()
;      Int
;      0)
;   (define-fun
;      a3sF
;      ()
;      Int
;      0)
;   (define-fun
;      a3sG
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a3sG a3sH)
;               (+ a3sE a3sF)))
;         (not
;            (=
;               (+ a3sH a3sG)
;               (+ a3sF a3sE))))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3sQ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a3sV} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3sG,a3sH],+ [a3sE,a3sF])
; (+ [a3sH,a3sG],+ [a3sF,a3sE])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a3sQ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3sG a3sH)
;    (+ a3sE a3sF))

;      [WD] hole{co_a3sV} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3sH a3sG)
;    (+ a3sF a3sE))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a3sQ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3sG a3sH)
;    (+ a3sE a3sF))

;      [WD] hole{co_a3sV} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3sH a3sG)
;    (+ a3sF a3sE))

; WANTEDS (names)
;  a3sE  <=  a
;  a3sF  <=  b
;  a3sG  <=  a_a3sG
;  a3sH  <=  b_a3sH
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3sE))
; (assert (<= 0 a3sF))
; (assert (<= 0 a3sG))
; (assert (<= 0 a3sH))
; (declare-const a3sE Int)
; (declare-const a3sF Int)
; (declare-const a3sG Int)
; (declare-const a3sH Int)
(declare-const a3sE Int)
(declare-const a3sF Int)
(declare-const a3sG Int)
(declare-const a3sH Int)
(assert
   (<= 0 a3sE))
(assert
   (<= 0 a3sF))
(assert
   (<= 0 a3sG))
(assert
   (<= 0 a3sH))
(assert
   (!
      (or
         (not
            (=
               (+ a3sG a3sH)
               (+ a3sE a3sF)))
         (not
            (=
               (+ a3sH a3sG)
               (+ a3sF a3sE))))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (define-fun
;      a3sE
;      ()
;      Int
;      0)
;   (define-fun
;      a3sH
;      ()
;      Int
;      0)
;   (define-fun
;      a3sF
;      ()
;      Int
;      0)
;   (define-fun
;      a3sG
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a3sG a3sH)
;               (+ a3sE a3sF)))
;         (not
;            (=
;               (+ a3sH a3sG)
;               (+ a3sF a3sE))))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3t2} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3sW,LiftedRep [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a3t2} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3sW
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a3t2} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3sW
;    (lit "63A"))

; WANTEDS (names)
;  a3sW  <=  t_a3sW
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3sW Type)
(declare-const a3sW Type)
(assert
   (!
      (not
         (=
            a3sW
            (lit "63A")))
      :named
      wanted-11))
(check-sat)
; sat
(echo "wanteds-finish-cycle-11")
(get-model)
; (
;   (define-fun
;      wanted-11
;      ()
;      Bool
;      (not
;         (=
;            a3sW
;            (lit "63A"))))
;   (define-fun
;      a3sW
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3t2} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3sW,LiftedRep [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a3t2} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3sW
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a3t2} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3sW
;    (lit "63A"))

; WANTEDS (names)
;  a3sW  <=  t_a3sW
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3sW Type)
(declare-const a3sW Type)
(assert
   (!
      (not
         (=
            a3sW
            (lit "63A")))
      :named
      wanted-11))
(check-sat)
; sat
(echo "wanteds-finish-cycle-11")
(get-model)
; (
;   (define-fun
;      wanted-11
;      ()
;      Bool
;      (not
;         (=
;            a3sW
;            (lit "63A"))))
;   (define-fun
;      a3sW
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] co_a3AP {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3AS {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3AQ {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a3AT {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3AZ} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3tA],a3AO)
; (+ [1,a3tC],a3AR)
; (a3AO,a3to)
; (a3AR,a3tp)

; WANTEDS (Thoralf style)
; (- [a3tC,a3tA],- [a3tp,a3to])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a3AZ} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3tC a3tA)
;    (- a3tp a3to))

; GIVENS (names)
;  a3to  <=  n
;  a3tp  <=  m
;  a3tA  <=  n
;  a3tC  <=  n
;  a3AO  <=  fsk_a3AO
;  a3AR  <=  fsk_a3AR
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3AO))
; (assert (<= 0 a3AR))
; (assert (<= 0 a3tA))
; (assert (<= 0 a3tC))
; (assert (<= 0 a3to))
; (assert (<= 0 a3tp))
; (declare-const a3AO Int)
; (declare-const a3AR Int)
; (declare-const a3tA Int)
; (declare-const a3tC Int)
; (declare-const a3to Int)
; (declare-const a3tp Int)
(declare-const a3to Int)
(declare-const a3tp Int)
(declare-const a3tA Int)
(declare-const a3tC Int)
(declare-const a3AO Int)
(declare-const a3AR Int)
(assert
   (<= 0 a3to))
(assert
   (<= 0 a3tp))
(assert
   (<= 0 a3tA))
(assert
   (<= 0 a3tC))
(assert
   (<= 0 a3AO))
(assert
   (<= 0 a3AR))
(assert
   (!
      (=
         (+ 1 a3tA)
         a3AO)
      :named
      given-17.1))
(assert
   (!
      (=
         (+ 1 a3tC)
         a3AR)
      :named
      given-17.2))
(assert
   (!
      (= a3AO a3to)
      :named
      given-17.3))
(assert
   (!
      (= a3AR a3tp)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a3AZ} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3tC a3tA)
;    (- a3tp a3to))

; WANTEDS (names)
;  a3to  <=  n
;  a3tp  <=  m
;  a3tA  <=  n
;  a3tC  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a3tC a3tA)
            (- a3tp a3to)))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (<= 0 a3to)
;   (<= 0 a3tp)
;   (<= 0 a3tA)
;   (<= 0 a3tC)
;   (<= 0 a3AO)
;   (<= 0 a3AR)
;   (!
;      (=
;         (+ 1 a3tA)
;         a3AO)
;      :named
;      given-17.1)
;   (!
;      (=
;         (+ 1 a3tC)
;         a3AR)
;      :named
;      given-17.2)
;   (!
;      (= a3AO a3to)
;      :named
;      given-17.3)
;   (!
;      (= a3AR a3tp)
;      :named
;      given-17.4)
;   (!
;      (not
;         (=
;            (- a3tC a3tA)
;            (- a3tp a3to)))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.3 given-17.2 given-17.4 given-17.1 wanted-17)
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; [G] co_a3Bd {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3Be {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Bm} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3uw],a3Bc)
; (a3Bc,a3up)

; WANTEDS (Thoralf style)
; (+ [1,+ [a3uw,a3ur]],+ [a3up,a3ur])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{co_a3Bm} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3uw a3ur))
;    (+ a3up a3ur))

; GIVENS (names)
;  a3up  <=  n
;  a3uw  <=  n
;  a3Bc  <=  fsk_a3Bc
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3Bc))
; (assert (<= 0 a3up))
; (assert (<= 0 a3uw))
; (declare-const a3Bc Int)
; (declare-const a3up Int)
; (declare-const a3uw Int)
(declare-const a3up Int)
(declare-const a3uw Int)
(declare-const a3Bc Int)
(assert
   (<= 0 a3up))
(assert
   (<= 0 a3uw))
(assert
   (<= 0 a3Bc))
(assert
   (!
      (=
         (+ 1 a3uw)
         a3Bc)
      :named
      given-24.1))
(assert
   (!
      (= a3Bc a3up)
      :named
      given-24.2))
(check-sat)
; sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
;      [WD] hole{co_a3Bm} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3uw a3ur))
;    (+ a3up a3ur))

; WANTEDS (names)
;  a3up  <=  n
;  a3ur  <=  m
;  a3uw  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3ur))
; (declare-const a3ur Int)
(declare-const a3ur Int)
(assert
   (<= 0 a3ur))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a3uw a3ur))
            (+ a3up a3ur)))
      :named
      wanted-24))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-24")
(get-assertions)
; (
;   (<= 0 a3up)
;   (<= 0 a3uw)
;   (<= 0 a3Bc)
;   (!
;      (=
;         (+ 1 a3uw)
;         a3Bc)
;      :named
;      given-24.1)
;   (!
;      (= a3Bc a3up)
;      :named
;      given-24.2)
;   (<= 0 a3ur)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a3uw a3ur))
;            (+ a3up a3ur)))
;      :named
;      wanted-24))
(get-unsat-core)
; (given-24.1 given-24.2 wanted-24)
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-24")
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-25")
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-26")
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-27")

; GIVENS (GHC style)
; [G] co_a3Bo {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a3Br {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a3Bp {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a3Bs {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Bw} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3yL,a3yM],a3Bn)
; (<? [a3yM,a3yN],a3Bq)
; (a3Bn,True [])
; (a3Bq,True [])

; WANTEDS (Thoralf style)
; (<? [a3yL,a3yN],True [])

(echo "givens-start-cycle-27")
; GIVENS (conversions)
;      [WD] hole{co_a3Bw} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3yL a3yN)
;    true)

; GIVENS (names)
;  a3yL  <=  a
;  a3yM  <=  b
;  a3yN  <=  c
;  a3Bn  <=  fsk_a3Bn
;  a3Bq  <=  fsk_a3Bq
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3yL))
; (assert (<= 0 a3yM))
; (assert (<= 0 a3yN))
; (declare-const a3Bn Bool)
; (declare-const a3Bq Bool)
; (declare-const a3yL Int)
; (declare-const a3yM Int)
; (declare-const a3yN Int)
(declare-const a3yL Int)
(declare-const a3yM Int)
(declare-const a3yN Int)
(declare-const a3Bn Bool)
(declare-const a3Bq Bool)
(assert
   (<= 0 a3yL))
(assert
   (<= 0 a3yM))
(assert
   (<= 0 a3yN))
(assert
   (!
      (=
         (< a3yL a3yM)
         a3Bn)
      :named
      given-27.1))
(assert
   (!
      (=
         (< a3yM a3yN)
         a3Bq)
      :named
      given-27.2))
(assert
   (!
      (= a3Bn true)
      :named
      given-27.3))
(assert
   (!
      (= a3Bq true)
      :named
      given-27.4))
(check-sat)
; sat
(echo "givens-finish-cycle-27")
(echo "wanteds-start-cycle-27")
; WANTEDS (conversions)
;      [WD] hole{co_a3Bw} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3yL a3yN)
;    true)

; WANTEDS (names)
;  a3yL  <=  a
;  a3yN  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a3yL a3yN)
            true))
      :named
      wanted-27))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-27")
(get-assertions)
; (
;   (<= 0 a3yL)
;   (<= 0 a3yM)
;   (<= 0 a3yN)
;   (!
;      (=
;         (< a3yL a3yM)
;         a3Bn)
;      :named
;      given-27.1)
;   (!
;      (=
;         (< a3yM a3yN)
;         a3Bq)
;      :named
;      given-27.2)
;   (!
;      (= a3Bn true)
;      :named
;      given-27.3)
;   (!
;      (= a3Bq true)
;      :named
;      given-27.4)
;   (!
;      (not
;         (=
;            (< a3yL a3yN)
;            true))
;      :named
;      wanted-27))
(get-unsat-core)
; (given-27.4 given-27.3 wanted-27 given-27.2 given-27.1)
(pop 1)
(echo "solver-finish-cycle-27")
(echo "solver-start-cycle-27")
(echo "solver-finish-cycle-27")
(echo "solver-start-cycle-28")
(echo "solver-finish-cycle-28")
(echo "solver-start-cycle-28")
(echo "solver-finish-cycle-28")
(echo "solver-start-cycle-29")

; GIVENS (GHC style)
; [G] co_a3BA {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a3By {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a3z0 {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3z3} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3yX,a3yY],a3Bz)
; (+ [a3yX,a3yX],a3Bx)
; (a3Bx,a3Bz)

; WANTEDS (Thoralf style)
; (a3yX,a3yY)

(echo "givens-start-cycle-29")
; GIVENS (conversions)
;      [WD] hole{co_a3z3} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3yX a3yY)

; GIVENS (names)
;  a3yX  <=  a
;  a3yY  <=  b
;  a3Bx  <=  fsk_a3Bx
;  a3Bz  <=  fsk_a3Bz
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3Bx))
; (assert (<= 0 a3Bz))
; (assert (<= 0 a3yX))
; (assert (<= 0 a3yY))
; (declare-const a3Bx Int)
; (declare-const a3Bz Int)
; (declare-const a3yX Int)
; (declare-const a3yY Int)
(declare-const a3yX Int)
(declare-const a3yY Int)
(declare-const a3Bx Int)
(declare-const a3Bz Int)
(assert
   (<= 0 a3yX))
(assert
   (<= 0 a3yY))
(assert
   (<= 0 a3Bx))
(assert
   (<= 0 a3Bz))
(assert
   (!
      (=
         (+ a3yX a3yY)
         a3Bz)
      :named
      given-29.1))
(assert
   (!
      (=
         (+ a3yX a3yX)
         a3Bx)
      :named
      given-29.2))
(assert
   (!
      (= a3Bx a3Bz)
      :named
      given-29.3))
(check-sat)
; sat
(echo "givens-finish-cycle-29")
(echo "wanteds-start-cycle-29")
; WANTEDS (conversions)
;      [WD] hole{co_a3z3} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3yX a3yY)

; WANTEDS (names)
;  a3yX  <=  a
;  a3yY  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a3yX a3yY))
      :named
      wanted-29))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-29")
(get-assertions)
; (
;   (<= 0 a3yX)
;   (<= 0 a3yY)
;   (<= 0 a3Bx)
;   (<= 0 a3Bz)
;   (!
;      (=
;         (+ a3yX a3yY)
;         a3Bz)
;      :named
;      given-29.1)
;   (!
;      (=
;         (+ a3yX a3yX)
;         a3Bx)
;      :named
;      given-29.2)
;   (!
;      (= a3Bx a3Bz)
;      :named
;      given-29.3)
;   (!
;      (not
;         (= a3yX a3yY))
;      :named
;      wanted-29))
(get-unsat-core)
; (given-29.2 given-29.1 wanted-29 given-29.3)
(pop 1)
(echo "solver-finish-cycle-29")
(echo "solver-start-cycle-29")
(echo "solver-finish-cycle-29")
(echo "solver-start-cycle-30")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3BE} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3z6,a3z7],+ [a3z7,a3z6])

(echo "givens-start-cycle-30")
; GIVENS (conversions)
;      [WD] hole{co_a3BE} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3z6 a3z7)
;    (+ a3z7 a3z6))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-30")
(echo "wanteds-start-cycle-30")
; WANTEDS (conversions)
;      [WD] hole{co_a3BE} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3z6 a3z7)
;    (+ a3z7 a3z6))

; WANTEDS (names)
;  a3z6  <=  a
;  a3z7  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3z6))
; (assert (<= 0 a3z7))
; (declare-const a3z6 Int)
; (declare-const a3z7 Int)
(declare-const a3z6 Int)
(declare-const a3z7 Int)
(assert
   (<= 0 a3z6))
(assert
   (<= 0 a3z7))
(assert
   (!
      (not
         (=
            (+ a3z6 a3z7)
            (+ a3z7 a3z6)))
      :named
      wanted-30))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-30")
(get-assertions)
; (
;   (<= 0 a3z6)
;   (<= 0 a3z7)
;   (!
;      (not
;         (=
;            (+ a3z6 a3z7)
;            (+ a3z7 a3z6)))
;      :named
;      wanted-30))
(get-unsat-core)
; (wanted-30)
(pop 1)
(echo "solver-finish-cycle-30")
(echo "solver-start-cycle-30")
(echo "solver-finish-cycle-30")
(echo "solver-start-cycle-31")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3BM} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ze,1],+ [1,a3ze])

(echo "givens-start-cycle-31")
; GIVENS (conversions)
;      [WD] hole{co_a3BM} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3ze 1)
;    (+ 1 a3ze))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-31")
(echo "wanteds-start-cycle-31")
; WANTEDS (conversions)
;      [WD] hole{co_a3BM} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3ze 1)
;    (+ 1 a3ze))

; WANTEDS (names)
;  a3ze  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3ze))
; (declare-const a3ze Int)
(declare-const a3ze Int)
(assert
   (<= 0 a3ze))
(assert
   (!
      (not
         (=
            (+ a3ze 1)
            (+ 1 a3ze)))
      :named
      wanted-31))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-31")
(get-assertions)
; (
;   (<= 0 a3ze)
;   (!
;      (not
;         (=
;            (+ a3ze 1)
;            (+ 1 a3ze)))
;      :named
;      wanted-31))
(get-unsat-core)
; (wanted-31)
(pop 1)
(echo "solver-finish-cycle-31")
(echo "solver-start-cycle-31")
(echo "solver-finish-cycle-31")
(echo "solver-start-cycle-32")
(echo "solver-finish-cycle-32")
(echo "solver-start-cycle-32")
(echo "solver-finish-cycle-32")
(echo "solver-start-cycle-33")
(echo "solver-finish-cycle-33")
(echo "solver-start-cycle-33")
(echo "solver-finish-cycle-33")
(echo "solver-start-cycle-34")
(echo "solver-finish-cycle-34")
(echo "solver-start-cycle-34")
(echo "solver-finish-cycle-34")
(exit)
(exit)
; Compiling RowTypes
; Compiling RowTypes
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-models true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
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
(echo "solver-start-cycle-1")
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-1")
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a5ab} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a5a1,LiftedRep [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a5ab} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a5a1
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
;      [WD] hole{co_a5ab} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a5a1
;    (lit "63A"))

; WANTEDS (names)
;  a5a1  <=  t_a5a1
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a5a1 Type)
(declare-const a5a1 Type)
(assert
   (!
      (not
         (=
            a5a1
            (lit "63A")))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (not
;         (=
;            a5a1
;            (lit "63A"))))
;   (define-fun
;      a5a1
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a5ab} {1}:: 'LiftedRep ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a5a1,LiftedRep [])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a5ab} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a5a1
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
;      [WD] hole{co_a5ab} {1}:: 'LiftedRep
;                               ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a5a1
;    (lit "63A"))

; WANTEDS (names)
;  a5a1  <=  t_a5a1
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a5a1 Type)
(declare-const a5a1 Type)
(assert
   (!
      (not
         (=
            a5a1
            (lit "63A")))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (not
;         (=
;            a5a1
;            (lit "63A"))))
;   (define-fun
;      a5a1
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a5eb} {2}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a5dW} {2}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a5eb} {2}:: Alter
;                                 (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                               ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
;  =>  (=
;    (store
;       (store
;          (store
;             (
;               (as
;                  const
;                  (Array
;                     String
;                     (Maybe Type)))
;               nothing)
;             "price"
;             (just
;                (lit "3u")))
;          "make"
;          (just
;             (apply
;                (lit "3M")
;                (lit "3g"))))
;       "price"
;       (just
;          (lit "3u")))
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  String
;                  (Maybe Type)))
;            nothing)
;          "price"
;          (just
;             (lit "3u")))
;       "make"
;       (just
;          (apply
;             (lit "3M")
;             (lit "3g")))))

;      [WD] hole{co_a5dW} {2}:: Alter
;                                 (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                               ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)
;  =>  (=
;    (store
;       (store
;          (store
;             (
;               (as
;                  const
;                  (Array
;                     String
;                     (Maybe Type)))
;               nothing)
;             "pilot"
;             (just
;                (apply
;                   (lit "3M")
;                   (lit "3g"))))
;          "price"
;          (just
;             (lit "3u")))
;       "price"
;       (just
;          (lit "3u")))
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  String
;                  (Maybe Type)))
;            nothing)
;          "pilot"
;          (just
;             (apply
;                (lit "3M")
;                (lit "3g"))))
;       "price"
;       (just
;          (lit "3u"))))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a5eb} {2}:: Alter
;                                 (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                               ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
;  =>  (=
;    (store
;       (store
;          (store
;             (
;               (as
;                  const
;                  (Array
;                     String
;                     (Maybe Type)))
;               nothing)
;             "price"
;             (just
;                (lit "3u")))
;          "make"
;          (just
;             (apply
;                (lit "3M")
;                (lit "3g"))))
;       "price"
;       (just
;          (lit "3u")))
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  String
;                  (Maybe Type)))
;            nothing)
;          "price"
;          (just
;             (lit "3u")))
;       "make"
;       (just
;          (apply
;             (lit "3M")
;             (lit "3g")))))

;      [WD] hole{co_a5dW} {2}:: Alter
;                                 (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                               ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)
;  =>  (=
;    (store
;       (store
;          (store
;             (
;               (as
;                  const
;                  (Array
;                     String
;                     (Maybe Type)))
;               nothing)
;             "pilot"
;             (just
;                (apply
;                   (lit "3M")
;                   (lit "3g"))))
;          "price"
;          (just
;             (lit "3u")))
;       "price"
;       (just
;          (lit "3u")))
;    (store
;       (store
;          (
;            (as
;               const
;               (Array
;                  String
;                  (Maybe Type)))
;            nothing)
;          "pilot"
;          (just
;             (apply
;                (lit "3M")
;                (lit "3g"))))
;       "price"
;       (just
;          (lit "3u"))))

; WANTEDS (names)
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (or
         (not
            (=
               (store
                  (store
                     (store
                        (
                          (as
                             const
                             (Array
                                String
                                (Maybe Type)))
                          nothing)
                        "price"
                        (just
                           (lit "3u")))
                     "make"
                     (just
                        (apply
                           (lit "3M")
                           (lit "3g"))))
                  "price"
                  (just
                     (lit "3u")))
               (store
                  (store
                     (
                       (as
                          const
                          (Array
                             String
                             (Maybe Type)))
                       nothing)
                     "price"
                     (just
                        (lit "3u")))
                  "make"
                  (just
                     (apply
                        (lit "3M")
                        (lit "3g"))))))
         (not
            (=
               (store
                  (store
                     (store
                        (
                          (as
                             const
                             (Array
                                String
                                (Maybe Type)))
                          nothing)
                        "pilot"
                        (just
                           (apply
                              (lit "3M")
                              (lit "3g"))))
                     "price"
                     (just
                        (lit "3u")))
                  "price"
                  (just
                     (lit "3u")))
               (store
                  (store
                     (
                       (as
                          const
                          (Array
                             String
                             (Maybe Type)))
                       nothing)
                     "pilot"
                     (just
                        (apply
                           (lit "3M")
                           (lit "3g"))))
                  "price"
                  (just
                     (lit "3u"))))))
      :named
      wanted-6))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-6")
(get-assertions)
; (
;   (!
;      (or
;         (not
;            (=
;               (store
;                  (store
;                     (store
;                        (
;                          (as
;                             const
;                             (Array
;                                String
;                                (Maybe Type)))
;                          nothing)
;                        "price"
;                        (just
;                           (lit "3u")))
;                     "make"
;                     (just
;                        (apply
;                           (lit "3M")
;                           (lit "3g"))))
;                  "price"
;                  (just
;                     (lit "3u")))
;               (store
;                  (store
;                     (
;                       (as
;                          const
;                          (Array
;                             String
;                             (Maybe Type)))
;                       nothing)
;                     "price"
;                     (just
;                        (lit "3u")))
;                  "make"
;                  (just
;                     (apply
;                        (lit "3M")
;                        (lit "3g"))))))
;         (not
;            (=
;               (store
;                  (store
;                     (store
;                        (
;                          (as
;                             const
;                             (Array
;                                String
;                                (Maybe Type)))
;                          nothing)
;                        "pilot"
;                        (just
;                           (apply
;                              (lit "3M")
;                              (lit "3g"))))
;                     "price"
;                     (just
;                        (lit "3u")))
;                  "price"
;                  (just
;                     (lit "3u")))
;               (store
;                  (store
;                     (
;                       (as
;                          const
;                          (Array
;                             String
;                             (Maybe Type)))
;                       nothing)
;                     "pilot"
;                     (just
;                        (apply
;                           (lit "3M")
;                           (lit "3g"))))
;                  "price"
;                  (just
;                     (lit "3u"))))))
;      :named
;      wanted-6))
(get-unsat-core)
; (wanted-6)
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] co_a5f0 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5f7 {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] co_a5f1 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5f8 {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5ff} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bw,"price",Int []],a5eZ)
; (Delete [Symbol [],TYPE [LiftedRep []],a5bz,a5bA],a5f6)
; (a5eZ,a5bw)
; (a5f6,a5bw)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bz,"price",Int []],a5bz)

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a5ff} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bz
;       "price"
;       (just
;          (lit "3u")))
;    a5bz)

; GIVENS (names)
;  a5bw  <=  m
;  a5bz  <=  m
;  a5bA  <=  field
;  a5eZ  <=  fsk_a5eZ
;  a5f6  <=  fsk_a5f6
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a5bA String)
; (declare-const a5bw (Array String (Maybe Type)))
; (declare-const a5bz (Array String (Maybe Type)))
; (declare-const a5eZ (Array String (Maybe Type)))
; (declare-const a5f6 (Array String (Maybe Type)))
(declare-const
   a5bw
   (Array
      String
      (Maybe Type)))
(declare-const
   a5bz
   (Array
      String
      (Maybe Type)))
(declare-const a5bA String)
(declare-const
   a5eZ
   (Array
      String
      (Maybe Type)))
(declare-const
   a5f6
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5bw
            "price"
            (just
               (lit "3u")))
         a5eZ)
      :named
      given-9.1))
(assert
   (!
      (=
         (store
            a5bz
            a5bA
            (as
               nothing
               (Maybe Type)))
         a5f6)
      :named
      given-9.2))
(assert
   (!
      (= a5eZ a5bw)
      :named
      given-9.3))
(assert
   (!
      (= a5f6 a5bw)
      :named
      given-9.4))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a5ff} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bz
;       "price"
;       (just
;          (lit "3u")))
;    a5bz)

; WANTEDS (names)
;  a5bz  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5bz
               "price"
               (just
                  (lit "3u")))
            a5bz))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a5bw
;            "price"
;            (just
;               (lit "3u")))
;         a5eZ)
;      :named
;      given-9.1)
;   (!
;      (=
;         (store
;            a5bz
;            a5bA
;            (as
;               nothing
;               (Maybe Type)))
;         a5f6)
;      :named
;      given-9.2)
;   (!
;      (= a5eZ a5bw)
;      :named
;      given-9.3)
;   (!
;      (= a5f6 a5bw)
;      :named
;      given-9.4)
;   (!
;      (not
;         (=
;            (store
;               a5bz
;               "price"
;               (just
;                  (lit "3u")))
;            a5bz))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.2 given-9.4 given-9.3 given-9.1 wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] co_a5f0 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5fo {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] co_a5fk {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5f1 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5fn {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5c4} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bw,"price",Int []],a5eZ)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bG,"price",a5bI],a5fi)
; (a5fi,a5bw)
; (a5eZ,a5bw)
; (a5bH,"price")

; WANTEDS (Thoralf style)
; (a5bI,Int [])

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] hole{co_a5c4} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5bI
;    (lit "3u"))

; GIVENS (names)
;  a5bw  <=  m
;  a5bG  <=  m
;  a5bH  <=  field
;  a5bI  <=  val
;  a5eZ  <=  fsk_a5eZ
;  a5fi  <=  fsk_a5fi
(push 1)
; DECS1 (seen) 
; (declare-const a5bw (Array String (Maybe Type)))
; (declare-const a5eZ (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a5bG (Array String (Maybe Type)))
; (declare-const a5bH String)
; (declare-const a5bI Type)
; (declare-const a5fi (Array String (Maybe Type)))
(declare-const
   a5bw
   (Array
      String
      (Maybe Type)))
(declare-const
   a5bG
   (Array
      String
      (Maybe Type)))
(declare-const a5bH String)
(declare-const a5bI Type)
(declare-const
   a5eZ
   (Array
      String
      (Maybe Type)))
(declare-const
   a5fi
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5bw
            "price"
            (just
               (lit "3u")))
         a5eZ)
      :named
      given-12.1))
(assert
   (!
      (=
         (store
            a5bG
            "price"
            (just a5bI))
         a5fi)
      :named
      given-12.2))
(assert
   (!
      (= a5fi a5bw)
      :named
      given-12.3))
(assert
   (!
      (= a5eZ a5bw)
      :named
      given-12.4))
(assert
   (!
      (= a5bH "price")
      :named
      given-12.5))
(check-sat)
; sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] hole{co_a5c4} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5bI
;    (lit "3u"))

; WANTEDS (names)
;  a5bI  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a5bI
            (lit "3u")))
      :named
      wanted-12))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-12")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a5bw
;            "price"
;            (just
;               (lit "3u")))
;         a5eZ)
;      :named
;      given-12.1)
;   (!
;      (=
;         (store
;            a5bG
;            "price"
;            (just a5bI))
;         a5fi)
;      :named
;      given-12.2)
;   (!
;      (= a5fi a5bw)
;      :named
;      given-12.3)
;   (!
;      (= a5eZ a5bw)
;      :named
;      given-12.4)
;   (!
;      (= a5bH "price")
;      :named
;      given-12.5)
;   (!
;      (not
;         (=
;            a5bI
;            (lit "3u")))
;      :named
;      wanted-12))
(get-unsat-core)
; (given-12.2 given-12.3 given-12.4 given-12.1 wanted-12)
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] $dDisEquality_a5c6 {0}:: DisEquality field "price" (CDictCan)
; [G] co_a5f0 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5fj {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] co_a5f1 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5fk {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5ft} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5c6 {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bw,"price",Int []],a5eZ)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bG,a5bH,a5bI],a5fi)
; (a5eZ,a5bw)
; (a5fi,a5bw)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bG,"price",Int []],a5bG)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_a5ft} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bG
;       "price"
;       (just
;          (lit "3u")))
;    a5bG)

; GIVENS (names)
;  a5bw  <=  m
;  a5bG  <=  m
;  a5bH  <=  field
;  a5bI  <=  val
;  a5eZ  <=  fsk_a5eZ
;  a5fi  <=  fsk_a5fi
(push 1)
; DECS1 (seen) 
; (declare-const a5bG (Array String (Maybe Type)))
; (declare-const a5bH String)
; (declare-const a5bI Type)
; (declare-const a5bw (Array String (Maybe Type)))
; (declare-const a5eZ (Array String (Maybe Type)))
; (declare-const a5fi (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a5bw
   (Array
      String
      (Maybe Type)))
(declare-const
   a5bG
   (Array
      String
      (Maybe Type)))
(declare-const a5bH String)
(declare-const a5bI Type)
(declare-const
   a5eZ
   (Array
      String
      (Maybe Type)))
(declare-const
   a5fi
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5bH "price"))
      :named
      given-14.1))
(assert
   (!
      (=
         (store
            a5bw
            "price"
            (just
               (lit "3u")))
         a5eZ)
      :named
      given-14.2))
(assert
   (!
      (=
         (store
            a5bG
            a5bH
            (just a5bI))
         a5fi)
      :named
      given-14.3))
(assert
   (!
      (= a5eZ a5bw)
      :named
      given-14.4))
(assert
   (!
      (= a5fi a5bw)
      :named
      given-14.5))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_a5ft} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bG
;       "price"
;       (just
;          (lit "3u")))
;    a5bG)

; WANTEDS (names)
;  a5bG  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5bG
               "price"
               (just
                  (lit "3u")))
            a5bG))
      :named
      wanted-14))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-14")
(get-assertions)
; (
;   (!
;      (not
;         (= a5bH "price"))
;      :named
;      given-14.1)
;   (!
;      (=
;         (store
;            a5bw
;            "price"
;            (just
;               (lit "3u")))
;         a5eZ)
;      :named
;      given-14.2)
;   (!
;      (=
;         (store
;            a5bG
;            a5bH
;            (just a5bI))
;         a5fi)
;      :named
;      given-14.3)
;   (!
;      (= a5eZ a5bw)
;      :named
;      given-14.4)
;   (!
;      (= a5fi a5bw)
;      :named
;      given-14.5)
;   (!
;      (not
;         (=
;            (store
;               a5bG
;               "price"
;               (just
;                  (lit "3u")))
;            a5bG))
;      :named
;      wanted-14))
(get-unsat-core)
; (given-14.1
;    given-14.4
;    given-14.3
;    given-14.5
;    wanted-14
;    given-14.2)
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")
(echo "solver-finish-cycle-15")
(exit)
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
(exit)
