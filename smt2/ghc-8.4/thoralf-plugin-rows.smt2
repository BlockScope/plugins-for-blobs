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
; [G] co_a19e {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a197 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a19l {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a190 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a19f {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a191 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a198 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a19m {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a19E} {3}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a19Q} {3}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a18v,a18w,a18y,a18A],a19d)
; (IntersectL [a18v,a18w,a18z,a18A],a196)
; (IntersectL [a18v,a18w,a18x,a18C],a19k)
; (IntersectL [a18v,a18w,a18x,a18y],a18Z)
; (a19d,a18C)
; (a18Z,a18z)
; (a196,a18B)
; (a19k,a18D)

; WANTEDS (Thoralf style)
; (IntersectL [a18v,a18w,IntersectL [a18v,a18w,a18K,a18L],a18N],a18B)
; (IntersectL [a18v,a18w,a18K,IntersectL [a18v,a18w,a18L,a18N]],a18D)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a19E} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a19Q} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; GIVENS (names)
;  a18x  <=  a
;  a18y  <=  b
;  a18z  <=  ab
;  a18A  <=  c
;  a18B  <=  abc
;  a18C  <=  bc
;  a18D  <=  abc'
;  a18Z  <=  fsk_a18Z
;  a196  <=  fsk_a196
;  a19d  <=  fsk_a19d
;  a19k  <=  fsk_a19k
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta18w)) (y (Maybe Sorta18w))) (=> (and ((_ is (just (Sorta18w) (Maybe Sorta18w))) x) ((_ is (just (Sorta18w) (Maybe Sorta18w))) y)) (= (both8515045014172041172 x y) x))))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 y (as nothing (Maybe Sorta18w))) (as nothing (Maybe Sorta18w)))))
; (declare-const a18A (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18B (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18C (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18D (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18Z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18x (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18y (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a196 (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19d (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19k (Array Sorta18v (Maybe Sorta18w)))
; (declare-fun both8515045014172041172 ((Maybe Sorta18w) (Maybe Sorta18w)) (Maybe Sorta18w))
; (declare-sort Sorta18v)
; (declare-sort Sorta18w)
(declare-sort Sorta18v)
(declare-sort Sorta18w)
(declare-const
   a18x
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18y
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18A
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18B
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18C
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18D
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18Z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a196
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19d
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19k
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-fun
   both8515045014172041172
   (
     (Maybe Sorta18w)
     (Maybe Sorta18w))
   (Maybe Sorta18w))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172
            y
            (as
               nothing
               (Maybe Sorta18w)))
         (as
            nothing
            (Maybe Sorta18w)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18w))
        (y
           (Maybe Sorta18w)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              y))
         (=
            (both8515045014172041172 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18y
           a18A)
         a19d)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18z
           a18A)
         a196)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18C)
         a19k)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18y)
         a18Z)
      :named
      given-2.4))
(assert
   (!
      (= a19d a18C)
      :named
      given-2.5))
(assert
   (!
      (= a18Z a18z)
      :named
      given-2.6))
(assert
   (!
      (= a196 a18B)
      :named
      given-2.7))
(assert
   (!
      (= a19k a18D)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a19E} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a19Q} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; WANTEDS (names)
;  a18B  <=  abc
;  a18D  <=  abc'
;  a18K  <=  a_a18K
;  a18L  <=  b_a18L
;  a18N  <=  c_a18N
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a18K (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18L (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18N (Array Sorta18v (Maybe Sorta18w)))
(declare-const
   a18K
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18L
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18N
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 (
                   (_ map both8515045014172041172)
                   a18K
                   a18L)
                 a18N)
               a18B))
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 a18K
                 (
                   (_ map both8515045014172041172)
                   a18L
                   a18N))
               a18D)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      Sorta18w!val!3
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!4
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!2
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!5
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!0
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!6
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!1
;      ()
;      Sorta18w)
;   (forall
;      (
;        (x Sorta18w))
;      (or
;         (= x Sorta18w!val!3)
;         (= x Sorta18w!val!4)
;         (= x Sorta18w!val!2)
;         (= x Sorta18w!val!5)
;         (= x Sorta18w!val!0)
;         (= x Sorta18w!val!6)
;         (= x Sorta18w!val!1)))
;   (declare-fun
;      Sorta18v!val!0
;      ()
;      Sorta18v)
;   (forall
;      (
;        (x Sorta18v))
;      (= x Sorta18v!val!0))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!6))
;         Sorta18v!val!0
;         (just Sorta18w!val!5)))
;   (define-fun
;      a18L
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!1))
;         Sorta18v!val!0
;         (just Sorta18w!val!3)))
;   (define-fun
;      a19k
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18C
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= a18Z a18z))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18z
;           a18A)
;         a196))
;   (define-fun
;      a19d
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
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
;                      (_ map both8515045014172041172)
;                      (
;                        (_ map both8515045014172041172)
;                        a18K
;                        a18L)
;                      a18N)
;                    a18B)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8515045014172041172)
;                      a18K
;                      (
;                        (_ map both8515045014172041172)
;                        a18L
;                        a18N))
;                    a18D))))
;         (or a!1 a!2)))
;   (define-fun
;      a18Z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= a19d a18C))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= a196 a18B))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= a19k a18D))
;   (define-fun
;      a18B
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18K
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!0))
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18N
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18C)
;         a19k))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18y)
;         a18Z))
;   (define-fun
;      a18y
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a196
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18y
;           a18A)
;         a19d))
;   (define-fun
;      a18z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18D
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18A
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      both8515045014172041172
;      (
;        (x!0
;           (Maybe Sorta18w))
;        (x!1
;           (Maybe Sorta18w)))
;      (Maybe Sorta18w)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta18w!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta18w!val!0))
;                  (=
;                     x!1
;                     (just Sorta18w!val!1)))
;               (just Sorta18w!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta18w!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta18w!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta18w!val!2))
;                           (=
;                              x!1
;                              (just Sorta18w!val!3)))
;                        (just Sorta18w!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta18w!val!2))
;                              (=
;                                 x!1
;                                 (just Sorta18w!val!4)))
;                           (just Sorta18w!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta18w!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta18w!val!3))
;                                    (=
;                                       x!1
;                                       (just Sorta18w!val!4)))
;                                 (just Sorta18w!val!3)
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
; [G] co_a19e {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a197 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a19l {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a190 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a19f {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a191 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a198 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a19m {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a19E} {3}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a19Q} {3}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a18v,a18w,a18y,a18A],a19d)
; (IntersectL [a18v,a18w,a18z,a18A],a196)
; (IntersectL [a18v,a18w,a18x,a18C],a19k)
; (IntersectL [a18v,a18w,a18x,a18y],a18Z)
; (a19d,a18C)
; (a18Z,a18z)
; (a196,a18B)
; (a19k,a18D)

; WANTEDS (Thoralf style)
; (IntersectL [a18v,a18w,IntersectL [a18v,a18w,a18K,a18L],a18N],a18B)
; (IntersectL [a18v,a18w,a18K,IntersectL [a18v,a18w,a18L,a18N]],a18D)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a19E} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a19Q} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; GIVENS (names)
;  a18x  <=  a
;  a18y  <=  b
;  a18z  <=  ab
;  a18A  <=  c
;  a18B  <=  abc
;  a18C  <=  bc
;  a18D  <=  abc'
;  a18Z  <=  fsk_a18Z
;  a196  <=  fsk_a196
;  a19d  <=  fsk_a19d
;  a19k  <=  fsk_a19k
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta18w)) (y (Maybe Sorta18w))) (=> (and ((_ is (just (Sorta18w) (Maybe Sorta18w))) x) ((_ is (just (Sorta18w) (Maybe Sorta18w))) y)) (= (both8515045014172041172 x y) x))))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 y (as nothing (Maybe Sorta18w))) (as nothing (Maybe Sorta18w)))))
; (declare-const a18A (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18B (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18C (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18D (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18Z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18x (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18y (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a196 (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19d (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19k (Array Sorta18v (Maybe Sorta18w)))
; (declare-fun both8515045014172041172 ((Maybe Sorta18w) (Maybe Sorta18w)) (Maybe Sorta18w))
; (declare-sort Sorta18v)
; (declare-sort Sorta18w)
(declare-sort Sorta18v)
(declare-sort Sorta18w)
(declare-const
   a18x
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18y
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18A
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18B
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18C
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18D
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18Z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a196
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19d
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19k
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-fun
   both8515045014172041172
   (
     (Maybe Sorta18w)
     (Maybe Sorta18w))
   (Maybe Sorta18w))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172
            y
            (as
               nothing
               (Maybe Sorta18w)))
         (as
            nothing
            (Maybe Sorta18w)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18w))
        (y
           (Maybe Sorta18w)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              y))
         (=
            (both8515045014172041172 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18y
           a18A)
         a19d)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18z
           a18A)
         a196)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18C)
         a19k)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18y)
         a18Z)
      :named
      given-2.4))
(assert
   (!
      (= a19d a18C)
      :named
      given-2.5))
(assert
   (!
      (= a18Z a18z)
      :named
      given-2.6))
(assert
   (!
      (= a196 a18B)
      :named
      given-2.7))
(assert
   (!
      (= a19k a18D)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a19E} {3}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a19Q} {3}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; WANTEDS (names)
;  a18B  <=  abc
;  a18D  <=  abc'
;  a18K  <=  a_a18K
;  a18L  <=  b_a18L
;  a18N  <=  c_a18N
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a18K (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18L (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18N (Array Sorta18v (Maybe Sorta18w)))
(declare-const
   a18K
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18L
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18N
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 (
                   (_ map both8515045014172041172)
                   a18K
                   a18L)
                 a18N)
               a18B))
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 a18K
                 (
                   (_ map both8515045014172041172)
                   a18L
                   a18N))
               a18D)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      Sorta18w!val!3
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!4
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!2
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!5
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!0
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!6
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!1
;      ()
;      Sorta18w)
;   (forall
;      (
;        (x Sorta18w))
;      (or
;         (= x Sorta18w!val!3)
;         (= x Sorta18w!val!4)
;         (= x Sorta18w!val!2)
;         (= x Sorta18w!val!5)
;         (= x Sorta18w!val!0)
;         (= x Sorta18w!val!6)
;         (= x Sorta18w!val!1)))
;   (declare-fun
;      Sorta18v!val!0
;      ()
;      Sorta18v)
;   (forall
;      (
;        (x Sorta18v))
;      (= x Sorta18v!val!0))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!6))
;         Sorta18v!val!0
;         (just Sorta18w!val!5)))
;   (define-fun
;      a18L
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!1))
;         Sorta18v!val!0
;         (just Sorta18w!val!3)))
;   (define-fun
;      a19k
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18C
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= a18Z a18z))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18z
;           a18A)
;         a196))
;   (define-fun
;      a19d
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
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
;                      (_ map both8515045014172041172)
;                      (
;                        (_ map both8515045014172041172)
;                        a18K
;                        a18L)
;                      a18N)
;                    a18B)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8515045014172041172)
;                      a18K
;                      (
;                        (_ map both8515045014172041172)
;                        a18L
;                        a18N))
;                    a18D))))
;         (or a!1 a!2)))
;   (define-fun
;      a18Z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= a19d a18C))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= a196 a18B))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= a19k a18D))
;   (define-fun
;      a18B
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18K
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!0))
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18N
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18C)
;         a19k))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18y)
;         a18Z))
;   (define-fun
;      a18y
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a196
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18y
;           a18A)
;         a19d))
;   (define-fun
;      a18z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18D
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18A
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      both8515045014172041172
;      (
;        (x!0
;           (Maybe Sorta18w))
;        (x!1
;           (Maybe Sorta18w)))
;      (Maybe Sorta18w)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta18w!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta18w!val!0))
;                  (=
;                     x!1
;                     (just Sorta18w!val!1)))
;               (just Sorta18w!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta18w!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta18w!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta18w!val!2))
;                           (=
;                              x!1
;                              (just Sorta18w!val!3)))
;                        (just Sorta18w!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta18w!val!2))
;                              (=
;                                 x!1
;                                 (just Sorta18w!val!4)))
;                           (just Sorta18w!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta18w!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta18w!val!3))
;                                    (=
;                                       x!1
;                                       (just Sorta18w!val!4)))
;                                 (just Sorta18w!val!3)
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
; [G] co_a19e {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a197 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a19l {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a190 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a19f {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a191 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a198 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a19m {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a19V} {4}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1a0} {4}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a18v,a18w,a18y,a18A],a19d)
; (IntersectL [a18v,a18w,a18z,a18A],a196)
; (IntersectL [a18v,a18w,a18x,a18C],a19k)
; (IntersectL [a18v,a18w,a18x,a18y],a18Z)
; (a19d,a18C)
; (a18Z,a18z)
; (a196,a18B)
; (a19k,a18D)

; WANTEDS (Thoralf style)
; (IntersectL [a18v,a18w,IntersectL [a18v,a18w,a18K,a18L],a18N],a18B)
; (IntersectL [a18v,a18w,a18K,IntersectL [a18v,a18w,a18L,a18N]],a18D)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a19V} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a1a0} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; GIVENS (names)
;  a18x  <=  a
;  a18y  <=  b
;  a18z  <=  ab
;  a18A  <=  c
;  a18B  <=  abc
;  a18C  <=  bc
;  a18D  <=  abc'
;  a18Z  <=  fsk_a18Z
;  a196  <=  fsk_a196
;  a19d  <=  fsk_a19d
;  a19k  <=  fsk_a19k
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta18w)) (y (Maybe Sorta18w))) (=> (and ((_ is (just (Sorta18w) (Maybe Sorta18w))) x) ((_ is (just (Sorta18w) (Maybe Sorta18w))) y)) (= (both8515045014172041172 x y) x))))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 y (as nothing (Maybe Sorta18w))) (as nothing (Maybe Sorta18w)))))
; (declare-const a18A (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18B (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18C (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18D (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18Z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18x (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18y (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a196 (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19d (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19k (Array Sorta18v (Maybe Sorta18w)))
; (declare-fun both8515045014172041172 ((Maybe Sorta18w) (Maybe Sorta18w)) (Maybe Sorta18w))
; (declare-sort Sorta18v)
; (declare-sort Sorta18w)
; DECS1 (unseen) 
(declare-sort Sorta18v)
(declare-sort Sorta18w)
(declare-const
   a18x
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18y
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18A
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18B
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18C
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18D
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18Z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a196
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19d
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19k
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-fun
   both8515045014172041172
   (
     (Maybe Sorta18w)
     (Maybe Sorta18w))
   (Maybe Sorta18w))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172
            y
            (as
               nothing
               (Maybe Sorta18w)))
         (as
            nothing
            (Maybe Sorta18w)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18w))
        (y
           (Maybe Sorta18w)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              y))
         (=
            (both8515045014172041172 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18y
           a18A)
         a19d)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18z
           a18A)
         a196)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18C)
         a19k)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18y)
         a18Z)
      :named
      given-3.4))
(assert
   (!
      (= a19d a18C)
      :named
      given-3.5))
(assert
   (!
      (= a18Z a18z)
      :named
      given-3.6))
(assert
   (!
      (= a196 a18B)
      :named
      given-3.7))
(assert
   (!
      (= a19k a18D)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a19V} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a1a0} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; WANTEDS (names)
