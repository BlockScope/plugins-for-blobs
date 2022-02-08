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
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-1")
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] co_a1dy {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1dt {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1dD {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1do {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1dz {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1dp {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1du {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1dE {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1dP} {2}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1dZ} {2}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1cU,a1cV,a1cX,a1cZ],a1dx)
; (IntersectL [a1cU,a1cV,a1cY,a1cZ],a1ds)
; (IntersectL [a1cU,a1cV,a1cW,a1d1],a1dC)
; (IntersectL [a1cU,a1cV,a1cW,a1cX],a1dn)
; (a1dx,a1d1)
; (a1dn,a1cY)
; (a1ds,a1d0)
; (a1dC,a1d2)

; WANTEDS (Thoralf style)
; (IntersectL [a1cU,a1cV,IntersectL [a1cU,a1cV,a1d9,a1da],a1dc],a1d0)
; (IntersectL [a1cU,a1cV,a1d9,IntersectL [a1cU,a1cV,a1da,a1dc]],a1d2)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1dP} {2}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1dZ} {2}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; GIVENS (names)
;  a1cW  <=  a
;  a1cX  <=  b
;  a1cY  <=  ab
;  a1cZ  <=  c
;  a1d0  <=  abc
;  a1d1  <=  bc
;  a1d2  <=  abc'
;  a1dn  <=  fsk_a1dn
;  a1ds  <=  fsk_a1ds
;  a1dx  <=  fsk_a1dx
;  a1dC  <=  fsk_a1dC
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1cV)) (y (Maybe Sorta1cV))) (=> (and ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) x) ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) y)) (= (both8569632467967046864 x y) x))))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 y (as nothing (Maybe Sorta1cV))) (as nothing (Maybe Sorta1cV)))))
; (declare-const a1cW (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cX (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cY (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cZ (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d0 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d1 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d2 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dC (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dn (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1ds (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dx (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-fun both8569632467967046864 ((Maybe Sorta1cV) (Maybe Sorta1cV)) (Maybe Sorta1cV))
; (declare-sort Sorta1cU)
; (declare-sort Sorta1cV)
(declare-sort Sorta1cU)
(declare-sort Sorta1cV)
(declare-const
   a1cW
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cX
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cY
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cZ
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d0
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d1
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d2
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dn
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1ds
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dx
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dC
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-fun
   both8569632467967046864
   (
     (Maybe Sorta1cV)
     (Maybe Sorta1cV))
   (Maybe Sorta1cV))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864
            y
            (as
               nothing
               (Maybe Sorta1cV)))
         (as
            nothing
            (Maybe Sorta1cV)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1cV))
        (y
           (Maybe Sorta1cV)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              y))
         (=
            (both8569632467967046864 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cX
           a1cZ)
         a1dx)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cY
           a1cZ)
         a1ds)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1d1)
         a1dC)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1cX)
         a1dn)
      :named
      given-2.4))
(assert
   (!
      (= a1dx a1d1)
      :named
      given-2.5))
(assert
   (!
      (= a1dn a1cY)
      :named
      given-2.6))
(assert
   (!
      (= a1ds a1d0)
      :named
      given-2.7))
(assert
   (!
      (= a1dC a1d2)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1dP} {2}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1dZ} {2}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; WANTEDS (names)
;  a1d0  <=  abc
;  a1d2  <=  abc'
;  a1d9  <=  a_a1d9
;  a1da  <=  b_a1da
;  a1dc  <=  c_a1dc
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1d9 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1da (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dc (Array Sorta1cU (Maybe Sorta1cV)))
(declare-const
   a1d9
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1da
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dc
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 (
                   (_ map both8569632467967046864)
                   a1d9
                   a1da)
                 a1dc)
               a1d0))
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 a1d9
                 (
                   (_ map both8569632467967046864)
                   a1da
                   a1dc))
               a1d2)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      Sorta1cV!val!5
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!3
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!6
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!4
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!2
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!0
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!1
;      ()
;      Sorta1cV)
;   (forall
;      (
;        (x Sorta1cV))
;      (or
;         (= x Sorta1cV!val!5)
;         (= x Sorta1cV!val!3)
;         (= x Sorta1cV!val!6)
;         (= x Sorta1cV!val!4)
;         (= x Sorta1cV!val!2)
;         (= x Sorta1cV!val!0)
;         (= x Sorta1cV!val!1)))
;   (declare-fun
;      Sorta1cU!val!0
;      ()
;      Sorta1cU)
;   (forall
;      (
;        (x Sorta1cU))
;      (= x Sorta1cU!val!0))
;   (define-fun
;      a1d1
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cX
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1dn
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= a1dn a1cY))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cY
;           a1cZ)
;         a1ds))
;   (define-fun
;      a1d9
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!0))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
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
;                      (_ map both8569632467967046864)
;                      (
;                        (_ map both8569632467967046864)
;                        a1d9
;                        a1da)
;                      a1dc)
;                    a1d0)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8569632467967046864)
;                      a1d9
;                      (
;                        (_ map both8569632467967046864)
;                        a1da
;                        a1dc))
;                    a1d2))))
;         (or a!1 a!2)))
;   (define-fun
;      a1da
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!1))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!3)))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= a1dx a1d1))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= a1ds a1d0))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= a1dC a1d2))
;   (define-fun
;      a1dC
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1d2
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1dc
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1d1)
;         a1dC))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1cX)
;         a1dn))
;   (define-fun
;      a1ds
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cX
;           a1cZ)
;         a1dx))
;   (define-fun
;      a1dx
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cZ
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cW
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!6))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!5)))
;   (define-fun
;      a1d0
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cY
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      both8569632467967046864
;      (
;        (x!0
;           (Maybe Sorta1cV))
;        (x!1
;           (Maybe Sorta1cV)))
;      (Maybe Sorta1cV)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1cV!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1cV!val!0))
;                  (=
;                     x!1
;                     (just Sorta1cV!val!1)))
;               (just Sorta1cV!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1cV!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta1cV!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1cV!val!2))
;                           (=
;                              x!1
;                              (just Sorta1cV!val!3)))
;                        (just Sorta1cV!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1cV!val!2))
;                              (=
;                                 x!1
;                                 (just Sorta1cV!val!4)))
;                           (just Sorta1cV!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1cV!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta1cV!val!3))
;                                    (=
;                                       x!1
;                                       (just Sorta1cV!val!4)))
;                                 (just Sorta1cV!val!3)
;                                 (ite
;                                    (and
;                                       (
;                                         (_ is just)
;                                         x!0)
;                                       (
;                                         (_ is just)
;                                         x!1))
;                                    x!0
;                                    nothing))))))))))))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] co_a1dy {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1dt {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1dD {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1do {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1dz {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1dp {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1du {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1dE {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1dP} {2}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1dZ} {2}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1cU,a1cV,a1cX,a1cZ],a1dx)
; (IntersectL [a1cU,a1cV,a1cY,a1cZ],a1ds)
; (IntersectL [a1cU,a1cV,a1cW,a1d1],a1dC)
; (IntersectL [a1cU,a1cV,a1cW,a1cX],a1dn)
; (a1dx,a1d1)
; (a1dn,a1cY)
; (a1ds,a1d0)
; (a1dC,a1d2)

; WANTEDS (Thoralf style)
; (IntersectL [a1cU,a1cV,IntersectL [a1cU,a1cV,a1d9,a1da],a1dc],a1d0)
; (IntersectL [a1cU,a1cV,a1d9,IntersectL [a1cU,a1cV,a1da,a1dc]],a1d2)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1dP} {2}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1dZ} {2}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; GIVENS (names)
;  a1cW  <=  a
;  a1cX  <=  b
;  a1cY  <=  ab
;  a1cZ  <=  c
;  a1d0  <=  abc
;  a1d1  <=  bc
;  a1d2  <=  abc'
;  a1dn  <=  fsk_a1dn
;  a1ds  <=  fsk_a1ds
;  a1dx  <=  fsk_a1dx
;  a1dC  <=  fsk_a1dC
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1cV)) (y (Maybe Sorta1cV))) (=> (and ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) x) ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) y)) (= (both8569632467967046864 x y) x))))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 y (as nothing (Maybe Sorta1cV))) (as nothing (Maybe Sorta1cV)))))
; (declare-const a1cW (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cX (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cY (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cZ (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d0 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d1 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d2 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dC (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dn (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1ds (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dx (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-fun both8569632467967046864 ((Maybe Sorta1cV) (Maybe Sorta1cV)) (Maybe Sorta1cV))
; (declare-sort Sorta1cU)
; (declare-sort Sorta1cV)
(declare-sort Sorta1cU)
(declare-sort Sorta1cV)
(declare-const
   a1cW
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cX
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cY
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cZ
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d0
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d1
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d2
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dn
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1ds
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dx
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dC
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-fun
   both8569632467967046864
   (
     (Maybe Sorta1cV)
     (Maybe Sorta1cV))
   (Maybe Sorta1cV))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864
            y
            (as
               nothing
               (Maybe Sorta1cV)))
         (as
            nothing
            (Maybe Sorta1cV)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1cV))
        (y
           (Maybe Sorta1cV)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              y))
         (=
            (both8569632467967046864 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cX
           a1cZ)
         a1dx)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cY
           a1cZ)
         a1ds)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1d1)
         a1dC)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1cX)
         a1dn)
      :named
      given-2.4))
(assert
   (!
      (= a1dx a1d1)
      :named
      given-2.5))
(assert
   (!
      (= a1dn a1cY)
      :named
      given-2.6))
(assert
   (!
      (= a1ds a1d0)
      :named
      given-2.7))
(assert
   (!
      (= a1dC a1d2)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1dP} {2}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1dZ} {2}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; WANTEDS (names)
;  a1d0  <=  abc
;  a1d2  <=  abc'
;  a1d9  <=  a_a1d9
;  a1da  <=  b_a1da
;  a1dc  <=  c_a1dc
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1d9 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1da (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dc (Array Sorta1cU (Maybe Sorta1cV)))
(declare-const
   a1d9
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1da
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dc
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 (
                   (_ map both8569632467967046864)
                   a1d9
                   a1da)
                 a1dc)
               a1d0))
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 a1d9
                 (
                   (_ map both8569632467967046864)
                   a1da
                   a1dc))
               a1d2)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      Sorta1cV!val!5
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!3
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!6
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!4
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!2
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!0
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!1
;      ()
;      Sorta1cV)
;   (forall
;      (
;        (x Sorta1cV))
;      (or
;         (= x Sorta1cV!val!5)
;         (= x Sorta1cV!val!3)
;         (= x Sorta1cV!val!6)
;         (= x Sorta1cV!val!4)
;         (= x Sorta1cV!val!2)
;         (= x Sorta1cV!val!0)
;         (= x Sorta1cV!val!1)))
;   (declare-fun
;      Sorta1cU!val!0
;      ()
;      Sorta1cU)
;   (forall
;      (
;        (x Sorta1cU))
;      (= x Sorta1cU!val!0))
;   (define-fun
;      a1d1
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cX
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1dn
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= a1dn a1cY))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cY
;           a1cZ)
;         a1ds))
;   (define-fun
;      a1d9
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!0))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
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
;                      (_ map both8569632467967046864)
;                      (
;                        (_ map both8569632467967046864)
;                        a1d9
;                        a1da)
;                      a1dc)
;                    a1d0)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8569632467967046864)
;                      a1d9
;                      (
;                        (_ map both8569632467967046864)
;                        a1da
;                        a1dc))
;                    a1d2))))
;         (or a!1 a!2)))
;   (define-fun
;      a1da
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!1))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!3)))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= a1dx a1d1))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= a1ds a1d0))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= a1dC a1d2))
;   (define-fun
;      a1dC
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1d2
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1dc
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1d1)
;         a1dC))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1cX)
;         a1dn))
;   (define-fun
;      a1ds
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cX
;           a1cZ)
;         a1dx))
;   (define-fun
;      a1dx
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cZ
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cW
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!6))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!5)))
;   (define-fun
;      a1d0
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1cY
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      both8569632467967046864
;      (
;        (x!0
;           (Maybe Sorta1cV))
;        (x!1
;           (Maybe Sorta1cV)))
;      (Maybe Sorta1cV)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1cV!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1cV!val!0))
;                  (=
;                     x!1
;                     (just Sorta1cV!val!1)))
;               (just Sorta1cV!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1cV!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta1cV!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1cV!val!2))
;                           (=
;                              x!1
;                              (just Sorta1cV!val!3)))
;                        (just Sorta1cV!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1cV!val!2))
;                              (=
;                                 x!1
;                                 (just Sorta1cV!val!4)))
;                           (just Sorta1cV!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1cV!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta1cV!val!3))
;                                    (=
;                                       x!1
;                                       (just Sorta1cV!val!4)))
;                                 (just Sorta1cV!val!3)
;                                 (ite
;                                    (and
;                                       (
;                                         (_ is just)
;                                         x!0)
;                                       (
;                                         (_ is just)
;                                         x!1))
;                                    x!0
;                                    nothing))))))))))))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] co_a1dy {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1dt {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1dD {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1do {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1dz {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1dp {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1du {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1dE {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1e4} {3}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1e9} {3}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1cU,a1cV,a1cX,a1cZ],a1dx)
; (IntersectL [a1cU,a1cV,a1cY,a1cZ],a1ds)
; (IntersectL [a1cU,a1cV,a1cW,a1d1],a1dC)
; (IntersectL [a1cU,a1cV,a1cW,a1cX],a1dn)
; (a1dx,a1d1)
; (a1dn,a1cY)
; (a1ds,a1d0)
; (a1dC,a1d2)

; WANTEDS (Thoralf style)
; (IntersectL [a1cU,a1cV,IntersectL [a1cU,a1cV,a1d9,a1da],a1dc],a1d0)
; (IntersectL [a1cU,a1cV,a1d9,IntersectL [a1cU,a1cV,a1da,a1dc]],a1d2)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1e4} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1e9} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; GIVENS (names)
;  a1cW  <=  a
;  a1cX  <=  b
;  a1cY  <=  ab
;  a1cZ  <=  c
;  a1d0  <=  abc
;  a1d1  <=  bc
;  a1d2  <=  abc'
;  a1dn  <=  fsk_a1dn
;  a1ds  <=  fsk_a1ds
;  a1dx  <=  fsk_a1dx
;  a1dC  <=  fsk_a1dC
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1cV)) (y (Maybe Sorta1cV))) (=> (and ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) x) ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) y)) (= (both8569632467967046864 x y) x))))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 y (as nothing (Maybe Sorta1cV))) (as nothing (Maybe Sorta1cV)))))
; (declare-const a1cW (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cX (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cY (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cZ (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d0 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d1 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d2 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dC (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dn (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1ds (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dx (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-fun both8569632467967046864 ((Maybe Sorta1cV) (Maybe Sorta1cV)) (Maybe Sorta1cV))
; (declare-sort Sorta1cU)
; (declare-sort Sorta1cV)
; DECS1 (unseen) 
(declare-sort Sorta1cU)
(declare-sort Sorta1cV)
(declare-const
   a1cW
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cX
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cY
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cZ
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d0
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d1
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d2
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dn
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1ds
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dx
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dC
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-fun
   both8569632467967046864
   (
     (Maybe Sorta1cV)
     (Maybe Sorta1cV))
   (Maybe Sorta1cV))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864
            y
            (as
               nothing
               (Maybe Sorta1cV)))
         (as
            nothing
            (Maybe Sorta1cV)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1cV))
        (y
           (Maybe Sorta1cV)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              y))
         (=
            (both8569632467967046864 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cX
           a1cZ)
         a1dx)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cY
           a1cZ)
         a1ds)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1d1)
         a1dC)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1cX)
         a1dn)
      :named
      given-3.4))
