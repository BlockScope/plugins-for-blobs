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
; [G] cobox_a16X {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a16S {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a172 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a16N {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a16Y {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a16O {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a16T {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a173 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a17r} {3}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a17D} {3}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a16i,a16j,a16l,a16n],a16W)
; (IntersectL [a16i,a16j,a16m,a16n],a16R)
; (IntersectL [a16i,a16j,a16k,a16p],a171)
; (IntersectL [a16i,a16j,a16k,a16l],a16M)
; (a16W,a16p)
; (a16M,a16m)
; (a16R,a16o)
; (a171,a16q)

; WANTEDS (Thoralf style)
; (IntersectL [a16i,a16j,IntersectL [a16i,a16j,a16x,a16y],a16A],a16o)
; (IntersectL [a16i,a16j,a16x,IntersectL [a16i,a16j,a16y,a16A]],a16q)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a17r} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17D} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; GIVENS (names)
;  a16k  <=  a
;  a16l  <=  b
;  a16m  <=  ab
;  a16n  <=  c
;  a16o  <=  abc
;  a16p  <=  bc
;  a16q  <=  abc'
;  a16M  <=  fsk_a16M
;  a16R  <=  fsk_a16R
;  a16W  <=  fsk_a16W
;  a171  <=  fsk_a171
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta16j)) (y (Maybe Sorta16j))) (=> (and ((_ is (just (Sorta16j) (Maybe Sorta16j))) x) ((_ is (just (Sorta16j) (Maybe Sorta16j))) y)) (= (both8528552514521964173 x y) x))))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 y (as nothing (Maybe Sorta16j))) (as nothing (Maybe Sorta16j)))))
; (declare-const a16M (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16R (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16W (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16k (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16l (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16m (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16n (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16o (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16p (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16q (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a171 (Array Sorta16i (Maybe Sorta16j)))
; (declare-fun both8528552514521964173 ((Maybe Sorta16j) (Maybe Sorta16j)) (Maybe Sorta16j))
; (declare-sort Sorta16i)
; (declare-sort Sorta16j)
(declare-sort Sorta16i)
(declare-sort Sorta16j)
(declare-const
   a16k
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16l
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16m
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16n
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16o
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16p
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16q
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16M
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16R
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16W
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a171
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-fun
   both8528552514521964173
   (
     (Maybe Sorta16j)
     (Maybe Sorta16j))
   (Maybe Sorta16j))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173
            y
            (as
               nothing
               (Maybe Sorta16j)))
         (as
            nothing
            (Maybe Sorta16j)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta16j))
        (y
           (Maybe Sorta16j)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              y))
         (=
            (both8528552514521964173 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16l
           a16n)
         a16W)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16m
           a16n)
         a16R)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16p)
         a171)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16l)
         a16M)
      :named
      given-2.4))
(assert
   (!
      (= a16W a16p)
      :named
      given-2.5))
(assert
   (!
      (= a16M a16m)
      :named
      given-2.6))
(assert
   (!
      (= a16R a16o)
      :named
      given-2.7))
(assert
   (!
      (= a171 a16q)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a17r} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17D} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; WANTEDS (names)
;  a16o  <=  abc
;  a16q  <=  abc'
;  a16x  <=  a_a16x
;  a16y  <=  b_a16y
;  a16A  <=  c_a16A
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a16A (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16x (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16y (Array Sorta16i (Maybe Sorta16j)))
(declare-const
   a16x
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16y
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16A
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 (
                   (_ map both8528552514521964173)
                   a16x
                   a16y)
                 a16A)
               a16o))
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 a16x
                 (
                   (_ map both8528552514521964173)
                   a16y
                   a16A))
               a16q)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      Sorta16j!val!3
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!4
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!1
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!0
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!5
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!6
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!2
;      ()
;      Sorta16j)
;   (forall
;      (
;        (x Sorta16j))
;      (or
;         (= x Sorta16j!val!3)
;         (= x Sorta16j!val!4)
;         (= x Sorta16j!val!1)
;         (= x Sorta16j!val!0)
;         (= x Sorta16j!val!5)
;         (= x Sorta16j!val!6)
;         (= x Sorta16j!val!2)))
;   (declare-fun
;      Sorta16i!val!0
;      ()
;      Sorta16i)
;   (forall
;      (
;        (x Sorta16i))
;      (= x Sorta16i!val!0))
;   (define-fun
;      a16q
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16n
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a171
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= a16M a16m))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16m
;           a16n)
;         a16R))
;   (define-fun
;      a16o
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
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
;                      (_ map both8528552514521964173)
;                      (
;                        (_ map both8528552514521964173)
;                        a16x
;                        a16y)
;                      a16A)
;                    a16o)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8528552514521964173)
;                      a16x
;                      (
;                        (_ map both8528552514521964173)
;                        a16y
;                        a16A))
;                    a16q))))
;         (or a!1 a!2)))
;   (define-fun
;      a16p
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= a16W a16p))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= a16R a16o))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= a171 a16q))
;   (define-fun
;      a16x
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!0))
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16y
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!1))
;         Sorta16i!val!0
;         (just Sorta16j!val!3)))
;   (define-fun
;      a16A
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16p)
;         a171))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16l)
;         a16M))
;   (define-fun
;      a16m
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16l
;           a16n)
;         a16W))
;   (define-fun
;      a16R
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16l
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16W
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16k
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!6))
;         Sorta16i!val!0
;         (just Sorta16j!val!5)))
;   (define-fun
;      a16M
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      both8528552514521964173
;      (
;        (x!0
;           (Maybe Sorta16j))
;        (x!1
;           (Maybe Sorta16j)))
;      (Maybe Sorta16j)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta16j!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta16j!val!0))
;                  (=
;                     x!1
;                     (just Sorta16j!val!1)))
;               (just Sorta16j!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta16j!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta16j!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta16j!val!2))
;                           (=
;                              x!1
;                              (just Sorta16j!val!3)))
;                        (just Sorta16j!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta16j!val!2))
;                              (=
;                                 x!1
;                                 (just Sorta16j!val!4)))
;                           (just Sorta16j!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta16j!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta16j!val!3))
;                                    (=
;                                       x!1
;                                       (just Sorta16j!val!4)))
;                                 (just Sorta16j!val!3)
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
; [G] cobox_a16X {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a16S {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a172 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a16N {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a16Y {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a16O {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a16T {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a173 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a17r} {3}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a17D} {3}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a16i,a16j,a16l,a16n],a16W)
; (IntersectL [a16i,a16j,a16m,a16n],a16R)
; (IntersectL [a16i,a16j,a16k,a16p],a171)
; (IntersectL [a16i,a16j,a16k,a16l],a16M)
; (a16W,a16p)
; (a16M,a16m)
; (a16R,a16o)
; (a171,a16q)

; WANTEDS (Thoralf style)
; (IntersectL [a16i,a16j,IntersectL [a16i,a16j,a16x,a16y],a16A],a16o)
; (IntersectL [a16i,a16j,a16x,IntersectL [a16i,a16j,a16y,a16A]],a16q)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a17r} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17D} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; GIVENS (names)
;  a16k  <=  a
;  a16l  <=  b
;  a16m  <=  ab
;  a16n  <=  c
;  a16o  <=  abc
;  a16p  <=  bc
;  a16q  <=  abc'
;  a16M  <=  fsk_a16M
;  a16R  <=  fsk_a16R
;  a16W  <=  fsk_a16W
;  a171  <=  fsk_a171
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta16j)) (y (Maybe Sorta16j))) (=> (and ((_ is (just (Sorta16j) (Maybe Sorta16j))) x) ((_ is (just (Sorta16j) (Maybe Sorta16j))) y)) (= (both8528552514521964173 x y) x))))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 y (as nothing (Maybe Sorta16j))) (as nothing (Maybe Sorta16j)))))
; (declare-const a16M (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16R (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16W (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16k (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16l (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16m (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16n (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16o (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16p (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16q (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a171 (Array Sorta16i (Maybe Sorta16j)))
; (declare-fun both8528552514521964173 ((Maybe Sorta16j) (Maybe Sorta16j)) (Maybe Sorta16j))
; (declare-sort Sorta16i)
; (declare-sort Sorta16j)
(declare-sort Sorta16i)
(declare-sort Sorta16j)
(declare-const
   a16k
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16l
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16m
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16n
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16o
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16p
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16q
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16M
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16R
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16W
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a171
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-fun
   both8528552514521964173
   (
     (Maybe Sorta16j)
     (Maybe Sorta16j))
   (Maybe Sorta16j))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173
            y
            (as
               nothing
               (Maybe Sorta16j)))
         (as
            nothing
            (Maybe Sorta16j)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta16j))
        (y
           (Maybe Sorta16j)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              y))
         (=
            (both8528552514521964173 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16l
           a16n)
         a16W)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16m
           a16n)
         a16R)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16p)
         a171)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16l)
         a16M)
      :named
      given-2.4))
(assert
   (!
      (= a16W a16p)
      :named
      given-2.5))
(assert
   (!
      (= a16M a16m)
      :named
      given-2.6))
(assert
   (!
      (= a16R a16o)
      :named
      given-2.7))
(assert
   (!
      (= a171 a16q)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a17r} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17D} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; WANTEDS (names)
;  a16o  <=  abc
;  a16q  <=  abc'
;  a16x  <=  a_a16x
;  a16y  <=  b_a16y
;  a16A  <=  c_a16A
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a16A (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16x (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16y (Array Sorta16i (Maybe Sorta16j)))
(declare-const
   a16x
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16y
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16A
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 (
                   (_ map both8528552514521964173)
                   a16x
                   a16y)
                 a16A)
               a16o))
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 a16x
                 (
                   (_ map both8528552514521964173)
                   a16y
                   a16A))
               a16q)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      Sorta16j!val!3
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!4
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!1
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!0
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!5
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!6
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!2
;      ()
;      Sorta16j)
;   (forall
;      (
;        (x Sorta16j))
;      (or
;         (= x Sorta16j!val!3)
;         (= x Sorta16j!val!4)
;         (= x Sorta16j!val!1)
;         (= x Sorta16j!val!0)
;         (= x Sorta16j!val!5)
;         (= x Sorta16j!val!6)
;         (= x Sorta16j!val!2)))
;   (declare-fun
;      Sorta16i!val!0
;      ()
;      Sorta16i)
;   (forall
;      (
;        (x Sorta16i))
;      (= x Sorta16i!val!0))
;   (define-fun
;      a16q
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16n
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a171
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= a16M a16m))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16m
;           a16n)
;         a16R))
;   (define-fun
;      a16o
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
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
;                      (_ map both8528552514521964173)
;                      (
;                        (_ map both8528552514521964173)
;                        a16x
;                        a16y)
;                      a16A)
;                    a16o)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8528552514521964173)
;                      a16x
;                      (
;                        (_ map both8528552514521964173)
;                        a16y
;                        a16A))
;                    a16q))))
;         (or a!1 a!2)))
;   (define-fun
;      a16p
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= a16W a16p))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= a16R a16o))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= a171 a16q))
;   (define-fun
;      a16x
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!0))
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16y
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!1))
;         Sorta16i!val!0
;         (just Sorta16j!val!3)))
;   (define-fun
;      a16A
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16p)
;         a171))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16l)
;         a16M))
;   (define-fun
;      a16m
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16l
;           a16n)
;         a16W))
;   (define-fun
;      a16R
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16l
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16W
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      a16k
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!6))
;         Sorta16i!val!0
;         (just Sorta16j!val!5)))
;   (define-fun
;      a16M
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      both8528552514521964173
;      (
;        (x!0
;           (Maybe Sorta16j))
;        (x!1
;           (Maybe Sorta16j)))
;      (Maybe Sorta16j)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta16j!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta16j!val!0))
;                  (=
;                     x!1
;                     (just Sorta16j!val!1)))
;               (just Sorta16j!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta16j!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta16j!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta16j!val!2))
;                           (=
;                              x!1
;                              (just Sorta16j!val!3)))
;                        (just Sorta16j!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta16j!val!2))
;                              (=
;                                 x!1
;                                 (just Sorta16j!val!4)))
;                           (just Sorta16j!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta16j!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta16j!val!3))
;                                    (=
;                                       x!1
;                                       (just Sorta16j!val!4)))
;                                 (just Sorta16j!val!3)
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
; [G] cobox_a16X {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a16S {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a172 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a16N {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a16Y {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a16O {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a16T {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a173 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a17I} {4}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a17N} {4}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a16i,a16j,a16l,a16n],a16W)
; (IntersectL [a16i,a16j,a16m,a16n],a16R)
; (IntersectL [a16i,a16j,a16k,a16p],a171)
; (IntersectL [a16i,a16j,a16k,a16l],a16M)
; (a16W,a16p)
; (a16M,a16m)
; (a16R,a16o)
; (a171,a16q)

; WANTEDS (Thoralf style)
; (IntersectL [a16i,a16j,IntersectL [a16i,a16j,a16x,a16y],a16A],a16o)
; (IntersectL [a16i,a16j,a16x,IntersectL [a16i,a16j,a16y,a16A]],a16q)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a17I} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17N} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; GIVENS (names)
;  a16k  <=  a
;  a16l  <=  b
;  a16m  <=  ab
;  a16n  <=  c
;  a16o  <=  abc
;  a16p  <=  bc
;  a16q  <=  abc'
;  a16M  <=  fsk_a16M
;  a16R  <=  fsk_a16R
;  a16W  <=  fsk_a16W
;  a171  <=  fsk_a171
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta16j)) (y (Maybe Sorta16j))) (=> (and ((_ is (just (Sorta16j) (Maybe Sorta16j))) x) ((_ is (just (Sorta16j) (Maybe Sorta16j))) y)) (= (both8528552514521964173 x y) x))))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 y (as nothing (Maybe Sorta16j))) (as nothing (Maybe Sorta16j)))))
; (declare-const a16M (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16R (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16W (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16k (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16l (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16m (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16n (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16o (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16p (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16q (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a171 (Array Sorta16i (Maybe Sorta16j)))
; (declare-fun both8528552514521964173 ((Maybe Sorta16j) (Maybe Sorta16j)) (Maybe Sorta16j))
; (declare-sort Sorta16i)
; (declare-sort Sorta16j)
; DECS1 (unseen) 
(declare-sort Sorta16i)
(declare-sort Sorta16j)
(declare-const
   a16k
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16l
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16m
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16n
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16o
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16p
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16q
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16M
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16R
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16W
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a171
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-fun
   both8528552514521964173
   (
     (Maybe Sorta16j)
     (Maybe Sorta16j))
   (Maybe Sorta16j))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173
            y
            (as
               nothing
               (Maybe Sorta16j)))
         (as
            nothing
            (Maybe Sorta16j)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta16j))
        (y
           (Maybe Sorta16j)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              y))
         (=
            (both8528552514521964173 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16l
           a16n)
         a16W)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16m
           a16n)
         a16R)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16p)
         a171)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16l)
         a16M)
      :named
      given-3.4))
(assert
   (!
      (= a16W a16p)
      :named
      given-3.5))
(assert
   (!
      (= a16M a16m)
      :named
      given-3.6))
(assert
   (!
      (= a16R a16o)
      :named
      given-3.7))
(assert
   (!
      (= a171 a16q)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a17I} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17N} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; WANTEDS (names)