;  a18B  <=  abc
;  a18D  <=  abc'
;  a18K  <=  a_a18K
;  a18L  <=  b_a18L
;  a18N  <=  c_a18N
; DECS2 (seen) 
; (declare-const a18K (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18L (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18N (Array Sorta18v (Maybe Sorta18w)))
; DECS2 (unseen) 
(declare-const
   a18K
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18L
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18N
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 (
                   (_ map both8515045014172041172)
                   a18K
                   a18L)
                 a18N)
               a18B))
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 a18K
                 (
                   (_ map both8515045014172041172)
                   a18L
                   a18N))
               a18D)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta18w!val!5
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!3
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!4
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!6
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!2
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!7
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!0
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!1
;      ()
;      Sorta18w)
;   (forall
;      (
;        (x Sorta18w))
;      (or
;         (= x Sorta18w!val!5)
;         (= x Sorta18w!val!3)
;         (= x Sorta18w!val!4)
;         (= x Sorta18w!val!6)
;         (= x Sorta18w!val!2)
;         (= x Sorta18w!val!7)
;         (= x Sorta18w!val!0)
;         (= x Sorta18w!val!1)))
;   (declare-fun
;      Sorta18v!val!0
;      ()
;      Sorta18v)
;   (forall
;      (
;        (x Sorta18v))
;      (= x Sorta18v!val!0))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a18Z a18z))
;   (define-fun
;      a18A
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!5)))
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
;                      (_ map both8515045014172041172)
;                      (
;                        (_ map both8515045014172041172)
;                        a18K
;                        a18L)
;                      a18N)
;                    a18B)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8515045014172041172)
;                      a18K
;                      (
;                        (_ map both8515045014172041172)
;                        a18L
;                        a18N))
;                    a18D))))
;         (or a!1 a!2)))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!7))
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18C
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      a19d
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18z
;           a18A)
;         a196))
;   (define-fun
;      a19k
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18Z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18K
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!0))
;         Sorta18v!val!0
;         (just Sorta18w!val!3)))
;   (define-fun
;      a18L
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!1))
;         Sorta18v!val!0
;         (just Sorta18w!val!6)))
;   (define-fun
;      a18N
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18B
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a19d a18C))
;   (define-fun
;      a196
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18y
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18y
;           a18A)
;         a19d))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a19k a18D))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a196 a18B))
;   (define-fun
;      a18z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18D
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18y)
;         a18Z))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18C)
;         a19k))
;   (define-fun
;      both8515045014172041172
;      (
;        (x!0
;           (Maybe Sorta18w))
;        (x!1
;           (Maybe Sorta18w)))
;      (Maybe Sorta18w)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta18w!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta18w!val!0))
;                  (=
;                     x!1
;                     (just Sorta18w!val!1)))
;               (just Sorta18w!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta18w!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta18w!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta18w!val!2))
;                           (=
;                              x!1
;                              (just Sorta18w!val!5)))
;                        (just Sorta18w!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta18w!val!3))
;                              (=
;                                 x!1
;                                 (just Sorta18w!val!6)))
;                           (just Sorta18w!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta18w!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta18w!val!4))
;                                    (=
;                                       x!1
;                                       (just Sorta18w!val!5)))
;                                 (just Sorta18w!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta18w!val!2))
;                                       (=
;                                          x!1
;                                          (just Sorta18w!val!4)))
;                                    (just Sorta18w!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just Sorta18w!val!6))
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
; [G] co_a19e {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a197 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a19l {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a190 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a19f {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a191 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a198 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a19m {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a19V} {4}:: IntersectL (IntersectL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1a0} {4}:: IntersectL a0 (IntersectL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a18v,a18w,a18y,a18A],a19d)
; (IntersectL [a18v,a18w,a18z,a18A],a196)
; (IntersectL [a18v,a18w,a18x,a18C],a19k)
; (IntersectL [a18v,a18w,a18x,a18y],a18Z)
; (a19d,a18C)
; (a18Z,a18z)
; (a196,a18B)
; (a19k,a18D)

; WANTEDS (Thoralf style)
; (IntersectL [a18v,a18w,IntersectL [a18v,a18w,a18K,a18L],a18N],a18B)
; (IntersectL [a18v,a18w,a18K,IntersectL [a18v,a18w,a18L,a18N]],a18D)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a19V} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a1a0} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; GIVENS (names)
;  a18x  <=  a
;  a18y  <=  b
;  a18z  <=  ab
;  a18A  <=  c
;  a18B  <=  abc
;  a18C  <=  bc
;  a18D  <=  abc'
;  a18Z  <=  fsk_a18Z
;  a196  <=  fsk_a196
;  a19d  <=  fsk_a19d
;  a19k  <=  fsk_a19k
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta18w)) (y (Maybe Sorta18w))) (=> (and ((_ is (just (Sorta18w) (Maybe Sorta18w))) x) ((_ is (just (Sorta18w) (Maybe Sorta18w))) y)) (= (both8515045014172041172 x y) x))))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta18w))) (= (both8515045014172041172 y (as nothing (Maybe Sorta18w))) (as nothing (Maybe Sorta18w)))))
; (declare-const a18A (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18B (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18C (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18D (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18Z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18x (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18y (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18z (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a196 (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19d (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a19k (Array Sorta18v (Maybe Sorta18w)))
; (declare-fun both8515045014172041172 ((Maybe Sorta18w) (Maybe Sorta18w)) (Maybe Sorta18w))
; (declare-sort Sorta18v)
; (declare-sort Sorta18w)
; DECS1 (unseen) 
(declare-sort Sorta18v)
(declare-sort Sorta18w)
(declare-const
   a18x
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18y
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18A
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18B
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18C
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18D
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18Z
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a196
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19d
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a19k
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-fun
   both8515045014172041172
   (
     (Maybe Sorta18w)
     (Maybe Sorta18w))
   (Maybe Sorta18w))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172
            y
            (as
               nothing
               (Maybe Sorta18w)))
         (as
            nothing
            (Maybe Sorta18w)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta18w)))
      (=
         (both8515045014172041172 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta18w))
        (y
           (Maybe Sorta18w)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta18w)
                    (Maybe Sorta18w)))
              y))
         (=
            (both8515045014172041172 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18y
           a18A)
         a19d)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18z
           a18A)
         a196)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18C)
         a19k)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8515045014172041172)
           a18x
           a18y)
         a18Z)
      :named
      given-3.4))
(assert
   (!
      (= a19d a18C)
      :named
      given-3.5))
(assert
   (!
      (= a18Z a18z)
      :named
      given-3.6))
(assert
   (!
      (= a196 a18B)
      :named
      given-3.7))
(assert
   (!
      (= a19k a18D)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a19V} {4}:: IntersectL (IntersectL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      (
;        (_ map both8515045014172041172)
;        a18K
;        a18L)
;      a18N)
;    a18B)

;      [WD] hole{co_a1a0} {4}:: IntersectL a0 (IntersectL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8515045014172041172)
;      a18K
;      (
;        (_ map both8515045014172041172)
;        a18L
;        a18N))
;    a18D)

; WANTEDS (names)
;  a18B  <=  abc
;  a18D  <=  abc'
;  a18K  <=  a_a18K
;  a18L  <=  b_a18L
;  a18N  <=  c_a18N
; DECS2 (seen) 
; (declare-const a18K (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18L (Array Sorta18v (Maybe Sorta18w)))
; (declare-const a18N (Array Sorta18v (Maybe Sorta18w)))
; DECS2 (unseen) 
(declare-const
   a18K
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18L
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(declare-const
   a18N
   (Array
      Sorta18v
      (Maybe Sorta18w)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 (
                   (_ map both8515045014172041172)
                   a18K
                   a18L)
                 a18N)
               a18B))
         (not
            (=
               (
                 (_ map both8515045014172041172)
                 a18K
                 (
                   (_ map both8515045014172041172)
                   a18L
                   a18N))
               a18D)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      Sorta18w!val!5
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!3
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!4
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!6
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!2
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!7
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!0
;      ()
;      Sorta18w)
;   (declare-fun
;      Sorta18w!val!1
;      ()
;      Sorta18w)
;   (forall
;      (
;        (x Sorta18w))
;      (or
;         (= x Sorta18w!val!5)
;         (= x Sorta18w!val!3)
;         (= x Sorta18w!val!4)
;         (= x Sorta18w!val!6)
;         (= x Sorta18w!val!2)
;         (= x Sorta18w!val!7)
;         (= x Sorta18w!val!0)
;         (= x Sorta18w!val!1)))
;   (declare-fun
;      Sorta18v!val!0
;      ()
;      Sorta18v)
;   (forall
;      (
;        (x Sorta18v))
;      (= x Sorta18v!val!0))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= a18Z a18z))
;   (define-fun
;      a18A
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!5)))
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
;                      (_ map both8515045014172041172)
;                      (
;                        (_ map both8515045014172041172)
;                        a18K
;                        a18L)
;                      a18N)
;                    a18B)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both8515045014172041172)
;                      a18K
;                      (
;                        (_ map both8515045014172041172)
;                        a18L
;                        a18N))
;                    a18D))))
;         (or a!1 a!2)))
;   (define-fun
;      a18x
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!7))
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18C
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      a19d
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18z
;           a18A)
;         a196))
;   (define-fun
;      a19k
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18Z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18K
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!0))
;         Sorta18v!val!0
;         (just Sorta18w!val!3)))
;   (define-fun
;      a18L
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           (just Sorta18w!val!1))
;         Sorta18v!val!0
;         (just Sorta18w!val!6)))
;   (define-fun
;      a18N
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (
;        (as
;           const
;           (Array
;              Sorta18v
;              (Maybe Sorta18w)))
;        nothing))
;   (define-fun
;      a18B
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= a19d a18C))
;   (define-fun
;      a196
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18y
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!4)))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18y
;           a18A)
;         a19d))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= a19k a18D))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= a196 a18B))
;   (define-fun
;      a18z
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      a18D
;      ()
;      (Array
;         Sorta18v
;         (Maybe Sorta18w))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta18v
;                 (Maybe Sorta18w)))
;           nothing)
;         Sorta18v!val!0
;         (just Sorta18w!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18y)
;         a18Z))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both8515045014172041172)
;           a18x
;           a18C)
;         a19k))
;   (define-fun
;      both8515045014172041172
;      (
;        (x!0
;           (Maybe Sorta18w))
;        (x!1
;           (Maybe Sorta18w)))
;      (Maybe Sorta18w)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just Sorta18w!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just Sorta18w!val!0))
;                  (=
;                     x!1
;                     (just Sorta18w!val!1)))
;               (just Sorta18w!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just Sorta18w!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just Sorta18w!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta18w!val!2))
;                           (=
;                              x!1
;                              (just Sorta18w!val!5)))
;                        (just Sorta18w!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta18w!val!3))
;                              (=
;                                 x!1
;                                 (just Sorta18w!val!6)))
;                           (just Sorta18w!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just Sorta18w!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just Sorta18w!val!4))
;                                    (=
;                                       x!1
;                                       (just Sorta18w!val!5)))
;                                 (just Sorta18w!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just Sorta18w!val!2))
;                                       (=
;                                          x!1
;                                          (just Sorta18w!val!4)))
;                                    (just Sorta18w!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just Sorta18w!val!6))
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
; [G] co_a1bb {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1b4 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1bi {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1aX {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1bc {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1aY {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1b5 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1bj {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1bx} {3}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1bJ} {3}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1as,a1at,a1av,a1ax],a1ba)
; (UnionL [a1as,a1at,a1aw,a1ax],a1b3)
; (UnionL [a1as,a1at,a1au,a1az],a1bh)
; (UnionL [a1as,a1at,a1au,a1av],a1aW)
; (a1ba,a1az)
; (a1aW,a1aw)
; (a1b3,a1ay)
; (a1bh,a1aA)

; WANTEDS (Thoralf style)
; (UnionL [a1as,a1at,UnionL [a1as,a1at,a1aH,a1aI],a1aK],a1ay)
; (UnionL [a1as,a1at,a1aH,UnionL [a1as,a1at,a1aI,a1aK]],a1aA)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1bx} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bJ} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; GIVENS (names)
;  a1au  <=  a
;  a1av  <=  b
;  a1aw  <=  ab
;  a1ax  <=  c
;  a1ay  <=  abc
;  a1az  <=  bc
;  a1aA  <=  abc'
;  a1aW  <=  fsk_a1aW
;  a1b3  <=  fsk_a1b3
;  a1ba  <=  fsk_a1ba
;  a1bh  <=  fsk_a1bh
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1at)) (y (Maybe Sorta1at))) (=> ((_ is (just (Sorta1at) (Maybe Sorta1at))) x) (= (either8567695128478517548 x y) x))))
; (assert (forall ((y (Maybe Sorta1at))) (= (either8567695128478517548 (as nothing (Maybe Sorta1at)) y) y)))
; (declare-const a1aA (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aW (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1au (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1av (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aw (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ax (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ay (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1az (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1b3 (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ba (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1bh (Array Sorta1as (Maybe Sorta1at)))
; (declare-fun either8567695128478517548 ((Maybe Sorta1at) (Maybe Sorta1at)) (Maybe Sorta1at))
; (declare-sort Sorta1as)
; (declare-sort Sorta1at)
(declare-sort Sorta1as)
(declare-sort Sorta1at)
(declare-const
   a1au
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1av
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aw
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ax
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ay
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1az
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aA
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aW
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1b3
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ba
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1bh
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-fun
   either8567695128478517548
   (
     (Maybe Sorta1at)
     (Maybe Sorta1at))
   (Maybe Sorta1at))
(assert
   (forall
      (
        (y
           (Maybe Sorta1at)))
      (=
         (either8567695128478517548
            (as
               nothing
               (Maybe Sorta1at))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1at))
        (y
           (Maybe Sorta1at)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1at)
                 (Maybe Sorta1at)))
           x)
         (=
            (either8567695128478517548 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1av
           a1ax)
         a1ba)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1aw
           a1ax)
         a1b3)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1az)
         a1bh)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1av)
         a1aW)
      :named
      given-5.4))
(assert
   (!
      (= a1ba a1az)
      :named
      given-5.5))
(assert
   (!
      (= a1aW a1aw)
      :named
      given-5.6))
(assert
   (!
      (= a1b3 a1ay)
      :named
      given-5.7))
(assert
   (!
      (= a1bh a1aA)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1bx} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bJ} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; WANTEDS (names)
;  a1ay  <=  abc
;  a1aA  <=  abc'
;  a1aH  <=  a_a1aH
;  a1aI  <=  b_a1aI
;  a1aK  <=  c_a1aK
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1aH (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aI (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aK (Array Sorta1as (Maybe Sorta1at)))
(declare-const
   a1aH
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aI
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aK
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 (
                   (_ map either8567695128478517548)
                   a1aH
                   a1aI)
                 a1aK)
               a1ay))
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 a1aH
                 (
                   (_ map either8567695128478517548)
                   a1aI
                   a1aK))
               a1aA)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      Sorta1as!val!0