(assert
   (!
      (= a1dx a1d1)
      :named
      given-3.5))
(assert
   (!
      (= a1dn a1cY)
      :named
      given-3.6))
(assert
   (!
      (= a1ds a1d0)
      :named
      given-3.7))
(assert
   (!
      (= a1dC a1d2)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1e4} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1e9} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; WANTEDS (names)
;  a1d0  <=  abc
;  a1d2  <=  abc'
;  a1d9  <=  a_a1d9
;  a1da  <=  b_a1da
;  a1dc  <=  c_a1dc
; DECS2 (seen) 
; (declare-const a1d9 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1da (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dc (Array Sorta1cU (Maybe Sorta1cV)))
; DECS2 (unseen) 
(declare-const
   a1d9
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1da
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dc
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 (
                   (_ map both8569632467967046864)
                   a1d9
                   a1da)
                 a1dc)
               a1d0))
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 a1d9
                 (
                   (_ map both8569632467967046864)
                   a1da
                   a1dc))
               a1d2)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta1cV!val!5
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!3
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!6
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!4
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!2
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!0
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!7
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!1
;      ()
;      Sorta1cV)
;   (forall
;      (
;        (x Sorta1cV))
;      (or
;         (= x Sorta1cV!val!5)
;         (= x Sorta1cV!val!3)
;         (= x Sorta1cV!val!6)
;         (= x Sorta1cV!val!4)
;         (= x Sorta1cV!val!2)
;         (= x Sorta1cV!val!0)
;         (= x Sorta1cV!val!7)
;         (= x Sorta1cV!val!1)))
;   (declare-fun
;      Sorta1cU!val!0
;      ()
;      Sorta1cU)
;   (forall
;      (
;        (x Sorta1cU))
;      (= x Sorta1cU!val!0))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cX
;           a1cZ)
;         a1dx))
;   (define-fun
;      a1cX
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      a1cY
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a1dx a1d1))
;   (define-fun
;      a1d1
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      a1dn
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a1ds a1d0))
;   (define-fun
;      a1d9
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!0))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!3)))
;   (define-fun
;      a1da
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!1))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!6)))
;   (define-fun
;      a1dc
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1dC
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      a1d2
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1cX)
;         a1dn))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1d1)
;         a1dC))
;   (define-fun
;      a1ds
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
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
;                      (_ map both8569632467967046864)
;                      (
;                        (_ map both8569632467967046864)
;                        a1d9
;                        a1da)
;                      a1dc)
;                    a1d0)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8569632467967046864)
;                      a1d9
;                      (
;                        (_ map both8569632467967046864)
;                        a1da
;                        a1dc))
;                    a1d2))))
;         (or a!1 a!2)))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a1dn a1cY))
;   (define-fun
;      a1dx
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      a1cZ
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!5)))
;   (define-fun
;      a1cW
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!7))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      a1d0
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cY
;           a1cZ)
;         a1ds))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a1dC a1d2))
;   (define-fun
;      both8569632467967046864
;      (
;        (x!0
;           (Maybe Sorta1cV))
;        (x!1
;           (Maybe Sorta1cV)))
;      (Maybe Sorta1cV)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1cV!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1cV!val!0))
;                  (=
;                     x!1
;                     (just Sorta1cV!val!1)))
;               (just Sorta1cV!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1cV!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta1cV!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1cV!val!2))
;                           (=
;                              x!1
;                              (just Sorta1cV!val!5)))
;                        (just Sorta1cV!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1cV!val!3))
;                              (=
;                                 x!1
;                                 (just Sorta1cV!val!6)))
;                           (just Sorta1cV!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1cV!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta1cV!val!4))
;                                    (=
;                                       x!1
;                                       (just Sorta1cV!val!5)))
;                                 (just Sorta1cV!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta1cV!val!2))
;                                       (=
;                                          x!1
;                                          (just Sorta1cV!val!4)))
;                                    (just Sorta1cV!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just Sorta1cV!val!6))
;                                          (= x!1 nothing))
;                                       nothing
;                                       (ite
;                                          (and
;                                             (
;                                               (_ is just)
;                                               x!0)
;                                             (
;                                               (_ is just)
;                                               x!1))
;                                          x!0
;                                          nothing))))))))))))))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] co_a1dy {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1dt {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1dD {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1do {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1dz {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1dp {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1du {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1dE {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1e4} {3}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1e9} {3}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1cU,a1cV,a1cX,a1cZ],a1dx)
; (IntersectL [a1cU,a1cV,a1cY,a1cZ],a1ds)
; (IntersectL [a1cU,a1cV,a1cW,a1d1],a1dC)
; (IntersectL [a1cU,a1cV,a1cW,a1cX],a1dn)
; (a1dx,a1d1)
; (a1dn,a1cY)
; (a1ds,a1d0)
; (a1dC,a1d2)

; WANTEDS (Thoralf style)
; (IntersectL [a1cU,a1cV,IntersectL [a1cU,a1cV,a1d9,a1da],a1dc],a1d0)
; (IntersectL [a1cU,a1cV,a1d9,IntersectL [a1cU,a1cV,a1da,a1dc]],a1d2)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1e4} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1e9} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; GIVENS (names)
;  a1cW  <=  a
;  a1cX  <=  b
;  a1cY  <=  ab
;  a1cZ  <=  c
;  a1d0  <=  abc
;  a1d1  <=  bc
;  a1d2  <=  abc'
;  a1dn  <=  fsk_a1dn
;  a1ds  <=  fsk_a1ds
;  a1dx  <=  fsk_a1dx
;  a1dC  <=  fsk_a1dC
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1cV)) (y (Maybe Sorta1cV))) (=> (and ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) x) ((_ is (just (Sorta1cV) (Maybe Sorta1cV))) y)) (= (both8569632467967046864 x y) x))))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1cV))) (= (both8569632467967046864 y (as nothing (Maybe Sorta1cV))) (as nothing (Maybe Sorta1cV)))))
; (declare-const a1cW (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cX (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cY (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1cZ (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d0 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d1 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1d2 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dC (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dn (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1ds (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dx (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-fun both8569632467967046864 ((Maybe Sorta1cV) (Maybe Sorta1cV)) (Maybe Sorta1cV))
; (declare-sort Sorta1cU)
; (declare-sort Sorta1cV)
; DECS1 (unseen) 
(declare-sort Sorta1cU)
(declare-sort Sorta1cV)
(declare-const
   a1cW
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cX
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cY
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1cZ
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d0
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d1
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1d2
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dn
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1ds
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dx
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dC
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-fun
   both8569632467967046864
   (
     (Maybe Sorta1cV)
     (Maybe Sorta1cV))
   (Maybe Sorta1cV))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864
            y
            (as
               nothing
               (Maybe Sorta1cV)))
         (as
            nothing
            (Maybe Sorta1cV)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1cV)))
      (=
         (both8569632467967046864 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1cV))
        (y
           (Maybe Sorta1cV)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1cV)
                    (Maybe Sorta1cV)))
              y))
         (=
            (both8569632467967046864 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cX
           a1cZ)
         a1dx)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cY
           a1cZ)
         a1ds)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1d1)
         a1dC)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8569632467967046864)
           a1cW
           a1cX)
         a1dn)
      :named
      given-3.4))
(assert
   (!
      (= a1dx a1d1)
      :named
      given-3.5))
(assert
   (!
      (= a1dn a1cY)
      :named
      given-3.6))
(assert
   (!
      (= a1ds a1d0)
      :named
      given-3.7))
(assert
   (!
      (= a1dC a1d2)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1e4} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      (
;        (_ map both8569632467967046864)
;        a1d9
;        a1da)
;      a1dc)
;    a1d0)

;      [WD] hole{co_a1e9} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8569632467967046864)
;      a1d9
;      (
;        (_ map both8569632467967046864)
;        a1da
;        a1dc))
;    a1d2)

; WANTEDS (names)
;  a1d0  <=  abc
;  a1d2  <=  abc'
;  a1d9  <=  a_a1d9
;  a1da  <=  b_a1da
;  a1dc  <=  c_a1dc
; DECS2 (seen) 
; (declare-const a1d9 (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1da (Array Sorta1cU (Maybe Sorta1cV)))
; (declare-const a1dc (Array Sorta1cU (Maybe Sorta1cV)))
; DECS2 (unseen) 
(declare-const
   a1d9
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1da
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(declare-const
   a1dc
   (Array
      Sorta1cU
      (Maybe Sorta1cV)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 (
                   (_ map both8569632467967046864)
                   a1d9
                   a1da)
                 a1dc)
               a1d0))
         (not
            (=
               (
                 (_ map both8569632467967046864)
                 a1d9
                 (
                   (_ map both8569632467967046864)
                   a1da
                   a1dc))
               a1d2)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta1cV!val!5
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!3
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!6
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!4
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!2
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!0
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!7
;      ()
;      Sorta1cV)
;   (declare-fun
;      Sorta1cV!val!1
;      ()
;      Sorta1cV)
;   (forall
;      (
;        (x Sorta1cV))
;      (or
;         (= x Sorta1cV!val!5)
;         (= x Sorta1cV!val!3)
;         (= x Sorta1cV!val!6)
;         (= x Sorta1cV!val!4)
;         (= x Sorta1cV!val!2)
;         (= x Sorta1cV!val!0)
;         (= x Sorta1cV!val!7)
;         (= x Sorta1cV!val!1)))
;   (declare-fun
;      Sorta1cU!val!0
;      ()
;      Sorta1cU)
;   (forall
;      (
;        (x Sorta1cU))
;      (= x Sorta1cU!val!0))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cX
;           a1cZ)
;         a1dx))
;   (define-fun
;      a1cX
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      a1cY
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a1dx a1d1))
;   (define-fun
;      a1d1
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      a1dn
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a1ds a1d0))
;   (define-fun
;      a1d9
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!0))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!3)))
;   (define-fun
;      a1da
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!1))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!6)))
;   (define-fun
;      a1dc
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (
;        (as
;           const
;           (Array
;              Sorta1cU
;              (Maybe Sorta1cV)))
;        nothing))
;   (define-fun
;      a1dC
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      a1d2
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1cX)
;         a1dn))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cW
;           a1d1)
;         a1dC))
;   (define-fun
;      a1ds
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
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
;                      (_ map both8569632467967046864)
;                      (
;                        (_ map both8569632467967046864)
;                        a1d9
;                        a1da)
;                      a1dc)
;                    a1d0)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8569632467967046864)
;                      a1d9
;                      (
;                        (_ map both8569632467967046864)
;                        a1da
;                        a1dc))
;                    a1d2))))
;         (or a!1 a!2)))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a1dn a1cY))
;   (define-fun
;      a1dx
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!4)))
;   (define-fun
;      a1cZ
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!5)))
;   (define-fun
;      a1cW
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           (just Sorta1cV!val!7))
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      a1d0
;      ()
;      (Array
;         Sorta1cU
;         (Maybe Sorta1cV))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1cU
;                 (Maybe Sorta1cV)))
;           nothing)
;         Sorta1cU!val!0
;         (just Sorta1cV!val!2)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8569632467967046864)
;           a1cY
;           a1cZ)
;         a1ds))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a1dC a1d2))
;   (define-fun
;      both8569632467967046864
;      (
;        (x!0
;           (Maybe Sorta1cV))
;        (x!1
;           (Maybe Sorta1cV)))
;      (Maybe Sorta1cV)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta1cV!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta1cV!val!0))
;                  (=
;                     x!1
;                     (just Sorta1cV!val!1)))
;               (just Sorta1cV!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta1cV!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta1cV!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1cV!val!2))
;                           (=
;                              x!1
;                              (just Sorta1cV!val!5)))
;                        (just Sorta1cV!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1cV!val!3))
;                              (=
;                                 x!1
;                                 (just Sorta1cV!val!6)))
;                           (just Sorta1cV!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta1cV!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta1cV!val!4))
;                                    (=
;                                       x!1
;                                       (just Sorta1cV!val!5)))
;                                 (just Sorta1cV!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta1cV!val!2))
;                                       (=
;                                          x!1
;                                          (just Sorta1cV!val!4)))
;                                    (just Sorta1cV!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just Sorta1cV!val!6))
;                                          (= x!1 nothing))
;                                       nothing
;                                       (ite
;                                          (and
;                                             (
;                                               (_ is just)
;                                               x!0)
;                                             (
;                                               (_ is just)
;                                               x!1))
;                                          x!0
;                                          nothing))))))))))))))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_a1fe {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1f9 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1fj {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1f4 {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1ff {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1f5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1fa {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1fk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1fv} {2}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1fF} {2}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1eA,a1eB,a1eD,a1eF],a1fd)
; (UnionL [a1eA,a1eB,a1eE,a1eF],a1f8)
; (UnionL [a1eA,a1eB,a1eC,a1eH],a1fi)
; (UnionL [a1eA,a1eB,a1eC,a1eD],a1f3)
; (a1fd,a1eH)
; (a1f3,a1eE)
; (a1f8,a1eG)
; (a1fi,a1eI)

; WANTEDS (Thoralf style)
; (UnionL [a1eA,a1eB,UnionL [a1eA,a1eB,a1eP,a1eQ],a1eS],a1eG)
; (UnionL [a1eA,a1eB,a1eP,UnionL [a1eA,a1eB,a1eQ,a1eS]],a1eI)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1fv} {2}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fF} {2}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; GIVENS (names)
;  a1eC  <=  a
;  a1eD  <=  b
;  a1eE  <=  ab
;  a1eF  <=  c
;  a1eG  <=  abc
;  a1eH  <=  bc
;  a1eI  <=  abc'
;  a1f3  <=  fsk_a1f3
;  a1f8  <=  fsk_a1f8
;  a1fd  <=  fsk_a1fd
;  a1fi  <=  fsk_a1fi
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1eB)) (y (Maybe Sorta1eB))) (=> ((_ is (just (Sorta1eB) (Maybe Sorta1eB))) x) (= (either8571572006478832634 x y) x))))
; (assert (forall ((y (Maybe Sorta1eB))) (= (either8571572006478832634 (as nothing (Maybe Sorta1eB)) y) y)))
; (declare-const a1eC (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eD (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eE (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eF (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eG (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eH (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eI (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f3 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f8 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fd (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fi (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-fun either8571572006478832634 ((Maybe Sorta1eB) (Maybe Sorta1eB)) (Maybe Sorta1eB))
; (declare-sort Sorta1eA)
; (declare-sort Sorta1eB)
(declare-sort Sorta1eA)
(declare-sort Sorta1eB)
(declare-const
   a1eC
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eD
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eE
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eF
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eG
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eH
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eI
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f3
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f8
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fd
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fi
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-fun
   either8571572006478832634
   (
     (Maybe Sorta1eB)
     (Maybe Sorta1eB))
   (Maybe Sorta1eB))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eB)))
      (=
         (either8571572006478832634
            (as
               nothing
               (Maybe Sorta1eB))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eB))
        (y
           (Maybe Sorta1eB)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eB)
                 (Maybe Sorta1eB)))
           x)
         (=
            (either8571572006478832634 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eD
           a1eF)
         a1fd)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eE
           a1eF)
         a1f8)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eH)
         a1fi)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eD)
         a1f3)
      :named
      given-5.4))