;  a16o  <=  abc
;  a16q  <=  abc'
;  a16x  <=  a_a16x
;  a16y  <=  b_a16y
;  a16A  <=  c_a16A
; DECS2 (seen) 
; (declare-const a16A (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16x (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16y (Array Sorta16i (Maybe Sorta16j)))
; DECS2 (unseen) 
(declare-const
   a16x
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16y
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16A
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 (
                   (_ map both8528552514521964173)
                   a16x
                   a16y)
                 a16A)
               a16o))
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 a16x
                 (
                   (_ map both8528552514521964173)
                   a16y
                   a16A))
               a16q)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta16j!val!7
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!4
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!6
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!3
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!1
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!0
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!5
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!2
;      ()
;      Sorta16j)
;   (forall
;      (
;        (x Sorta16j))
;      (or
;         (= x Sorta16j!val!7)
;         (= x Sorta16j!val!4)
;         (= x Sorta16j!val!6)
;         (= x Sorta16j!val!3)
;         (= x Sorta16j!val!1)
;         (= x Sorta16j!val!0)
;         (= x Sorta16j!val!5)
;         (= x Sorta16j!val!2)))
;   (declare-fun
;      Sorta16i!val!0
;      ()
;      Sorta16i)
;   (forall
;      (
;        (x Sorta16i))
;      (= x Sorta16i!val!0))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a16M a16m))
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
;                      (_ map both8528552514521964173)
;                      (
;                        (_ map both8528552514521964173)
;                        a16x
;                        a16y)
;                      a16A)
;                    a16o)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8528552514521964173)
;                      a16x
;                      (
;                        (_ map both8528552514521964173)
;                        a16y
;                        a16A))
;                    a16q))))
;         (or a!1 a!2)))
;   (define-fun
;      a16n
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!5)))
;   (define-fun
;      a171
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16q
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16o
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16m
;           a16n)
;         a16R))
;   (define-fun
;      a16p
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      a16x
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!0))
;         Sorta16i!val!0
;         (just Sorta16j!val!3)))
;   (define-fun
;      a16y
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!1))
;         Sorta16i!val!0
;         (just Sorta16j!val!6)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a16W a16p))
;   (define-fun
;      a16A
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16l
;           a16n)
;         a16W))
;   (define-fun
;      a16m
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a171 a16q))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a16R a16o))
;   (define-fun
;      a16l
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      a16R
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16W
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      a16k
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!7))
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16M
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16l)
;         a16M))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16p)
;         a171))
;   (define-fun
;      both8528552514521964173
;      (
;        (x!0
;           (Maybe Sorta16j))
;        (x!1
;           (Maybe Sorta16j)))
;      (Maybe Sorta16j)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta16j!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta16j!val!0))
;                  (=
;                     x!1
;                     (just Sorta16j!val!1)))
;               (just Sorta16j!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta16j!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta16j!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta16j!val!2))
;                           (=
;                              x!1
;                              (just Sorta16j!val!5)))
;                        (just Sorta16j!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta16j!val!3))
;                              (=
;                                 x!1
;                                 (just Sorta16j!val!6)))
;                           (just Sorta16j!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta16j!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta16j!val!4))
;                                    (=
;                                       x!1
;                                       (just Sorta16j!val!5)))
;                                 (just Sorta16j!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta16j!val!2))
;                                       (=
;                                          x!1
;                                          (just Sorta16j!val!4)))
;                                    (just Sorta16j!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just Sorta16j!val!6))
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
; [G] cobox_a16X {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a16S {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a172 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a16N {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a16Y {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a16O {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a16T {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a173 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a17I} {4}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a17N} {4}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a16i,a16j,a16l,a16n],a16W)
; (IntersectL [a16i,a16j,a16m,a16n],a16R)
; (IntersectL [a16i,a16j,a16k,a16p],a171)
; (IntersectL [a16i,a16j,a16k,a16l],a16M)
; (a16W,a16p)
; (a16M,a16m)
; (a16R,a16o)
; (a171,a16q)

; WANTEDS (Thoralf style)
; (IntersectL [a16i,a16j,IntersectL [a16i,a16j,a16x,a16y],a16A],a16o)
; (IntersectL [a16i,a16j,a16x,IntersectL [a16i,a16j,a16y,a16A]],a16q)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a17I} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17N} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; GIVENS (names)
;  a16k  <=  a
;  a16l  <=  b
;  a16m  <=  ab
;  a16n  <=  c
;  a16o  <=  abc
;  a16p  <=  bc
;  a16q  <=  abc'
;  a16M  <=  fsk_a16M
;  a16R  <=  fsk_a16R
;  a16W  <=  fsk_a16W
;  a171  <=  fsk_a171
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta16j)) (y (Maybe Sorta16j))) (=> (and ((_ is (just (Sorta16j) (Maybe Sorta16j))) x) ((_ is (just (Sorta16j) (Maybe Sorta16j))) y)) (= (both8528552514521964173 x y) x))))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta16j))) (= (both8528552514521964173 y (as nothing (Maybe Sorta16j))) (as nothing (Maybe Sorta16j)))))
; (declare-const a16M (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16R (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16W (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16k (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16l (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16m (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16n (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16o (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16p (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16q (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a171 (Array Sorta16i (Maybe Sorta16j)))
; (declare-fun both8528552514521964173 ((Maybe Sorta16j) (Maybe Sorta16j)) (Maybe Sorta16j))
; (declare-sort Sorta16i)
; (declare-sort Sorta16j)
; DECS1 (unseen) 
(declare-sort Sorta16i)
(declare-sort Sorta16j)
(declare-const
   a16k
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16l
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16m
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16n
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16o
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16p
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16q
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16M
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16R
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16W
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a171
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-fun
   both8528552514521964173
   (
     (Maybe Sorta16j)
     (Maybe Sorta16j))
   (Maybe Sorta16j))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173
            y
            (as
               nothing
               (Maybe Sorta16j)))
         (as
            nothing
            (Maybe Sorta16j)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta16j)))
      (=
         (both8528552514521964173 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta16j))
        (y
           (Maybe Sorta16j)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta16j)
                    (Maybe Sorta16j)))
              y))
         (=
            (both8528552514521964173 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16l
           a16n)
         a16W)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16m
           a16n)
         a16R)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16p)
         a171)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8528552514521964173)
           a16k
           a16l)
         a16M)
      :named
      given-3.4))
(assert
   (!
      (= a16W a16p)
      :named
      given-3.5))
(assert
   (!
      (= a16M a16m)
      :named
      given-3.6))
(assert
   (!
      (= a16R a16o)
      :named
      given-3.7))
(assert
   (!
      (= a171 a16q)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a17I} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      (
;        (_ map both8528552514521964173)
;        a16x
;        a16y)
;      a16A)
;    a16o)

;      [WD] hole{a17N} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8528552514521964173)
;      a16x
;      (
;        (_ map both8528552514521964173)
;        a16y
;        a16A))
;    a16q)