;      ()
;      Sorta1as)
;   (declare-fun
;      Sorta1as!val!1
;      ()
;      Sorta1as)
;   (forall
;      (
;        (x Sorta1as))
;      (or
;         (= x Sorta1as!val!0)
;         (= x Sorta1as!val!1)))
;   (declare-fun
;      Sorta1at!val!2
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!3
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!4
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!0
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!1
;      ()
;      Sorta1at)
;   (forall
;      (
;        (x Sorta1at))
;      (or
;         (= x Sorta1at!val!2)
;         (= x Sorta1at!val!3)
;         (= x Sorta1at!val!4)
;         (= x Sorta1at!val!0)
;         (= x Sorta1at!val!1)))
;   (define-fun
;      a1aW
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            nothing)
;         Sorta1as!val!0
;         nothing))
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
;                      (_ map either8567695128478517548)
;                      (
;                        (_ map either8567695128478517548)
;                        a1aH
;                        a1aI)
;                      a1aK)
;                    a1ay)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8567695128478517548)
;                      a1aH
;                      (
;                        (_ map either8567695128478517548)
;                        a1aI
;                        a1aK))
;                    a1aA))))
;         (or a!1 a!2)))
;   (define-fun
;      a1aw
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            nothing)
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      a1bh
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1b3
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1av
;           a1ax)
;         a1ba))
;   (define-fun
;      a1az
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!0
;            (just Sorta1at!val!3))
;         Sorta1as!val!1
;         (just Sorta1at!val!1)))
;   (define-fun
;      a1aA
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aH
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1av)
;         a1aW))
;   (define-fun
;      a1au
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= a1bh a1aA))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1az)
;         a1bh))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= a1aW a1aw))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= a1b3 a1ay))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1aw
;           a1ax)
;         a1b3))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= a1ba a1az))
;   (define-fun
;      a1ax
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              nothing)
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1ba
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!0
;            (just Sorta1at!val!3))
;         Sorta1as!val!1
;         (just Sorta1at!val!1)))
;   (define-fun
;      a1ay
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aI
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           nothing)
;         Sorta1as!val!1
;         (just Sorta1at!val!4)))
;   (define-fun
;      a1av
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            nothing)
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      a1aK
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!0))
;         Sorta1as!val!1
;         nothing))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta1as))
;      (Maybe Sorta1at)
;      (ite
;         (= x!0 Sorta1as!val!1)
;         (just Sorta1at!val!4)
;         (just Sorta1at!val!0)))
;   (define-fun
;      k!71
;      (
;        (x!0 Sorta1as))
;      (Maybe Sorta1at)
;      (ite
;         (= x!0 Sorta1as!val!1)
;         (just Sorta1at!val!1)
;         (ite
;            (= x!0 Sorta1as!val!0)
;            (just Sorta1at!val!3)
;            (just Sorta1at!val!2))))
;   (define-fun
;      either8567695128478517548
;      (
;        (x!0
;           (Maybe Sorta1at))
;        (x!1
;           (Maybe Sorta1at)))
;      (Maybe Sorta1at)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1at!val!2))
;            (= x!1 nothing))
;         (just Sorta1at!val!2)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1at!val!2)))
;            (just Sorta1at!val!2)
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
;                        (just Sorta1at!val!0)))
;                  (just Sorta1at!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1at!val!3)))
;                     (just Sorta1at!val!3)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1at!val!4))
;                           (= x!1 nothing))
;                        (just Sorta1at!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta1at!val!1)))
;                           (just Sorta1at!val!1)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1at!val!4)))
;                              (just Sorta1at!val!4)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1)))))))))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_a1bb {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1b4 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1bi {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1aX {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1bc {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1aY {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1b5 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1bj {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1bx} {3}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1bJ} {3}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1as,a1at,a1av,a1ax],a1ba)
; (UnionL [a1as,a1at,a1aw,a1ax],a1b3)
; (UnionL [a1as,a1at,a1au,a1az],a1bh)
; (UnionL [a1as,a1at,a1au,a1av],a1aW)
; (a1ba,a1az)
; (a1aW,a1aw)
; (a1b3,a1ay)
; (a1bh,a1aA)

; WANTEDS (Thoralf style)
; (UnionL [a1as,a1at,UnionL [a1as,a1at,a1aH,a1aI],a1aK],a1ay)
; (UnionL [a1as,a1at,a1aH,UnionL [a1as,a1at,a1aI,a1aK]],a1aA)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a1bx} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bJ} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; GIVENS (names)
;  a1au  <=  a
;  a1av  <=  b
;  a1aw  <=  ab
;  a1ax  <=  c
;  a1ay  <=  abc
;  a1az  <=  bc
;  a1aA  <=  abc'
;  a1aW  <=  fsk_a1aW
;  a1b3  <=  fsk_a1b3
;  a1ba  <=  fsk_a1ba
;  a1bh  <=  fsk_a1bh
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1at)) (y (Maybe Sorta1at))) (=> ((_ is (just (Sorta1at) (Maybe Sorta1at))) x) (= (either8567695128478517548 x y) x))))
; (assert (forall ((y (Maybe Sorta1at))) (= (either8567695128478517548 (as nothing (Maybe Sorta1at)) y) y)))
; (declare-const a1aA (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aW (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1au (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1av (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aw (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ax (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ay (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1az (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1b3 (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ba (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1bh (Array Sorta1as (Maybe Sorta1at)))
; (declare-fun either8567695128478517548 ((Maybe Sorta1at) (Maybe Sorta1at)) (Maybe Sorta1at))
; (declare-sort Sorta1as)
; (declare-sort Sorta1at)
(declare-sort Sorta1as)
(declare-sort Sorta1at)
(declare-const
   a1au
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1av
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aw
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ax
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ay
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1az
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aA
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aW
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1b3
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ba
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1bh
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-fun
   either8567695128478517548
   (
     (Maybe Sorta1at)
     (Maybe Sorta1at))
   (Maybe Sorta1at))
(assert
   (forall
      (
        (y
           (Maybe Sorta1at)))
      (=
         (either8567695128478517548
            (as
               nothing
               (Maybe Sorta1at))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1at))
        (y
           (Maybe Sorta1at)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1at)
                 (Maybe Sorta1at)))
           x)
         (=
            (either8567695128478517548 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1av
           a1ax)
         a1ba)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1aw
           a1ax)
         a1b3)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1az)
         a1bh)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1av)
         a1aW)
      :named
      given-5.4))
(assert
   (!
      (= a1ba a1az)
      :named
      given-5.5))
(assert
   (!
      (= a1aW a1aw)
      :named
      given-5.6))
(assert
   (!
      (= a1b3 a1ay)
      :named
      given-5.7))
(assert
   (!
      (= a1bh a1aA)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a1bx} {3}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bJ} {3}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; WANTEDS (names)
;  a1ay  <=  abc
;  a1aA  <=  abc'
;  a1aH  <=  a_a1aH
;  a1aI  <=  b_a1aI
;  a1aK  <=  c_a1aK
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1aH (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aI (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aK (Array Sorta1as (Maybe Sorta1at)))
(declare-const
   a1aH
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aI
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aK
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 (
                   (_ map either8567695128478517548)
                   a1aH
                   a1aI)
                 a1aK)
               a1ay))
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 a1aH
                 (
                   (_ map either8567695128478517548)
                   a1aI
                   a1aK))
               a1aA)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      Sorta1as!val!0
;      ()
;      Sorta1as)
;   (declare-fun
;      Sorta1as!val!1
;      ()
;      Sorta1as)
;   (forall
;      (
;        (x Sorta1as))
;      (or
;         (= x Sorta1as!val!0)
;         (= x Sorta1as!val!1)))
;   (declare-fun
;      Sorta1at!val!2
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!3
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!4
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!0
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!1
;      ()
;      Sorta1at)
;   (forall
;      (
;        (x Sorta1at))
;      (or
;         (= x Sorta1at!val!2)
;         (= x Sorta1at!val!3)
;         (= x Sorta1at!val!4)
;         (= x Sorta1at!val!0)
;         (= x Sorta1at!val!1)))
;   (define-fun
;      a1aW
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            nothing)
;         Sorta1as!val!0
;         nothing))
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
;                      (_ map either8567695128478517548)
;                      (
;                        (_ map either8567695128478517548)
;                        a1aH
;                        a1aI)
;                      a1aK)
;                    a1ay)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8567695128478517548)
;                      a1aH
;                      (
;                        (_ map either8567695128478517548)
;                        a1aI
;                        a1aK))
;                    a1aA))))
;         (or a!1 a!2)))
;   (define-fun
;      a1aw
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            nothing)
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      a1bh
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1b3
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1av
;           a1ax)
;         a1ba))
;   (define-fun
;      a1az
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!0
;            (just Sorta1at!val!3))
;         Sorta1as!val!1
;         (just Sorta1at!val!1)))
;   (define-fun
;      a1aA
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aH
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1av)
;         a1aW))
;   (define-fun
;      a1au
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= a1bh a1aA))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1az)
;         a1bh))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= a1aW a1aw))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= a1b3 a1ay))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1aw
;           a1ax)
;         a1b3))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= a1ba a1az))
;   (define-fun
;      a1ax
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              nothing)
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1ba
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!0
;            (just Sorta1at!val!3))
;         Sorta1as!val!1
;         (just Sorta1at!val!1)))
;   (define-fun
;      a1ay
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            (just Sorta1at!val!1))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aI
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           nothing)
;         Sorta1as!val!1
;         (just Sorta1at!val!4)))
;   (define-fun
;      a1av
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    Sorta1as
;                    (Maybe Sorta1at)))
;              (just Sorta1at!val!2))
;            Sorta1as!val!1
;            nothing)
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      a1aK
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!0))
;         Sorta1as!val!1
;         nothing))
;   (define-fun
;      k!79
;      (
;        (x!0 Sorta1as))
;      (Maybe Sorta1at)
;      (ite
;         (= x!0 Sorta1as!val!1)
;         (just Sorta1at!val!4)
;         (just Sorta1at!val!0)))
;   (define-fun
;      k!71
;      (
;        (x!0 Sorta1as))
;      (Maybe Sorta1at)
;      (ite
;         (= x!0 Sorta1as!val!1)
;         (just Sorta1at!val!1)
;         (ite
;            (= x!0 Sorta1as!val!0)
;            (just Sorta1at!val!3)
;            (just Sorta1at!val!2))))
;   (define-fun
;      either8567695128478517548
;      (
;        (x!0
;           (Maybe Sorta1at))
;        (x!1
;           (Maybe Sorta1at)))
;      (Maybe Sorta1at)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1at!val!2))
;            (= x!1 nothing))
;         (just Sorta1at!val!2)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1at!val!2)))
;            (just Sorta1at!val!2)
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
;                        (just Sorta1at!val!0)))
;                  (just Sorta1at!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1at!val!3)))
;                     (just Sorta1at!val!3)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just Sorta1at!val!4))
;                           (= x!1 nothing))
;                        (just Sorta1at!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just Sorta1at!val!1)))
;                           (just Sorta1at!val!1)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just Sorta1at!val!4)))
;                              (just Sorta1at!val!4)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1)))))))))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_a1bb {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1b4 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1bi {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1aX {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1bc {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1aY {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1b5 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1bj {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1bO} {4}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1bT} {4}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1as,a1at,a1av,a1ax],a1ba)
; (UnionL [a1as,a1at,a1aw,a1ax],a1b3)
; (UnionL [a1as,a1at,a1au,a1az],a1bh)
; (UnionL [a1as,a1at,a1au,a1av],a1aW)
; (a1ba,a1az)
; (a1aW,a1aw)
; (a1b3,a1ay)
; (a1bh,a1aA)

; WANTEDS (Thoralf style)
; (UnionL [a1as,a1at,UnionL [a1as,a1at,a1aH,a1aI],a1aK],a1ay)
; (UnionL [a1as,a1at,a1aH,UnionL [a1as,a1at,a1aI,a1aK]],a1aA)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1bO} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bT} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; GIVENS (names)
;  a1au  <=  a
;  a1av  <=  b
;  a1aw  <=  ab
;  a1ax  <=  c
;  a1ay  <=  abc
;  a1az  <=  bc
;  a1aA  <=  abc'
;  a1aW  <=  fsk_a1aW
;  a1b3  <=  fsk_a1b3
;  a1ba  <=  fsk_a1ba
;  a1bh  <=  fsk_a1bh
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1at)) (y (Maybe Sorta1at))) (=> ((_ is (just (Sorta1at) (Maybe Sorta1at))) x) (= (either8567695128478517548 x y) x))))
; (assert (forall ((y (Maybe Sorta1at))) (= (either8567695128478517548 (as nothing (Maybe Sorta1at)) y) y)))
; (declare-const a1aA (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aW (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1au (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1av (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aw (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ax (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ay (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1az (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1b3 (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ba (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1bh (Array Sorta1as (Maybe Sorta1at)))
; (declare-fun either8567695128478517548 ((Maybe Sorta1at) (Maybe Sorta1at)) (Maybe Sorta1at))
; (declare-sort Sorta1as)
; (declare-sort Sorta1at)
; DECS1 (unseen) 
(declare-sort Sorta1as)
(declare-sort Sorta1at)
(declare-const
   a1au
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1av
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aw
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ax
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ay
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1az
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aA
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aW
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1b3
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ba
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1bh
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-fun
   either8567695128478517548
   (
     (Maybe Sorta1at)
     (Maybe Sorta1at))
   (Maybe Sorta1at))
(assert
   (forall
      (
        (y
           (Maybe Sorta1at)))
      (=
         (either8567695128478517548
            (as
               nothing
               (Maybe Sorta1at))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1at))
        (y
           (Maybe Sorta1at)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1at)
                 (Maybe Sorta1at)))
           x)
         (=
            (either8567695128478517548 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1av
           a1ax)
         a1ba)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1aw
           a1ax)
         a1b3)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1az)
         a1bh)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1av)
         a1aW)
      :named
      given-6.4))
(assert
   (!
      (= a1ba a1az)
      :named
      given-6.5))
(assert
   (!
      (= a1aW a1aw)
      :named
      given-6.6))
(assert
   (!
      (= a1b3 a1ay)
      :named
      given-6.7))
(assert
   (!
      (= a1bh a1aA)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1bO} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bT} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; WANTEDS (names)
;  a1ay  <=  abc
;  a1aA  <=  abc'
;  a1aH  <=  a_a1aH
;  a1aI  <=  b_a1aI
;  a1aK  <=  c_a1aK
; DECS2 (seen) 
; (declare-const a1aH (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aI (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aK (Array Sorta1as (Maybe Sorta1at)))
; DECS2 (unseen) 
(declare-const
   a1aH
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aI
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aK
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 (
                   (_ map either8567695128478517548)
                   a1aH
                   a1aI)
                 a1aK)
               a1ay))
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 a1aH
                 (
                   (_ map either8567695128478517548)
                   a1aI
                   a1aK))
               a1aA)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      Sorta1as!val!0