(assert
   (!
      (= a1fd a1eH)
      :named
      given-5.5))
(assert
   (!
      (= a1f3 a1eE)
      :named
      given-5.6))
(assert
   (!
      (= a1f8 a1eG)
      :named
      given-5.7))
(assert
   (!
      (= a1fi a1eI)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1fv} {2}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fF} {2}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; WANTEDS (names)
;  a1eG  <=  abc
;  a1eI  <=  abc'
;  a1eP  <=  a_a1eP
;  a1eQ  <=  b_a1eQ
;  a1eS  <=  c_a1eS
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1eP (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eQ (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eS (Array Sorta1eA (Maybe Sorta1eB)))
(declare-const
   a1eP
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eQ
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eS
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 (
                   (_ map either8571572006478832634)
                   a1eP
                   a1eQ)
                 a1eS)
               a1eG))
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 a1eP
                 (
                   (_ map either8571572006478832634)
                   a1eQ
                   a1eS))
               a1eI)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      Sorta1eA!val!0
;      ()
;      Sorta1eA)
;   (declare-fun
;      Sorta1eA!val!1
;      ()
;      Sorta1eA)
;   (forall
;      (
;        (x Sorta1eA))
;      (or
;         (= x Sorta1eA!val!0)
;         (= x Sorta1eA!val!1)))
;   (declare-fun
;      Sorta1eB!val!3
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!1
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!0
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!2
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!4
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!6
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!5
;      ()
;      Sorta1eB)
;   (forall
;      (
;        (x Sorta1eB))
;      (or
;         (= x Sorta1eB!val!3)
;         (= x Sorta1eB!val!1)
;         (= x Sorta1eB!val!0)
;         (= x Sorta1eB!val!2)
;         (= x Sorta1eB!val!4)
;         (= x Sorta1eB!val!6)
;         (= x Sorta1eB!val!5)))
;   (define-fun
;      a1eD
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            nothing)
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1eH
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      wanted-5
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      (
;                        (_ map either8571572006478832634)
;                        a1eP
;                        a1eQ)
;                      a1eS)
;                    a1eG)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      a1eP
;                      (
;                        (_ map either8571572006478832634)
;                        a1eQ
;                        a1eS))
;                    a1eI))))
;         (or a!1 a!2)))
;   (define-fun
;      a1eI
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1f3
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            nothing)
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eD
;           a1eF)
;         a1fd))
;   (define-fun
;      a1eF
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              nothing)
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eQ
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      a1eG
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eD)
;         a1f3))
;   (define-fun
;      a1eC
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= a1fi a1eI))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eH)
;         a1fi))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= a1f3 a1eE))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= a1f8 a1eG))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eE
;           a1eF)
;         a1f8))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= a1fd a1eH))
;   (define-fun
;      a1eE
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            nothing)
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1f8
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eP
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           nothing)
;         Sorta1eA!val!0
;         (just Sorta1eB!val!4)))
;   (define-fun
;      a1fd
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eS
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!0))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!6))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!3)))
;   (define-fun
;      a1fi
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta1eA))
;      (Maybe Sorta1eB)
;      (ite
;         (= x!0 Sorta1eA!val!1)
;         (just Sorta1eB!val!6)
;         (ite
;            (= x!0 Sorta1eA!val!0)
;            (just Sorta1eB!val!4)
;            (just Sorta1eB!val!0))))
;   (define-fun
;      either8571572006478832634
;      (
;        (x!0
;           (Maybe Sorta1eB))
;        (x!1
;           (Maybe Sorta1eB)))
;      (Maybe Sorta1eB)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1eB!val!5))
;            (= x!1 nothing))
;         (just Sorta1eB!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1eB!val!5)))
;            (just Sorta1eB!val!5)
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
;                        (just Sorta1eB!val!0)))
;                  (just Sorta1eB!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1eB!val!1)))
;                     (just Sorta1eB!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1eB!val!3)))
;                        (just Sorta1eB!val!3)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1eB!val!4))
;                              (=
;                                 x!1
;                                 (just Sorta1eB!val!3)))
;                           (just Sorta1eB!val!4)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1eB!val!2)))
;                              (just Sorta1eB!val!2)
;                              (ite
;                                 (and
;                                    (= x!0 nothing)
;                                    (=
;                                       x!1
;                                       (just Sorta1eB!val!6)))
;                                 (just Sorta1eB!val!6)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta1eB!val!4))
;                                       (= x!1 nothing))
;                                    (just Sorta1eB!val!4)
;                                    (ite
;                                       (
;                                         (_ is just)
;                                         x!0)
;                                       x!0
;                                       x!1))))))))))))
;   (define-fun
;      k!71
;      (
;        (x!0 Sorta1eA))
;      (Maybe Sorta1eB)
;      (ite
;         (= x!0 Sorta1eA!val!1)
;         (just Sorta1eB!val!2)
;         (ite
;            (= x!0 Sorta1eA!val!0)
;            (just Sorta1eB!val!1)
;            (just Sorta1eB!val!5)))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_a1fe {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1f9 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1fj {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1f4 {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1ff {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1f5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1fa {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1fk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1fv} {2}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1fF} {2}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1eA,a1eB,a1eD,a1eF],a1fd)
; (UnionL [a1eA,a1eB,a1eE,a1eF],a1f8)
; (UnionL [a1eA,a1eB,a1eC,a1eH],a1fi)
; (UnionL [a1eA,a1eB,a1eC,a1eD],a1f3)
; (a1fd,a1eH)
; (a1f3,a1eE)
; (a1f8,a1eG)
; (a1fi,a1eI)

; WANTEDS (Thoralf style)
; (UnionL [a1eA,a1eB,UnionL [a1eA,a1eB,a1eP,a1eQ],a1eS],a1eG)
; (UnionL [a1eA,a1eB,a1eP,UnionL [a1eA,a1eB,a1eQ,a1eS]],a1eI)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1fv} {2}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fF} {2}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; GIVENS (names)
;  a1eC  <=  a
;  a1eD  <=  b
;  a1eE  <=  ab
;  a1eF  <=  c
;  a1eG  <=  abc
;  a1eH  <=  bc
;  a1eI  <=  abc'
;  a1f3  <=  fsk_a1f3
;  a1f8  <=  fsk_a1f8
;  a1fd  <=  fsk_a1fd
;  a1fi  <=  fsk_a1fi
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1eB)) (y (Maybe Sorta1eB))) (=> ((_ is (just (Sorta1eB) (Maybe Sorta1eB))) x) (= (either8571572006478832634 x y) x))))
; (assert (forall ((y (Maybe Sorta1eB))) (= (either8571572006478832634 (as nothing (Maybe Sorta1eB)) y) y)))
; (declare-const a1eC (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eD (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eE (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eF (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eG (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eH (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eI (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f3 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f8 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fd (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fi (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-fun either8571572006478832634 ((Maybe Sorta1eB) (Maybe Sorta1eB)) (Maybe Sorta1eB))
; (declare-sort Sorta1eA)
; (declare-sort Sorta1eB)
(declare-sort Sorta1eA)
(declare-sort Sorta1eB)
(declare-const
   a1eC
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eD
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eE
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eF
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eG
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eH
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eI
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f3
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f8
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fd
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fi
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-fun
   either8571572006478832634
   (
     (Maybe Sorta1eB)
     (Maybe Sorta1eB))
   (Maybe Sorta1eB))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eB)))
      (=
         (either8571572006478832634
            (as
               nothing
               (Maybe Sorta1eB))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eB))
        (y
           (Maybe Sorta1eB)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eB)
                 (Maybe Sorta1eB)))
           x)
         (=
            (either8571572006478832634 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eD
           a1eF)
         a1fd)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eE
           a1eF)
         a1f8)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eH)
         a1fi)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eD)
         a1f3)
      :named
      given-5.4))
(assert
   (!
      (= a1fd a1eH)
      :named
      given-5.5))
(assert
   (!
      (= a1f3 a1eE)
      :named
      given-5.6))
(assert
   (!
      (= a1f8 a1eG)
      :named
      given-5.7))
(assert
   (!
      (= a1fi a1eI)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1fv} {2}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fF} {2}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; WANTEDS (names)
;  a1eG  <=  abc
;  a1eI  <=  abc'
;  a1eP  <=  a_a1eP
;  a1eQ  <=  b_a1eQ
;  a1eS  <=  c_a1eS
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1eP (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eQ (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eS (Array Sorta1eA (Maybe Sorta1eB)))
(declare-const
   a1eP
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eQ
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eS
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 (
                   (_ map either8571572006478832634)
                   a1eP
                   a1eQ)
                 a1eS)
               a1eG))
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 a1eP
                 (
                   (_ map either8571572006478832634)
                   a1eQ
                   a1eS))
               a1eI)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      Sorta1eA!val!0