; WANTEDS (names)
;  a16o  <=  abc
;  a16q  <=  abc'
;  a16x  <=  a_a16x
;  a16y  <=  b_a16y
;  a16A  <=  c_a16A
; DECS2 (seen) 
; (declare-const a16A (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16x (Array Sorta16i (Maybe Sorta16j)))
; (declare-const a16y (Array Sorta16i (Maybe Sorta16j)))
; DECS2 (unseen) 
(declare-const
   a16x
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16y
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(declare-const
   a16A
   (Array
      Sorta16i
      (Maybe Sorta16j)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 (
                   (_ map both8528552514521964173)
                   a16x
                   a16y)
                 a16A)
               a16o))
         (not
            (=
               (
                 (_ map both8528552514521964173)
                 a16x
                 (
                   (_ map both8528552514521964173)
                   a16y
                   a16A))
               a16q)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta16j!val!7
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!4
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!6
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!3
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!1
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!0
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!5
;      ()
;      Sorta16j)
;   (declare-fun
;      Sorta16j!val!2
;      ()
;      Sorta16j)
;   (forall
;      (
;        (x Sorta16j))
;      (or
;         (= x Sorta16j!val!7)
;         (= x Sorta16j!val!4)
;         (= x Sorta16j!val!6)
;         (= x Sorta16j!val!3)
;         (= x Sorta16j!val!1)
;         (= x Sorta16j!val!0)
;         (= x Sorta16j!val!5)
;         (= x Sorta16j!val!2)))
;   (declare-fun
;      Sorta16i!val!0
;      ()
;      Sorta16i)
;   (forall
;      (
;        (x Sorta16i))
;      (= x Sorta16i!val!0))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a16M a16m))
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
;                      (_ map both8528552514521964173)
;                      (
;                        (_ map both8528552514521964173)
;                        a16x
;                        a16y)
;                      a16A)
;                    a16o)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8528552514521964173)
;                      a16x
;                      (
;                        (_ map both8528552514521964173)
;                        a16y
;                        a16A))
;                    a16q))))
;         (or a!1 a!2)))
;   (define-fun
;      a16n
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!5)))
;   (define-fun
;      a171
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16q
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16o
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16m
;           a16n)
;         a16R))
;   (define-fun
;      a16p
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      a16x
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!0))
;         Sorta16i!val!0
;         (just Sorta16j!val!3)))
;   (define-fun
;      a16y
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!1))
;         Sorta16i!val!0
;         (just Sorta16j!val!6)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a16W a16p))
;   (define-fun
;      a16A
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (
;        (as
;           const
;           (Array
;              Sorta16i
;              (Maybe Sorta16j)))
;        nothing))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16l
;           a16n)
;         a16W))
;   (define-fun
;      a16m
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a171 a16q))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a16R a16o))
;   (define-fun
;      a16l
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      a16R
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16W
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!4)))
;   (define-fun
;      a16k
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           (just Sorta16j!val!7))
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      a16M
;      ()
;      (Array
;         Sorta16i
;         (Maybe Sorta16j))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta16i
;                 (Maybe Sorta16j)))
;           nothing)
;         Sorta16i!val!0
;         (just Sorta16j!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16l)
;         a16M))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8528552514521964173)
;           a16k
;           a16p)
;         a171))
;   (define-fun
;      both8528552514521964173
;      (
;        (x!0
;           (Maybe Sorta16j))
;        (x!1
;           (Maybe Sorta16j)))
;      (Maybe Sorta16j)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta16j!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta16j!val!0))
;                  (=
;                     x!1
;                     (just Sorta16j!val!1)))
;               (just Sorta16j!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta16j!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta16j!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta16j!val!2))
;                           (=
;                              x!1
;                              (just Sorta16j!val!5)))
;                        (just Sorta16j!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta16j!val!3))
;                              (=
;                                 x!1
;                                 (just Sorta16j!val!6)))
;                           (just Sorta16j!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta16j!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta16j!val!4))
;                                    (=
;                                       x!1
;                                       (just Sorta16j!val!5)))
;                                 (just Sorta16j!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta16j!val!2))
;                                       (=
;                                          x!1
;                                          (just Sorta16j!val!4)))
;                                    (just Sorta16j!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just Sorta16j!val!6))
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
; [G] cobox_a18U {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a18P {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a18Z {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a18K {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a18V {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a18L {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a18Q {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a190 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a19k} {3}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a19w} {3}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a18f,a18g,a18i,a18k],a18T)
; (UnionL [a18f,a18g,a18j,a18k],a18O)
; (UnionL [a18f,a18g,a18h,a18m],a18Y)
; (UnionL [a18f,a18g,a18h,a18i],a18J)
; (a18T,a18m)
; (a18J,a18j)
; (a18O,a18l)
; (a18Y,a18n)

; WANTEDS (Thoralf style)
; (UnionL [a18f,a18g,UnionL [a18f,a18g,a18u,a18v],a18x],a18l)
; (UnionL [a18f,a18g,a18u,UnionL [a18f,a18g,a18v,a18x]],a18n)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a19k} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19w} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; GIVENS (names)
;  a18h  <=  a
;  a18i  <=  b
;  a18j  <=  ab
;  a18k  <=  c
;  a18l  <=  abc
;  a18m  <=  bc
;  a18n  <=  abc'
;  a18J  <=  fsk_a18J
;  a18O  <=  fsk_a18O
;  a18T  <=  fsk_a18T
;  a18Y  <=  fsk_a18Y
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta18g)) (y (Maybe Sorta18g))) (=> ((_ is (just (Sorta18g) (Maybe Sorta18g))) x) (= (either8515027421985989796 x y) x))))
; (assert (forall ((y (Maybe Sorta18g))) (= (either8515027421985989796 (as nothing (Maybe Sorta18g)) y) y)))
; (declare-const a18J (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18O (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18T (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18Y (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18h (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18i (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18j (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18k (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18l (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18m (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18n (Array Sorta18f (Maybe Sorta18g)))
; (declare-fun either8515027421985989796 ((Maybe Sorta18g) (Maybe Sorta18g)) (Maybe Sorta18g))
; (declare-sort Sorta18f)
; (declare-sort Sorta18g)
(declare-sort Sorta18f)
(declare-sort Sorta18g)
(declare-const
   a18h
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18i
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18j
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18k
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18l
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18m
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18n
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18J
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18O
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18T
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18Y
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-fun
   either8515027421985989796
   (
     (Maybe Sorta18g)
     (Maybe Sorta18g))
   (Maybe Sorta18g))
(assert
   (forall
      (
        (y
           (Maybe Sorta18g)))
      (=
         (either8515027421985989796
            (as
               nothing
               (Maybe Sorta18g))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18g))
        (y
           (Maybe Sorta18g)))
      (=>
         (
           (_
              is
              (just
                 (Sorta18g)
                 (Maybe Sorta18g)))
           x)
         (=
            (either8515027421985989796 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18i
           a18k)
         a18T)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18j
           a18k)
         a18O)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18m)
         a18Y)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18i)
         a18J)
      :named
      given-5.4))
(assert
   (!
      (= a18T a18m)
      :named
      given-5.5))
(assert
   (!
      (= a18J a18j)
      :named
      given-5.6))
(assert
   (!
      (= a18O a18l)
      :named
      given-5.7))
(assert
   (!
      (= a18Y a18n)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{a19k} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19w} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; WANTEDS (names)
;  a18l  <=  abc
;  a18n  <=  abc'
;  a18u  <=  a_a18u
;  a18v  <=  b_a18v
;  a18x  <=  c_a18x
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a18u (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18v (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18x (Array Sorta18f (Maybe Sorta18g)))
(declare-const
   a18u
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18v
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18x
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 (
                   (_ map either8515027421985989796)
                   a18u
                   a18v)
                 a18x)
               a18l))
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 a18u
                 (
                   (_ map either8515027421985989796)
                   a18v
                   a18x))
               a18n)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      Sorta18f!val!1
;      ()
;      Sorta18f)
;   (declare-fun
;      Sorta18f!val!0
;      ()
;      Sorta18f)
;   (forall
;      (
;        (x Sorta18f))
;      (or
;         (= x Sorta18f!val!1)
;         (= x Sorta18f!val!0)))
;   (declare-fun
;      Sorta18g!val!5
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!0
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!1
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!4
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!2
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!3
;      ()
;      Sorta18g)
;   (forall
;      (
;        (x Sorta18g))
;      (or
;         (= x Sorta18g!val!5)
;         (= x Sorta18g!val!0)
;         (= x Sorta18g!val!1)
;         (= x Sorta18g!val!4)
;         (= x Sorta18g!val!2)
;         (= x Sorta18g!val!3)))
;   (define-fun
;      a18J
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            nothing)
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
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
;                      (_ map either8515027421985989796)
;                      (
;                        (_ map either8515027421985989796)
;                        a18u
;                        a18v)
;                      a18x)
;                    a18l)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8515027421985989796)
;                      a18u
;                      (
;                        (_ map either8515027421985989796)
;                        a18v
;                        a18x))
;                    a18n))))
;         (or a!1 a!2)))
;   (define-fun
;      a18l
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18u
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18i
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            nothing)
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18j
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            nothing)
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18v
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18i
;           a18k)
;         a18T))
;   (define-fun
;      a18n
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!0))
;            Sorta18f!val!1
;            (just Sorta18g!val!2))
;         Sorta18f!val!0
;         (just Sorta18g!val!1)))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18i)
;         a18J))
;   (define-fun
;      a18T
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= a18Y a18n))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18m)
;         a18Y))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= a18J a18j))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= a18O a18l))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18j
;           a18k)
;         a18O))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= a18T a18m))
;   (define-fun
;      a18k
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           nothing)
;         Sorta18f!val!1
;         (just Sorta18g!val!3)))
;   (define-fun
;      a18O
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18h
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18m
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18Y
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      k!73
;      (
;        (x!0 Sorta18f))
;      (Maybe Sorta18g)
;      (ite
;         (= x!0 Sorta18f!val!1)
;         (just Sorta18g!val!3)
;         (ite
;            (= x!0 Sorta18f!val!0)
;            (just Sorta18g!val!4)
;            (just Sorta18g!val!5))))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta18f))
;      (Maybe Sorta18g)
;      (ite
;         (= x!0 Sorta18f!val!1)
;         (just Sorta18g!val!2)
;         (ite
;            (= x!0 Sorta18f!val!0)
;            (just Sorta18g!val!1)
;            (just Sorta18g!val!0))))
;   (define-fun
;      either8515027421985989796
;      (
;        (x!0
;           (Maybe Sorta18g))
;        (x!1
;           (Maybe Sorta18g)))
;      (Maybe Sorta18g)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta18g!val!5))
;            (= x!1 nothing))
;         (just Sorta18g!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta18g!val!5)))
;            (just Sorta18g!val!5)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just Sorta18g!val!0)))
;               (just Sorta18g!val!0)
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta18g!val!1)))
;                     (just Sorta18g!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta18g!val!4)))
;                        (just Sorta18g!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta18g!val!3)))
;                           (just Sorta18g!val!3)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta18g!val!2)))
;                              (just Sorta18g!val!2)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta18g!val!4))
;                                    (= x!1 nothing))
;                                 (just Sorta18g!val!4)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1))))))))))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a18U {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a18P {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a18Z {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a18K {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a18V {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a18L {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a18Q {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a190 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a19k} {3}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a19w} {3}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a18f,a18g,a18i,a18k],a18T)
; (UnionL [a18f,a18g,a18j,a18k],a18O)
; (UnionL [a18f,a18g,a18h,a18m],a18Y)
; (UnionL [a18f,a18g,a18h,a18i],a18J)
; (a18T,a18m)
; (a18J,a18j)
; (a18O,a18l)
; (a18Y,a18n)

; WANTEDS (Thoralf style)
; (UnionL [a18f,a18g,UnionL [a18f,a18g,a18u,a18v],a18x],a18l)
; (UnionL [a18f,a18g,a18u,UnionL [a18f,a18g,a18v,a18x]],a18n)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a19k} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19w} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; GIVENS (names)
;  a18h  <=  a
;  a18i  <=  b
;  a18j  <=  ab
;  a18k  <=  c
;  a18l  <=  abc
;  a18m  <=  bc
;  a18n  <=  abc'
;  a18J  <=  fsk_a18J
;  a18O  <=  fsk_a18O
;  a18T  <=  fsk_a18T
;  a18Y  <=  fsk_a18Y
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta18g)) (y (Maybe Sorta18g))) (=> ((_ is (just (Sorta18g) (Maybe Sorta18g))) x) (= (either8515027421985989796 x y) x))))
; (assert (forall ((y (Maybe Sorta18g))) (= (either8515027421985989796 (as nothing (Maybe Sorta18g)) y) y)))
; (declare-const a18J (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18O (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18T (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18Y (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18h (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18i (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18j (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18k (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18l (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18m (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18n (Array Sorta18f (Maybe Sorta18g)))
; (declare-fun either8515027421985989796 ((Maybe Sorta18g) (Maybe Sorta18g)) (Maybe Sorta18g))
; (declare-sort Sorta18f)
; (declare-sort Sorta18g)
(declare-sort Sorta18f)
(declare-sort Sorta18g)
(declare-const
   a18h
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18i
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18j
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18k
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18l
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18m
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18n
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18J
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18O
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18T
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18Y
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-fun
   either8515027421985989796
   (
     (Maybe Sorta18g)
     (Maybe Sorta18g))
   (Maybe Sorta18g))
(assert
   (forall
      (
        (y
           (Maybe Sorta18g)))
      (=
         (either8515027421985989796
            (as
               nothing
               (Maybe Sorta18g))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18g))
        (y
           (Maybe Sorta18g)))
      (=>
         (
           (_
              is
              (just
                 (Sorta18g)
                 (Maybe Sorta18g)))
           x)
         (=
            (either8515027421985989796 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18i
           a18k)
         a18T)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18j
           a18k)
         a18O)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18m)
         a18Y)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18i)
         a18J)
      :named
      given-5.4))
(assert
   (!
      (= a18T a18m)
      :named
      given-5.5))
(assert
   (!
      (= a18J a18j)
      :named
      given-5.6))
(assert
   (!
      (= a18O a18l)
      :named
      given-5.7))
(assert
   (!
      (= a18Y a18n)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{a19k} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19w} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; WANTEDS (names)
;  a18l  <=  abc
;  a18n  <=  abc'
;  a18u  <=  a_a18u
;  a18v  <=  b_a18v
;  a18x  <=  c_a18x
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a18u (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18v (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18x (Array Sorta18f (Maybe Sorta18g)))
(declare-const
   a18u
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18v
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18x
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 (
                   (_ map either8515027421985989796)
                   a18u
                   a18v)
                 a18x)
               a18l))
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 a18u
                 (
                   (_ map either8515027421985989796)
                   a18v
                   a18x))
               a18n)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      Sorta18f!val!1
;      ()
;      Sorta18f)
;   (declare-fun
;      Sorta18f!val!0
;      ()
;      Sorta18f)
;   (forall
;      (
;        (x Sorta18f))
;      (or
;         (= x Sorta18f!val!1)
;         (= x Sorta18f!val!0)))
;   (declare-fun
;      Sorta18g!val!5
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!0
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!1
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!4
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!2
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!3
;      ()
;      Sorta18g)
;   (forall
;      (
;        (x Sorta18g))
;      (or
;         (= x Sorta18g!val!5)
;         (= x Sorta18g!val!0)
;         (= x Sorta18g!val!1)
;         (= x Sorta18g!val!4)
;         (= x Sorta18g!val!2)
;         (= x Sorta18g!val!3)))
;   (define-fun
;      a18J
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            nothing)
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
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
;                      (_ map either8515027421985989796)
;                      (
;                        (_ map either8515027421985989796)
;                        a18u
;                        a18v)
;                      a18x)
;                    a18l)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8515027421985989796)
;                      a18u
;                      (
;                        (_ map either8515027421985989796)
;                        a18v
;                        a18x))
;                    a18n))))
;         (or a!1 a!2)))
;   (define-fun
;      a18l
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18u
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18i
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            nothing)
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18j
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            nothing)
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18v
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18i
;           a18k)
;         a18T))
;   (define-fun
;      a18n
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!0))
;            Sorta18f!val!1
;            (just Sorta18g!val!2))
;         Sorta18f!val!0
;         (just Sorta18g!val!1)))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18i)
;         a18J))
;   (define-fun
;      a18T
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= a18Y a18n))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18m)
;         a18Y))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= a18J a18j))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= a18O a18l))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18j
;           a18k)
;         a18O))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= a18T a18m))
;   (define-fun
;      a18k
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           nothing)
;         Sorta18f!val!1
;         (just Sorta18g!val!3)))
;   (define-fun
;      a18O
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18h
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18m
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18Y
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta18f
;                    (Maybe Sorta18g)))
;              (just Sorta18g!val!5))
;            Sorta18f!val!1
;            (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      k!73
;      (
;        (x!0 Sorta18f))
;      (Maybe Sorta18g)
;      (ite
;         (= x!0 Sorta18f!val!1)
;         (just Sorta18g!val!3)
;         (ite
;            (= x!0 Sorta18f!val!0)
;            (just Sorta18g!val!4)
;            (just Sorta18g!val!5))))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta18f))
;      (Maybe Sorta18g)
;      (ite
;         (= x!0 Sorta18f!val!1)
;         (just Sorta18g!val!2)
;         (ite
;            (= x!0 Sorta18f!val!0)
;            (just Sorta18g!val!1)
;            (just Sorta18g!val!0))))
;   (define-fun
;      either8515027421985989796
;      (
;        (x!0
;           (Maybe Sorta18g))
;        (x!1
;           (Maybe Sorta18g)))
;      (Maybe Sorta18g)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta18g!val!5))
;            (= x!1 nothing))
;         (just Sorta18g!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta18g!val!5)))
;            (just Sorta18g!val!5)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just Sorta18g!val!0)))
;               (just Sorta18g!val!0)
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta18g!val!1)))
;                     (just Sorta18g!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta18g!val!4)))
;                        (just Sorta18g!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta18g!val!3)))
;                           (just Sorta18g!val!3)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta18g!val!2)))
;                              (just Sorta18g!val!2)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta18g!val!4))
;                                    (= x!1 nothing))
;                                 (just Sorta18g!val!4)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1))))))))))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a18U {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a18P {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a18Z {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a18K {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a18V {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a18L {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a18Q {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a190 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a19B} {4}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a19G} {4}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a18f,a18g,a18i,a18k],a18T)
; (UnionL [a18f,a18g,a18j,a18k],a18O)
; (UnionL [a18f,a18g,a18h,a18m],a18Y)
; (UnionL [a18f,a18g,a18h,a18i],a18J)
; (a18T,a18m)
; (a18J,a18j)
; (a18O,a18l)
; (a18Y,a18n)

; WANTEDS (Thoralf style)
; (UnionL [a18f,a18g,UnionL [a18f,a18g,a18u,a18v],a18x],a18l)
; (UnionL [a18f,a18g,a18u,UnionL [a18f,a18g,a18v,a18x]],a18n)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{a19B} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19G} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; GIVENS (names)
;  a18h  <=  a
;  a18i  <=  b
;  a18j  <=  ab
;  a18k  <=  c
;  a18l  <=  abc
;  a18m  <=  bc
;  a18n  <=  abc'
;  a18J  <=  fsk_a18J
;  a18O  <=  fsk_a18O
;  a18T  <=  fsk_a18T
;  a18Y  <=  fsk_a18Y
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta18g)) (y (Maybe Sorta18g))) (=> ((_ is (just (Sorta18g) (Maybe Sorta18g))) x) (= (either8515027421985989796 x y) x))))
; (assert (forall ((y (Maybe Sorta18g))) (= (either8515027421985989796 (as nothing (Maybe Sorta18g)) y) y)))
; (declare-const a18J (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18O (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18T (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18Y (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18h (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18i (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18j (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18k (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18l (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18m (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18n (Array Sorta18f (Maybe Sorta18g)))
; (declare-fun either8515027421985989796 ((Maybe Sorta18g) (Maybe Sorta18g)) (Maybe Sorta18g))
; (declare-sort Sorta18f)
; (declare-sort Sorta18g)
; DECS1 (unseen) 
(declare-sort Sorta18f)
(declare-sort Sorta18g)
(declare-const
   a18h
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18i
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18j
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18k
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18l
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18m
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18n
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18J
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18O
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18T
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18Y
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-fun
   either8515027421985989796
   (
     (Maybe Sorta18g)
     (Maybe Sorta18g))
   (Maybe Sorta18g))
(assert
   (forall
      (
        (y
           (Maybe Sorta18g)))
      (=
         (either8515027421985989796
            (as
               nothing
               (Maybe Sorta18g))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18g))
        (y
           (Maybe Sorta18g)))
      (=>
         (
           (_
              is
              (just
                 (Sorta18g)
                 (Maybe Sorta18g)))
           x)
         (=
            (either8515027421985989796 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18i
           a18k)
         a18T)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18j
           a18k)
         a18O)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18m)
         a18Y)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18i)
         a18J)
      :named
      given-6.4))
(assert
   (!
      (= a18T a18m)
      :named
      given-6.5))
(assert
   (!
      (= a18J a18j)
      :named
      given-6.6))
(assert
   (!
      (= a18O a18l)
      :named
      given-6.7))
(assert
   (!
      (= a18Y a18n)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{a19B} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19G} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; WANTEDS (names)
;  a18l  <=  abc
;  a18n  <=  abc'
;  a18u  <=  a_a18u
;  a18v  <=  b_a18v
;  a18x  <=  c_a18x
; DECS2 (seen) 
; (declare-const a18u (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18v (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18x (Array Sorta18f (Maybe Sorta18g)))
; DECS2 (unseen) 
(declare-const
   a18u
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18v
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18x
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 (
                   (_ map either8515027421985989796)
                   a18u
                   a18v)
                 a18x)
               a18l))
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 a18u
                 (
                   (_ map either8515027421985989796)
                   a18v
                   a18x))
               a18n)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      Sorta18f!val!0
;      ()
;      Sorta18f)
;   (forall
;      (
;        (x Sorta18f))
;      (= x Sorta18f!val!0))
;   (declare-fun
;      Sorta18g!val!0
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!1
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!4
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!2
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!3
;      ()
;      Sorta18g)
;   (forall
;      (
;        (x Sorta18g))
;      (or
;         (= x Sorta18g!val!0)
;         (= x Sorta18g!val!1)
;         (= x Sorta18g!val!4)
;         (= x Sorta18g!val!2)
;         (= x Sorta18g!val!3)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= a18Y a18n))
;   (define-fun
;      a18Y
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18i)
;         a18J))
;   (define-fun
;      a18J
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18j
;           a18k)
;         a18O))
;   (define-fun
;      a18l
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18u
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18i
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18j
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18v
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= a18T a18m))
;   (define-fun
;      a18n
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!1))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18O
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18T
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18m)
;         a18Y))
;   (define-fun
;      a18k
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18h
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18i
;           a18k)
;         a18T))
;   (define-fun
;      a18m
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= a18O a18l))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= a18J a18j))
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
;                      (_ map either8515027421985989796)
;                      (
;                        (_ map either8515027421985989796)
;                        a18u
;                        a18v)
;                      a18x)
;                    a18l)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8515027421985989796)
;                      a18u
;                      (
;                        (_ map either8515027421985989796)
;                        a18v
;                        a18x))
;                    a18n))))
;         (or a!1 a!2)))
;   (define-fun
;      either8515027421985989796
;      (
;        (x!0
;           (Maybe Sorta18g))
;        (x!1
;           (Maybe Sorta18g)))
;      (Maybe Sorta18g)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta18g!val!3))
;            (= x!1 nothing))
;         (just Sorta18g!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta18g!val!3)))
;            (just Sorta18g!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just Sorta18g!val!1)))
;               (just Sorta18g!val!1)
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta18g!val!0))
;                        (= x!1 nothing))
;                     (just Sorta18g!val!0)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta18g!val!2)))
;                        (just Sorta18g!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta18g!val!2))
;                              (= x!1 nothing))
;                           (just Sorta18g!val!2)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta18g!val!4)))
;                              (just Sorta18g!val!4)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1)))))))))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a18U {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a18P {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a18Z {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a18K {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a18V {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a18L {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a18Q {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a190 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a19B} {4}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a19G} {4}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a18f,a18g,a18i,a18k],a18T)
; (UnionL [a18f,a18g,a18j,a18k],a18O)
; (UnionL [a18f,a18g,a18h,a18m],a18Y)
; (UnionL [a18f,a18g,a18h,a18i],a18J)
; (a18T,a18m)
; (a18J,a18j)
; (a18O,a18l)
; (a18Y,a18n)

; WANTEDS (Thoralf style)
; (UnionL [a18f,a18g,UnionL [a18f,a18g,a18u,a18v],a18x],a18l)
; (UnionL [a18f,a18g,a18u,UnionL [a18f,a18g,a18v,a18x]],a18n)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{a19B} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19G} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; GIVENS (names)
;  a18h  <=  a
;  a18i  <=  b
;  a18j  <=  ab
;  a18k  <=  c
;  a18l  <=  abc
;  a18m  <=  bc
;  a18n  <=  abc'
;  a18J  <=  fsk_a18J
;  a18O  <=  fsk_a18O
;  a18T  <=  fsk_a18T
;  a18Y  <=  fsk_a18Y
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta18g)) (y (Maybe Sorta18g))) (=> ((_ is (just (Sorta18g) (Maybe Sorta18g))) x) (= (either8515027421985989796 x y) x))))
; (assert (forall ((y (Maybe Sorta18g))) (= (either8515027421985989796 (as nothing (Maybe Sorta18g)) y) y)))
; (declare-const a18J (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18O (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18T (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18Y (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18h (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18i (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18j (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18k (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18l (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18m (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18n (Array Sorta18f (Maybe Sorta18g)))
; (declare-fun either8515027421985989796 ((Maybe Sorta18g) (Maybe Sorta18g)) (Maybe Sorta18g))
; (declare-sort Sorta18f)
; (declare-sort Sorta18g)
; DECS1 (unseen) 
(declare-sort Sorta18f)
(declare-sort Sorta18g)
(declare-const
   a18h
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18i
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18j
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18k
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18l
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18m
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18n
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18J
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18O
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18T
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18Y
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-fun
   either8515027421985989796
   (
     (Maybe Sorta18g)
     (Maybe Sorta18g))
   (Maybe Sorta18g))
(assert
   (forall
      (
        (y
           (Maybe Sorta18g)))
      (=
         (either8515027421985989796
            (as
               nothing
               (Maybe Sorta18g))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18g))
        (y
           (Maybe Sorta18g)))
      (=>
         (
           (_
              is
              (just
                 (Sorta18g)
                 (Maybe Sorta18g)))
           x)
         (=
            (either8515027421985989796 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18i
           a18k)
         a18T)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18j
           a18k)
         a18O)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18m)
         a18Y)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8515027421985989796)
           a18h
           a18i)
         a18J)
      :named
      given-6.4))
(assert
   (!
      (= a18T a18m)
      :named
      given-6.5))
(assert
   (!
      (= a18J a18j)
      :named
      given-6.6))
(assert
   (!
      (= a18O a18l)
      :named
      given-6.7))
(assert
   (!
      (= a18Y a18n)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{a19B} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      (
;        (_ map either8515027421985989796)
;        a18u
;        a18v)
;      a18x)
;    a18l)

;      [WD] hole{a19G} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8515027421985989796)
;      a18u
;      (
;        (_ map either8515027421985989796)
;        a18v
;        a18x))
;    a18n)