;      ()
;      Sorta1as)
;   (forall
;      (
;        (x Sorta1as))
;      (= x Sorta1as!val!0))
;   (declare-fun
;      Sorta1at!val!2
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!3
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!0
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!1
;      ()
;      Sorta1at)
;   (forall
;      (
;        (x Sorta1at))
;      (or
;         (= x Sorta1at!val!2)
;         (= x Sorta1at!val!3)
;         (= x Sorta1at!val!0)
;         (= x Sorta1at!val!1)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= a1bh a1aA))
;   (define-fun
;      a1aW
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1aw
;           a1ax)
;         a1b3))
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
;                      (_ map either8567695128478517548)
;                      (
;                        (_ map either8567695128478517548)
;                        a1aH
;                        a1aI)
;                      a1aK)
;                    a1ay)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8567695128478517548)
;                      a1aH
;                      (
;                        (_ map either8567695128478517548)
;                        a1aI
;                        a1aK))
;                    a1aA))))
;         (or a!1 a!2)))
;   (define-fun
;      a1aw
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      a1bh
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1b3
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1az)
;         a1bh))
;   (define-fun
;      a1az
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aA
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aH
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      a1aI
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           nothing)
;         Sorta1as!val!0
;         (just Sorta1at!val!1)))
;   (define-fun
;      a1au
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      a1ax
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           nothing)
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1av
;           a1ax)
;         a1ba))
;   (define-fun
;      a1ba
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1ay
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aK
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!0))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= a1aW a1aw))
;   (define-fun
;      a1av
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= a1b3 a1ay))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1av)
;         a1aW))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= a1ba a1az))
;   (define-fun
;      either8567695128478517548
;      (
;        (x!0
;           (Maybe Sorta1at))
;        (x!1
;           (Maybe Sorta1at)))
;      (Maybe Sorta1at)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1at!val!2))
;            (= x!1 nothing))
;         (just Sorta1at!val!2)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1at!val!2)))
;            (just Sorta1at!val!2)
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
;                        (just Sorta1at!val!0)))
;                  (just Sorta1at!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1at!val!1)))
;                     (just Sorta1at!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1at!val!3)))
;                        (just Sorta1at!val!3)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1at!val!1))
;                              (= x!1 nothing))
;                           (just Sorta1at!val!1)
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
; [G] co_a1bb {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1b4 {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1bi {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1aX {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1bc {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1aY {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1b5 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1bj {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1bO} {4}:: UnionL (UnionL a0 b0) c0
;                          ~ abc (CNonCanonical)
; [WD] hole{co_a1bT} {4}:: UnionL a0 (UnionL b0 c0)
;                          ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1as,a1at,a1av,a1ax],a1ba)
; (UnionL [a1as,a1at,a1aw,a1ax],a1b3)
; (UnionL [a1as,a1at,a1au,a1az],a1bh)
; (UnionL [a1as,a1at,a1au,a1av],a1aW)
; (a1ba,a1az)
; (a1aW,a1aw)
; (a1b3,a1ay)
; (a1bh,a1aA)

; WANTEDS (Thoralf style)
; (UnionL [a1as,a1at,UnionL [a1as,a1at,a1aH,a1aI],a1aK],a1ay)
; (UnionL [a1as,a1at,a1aH,UnionL [a1as,a1at,a1aI,a1aK]],a1aA)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_a1bO} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bT} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; GIVENS (names)
;  a1au  <=  a
;  a1av  <=  b
;  a1aw  <=  ab
;  a1ax  <=  c
;  a1ay  <=  abc
;  a1az  <=  bc
;  a1aA  <=  abc'
;  a1aW  <=  fsk_a1aW
;  a1b3  <=  fsk_a1b3
;  a1ba  <=  fsk_a1ba
;  a1bh  <=  fsk_a1bh
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe Sorta1at)) (y (Maybe Sorta1at))) (=> ((_ is (just (Sorta1at) (Maybe Sorta1at))) x) (= (either8567695128478517548 x y) x))))
; (assert (forall ((y (Maybe Sorta1at))) (= (either8567695128478517548 (as nothing (Maybe Sorta1at)) y) y)))
; (declare-const a1aA (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aW (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1au (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1av (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aw (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ax (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ay (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1az (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1b3 (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1ba (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1bh (Array Sorta1as (Maybe Sorta1at)))
; (declare-fun either8567695128478517548 ((Maybe Sorta1at) (Maybe Sorta1at)) (Maybe Sorta1at))
; (declare-sort Sorta1as)
; (declare-sort Sorta1at)
; DECS1 (unseen) 
(declare-sort Sorta1as)
(declare-sort Sorta1at)
(declare-const
   a1au
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1av
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aw
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ax
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ay
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1az
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aA
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aW
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1b3
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1ba
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1bh
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-fun
   either8567695128478517548
   (
     (Maybe Sorta1at)
     (Maybe Sorta1at))
   (Maybe Sorta1at))
(assert
   (forall
      (
        (y
           (Maybe Sorta1at)))
      (=
         (either8567695128478517548
            (as
               nothing
               (Maybe Sorta1at))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1at))
        (y
           (Maybe Sorta1at)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1at)
                 (Maybe Sorta1at)))
           x)
         (=
            (either8567695128478517548 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1av
           a1ax)
         a1ba)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1aw
           a1ax)
         a1b3)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1az)
         a1bh)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8567695128478517548)
           a1au
           a1av)
         a1aW)
      :named
      given-6.4))
(assert
   (!
      (= a1ba a1az)
      :named
      given-6.5))
(assert
   (!
      (= a1aW a1aw)
      :named
      given-6.6))
(assert
   (!
      (= a1b3 a1ay)
      :named
      given-6.7))
(assert
   (!
      (= a1bh a1aA)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_a1bO} {4}:: UnionL (UnionL a0 b0) c0
;                               ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      (
;        (_ map either8567695128478517548)
;        a1aH
;        a1aI)
;      a1aK)
;    a1ay)

;      [WD] hole{co_a1bT} {4}:: UnionL a0 (UnionL b0 c0)
;                               ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8567695128478517548)
;      a1aH
;      (
;        (_ map either8567695128478517548)
;        a1aI
;        a1aK))
;    a1aA)

; WANTEDS (names)
;  a1ay  <=  abc
;  a1aA  <=  abc'
;  a1aH  <=  a_a1aH
;  a1aI  <=  b_a1aI
;  a1aK  <=  c_a1aK
; DECS2 (seen) 
; (declare-const a1aH (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aI (Array Sorta1as (Maybe Sorta1at)))
; (declare-const a1aK (Array Sorta1as (Maybe Sorta1at)))
; DECS2 (unseen) 
(declare-const
   a1aH
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aI
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(declare-const
   a1aK
   (Array
      Sorta1as
      (Maybe Sorta1at)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 (
                   (_ map either8567695128478517548)
                   a1aH
                   a1aI)
                 a1aK)
               a1ay))
         (not
            (=
               (
                 (_ map either8567695128478517548)
                 a1aH
                 (
                   (_ map either8567695128478517548)
                   a1aI
                   a1aK))
               a1aA)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      Sorta1as!val!0
;      ()
;      Sorta1as)
;   (forall
;      (
;        (x Sorta1as))
;      (= x Sorta1as!val!0))
;   (declare-fun
;      Sorta1at!val!2
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!3
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!0
;      ()
;      Sorta1at)
;   (declare-fun
;      Sorta1at!val!1
;      ()
;      Sorta1at)
;   (forall
;      (
;        (x Sorta1at))
;      (or
;         (= x Sorta1at!val!2)
;         (= x Sorta1at!val!3)
;         (= x Sorta1at!val!0)
;         (= x Sorta1at!val!1)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= a1bh a1aA))
;   (define-fun
;      a1aW
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1aw
;           a1ax)
;         a1b3))
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
;                      (_ map either8567695128478517548)
;                      (
;                        (_ map either8567695128478517548)
;                        a1aH
;                        a1aI)
;                      a1aK)
;                    a1ay)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either8567695128478517548)
;                      a1aH
;                      (
;                        (_ map either8567695128478517548)
;                        a1aI
;                        a1aK))
;                    a1aA))))
;         (or a!1 a!2)))
;   (define-fun
;      a1aw
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      a1bh
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1b3
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1az)
;         a1bh))
;   (define-fun
;      a1az
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aA
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aH
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      a1aI
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           nothing)
;         Sorta1as!val!0
;         (just Sorta1at!val!1)))
;   (define-fun
;      a1au
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (
;        (as
;           const
;           (Array
;              Sorta1as
;              (Maybe Sorta1at)))
;        nothing))
;   (define-fun
;      a1ax
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           nothing)
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1av
;           a1ax)
;         a1ba))
;   (define-fun
;      a1ba
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1ay
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         (just Sorta1at!val!3)))
;   (define-fun
;      a1aK
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!0))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= a1aW a1aw))
;   (define-fun
;      a1av
;      ()
;      (Array
;         Sorta1as
;         (Maybe Sorta1at))
;      (store
;         (
;           (as
;              const
;              (Array
;                 Sorta1as
;                 (Maybe Sorta1at)))
;           (just Sorta1at!val!2))
;         Sorta1as!val!0
;         nothing))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= a1b3 a1ay))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either8567695128478517548)
;           a1au
;           a1av)
;         a1aW))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= a1ba a1az))
;   (define-fun
;      either8567695128478517548
;      (
;        (x!0
;           (Maybe Sorta1at))
;        (x!1
;           (Maybe Sorta1at)))
;      (Maybe Sorta1at)
;      (ite
;         (and
;            (=
;               x!0
;               (just Sorta1at!val!2))
;            (= x!1 nothing))
;         (just Sorta1at!val!2)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just Sorta1at!val!2)))
;            (just Sorta1at!val!2)
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
;                        (just Sorta1at!val!0)))
;                  (just Sorta1at!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just Sorta1at!val!1)))
;                     (just Sorta1at!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just Sorta1at!val!3)))
;                        (just Sorta1at!val!3)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just Sorta1at!val!1))
;                              (= x!1 nothing))
;                           (just Sorta1at!val!1)
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
; [G] co_a1cx {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1ct {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1cy {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1cB {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1cI} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1cf,"ok",2],a1cw)
; (Alter [Symbol [],Nat [],a1ce,"ok",2],a1cs)
; (a1cw,a1cg)
; (a1cs,a1cf)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1cj,"ok",2],a1cf)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1cI} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1cj
;       "ok"
;       (just 2))
;    a1cf)

; GIVENS (names)
;  a1ce  <=  m1
;  a1cf  <=  m2
;  a1cg  <=  m3
;  a1cs  <=  fsk_a1cs
;  a1cw  <=  fsk_a1cw
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1ce (Array String (Maybe Int)))
; (declare-const a1cf (Array String (Maybe Int)))
; (declare-const a1cg (Array String (Maybe Int)))
; (declare-const a1cs (Array String (Maybe Int)))
; (declare-const a1cw (Array String (Maybe Int)))
(declare-const
   a1ce
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cf
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cg
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cs
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cw
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1cf
            "ok"
            (just 2))
         a1cw)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1ce
            "ok"
            (just 2))
         a1cs)
      :named
      given-8.2))
(assert
   (!
      (= a1cw a1cg)
      :named
      given-8.3))
(assert
   (!
      (= a1cs a1cf)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1cI} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1cj
;       "ok"
;       (just 2))
;    a1cf)

; WANTEDS (names)
;  a1cf  <=  m2
;  a1cj  <=  m1_a1cj
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1cj (Array String (Maybe Int)))
(declare-const
   a1cj
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1cj
               "ok"
               (just 2))
            a1cf))
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
;      (= a1cw a1cg))
;   (define-fun
;      a1ce
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
;      (= a1cs a1cf))
;   (define-fun
;      a1cf
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
;      a1cs
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
;      a1cg
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
;      a1cj
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
;            a1ce
;            "ok"
;            (just 2))
;         a1cs))
;   (define-fun
;      a1cw
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
;               a1cj
;               "ok"
;               (just 2))
;            a1cf)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (store
;            a1cf
;            "ok"
;            (just 2))
;         a1cw)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_a1cx {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1ct {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1cy {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1cB {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1cI} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1cf,"ok",2],a1cw)
; (Alter [Symbol [],Nat [],a1ce,"ok",2],a1cs)
; (a1cw,a1cg)
; (a1cs,a1cf)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1cj,"ok",2],a1cf)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a1cI} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1cj
;       "ok"
;       (just 2))
;    a1cf)

; GIVENS (names)
;  a1ce  <=  m1
;  a1cf  <=  m2
;  a1cg  <=  m3
;  a1cs  <=  fsk_a1cs
;  a1cw  <=  fsk_a1cw
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1ce (Array String (Maybe Int)))
; (declare-const a1cf (Array String (Maybe Int)))
; (declare-const a1cg (Array String (Maybe Int)))
; (declare-const a1cs (Array String (Maybe Int)))
; (declare-const a1cw (Array String (Maybe Int)))
(declare-const
   a1ce
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cf
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cg
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cs
   (Array
      String
      (Maybe Int)))
(declare-const
   a1cw
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1cf
            "ok"
            (just 2))
         a1cw)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1ce
            "ok"
            (just 2))
         a1cs)
      :named
      given-8.2))
(assert
   (!
      (= a1cw a1cg)
      :named
      given-8.3))
(assert
   (!
      (= a1cs a1cf)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a1cI} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1cj
;       "ok"
;       (just 2))
;    a1cf)

; WANTEDS (names)
;  a1cf  <=  m2
;  a1cj  <=  m1_a1cj
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1cj (Array String (Maybe Int)))
(declare-const
   a1cj
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               a1cj
               "ok"
               (just 2))
            a1cf))
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
;      (= a1cw a1cg))
;   (define-fun
;      a1ce
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
;      (= a1cs a1cf))
;   (define-fun
;      a1cf
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
;      a1cs
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
;      a1cg
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
;      a1cj
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
;            a1ce
;            "ok"
;            (just 2))
;         a1cs))
;   (define-fun
;      a1cw
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
;               a1cj
;               "ok"
;               (just 2))
;            a1cf)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (store
;            a1cf
;            "ok"
;            (just 2))
;         a1cw)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_a1dn {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1dj {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1do {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1dr {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1dy} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1d2,a1d4,"bob"],a1dm)
; (Delete [Symbol [],a1d2,a1d3,"bob"],a1di)
; (a1dm,a1d5)
; (a1di,a1d4)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1d2,a1d9,"bob"],a1d4)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a1dy} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1d9
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1d2)))
;    a1d4)

; GIVENS (names)
;  a1d3  <=  m1
;  a1d4  <=  m2
;  a1d5  <=  m3
;  a1di  <=  fsk_a1di
;  a1dm  <=  fsk_a1dm
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1d3 (Array String (Maybe Sorta1d2)))
; (declare-const a1d4 (Array String (Maybe Sorta1d2)))
; (declare-const a1d5 (Array String (Maybe Sorta1d2)))
; (declare-const a1di (Array String (Maybe Sorta1d2)))
; (declare-const a1dm (Array String (Maybe Sorta1d2)))
; (declare-sort Sorta1d2)
(declare-sort Sorta1d2)
(declare-const
   a1d3
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1d4
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1d5
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1di
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1dm
   (Array
      String
      (Maybe Sorta1d2)))
(assert
   (!
      (=
         (store
            a1d4
            "bob"
            (as
               nothing
               (Maybe Sorta1d2)))
         a1dm)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1d3
            "bob"
            (as
               nothing
               (Maybe Sorta1d2)))
         a1di)
      :named
      given-10.2))
(assert
   (!
      (= a1dm a1d5)
      :named
      given-10.3))
(assert
   (!
      (= a1di a1d4)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a1dy} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1d9
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1d2)))
;    a1d4)

; WANTEDS (names)
;  a1d4  <=  m2
;  a1d9  <=  m1_a1d9
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1d9 (Array String (Maybe Sorta1d2)))
(declare-const
   a1d9
   (Array
      String
      (Maybe Sorta1d2)))
(assert
   (!
      (not
         (=
            (store
               a1d9
               "bob"
               (as
                  nothing
                  (Maybe Sorta1d2)))
            a1d4))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      Sorta1d2!val!2
;      ()
;      Sorta1d2)
;   (declare-fun
;      Sorta1d2!val!1
;      ()
;      Sorta1d2)
;   (declare-fun
;      Sorta1d2!val!0
;      ()
;      Sorta1d2)
;   (forall
;      (
;        (x Sorta1d2))
;      (or
;         (= x Sorta1d2!val!2)
;         (= x Sorta1d2!val!1)
;         (= x Sorta1d2!val!0)))
;   (define-fun
;      a1d5
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store a1d4 "bob" nothing)
;         a1dm))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= a1di a1d4))
;   (define-fun
;      a1di
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1d9
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1d2)))
;           (just Sorta1d2!val!2))
;         "b"
;         (just Sorta1d2!val!0)))
;   (define-fun
;      a1d4
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= a1dm a1d5))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store a1d3 "bob" nothing)
;         a1di))
;   (define-fun
;      a1d3
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1d2)))
;           (just Sorta1d2!val!1))
;         "b"
;         nothing))
;   (define-fun
;      a1dm
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
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
;            (store a1d9 "bob" nothing)
;            a1d4))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_a1dn {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1dj {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1do {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1dr {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1dy} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1d2,a1d4,"bob"],a1dm)
; (Delete [Symbol [],a1d2,a1d3,"bob"],a1di)
; (a1dm,a1d5)
; (a1di,a1d4)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1d2,a1d9,"bob"],a1d4)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a1dy} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1d9
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1d2)))
;    a1d4)

; GIVENS (names)
;  a1d3  <=  m1
;  a1d4  <=  m2
;  a1d5  <=  m3
;  a1di  <=  fsk_a1di
;  a1dm  <=  fsk_a1dm
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1d3 (Array String (Maybe Sorta1d2)))
; (declare-const a1d4 (Array String (Maybe Sorta1d2)))
; (declare-const a1d5 (Array String (Maybe Sorta1d2)))
; (declare-const a1di (Array String (Maybe Sorta1d2)))
; (declare-const a1dm (Array String (Maybe Sorta1d2)))
; (declare-sort Sorta1d2)
(declare-sort Sorta1d2)
(declare-const
   a1d3
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1d4
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1d5
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1di
   (Array
      String
      (Maybe Sorta1d2)))