;      ()
;      Sorta1eA)
;   (declare-fun
;      Sorta1eA!val!1
;      ()
;      Sorta1eA)
;   (forall
;      (
;        (x Sorta1eA))
;      (or
;         (= x Sorta1eA!val!0)
;         (= x Sorta1eA!val!1)))
;   (declare-fun
;      Sorta1eB!val!3
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!1
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!0
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!2
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!4
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!6
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!5
;      ()
;      Sorta1eB)
;   (forall
;      (
;        (x Sorta1eB))
;      (or
;         (= x Sorta1eB!val!3)
;         (= x Sorta1eB!val!1)
;         (= x Sorta1eB!val!0)
;         (= x Sorta1eB!val!2)
;         (= x Sorta1eB!val!4)
;         (= x Sorta1eB!val!6)
;         (= x Sorta1eB!val!5)))
;   (define-fun
;      a1eD
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            nothing)
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1eH
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      wanted-5
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      (
;                        (_ map either8571572006478832634)
;                        a1eP
;                        a1eQ)
;                      a1eS)
;                    a1eG)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      a1eP
;                      (
;                        (_ map either8571572006478832634)
;                        a1eQ
;                        a1eS))
;                    a1eI))))
;         (or a!1 a!2)))
;   (define-fun
;      a1eI
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1f3
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            nothing)
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eD
;           a1eF)
;         a1fd))
;   (define-fun
;      a1eF
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              nothing)
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eQ
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      a1eG
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eD)
;         a1f3))
;   (define-fun
;      a1eC
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= a1fi a1eI))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eH)
;         a1fi))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= a1f3 a1eE))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= a1f8 a1eG))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eE
;           a1eF)
;         a1f8))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= a1fd a1eH))
;   (define-fun
;      a1eE
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            nothing)
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1f8
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eP
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           nothing)
;         Sorta1eA!val!0
;         (just Sorta1eB!val!4)))
;   (define-fun
;      a1fd
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eS
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!0))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!6))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!3)))
;   (define-fun
;      a1fi
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1eA
;                    (Maybe Sorta1eB)))
;              (just Sorta1eB!val!5))
;            Sorta1eA!val!1
;            (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta1eA))
;      (Maybe Sorta1eB)
;      (ite
;         (= x!0 Sorta1eA!val!1)
;         (just Sorta1eB!val!6)
;         (ite
;            (= x!0 Sorta1eA!val!0)
;            (just Sorta1eB!val!4)
;            (just Sorta1eB!val!0))))
;   (define-fun
;      either8571572006478832634
;      (
;        (x!0
;           (Maybe Sorta1eB))
;        (x!1
;           (Maybe Sorta1eB)))
;      (Maybe Sorta1eB)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1eB!val!5))
;            (= x!1 nothing))
;         (just Sorta1eB!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1eB!val!5)))
;            (just Sorta1eB!val!5)
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
;                        (just Sorta1eB!val!0)))
;                  (just Sorta1eB!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1eB!val!1)))
;                     (just Sorta1eB!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1eB!val!3)))
;                        (just Sorta1eB!val!3)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1eB!val!4))
;                              (=
;                                 x!1
;                                 (just Sorta1eB!val!3)))
;                           (just Sorta1eB!val!4)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1eB!val!2)))
;                              (just Sorta1eB!val!2)
;                              (ite
;                                 (and
;                                    (= x!0 nothing)
;                                    (=
;                                       x!1
;                                       (just Sorta1eB!val!6)))
;                                 (just Sorta1eB!val!6)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta1eB!val!4))
;                                       (= x!1 nothing))
;                                    (just Sorta1eB!val!4)
;                                    (ite
;                                       (
;                                         (_ is just)
;                                         x!0)
;                                       x!0
;                                       x!1))))))))))))
;   (define-fun
;      k!71
;      (
;        (x!0 Sorta1eA))
;      (Maybe Sorta1eB)
;      (ite
;         (= x!0 Sorta1eA!val!1)
;         (just Sorta1eB!val!2)
;         (ite
;            (= x!0 Sorta1eA!val!0)
;            (just Sorta1eB!val!1)
;            (just Sorta1eB!val!5)))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_a1fe {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1f9 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1fj {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1f4 {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1ff {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1f5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1fa {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1fk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1fK} {3}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1fP} {3}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1eA,a1eB,a1eD,a1eF],a1fd)
; (UnionL [a1eA,a1eB,a1eE,a1eF],a1f8)
; (UnionL [a1eA,a1eB,a1eC,a1eH],a1fi)
; (UnionL [a1eA,a1eB,a1eC,a1eD],a1f3)
; (a1fd,a1eH)
; (a1f3,a1eE)
; (a1f8,a1eG)
; (a1fi,a1eI)

; WANTEDS (Thoralf style)
; (UnionL [a1eA,a1eB,UnionL [a1eA,a1eB,a1eP,a1eQ],a1eS],a1eG)
; (UnionL [a1eA,a1eB,a1eP,UnionL [a1eA,a1eB,a1eQ,a1eS]],a1eI)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1fK} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fP} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; GIVENS (names)
;  a1eC  <=  a
;  a1eD  <=  b
;  a1eE  <=  ab
;  a1eF  <=  c
;  a1eG  <=  abc
;  a1eH  <=  bc
;  a1eI  <=  abc'
;  a1f3  <=  fsk_a1f3
;  a1f8  <=  fsk_a1f8
;  a1fd  <=  fsk_a1fd
;  a1fi  <=  fsk_a1fi
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1eB)) (y (Maybe Sorta1eB))) (=> ((_ is (just (Sorta1eB) (Maybe Sorta1eB))) x) (= (either8571572006478832634 x y) x))))
; (assert (forall ((y (Maybe Sorta1eB))) (= (either8571572006478832634 (as nothing (Maybe Sorta1eB)) y) y)))
; (declare-const a1eC (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eD (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eE (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eF (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eG (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eH (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eI (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f3 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f8 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fd (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fi (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-fun either8571572006478832634 ((Maybe Sorta1eB) (Maybe Sorta1eB)) (Maybe Sorta1eB))
; (declare-sort Sorta1eA)
; (declare-sort Sorta1eB)
; DECS1 (unseen) 
(declare-sort Sorta1eA)
(declare-sort Sorta1eB)
(declare-const
   a1eC
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eD
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eE
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eF
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eG
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eH
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eI
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f3
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f8
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fd
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fi
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-fun
   either8571572006478832634
   (
     (Maybe Sorta1eB)
     (Maybe Sorta1eB))
   (Maybe Sorta1eB))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eB)))
      (=
         (either8571572006478832634
            (as
               nothing
               (Maybe Sorta1eB))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eB))
        (y
           (Maybe Sorta1eB)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eB)
                 (Maybe Sorta1eB)))
           x)
         (=
            (either8571572006478832634 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eD
           a1eF)
         a1fd)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eE
           a1eF)
         a1f8)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eH)
         a1fi)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eD)
         a1f3)
      :named
      given-6.4))
(assert
   (!
      (= a1fd a1eH)
      :named
      given-6.5))
(assert
   (!
      (= a1f3 a1eE)
      :named
      given-6.6))
(assert
   (!
      (= a1f8 a1eG)
      :named
      given-6.7))
(assert
   (!
      (= a1fi a1eI)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1fK} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fP} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; WANTEDS (names)
;  a1eG  <=  abc
;  a1eI  <=  abc'
;  a1eP  <=  a_a1eP
;  a1eQ  <=  b_a1eQ
;  a1eS  <=  c_a1eS
; DECS2 (seen) 
; (declare-const a1eP (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eQ (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eS (Array Sorta1eA (Maybe Sorta1eB)))
; DECS2 (unseen) 
(declare-const
   a1eP
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eQ
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eS
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 (
                   (_ map either8571572006478832634)
                   a1eP
                   a1eQ)
                 a1eS)
               a1eG))
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 a1eP
                 (
                   (_ map either8571572006478832634)
                   a1eQ
                   a1eS))
               a1eI)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      Sorta1eB!val!3
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!1
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!0
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!2
;      ()
;      Sorta1eB)
;   (forall
;      (
;        (x Sorta1eB))
;      (or
;         (= x Sorta1eB!val!3)
;         (= x Sorta1eB!val!1)
;         (= x Sorta1eB!val!0)
;         (= x Sorta1eB!val!2)))
;   (declare-fun
;      Sorta1eA!val!0
;      ()
;      Sorta1eA)
;   (forall
;      (
;        (x Sorta1eA))
;      (= x Sorta1eA!val!0))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= a1fi a1eI))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eD)
;         a1f3))
;   (define-fun
;      a1eD
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eE
;           a1eF)
;         a1f8))
;   (define-fun
;      a1eH
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eI
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1f3
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= a1fd a1eH))
;   (define-fun
;      a1eF
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           nothing)
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eQ
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           nothing)
;         Sorta1eA!val!0
;         (just Sorta1eB!val!3)))
;   (define-fun
;      a1eG
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eC
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      a1eS
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!0))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1f8
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eP
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eH)
;         a1fi))
;   (define-fun
;      a1eE
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1fd
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eD
;           a1eF)
;         a1fd))
;   (define-fun
;      a1fi
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= a1f3 a1eE))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= a1f8 a1eG))
;   (define-fun
;      wanted-6
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      (
;                        (_ map either8571572006478832634)
;                        a1eP
;                        a1eQ)
;                      a1eS)
;                    a1eG)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      a1eP
;                      (
;                        (_ map either8571572006478832634)
;                        a1eQ
;                        a1eS))
;                    a1eI))))
;         (or a!1 a!2)))
;   (define-fun
;      either8571572006478832634
;      (
;        (x!0
;           (Maybe Sorta1eB))
;        (x!1
;           (Maybe Sorta1eB)))
;      (Maybe Sorta1eB)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1eB!val!2))
;            (= x!1 nothing))
;         (just Sorta1eB!val!2)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1eB!val!2)))
;            (just Sorta1eB!val!2)
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
;                        (just Sorta1eB!val!0)))
;                  (just Sorta1eB!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1eB!val!1)))
;                     (just Sorta1eB!val!1)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1eB!val!3))
;                           (= x!1 nothing))
;                        (just Sorta1eB!val!3)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta1eB!val!3)))
;                           (just Sorta1eB!val!3)
;                           (ite
;                              (
;                                (_ is just)
;                                x!0)
;                              x!0
;                              x!1))))))))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_a1fe {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1f9 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1fj {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1f4 {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1ff {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1f5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1fa {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1fk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1fK} {3}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1fP} {3}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1eA,a1eB,a1eD,a1eF],a1fd)
; (UnionL [a1eA,a1eB,a1eE,a1eF],a1f8)
; (UnionL [a1eA,a1eB,a1eC,a1eH],a1fi)
; (UnionL [a1eA,a1eB,a1eC,a1eD],a1f3)
; (a1fd,a1eH)
; (a1f3,a1eE)
; (a1f8,a1eG)
; (a1fi,a1eI)

; WANTEDS (Thoralf style)
; (UnionL [a1eA,a1eB,UnionL [a1eA,a1eB,a1eP,a1eQ],a1eS],a1eG)
; (UnionL [a1eA,a1eB,a1eP,UnionL [a1eA,a1eB,a1eQ,a1eS]],a1eI)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1fK} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fP} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; GIVENS (names)
;  a1eC  <=  a
;  a1eD  <=  b
;  a1eE  <=  ab
;  a1eF  <=  c
;  a1eG  <=  abc
;  a1eH  <=  bc
;  a1eI  <=  abc'
;  a1f3  <=  fsk_a1f3
;  a1f8  <=  fsk_a1f8
;  a1fd  <=  fsk_a1fd
;  a1fi  <=  fsk_a1fi
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1eB)) (y (Maybe Sorta1eB))) (=> ((_ is (just (Sorta1eB) (Maybe Sorta1eB))) x) (= (either8571572006478832634 x y) x))))
; (assert (forall ((y (Maybe Sorta1eB))) (= (either8571572006478832634 (as nothing (Maybe Sorta1eB)) y) y)))
; (declare-const a1eC (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eD (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eE (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eF (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eG (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eH (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eI (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f3 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1f8 (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fd (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1fi (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-fun either8571572006478832634 ((Maybe Sorta1eB) (Maybe Sorta1eB)) (Maybe Sorta1eB))
; (declare-sort Sorta1eA)
; (declare-sort Sorta1eB)
; DECS1 (unseen) 
(declare-sort Sorta1eA)
(declare-sort Sorta1eB)
(declare-const
   a1eC
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eD
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eE
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eF
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eG
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eH
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eI
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f3
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1f8
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fd
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1fi
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-fun
   either8571572006478832634
   (
     (Maybe Sorta1eB)
     (Maybe Sorta1eB))
   (Maybe Sorta1eB))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eB)))
      (=
         (either8571572006478832634
            (as
               nothing
               (Maybe Sorta1eB))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eB))
        (y
           (Maybe Sorta1eB)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eB)
                 (Maybe Sorta1eB)))
           x)
         (=
            (either8571572006478832634 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eD
           a1eF)
         a1fd)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eE
           a1eF)
         a1f8)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eH)
         a1fi)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8571572006478832634)
           a1eC
           a1eD)
         a1f3)
      :named
      given-6.4))
(assert
   (!
      (= a1fd a1eH)
      :named
      given-6.5))
(assert
   (!
      (= a1f3 a1eE)
      :named
      given-6.6))
(assert
   (!
      (= a1f8 a1eG)
      :named
      given-6.7))
(assert
   (!
      (= a1fi a1eI)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1fK} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      (
;        (_ map either8571572006478832634)
;        a1eP
;        a1eQ)
;      a1eS)
;    a1eG)

;      [WD] hole{co_a1fP} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8571572006478832634)
;      a1eP
;      (
;        (_ map either8571572006478832634)
;        a1eQ
;        a1eS))
;    a1eI)

; WANTEDS (names)
;  a1eG  <=  abc
;  a1eI  <=  abc'
;  a1eP  <=  a_a1eP
;  a1eQ  <=  b_a1eQ
;  a1eS  <=  c_a1eS
; DECS2 (seen) 
; (declare-const a1eP (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eQ (Array Sorta1eA (Maybe Sorta1eB)))
; (declare-const a1eS (Array Sorta1eA (Maybe Sorta1eB)))
; DECS2 (unseen) 
(declare-const
   a1eP
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eQ
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(declare-const
   a1eS
   (Array
      Sorta1eA
      (Maybe Sorta1eB)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 (
                   (_ map either8571572006478832634)
                   a1eP
                   a1eQ)
                 a1eS)
               a1eG))
         (not
            (=
               (
                 (_ map either8571572006478832634)
                 a1eP
                 (
                   (_ map either8571572006478832634)
                   a1eQ
                   a1eS))
               a1eI)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      Sorta1eB!val!3
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!1
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!0
;      ()
;      Sorta1eB)
;   (declare-fun
;      Sorta1eB!val!2
;      ()
;      Sorta1eB)
;   (forall
;      (
;        (x Sorta1eB))
;      (or
;         (= x Sorta1eB!val!3)
;         (= x Sorta1eB!val!1)
;         (= x Sorta1eB!val!0)
;         (= x Sorta1eB!val!2)))
;   (declare-fun
;      Sorta1eA!val!0
;      ()
;      Sorta1eA)
;   (forall
;      (
;        (x Sorta1eA))
;      (= x Sorta1eA!val!0))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= a1fi a1eI))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eD)
;         a1f3))
;   (define-fun
;      a1eD
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eE
;           a1eF)
;         a1f8))
;   (define-fun
;      a1eH
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eI
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1f3
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= a1fd a1eH))
;   (define-fun
;      a1eF
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           nothing)
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eQ
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           nothing)
;         Sorta1eA!val!0
;         (just Sorta1eB!val!3)))
;   (define-fun
;      a1eG
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eC
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      a1eS
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!0))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1f8
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      a1eP
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (
;        (as
;           const
;           (Array
;              Sorta1eA
;              (Maybe Sorta1eB)))
;        nothing))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eC
;           a1eH)
;         a1fi))
;   (define-fun
;      a1eE
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         nothing))
;   (define-fun
;      a1fd
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8571572006478832634)
;           a1eD
;           a1eF)
;         a1fd))
;   (define-fun
;      a1fi
;      ()
;      (Array
;         Sorta1eA
;         (Maybe Sorta1eB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1eA
;                 (Maybe Sorta1eB)))
;           (just Sorta1eB!val!2))
;         Sorta1eA!val!0
;         (just Sorta1eB!val!1)))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= a1f3 a1eE))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= a1f8 a1eG))
;   (define-fun
;      wanted-6
;      ()
;      Bool
;      (let
;         (
;           (a!1
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      (
;                        (_ map either8571572006478832634)
;                        a1eP
;                        a1eQ)
;                      a1eS)
;                    a1eG)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8571572006478832634)
;                      a1eP
;                      (
;                        (_ map either8571572006478832634)
;                        a1eQ
;                        a1eS))
;                    a1eI))))
;         (or a!1 a!2)))
;   (define-fun
;      either8571572006478832634
;      (
;        (x!0
;           (Maybe Sorta1eB))
;        (x!1
;           (Maybe Sorta1eB)))
;      (Maybe Sorta1eB)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1eB!val!2))
;            (= x!1 nothing))
;         (just Sorta1eB!val!2)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1eB!val!2)))
;            (just Sorta1eB!val!2)
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
;                        (just Sorta1eB!val!0)))
;                  (just Sorta1eB!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1eB!val!1)))
;                     (just Sorta1eB!val!1)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1eB!val!3))
;                           (= x!1 nothing))
;                        (just Sorta1eB!val!3)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta1eB!val!3)))
;                           (just Sorta1eB!val!3)
;                           (ite
;                              (
;                                (_ is just)
;                                x!0)
;                              x!0
;                              x!1))))))))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a1gq {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1gn {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1gr {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1gt {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1gy} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ga,"ok",2],a1gp)
; (Alter [Symbol [],Nat [],a1g9,"ok",2],a1gm)
; (a1gp,a1gb)
; (a1gm,a1ga)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ge,"ok",2],a1ga)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1gy} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1ge
;       "ok"
;       (just 2))
;    a1ga)