; WANTEDS (names)
;  a18l  <=  abc
;  a18n  <=  abc'
;  a18u  <=  a_a18u
;  a18v  <=  b_a18v
;  a18x  <=  c_a18x
; DECS2 (seen) 
; (declare-const a18u (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18v (Array Sorta18f (Maybe Sorta18g)))
; (declare-const a18x (Array Sorta18f (Maybe Sorta18g)))
; DECS2 (unseen) 
(declare-const
   a18u
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18v
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(declare-const
   a18x
   (Array
      Sorta18f
      (Maybe Sorta18g)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 (
                   (_ map either8515027421985989796)
                   a18u
                   a18v)
                 a18x)
               a18l))
         (not
            (=
               (
                 (_ map either8515027421985989796)
                 a18u
                 (
                   (_ map either8515027421985989796)
                   a18v
                   a18x))
               a18n)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      Sorta18f!val!0
;      ()
;      Sorta18f)
;   (forall
;      (
;        (x Sorta18f))
;      (= x Sorta18f!val!0))
;   (declare-fun
;      Sorta18g!val!0
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!1
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!4
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!2
;      ()
;      Sorta18g)
;   (declare-fun
;      Sorta18g!val!3
;      ()
;      Sorta18g)
;   (forall
;      (
;        (x Sorta18g))
;      (or
;         (= x Sorta18g!val!0)
;         (= x Sorta18g!val!1)
;         (= x Sorta18g!val!4)
;         (= x Sorta18g!val!2)
;         (= x Sorta18g!val!3)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= a18Y a18n))
;   (define-fun
;      a18Y
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18i)
;         a18J))
;   (define-fun
;      a18J
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18j
;           a18k)
;         a18O))
;   (define-fun
;      a18l
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18u
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18i
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18j
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18v
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= a18T a18m))
;   (define-fun
;      a18n
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!1))
;         Sorta18f!val!0
;         (just Sorta18g!val!4)))
;   (define-fun
;      a18O
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      a18T
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18h
;           a18m)
;         a18Y))
;   (define-fun
;      a18k
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      a18h
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (
;        (as
;           const
;           (Array
;              Sorta18f
;              (Maybe Sorta18g)))
;        nothing))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8515027421985989796)
;           a18i
;           a18k)
;         a18T))
;   (define-fun
;      a18m
;      ()
;      (Array
;         Sorta18f
;         (Maybe Sorta18g))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18f
;                 (Maybe Sorta18g)))
;           (just Sorta18g!val!3))
;         Sorta18f!val!0
;         (just Sorta18g!val!2)))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= a18O a18l))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= a18J a18j))
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
;                      (_ map either8515027421985989796)
;                      (
;                        (_ map either8515027421985989796)
;                        a18u
;                        a18v)
;                      a18x)
;                    a18l)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8515027421985989796)
;                      a18u
;                      (
;                        (_ map either8515027421985989796)
;                        a18v
;                        a18x))
;                    a18n))))
;         (or a!1 a!2)))
;   (define-fun
;      either8515027421985989796
;      (
;        (x!0
;           (Maybe Sorta18g))
;        (x!1
;           (Maybe Sorta18g)))
;      (Maybe Sorta18g)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta18g!val!3))
;            (= x!1 nothing))
;         (just Sorta18g!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta18g!val!3)))
;            (just Sorta18g!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just Sorta18g!val!1)))
;               (just Sorta18g!val!1)
;               (ite
;                  (and
;                     (= x!0 nothing)
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta18g!val!0))
;                        (= x!1 nothing))
;                     (just Sorta18g!val!0)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta18g!val!2)))
;                        (just Sorta18g!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta18g!val!2))
;                              (= x!1 nothing))
;                           (just Sorta18g!val!2)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta18g!val!4)))
;                              (just Sorta18g!val!4)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1)))))))))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a1ak {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1ag {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1al {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1am {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1av} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1a2,"ok",2],a1aj)
; (Alter [Symbol [],Nat [],a1a1,"ok",2],a1af)
; (a1aj,a1a3)
; (a1af,a1a2)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1a6,"ok",2],a1a2)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a1av} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1a6
;       "ok"
;       (just 2))
;    a1a2)

; GIVENS (names)
;  a1a1  <=  m1
;  a1a2  <=  m2
;  a1a3  <=  m3
;  a1af  <=  fsk_a1af
;  a1aj  <=  fsk_a1aj
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1a1 (Array String (Maybe Int)))
; (declare-const a1a2 (Array String (Maybe Int)))
; (declare-const a1a3 (Array String (Maybe Int)))
; (declare-const a1af (Array String (Maybe Int)))
; (declare-const a1aj (Array String (Maybe Int)))
(declare-const
   a1a1
   (Array
      String
      (Maybe Int)))
(declare-const
   a1a2
   (Array
      String
      (Maybe Int)))
(declare-const
   a1a3
   (Array
      String
      (Maybe Int)))
(declare-const
   a1af
   (Array
      String
      (Maybe Int)))
(declare-const
   a1aj
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1a2
            "ok"
            (just 2))
         a1aj)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1a1
            "ok"
            (just 2))
         a1af)
      :named
      given-8.2))
(assert
   (!
      (= a1aj a1a3)
      :named
      given-8.3))
(assert
   (!
      (= a1af a1a2)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a1av} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1a6
;       "ok"
;       (just 2))
;    a1a2)

; WANTEDS (names)
;  a1a2  <=  m2
;  a1a6  <=  m1_a1a6
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1a6 (Array String (Maybe Int)))
(declare-const
   a1a6
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1a6
               "ok"
               (just 2))
            a1a2))
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
;      (= a1aj a1a3))
;   (define-fun
;      a1a1
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
;      given-8.4
;      ()
;      Bool
;      (= a1af a1a2))
;   (define-fun
;      a1a3
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
;      a1af
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
;      a1a6
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
;      given-8.2
;      ()
;      Bool
;      (=
;         (store
;            a1a1
;            "ok"
;            (just 2))
;         a1af))
;   (define-fun
;      a1aj
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
;               a1a6
;               "ok"
;               (just 2))
;            a1a2)))
;   (define-fun
;      a1a2
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
;            a1a2
;            "ok"
;            (just 2))
;         a1aj)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a1ak {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1ag {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1al {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1am {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1av} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1a2,"ok",2],a1aj)
; (Alter [Symbol [],Nat [],a1a1,"ok",2],a1af)
; (a1aj,a1a3)
; (a1af,a1a2)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1a6,"ok",2],a1a2)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a1av} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1a6
;       "ok"
;       (just 2))
;    a1a2)

; GIVENS (names)
;  a1a1  <=  m1
;  a1a2  <=  m2
;  a1a3  <=  m3
;  a1af  <=  fsk_a1af
;  a1aj  <=  fsk_a1aj
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1a1 (Array String (Maybe Int)))
; (declare-const a1a2 (Array String (Maybe Int)))
; (declare-const a1a3 (Array String (Maybe Int)))
; (declare-const a1af (Array String (Maybe Int)))
; (declare-const a1aj (Array String (Maybe Int)))
(declare-const
   a1a1
   (Array
      String
      (Maybe Int)))
(declare-const
   a1a2
   (Array
      String
      (Maybe Int)))
(declare-const
   a1a3
   (Array
      String
      (Maybe Int)))
(declare-const
   a1af
   (Array
      String
      (Maybe Int)))
(declare-const
   a1aj
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1a2
            "ok"
            (just 2))
         a1aj)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1a1
            "ok"
            (just 2))
         a1af)
      :named
      given-8.2))
(assert
   (!
      (= a1aj a1a3)
      :named
      given-8.3))
(assert
   (!
      (= a1af a1a2)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a1av} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1a6
;       "ok"
;       (just 2))
;    a1a2)

; WANTEDS (names)
;  a1a2  <=  m2
;  a1a6  <=  m1_a1a6
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1a6 (Array String (Maybe Int)))
(declare-const
   a1a6
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1a6
               "ok"
               (just 2))
            a1a2))
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
;      (= a1aj a1a3))
;   (define-fun
;      a1a1
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
;      given-8.4
;      ()
;      Bool
;      (= a1af a1a2))
;   (define-fun
;      a1a3
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
;      a1af
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
;      a1a6
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
;      given-8.2
;      ()
;      Bool
;      (=
;         (store
;            a1a1
;            "ok"
;            (just 2))
;         a1af))
;   (define-fun
;      a1aj
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
;               a1a6
;               "ok"
;               (just 2))
;            a1a2)))
;   (define-fun
;      a1a2
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
;            a1a2
;            "ok"
;            (just 2))
;         a1aj)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a1ba {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1b6 {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1bb {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1bc {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1bl} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1aP,a1aR,"bob"],a1b9)
; (Delete [Symbol [],a1aP,a1aQ,"bob"],a1b5)
; (a1b9,a1aS)
; (a1b5,a1aR)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1aP,a1aW,"bob"],a1aR)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{a1bl} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1aW
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1aP)))
;    a1aR)

; GIVENS (names)
;  a1aQ  <=  m1
;  a1aR  <=  m2
;  a1aS  <=  m3
;  a1b5  <=  fsk_a1b5
;  a1b9  <=  fsk_a1b9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1aQ (Array String (Maybe Sorta1aP)))
; (declare-const a1aR (Array String (Maybe Sorta1aP)))
; (declare-const a1aS (Array String (Maybe Sorta1aP)))
; (declare-const a1b5 (Array String (Maybe Sorta1aP)))
; (declare-const a1b9 (Array String (Maybe Sorta1aP)))
; (declare-sort Sorta1aP)
(declare-sort Sorta1aP)
(declare-const
   a1aQ
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1aR
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1aS
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1b5
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1b9
   (Array
      String
      (Maybe Sorta1aP)))
(assert
   (!
      (=
         (store
            a1aR
            "bob"
            (as
               nothing
               (Maybe Sorta1aP)))
         a1b9)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1aQ
            "bob"
            (as
               nothing
               (Maybe Sorta1aP)))
         a1b5)
      :named
      given-10.2))
(assert
   (!
      (= a1b9 a1aS)
      :named
      given-10.3))
(assert
   (!
      (= a1b5 a1aR)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{a1bl} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1aW
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1aP)))
;    a1aR)

; WANTEDS (names)
;  a1aR  <=  m2
;  a1aW  <=  m1_a1aW
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1aW (Array String (Maybe Sorta1aP)))
(declare-const
   a1aW
   (Array
      String
      (Maybe Sorta1aP)))
(assert
   (!
      (not
         (=
            (store
               a1aW
               "bob"
               (as
                  nothing
                  (Maybe Sorta1aP)))
            a1aR))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      Sorta1aP!val!2
;      ()
;      Sorta1aP)
;   (declare-fun
;      Sorta1aP!val!0
;      ()
;      Sorta1aP)
;   (declare-fun
;      Sorta1aP!val!1
;      ()
;      Sorta1aP)
;   (forall
;      (
;        (x Sorta1aP))
;      (or
;         (= x Sorta1aP!val!2)
;         (= x Sorta1aP!val!0)
;         (= x Sorta1aP!val!1)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store a1aR "bob" nothing)
;         a1b9))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= a1b5 a1aR))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store a1aQ "bob" nothing)
;         a1b5))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= a1b9 a1aS))
;   (define-fun
;      a1aR
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1aQ
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1aP)))
;           (just Sorta1aP!val!1))
;         "b"
;         nothing))
;   (define-fun
;      a1aS
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1aW
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1aP)))
;           (just Sorta1aP!val!2))
;         "b"
;         (just Sorta1aP!val!0)))
;   (define-fun
;      a1b5
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store a1aW "bob" nothing)
;            a1aR)))
;   (define-fun
;      a1b9
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing)))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a1ba {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1b6 {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1bb {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1bc {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1bl} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1aP,a1aR,"bob"],a1b9)
; (Delete [Symbol [],a1aP,a1aQ,"bob"],a1b5)
; (a1b9,a1aS)
; (a1b5,a1aR)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1aP,a1aW,"bob"],a1aR)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{a1bl} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1aW
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1aP)))
;    a1aR)

; GIVENS (names)
;  a1aQ  <=  m1
;  a1aR  <=  m2
;  a1aS  <=  m3
;  a1b5  <=  fsk_a1b5
;  a1b9  <=  fsk_a1b9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1aQ (Array String (Maybe Sorta1aP)))
; (declare-const a1aR (Array String (Maybe Sorta1aP)))
; (declare-const a1aS (Array String (Maybe Sorta1aP)))
; (declare-const a1b5 (Array String (Maybe Sorta1aP)))
; (declare-const a1b9 (Array String (Maybe Sorta1aP)))
; (declare-sort Sorta1aP)
(declare-sort Sorta1aP)
(declare-const
   a1aQ
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1aR
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1aS
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1b5
   (Array
      String
      (Maybe Sorta1aP)))
(declare-const
   a1b9
   (Array
      String
      (Maybe Sorta1aP)))
(assert
   (!
      (=
         (store
            a1aR
            "bob"
            (as
               nothing
               (Maybe Sorta1aP)))
         a1b9)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1aQ
            "bob"
            (as
               nothing
               (Maybe Sorta1aP)))
         a1b5)
      :named
      given-10.2))
(assert
   (!
      (= a1b9 a1aS)
      :named
      given-10.3))
(assert
   (!
      (= a1b5 a1aR)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{a1bl} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1aW
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1aP)))
;    a1aR)