(declare-const
   a1dm
   (Array
      String
      (Maybe Sorta1d2)))
(assert
   (!
      (=
         (store
            a1d4
            "bob"
            (as
               nothing
               (Maybe Sorta1d2)))
         a1dm)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1d3
            "bob"
            (as
               nothing
               (Maybe Sorta1d2)))
         a1di)
      :named
      given-10.2))
(assert
   (!
      (= a1dm a1d5)
      :named
      given-10.3))
(assert
   (!
      (= a1di a1d4)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a1dy} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1d9
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1d2)))
;    a1d4)

; WANTEDS (names)
;  a1d4  <=  m2
;  a1d9  <=  m1_a1d9
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a1d9 (Array String (Maybe Sorta1d2)))
(declare-const
   a1d9
   (Array
      String
      (Maybe Sorta1d2)))
(assert
   (!
      (not
         (=
            (store
               a1d9
               "bob"
               (as
                  nothing
                  (Maybe Sorta1d2)))
            a1d4))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      Sorta1d2!val!2
;      ()
;      Sorta1d2)
;   (declare-fun
;      Sorta1d2!val!1
;      ()
;      Sorta1d2)
;   (declare-fun
;      Sorta1d2!val!0
;      ()
;      Sorta1d2)
;   (forall
;      (
;        (x Sorta1d2))
;      (or
;         (= x Sorta1d2!val!2)
;         (= x Sorta1d2!val!1)
;         (= x Sorta1d2!val!0)))
;   (define-fun
;      a1d5
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store a1d4 "bob" nothing)
;         a1dm))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= a1di a1d4))
;   (define-fun
;      a1di
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      a1d9
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1d2)))
;           (just Sorta1d2!val!2))
;         "b"
;         (just Sorta1d2!val!0)))
;   (define-fun
;      a1d4
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= a1dm a1d5))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store a1d3 "bob" nothing)
;         a1di))
;   (define-fun
;      a1d3
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe Sorta1d2)))
;           (just Sorta1d2!val!1))
;         "b"
;         nothing))
;   (define-fun
;      a1dm
;      ()
;      (Array
;         String
;         (Maybe Sorta1d2))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe Sorta1d2)))
;              (just Sorta1d2!val!1))
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
;            (store a1d9 "bob" nothing)
;            a1d4))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1f3} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                          ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a1f3} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
;      [WD] hole{co_a1f3} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
; [G] co_a1fr {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_a1fk {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1fy {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1fd {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_a1fs {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1fe {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1fl {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1fz {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1e3} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1dM,a1dN,a1dP,a1dR],a1fq)
; (IntersectL [a1dM,a1dN,a1dQ,a1dR],a1fj)
; (IntersectL [a1dM,a1dN,a1dO,a1dT],a1fx)
; (IntersectL [a1dM,a1dN,a1dO,a1dP],a1fc)
; (a1fq,a1dT)
; (a1fc,a1dQ)
; (a1fj,a1dS)
; (a1fx,a1dU)

; WANTEDS (Thoralf style)
; (a1dS,a1dU)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a1e3} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1dS a1dU)

; GIVENS (names)
;  a1dO  <=  a
;  a1dP  <=  b
;  a1dQ  <=  ab
;  a1dR  <=  c
;  a1dS  <=  abc
;  a1dT  <=  bc
;  a1dU  <=  abc'
;  a1fc  <=  fsk_a1fc
;  a1fj  <=  fsk_a1fj
;  a1fq  <=  fsk_a1fq
;  a1fx  <=  fsk_a1fx
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1dN)) (y (Maybe Sorta1dN))) (=> (and ((_ is (just (Sorta1dN) (Maybe Sorta1dN))) x) ((_ is (just (Sorta1dN) (Maybe Sorta1dN))) y)) (= (both8572528581595186963 x y) x))))
; (assert (forall ((y (Maybe Sorta1dN))) (= (both8572528581595186963 nothing y) nothing)))
; (assert (forall ((y (Maybe Sorta1dN))) (= (both8572528581595186963 y (as nothing (Maybe Sorta1dN))) (as nothing (Maybe Sorta1dN)))))
; (declare-const a1dO (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1dP (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1dQ (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1dR (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1dS (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1dT (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1dU (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1fc (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1fj (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1fq (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-const a1fx (Array Sorta1dM (Maybe Sorta1dN)))
; (declare-fun both8572528581595186963 ((Maybe Sorta1dN) (Maybe Sorta1dN)) (Maybe Sorta1dN))
; (declare-sort Sorta1dM)
; (declare-sort Sorta1dN)
(declare-sort Sorta1dM)
(declare-sort Sorta1dN)
(declare-const
   a1dO
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1dP
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1dQ
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1dR
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1dS
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1dT
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1dU
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1fc
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1fj
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1fq
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-const
   a1fx
   (Array
      Sorta1dM
      (Maybe Sorta1dN)))
(declare-fun
   both8572528581595186963
   (
     (Maybe Sorta1dN)
     (Maybe Sorta1dN))
   (Maybe Sorta1dN))
(assert
   (forall
      (
        (y
           (Maybe Sorta1dN)))
      (=
         (both8572528581595186963
            y
            (as
               nothing
               (Maybe Sorta1dN)))
         (as
            nothing
            (Maybe Sorta1dN)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1dN)))
      (=
         (both8572528581595186963 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1dN))
        (y
           (Maybe Sorta1dN)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1dN)
                    (Maybe Sorta1dN)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1dN)
                    (Maybe Sorta1dN)))
              y))
         (=
            (both8572528581595186963 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8572528581595186963)
           a1dP
           a1dR)
         a1fq)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both8572528581595186963)
           a1dQ
           a1dR)
         a1fj)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both8572528581595186963)
           a1dO
           a1dT)
         a1fx)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both8572528581595186963)
           a1dO
           a1dP)
         a1fc)
      :named
      given-13.4))
(assert
   (!
      (= a1fq a1dT)
      :named
      given-13.5))
(assert
   (!
      (= a1fc a1dQ)
      :named
      given-13.6))
(assert
   (!
      (= a1fj a1dS)
      :named
      given-13.7))
(assert
   (!
      (= a1fx a1dU)
      :named
      given-13.8))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a1e3} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1dS a1dU)

; WANTEDS (names)
;  a1dS  <=  abc
;  a1dU  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1dS a1dU))
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
;           (Maybe Sorta1dN)))
;      (=
;         (both8572528581595186963
;            y
;            (as
;               nothing
;               (Maybe Sorta1dN)))
;         (as
;            nothing
;            (Maybe Sorta1dN))))
;   (forall
;      (
;        (y
;           (Maybe Sorta1dN)))
;      (=
;         (both8572528581595186963 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe Sorta1dN))
;        (y
;           (Maybe Sorta1dN)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1dN)
;                    (Maybe Sorta1dN)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (Sorta1dN)
;                    (Maybe Sorta1dN)))
;              y))
;         (=
;            (both8572528581595186963 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both8572528581595186963)
;           a1dP
;           a1dR)
;         a1fq)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map both8572528581595186963)
;           a1dQ
;           a1dR)
;         a1fj)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map both8572528581595186963)
;           a1dO
;           a1dT)
;         a1fx)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map both8572528581595186963)
;           a1dO
;           a1dP)
;         a1fc)
;      :named
;      given-13.4)
;   (!
;      (= a1fq a1dT)
;      :named
;      given-13.5)
;   (!
;      (= a1fc a1dQ)
;      :named
;      given-13.6)
;   (!
;      (= a1fj a1dS)
;      :named
;      given-13.7)
;   (!
;      (= a1fx a1dU)
;      :named
;      given-13.8)
;   (!
;      (not
;         (= a1dS a1dU))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1
;    given-13.5
;    given-13.2
;    given-13.7
;    given-13.8
;    given-13.4
;    wanted-13
;    given-13.6
;    given-13.3)
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
; [G] co_a1fT {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_a1fM {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_a1g0 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_a1fF {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_a1fU {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_a1fG {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_a1fN {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_a1g1 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1el} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1e5,a1e6,a1e8,a1ea],a1fS)
; (UnionL [a1e5,a1e6,a1e9,a1ea],a1fL)
; (UnionL [a1e5,a1e6,a1e7,a1ec],a1fZ)
; (UnionL [a1e5,a1e6,a1e7,a1e8],a1fE)
; (a1fS,a1ec)
; (a1fE,a1e9)
; (a1fL,a1eb)
; (a1fZ,a1ed)

; WANTEDS (Thoralf style)
; (a1eb,a1ed)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_a1el} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1eb a1ed)

; GIVENS (names)
;  a1e7  <=  a
;  a1e8  <=  b
;  a1e9  <=  ab
;  a1ea  <=  c
;  a1eb  <=  abc
;  a1ec  <=  bc
;  a1ed  <=  abc'
;  a1fE  <=  fsk_a1fE
;  a1fL  <=  fsk_a1fL
;  a1fS  <=  fsk_a1fS
;  a1fZ  <=  fsk_a1fZ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe Sorta1e6)) (y (Maybe Sorta1e6))) (=> ((_ is (just (Sorta1e6) (Maybe Sorta1e6))) x) (= (either8571550016246268414 x y) x))))
; (assert (forall ((y (Maybe Sorta1e6))) (= (either8571550016246268414 (as nothing (Maybe Sorta1e6)) y) y)))
; (declare-const a1e7 (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1e8 (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1e9 (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1ea (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1eb (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1ec (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1ed (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1fE (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1fL (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1fS (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-const a1fZ (Array Sorta1e5 (Maybe Sorta1e6)))
; (declare-fun either8571550016246268414 ((Maybe Sorta1e6) (Maybe Sorta1e6)) (Maybe Sorta1e6))
; (declare-sort Sorta1e5)
; (declare-sort Sorta1e6)
(declare-sort Sorta1e5)
(declare-sort Sorta1e6)
(declare-const
   a1e7
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1e8
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1e9
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1ea
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1eb
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1ec
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1ed
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1fE
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1fL
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1fS
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-const
   a1fZ
   (Array
      Sorta1e5
      (Maybe Sorta1e6)))
(declare-fun
   either8571550016246268414
   (
     (Maybe Sorta1e6)
     (Maybe Sorta1e6))
   (Maybe Sorta1e6))
(assert
   (forall
      (
        (y
           (Maybe Sorta1e6)))
      (=
         (either8571550016246268414
            (as
               nothing
               (Maybe Sorta1e6))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1e6))
        (y
           (Maybe Sorta1e6)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1e6)
                 (Maybe Sorta1e6)))
           x)
         (=
            (either8571550016246268414 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571550016246268414)
           a1e8
           a1ea)
         a1fS)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either8571550016246268414)
           a1e9
           a1ea)
         a1fL)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either8571550016246268414)
           a1e7
           a1ec)
         a1fZ)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either8571550016246268414)
           a1e7
           a1e8)
         a1fE)
      :named
      given-15.4))
(assert
   (!
      (= a1fS a1ec)
      :named
      given-15.5))
(assert
   (!
      (= a1fE a1e9)
      :named
      given-15.6))
(assert
   (!
      (= a1fL a1eb)
      :named
      given-15.7))
(assert
   (!
      (= a1fZ a1ed)
      :named
      given-15.8))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_a1el} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1eb a1ed)

; WANTEDS (names)
;  a1eb  <=  abc
;  a1ed  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1eb a1ed))
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
;           (Maybe Sorta1e6)))
;      (=
;         (either8571550016246268414
;            (as
;               nothing
;               (Maybe Sorta1e6))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe Sorta1e6))
;        (y
;           (Maybe Sorta1e6)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (Sorta1e6)
;                 (Maybe Sorta1e6)))
;           x)
;         (=
;            (either8571550016246268414 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either8571550016246268414)
;           a1e8
;           a1ea)
;         a1fS)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_ map either8571550016246268414)
;           a1e9
;           a1ea)
;         a1fL)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_ map either8571550016246268414)
;           a1e7
;           a1ec)
;         a1fZ)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_ map either8571550016246268414)
;           a1e7
;           a1e8)
;         a1fE)
;      :named
;      given-15.4)
;   (!
;      (= a1fS a1ec)
;      :named
;      given-15.5)
;   (!
;      (= a1fE a1e9)
;      :named
;      given-15.6)
;   (!
;      (= a1fL a1eb)
;      :named
;      given-15.7)
;   (!
;      (= a1fZ a1ed)
;      :named
;      given-15.8)
;   (!
;      (not
;         (= a1eb a1ed))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.2
;    given-15.8
;    given-15.3
;    given-15.1
;    wanted-15
;    given-15.7
;    given-15.6
;    given-15.4
;    given-15.5)
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
; [G] co_a1gb {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1g7 {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_a1gc {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1gf {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1ev} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1eo,"ok",2],a1ga)
; (Alter [Symbol [],Nat [],a1en,"ok",2],a1g6)
; (a1ga,a1ep)
; (a1g6,a1eo)

; WANTEDS (Thoralf style)
; (a1eo,a1ep)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a1ev} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1eo a1ep)

; GIVENS (names)
;  a1en  <=  m1
;  a1eo  <=  m2
;  a1ep  <=  m3
;  a1g6  <=  fsk_a1g6
;  a1ga  <=  fsk_a1ga
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1en (Array String (Maybe Int)))
; (declare-const a1eo (Array String (Maybe Int)))
; (declare-const a1ep (Array String (Maybe Int)))
; (declare-const a1g6 (Array String (Maybe Int)))
; (declare-const a1ga (Array String (Maybe Int)))
(declare-const
   a1en
   (Array
      String
      (Maybe Int)))
(declare-const
   a1eo
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ep
   (Array
      String
      (Maybe Int)))
(declare-const
   a1g6
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ga
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1eo
            "ok"
            (just 2))
         a1ga)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            a1en
            "ok"
            (just 2))
         a1g6)
      :named
      given-17.2))
(assert
   (!
      (= a1ga a1ep)
      :named
      given-17.3))
(assert
   (!
      (= a1g6 a1eo)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a1ev} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1eo a1ep)

; WANTEDS (names)
;  a1eo  <=  m2
;  a1ep  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1eo a1ep))
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
;            a1eo
;            "ok"
;            (just 2))
;         a1ga)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            a1en
;            "ok"
;            (just 2))
;         a1g6)
;      :named
;      given-17.2)
;   (!
;      (= a1ga a1ep)
;      :named
;      given-17.3)
;   (!
;      (= a1g6 a1eo)
;      :named
;      given-17.4)
;   (!
;      (not
;         (= a1eo a1ep))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.2 wanted-17 given-17.3 given-17.4 given-17.1)
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
; [G] co_a1gp {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1gl {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_a1gq {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_a1gt {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1eG} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1ex,a1ez,"bob"],a1go)
; (Delete [Symbol [],a1ex,a1ey,"bob"],a1gk)
; (a1go,a1eA)
; (a1gk,a1ez)

; WANTEDS (Thoralf style)
; (a1ez,a1eA)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a1eG} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ez a1eA)

; GIVENS (names)
;  a1ey  <=  m1
;  a1ez  <=  m2
;  a1eA  <=  m3
;  a1gk  <=  fsk_a1gk
;  a1go  <=  fsk_a1go
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a1eA (Array String (Maybe Sorta1ex)))
; (declare-const a1ey (Array String (Maybe Sorta1ex)))
; (declare-const a1ez (Array String (Maybe Sorta1ex)))
; (declare-const a1gk (Array String (Maybe Sorta1ex)))
; (declare-const a1go (Array String (Maybe Sorta1ex)))
; (declare-sort Sorta1ex)
(declare-sort Sorta1ex)
(declare-const
   a1ey
   (Array
      String
      (Maybe Sorta1ex)))
(declare-const
   a1ez
   (Array
      String
      (Maybe Sorta1ex)))
(declare-const
   a1eA
   (Array
      String
      (Maybe Sorta1ex)))