; GIVENS (names)
;  a1g9  <=  m1
;  a1ga  <=  m2
;  a1gb  <=  m3
;  a1gm  <=  fsk_a1gm
;  a1gp  <=  fsk_a1gp
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1g9 (Array String (Maybe Int)))
; (declare-const a1ga (Array String (Maybe Int)))
; (declare-const a1gb (Array String (Maybe Int)))
; (declare-const a1gm (Array String (Maybe Int)))
; (declare-const a1gp (Array String (Maybe Int)))
(declare-const
   a1g9
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ga
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gb
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gm
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gp
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ga
            "ok"
            (just 2))
         a1gp)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1g9
            "ok"
            (just 2))
         a1gm)
      :named
      given-8.2))
(assert
   (!
      (= a1gp a1gb)
      :named
      given-8.3))
(assert
   (!
      (= a1gm a1ga)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1gy} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1ge
;       "ok"
;       (just 2))
;    a1ga)

; WANTEDS (names)
;  a1ga  <=  m2
;  a1ge  <=  m1_a1ge
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1ge (Array String (Maybe Int)))
(declare-const
   a1ge
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1ge
               "ok"
               (just 2))
            a1ga))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (define-fun
;      given-8.3
;      ()
;      Bool
;      (= a1gp a1gb))
;   (define-fun
;      given-8.4
;      ()
;      Bool
;      (= a1gm a1ga))
;   (define-fun
;      a1gb
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
;      a1ge
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
;      a1ga
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
;      given-8.2
;      ()
;      Bool
;      (=
;         (store
;            a1g9
;            "ok"
;            (just 2))
;         a1gm))
;   (define-fun
;      a1gp
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
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store
;               a1ge
;               "ok"
;               (just 2))
;            a1ga)))
;   (define-fun
;      a1g9
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
;      a1gm
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
;      given-8.1
;      ()
;      Bool
;      (=
;         (store
;            a1ga
;            "ok"
;            (just 2))
;         a1gp)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a1gq {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1gn {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1gr {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1gt {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1gy} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ga,"ok",2],a1gp)
; (Alter [Symbol [],Nat [],a1g9,"ok",2],a1gm)
; (a1gp,a1gb)
; (a1gm,a1ga)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ge,"ok",2],a1ga)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1gy} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1ge
;       "ok"
;       (just 2))
;    a1ga)

; GIVENS (names)
;  a1g9  <=  m1
;  a1ga  <=  m2
;  a1gb  <=  m3
;  a1gm  <=  fsk_a1gm
;  a1gp  <=  fsk_a1gp
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1g9 (Array String (Maybe Int)))
; (declare-const a1ga (Array String (Maybe Int)))
; (declare-const a1gb (Array String (Maybe Int)))
; (declare-const a1gm (Array String (Maybe Int)))
; (declare-const a1gp (Array String (Maybe Int)))
(declare-const
   a1g9
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ga
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gb
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gm
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gp
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ga
            "ok"
            (just 2))
         a1gp)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1g9
            "ok"
            (just 2))
         a1gm)
      :named
      given-8.2))
(assert
   (!
      (= a1gp a1gb)
      :named
      given-8.3))
(assert
   (!
      (= a1gm a1ga)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1gy} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1ge
;       "ok"
;       (just 2))
;    a1ga)

; WANTEDS (names)
;  a1ga  <=  m2
;  a1ge  <=  m1_a1ge
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1ge (Array String (Maybe Int)))
(declare-const
   a1ge
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1ge
               "ok"
               (just 2))
            a1ga))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (define-fun
;      given-8.3
;      ()
;      Bool
;      (= a1gp a1gb))
;   (define-fun
;      given-8.4
;      ()
;      Bool
;      (= a1gm a1ga))
;   (define-fun
;      a1gb
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
;      a1ge
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
;      a1ga
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
;      given-8.2
;      ()
;      Bool
;      (=
;         (store
;            a1g9
;            "ok"
;            (just 2))
;         a1gm))
;   (define-fun
;      a1gp
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
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store
;               a1ge
;               "ok"
;               (just 2))
;            a1ga)))
;   (define-fun
;      a1g9
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
;      a1gm
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
;      given-8.1
;      ()
;      Bool
;      (=
;         (store
;            a1ga
;            "ok"
;            (just 2))
;         a1gp)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_a1ha {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1h7 {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1hb {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1hd {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1hi} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1gR,a1gT,"bob"],a1h9)
; (Delete [Symbol [],a1gR,a1gS,"bob"],a1h6)
; (a1h9,a1gU)
; (a1h6,a1gT)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1gR,a1gY,"bob"],a1gT)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a1hi} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1gY
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1gR)))
;    a1gT)

; GIVENS (names)
;  a1gS  <=  m1
;  a1gT  <=  m2
;  a1gU  <=  m3
;  a1h6  <=  fsk_a1h6
;  a1h9  <=  fsk_a1h9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1gS (Array String (Maybe Sorta1gR)))
; (declare-const a1gT (Array String (Maybe Sorta1gR)))
; (declare-const a1gU (Array String (Maybe Sorta1gR)))
; (declare-const a1h6 (Array String (Maybe Sorta1gR)))
; (declare-const a1h9 (Array String (Maybe Sorta1gR)))
; (declare-sort Sorta1gR)
(declare-sort Sorta1gR)
(declare-const
   a1gS
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1gT
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1gU
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1h6
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1h9
   (Array
      String
      (Maybe Sorta1gR)))
(assert
   (!
      (=
         (store
            a1gT
            "bob"
            (as
               nothing
               (Maybe Sorta1gR)))
         a1h9)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1gS
            "bob"
            (as
               nothing
               (Maybe Sorta1gR)))
         a1h6)
      :named
      given-10.2))
(assert
   (!
      (= a1h9 a1gU)
      :named
      given-10.3))
(assert
   (!
      (= a1h6 a1gT)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a1hi} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1gY
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1gR)))
;    a1gT)

; WANTEDS (names)
;  a1gT  <=  m2
;  a1gY  <=  m1_a1gY
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1gY (Array String (Maybe Sorta1gR)))
(declare-const
   a1gY
   (Array
      String
      (Maybe Sorta1gR)))
(assert
   (!
      (not
         (=
            (store
               a1gY
               "bob"
               (as
                  nothing
                  (Maybe Sorta1gR)))
            a1gT))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      Sorta1gR!val!0
;      ()
;      Sorta1gR)
;   (declare-fun
;      Sorta1gR!val!2
;      ()
;      Sorta1gR)
;   (declare-fun
;      Sorta1gR!val!1
;      ()
;      Sorta1gR)
;   (forall
;      (
;        (x Sorta1gR))
;      (or
;         (= x Sorta1gR!val!0)
;         (= x Sorta1gR!val!2)
;         (= x Sorta1gR!val!1)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store a1gT "bob" nothing)
;         a1h9))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= a1h6 a1gT))
;   (define-fun
;      a1gT
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1h6
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= a1h9 a1gU))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store a1gS "bob" nothing)
;         a1h6))
;   (define-fun
;      a1gU
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1h9
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1gS
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1gR)))
;           (just Sorta1gR!val!1))
;         "b"
;         nothing))
;   (define-fun
;      a1gY
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1gR)))
;           (just Sorta1gR!val!2))
;         "b"
;         (just Sorta1gR!val!0)))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store a1gY "bob" nothing)
;            a1gT))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_a1ha {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1h7 {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1hb {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1hd {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1hi} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1gR,a1gT,"bob"],a1h9)
; (Delete [Symbol [],a1gR,a1gS,"bob"],a1h6)
; (a1h9,a1gU)
; (a1h6,a1gT)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1gR,a1gY,"bob"],a1gT)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a1hi} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1gY
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1gR)))
;    a1gT)

; GIVENS (names)
;  a1gS  <=  m1
;  a1gT  <=  m2
;  a1gU  <=  m3
;  a1h6  <=  fsk_a1h6
;  a1h9  <=  fsk_a1h9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1gS (Array String (Maybe Sorta1gR)))
; (declare-const a1gT (Array String (Maybe Sorta1gR)))
; (declare-const a1gU (Array String (Maybe Sorta1gR)))
; (declare-const a1h6 (Array String (Maybe Sorta1gR)))
; (declare-const a1h9 (Array String (Maybe Sorta1gR)))
; (declare-sort Sorta1gR)
(declare-sort Sorta1gR)
(declare-const
   a1gS
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1gT
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1gU
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1h6
   (Array
      String
      (Maybe Sorta1gR)))
(declare-const
   a1h9
   (Array
      String
      (Maybe Sorta1gR)))
(assert
   (!
      (=
         (store
            a1gT
            "bob"
            (as
               nothing
               (Maybe Sorta1gR)))
         a1h9)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1gS
            "bob"
            (as
               nothing
               (Maybe Sorta1gR)))
         a1h6)
      :named
      given-10.2))
(assert
   (!
      (= a1h9 a1gU)
      :named
      given-10.3))
(assert
   (!
      (= a1h6 a1gT)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a1hi} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1gY
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1gR)))
;    a1gT)

; WANTEDS (names)
;  a1gT  <=  m2
;  a1gY  <=  m1_a1gY
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1gY (Array String (Maybe Sorta1gR)))
(declare-const
   a1gY
   (Array
      String
      (Maybe Sorta1gR)))
(assert
   (!
      (not
         (=
            (store
               a1gY
               "bob"
               (as
                  nothing
                  (Maybe Sorta1gR)))
            a1gT))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      Sorta1gR!val!0
;      ()
;      Sorta1gR)
;   (declare-fun
;      Sorta1gR!val!2
;      ()
;      Sorta1gR)
;   (declare-fun
;      Sorta1gR!val!1
;      ()
;      Sorta1gR)
;   (forall
;      (
;        (x Sorta1gR))
;      (or
;         (= x Sorta1gR!val!0)
;         (= x Sorta1gR!val!2)
;         (= x Sorta1gR!val!1)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store a1gT "bob" nothing)
;         a1h9))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= a1h6 a1gT))
;   (define-fun
;      a1gT
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1h6
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= a1h9 a1gU))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store a1gS "bob" nothing)
;         a1h6))
;   (define-fun
;      a1gU
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1h9
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1gR)))
;              (just Sorta1gR!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1gS
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1gR)))
;           (just Sorta1gR!val!1))
;         "b"
;         nothing))
;   (define-fun
;      a1gY
;      ()
;      (Array
;         String
;         (Maybe Sorta1gR))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1gR)))
;           (just Sorta1gR!val!2))
;         "b"
;         (just Sorta1gR!val!0)))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store a1gY "bob" nothing)
;            a1gT))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1iM} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                          ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a1iM} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a1iM} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
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
;      wanted-11))
(get-unsat-core)
; (wanted-11)
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] co_a1j5 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1j0 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1ja {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1iV {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1j6 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1iW {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1j1 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1jb {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1hM} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1hv,a1hw,a1hy,a1hA],a1j4)
; (IntersectL [a1hv,a1hw,a1hz,a1hA],a1iZ)
; (IntersectL [a1hv,a1hw,a1hx,a1hC],a1j9)
; (IntersectL [a1hv,a1hw,a1hx,a1hy],a1iU)
; (a1j4,a1hC)
; (a1iU,a1hz)
; (a1iZ,a1hB)
; (a1j9,a1hD)

; WANTEDS (Thoralf style)
; (a1hB,a1hD)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a1hM} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1hB a1hD)

; GIVENS (names)
;  a1hx  <=  a
;  a1hy  <=  b
;  a1hz  <=  ab
;  a1hA  <=  c
;  a1hB  <=  abc
;  a1hC  <=  bc
;  a1hD  <=  abc'
;  a1iU  <=  fsk_a1iU
;  a1iZ  <=  fsk_a1iZ
;  a1j4  <=  fsk_a1j4
;  a1j9  <=  fsk_a1j9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1hw)) (y (Maybe Sorta1hw))) (=> (and ((_ is (just (Sorta1hw) (Maybe Sorta1hw))) x) ((_ is (just (Sorta1hw) (Maybe Sorta1hw))) y)) (= (both8560925435384946980 x y) x))))
; (assert (forall ((y (Maybe Sorta1hw))) (= (both8560925435384946980 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1hw))) (= (both8560925435384946980 y (as nothing (Maybe Sorta1hw))) (as nothing (Maybe Sorta1hw)))))
; (declare-const a1hA (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1hB (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1hC (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1hD (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1hx (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1hy (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1hz (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1iU (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1iZ (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1j4 (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-const a1j9 (Array Sorta1hv (Maybe Sorta1hw)))
; (declare-fun both8560925435384946980 ((Maybe Sorta1hw) (Maybe Sorta1hw)) (Maybe Sorta1hw))
; (declare-sort Sorta1hv)
; (declare-sort Sorta1hw)
(declare-sort Sorta1hv)
(declare-sort Sorta1hw)
(declare-const
   a1hx
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1hy
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1hz
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1hA
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1hB
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1hC
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1hD
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1iU
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1iZ
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1j4
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-const
   a1j9
   (Array
      Sorta1hv
      (Maybe Sorta1hw)))
(declare-fun
   both8560925435384946980
   (
     (Maybe Sorta1hw)
     (Maybe Sorta1hw))
   (Maybe Sorta1hw))
(assert
   (forall
      (
        (y
           (Maybe Sorta1hw)))
      (=
         (both8560925435384946980
            y
            (as
               nothing
               (Maybe Sorta1hw)))
         (as
            nothing
            (Maybe Sorta1hw)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1hw)))
      (=
         (both8560925435384946980 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1hw))
        (y
           (Maybe Sorta1hw)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1hw)
                    (Maybe Sorta1hw)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1hw)
                    (Maybe Sorta1hw)))
              y))
         (=
            (both8560925435384946980 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8560925435384946980)
           a1hy
           a1hA)
         a1j4)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both8560925435384946980)
           a1hz
           a1hA)
         a1iZ)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both8560925435384946980)
           a1hx
           a1hC)
         a1j9)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both8560925435384946980)
           a1hx
           a1hy)
         a1iU)
      :named
      given-13.4))