; WANTEDS (names)
;  a1aR  <=  m2
;  a1aW  <=  m1_a1aW
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1aW (Array String (Maybe Sorta1aP)))
(declare-const
   a1aW
   (Array
      String
      (Maybe Sorta1aP)))
(assert
   (!
      (not
         (=
            (store
               a1aW
               "bob"
               (as
                  nothing
                  (Maybe Sorta1aP)))
            a1aR))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      Sorta1aP!val!2
;      ()
;      Sorta1aP)
;   (declare-fun
;      Sorta1aP!val!0
;      ()
;      Sorta1aP)
;   (declare-fun
;      Sorta1aP!val!1
;      ()
;      Sorta1aP)
;   (forall
;      (
;        (x Sorta1aP))
;      (or
;         (= x Sorta1aP!val!2)
;         (= x Sorta1aP!val!0)
;         (= x Sorta1aP!val!1)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store a1aR "bob" nothing)
;         a1b9))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= a1b5 a1aR))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store a1aQ "bob" nothing)
;         a1b5))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= a1b9 a1aS))
;   (define-fun
;      a1aR
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1aQ
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1aP)))
;           (just Sorta1aP!val!1))
;         "b"
;         nothing))
;   (define-fun
;      a1aS
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1aW
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1aP)))
;           (just Sorta1aP!val!2))
;         "b"
;         (just Sorta1aP!val!0)))
;   (define-fun
;      a1b5
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store a1aW "bob" nothing)
;            a1aR)))
;   (define-fun
;      a1b9
;      ()
;      (Array
;         String
;         (Maybe Sorta1aP))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1aP)))
;              (just Sorta1aP!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing)))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1cP} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                       ~
;                       Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{a1cP} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                            ~
;                            Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
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
;      [WD] hole{a1cP} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                            ~
;                            Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
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
; [G] cobox_a1d9 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1d4 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1de {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1cZ {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1da {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1d0 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1d5 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1df {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1bP} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1bz,a1bA,a1bC,a1bE],a1d8)
; (IntersectL [a1bz,a1bA,a1bD,a1bE],a1d3)
; (IntersectL [a1bz,a1bA,a1bB,a1bG],a1dd)
; (IntersectL [a1bz,a1bA,a1bB,a1bC],a1cY)
; (a1d8,a1bG)
; (a1cY,a1bD)
; (a1d3,a1bF)
; (a1dd,a1bH)

; WANTEDS (Thoralf style)
; (a1bF,a1bH)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{a1bP} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1bF a1bH)

; GIVENS (names)
;  a1bB  <=  a
;  a1bC  <=  b
;  a1bD  <=  ab
;  a1bE  <=  c
;  a1bF  <=  abc
;  a1bG  <=  bc
;  a1bH  <=  abc'
;  a1cY  <=  fsk_a1cY
;  a1d3  <=  fsk_a1d3
;  a1d8  <=  fsk_a1d8
;  a1dd  <=  fsk_a1dd
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1bA)) (y (Maybe Sorta1bA))) (=> (and ((_ is (just (Sorta1bA) (Maybe Sorta1bA))) x) ((_ is (just (Sorta1bA) (Maybe Sorta1bA))) y)) (= (both8570471395339182648 x y) x))))
; (assert (forall ((y (Maybe Sorta1bA))) (= (both8570471395339182648 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1bA))) (= (both8570471395339182648 y (as nothing (Maybe Sorta1bA))) (as nothing (Maybe Sorta1bA)))))
; (declare-const a1bB (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1bC (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1bD (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1bE (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1bF (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1bG (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1bH (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1cY (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1d3 (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1d8 (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-const a1dd (Array Sorta1bz (Maybe Sorta1bA)))
; (declare-fun both8570471395339182648 ((Maybe Sorta1bA) (Maybe Sorta1bA)) (Maybe Sorta1bA))
; (declare-sort Sorta1bA)
; (declare-sort Sorta1bz)
(declare-sort Sorta1bz)
(declare-sort Sorta1bA)
(declare-const
   a1bB
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1bC
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1bD
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1bE
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1bF
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1bG
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1bH
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1cY
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1d3
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1d8
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-const
   a1dd
   (Array
      Sorta1bz
      (Maybe Sorta1bA)))
(declare-fun
   both8570471395339182648
   (
     (Maybe Sorta1bA)
     (Maybe Sorta1bA))
   (Maybe Sorta1bA))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bA)))
      (=
         (both8570471395339182648
            y
            (as
               nothing
               (Maybe Sorta1bA)))
         (as
            nothing
            (Maybe Sorta1bA)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bA)))
      (=
         (both8570471395339182648 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bA))
        (y
           (Maybe Sorta1bA)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1bA)
                    (Maybe Sorta1bA)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1bA)
                    (Maybe Sorta1bA)))
              y))
         (=
            (both8570471395339182648 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8570471395339182648)
           a1bC
           a1bE)
         a1d8)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both8570471395339182648)
           a1bD
           a1bE)
         a1d3)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both8570471395339182648)
           a1bB
           a1bG)
         a1dd)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both8570471395339182648)
           a1bB
           a1bC)
         a1cY)
      :named
      given-13.4))
(assert
   (!
      (= a1d8 a1bG)
      :named
      given-13.5))
(assert
   (!
      (= a1cY a1bD)
      :named
      given-13.6))
(assert
   (!
      (= a1d3 a1bF)
      :named
      given-13.7))
(assert
   (!
      (= a1dd a1bH)
      :named
      given-13.8))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{a1bP} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1bF a1bH)

; WANTEDS (names)
;  a1bF  <=  abc
;  a1bH  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1bF a1bH))
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
;           (Maybe Sorta1bA)))
;      (=
;         (both8570471395339182648
;            y
;            (as
;               nothing
;               (Maybe Sorta1bA)))
;         (as
;            nothing
;            (Maybe Sorta1bA))))
;   (forall
;      (
;        (y
;           (Maybe Sorta1bA)))
;      (=
;         (both8570471395339182648 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe Sorta1bA))
;        (y
;           (Maybe Sorta1bA)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1bA)
;                    (Maybe Sorta1bA)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1bA)
;                    (Maybe Sorta1bA)))
;              y))
;         (=
;            (both8570471395339182648 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both8570471395339182648)
;           a1bC
;           a1bE)
;         a1d8)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map both8570471395339182648)
;           a1bD
;           a1bE)
;         a1d3)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map both8570471395339182648)
;           a1bB
;           a1bG)
;         a1dd)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map both8570471395339182648)
;           a1bB
;           a1bC)
;         a1cY)
;      :named
;      given-13.4)
;   (!
;      (= a1d8 a1bG)
;      :named
;      given-13.5)
;   (!
;      (= a1cY a1bD)
;      :named
;      given-13.6)
;   (!
;      (= a1d3 a1bF)
;      :named
;      given-13.7)
;   (!
;      (= a1dd a1bH)
;      :named
;      given-13.8)
;   (!
;      (not
;         (= a1bF a1bH))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1
;    given-13.5
;    given-13.2
;    given-13.7
;    given-13.4
;    given-13.6
;    given-13.3
;    wanted-13
;    given-13.8)
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
; [G] cobox_a1dB {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1dw {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1dG {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1dr {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1dC {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1ds {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1dx {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1dH {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1c7} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1bR,a1bS,a1bU,a1bW],a1dA)
; (UnionL [a1bR,a1bS,a1bV,a1bW],a1dv)
; (UnionL [a1bR,a1bS,a1bT,a1bY],a1dF)
; (UnionL [a1bR,a1bS,a1bT,a1bU],a1dq)
; (a1dA,a1bY)
; (a1dq,a1bV)
; (a1dv,a1bX)
; (a1dF,a1bZ)

; WANTEDS (Thoralf style)
; (a1bX,a1bZ)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{a1c7} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1bX a1bZ)

; GIVENS (names)
;  a1bT  <=  a
;  a1bU  <=  b
;  a1bV  <=  ab
;  a1bW  <=  c
;  a1bX  <=  abc
;  a1bY  <=  bc
;  a1bZ  <=  abc'
;  a1dq  <=  fsk_a1dq
;  a1dv  <=  fsk_a1dv
;  a1dA  <=  fsk_a1dA
;  a1dF  <=  fsk_a1dF
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1bS)) (y (Maybe Sorta1bS))) (=> ((_ is (just (Sorta1bS) (Maybe Sorta1bS))) x) (= (either8570456002176387694 x y) x))))
; (assert (forall ((y (Maybe Sorta1bS))) (= (either8570456002176387694 (as nothing (Maybe Sorta1bS)) y) y)))
; (declare-const a1bT (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1bU (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1bV (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1bW (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1bX (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1bY (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1bZ (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1dA (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1dF (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1dq (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-const a1dv (Array Sorta1bR (Maybe Sorta1bS)))
; (declare-fun either8570456002176387694 ((Maybe Sorta1bS) (Maybe Sorta1bS)) (Maybe Sorta1bS))
; (declare-sort Sorta1bR)
; (declare-sort Sorta1bS)
(declare-sort Sorta1bR)
(declare-sort Sorta1bS)
(declare-const
   a1bT
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1bU
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1bV
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1bW
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1bX
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1bY
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1bZ
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1dq
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1dv
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1dA
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-const
   a1dF
   (Array
      Sorta1bR
      (Maybe Sorta1bS)))
(declare-fun
   either8570456002176387694
   (
     (Maybe Sorta1bS)
     (Maybe Sorta1bS))
   (Maybe Sorta1bS))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bS)))
      (=
         (either8570456002176387694
            (as
               nothing
               (Maybe Sorta1bS))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bS))
        (y
           (Maybe Sorta1bS)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bS)
                 (Maybe Sorta1bS)))
           x)
         (=
            (either8570456002176387694 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570456002176387694)
           a1bU
           a1bW)
         a1dA)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either8570456002176387694)
           a1bV
           a1bW)
         a1dv)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either8570456002176387694)
           a1bT
           a1bY)
         a1dF)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either8570456002176387694)
           a1bT
           a1bU)
         a1dq)
      :named
      given-15.4))
(assert
   (!
      (= a1dA a1bY)
      :named
      given-15.5))
(assert
   (!
      (= a1dq a1bV)
      :named
      given-15.6))
(assert
   (!
      (= a1dv a1bX)
      :named
      given-15.7))
(assert
   (!
      (= a1dF a1bZ)
      :named
      given-15.8))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{a1c7} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1bX a1bZ)

; WANTEDS (names)
;  a1bX  <=  abc
;  a1bZ  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1bX a1bZ))
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
;           (Maybe Sorta1bS)))
;      (=
;         (either8570456002176387694
;            (as
;               nothing
;               (Maybe Sorta1bS))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe Sorta1bS))
;        (y
;           (Maybe Sorta1bS)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (Sorta1bS)
;                 (Maybe Sorta1bS)))
;           x)
;         (=
;            (either8570456002176387694 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either8570456002176387694)
;           a1bU
;           a1bW)
;         a1dA)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_ map either8570456002176387694)
;           a1bV
;           a1bW)
;         a1dv)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_ map either8570456002176387694)
;           a1bT
;           a1bY)
;         a1dF)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_ map either8570456002176387694)
;           a1bT
;           a1bU)
;         a1dq)
;      :named
;      given-15.4)
;   (!
;      (= a1dA a1bY)
;      :named
;      given-15.5)
;   (!
;      (= a1dq a1bV)
;      :named
;      given-15.6)
;   (!
;      (= a1dv a1bX)
;      :named
;      given-15.7)
;   (!
;      (= a1dF a1bZ)
;      :named
;      given-15.8)
;   (!
;      (not
;         (= a1bX a1bZ))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.3
;    given-15.6
;    given-15.1
;    given-15.4
;    given-15.7
;    given-15.2
;    given-15.5
;    given-15.8
;    wanted-15)
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
; [G] cobox_a1dX {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dT {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dY {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1dZ {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1ch} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ca,"ok",2],a1dW)
; (Alter [Symbol [],Nat [],a1c9,"ok",2],a1dS)
; (a1dW,a1cb)
; (a1dS,a1ca)

; WANTEDS (Thoralf style)
; (a1ca,a1cb)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{a1ch} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ca a1cb)

; GIVENS (names)
;  a1c9  <=  m1
;  a1ca  <=  m2
;  a1cb  <=  m3
;  a1dS  <=  fsk_a1dS
;  a1dW  <=  fsk_a1dW
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1c9 (Array String (Maybe Int)))
; (declare-const a1ca (Array String (Maybe Int)))
; (declare-const a1cb (Array String (Maybe Int)))
; (declare-const a1dS (Array String (Maybe Int)))
; (declare-const a1dW (Array String (Maybe Int)))
(declare-const
   a1c9
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ca
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cb
   (Array
      String
      (Maybe Int)))
(declare-const
   a1dS
   (Array
      String
      (Maybe Int)))
(declare-const
   a1dW
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ca
            "ok"
            (just 2))
         a1dW)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            a1c9
            "ok"
            (just 2))
         a1dS)
      :named
      given-17.2))
(assert
   (!
      (= a1dW a1cb)
      :named
      given-17.3))
(assert
   (!
      (= a1dS a1ca)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{a1ch} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ca a1cb)

; WANTEDS (names)
;  a1ca  <=  m2
;  a1cb  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1ca a1cb))
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
;            a1ca
;            "ok"
;            (just 2))
;         a1dW)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            a1c9
;            "ok"
;            (just 2))
;         a1dS)
;      :named
;      given-17.2)
;   (!
;      (= a1dW a1cb)
;      :named
;      given-17.3)
;   (!
;      (= a1dS a1ca)
;      :named
;      given-17.4)
;   (!
;      (not
;         (= a1ca a1cb))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.4 given-17.2 wanted-17 given-17.1 given-17.3)
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
; [G] cobox_a1eb {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1e7 {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1ec {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1ed {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1cs} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1cj,a1cl,"bob"],a1ea)
; (Delete [Symbol [],a1cj,a1ck,"bob"],a1e6)
; (a1ea,a1cm)
; (a1e6,a1cl)

; WANTEDS (Thoralf style)
; (a1cl,a1cm)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{a1cs} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1cl a1cm)

; GIVENS (names)
;  a1ck  <=  m1
;  a1cl  <=  m2
;  a1cm  <=  m3
;  a1e6  <=  fsk_a1e6
;  a1ea  <=  fsk_a1ea
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1ck (Array String (Maybe Sorta1cj)))
; (declare-const a1cl (Array String (Maybe Sorta1cj)))
; (declare-const a1cm (Array String (Maybe Sorta1cj)))
; (declare-const a1e6 (Array String (Maybe Sorta1cj)))
; (declare-const a1ea (Array String (Maybe Sorta1cj)))
; (declare-sort Sorta1cj)
(declare-sort Sorta1cj)
(declare-const
   a1ck
   (Array
      String
      (Maybe Sorta1cj)))
(declare-const
   a1cl
   (Array
      String
      (Maybe Sorta1cj)))
(declare-const
   a1cm
   (Array
      String
      (Maybe Sorta1cj)))
(declare-const
   a1e6
   (Array
      String
      (Maybe Sorta1cj)))
(declare-const
   a1ea
   (Array
      String
      (Maybe Sorta1cj)))
(assert
   (!
      (=
         (store
            a1cl
            "bob"
            (as
               nothing
               (Maybe Sorta1cj)))
         a1ea)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            a1ck
            "bob"
            (as
               nothing
               (Maybe Sorta1cj)))
         a1e6)
      :named
      given-19.2))
(assert
   (!
      (= a1ea a1cm)
      :named
      given-19.3))