(declare-const
   a1gk
   (Array
      String
      (Maybe Sorta1ex)))
(declare-const
   a1go
   (Array
      String
      (Maybe Sorta1ex)))
(assert
   (!
      (=
         (store
            a1ez
            "bob"
            (as
               nothing
               (Maybe Sorta1ex)))
         a1go)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            a1ey
            "bob"
            (as
               nothing
               (Maybe Sorta1ex)))
         a1gk)
      :named
      given-19.2))
(assert
   (!
      (= a1go a1eA)
      :named
      given-19.3))
(assert
   (!
      (= a1gk a1ez)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a1eG} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ez a1eA)

; WANTEDS (names)
;  a1ez  <=  m2
;  a1eA  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1ez a1eA))
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
;            a1ez
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1ex)))
;         a1go)
;      :named
;      given-19.1)
;   (!
;      (=
;         (store
;            a1ey
;            "bob"
;            (as
;               nothing
;               (Maybe Sorta1ex)))
;         a1gk)
;      :named
;      given-19.2)
;   (!
;      (= a1go a1eA)
;      :named
;      given-19.3)
;   (!
;      (= a1gk a1ez)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= a1ez a1eA))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.2 given-19.1 given-19.4 wanted-19 given-19.3)
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
; [WD] hole{co_a3lm} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a3lh} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a3lr} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3l3,a3l4],<? [a3l6,a3l7])
; (<? [a3l5,a3l7],<? [a3l2,a3l4])
; (<? [a3l2,a3l3],<? [a3l5,a3l6])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a3lm} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3l3 a3l4)
;    (< a3l6 a3l7))

;      [WD] hole{co_a3lh} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3l5 a3l7)
;    (< a3l2 a3l4))

;      [WD] hole{co_a3lr} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3l2 a3l3)
;    (< a3l5 a3l6))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a3lm} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3l3 a3l4)
;    (< a3l6 a3l7))

;      [WD] hole{co_a3lh} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3l5 a3l7)
;    (< a3l2 a3l4))

;      [WD] hole{co_a3lr} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3l2 a3l3)
;    (< a3l5 a3l6))

; WANTEDS (names)
;  a3l2  <=  a
;  a3l3  <=  b
;  a3l4  <=  c
;  a3l5  <=  a_a3l5
;  a3l6  <=  b_a3l6
;  a3l7  <=  c_a3l7
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3l2))
; (assert (<= 0 a3l3))
; (assert (<= 0 a3l4))
; (assert (<= 0 a3l5))
; (assert (<= 0 a3l6))
; (assert (<= 0 a3l7))
; (declare-const a3l2 Int)
; (declare-const a3l3 Int)
; (declare-const a3l4 Int)
; (declare-const a3l5 Int)
; (declare-const a3l6 Int)
; (declare-const a3l7 Int)
(declare-const a3l2 Int)
(declare-const a3l3 Int)
(declare-const a3l4 Int)
(declare-const a3l5 Int)
(declare-const a3l6 Int)
(declare-const a3l7 Int)
(assert
   (<= 0 a3l2))
(assert
   (<= 0 a3l3))
(assert
   (<= 0 a3l4))
(assert
   (<= 0 a3l5))
(assert
   (<= 0 a3l6))
(assert
   (<= 0 a3l7))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3l3 a3l4)
                  (< a3l6 a3l7)))
            (not
               (=
                  (< a3l5 a3l7)
                  (< a3l2 a3l4))))
         (not
            (=
               (< a3l2 a3l3)
               (< a3l5 a3l6))))
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
;               (< a3l3 a3l4)
;               (< a3l6 a3l7)))
;         (not
;            (=
;               (< a3l5 a3l7)
;               (< a3l2 a3l4)))
;         (not
;            (=
;               (< a3l2 a3l3)
;               (< a3l5 a3l6)))))
;   (define-fun
;      a3l6
;      ()
;      Int
;      0)
;   (define-fun
;      a3l4
;      ()
;      Int
;      1)
;   (define-fun
;      a3l5
;      ()
;      Int
;      0)
;   (define-fun
;      a3l2
;      ()
;      Int
;      0)
;   (define-fun
;      a3l3
;      ()
;      Int
;      0)
;   (define-fun
;      a3l7
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3lm} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a3lh} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a3lr} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3l3,a3l4],<? [a3l6,a3l7])
; (<? [a3l5,a3l7],<? [a3l2,a3l4])
; (<? [a3l2,a3l3],<? [a3l5,a3l6])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a3lm} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3l3 a3l4)
;    (< a3l6 a3l7))

;      [WD] hole{co_a3lh} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3l5 a3l7)
;    (< a3l2 a3l4))

;      [WD] hole{co_a3lr} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3l2 a3l3)
;    (< a3l5 a3l6))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a3lm} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3l3 a3l4)
;    (< a3l6 a3l7))

;      [WD] hole{co_a3lh} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3l5 a3l7)
;    (< a3l2 a3l4))

;      [WD] hole{co_a3lr} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3l2 a3l3)
;    (< a3l5 a3l6))

; WANTEDS (names)
;  a3l2  <=  a
;  a3l3  <=  b
;  a3l4  <=  c
;  a3l5  <=  a_a3l5
;  a3l6  <=  b_a3l6
;  a3l7  <=  c_a3l7
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3l2))
; (assert (<= 0 a3l3))
; (assert (<= 0 a3l4))
; (assert (<= 0 a3l5))
; (assert (<= 0 a3l6))
; (assert (<= 0 a3l7))
; (declare-const a3l2 Int)
; (declare-const a3l3 Int)
; (declare-const a3l4 Int)
; (declare-const a3l5 Int)
; (declare-const a3l6 Int)
; (declare-const a3l7 Int)
(declare-const a3l2 Int)
(declare-const a3l3 Int)
(declare-const a3l4 Int)
(declare-const a3l5 Int)
(declare-const a3l6 Int)
(declare-const a3l7 Int)
(assert
   (<= 0 a3l2))
(assert
   (<= 0 a3l3))
(assert
   (<= 0 a3l4))
(assert
   (<= 0 a3l5))
(assert
   (<= 0 a3l6))
(assert
   (<= 0 a3l7))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a3l3 a3l4)
                  (< a3l6 a3l7)))
            (not
               (=
                  (< a3l5 a3l7)
                  (< a3l2 a3l4))))
         (not
            (=
               (< a3l2 a3l3)
               (< a3l5 a3l6))))
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
;               (< a3l3 a3l4)
;               (< a3l6 a3l7)))
;         (not
;            (=
;               (< a3l5 a3l7)
;               (< a3l2 a3l4)))
;         (not
;            (=
;               (< a3l2 a3l3)
;               (< a3l5 a3l6)))))
;   (define-fun
;      a3l6
;      ()
;      Int
;      0)
;   (define-fun
;      a3l4
;      ()
;      Int
;      1)
;   (define-fun
;      a3l5
;      ()
;      Int
;      0)
;   (define-fun
;      a3l2
;      ()
;      Int
;      0)
;   (define-fun
;      a3l3
;      ()
;      Int
;      0)
;   (define-fun
;      a3l7
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3m3} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a3m8} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3lT,a3lU],+ [a3lR,a3lS])
; (+ [a3lU,a3lT],+ [a3lS,a3lR])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a3m3} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3lT a3lU)
;    (+ a3lR a3lS))

;      [WD] hole{co_a3m8} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3lU a3lT)
;    (+ a3lS a3lR))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a3m3} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3lT a3lU)
;    (+ a3lR a3lS))

;      [WD] hole{co_a3m8} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3lU a3lT)
;    (+ a3lS a3lR))

; WANTEDS (names)
;  a3lR  <=  a
;  a3lS  <=  b
;  a3lT  <=  a_a3lT
;  a3lU  <=  b_a3lU
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3lR))
; (assert (<= 0 a3lS))
; (assert (<= 0 a3lT))
; (assert (<= 0 a3lU))
; (declare-const a3lR Int)
; (declare-const a3lS Int)
; (declare-const a3lT Int)
; (declare-const a3lU Int)
(declare-const a3lR Int)
(declare-const a3lS Int)
(declare-const a3lT Int)
(declare-const a3lU Int)
(assert
   (<= 0 a3lR))
(assert
   (<= 0 a3lS))
(assert
   (<= 0 a3lT))
(assert
   (<= 0 a3lU))
(assert
   (!
      (or
         (not
            (=
               (+ a3lT a3lU)
               (+ a3lR a3lS)))
         (not
            (=
               (+ a3lU a3lT)
               (+ a3lS a3lR))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a3lS
;      ()
;      Int
;      0)
;   (define-fun
;      a3lR
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
;               (+ a3lT a3lU)
;               (+ a3lR a3lS)))
;         (not
;            (=
;               (+ a3lU a3lT)
;               (+ a3lS a3lR)))))
;   (define-fun
;      a3lT
;      ()
;      Int
;      1)
;   (define-fun
;      a3lU
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a3m3} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a3m8} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3lT,a3lU],+ [a3lR,a3lS])
; (+ [a3lU,a3lT],+ [a3lS,a3lR])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a3m3} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3lT a3lU)
;    (+ a3lR a3lS))

;      [WD] hole{co_a3m8} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3lU a3lT)
;    (+ a3lS a3lR))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a3m3} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3lT a3lU)
;    (+ a3lR a3lS))

;      [WD] hole{co_a3m8} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3lU a3lT)
;    (+ a3lS a3lR))

; WANTEDS (names)
;  a3lR  <=  a
;  a3lS  <=  b
;  a3lT  <=  a_a3lT
;  a3lU  <=  b_a3lU
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3lR))
; (assert (<= 0 a3lS))
; (assert (<= 0 a3lT))
; (assert (<= 0 a3lU))
; (declare-const a3lR Int)
; (declare-const a3lS Int)
; (declare-const a3lT Int)
; (declare-const a3lU Int)
(declare-const a3lR Int)
(declare-const a3lS Int)
(declare-const a3lT Int)
(declare-const a3lU Int)
(assert
   (<= 0 a3lR))
(assert
   (<= 0 a3lS))
(assert
   (<= 0 a3lT))
(assert
   (<= 0 a3lU))
(assert
   (!
      (or
         (not
            (=
               (+ a3lT a3lU)
               (+ a3lR a3lS)))
         (not
            (=
               (+ a3lU a3lT)
               (+ a3lS a3lR))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a3lS
;      ()
;      Int
;      0)
;   (define-fun
;      a3lR
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
;               (+ a3lT a3lU)
;               (+ a3lR a3lS)))
;         (not
;            (=
;               (+ a3lU a3lT)
;               (+ a3lS a3lR)))))
;   (define-fun
;      a3lT
;      ()
;      Int
;      1)
;   (define-fun
;      a3lU
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
; [G] co_a3tR {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3tU {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3tS {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a3tV {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3u1} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3mI],a3tQ)
; (+ [1,a3mK],a3tT)
; (a3tQ,a3mw)
; (a3tT,a3mx)

; WANTEDS (Thoralf style)
; (- [a3mK,a3mI],- [a3mx,a3mw])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a3u1} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3mK a3mI)
;    (- a3mx a3mw))

; GIVENS (names)
;  a3mw  <=  n
;  a3mx  <=  m
;  a3mI  <=  n
;  a3mK  <=  n
;  a3tQ  <=  fsk_a3tQ
;  a3tT  <=  fsk_a3tT
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3mI))
; (assert (<= 0 a3mK))
; (assert (<= 0 a3mw))
; (assert (<= 0 a3mx))
; (assert (<= 0 a3tQ))
; (assert (<= 0 a3tT))
; (declare-const a3mI Int)
; (declare-const a3mK Int)
; (declare-const a3mw Int)
; (declare-const a3mx Int)
; (declare-const a3tQ Int)
; (declare-const a3tT Int)
(declare-const a3mw Int)
(declare-const a3mx Int)
(declare-const a3mI Int)
(declare-const a3mK Int)
(declare-const a3tQ Int)
(declare-const a3tT Int)
(assert
   (<= 0 a3mw))
(assert
   (<= 0 a3mx))
(assert
   (<= 0 a3mI))
(assert
   (<= 0 a3mK))
(assert
   (<= 0 a3tQ))
(assert
   (<= 0 a3tT))
(assert
   (!
      (=
         (+ 1 a3mI)
         a3tQ)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a3mK)
         a3tT)
      :named
      given-9.2))
(assert
   (!
      (= a3tQ a3mw)
      :named
      given-9.3))
(assert
   (!
      (= a3tT a3mx)
      :named
      given-9.4))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a3u1} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3mK a3mI)
;    (- a3mx a3mw))

; WANTEDS (names)
;  a3mw  <=  n
;  a3mx  <=  m
;  a3mI  <=  n
;  a3mK  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a3mK a3mI)
            (- a3mx a3mw)))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (<= 0 a3mw)
;   (<= 0 a3mx)
;   (<= 0 a3mI)
;   (<= 0 a3mK)
;   (<= 0 a3tQ)
;   (<= 0 a3tT)
;   (!
;      (=
;         (+ 1 a3mI)
;         a3tQ)
;      :named
;      given-9.1)
;   (!
;      (=
;         (+ 1 a3mK)
;         a3tT)
;      :named
;      given-9.2)
;   (!
;      (= a3tQ a3mw)
;      :named
;      given-9.3)
;   (!
;      (= a3tT a3mx)
;      :named
;      given-9.4)
;   (!
;      (not
;         (=
;            (- a3mK a3mI)
;            (- a3mx a3mw)))
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
; [G] co_a3uf {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3ug {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3uo} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3nE],a3ue)
; (a3ue,a3nx)

; WANTEDS (Thoralf style)
; (+ [1,+ [a3nE,a3nz]],+ [a3nx,a3nz])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a3uo} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3nE a3nz))
;    (+ a3nx a3nz))

; GIVENS (names)
;  a3nx  <=  n
;  a3nE  <=  n
;  a3ue  <=  fsk_a3ue
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3nE))
; (assert (<= 0 a3nx))
; (assert (<= 0 a3ue))
; (declare-const a3nE Int)
; (declare-const a3nx Int)
; (declare-const a3ue Int)
(declare-const a3nx Int)
(declare-const a3nE Int)
(declare-const a3ue Int)
(assert
   (<= 0 a3nx))
(assert
   (<= 0 a3nE))
(assert
   (<= 0 a3ue))
(assert
   (!
      (=
         (+ 1 a3nE)
         a3ue)
      :named
      given-16.1))
(assert
   (!
      (= a3ue a3nx)
      :named
      given-16.2))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a3uo} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3nE a3nz))
;    (+ a3nx a3nz))

; WANTEDS (names)
;  a3nx  <=  n
;  a3nz  <=  m
;  a3nE  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3nz))
; (declare-const a3nz Int)
(declare-const a3nz Int)
(assert
   (<= 0 a3nz))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a3nE a3nz))
            (+ a3nx a3nz)))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
(get-assertions)
; (
;   (<= 0 a3nx)
;   (<= 0 a3nE)
;   (<= 0 a3ue)
;   (!
;      (=
;         (+ 1 a3nE)
;         a3ue)
;      :named
;      given-16.1)
;   (!
;      (= a3ue a3nx)
;      :named
;      given-16.2)
;   (<= 0 a3nz)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a3nE a3nz))
;            (+ a3nx a3nz)))
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
; [G] co_a3uq {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a3ut {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a3ur {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a3uu {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3uy} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3rP,a3rQ],a3up)
; (<? [a3rQ,a3rR],a3us)
; (a3up,True [])
; (a3us,True [])

; WANTEDS (Thoralf style)
; (<? [a3rP,a3rR],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a3uy} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3rP a3rR)
;    true)