(assert
   (!
      (= a1j4 a1hC)
      :named
      given-13.5))
(assert
   (!
      (= a1iU a1hz)
      :named
      given-13.6))
(assert
   (!
      (= a1iZ a1hB)
      :named
      given-13.7))
(assert
   (!
      (= a1j9 a1hD)
      :named
      given-13.8))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a1hM} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1hB a1hD)

; WANTEDS (names)
;  a1hB  <=  abc
;  a1hD  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1hB a1hD))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (forall
;      (
;        (y
;           (Maybe Sorta1hw)))
;      (=
;         (both8560925435384946980
;            y
;            (as
;               nothing
;               (Maybe Sorta1hw)))
;         (as
;            nothing
;            (Maybe Sorta1hw))))
;   (forall
;      (
;        (y
;           (Maybe Sorta1hw)))
;      (=
;         (both8560925435384946980 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe Sorta1hw))
;        (y
;           (Maybe Sorta1hw)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1hw)
;                    (Maybe Sorta1hw)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1hw)
;                    (Maybe Sorta1hw)))
;              y))
;         (=
;            (both8560925435384946980 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both8560925435384946980)
;           a1hy
;           a1hA)
;         a1j4)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map both8560925435384946980)
;           a1hz
;           a1hA)
;         a1iZ)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map both8560925435384946980)
;           a1hx
;           a1hC)
;         a1j9)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map both8560925435384946980)
;           a1hx
;           a1hy)
;         a1iU)
;      :named
;      given-13.4)
;   (!
;      (= a1j4 a1hC)
;      :named
;      given-13.5)
;   (!
;      (= a1iU a1hz)
;      :named
;      given-13.6)
;   (!
;      (= a1iZ a1hB)
;      :named
;      given-13.7)
;   (!
;      (= a1j9 a1hD)
;      :named
;      given-13.8)
;   (!
;      (not
;         (= a1hB a1hD))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1
;    given-13.5
;    given-13.2
;    given-13.3
;    given-13.4
;    wanted-13
;    given-13.6
;    given-13.8
;    given-13.7)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] co_a1jp {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1jk {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1ju {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1jf {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1jq {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1jg {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1jl {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1jv {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1i4} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1hO,a1hP,a1hR,a1hT],a1jo)
; (UnionL [a1hO,a1hP,a1hS,a1hT],a1jj)
; (UnionL [a1hO,a1hP,a1hQ,a1hV],a1jt)
; (UnionL [a1hO,a1hP,a1hQ,a1hR],a1je)
; (a1jo,a1hV)
; (a1je,a1hS)
; (a1jj,a1hU)
; (a1jt,a1hW)

; WANTEDS (Thoralf style)
; (a1hU,a1hW)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_a1i4} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1hU a1hW)

; GIVENS (names)
;  a1hQ  <=  a
;  a1hR  <=  b
;  a1hS  <=  ab
;  a1hT  <=  c
;  a1hU  <=  abc
;  a1hV  <=  bc
;  a1hW  <=  abc'
;  a1je  <=  fsk_a1je
;  a1jj  <=  fsk_a1jj
;  a1jo  <=  fsk_a1jo
;  a1jt  <=  fsk_a1jt
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1hP)) (y (Maybe Sorta1hP))) (=> ((_ is (just (Sorta1hP) (Maybe Sorta1hP))) x) (= (either8560889151501216017 x y) x))))
; (assert (forall ((y (Maybe Sorta1hP))) (= (either8560889151501216017 (as nothing (Maybe Sorta1hP)) y) y)))
; (declare-const a1hQ (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1hR (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1hS (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1hT (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1hU (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1hV (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1hW (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1je (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1jj (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1jo (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-const a1jt (Array Sorta1hO (Maybe Sorta1hP)))
; (declare-fun either8560889151501216017 ((Maybe Sorta1hP) (Maybe Sorta1hP)) (Maybe Sorta1hP))
; (declare-sort Sorta1hO)
; (declare-sort Sorta1hP)
(declare-sort Sorta1hO)
(declare-sort Sorta1hP)
(declare-const
   a1hQ
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1hR
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1hS
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1hT
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1hU
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1hV
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1hW
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1je
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1jj
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1jo
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-const
   a1jt
   (Array
      Sorta1hO
      (Maybe Sorta1hP)))
(declare-fun
   either8560889151501216017
   (
     (Maybe Sorta1hP)
     (Maybe Sorta1hP))
   (Maybe Sorta1hP))
(assert
   (forall
      (
        (y
           (Maybe Sorta1hP)))
      (=
         (either8560889151501216017
            (as
               nothing
               (Maybe Sorta1hP))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1hP))
        (y
           (Maybe Sorta1hP)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1hP)
                 (Maybe Sorta1hP)))
           x)
         (=
            (either8560889151501216017 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8560889151501216017)
           a1hR
           a1hT)
         a1jo)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either8560889151501216017)
           a1hS
           a1hT)
         a1jj)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either8560889151501216017)
           a1hQ
           a1hV)
         a1jt)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either8560889151501216017)
           a1hQ
           a1hR)
         a1je)
      :named
      given-15.4))
(assert
   (!
      (= a1jo a1hV)
      :named
      given-15.5))
(assert
   (!
      (= a1je a1hS)
      :named
      given-15.6))
(assert
   (!
      (= a1jj a1hU)
      :named
      given-15.7))
(assert
   (!
      (= a1jt a1hW)
      :named
      given-15.8))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_a1i4} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1hU a1hW)

; WANTEDS (names)
;  a1hU  <=  abc
;  a1hW  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1hU a1hW))
      :named
      wanted-15))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-15")
(get-assertions)
; (
;   (forall
;      (
;        (y
;           (Maybe Sorta1hP)))
;      (=
;         (either8560889151501216017
;            (as
;               nothing
;               (Maybe Sorta1hP))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe Sorta1hP))
;        (y
;           (Maybe Sorta1hP)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (Sorta1hP)
;                 (Maybe Sorta1hP)))
;           x)
;         (=
;            (either8560889151501216017 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either8560889151501216017)
;           a1hR
;           a1hT)
;         a1jo)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_ map either8560889151501216017)
;           a1hS
;           a1hT)
;         a1jj)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_ map either8560889151501216017)
;           a1hQ
;           a1hV)
;         a1jt)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_ map either8560889151501216017)
;           a1hQ
;           a1hR)
;         a1je)
;      :named
;      given-15.4)
;   (!
;      (= a1jo a1hV)
;      :named
;      given-15.5)
;   (!
;      (= a1je a1hS)
;      :named
;      given-15.6)
;   (!
;      (= a1jj a1hU)
;      :named
;      given-15.7)
;   (!
;      (= a1jt a1hW)
;      :named
;      given-15.8)
;   (!
;      (not
;         (= a1hU a1hW))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.7
;    given-15.8
;    wanted-15
;    given-15.3
;    given-15.4
;    given-15.1
;    given-15.2
;    given-15.5
;    given-15.6)
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
; [G] co_a1jC {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1jz {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1jD {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1jF {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1ie} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1i7,"ok",2],a1jB)
; (Alter [Symbol [],Nat [],a1i6,"ok",2],a1jy)
; (a1jB,a1i8)
; (a1jy,a1i7)

; WANTEDS (Thoralf style)
; (a1i7,a1i8)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a1ie} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1i7 a1i8)

; GIVENS (names)
;  a1i6  <=  m1
;  a1i7  <=  m2
;  a1i8  <=  m3
;  a1jy  <=  fsk_a1jy
;  a1jB  <=  fsk_a1jB
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1i6 (Array String (Maybe Int)))
; (declare-const a1i7 (Array String (Maybe Int)))
; (declare-const a1i8 (Array String (Maybe Int)))
; (declare-const a1jB (Array String (Maybe Int)))
; (declare-const a1jy (Array String (Maybe Int)))
(declare-const
   a1i6
   (Array
      String
      (Maybe Int)))
(declare-const
   a1i7
   (Array
      String
      (Maybe Int)))
(declare-const
   a1i8
   (Array
      String
      (Maybe Int)))
(declare-const
   a1jy
   (Array
      String
      (Maybe Int)))
(declare-const
   a1jB
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1i7
            "ok"
            (just 2))
         a1jB)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            a1i6
            "ok"
            (just 2))
         a1jy)
      :named
      given-17.2))
(assert
   (!
      (= a1jB a1i8)
      :named
      given-17.3))
(assert
   (!
      (= a1jy a1i7)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a1ie} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1i7 a1i8)

; WANTEDS (names)
;  a1i7  <=  m2
;  a1i8  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1i7 a1i8))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a1i7
;            "ok"
;            (just 2))
;         a1jB)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            a1i6
;            "ok"
;            (just 2))
;         a1jy)
;      :named
;      given-17.2)
;   (!
;      (= a1jB a1i8)
;      :named
;      given-17.3)
;   (!
;      (= a1jy a1i7)
;      :named
;      given-17.4)
;   (!
;      (not
;         (= a1i7 a1i8))
;      :named
;      wanted-17))
(get-unsat-core)
; (wanted-17 given-17.4 given-17.2 given-17.3 given-17.1)
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
; [G] co_a1jM {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1jJ {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1jN {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1jP {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1ip} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1ig,a1ii,"bob"],a1jL)
; (Delete [Symbol [],a1ig,a1ih,"bob"],a1jI)
; (a1jL,a1ij)
; (a1jI,a1ii)

; WANTEDS (Thoralf style)
; (a1ii,a1ij)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a1ip} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ii a1ij)

; GIVENS (names)
;  a1ih  <=  m1
;  a1ii  <=  m2
;  a1ij  <=  m3
;  a1jI  <=  fsk_a1jI
;  a1jL  <=  fsk_a1jL
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1ih (Array String (Maybe Sorta1ig)))
; (declare-const a1ii (Array String (Maybe Sorta1ig)))
; (declare-const a1ij (Array String (Maybe Sorta1ig)))
; (declare-const a1jI (Array String (Maybe Sorta1ig)))
; (declare-const a1jL (Array String (Maybe Sorta1ig)))
; (declare-sort Sorta1ig)
(declare-sort Sorta1ig)
(declare-const
   a1ih
   (Array
      String
      (Maybe Sorta1ig)))
(declare-const
   a1ii
   (Array
      String
      (Maybe Sorta1ig)))
(declare-const
   a1ij
   (Array
      String
      (Maybe Sorta1ig)))
(declare-const
   a1jI
   (Array
      String
      (Maybe Sorta1ig)))
(declare-const
   a1jL
   (Array
      String
      (Maybe Sorta1ig)))
(assert
   (!
      (=
         (store
            a1ii
            "bob"
            (as
               nothing
               (Maybe Sorta1ig)))
         a1jL)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            a1ih
            "bob"
            (as
               nothing
               (Maybe Sorta1ig)))
         a1jI)
      :named
      given-19.2))
(assert
   (!
      (= a1jL a1ij)
      :named
      given-19.3))
(assert
   (!
      (= a1jI a1ii)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a1ip} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ii a1ij)

; WANTEDS (names)
;  a1ii  <=  m2
;  a1ij  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1ii a1ij))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a1ii
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1ig)))
;         a1jL)
;      :named
;      given-19.1)
;   (!
;      (=
;         (store
;            a1ih
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1ig)))
;         a1jI)
;      :named
;      given-19.2)
;   (!
;      (= a1jL a1ij)
;      :named
;      given-19.3)
;   (!
;      (= a1jI a1ii)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= a1ii a1ij))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.4 given-19.1 wanted-19 given-19.3 given-19.2)
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
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
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-1")
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3qH} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qq,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a3qH} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qq
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a3qH} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qq
;    (lit "63A"))

; WANTEDS (names)
;  a3qq  <=  t_a3qq
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qq Type)
(declare-const a3qq Type)
(assert
   (!
      (not
         (=
            a3qq
            (lit "63A")))
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
;      (not
;         (=
;            a3qq
;            (lit "63A"))))
;   (define-fun
;      a3qq
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3qH} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a3qq,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a3qH} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qq
;    (lit "63A"))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a3qH} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a3qq
;    (lit "63A"))

; WANTEDS (names)
;  a3qq  <=  t_a3qq
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a3qq Type)
(declare-const a3qq Type)
(assert
   (!
      (not
         (=
            a3qq
            (lit "63A")))
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
;      (not
;         (=
;            a3qq
;            (lit "63A"))))
;   (define-fun
;      a3qq
;      ()
;      Type
;      (apply
;         (lit "63A")
;         (lit "63A"))))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3r4} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a3qZ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a3r9} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3qL,a3qM],<? [a3qO,a3qP])
; (<? [a3qN,a3qP],<? [a3qK,a3qM])
; (<? [a3qK,a3qL],<? [a3qN,a3qO])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a3r4} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3qL a3qM)
;    (< a3qO a3qP))

;      [WD] hole{co_a3qZ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3qN a3qP)
;    (< a3qK a3qM))

;      [WD] hole{co_a3r9} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3qK a3qL)
;    (< a3qN a3qO))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a3r4} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3qL a3qM)
;    (< a3qO a3qP))

;      [WD] hole{co_a3qZ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3qN a3qP)
;    (< a3qK a3qM))

;      [WD] hole{co_a3r9} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3qK a3qL)
;    (< a3qN a3qO))