(assert
   (!
      (= a1e6 a1cl)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{a1cs} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1cl a1cm)

; WANTEDS (names)
;  a1cl  <=  m2
;  a1cm  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1cl a1cm))
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
;            a1cl
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1cj)))
;         a1ea)
;      :named
;      given-19.1)
;   (!
;      (=
;         (store
;            a1ck
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1cj)))
;         a1e6)
;      :named
;      given-19.2)
;   (!
;      (= a1ea a1cm)
;      :named
;      given-19.3)
;   (!
;      (= a1e6 a1cl)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= a1cl a1cm))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.3 given-19.1 given-19.4 given-19.2 wanted-19)
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(exit)
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
; [WD] hole{a3jO} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a3jJ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a3jT} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3jv,a3jw],<? [a3jy,a3jz])
; (<? [a3jx,a3jz],<? [a3ju,a3jw])
; (<? [a3ju,a3jv],<? [a3jx,a3jy])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a3jO} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jv a3jw)
;    (< a3jy a3jz))

;      [WD] hole{a3jJ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jx a3jz)
;    (< a3ju a3jw))

;      [WD] hole{a3jT} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3ju a3jv)
;    (< a3jx a3jy))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a3jO} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jv a3jw)
;    (< a3jy a3jz))

;      [WD] hole{a3jJ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jx a3jz)
;    (< a3ju a3jw))

;      [WD] hole{a3jT} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3ju a3jv)
;    (< a3jx a3jy))

; WANTEDS (names)
;  a3ju  <=  a
;  a3jv  <=  b
;  a3jw  <=  c
;  a3jx  <=  a_a3jx
;  a3jy  <=  b_a3jy
;  a3jz  <=  c_a3jz
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3ju))
; (assert (<= 0 a3jv))
; (assert (<= 0 a3jw))
; (assert (<= 0 a3jx))
; (assert (<= 0 a3jy))
; (assert (<= 0 a3jz))
; (declare-const a3ju Int)
; (declare-const a3jv Int)
; (declare-const a3jw Int)
; (declare-const a3jx Int)
; (declare-const a3jy Int)
; (declare-const a3jz Int)
(declare-const a3ju Int)
(declare-const a3jv Int)
(declare-const a3jw Int)
(declare-const a3jx Int)
(declare-const a3jy Int)
(declare-const a3jz Int)
(assert
   (<= 0 a3ju))
(assert
   (<= 0 a3jv))
(assert
   (<= 0 a3jw))
(assert
   (<= 0 a3jx))
(assert
   (<= 0 a3jy))
(assert
   (<= 0 a3jz))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3jv a3jw)
                  (< a3jy a3jz)))
            (not
               (=
                  (< a3jx a3jz)
                  (< a3ju a3jw))))
         (not
            (=
               (< a3ju a3jv)
               (< a3jx a3jy))))
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
;               (< a3jv a3jw)
;               (< a3jy a3jz)))
;         (not
;            (=
;               (< a3jx a3jz)
;               (< a3ju a3jw)))
;         (not
;            (=
;               (< a3ju a3jv)
;               (< a3jx a3jy)))))
;   (define-fun
;      a3jw
;      ()
;      Int
;      1)
;   (define-fun
;      a3jx
;      ()
;      Int
;      0)
;   (define-fun
;      a3jy
;      ()
;      Int
;      0)
;   (define-fun
;      a3jz
;      ()
;      Int
;      0)
;   (define-fun
;      a3jv
;      ()
;      Int
;      0)
;   (define-fun
;      a3ju
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3jO} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a3jJ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a3jT} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3jv,a3jw],<? [a3jy,a3jz])
; (<? [a3jx,a3jz],<? [a3ju,a3jw])
; (<? [a3ju,a3jv],<? [a3jx,a3jy])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a3jO} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jv a3jw)
;    (< a3jy a3jz))

;      [WD] hole{a3jJ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jx a3jz)
;    (< a3ju a3jw))

;      [WD] hole{a3jT} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3ju a3jv)
;    (< a3jx a3jy))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a3jO} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jv a3jw)
;    (< a3jy a3jz))

;      [WD] hole{a3jJ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jx a3jz)
;    (< a3ju a3jw))

;      [WD] hole{a3jT} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3ju a3jv)
;    (< a3jx a3jy))

; WANTEDS (names)
;  a3ju  <=  a
;  a3jv  <=  b
;  a3jw  <=  c
;  a3jx  <=  a_a3jx
;  a3jy  <=  b_a3jy
;  a3jz  <=  c_a3jz
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3ju))
; (assert (<= 0 a3jv))
; (assert (<= 0 a3jw))
; (assert (<= 0 a3jx))
; (assert (<= 0 a3jy))
; (assert (<= 0 a3jz))
; (declare-const a3ju Int)
; (declare-const a3jv Int)
; (declare-const a3jw Int)
; (declare-const a3jx Int)
; (declare-const a3jy Int)
; (declare-const a3jz Int)
(declare-const a3ju Int)
(declare-const a3jv Int)
(declare-const a3jw Int)
(declare-const a3jx Int)
(declare-const a3jy Int)
(declare-const a3jz Int)
(assert
   (<= 0 a3ju))
(assert
   (<= 0 a3jv))
(assert
   (<= 0 a3jw))
(assert
   (<= 0 a3jx))
(assert
   (<= 0 a3jy))
(assert
   (<= 0 a3jz))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3jv a3jw)
                  (< a3jy a3jz)))
            (not
               (=
                  (< a3jx a3jz)
                  (< a3ju a3jw))))
         (not
            (=
               (< a3ju a3jv)
               (< a3jx a3jy))))
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
;               (< a3jv a3jw)
;               (< a3jy a3jz)))
;         (not
;            (=
;               (< a3jx a3jz)
;               (< a3ju a3jw)))
;         (not
;            (=
;               (< a3ju a3jv)
;               (< a3jx a3jy)))))
;   (define-fun
;      a3jw
;      ()
;      Int
;      1)
;   (define-fun
;      a3jx
;      ()
;      Int
;      0)
;   (define-fun
;      a3jy
;      ()
;      Int
;      0)
;   (define-fun
;      a3jz
;      ()
;      Int
;      0)
;   (define-fun
;      a3jv
;      ()
;      Int
;      0)
;   (define-fun
;      a3ju
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3kv} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a3kA} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3kl,a3km],+ [a3kj,a3kk])
; (+ [a3km,a3kl],+ [a3kk,a3kj])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a3kv} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3kl a3km)
;    (+ a3kj a3kk))

;      [WD] hole{a3kA} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3km a3kl)
;    (+ a3kk a3kj))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a3kv} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3kl a3km)
;    (+ a3kj a3kk))

;      [WD] hole{a3kA} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3km a3kl)
;    (+ a3kk a3kj))

; WANTEDS (names)
;  a3kj  <=  a
;  a3kk  <=  b
;  a3kl  <=  a_a3kl
;  a3km  <=  b_a3km
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3kj))
; (assert (<= 0 a3kk))
; (assert (<= 0 a3kl))
; (assert (<= 0 a3km))
; (declare-const a3kj Int)
; (declare-const a3kk Int)
; (declare-const a3kl Int)
; (declare-const a3km Int)
(declare-const a3kj Int)
(declare-const a3kk Int)
(declare-const a3kl Int)
(declare-const a3km Int)
(assert
   (<= 0 a3kj))
(assert
   (<= 0 a3kk))
(assert
   (<= 0 a3kl))
(assert
   (<= 0 a3km))
(assert
   (!
      (or
         (not
            (=
               (+ a3kl a3km)
               (+ a3kj a3kk)))
         (not
            (=
               (+ a3km a3kl)
               (+ a3kk a3kj))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a3kl
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a3kl a3km)
;               (+ a3kj a3kk)))
;         (not
;            (=
;               (+ a3km a3kl)
;               (+ a3kk a3kj)))))
;   (define-fun
;      a3kj
;      ()
;      Int
;      0)
;   (define-fun
;      a3kk
;      ()
;      Int
;      0)
;   (define-fun
;      a3km
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3kv} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a3kA} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3kl,a3km],+ [a3kj,a3kk])
; (+ [a3km,a3kl],+ [a3kk,a3kj])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a3kv} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3kl a3km)
;    (+ a3kj a3kk))

;      [WD] hole{a3kA} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3km a3kl)
;    (+ a3kk a3kj))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a3kv} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3kl a3km)
;    (+ a3kj a3kk))

;      [WD] hole{a3kA} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3km a3kl)
;    (+ a3kk a3kj))

; WANTEDS (names)
;  a3kj  <=  a
;  a3kk  <=  b
;  a3kl  <=  a_a3kl
;  a3km  <=  b_a3km
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3kj))
; (assert (<= 0 a3kk))
; (assert (<= 0 a3kl))
; (assert (<= 0 a3km))
; (declare-const a3kj Int)
; (declare-const a3kk Int)
; (declare-const a3kl Int)
; (declare-const a3km Int)
(declare-const a3kj Int)
(declare-const a3kk Int)
(declare-const a3kl Int)
(declare-const a3km Int)
(assert
   (<= 0 a3kj))
(assert
   (<= 0 a3kk))
(assert
   (<= 0 a3kl))
(assert
   (<= 0 a3km))
(assert
   (!
      (or
         (not
            (=
               (+ a3kl a3km)
               (+ a3kj a3kk)))
         (not
            (=
               (+ a3km a3kl)
               (+ a3kk a3kj))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a3kl
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a3kl a3km)
;               (+ a3kj a3kk)))
;         (not
;            (=
;               (+ a3km a3kl)
;               (+ a3kk a3kj)))))
;   (define-fun
;      a3kj
;      ()
;      Int
;      0)
;   (define-fun
;      a3kk
;      ()
;      Int
;      0)
;   (define-fun
;      a3km
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")
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

; GIVENS (GHC style)
; [G] cobox_a3sr {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3su {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ss {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3sv {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3sB} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3lf],a3sq)
; (+ [1,a3lh],a3st)
; (a3sq,a3l3)
; (a3st,a3l4)

; WANTEDS (Thoralf style)
; (- [a3lh,a3lf],- [a3l4,a3l3])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{a3sB} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3lh a3lf)
;    (- a3l4 a3l3))

; GIVENS (names)
;  a3l3  <=  n
;  a3l4  <=  m
;  a3lf  <=  n
;  a3lh  <=  n
;  a3sq  <=  fsk_a3sq
;  a3st  <=  fsk_a3st
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3l3))
; (assert (<= 0 a3l4))
; (assert (<= 0 a3lf))
; (assert (<= 0 a3lh))
; (assert (<= 0 a3sq))
; (assert (<= 0 a3st))
; (declare-const a3l3 Int)
; (declare-const a3l4 Int)
; (declare-const a3lf Int)
; (declare-const a3lh Int)
; (declare-const a3sq Int)
; (declare-const a3st Int)
(declare-const a3l3 Int)
(declare-const a3l4 Int)
(declare-const a3lf Int)
(declare-const a3lh Int)
(declare-const a3sq Int)
(declare-const a3st Int)
(assert
   (<= 0 a3l3))
(assert
   (<= 0 a3l4))
(assert
   (<= 0 a3lf))
(assert
   (<= 0 a3lh))
(assert
   (<= 0 a3sq))
(assert
   (<= 0 a3st))
(assert
   (!
      (=
         (+ 1 a3lf)
         a3sq)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a3lh)
         a3st)
      :named
      given-9.2))
(assert
   (!
      (= a3sq a3l3)
      :named
      given-9.3))
(assert
   (!
      (= a3st a3l4)
      :named
      given-9.4))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{a3sB} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3lh a3lf)
;    (- a3l4 a3l3))

; WANTEDS (names)
;  a3l3  <=  n
;  a3l4  <=  m
;  a3lf  <=  n
;  a3lh  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a3lh a3lf)
            (- a3l4 a3l3)))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (<= 0 a3l3)
;   (<= 0 a3l4)
;   (<= 0 a3lf)
;   (<= 0 a3lh)
;   (<= 0 a3sq)
;   (<= 0 a3st)
;   (!
;      (=
;         (+ 1 a3lf)
;         a3sq)
;      :named
;      given-9.1)
;   (!
;      (=
;         (+ 1 a3lh)
;         a3st)
;      :named
;      given-9.2)
;   (!
;      (= a3sq a3l3)
;      :named
;      given-9.3)
;   (!
;      (= a3st a3l4)
;      :named
;      given-9.4)
;   (!
;      (not
;         (=
;            (- a3lh a3lf)
;            (- a3l4 a3l3)))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.1 given-9.4 given-9.3 given-9.2 wanted-9)
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

; GIVENS (GHC style)
; [G] cobox_a3sP {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sQ {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3sY} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3mb],a3sO)
; (a3sO,a3m4)

; WANTEDS (Thoralf style)
; (+ [1,+ [a3mb,a3m6]],+ [a3m4,a3m6])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{a3sY} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3mb a3m6))
;    (+ a3m4 a3m6))

; GIVENS (names)
;  a3m4  <=  n
;  a3mb  <=  n
;  a3sO  <=  fsk_a3sO
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3m4))
; (assert (<= 0 a3mb))
; (assert (<= 0 a3sO))
; (declare-const a3m4 Int)
; (declare-const a3mb Int)
; (declare-const a3sO Int)
(declare-const a3m4 Int)
(declare-const a3mb Int)
(declare-const a3sO Int)
(assert
   (<= 0 a3m4))
(assert
   (<= 0 a3mb))
(assert
   (<= 0 a3sO))
(assert
   (!
      (=
         (+ 1 a3mb)
         a3sO)
      :named
      given-16.1))
(assert
   (!
      (= a3sO a3m4)
      :named
      given-16.2))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{a3sY} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3mb a3m6))
;    (+ a3m4 a3m6))

; WANTEDS (names)
;  a3m4  <=  n
;  a3m6  <=  m
;  a3mb  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3m6))
; (declare-const a3m6 Int)
(declare-const a3m6 Int)
(assert
   (<= 0 a3m6))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a3mb a3m6))
            (+ a3m4 a3m6)))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
(get-assertions)
; (
;   (<= 0 a3m4)
;   (<= 0 a3mb)
;   (<= 0 a3sO)
;   (!
;      (=
;         (+ 1 a3mb)
;         a3sO)
;      :named
;      given-16.1)
;   (!
;      (= a3sO a3m4)
;      :named
;      given-16.2)
;   (<= 0 a3m6)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a3mb a3m6))
;            (+ a3m4 a3m6)))
;      :named
;      wanted-16))
(get-unsat-core)
; (given-16.1 given-16.2 wanted-16)
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3t0 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t3 {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t1 {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3t4 {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3t8} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3qm,a3qn],a3sZ)
; (<? [a3qn,a3qo],a3t2)
; (a3sZ,True [])
; (a3t2,True [])

; WANTEDS (Thoralf style)
; (<? [a3qm,a3qo],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{a3t8} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3qm a3qo)
;    true)

; GIVENS (names)
;  a3qm  <=  a
;  a3qn  <=  b
;  a3qo  <=  c
;  a3sZ  <=  fsk_a3sZ
;  a3t2  <=  fsk_a3t2
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3qm))
; (assert (<= 0 a3qn))
; (assert (<= 0 a3qo))
; (declare-const a3qm Int)
; (declare-const a3qn Int)
; (declare-const a3qo Int)
; (declare-const a3sZ Bool)
; (declare-const a3t2 Bool)
(declare-const a3qm Int)
(declare-const a3qn Int)
(declare-const a3qo Int)
(declare-const a3sZ Bool)
(declare-const a3t2 Bool)
(assert
   (<= 0 a3qm))
(assert
   (<= 0 a3qn))
(assert
   (<= 0 a3qo))
(assert
   (!
      (=
         (< a3qm a3qn)
         a3sZ)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3qn a3qo)
         a3t2)
      :named
      given-19.2))
(assert
   (!
      (= a3sZ true)
      :named
      given-19.3))
(assert
   (!
      (= a3t2 true)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{a3t8} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3qm a3qo)
;    true)

; WANTEDS (names)
;  a3qm  <=  a
;  a3qo  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a3qm a3qo)
            true))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (<= 0 a3qm)