; GIVENS (names)
;  a3rP  <=  a
;  a3rQ  <=  b
;  a3rR  <=  c
;  a3up  <=  fsk_a3up
;  a3us  <=  fsk_a3us
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3rP))
; (assert (<= 0 a3rQ))
; (assert (<= 0 a3rR))
; (declare-const a3rP Int)
; (declare-const a3rQ Int)
; (declare-const a3rR Int)
; (declare-const a3up Bool)
; (declare-const a3us Bool)
(declare-const a3rP Int)
(declare-const a3rQ Int)
(declare-const a3rR Int)
(declare-const a3up Bool)
(declare-const a3us Bool)
(assert
   (<= 0 a3rP))
(assert
   (<= 0 a3rQ))
(assert
   (<= 0 a3rR))
(assert
   (!
      (=
         (< a3rP a3rQ)
         a3up)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3rQ a3rR)
         a3us)
      :named
      given-19.2))
(assert
   (!
      (= a3up true)
      :named
      given-19.3))
(assert
   (!
      (= a3us true)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a3uy} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3rP a3rR)
;    true)

; WANTEDS (names)
;  a3rP  <=  a
;  a3rR  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a3rP a3rR)
            true))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (<= 0 a3rP)
;   (<= 0 a3rQ)
;   (<= 0 a3rR)
;   (!
;      (=
;         (< a3rP a3rQ)
;         a3up)
;      :named
;      given-19.1)
;   (!
;      (=
;         (< a3rQ a3rR)
;         a3us)
;      :named
;      given-19.2)
;   (!
;      (= a3up true)
;      :named
;      given-19.3)
;   (!
;      (= a3us true)
;      :named
;      given-19.4)
;   (!
;      (not
;         (=
;            (< a3rP a3rR)
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
; [G] co_a3uC {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a3uA {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a3s4 {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3s7} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3s1,a3s2],a3uB)
; (+ [a3s1,a3s1],a3uz)
; (a3uz,a3uB)

; WANTEDS (Thoralf style)
; (a3s1,a3s2)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{co_a3s7} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3s1 a3s2)

; GIVENS (names)
;  a3s1  <=  a
;  a3s2  <=  b
;  a3uz  <=  fsk_a3uz
;  a3uB  <=  fsk_a3uB
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3s1))
; (assert (<= 0 a3s2))
; (assert (<= 0 a3uB))
; (assert (<= 0 a3uz))
; (declare-const a3s1 Int)
; (declare-const a3s2 Int)
; (declare-const a3uB Int)
; (declare-const a3uz Int)
(declare-const a3s1 Int)
(declare-const a3s2 Int)
(declare-const a3uz Int)
(declare-const a3uB Int)
(assert
   (<= 0 a3s1))
(assert
   (<= 0 a3s2))
(assert
   (<= 0 a3uz))
(assert
   (<= 0 a3uB))
(assert
   (!
      (=
         (+ a3s1 a3s2)
         a3uB)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3s1 a3s1)
         a3uz)
      :named
      given-21.2))
(assert
   (!
      (= a3uz a3uB)
      :named
      given-21.3))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{co_a3s7} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3s1 a3s2)

; WANTEDS (names)
;  a3s1  <=  a
;  a3s2  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a3s1 a3s2))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (<= 0 a3s1)
;   (<= 0 a3s2)
;   (<= 0 a3uz)
;   (<= 0 a3uB)
;   (!
;      (=
;         (+ a3s1 a3s2)
;         a3uB)
;      :named
;      given-21.1)
;   (!
;      (=
;         (+ a3s1 a3s1)
;         a3uz)
;      :named
;      given-21.2)
;   (!
;      (= a3uz a3uB)
;      :named
;      given-21.3)
;   (!
;      (not
;         (= a3s1 a3s2))
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
; [WD] hole{co_a3uG} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3sa,a3sb],+ [a3sb,a3sa])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a3uG} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3sa a3sb)
;    (+ a3sb a3sa))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a3uG} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3sa a3sb)
;    (+ a3sb a3sa))

; WANTEDS (names)
;  a3sa  <=  a
;  a3sb  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3sa))
; (assert (<= 0 a3sb))
; (declare-const a3sa Int)
; (declare-const a3sb Int)
(declare-const a3sa Int)
(declare-const a3sb Int)
(assert
   (<= 0 a3sa))
(assert
   (<= 0 a3sb))
(assert
   (!
      (not
         (=
            (+ a3sa a3sb)
            (+ a3sb a3sa)))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a3sa)
;   (<= 0 a3sb)
;   (!
;      (not
;         (=
;            (+ a3sa a3sb)
;            (+ a3sb a3sa)))
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
; [WD] hole{co_a3uO} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3si,1],+ [1,a3si])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a3uO} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3si 1)
;    (+ 1 a3si))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a3uO} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3si 1)
;    (+ 1 a3si))

; WANTEDS (names)
;  a3si  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3si))
; (declare-const a3si Int)
(declare-const a3si Int)
(assert
   (<= 0 a3si))
(assert
   (!
      (not
         (=
            (+ a3si 1)
            (+ 1 a3si)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a3si)
;   (!
;      (not
;         (=
;            (+ a3si 1)
;            (+ 1 a3si)))
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
; [WD] hole{co_a5oe} {2}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a5nZ} {2}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a5oe} {2}:: Alter
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

;      [WD] hole{co_a5nZ} {2}:: Alter
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
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_a5oe} {2}:: Alter
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

;      [WD] hole{co_a5nZ} {2}:: Alter
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
; [G] co_a5p3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5pa {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] co_a5p4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5pb {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5pi} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lG,"price",Int []],a5p2)
; (Delete [Symbol [],TYPE [LiftedRep []],a5lJ,a5lK],a5p9)
; (a5p2,a5lG)
; (a5p9,a5lG)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lJ,"price",Int []],a5lJ)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a5pi} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5lJ
;       "price"
;       (just
;          (lit "3u")))
;    a5lJ)

; GIVENS (names)
;  a5lG  <=  m
;  a5lJ  <=  m
;  a5lK  <=  field
;  a5p2  <=  fsk_a5p2
;  a5p9  <=  fsk_a5p9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a5lG (Array String (Maybe Type)))
; (declare-const a5lJ (Array String (Maybe Type)))
; (declare-const a5lK String)
; (declare-const a5p2 (Array String (Maybe Type)))
; (declare-const a5p9 (Array String (Maybe Type)))
(declare-const
   a5lG
   (Array
      String
      (Maybe Type)))
(declare-const
   a5lJ
   (Array
      String
      (Maybe Type)))
(declare-const a5lK String)
(declare-const
   a5p2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5p9
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5lG
            "price"
            (just
               (lit "3u")))
         a5p2)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a5lJ
            a5lK
            (as
               nothing
               (Maybe Type)))
         a5p9)
      :named
      given-8.2))
(assert
   (!
      (= a5p2 a5lG)
      :named
      given-8.3))
(assert
   (!
      (= a5p9 a5lG)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a5pi} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5lJ
;       "price"
;       (just
;          (lit "3u")))
;    a5lJ)

; WANTEDS (names)
;  a5lJ  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5lJ
               "price"
               (just
                  (lit "3u")))
            a5lJ))
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
;            a5lG
;            "price"
;            (just
;               (lit "3u")))
;         a5p2)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a5lJ
;            a5lK
;            (as
;               nothing
;               (Maybe Type)))
;         a5p9)
;      :named
;      given-8.2)
;   (!
;      (= a5p2 a5lG)
;      :named
;      given-8.3)
;   (!
;      (= a5p9 a5lG)
;      :named
;      given-8.4)
;   (!
;      (not
;         (=
;            (store
;               a5lJ
;               "price"
;               (just
;                  (lit "3u")))
;            a5lJ))
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
; [G] co_a5p3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5pr {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] co_a5pn {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5p4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5pq {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5md} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lG,"price",Int []],a5p2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lQ,"price",a5lS],a5pl)
; (a5pl,a5lG)
; (a5p2,a5lG)
; (a5lR,"price")

; WANTEDS (Thoralf style)
; (a5lS,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a5md} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5lS
;    (lit "3u"))

; GIVENS (names)
;  a5lG  <=  m
;  a5lQ  <=  m
;  a5lR  <=  field
;  a5lS  <=  val
;  a5p2  <=  fsk_a5p2
;  a5pl  <=  fsk_a5pl
(push 1)
; DECS1 (seen) 
; (declare-const a5lG (Array String (Maybe Type)))
; (declare-const a5p2 (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a5lQ (Array String (Maybe Type)))
; (declare-const a5lR String)
; (declare-const a5lS Type)
; (declare-const a5pl (Array String (Maybe Type)))
(declare-const
   a5lG
   (Array
      String
      (Maybe Type)))
(declare-const
   a5lQ
   (Array
      String
      (Maybe Type)))
(declare-const a5lR String)
(declare-const a5lS Type)
(declare-const
   a5p2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5pl
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5lG
            "price"
            (just
               (lit "3u")))
         a5p2)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a5lQ
            "price"
            (just a5lS))
         a5pl)
      :named
      given-11.2))
(assert
   (!
      (= a5pl a5lG)
      :named
      given-11.3))
(assert
   (!
      (= a5p2 a5lG)
      :named
      given-11.4))
(assert
   (!
      (= a5lR "price")
      :named
      given-11.5))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a5md} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5lS
;    (lit "3u"))

; WANTEDS (names)
;  a5lS  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a5lS
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
;            a5lG
;            "price"
;            (just
;               (lit "3u")))
;         a5p2)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a5lQ
;            "price"
;            (just a5lS))
;         a5pl)
;      :named
;      given-11.2)
;   (!
;      (= a5pl a5lG)
;      :named
;      given-11.3)
;   (!
;      (= a5p2 a5lG)
;      :named
;      given-11.4)
;   (!
;      (= a5lR "price")
;      :named
;      given-11.5)
;   (!
;      (not
;         (=
;            a5lS
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
; [G] $dDisEquality_a5mf {0}:: DisEquality field "price" (CDictCan)
; [G] co_a5p3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a5pm {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] co_a5p4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a5pn {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a5pw} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5mf {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lG,"price",Int []],a5p2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lQ,a5lR,a5lS],a5pl)
; (a5p2,a5lG)
; (a5pl,a5lG)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lQ,"price",Int []],a5lQ)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a5pw} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5lQ
;       "price"
;       (just
;          (lit "3u")))
;    a5lQ)

; GIVENS (names)
;  a5lG  <=  m
;  a5lQ  <=  m
;  a5lR  <=  field
;  a5lS  <=  val
;  a5p2  <=  fsk_a5p2
;  a5pl  <=  fsk_a5pl
(push 1)
; DECS1 (seen) 
; (declare-const a5lG (Array String (Maybe Type)))
; (declare-const a5lQ (Array String (Maybe Type)))
; (declare-const a5lR String)
; (declare-const a5lS Type)
; (declare-const a5p2 (Array String (Maybe Type)))
; (declare-const a5pl (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a5lG
   (Array
      String
      (Maybe Type)))
(declare-const
   a5lQ
   (Array
      String
      (Maybe Type)))
(declare-const a5lR String)
(declare-const a5lS Type)
(declare-const
   a5p2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5pl
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5lR "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a5lG
            "price"
            (just
               (lit "3u")))
         a5p2)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a5lQ
            a5lR
            (just a5lS))
         a5pl)
      :named
      given-13.3))
(assert
   (!
      (= a5p2 a5lG)
      :named
      given-13.4))
(assert
   (!
      (= a5pl a5lG)
      :named
      given-13.5))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a5pw} {2}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5lQ
;       "price"
;       (just
;          (lit "3u")))
;    a5lQ)

; WANTEDS (names)
;  a5lQ  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a5lQ
               "price"
               (just
                  (lit "3u")))
            a5lQ))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a5lR "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a5lG
;            "price"
;            (just
;               (lit "3u")))
;         a5p2)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a5lQ
;            a5lR
;            (just a5lS))
;         a5pl)
;      :named
;      given-13.3)
;   (!
;      (= a5p2 a5lG)
;      :named
;      given-13.4)
;   (!
;      (= a5pl a5lG)
;      :named
;      given-13.5)
;   (!
;      (not
;         (=
;            (store
;               a5lQ
;               "price"
;               (just
;                  (lit "3u")))
;            a5lQ))
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
; [WD] hole{co_a2Ye} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a2Y9} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a2Yj} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2XV,a2XW],<? [a2XY,a2XZ])
; (<? [a2XX,a2XZ],<? [a2XU,a2XW])
; (<? [a2XU,a2XV],<? [a2XX,a2XY])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a2Ye} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2XV a2XW)
;    (< a2XY a2XZ))

;      [WD] hole{co_a2Y9} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2XX a2XZ)
;    (< a2XU a2XW))

;      [WD] hole{co_a2Yj} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2XU a2XV)
;    (< a2XX a2XY))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a2Ye} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2XV a2XW)
;    (< a2XY a2XZ))

;      [WD] hole{co_a2Y9} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2XX a2XZ)
;    (< a2XU a2XW))

;      [WD] hole{co_a2Yj} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2XU a2XV)
;    (< a2XX a2XY))

; WANTEDS (names)
;  a2XU  <=  a
;  a2XV  <=  b
;  a2XW  <=  c
;  a2XX  <=  a_a2XX
;  a2XY  <=  b_a2XY
;  a2XZ  <=  c_a2XZ
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2XU))
; (assert (<= 0 a2XV))
; (assert (<= 0 a2XW))
; (assert (<= 0 a2XX))
; (assert (<= 0 a2XY))
; (assert (<= 0 a2XZ))
; (declare-const a2XU Int)
; (declare-const a2XV Int)
; (declare-const a2XW Int)
; (declare-const a2XX Int)
; (declare-const a2XY Int)
; (declare-const a2XZ Int)
(declare-const a2XU Int)
(declare-const a2XV Int)
(declare-const a2XW Int)
(declare-const a2XX Int)
(declare-const a2XY Int)
(declare-const a2XZ Int)
(assert
   (<= 0 a2XU))
(assert
   (<= 0 a2XV))
(assert
   (<= 0 a2XW))
(assert
   (<= 0 a2XX))
(assert
   (<= 0 a2XY))
(assert
   (<= 0 a2XZ))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a2XV a2XW)
                  (< a2XY a2XZ)))
            (not
               (=
                  (< a2XX a2XZ)
                  (< a2XU a2XW))))
         (not
            (=
               (< a2XU a2XV)
               (< a2XX a2XY))))
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
;               (< a2XV a2XW)
;               (< a2XY a2XZ)))
;         (not
;            (=
;               (< a2XX a2XZ)
;               (< a2XU a2XW)))
;         (not
;            (=
;               (< a2XU a2XV)
;               (< a2XX a2XY)))))
;   (define-fun
;      a2XW
;      ()
;      Int
;      1)
;   (define-fun
;      a2XZ
;      ()
;      Int
;      0)
;   (define-fun
;      a2XY
;      ()
;      Int
;      0)
;   (define-fun
;      a2XV
;      ()
;      Int
;      0)
;   (define-fun
;      a2XU
;      ()
;      Int
;      0)
;   (define-fun
;      a2XX
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a2Ye} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a2Y9} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a2Yj} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2XV,a2XW],<? [a2XY,a2XZ])
; (<? [a2XX,a2XZ],<? [a2XU,a2XW])
; (<? [a2XU,a2XV],<? [a2XX,a2XY])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a2Ye} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2XV a2XW)
;    (< a2XY a2XZ))

;      [WD] hole{co_a2Y9} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2XX a2XZ)
;    (< a2XU a2XW))

;      [WD] hole{co_a2Yj} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2XU a2XV)
;    (< a2XX a2XY))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a2Ye} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2XV a2XW)
;    (< a2XY a2XZ))

;      [WD] hole{co_a2Y9} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2XX a2XZ)
;    (< a2XU a2XW))

;      [WD] hole{co_a2Yj} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2XU a2XV)
;    (< a2XX a2XY))