; WANTEDS (names)
;  a3qK  <=  a
;  a3qL  <=  b
;  a3qM  <=  c
;  a3qN  <=  a_a3qN
;  a3qO  <=  b_a3qO
;  a3qP  <=  c_a3qP
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3qK))
; (assert (<= 0 a3qL))
; (assert (<= 0 a3qM))
; (assert (<= 0 a3qN))
; (assert (<= 0 a3qO))
; (assert (<= 0 a3qP))
; (declare-const a3qK Int)
; (declare-const a3qL Int)
; (declare-const a3qM Int)
; (declare-const a3qN Int)
; (declare-const a3qO Int)
; (declare-const a3qP Int)
(declare-const a3qK Int)
(declare-const a3qL Int)
(declare-const a3qM Int)
(declare-const a3qN Int)
(declare-const a3qO Int)
(declare-const a3qP Int)
(assert
   (<= 0 a3qK))
(assert
   (<= 0 a3qL))
(assert
   (<= 0 a3qM))
(assert
   (<= 0 a3qN))
(assert
   (<= 0 a3qO))
(assert
   (<= 0 a3qP))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3qL a3qM)
                  (< a3qO a3qP)))
            (not
               (=
                  (< a3qN a3qP)
                  (< a3qK a3qM))))
         (not
            (=
               (< a3qK a3qL)
               (< a3qN a3qO))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a3qK
;      ()
;      Int
;      0)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (< a3qL a3qM)
;               (< a3qO a3qP)))
;         (not
;            (=
;               (< a3qN a3qP)
;               (< a3qK a3qM)))
;         (not
;            (=
;               (< a3qK a3qL)
;               (< a3qN a3qO)))))
;   (define-fun
;      a3qL
;      ()
;      Int
;      0)
;   (define-fun
;      a3qM
;      ()
;      Int
;      0)
;   (define-fun
;      a3qN
;      ()
;      Int
;      0)
;   (define-fun
;      a3qP
;      ()
;      Int
;      0)
;   (define-fun
;      a3qO
;      ()
;      Int
;      1))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3r4} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a3qZ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a3r9} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3qL,a3qM],<? [a3qO,a3qP])
; (<? [a3qN,a3qP],<? [a3qK,a3qM])
; (<? [a3qK,a3qL],<? [a3qN,a3qO])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a3r4} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3qL a3qM)
;    (< a3qO a3qP))

;      [WD] hole{co_a3qZ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3qN a3qP)
;    (< a3qK a3qM))

;      [WD] hole{co_a3r9} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3qK a3qL)
;    (< a3qN a3qO))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a3r4} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3qL a3qM)
;    (< a3qO a3qP))

;      [WD] hole{co_a3qZ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3qN a3qP)
;    (< a3qK a3qM))

;      [WD] hole{co_a3r9} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3qK a3qL)
;    (< a3qN a3qO))

; WANTEDS (names)
;  a3qK  <=  a
;  a3qL  <=  b
;  a3qM  <=  c
;  a3qN  <=  a_a3qN
;  a3qO  <=  b_a3qO
;  a3qP  <=  c_a3qP
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3qK))
; (assert (<= 0 a3qL))
; (assert (<= 0 a3qM))
; (assert (<= 0 a3qN))
; (assert (<= 0 a3qO))
; (assert (<= 0 a3qP))
; (declare-const a3qK Int)
; (declare-const a3qL Int)
; (declare-const a3qM Int)
; (declare-const a3qN Int)
; (declare-const a3qO Int)
; (declare-const a3qP Int)
(declare-const a3qK Int)
(declare-const a3qL Int)
(declare-const a3qM Int)
(declare-const a3qN Int)
(declare-const a3qO Int)
(declare-const a3qP Int)
(assert
   (<= 0 a3qK))
(assert
   (<= 0 a3qL))
(assert
   (<= 0 a3qM))
(assert
   (<= 0 a3qN))
(assert
   (<= 0 a3qO))
(assert
   (<= 0 a3qP))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3qL a3qM)
                  (< a3qO a3qP)))
            (not
               (=
                  (< a3qN a3qP)
                  (< a3qK a3qM))))
         (not
            (=
               (< a3qK a3qL)
               (< a3qN a3qO))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a3qK
;      ()
;      Int
;      0)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (< a3qL a3qM)
;               (< a3qO a3qP)))
;         (not
;            (=
;               (< a3qN a3qP)
;               (< a3qK a3qM)))
;         (not
;            (=
;               (< a3qK a3qL)
;               (< a3qN a3qO)))))
;   (define-fun
;      a3qL
;      ()
;      Int
;      0)
;   (define-fun
;      a3qM
;      ()
;      Int
;      0)
;   (define-fun
;      a3qN
;      ()
;      Int
;      0)
;   (define-fun
;      a3qP
;      ()
;      Int
;      0)
;   (define-fun
;      a3qO
;      ()
;      Int
;      1))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3rJ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a3rO} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3rz,a3rA],+ [a3rx,a3ry])
; (+ [a3rA,a3rz],+ [a3ry,a3rx])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a3rJ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3rz a3rA)
;    (+ a3rx a3ry))

;      [WD] hole{co_a3rO} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3rA a3rz)
;    (+ a3ry a3rx))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a3rJ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3rz a3rA)
;    (+ a3rx a3ry))

;      [WD] hole{co_a3rO} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3rA a3rz)
;    (+ a3ry a3rx))

; WANTEDS (names)
;  a3rx  <=  a
;  a3ry  <=  b
;  a3rz  <=  a_a3rz
;  a3rA  <=  b_a3rA
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3rA))
; (assert (<= 0 a3rx))
; (assert (<= 0 a3ry))
; (assert (<= 0 a3rz))
; (declare-const a3rA Int)
; (declare-const a3rx Int)
; (declare-const a3ry Int)
; (declare-const a3rz Int)
(declare-const a3rx Int)
(declare-const a3ry Int)
(declare-const a3rz Int)
(declare-const a3rA Int)
(assert
   (<= 0 a3rx))
(assert
   (<= 0 a3ry))
(assert
   (<= 0 a3rz))
(assert
   (<= 0 a3rA))
(assert
   (!
      (or
         (not
            (=
               (+ a3rz a3rA)
               (+ a3rx a3ry)))
         (not
            (=
               (+ a3rA a3rz)
               (+ a3ry a3rx))))
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
;      (or
;         (not
;            (=
;               (+ a3rz a3rA)
;               (+ a3rx a3ry)))
;         (not
;            (=
;               (+ a3rA a3rz)
;               (+ a3ry a3rx)))))
;   (define-fun
;      a3rx
;      ()
;      Int
;      0)
;   (define-fun
;      a3ry
;      ()
;      Int
;      0)
;   (define-fun
;      a3rz
;      ()
;      Int
;      1)
;   (define-fun
;      a3rA
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3rJ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a3rO} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3rz,a3rA],+ [a3rx,a3ry])
; (+ [a3rA,a3rz],+ [a3ry,a3rx])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a3rJ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3rz a3rA)
;    (+ a3rx a3ry))

;      [WD] hole{co_a3rO} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3rA a3rz)
;    (+ a3ry a3rx))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a3rJ} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3rz a3rA)
;    (+ a3rx a3ry))

;      [WD] hole{co_a3rO} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3rA a3rz)
;    (+ a3ry a3rx))

; WANTEDS (names)
;  a3rx  <=  a
;  a3ry  <=  b
;  a3rz  <=  a_a3rz
;  a3rA  <=  b_a3rA
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3rA))
; (assert (<= 0 a3rx))
; (assert (<= 0 a3ry))
; (assert (<= 0 a3rz))
; (declare-const a3rA Int)
; (declare-const a3rx Int)
; (declare-const a3ry Int)
; (declare-const a3rz Int)
(declare-const a3rx Int)
(declare-const a3ry Int)
(declare-const a3rz Int)
(declare-const a3rA Int)
(assert
   (<= 0 a3rx))
(assert
   (<= 0 a3ry))
(assert
   (<= 0 a3rz))
(assert
   (<= 0 a3rA))
(assert
   (!
      (or
         (not
            (=
               (+ a3rz a3rA)
               (+ a3rx a3ry)))
         (not
            (=
               (+ a3rA a3rz)
               (+ a3ry a3rx))))
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
;      (or
;         (not
;            (=
;               (+ a3rz a3rA)
;               (+ a3rx a3ry)))
;         (not
;            (=
;               (+ a3rA a3rz)
;               (+ a3ry a3rx)))))
;   (define-fun
;      a3rx
;      ()
;      Int
;      0)
;   (define-fun
;      a3ry
;      ()
;      Int
;      0)
;   (define-fun
;      a3rz
;      ()
;      Int
;      1)
;   (define-fun
;      a3rA
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")
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
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_a3zU {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3zX {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3zV {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a3zY {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3A4} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3sm],a3zT)
; (+ [1,a3so],a3zW)
; (a3zT,a3sa)
; (a3zW,a3sb)

; WANTEDS (Thoralf style)
; (- [a3so,a3sm],- [a3sb,a3sa])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a3A4} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3so a3sm)
;    (- a3sb a3sa))

; GIVENS (names)
;  a3sa  <=  n
;  a3sb  <=  m
;  a3sm  <=  n
;  a3so  <=  n
;  a3zT  <=  fsk_a3zT
;  a3zW  <=  fsk_a3zW
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3sa))
; (assert (<= 0 a3sb))
; (assert (<= 0 a3sm))
; (assert (<= 0 a3so))
; (assert (<= 0 a3zT))
; (assert (<= 0 a3zW))
; (declare-const a3sa Int)
; (declare-const a3sb Int)
; (declare-const a3sm Int)
; (declare-const a3so Int)
; (declare-const a3zT Int)
; (declare-const a3zW Int)
(declare-const a3sa Int)
(declare-const a3sb Int)
(declare-const a3sm Int)
(declare-const a3so Int)
(declare-const a3zT Int)
(declare-const a3zW Int)
(assert
   (<= 0 a3sa))
(assert
   (<= 0 a3sb))
(assert
   (<= 0 a3sm))
(assert
   (<= 0 a3so))
(assert
   (<= 0 a3zT))
(assert
   (<= 0 a3zW))
(assert
   (!
      (=
         (+ 1 a3sm)
         a3zT)
      :named
      given-10.1))
(assert
   (!
      (=
         (+ 1 a3so)
         a3zW)
      :named
      given-10.2))
(assert
   (!
      (= a3zT a3sa)
      :named
      given-10.3))
(assert
   (!
      (= a3zW a3sb)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a3A4} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3so a3sm)
;    (- a3sb a3sa))

; WANTEDS (names)
;  a3sa  <=  n
;  a3sb  <=  m
;  a3sm  <=  n
;  a3so  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a3so a3sm)
            (- a3sb a3sa)))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (<= 0 a3sa)
;   (<= 0 a3sb)
;   (<= 0 a3sm)
;   (<= 0 a3so)
;   (<= 0 a3zT)
;   (<= 0 a3zW)
;   (!
;      (=
;         (+ 1 a3sm)
;         a3zT)
;      :named
;      given-10.1)
;   (!
;      (=
;         (+ 1 a3so)
;         a3zW)
;      :named
;      given-10.2)
;   (!
;      (= a3zT a3sa)
;      :named
;      given-10.3)
;   (!
;      (= a3zW a3sb)
;      :named
;      given-10.4)
;   (!
;      (not
;         (=
;            (- a3so a3sm)
;            (- a3sb a3sa)))
;      :named
;      wanted-10))
(get-unsat-core)
; (wanted-10 given-10.1 given-10.2 given-10.3 given-10.4)
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")
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
; [G] co_a3Ai {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3Aj {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Ar} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3ti],a3Ah)
; (a3Ah,a3tb)

; WANTEDS (Thoralf style)
; (+ [1,+ [a3ti,a3td]],+ [a3tb,a3td])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a3Ar} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3ti a3td))
;    (+ a3tb a3td))

; GIVENS (names)
;  a3tb  <=  n
;  a3ti  <=  n
;  a3Ah  <=  fsk_a3Ah
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3Ah))
; (assert (<= 0 a3tb))
; (assert (<= 0 a3ti))
; (declare-const a3Ah Int)
; (declare-const a3tb Int)
; (declare-const a3ti Int)
(declare-const a3tb Int)
(declare-const a3ti Int)
(declare-const a3Ah Int)
(assert
   (<= 0 a3tb))
(assert
   (<= 0 a3ti))
(assert
   (<= 0 a3Ah))
(assert
   (!
      (=
         (+ 1 a3ti)
         a3Ah)
      :named
      given-17.1))
(assert
   (!
      (= a3Ah a3tb)
      :named
      given-17.2))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a3Ar} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3ti a3td))
;    (+ a3tb a3td))

; WANTEDS (names)
;  a3tb  <=  n
;  a3td  <=  m
;  a3ti  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3td))
; (declare-const a3td Int)
(declare-const a3td Int)
(assert
   (<= 0 a3td))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a3ti a3td))
            (+ a3tb a3td)))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (<= 0 a3tb)
;   (<= 0 a3ti)
;   (<= 0 a3Ah)
;   (!
;      (=
;         (+ 1 a3ti)
;         a3Ah)
;      :named
;      given-17.1)
;   (!
;      (= a3Ah a3tb)
;      :named
;      given-17.2)
;   (<= 0 a3td)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a3ti a3td))
;            (+ a3tb a3td)))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.1 given-17.2 wanted-17)
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

; GIVENS (GHC style)
; [G] co_a3At {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a3Aw {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a3Au {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a3Ax {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3AB} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3xQ,a3xR],a3As)
; (<? [a3xR,a3xS],a3Av)
; (a3As,True [])
; (a3Av,True [])

; WANTEDS (Thoralf style)
; (<? [a3xQ,a3xS],True [])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{co_a3AB} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3xQ a3xS)
;    true)

; GIVENS (names)
;  a3xQ  <=  a
;  a3xR  <=  b
;  a3xS  <=  c
;  a3As  <=  fsk_a3As
;  a3Av  <=  fsk_a3Av
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3xQ))
; (assert (<= 0 a3xR))
; (assert (<= 0 a3xS))
; (declare-const a3As Bool)
; (declare-const a3Av Bool)
; (declare-const a3xQ Int)
; (declare-const a3xR Int)
; (declare-const a3xS Int)
(declare-const a3xQ Int)
(declare-const a3xR Int)
(declare-const a3xS Int)
(declare-const a3As Bool)
(declare-const a3Av Bool)
(assert
   (<= 0 a3xQ))