;   (<= 0 a3qn)
;   (<= 0 a3qo)
;   (!
;      (=
;         (< a3qm a3qn)
;         a3sZ)
;      :named
;      given-19.1)
;   (!
;      (=
;         (< a3qn a3qo)
;         a3t2)
;      :named
;      given-19.2)
;   (!
;      (= a3sZ true)
;      :named
;      given-19.3)
;   (!
;      (= a3t2 true)
;      :named
;      given-19.4)
;   (!
;      (not
;         (=
;            (< a3qm a3qo)
;            true))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.4 given-19.2 wanted-19 given-19.3 given-19.1)
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
; [G] cobox_a3tc {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ta {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3qB {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3qE} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3qy,a3qz],a3tb)
; (+ [a3qy,a3qy],a3t9)
; (a3t9,a3tb)

; WANTEDS (Thoralf style)
; (a3qy,a3qz)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{a3qE} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3qy a3qz)

; GIVENS (names)
;  a3qy  <=  a
;  a3qz  <=  b
;  a3t9  <=  fsk_a3t9
;  a3tb  <=  fsk_a3tb
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3qy))
; (assert (<= 0 a3qz))
; (assert (<= 0 a3t9))
; (assert (<= 0 a3tb))
; (declare-const a3qy Int)
; (declare-const a3qz Int)
; (declare-const a3t9 Int)
; (declare-const a3tb Int)
(declare-const a3qy Int)
(declare-const a3qz Int)
(declare-const a3t9 Int)
(declare-const a3tb Int)
(assert
   (<= 0 a3qy))
(assert
   (<= 0 a3qz))
(assert
   (<= 0 a3t9))
(assert
   (<= 0 a3tb))
(assert
   (!
      (=
         (+ a3qy a3qz)
         a3tb)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3qy a3qy)
         a3t9)
      :named
      given-21.2))
(assert
   (!
      (= a3t9 a3tb)
      :named
      given-21.3))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{a3qE} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3qy a3qz)

; WANTEDS (names)
;  a3qy  <=  a
;  a3qz  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a3qy a3qz))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (<= 0 a3qy)
;   (<= 0 a3qz)
;   (<= 0 a3t9)
;   (<= 0 a3tb)
;   (!
;      (=
;         (+ a3qy a3qz)
;         a3tb)
;      :named
;      given-21.1)
;   (!
;      (=
;         (+ a3qy a3qy)
;         a3t9)
;      :named
;      given-21.2)
;   (!
;      (= a3t9 a3tb)
;      :named
;      given-21.3)
;   (!
;      (not
;         (= a3qy a3qz))
;      :named
;      wanted-21))
(get-unsat-core)
; (given-21.2 given-21.1 wanted-21 given-21.3)
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3tg} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3qH,a3qI],+ [a3qI,a3qH])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{a3tg} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3qH a3qI)
;    (+ a3qI a3qH))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{a3tg} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3qH a3qI)
;    (+ a3qI a3qH))

; WANTEDS (names)
;  a3qH  <=  a
;  a3qI  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3qH))
; (assert (<= 0 a3qI))
; (declare-const a3qH Int)
; (declare-const a3qI Int)
(declare-const a3qH Int)
(declare-const a3qI Int)
(assert
   (<= 0 a3qH))
(assert
   (<= 0 a3qI))
(assert
   (!
      (not
         (=
            (+ a3qH a3qI)
            (+ a3qI a3qH)))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a3qH)
;   (<= 0 a3qI)
;   (!
;      (not
;         (=
;            (+ a3qH a3qI)
;            (+ a3qI a3qH)))
;      :named
;      wanted-22))
(get-unsat-core)
; (wanted-22)
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3to} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3qP,1],+ [1,a3qP])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{a3to} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3qP 1)
;    (+ 1 a3qP))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{a3to} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3qP 1)
;    (+ 1 a3qP))

; WANTEDS (names)
;  a3qP  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3qP))
; (declare-const a3qP Int)
(declare-const a3qP Int)
(assert
   (<= 0 a3qP))
(assert
   (!
      (not
         (=
            (+ a3qP 1)
            (+ 1 a3qP)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a3qP)
;   (!
;      (not
;         (=
;            (+ a3qP 1)
;            (+ 1 a3qP)))
;      :named
;      wanted-23))
(get-unsat-core)
; (wanted-23)
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")
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
(exit)
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
; [WD] hole{a5n8} {2}:: Alter
;                         (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                       ~
;                       Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{a5mT} {2}:: Alter
;                         (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                       ~
;                       Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a5n8} {2}:: Alter
;                              (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                            ~
;                            Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
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

;      [WD] hole{a5mT} {2}:: Alter
;                              (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                            ~
;                            Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)
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
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{a5n8} {2}:: Alter
;                              (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                            ~
;                            Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
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

;      [WD] hole{a5mT} {2}:: Alter
;                              (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                            ~
;                            Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)
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
; [G] cobox_a5nW {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5o3 {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5nX {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a5ob} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5ku,"price",Int []],a5nV)
; (Delete [Symbol [],TYPE [LiftedRep []],a5kx,a5ky],a5o2)
; (a5nV,a5ku)
; (a5o2,a5ku)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kx,"price",Int []],a5kx)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a5ob} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kx
;       "price"
;       (just
;          (lit "3u")))
;    a5kx)

; GIVENS (names)
;  a5ku  <=  m
;  a5kx  <=  m
;  a5ky  <=  field
;  a5nV  <=  fsk_a5nV
;  a5o2  <=  fsk_a5o2
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a5ku (Array String (Maybe Type)))
; (declare-const a5kx (Array String (Maybe Type)))
; (declare-const a5ky String)
; (declare-const a5nV (Array String (Maybe Type)))
; (declare-const a5o2 (Array String (Maybe Type)))
(declare-const
   a5ku
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kx
   (Array
      String
      (Maybe Type)))
(declare-const a5ky String)
(declare-const
   a5nV
   (Array
      String
      (Maybe Type)))
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5ku
            "price"
            (just
               (lit "3u")))
         a5nV)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a5kx
            a5ky
            (as
               nothing
               (Maybe Type)))
         a5o2)
      :named
      given-8.2))
(assert
   (!
      (= a5nV a5ku)
      :named
      given-8.3))
(assert
   (!
      (= a5o2 a5ku)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a5ob} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kx
;       "price"
;       (just
;          (lit "3u")))
;    a5kx)

; WANTEDS (names)
;  a5kx  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5kx
               "price"
               (just
                  (lit "3u")))
            a5kx))
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
;            a5ku
;            "price"
;            (just
;               (lit "3u")))
;         a5nV)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a5kx
;            a5ky
;            (as
;               nothing
;               (Maybe Type)))
;         a5o2)
;      :named
;      given-8.2)
;   (!
;      (= a5nV a5ku)
;      :named
;      given-8.3)
;   (!
;      (= a5o2 a5ku)
;      :named
;      given-8.4)
;   (!
;      (not
;         (=
;            (store
;               a5kx
;               "price"
;               (just
;                  (lit "3u")))
;            a5kx))
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
; [G] cobox_a5nW {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5ok {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] cobox_a5og {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5nX {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5oj {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a5l1} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5ku,"price",Int []],a5nV)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kE,"price",a5kG],a5oe)
; (a5oe,a5ku)
; (a5nV,a5ku)
; (a5kF,"price")

; WANTEDS (Thoralf style)
; (a5kG,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{a5l1} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5kG
;    (lit "3u"))

; GIVENS (names)
;  a5ku  <=  m
;  a5kE  <=  m
;  a5kF  <=  field
;  a5kG  <=  val
;  a5nV  <=  fsk_a5nV
;  a5oe  <=  fsk_a5oe
(push 1)
; DECS1 (seen) 
; (declare-const a5ku (Array String (Maybe Type)))
; (declare-const a5nV (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a5kE (Array String (Maybe Type)))
; (declare-const a5kF String)
; (declare-const a5kG Type)
; (declare-const a5oe (Array String (Maybe Type)))
(declare-const
   a5ku
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kE
   (Array
      String
      (Maybe Type)))
(declare-const a5kF String)
(declare-const a5kG Type)
(declare-const
   a5nV
   (Array
      String
      (Maybe Type)))
(declare-const
   a5oe
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5ku
            "price"
            (just
               (lit "3u")))
         a5nV)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a5kE
            "price"
            (just a5kG))
         a5oe)
      :named
      given-11.2))
(assert
   (!
      (= a5oe a5ku)
      :named
      given-11.3))
(assert
   (!
      (= a5nV a5ku)
      :named
      given-11.4))
(assert
   (!
      (= a5kF "price")
      :named
      given-11.5))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{a5l1} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5kG
;    (lit "3u"))

; WANTEDS (names)
;  a5kG  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a5kG
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
;            a5ku
;            "price"
;            (just
;               (lit "3u")))
;         a5nV)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a5kE
;            "price"
;            (just a5kG))
;         a5oe)
;      :named
;      given-11.2)
;   (!
;      (= a5oe a5ku)
;      :named
;      given-11.3)
;   (!
;      (= a5nV a5ku)
;      :named
;      given-11.4)
;   (!
;      (= a5kF "price")
;      :named
;      given-11.5)
;   (!
;      (not
;         (=
;            a5kG
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
; [G] $dDisEquality_a5l3 {0}:: DisEquality field "price" (CDictCan)
; [G] cobox_a5nW {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5of {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5nX {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5og {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a5op} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5l3 {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5ku,"price",Int []],a5nV)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kE,a5kF,a5kG],a5oe)
; (a5nV,a5ku)
; (a5oe,a5ku)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kE,"price",Int []],a5kE)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{a5op} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kE
;       "price"
;       (just
;          (lit "3u")))
;    a5kE)

; GIVENS (names)
;  a5ku  <=  m
;  a5kE  <=  m
;  a5kF  <=  field
;  a5kG  <=  val
;  a5nV  <=  fsk_a5nV
;  a5oe  <=  fsk_a5oe
(push 1)
; DECS1 (seen) 
; (declare-const a5kE (Array String (Maybe Type)))
; (declare-const a5kF String)
; (declare-const a5kG Type)
; (declare-const a5ku (Array String (Maybe Type)))
; (declare-const a5nV (Array String (Maybe Type)))
; (declare-const a5oe (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a5ku
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kE
   (Array
      String
      (Maybe Type)))
(declare-const a5kF String)
(declare-const a5kG Type)
(declare-const
   a5nV
   (Array
      String
      (Maybe Type)))
(declare-const
   a5oe
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5kF "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a5ku
            "price"
            (just
               (lit "3u")))
         a5nV)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a5kE
            a5kF
            (just a5kG))
         a5oe)
      :named
      given-13.3))
(assert
   (!
      (= a5nV a5ku)
      :named
      given-13.4))
(assert
   (!
      (= a5oe a5ku)
      :named
      given-13.5))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{a5op} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kE
;       "price"
;       (just
;          (lit "3u")))
;    a5kE)

; WANTEDS (names)
;  a5kE  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5kE
               "price"
               (just
                  (lit "3u")))
            a5kE))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a5kF "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a5ku
;            "price"
;            (just
;               (lit "3u")))
;         a5nV)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a5kE
;            a5kF
;            (just a5kG))
;         a5oe)
;      :named
;      given-13.3)
;   (!
;      (= a5nV a5ku)
;      :named
;      given-13.4)
;   (!
;      (= a5oe a5ku)
;      :named
;      given-13.5)
;   (!
;      (not
;         (=
;            (store
;               a5kE
;               "price"
;               (just
;                  (lit "3u")))
;            a5kE))
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
; [WD] hole{a2Tt} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2To} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2Ty} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Ta,a2Tb],<? [a2Td,a2Te])
; (<? [a2Tc,a2Te],<? [a2T9,a2Tb])
; (<? [a2T9,a2Ta],<? [a2Tc,a2Td])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a2Tt} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Ta a2Tb)
;    (< a2Td a2Te))

;      [WD] hole{a2To} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tc a2Te)
;    (< a2T9 a2Tb))

;      [WD] hole{a2Ty} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2T9 a2Ta)
;    (< a2Tc a2Td))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a2Tt} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Ta a2Tb)
;    (< a2Td a2Te))

;      [WD] hole{a2To} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tc a2Te)
;    (< a2T9 a2Tb))

;      [WD] hole{a2Ty} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2T9 a2Ta)
;    (< a2Tc a2Td))

; WANTEDS (names)
;  a2T9  <=  a
;  a2Ta  <=  b
;  a2Tb  <=  c
;  a2Tc  <=  a_a2Tc
;  a2Td  <=  b_a2Td
;  a2Te  <=  c_a2Te
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2T9))
; (assert (<= 0 a2Ta))
; (assert (<= 0 a2Tb))
; (assert (<= 0 a2Tc))
; (assert (<= 0 a2Td))
; (assert (<= 0 a2Te))
; (declare-const a2T9 Int)
; (declare-const a2Ta Int)
; (declare-const a2Tb Int)
; (declare-const a2Tc Int)
; (declare-const a2Td Int)
; (declare-const a2Te Int)
(declare-const a2T9 Int)
(declare-const a2Ta Int)
(declare-const a2Tb Int)
(declare-const a2Tc Int)
(declare-const a2Td Int)
(declare-const a2Te Int)
(assert
   (<= 0 a2T9))
(assert
   (<= 0 a2Ta))
(assert
   (<= 0 a2Tb))
(assert
   (<= 0 a2Tc))
(assert
   (<= 0 a2Td))
(assert
   (<= 0 a2Te))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a2Ta a2Tb)
                  (< a2Td a2Te)))
            (not
               (=
                  (< a2Tc a2Te)
                  (< a2T9 a2Tb))))
         (not
            (=
               (< a2T9 a2Ta)
               (< a2Tc a2Td))))
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
;               (< a2Ta a2Tb)
;               (< a2Td a2Te)))
;         (not
;            (=
;               (< a2Tc a2Te)
;               (< a2T9 a2Tb)))
;         (not
;            (=
;               (< a2T9 a2Ta)
;               (< a2Tc a2Td)))))
;   (define-fun
;      a2Tb
;      ()
;      Int
;      1)
;   (define-fun
;      a2T9
;      ()
;      Int
;      0)
;   (define-fun
;      a2Tc
;      ()
;      Int
;      0)
;   (define-fun
;      a2Td
;      ()
;      Int
;      0)
;   (define-fun
;      a2Te
;      ()
;      Int
;      0)
;   (define-fun
;      a2Ta
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Tt} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2To} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2Ty} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Ta,a2Tb],<? [a2Td,a2Te])
; (<? [a2Tc,a2Te],<? [a2T9,a2Tb])
; (<? [a2T9,a2Ta],<? [a2Tc,a2Td])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a2Tt} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Ta a2Tb)
;    (< a2Td a2Te))

;      [WD] hole{a2To} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tc a2Te)
;    (< a2T9 a2Tb))

;      [WD] hole{a2Ty} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2T9 a2Ta)
;    (< a2Tc a2Td))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a2Tt} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Ta a2Tb)
;    (< a2Td a2Te))

;      [WD] hole{a2To} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tc a2Te)
;    (< a2T9 a2Tb))

;      [WD] hole{a2Ty} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2T9 a2Ta)
;    (< a2Tc a2Td))

; WANTEDS (names)
;  a2T9  <=  a
;  a2Ta  <=  b
;  a2Tb  <=  c
;  a2Tc  <=  a_a2Tc
;  a2Td  <=  b_a2Td
;  a2Te  <=  c_a2Te
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2T9))
; (assert (<= 0 a2Ta))
; (assert (<= 0 a2Tb))
; (assert (<= 0 a2Tc))
; (assert (<= 0 a2Td))
; (assert (<= 0 a2Te))
; (declare-const a2T9 Int)
; (declare-const a2Ta Int)
; (declare-const a2Tb Int)
; (declare-const a2Tc Int)
; (declare-const a2Td Int)
; (declare-const a2Te Int)
(declare-const a2T9 Int)
(declare-const a2Ta Int)
(declare-const a2Tb Int)
(declare-const a2Tc Int)
(declare-const a2Td Int)
(declare-const a2Te Int)
(assert
   (<= 0 a2T9))