; WANTEDS (names)
;  a2XU  <=  a
;  a2XV  <=  b
;  a2XW  <=  c
;  a2XX  <=  a_a2XX
;  a2XY  <=  b_a2XY
;  a2XZ  <=  c_a2XZ
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2XU))
; (assert (<= 0 a2XV))
; (assert (<= 0 a2XW))
; (assert (<= 0 a2XX))
; (assert (<= 0 a2XY))
; (assert (<= 0 a2XZ))
; (declare-const a2XU Int)
; (declare-const a2XV Int)
; (declare-const a2XW Int)
; (declare-const a2XX Int)
; (declare-const a2XY Int)
; (declare-const a2XZ Int)
(declare-const a2XU Int)
(declare-const a2XV Int)
(declare-const a2XW Int)
(declare-const a2XX Int)
(declare-const a2XY Int)
(declare-const a2XZ Int)
(assert
   (<= 0 a2XU))
(assert
   (<= 0 a2XV))
(assert
   (<= 0 a2XW))
(assert
   (<= 0 a2XX))
(assert
   (<= 0 a2XY))
(assert
   (<= 0 a2XZ))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a2XV a2XW)
                  (< a2XY a2XZ)))
            (not
               (=
                  (< a2XX a2XZ)
                  (< a2XU a2XW))))
         (not
            (=
               (< a2XU a2XV)
               (< a2XX a2XY))))
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
;               (< a2XV a2XW)
;               (< a2XY a2XZ)))
;         (not
;            (=
;               (< a2XX a2XZ)
;               (< a2XU a2XW)))
;         (not
;            (=
;               (< a2XU a2XV)
;               (< a2XX a2XY)))))
;   (define-fun
;      a2XW
;      ()
;      Int
;      1)
;   (define-fun
;      a2XZ
;      ()
;      Int
;      0)
;   (define-fun
;      a2XY
;      ()
;      Int
;      0)
;   (define-fun
;      a2XV
;      ()
;      Int
;      0)
;   (define-fun
;      a2XU
;      ()
;      Int
;      0)
;   (define-fun
;      a2XX
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a2YV} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a2Z0} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2YL,a2YM],+ [a2YJ,a2YK])
; (+ [a2YM,a2YL],+ [a2YK,a2YJ])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a2YV} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2YL a2YM)
;    (+ a2YJ a2YK))

;      [WD] hole{co_a2Z0} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2YM a2YL)
;    (+ a2YK a2YJ))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a2YV} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2YL a2YM)
;    (+ a2YJ a2YK))

;      [WD] hole{co_a2Z0} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2YM a2YL)
;    (+ a2YK a2YJ))

; WANTEDS (names)
;  a2YJ  <=  a
;  a2YK  <=  b
;  a2YL  <=  a_a2YL
;  a2YM  <=  b_a2YM
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2YJ))
; (assert (<= 0 a2YK))
; (assert (<= 0 a2YL))
; (assert (<= 0 a2YM))
; (declare-const a2YJ Int)
; (declare-const a2YK Int)
; (declare-const a2YL Int)
; (declare-const a2YM Int)
(declare-const a2YJ Int)
(declare-const a2YK Int)
(declare-const a2YL Int)
(declare-const a2YM Int)
(assert
   (<= 0 a2YJ))
(assert
   (<= 0 a2YK))
(assert
   (<= 0 a2YL))
(assert
   (<= 0 a2YM))
(assert
   (!
      (or
         (not
            (=
               (+ a2YL a2YM)
               (+ a2YJ a2YK)))
         (not
            (=
               (+ a2YM a2YL)
               (+ a2YK a2YJ))))
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
;         (not
;            (=
;               (+ a2YL a2YM)
;               (+ a2YJ a2YK)))
;         (not
;            (=
;               (+ a2YM a2YL)
;               (+ a2YK a2YJ)))))
;   (define-fun
;      a2YJ
;      ()
;      Int
;      0)
;   (define-fun
;      a2YK
;      ()
;      Int
;      0)
;   (define-fun
;      a2YL
;      ()
;      Int
;      1)
;   (define-fun
;      a2YM
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a2YV} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a2Z0} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2YL,a2YM],+ [a2YJ,a2YK])
; (+ [a2YM,a2YL],+ [a2YK,a2YJ])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a2YV} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2YL a2YM)
;    (+ a2YJ a2YK))

;      [WD] hole{co_a2Z0} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2YM a2YL)
;    (+ a2YK a2YJ))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a2YV} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2YL a2YM)
;    (+ a2YJ a2YK))

;      [WD] hole{co_a2Z0} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2YM a2YL)
;    (+ a2YK a2YJ))

; WANTEDS (names)
;  a2YJ  <=  a
;  a2YK  <=  b
;  a2YL  <=  a_a2YL
;  a2YM  <=  b_a2YM
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2YJ))
; (assert (<= 0 a2YK))
; (assert (<= 0 a2YL))
; (assert (<= 0 a2YM))
; (declare-const a2YJ Int)
; (declare-const a2YK Int)
; (declare-const a2YL Int)
; (declare-const a2YM Int)
(declare-const a2YJ Int)
(declare-const a2YK Int)
(declare-const a2YL Int)
(declare-const a2YM Int)
(assert
   (<= 0 a2YJ))
(assert
   (<= 0 a2YK))
(assert
   (<= 0 a2YL))
(assert
   (<= 0 a2YM))
(assert
   (!
      (or
         (not
            (=
               (+ a2YL a2YM)
               (+ a2YJ a2YK)))
         (not
            (=
               (+ a2YM a2YL)
               (+ a2YK a2YJ))))
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
;         (not
;            (=
;               (+ a2YL a2YM)
;               (+ a2YJ a2YK)))
;         (not
;            (=
;               (+ a2YM a2YL)
;               (+ a2YK a2YJ)))))
;   (define-fun
;      a2YJ
;      ()
;      Int
;      0)
;   (define-fun
;      a2YK
;      ()
;      Int
;      0)
;   (define-fun
;      a2YL
;      ()
;      Int
;      1)
;   (define-fun
;      a2YM
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
; [G] co_a3hd {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3hg {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3he {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a3hh {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3hn} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2ZA],a3hc)
; (+ [1,a2ZC],a3hf)
; (a3hc,a2Zo)
; (a3hf,a2Zp)

; WANTEDS (Thoralf style)
; (- [a2ZC,a2ZA],- [a2Zp,a2Zo])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a3hn} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a2ZC a2ZA)
;    (- a2Zp a2Zo))

; GIVENS (names)
;  a2Zo  <=  n
;  a2Zp  <=  m
;  a2ZA  <=  n
;  a2ZC  <=  n
;  a3hc  <=  fsk_a3hc
;  a3hf  <=  fsk_a3hf
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2ZA))
; (assert (<= 0 a2ZC))
; (assert (<= 0 a2Zo))
; (assert (<= 0 a2Zp))
; (assert (<= 0 a3hc))
; (assert (<= 0 a3hf))
; (declare-const a2ZA Int)
; (declare-const a2ZC Int)
; (declare-const a2Zo Int)
; (declare-const a2Zp Int)
; (declare-const a3hc Int)
; (declare-const a3hf Int)
(declare-const a2Zo Int)
(declare-const a2Zp Int)
(declare-const a2ZA Int)
(declare-const a2ZC Int)
(declare-const a3hc Int)
(declare-const a3hf Int)
(assert
   (<= 0 a2Zo))
(assert
   (<= 0 a2Zp))
(assert
   (<= 0 a2ZA))
(assert
   (<= 0 a2ZC))
(assert
   (<= 0 a3hc))
(assert
   (<= 0 a3hf))
(assert
   (!
      (=
         (+ 1 a2ZA)
         a3hc)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2ZC)
         a3hf)
      :named
      given-9.2))
(assert
   (!
      (= a3hc a2Zo)
      :named
      given-9.3))
(assert
   (!
      (= a3hf a2Zp)
      :named
      given-9.4))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a3hn} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a2ZC a2ZA)
;    (- a2Zp a2Zo))

; WANTEDS (names)
;  a2Zo  <=  n
;  a2Zp  <=  m
;  a2ZA  <=  n
;  a2ZC  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a2ZC a2ZA)
            (- a2Zp a2Zo)))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (<= 0 a2Zo)
;   (<= 0 a2Zp)
;   (<= 0 a2ZA)
;   (<= 0 a2ZC)
;   (<= 0 a3hc)
;   (<= 0 a3hf)
;   (!
;      (=
;         (+ 1 a2ZA)
;         a3hc)
;      :named
;      given-9.1)
;   (!
;      (=
;         (+ 1 a2ZC)
;         a3hf)
;      :named
;      given-9.2)
;   (!
;      (= a3hc a2Zo)
;      :named
;      given-9.3)
;   (!
;      (= a3hf a2Zp)
;      :named
;      given-9.4)
;   (!
;      (not
;         (=
;            (- a2ZC a2ZA)
;            (- a2Zp a2Zo)))
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
; [G] co_a3hG {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a3hH {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3hP} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a30w],a3hF)
; (a3hF,a30p)

; WANTEDS (Thoralf style)
; (+ [1,+ [a30w,a30r]],+ [a30p,a30r])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a3hP} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a30w a30r))
;    (+ a30p a30r))

; GIVENS (names)
;  a30p  <=  n
;  a30w  <=  n
;  a3hF  <=  fsk_a3hF
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a30p))
; (assert (<= 0 a30w))
; (assert (<= 0 a3hF))
; (declare-const a30p Int)
; (declare-const a30w Int)
; (declare-const a3hF Int)
(declare-const a30p Int)
(declare-const a30w Int)
(declare-const a3hF Int)
(assert
   (<= 0 a30p))
(assert
   (<= 0 a30w))
(assert
   (<= 0 a3hF))
(assert
   (!
      (=
         (+ 1 a30w)
         a3hF)
      :named
      given-16.1))
(assert
   (!
      (= a3hF a30p)
      :named
      given-16.2))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a3hP} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a30w a30r))
;    (+ a30p a30r))

; WANTEDS (names)
;  a30p  <=  n
;  a30r  <=  m
;  a30w  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a30r))
; (declare-const a30r Int)
(declare-const a30r Int)
(assert
   (<= 0 a30r))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a30w a30r))
            (+ a30p a30r)))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
(get-assertions)
; (
;   (<= 0 a30p)
;   (<= 0 a30w)
;   (<= 0 a3hF)
;   (!
;      (=
;         (+ 1 a30w)
;         a3hF)
;      :named
;      given-16.1)
;   (!
;      (= a3hF a30p)
;      :named
;      given-16.2)
;   (<= 0 a30r)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a30w a30r))
;            (+ a30p a30r)))
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
; [G] co_a3hR {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a3hU {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a3hS {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a3hV {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3hZ} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3fa,a3fb],a3hQ)
; (<? [a3fb,a3fc],a3hT)
; (a3hQ,True [])
; (a3hT,True [])

; WANTEDS (Thoralf style)
; (<? [a3fa,a3fc],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a3hZ} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3fa a3fc)
;    true)

; GIVENS (names)
;  a3fa  <=  a
;  a3fb  <=  b
;  a3fc  <=  c
;  a3hQ  <=  fsk_a3hQ
;  a3hT  <=  fsk_a3hT
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3fa))
; (assert (<= 0 a3fb))
; (assert (<= 0 a3fc))
; (declare-const a3fa Int)
; (declare-const a3fb Int)
; (declare-const a3fc Int)
; (declare-const a3hQ Bool)
; (declare-const a3hT Bool)
(declare-const a3fa Int)
(declare-const a3fb Int)
(declare-const a3fc Int)
(declare-const a3hQ Bool)
(declare-const a3hT Bool)
(assert
   (<= 0 a3fa))
(assert
   (<= 0 a3fb))
(assert
   (<= 0 a3fc))
(assert
   (!
      (=
         (< a3fa a3fb)
         a3hQ)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3fb a3fc)
         a3hT)
      :named
      given-19.2))
(assert
   (!
      (= a3hQ true)
      :named
      given-19.3))
(assert
   (!
      (= a3hT true)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a3hZ} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3fa a3fc)
;    true)

; WANTEDS (names)
;  a3fa  <=  a
;  a3fc  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a3fa a3fc)
            true))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (<= 0 a3fa)
;   (<= 0 a3fb)
;   (<= 0 a3fc)
;   (!
;      (=
;         (< a3fa a3fb)
;         a3hQ)
;      :named
;      given-19.1)
;   (!
;      (=
;         (< a3fb a3fc)
;         a3hT)
;      :named
;      given-19.2)
;   (!
;      (= a3hQ true)
;      :named
;      given-19.3)
;   (!
;      (= a3hT true)
;      :named
;      given-19.4)
;   (!
;      (not
;         (=
;            (< a3fa a3fc)
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
; [G] co_a3i3 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a3i1 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a3fq {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3ft} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3fn,a3fo],a3i2)
; (+ [a3fn,a3fn],a3i0)
; (a3i0,a3i2)

; WANTEDS (Thoralf style)
; (a3fn,a3fo)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{co_a3ft} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3fn a3fo)

; GIVENS (names)
;  a3fn  <=  a
;  a3fo  <=  b
;  a3i0  <=  fsk_a3i0
;  a3i2  <=  fsk_a3i2
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a3fn))
; (assert (<= 0 a3fo))
; (assert (<= 0 a3i0))
; (assert (<= 0 a3i2))
; (declare-const a3fn Int)
; (declare-const a3fo Int)
; (declare-const a3i0 Int)
; (declare-const a3i2 Int)
(declare-const a3fn Int)
(declare-const a3fo Int)
(declare-const a3i0 Int)
(declare-const a3i2 Int)
(assert
   (<= 0 a3fn))
(assert
   (<= 0 a3fo))
(assert
   (<= 0 a3i0))
(assert
   (<= 0 a3i2))
(assert
   (!
      (=
         (+ a3fn a3fo)
         a3i2)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3fn a3fn)
         a3i0)
      :named
      given-21.2))
(assert
   (!
      (= a3i0 a3i2)
      :named
      given-21.3))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{co_a3ft} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3fn a3fo)

; WANTEDS (names)
;  a3fn  <=  a
;  a3fo  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a3fn a3fo))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (<= 0 a3fn)
;   (<= 0 a3fo)
;   (<= 0 a3i0)
;   (<= 0 a3i2)
;   (!
;      (=
;         (+ a3fn a3fo)
;         a3i2)
;      :named
;      given-21.1)
;   (!
;      (=
;         (+ a3fn a3fn)
;         a3i0)
;      :named
;      given-21.2)
;   (!
;      (= a3i0 a3i2)
;      :named
;      given-21.3)
;   (!
;      (not
;         (= a3fn a3fo))
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
; [WD] hole{co_a3i7} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3fw,a3fx],+ [a3fx,a3fw])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a3i7} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3fw a3fx)
;    (+ a3fx a3fw))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a3i7} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3fw a3fx)
;    (+ a3fx a3fw))

; WANTEDS (names)
;  a3fw  <=  a
;  a3fx  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3fw))
; (assert (<= 0 a3fx))
; (declare-const a3fw Int)
; (declare-const a3fx Int)
(declare-const a3fw Int)
(declare-const a3fx Int)
(assert
   (<= 0 a3fw))
(assert
   (<= 0 a3fx))
(assert
   (!
      (not
         (=
            (+ a3fw a3fx)
            (+ a3fx a3fw)))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a3fw)
;   (<= 0 a3fx)
;   (!
;      (not
;         (=
;            (+ a3fw a3fx)
;            (+ a3fx a3fw)))
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
; [WD] hole{co_a3if} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3fE,1],+ [1,a3fE])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a3if} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3fE 1)
;    (+ 1 a3fE))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a3if} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3fE 1)
;    (+ 1 a3fE))

; WANTEDS (names)
;  a3fE  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a3fE))
; (declare-const a3fE Int)
(declare-const a3fE Int)
(assert
   (<= 0 a3fE))
(assert
   (!
      (not
         (=
            (+ a3fE 1)
            (+ 1 a3fE)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a3fE)
;   (!
;      (not
;         (=
;            (+ a3fE 1)
;            (+ 1 a3fE)))
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