(assert
   (<= 0 a3xR))
(assert
   (<= 0 a3xS))
(assert
   (!
      (=
         (< a3xQ a3xR)
         a3As)
      :named
      given-20.1))
(assert
   (!
      (=
         (< a3xR a3xS)
         a3Av)
      :named
      given-20.2))
(assert
   (!
      (= a3As true)
      :named
      given-20.3))
(assert
   (!
      (= a3Av true)
      :named
      given-20.4))
(check-sat)
; sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{co_a3AB} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3xQ a3xS)
;    true)

; WANTEDS (names)
;  a3xQ  <=  a
;  a3xS  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a3xQ a3xS)
            true))
      :named
      wanted-20))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-20")
(get-assertions)
; (
;   (<= 0 a3xQ)
;   (<= 0 a3xR)
;   (<= 0 a3xS)
;   (!
;      (=
;         (< a3xQ a3xR)
;         a3As)
;      :named
;      given-20.1)
;   (!
;      (=
;         (< a3xR a3xS)
;         a3Av)
;      :named
;      given-20.2)
;   (!
;      (= a3As true)
;      :named
;      given-20.3)
;   (!
;      (= a3Av true)
;      :named
;      given-20.4)
;   (!
;      (not
;         (=
;            (< a3xQ a3xS)
;            true))
;      :named
;      wanted-20))
(get-unsat-core)
; (wanted-20 given-20.4 given-20.3 given-20.2 given-20.1)
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; [G] co_a3AF {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a3AD {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a3y5 {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3y8} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3y2,a3y3],a3AE)
; (+ [a3y2,a3y2],a3AC)
; (a3AC,a3AE)

; WANTEDS (Thoralf style)
; (a3y2,a3y3)

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a3y8} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3y2 a3y3)

; GIVENS (names)
;  a3y2  <=  a
;  a3y3  <=  b
;  a3AC  <=  fsk_a3AC
;  a3AE  <=  fsk_a3AE
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3AC))
; (assert (<= 0 a3AE))
; (assert (<= 0 a3y2))
; (assert (<= 0 a3y3))
; (declare-const a3AC Int)
; (declare-const a3AE Int)
; (declare-const a3y2 Int)
; (declare-const a3y3 Int)
(declare-const a3y2 Int)
(declare-const a3y3 Int)
(declare-const a3AC Int)
(declare-const a3AE Int)
(assert
   (<= 0 a3y2))
(assert
   (<= 0 a3y3))
(assert
   (<= 0 a3AC))
(assert
   (<= 0 a3AE))
(assert
   (!
      (=
         (+ a3y2 a3y3)
         a3AE)
      :named
      given-22.1))
(assert
   (!
      (=
         (+ a3y2 a3y2)
         a3AC)
      :named
      given-22.2))
(assert
   (!
      (= a3AC a3AE)
      :named
      given-22.3))
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a3y8} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3y2 a3y3)

; WANTEDS (names)
;  a3y2  <=  a
;  a3y3  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a3y2 a3y3))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a3y2)
;   (<= 0 a3y3)
;   (<= 0 a3AC)
;   (<= 0 a3AE)
;   (!
;      (=
;         (+ a3y2 a3y3)
;         a3AE)
;      :named
;      given-22.1)
;   (!
;      (=
;         (+ a3y2 a3y2)
;         a3AC)
;      :named
;      given-22.2)
;   (!
;      (= a3AC a3AE)
;      :named
;      given-22.3)
;   (!
;      (not
;         (= a3y2 a3y3))
;      :named
;      wanted-22))
(get-unsat-core)
; (given-22.2 given-22.1 wanted-22 given-22.3)
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3AJ} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3yb,a3yc],+ [a3yc,a3yb])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a3AJ} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3yb a3yc)
;    (+ a3yc a3yb))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a3AJ} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3yb a3yc)
;    (+ a3yc a3yb))

; WANTEDS (names)
;  a3yb  <=  a
;  a3yc  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3yb))
; (assert (<= 0 a3yc))
; (declare-const a3yb Int)
; (declare-const a3yc Int)
(declare-const a3yb Int)
(declare-const a3yc Int)
(assert
   (<= 0 a3yb))
(assert
   (<= 0 a3yc))
(assert
   (!
      (not
         (=
            (+ a3yb a3yc)
            (+ a3yc a3yb)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a3yb)
;   (<= 0 a3yc)
;   (!
;      (not
;         (=
;            (+ a3yb a3yc)
;            (+ a3yc a3yb)))
;      :named
;      wanted-23))
(get-unsat-core)
; (wanted-23)
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3AR} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3yj,1],+ [1,a3yj])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{co_a3AR} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3yj 1)
;    (+ 1 a3yj))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
;      [WD] hole{co_a3AR} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3yj 1)
;    (+ 1 a3yj))

; WANTEDS (names)
;  a3yj  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3yj))
; (declare-const a3yj Int)
(declare-const a3yj Int)
(assert
   (<= 0 a3yj))
(assert
   (!
      (not
         (=
            (+ a3yj 1)
            (+ 1 a3yj)))
      :named
      wanted-24))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-24")
(get-assertions)
; (
;   (<= 0 a3yj)
;   (!
;      (not
;         (=
;            (+ a3yj 1)
;            (+ 1 a3yj)))
;      :named
;      wanted-24))
(get-unsat-core)
; (wanted-24)
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
(echo "solver-finish-cycle-27")
(echo "solver-start-cycle-27")
(echo "solver-finish-cycle-27")
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
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a5e3} {1}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a5dR} {1}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a5e3} {1}:: Alter
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
;                (lit "3Q")
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
;             (lit "3Q")
;             (lit "3g")))))

;      [WD] hole{co_a5dR} {1}:: Alter
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
;                   (lit "3Q")
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
;                (lit "3Q")
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
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a5e3} {1}:: Alter
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
;                (lit "3Q")
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
;             (lit "3Q")
;             (lit "3g")))))

;      [WD] hole{co_a5dR} {1}:: Alter
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
;                   (lit "3Q")
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
;                (lit "3Q")
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
                           (lit "3Q")
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
                        (lit "3Q")
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
                              (lit "3Q")
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
                           (lit "3Q")
                           (lit "3g"))))
                  "price"
                  (just
                     (lit "3u"))))))
      :named
      wanted-5))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-5")
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
;                           (lit "3Q")
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
;                        (lit "3Q")
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
;                              (lit "3Q")
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
;                           (lit "3Q")
;                           (lit "3g"))))
;                  "price"
;                  (just
;                     (lit "3u"))))))
;      :named
;      wanted-5))
(get-unsat-core)
; (wanted-5)
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a5eP {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5eU {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] co_a5eQ {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5eV {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5f0} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5br,"price",Int []],a5eO)
; (Delete [Symbol [],TYPE [LiftedRep []],a5bu,a5bv],a5eT)
; (a5eO,a5br)
; (a5eT,a5br)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bu,"price",Int []],a5bu)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a5f0} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bu
;       "price"
;       (just
;          (lit "3u")))
;    a5bu)

; GIVENS (names)
;  a5br  <=  m
;  a5bu  <=  m
;  a5bv  <=  field
;  a5eO  <=  fsk_a5eO
;  a5eT  <=  fsk_a5eT
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a5br (Array String (Maybe Type)))
; (declare-const a5bu (Array String (Maybe Type)))
; (declare-const a5bv String)
; (declare-const a5eO (Array String (Maybe Type)))
; (declare-const a5eT (Array String (Maybe Type)))
(declare-const
   a5br
   (Array
      String
      (Maybe Type)))
(declare-const
   a5bu
   (Array
      String
      (Maybe Type)))
(declare-const a5bv String)
(declare-const
   a5eO
   (Array
      String
      (Maybe Type)))
(declare-const
   a5eT
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5br
            "price"
            (just
               (lit "3u")))
         a5eO)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a5bu
            a5bv
            (as
               nothing
               (Maybe Type)))
         a5eT)
      :named
      given-8.2))
(assert
   (!
      (= a5eO a5br)
      :named
      given-8.3))
(assert
   (!
      (= a5eT a5br)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a5f0} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bu
;       "price"
;       (just
;          (lit "3u")))
;    a5bu)

; WANTEDS (names)
;  a5bu  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5bu
               "price"
               (just
                  (lit "3u")))
            a5bu))
      :named
      wanted-8))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-8")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a5br
;            "price"
;            (just
;               (lit "3u")))
;         a5eO)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a5bu
;            a5bv
;            (as
;               nothing
;               (Maybe Type)))
;         a5eT)
;      :named
;      given-8.2)
;   (!
;      (= a5eO a5br)
;      :named
;      given-8.3)
;   (!
;      (= a5eT a5br)
;      :named
;      given-8.4)
;   (!
;      (not
;         (=
;            (store
;               a5bu
;               "price"
;               (just
;                  (lit "3u")))
;            a5bu))
;      :named
;      wanted-8))
(get-unsat-core)
; (given-8.3 given-8.2 given-8.4 given-8.1 wanted-8)
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] co_a5eP {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5f7 {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] co_a5f4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5eQ {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5f6 {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5bZ} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5br,"price",Int []],a5eO)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bB,"price",a5bD],a5f2)
; (a5f2,a5br)
; (a5eO,a5br)
; (a5bC,"price")

; WANTEDS (Thoralf style)
; (a5bD,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a5bZ} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5bD
;    (lit "3u"))

; GIVENS (names)
;  a5br  <=  m
;  a5bB  <=  m
;  a5bC  <=  field
;  a5bD  <=  val
;  a5eO  <=  fsk_a5eO
;  a5f2  <=  fsk_a5f2
(push 1)
; DECS1 (seen) 
; (declare-const a5br (Array String (Maybe Type)))
; (declare-const a5eO (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a5bB (Array String (Maybe Type)))
; (declare-const a5bC String)
; (declare-const a5bD Type)
; (declare-const a5f2 (Array String (Maybe Type)))
(declare-const
   a5br
   (Array
      String
      (Maybe Type)))
(declare-const
   a5bB
   (Array
      String
      (Maybe Type)))
(declare-const a5bC String)
(declare-const a5bD Type)
(declare-const
   a5eO
   (Array
      String
      (Maybe Type)))
(declare-const
   a5f2
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5br
            "price"
            (just
               (lit "3u")))
         a5eO)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a5bB
            "price"
            (just a5bD))
         a5f2)
      :named
      given-11.2))
(assert
   (!
      (= a5f2 a5br)
      :named
      given-11.3))
(assert
   (!
      (= a5eO a5br)
      :named
      given-11.4))
(assert
   (!
      (= a5bC "price")
      :named
      given-11.5))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a5bZ} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5bD
;    (lit "3u"))

; WANTEDS (names)
;  a5bD  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a5bD
            (lit "3u")))
      :named
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            a5br
;            "price"
;            (just
;               (lit "3u")))
;         a5eO)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a5bB
;            "price"
;            (just a5bD))
;         a5f2)
;      :named
;      given-11.2)
;   (!
;      (= a5f2 a5br)
;      :named
;      given-11.3)
;   (!
;      (= a5eO a5br)
;      :named
;      given-11.4)
;   (!
;      (= a5bC "price")
;      :named
;      given-11.5)
;   (!
;      (not
;         (=
;            a5bD
;            (lit "3u")))
;      :named
;      wanted-11))
(get-unsat-core)
; (given-11.2 given-11.3 given-11.4 given-11.1 wanted-11)
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] $dDisEquality_a5c1 {0}:: DisEquality field "price" (CDictCan)
; [G] co_a5eP {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5f3 {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] co_a5eQ {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5f4 {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5fb} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5c1 {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5br,"price",Int []],a5eO)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bB,a5bC,a5bD],a5f2)
; (a5eO,a5br)
; (a5f2,a5br)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5bB,"price",Int []],a5bB)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a5fb} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bB
;       "price"
;       (just
;          (lit "3u")))
;    a5bB)

; GIVENS (names)
;  a5br  <=  m
;  a5bB  <=  m
;  a5bC  <=  field
;  a5bD  <=  val
;  a5eO  <=  fsk_a5eO
;  a5f2  <=  fsk_a5f2
(push 1)
; DECS1 (seen) 
; (declare-const a5bB (Array String (Maybe Type)))
; (declare-const a5bC String)
; (declare-const a5bD Type)
; (declare-const a5br (Array String (Maybe Type)))
; (declare-const a5eO (Array String (Maybe Type)))
; (declare-const a5f2 (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a5br
   (Array
      String
      (Maybe Type)))
(declare-const
   a5bB
   (Array
      String
      (Maybe Type)))
(declare-const a5bC String)
(declare-const a5bD Type)
(declare-const
   a5eO
   (Array
      String
      (Maybe Type)))
(declare-const
   a5f2
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5bC "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a5br
            "price"
            (just
               (lit "3u")))
         a5eO)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a5bB
            a5bC
            (just a5bD))
         a5f2)
      :named
      given-13.3))
(assert
   (!
      (= a5eO a5br)
      :named
      given-13.4))
(assert
   (!
      (= a5f2 a5br)
      :named
      given-13.5))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a5fb} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5bB
;       "price"
;       (just
;          (lit "3u")))
;    a5bB)

; WANTEDS (names)
;  a5bB  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5bB
               "price"
               (just
                  (lit "3u")))
            a5bB))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a5bC "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a5br
;            "price"
;            (just
;               (lit "3u")))
;         a5eO)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a5bB
;            a5bC
;            (just a5bD))
;         a5f2)
;      :named
;      given-13.3)
;   (!
;      (= a5eO a5br)
;      :named
;      given-13.4)
;   (!
;      (= a5f2 a5br)
;      :named
;      given-13.5)
;   (!
;      (not
;         (=
;            (store
;               a5bB
;               "price"
;               (just
;                  (lit "3u")))
;            a5bB))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1
;    given-13.3
;    given-13.4
;    given-13.5
;    wanted-13
;    given-13.2)
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")
(echo "solver-finish-cycle-14")
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