(assert
   (<= 0 a2Ta))
(assert
   (<= 0 a2Tb))
(assert
   (<= 0 a2Tc))
(assert
   (<= 0 a2Td))
(assert
   (<= 0 a2Te))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a2Ta a2Tb)
                  (< a2Td a2Te)))
            (not
               (=
                  (< a2Tc a2Te)
                  (< a2T9 a2Tb))))
         (not
            (=
               (< a2T9 a2Ta)
               (< a2Tc a2Td))))
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
;               (< a2Ta a2Tb)
;               (< a2Td a2Te)))
;         (not
;            (=
;               (< a2Tc a2Te)
;               (< a2T9 a2Tb)))
;         (not
;            (=
;               (< a2T9 a2Ta)
;               (< a2Tc a2Td)))))
;   (define-fun
;      a2Tb
;      ()
;      Int
;      1)
;   (define-fun
;      a2T9
;      ()
;      Int
;      0)
;   (define-fun
;      a2Tc
;      ()
;      Int
;      0)
;   (define-fun
;      a2Td
;      ()
;      Int
;      0)
;   (define-fun
;      a2Te
;      ()
;      Int
;      0)
;   (define-fun
;      a2Ta
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Ua} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Uf} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U0,a2U1],+ [a2TY,a2TZ])
; (+ [a2U1,a2U0],+ [a2TZ,a2TY])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a2Ua} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U0 a2U1)
;    (+ a2TY a2TZ))

;      [WD] hole{a2Uf} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U1 a2U0)
;    (+ a2TZ a2TY))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a2Ua} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U0 a2U1)
;    (+ a2TY a2TZ))

;      [WD] hole{a2Uf} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U1 a2U0)
;    (+ a2TZ a2TY))

; WANTEDS (names)
;  a2TY  <=  a
;  a2TZ  <=  b
;  a2U0  <=  a_a2U0
;  a2U1  <=  b_a2U1
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2TY))
; (assert (<= 0 a2TZ))
; (assert (<= 0 a2U0))
; (assert (<= 0 a2U1))
; (declare-const a2TY Int)
; (declare-const a2TZ Int)
; (declare-const a2U0 Int)
; (declare-const a2U1 Int)
(declare-const a2TY Int)
(declare-const a2TZ Int)
(declare-const a2U0 Int)
(declare-const a2U1 Int)
(assert
   (<= 0 a2TY))
(assert
   (<= 0 a2TZ))
(assert
   (<= 0 a2U0))
(assert
   (<= 0 a2U1))
(assert
   (!
      (or
         (not
            (=
               (+ a2U0 a2U1)
               (+ a2TY a2TZ)))
         (not
            (=
               (+ a2U1 a2U0)
               (+ a2TZ a2TY))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a2U0
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a2U0 a2U1)
;               (+ a2TY a2TZ)))
;         (not
;            (=
;               (+ a2U1 a2U0)
;               (+ a2TZ a2TY)))))
;   (define-fun
;      a2U1
;      ()
;      Int
;      0)
;   (define-fun
;      a2TZ
;      ()
;      Int
;      0)
;   (define-fun
;      a2TY
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Ua} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Uf} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U0,a2U1],+ [a2TY,a2TZ])
; (+ [a2U1,a2U0],+ [a2TZ,a2TY])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a2Ua} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U0 a2U1)
;    (+ a2TY a2TZ))

;      [WD] hole{a2Uf} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U1 a2U0)
;    (+ a2TZ a2TY))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a2Ua} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U0 a2U1)
;    (+ a2TY a2TZ))

;      [WD] hole{a2Uf} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U1 a2U0)
;    (+ a2TZ a2TY))

; WANTEDS (names)
;  a2TY  <=  a
;  a2TZ  <=  b
;  a2U0  <=  a_a2U0
;  a2U1  <=  b_a2U1
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2TY))
; (assert (<= 0 a2TZ))
; (assert (<= 0 a2U0))
; (assert (<= 0 a2U1))
; (declare-const a2TY Int)
; (declare-const a2TZ Int)
; (declare-const a2U0 Int)
; (declare-const a2U1 Int)
(declare-const a2TY Int)
(declare-const a2TZ Int)
(declare-const a2U0 Int)
(declare-const a2U1 Int)
(assert
   (<= 0 a2TY))
(assert
   (<= 0 a2TZ))
(assert
   (<= 0 a2U0))
(assert
   (<= 0 a2U1))
(assert
   (!
      (or
         (not
            (=
               (+ a2U0 a2U1)
               (+ a2TY a2TZ)))
         (not
            (=
               (+ a2U1 a2U0)
               (+ a2TZ a2TY))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a2U0
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a2U0 a2U1)
;               (+ a2TY a2TZ)))
;         (not
;            (=
;               (+ a2U1 a2U0)
;               (+ a2TZ a2TY)))))
;   (define-fun
;      a2U1
;      ()
;      Int
;      0)
;   (define-fun
;      a2TZ
;      ()
;      Int
;      0)
;   (define-fun
;      a2TY
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")
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

; GIVENS (GHC style)
; [G] cobox_a3ca {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cd {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cb {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3ce {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3ck} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2UU],a3c9)
; (+ [1,a2UW],a3cc)
; (a3c9,a2UI)
; (a3cc,a2UJ)

; WANTEDS (Thoralf style)
; (- [a2UW,a2UU],- [a2UJ,a2UI])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{a3ck} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a2UW a2UU)
;    (- a2UJ a2UI))

; GIVENS (names)
;  a2UI  <=  n
;  a2UJ  <=  m
;  a2UU  <=  n
;  a2UW  <=  n
;  a3c9  <=  fsk_a3c9
;  a3cc  <=  fsk_a3cc
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2UI))
; (assert (<= 0 a2UJ))
; (assert (<= 0 a2UU))
; (assert (<= 0 a2UW))
; (assert (<= 0 a3c9))
; (assert (<= 0 a3cc))
; (declare-const a2UI Int)
; (declare-const a2UJ Int)
; (declare-const a2UU Int)
; (declare-const a2UW Int)
; (declare-const a3c9 Int)
; (declare-const a3cc Int)
(declare-const a2UI Int)
(declare-const a2UJ Int)
(declare-const a2UU Int)
(declare-const a2UW Int)
(declare-const a3c9 Int)
(declare-const a3cc Int)
(assert
   (<= 0 a2UI))
(assert
   (<= 0 a2UJ))
(assert
   (<= 0 a2UU))
(assert
   (<= 0 a2UW))
(assert
   (<= 0 a3c9))
(assert
   (<= 0 a3cc))
(assert
   (!
      (=
         (+ 1 a2UU)
         a3c9)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2UW)
         a3cc)
      :named
      given-9.2))
(assert
   (!
      (= a3c9 a2UI)
      :named
      given-9.3))
(assert
   (!
      (= a3cc a2UJ)
      :named
      given-9.4))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{a3ck} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a2UW a2UU)
;    (- a2UJ a2UI))

; WANTEDS (names)
;  a2UI  <=  n
;  a2UJ  <=  m
;  a2UU  <=  n
;  a2UW  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a2UW a2UU)
            (- a2UJ a2UI)))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (<= 0 a2UI)
;   (<= 0 a2UJ)
;   (<= 0 a2UU)
;   (<= 0 a2UW)
;   (<= 0 a3c9)
;   (<= 0 a3cc)
;   (!
;      (=
;         (+ 1 a2UU)
;         a3c9)
;      :named
;      given-9.1)
;   (!
;      (=
;         (+ 1 a2UW)
;         a3cc)
;      :named
;      given-9.2)
;   (!
;      (= a3c9 a2UI)
;      :named
;      given-9.3)
;   (!
;      (= a3cc a2UJ)
;      :named
;      given-9.4)
;   (!
;      (not
;         (=
;            (- a2UW a2UU)
;            (- a2UJ a2UI)))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.1 given-9.4 given-9.3 given-9.2 wanted-9)
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

; GIVENS (GHC style)
; [G] cobox_a3cD {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cE {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cM} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2VQ],a3cC)
; (a3cC,a2VJ)

; WANTEDS (Thoralf style)
; (+ [1,+ [a2VQ,a2VL]],+ [a2VJ,a2VL])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{a3cM} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2VQ a2VL))
;    (+ a2VJ a2VL))

; GIVENS (names)
;  a2VJ  <=  n
;  a2VQ  <=  n
;  a3cC  <=  fsk_a3cC
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2VJ))
; (assert (<= 0 a2VQ))
; (assert (<= 0 a3cC))
; (declare-const a2VJ Int)
; (declare-const a2VQ Int)
; (declare-const a3cC Int)
(declare-const a2VJ Int)
(declare-const a2VQ Int)
(declare-const a3cC Int)
(assert
   (<= 0 a2VJ))
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a3cC))
(assert
   (!
      (=
         (+ 1 a2VQ)
         a3cC)
      :named
      given-16.1))
(assert
   (!
      (= a3cC a2VJ)
      :named
      given-16.2))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{a3cM} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2VQ a2VL))
;    (+ a2VJ a2VL))

; WANTEDS (names)
;  a2VJ  <=  n
;  a2VL  <=  m
;  a2VQ  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2VL))
; (declare-const a2VL Int)
(declare-const a2VL Int)
(assert
   (<= 0 a2VL))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a2VQ a2VL))
            (+ a2VJ a2VL)))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
(get-assertions)
; (
;   (<= 0 a2VJ)
;   (<= 0 a2VQ)
;   (<= 0 a3cC)
;   (!
;      (=
;         (+ 1 a2VQ)
;         a3cC)
;      :named
;      given-16.1)
;   (!
;      (= a3cC a2VJ)
;      :named
;      given-16.2)
;   (<= 0 a2VL)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a2VQ a2VL))
;            (+ a2VJ a2VL)))
;      :named
;      wanted-16))
(get-unsat-core)
; (given-16.1 given-16.2 wanted-16)
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cO {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cR {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cP {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cS {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cW} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3a5,a3a6],a3cN)
; (<? [a3a6,a3a7],a3cQ)
; (a3cN,True [])
; (a3cQ,True [])

; WANTEDS (Thoralf style)
; (<? [a3a5,a3a7],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{a3cW} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3a5 a3a7)
;    true)

; GIVENS (names)
;  a3a5  <=  a
;  a3a6  <=  b
;  a3a7  <=  c
;  a3cN  <=  fsk_a3cN
;  a3cQ  <=  fsk_a3cQ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3a5))
; (assert (<= 0 a3a6))
; (assert (<= 0 a3a7))
; (declare-const a3a5 Int)
; (declare-const a3a6 Int)
; (declare-const a3a7 Int)
; (declare-const a3cN Bool)
; (declare-const a3cQ Bool)
(declare-const a3a5 Int)
(declare-const a3a6 Int)
(declare-const a3a7 Int)
(declare-const a3cN Bool)
(declare-const a3cQ Bool)
(assert
   (<= 0 a3a5))
(assert
   (<= 0 a3a6))
(assert
   (<= 0 a3a7))
(assert
   (!
      (=
         (< a3a5 a3a6)
         a3cN)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3a6 a3a7)
         a3cQ)
      :named
      given-19.2))
(assert
   (!
      (= a3cN true)
      :named
      given-19.3))
(assert
   (!
      (= a3cQ true)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{a3cW} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3a5 a3a7)
;    true)

; WANTEDS (names)
;  a3a5  <=  a
;  a3a7  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a3a5 a3a7)
            true))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (<= 0 a3a5)
;   (<= 0 a3a6)
;   (<= 0 a3a7)
;   (!
;      (=
;         (< a3a5 a3a6)
;         a3cN)
;      :named
;      given-19.1)
;   (!
;      (=
;         (< a3a6 a3a7)
;         a3cQ)
;      :named
;      given-19.2)
;   (!
;      (= a3cN true)
;      :named
;      given-19.3)
;   (!
;      (= a3cQ true)
;      :named
;      given-19.4)
;   (!
;      (not
;         (=
;            (< a3a5 a3a7)
;            true))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.4 given-19.2 wanted-19 given-19.3 given-19.1)
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
; [G] cobox_a3d0 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ak {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3an} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3ah,a3ai],a3cZ)
; (+ [a3ah,a3ah],a3cX)
; (a3cX,a3cZ)

; WANTEDS (Thoralf style)
; (a3ah,a3ai)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{a3an} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3ah a3ai)

; GIVENS (names)
;  a3ah  <=  a
;  a3ai  <=  b
;  a3cX  <=  fsk_a3cX
;  a3cZ  <=  fsk_a3cZ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3ah))
; (assert (<= 0 a3ai))
; (assert (<= 0 a3cX))
; (assert (<= 0 a3cZ))
; (declare-const a3ah Int)
; (declare-const a3ai Int)
; (declare-const a3cX Int)
; (declare-const a3cZ Int)
(declare-const a3ah Int)
(declare-const a3ai Int)
(declare-const a3cX Int)
(declare-const a3cZ Int)
(assert
   (<= 0 a3ah))
(assert
   (<= 0 a3ai))
(assert
   (<= 0 a3cX))
(assert
   (<= 0 a3cZ))
(assert
   (!
      (=
         (+ a3ah a3ai)
         a3cZ)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ah a3ah)
         a3cX)
      :named
      given-21.2))
(assert
   (!
      (= a3cX a3cZ)
      :named
      given-21.3))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{a3an} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3ah a3ai)

; WANTEDS (names)
;  a3ah  <=  a
;  a3ai  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a3ah a3ai))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (<= 0 a3ah)
;   (<= 0 a3ai)
;   (<= 0 a3cX)
;   (<= 0 a3cZ)
;   (!
;      (=
;         (+ a3ah a3ai)
;         a3cZ)
;      :named
;      given-21.1)
;   (!
;      (=
;         (+ a3ah a3ah)
;         a3cX)
;      :named
;      given-21.2)
;   (!
;      (= a3cX a3cZ)
;      :named
;      given-21.3)
;   (!
;      (not
;         (= a3ah a3ai))
;      :named
;      wanted-21))
(get-unsat-core)
; (given-21.2 given-21.1 wanted-21 given-21.3)
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3d4} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3aq,a3ar],+ [a3ar,a3aq])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{a3d4} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3aq a3ar)
;    (+ a3ar a3aq))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{a3d4} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3aq a3ar)
;    (+ a3ar a3aq))

; WANTEDS (names)
;  a3aq  <=  a
;  a3ar  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3aq))
; (assert (<= 0 a3ar))
; (declare-const a3aq Int)
; (declare-const a3ar Int)
(declare-const a3aq Int)
(declare-const a3ar Int)
(assert
   (<= 0 a3aq))
(assert
   (<= 0 a3ar))
(assert
   (!
      (not
         (=
            (+ a3aq a3ar)
            (+ a3ar a3aq)))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a3aq)
;   (<= 0 a3ar)
;   (!
;      (not
;         (=
;            (+ a3aq a3ar)
;            (+ a3ar a3aq)))
;      :named
;      wanted-22))
(get-unsat-core)
; (wanted-22)
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3dc} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ay,1],+ [1,a3ay])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{a3dc} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3ay 1)
;    (+ 1 a3ay))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{a3dc} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3ay 1)
;    (+ 1 a3ay))

; WANTEDS (names)
;  a3ay  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3ay))
; (declare-const a3ay Int)
(declare-const a3ay Int)
(assert
   (<= 0 a3ay))
(assert
   (!
      (not
         (=
            (+ a3ay 1)
            (+ 1 a3ay)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a3ay)
;   (!
;      (not
;         (=
;            (+ a3ay 1)
;            (+ 1 a3ay)))
;      :named
;      wanted-23))
(get-unsat-core)
; (wanted-23)
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")
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
(exit)
(exit)
