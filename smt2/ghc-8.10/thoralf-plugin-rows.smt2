; Build profile: -w ghc-8.10.7 -O1
; [1 of 4] Compiling FiniteMaps
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
; [G] co_aFa {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aF5 {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFf {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aF0 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aFb {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aF1 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aF6 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFg {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFr} {2}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aFB} {2}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aEw,aEx,aEz,aEB],aF9)
; (IntersectL [aEw,aEx,aEA,aEB],aF4)
; (IntersectL [aEw,aEx,aEy,aED],aFe)
; (IntersectL [aEw,aEx,aEy,aEz],aEZ)
; (aF9,aED)
; (aEZ,aEA)
; (aF4,aEC)
; (aFe,aEE)

; WANTEDS (Thoralf style)
; (IntersectL [aEw,aEx,IntersectL [aEw,aEx,aEL,aEM],aEO],aEC)
; (IntersectL [aEw,aEx,aEL,IntersectL [aEw,aEx,aEM,aEO]],aEE)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aFr} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFB} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; GIVENS (names)
;  aEy  <=  a
;  aEz  <=  b
;  aEA  <=  ab
;  aEB  <=  c
;  aEC  <=  abc
;  aED  <=  bc
;  aEE  <=  abc'
;  aEZ  <=  fsk_aEZ
;  aF4  <=  fsk_aF4
;  aF9  <=  fsk_aF9
;  aFe  <=  fsk_aFe
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaEx)) (y (Maybe SortaEx))) (=> (and ((_ is (just (SortaEx) (Maybe SortaEx))) x) ((_ is (just (SortaEx) (Maybe SortaEx))) y)) (= (both1943117632352165408 x y) x))))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 y (as nothing (Maybe SortaEx))) (as nothing (Maybe SortaEx)))))
; (declare-const aEA (Array SortaEw (Maybe SortaEx)))
; (declare-const aEB (Array SortaEw (Maybe SortaEx)))
; (declare-const aEC (Array SortaEw (Maybe SortaEx)))
; (declare-const aED (Array SortaEw (Maybe SortaEx)))
; (declare-const aEE (Array SortaEw (Maybe SortaEx)))
; (declare-const aEZ (Array SortaEw (Maybe SortaEx)))
; (declare-const aEy (Array SortaEw (Maybe SortaEx)))
; (declare-const aEz (Array SortaEw (Maybe SortaEx)))
; (declare-const aF4 (Array SortaEw (Maybe SortaEx)))
; (declare-const aF9 (Array SortaEw (Maybe SortaEx)))
; (declare-const aFe (Array SortaEw (Maybe SortaEx)))
; (declare-fun both1943117632352165408 ((Maybe SortaEx) (Maybe SortaEx)) (Maybe SortaEx))
; (declare-sort SortaEw)
; (declare-sort SortaEx)
(declare-sort SortaEw)
(declare-sort SortaEx)
(declare-const
   aEy
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEz
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEA
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEB
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEC
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aED
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEE
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEZ
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF4
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF9
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aFe
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-fun
   both1943117632352165408
   (
     (Maybe SortaEx)
     (Maybe SortaEx))
   (Maybe SortaEx))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408
            y
            (as
               nothing
               (Maybe SortaEx)))
         (as
            nothing
            (Maybe SortaEx)))))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaEx))
        (y
           (Maybe SortaEx)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              x)
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              y))
         (=
            (both1943117632352165408 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEz
           aEB)
         aF9)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEA
           aEB)
         aF4)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aED)
         aFe)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aEz)
         aEZ)
      :named
      given-2.4))
(assert
   (!
      (= aF9 aED)
      :named
      given-2.5))
(assert
   (!
      (= aEZ aEA)
      :named
      given-2.6))
(assert
   (!
      (= aF4 aEC)
      :named
      given-2.7))
(assert
   (!
      (= aFe aEE)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aFr} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFB} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; WANTEDS (names)
;  aEC  <=  abc
;  aEE  <=  abc'
;  aEL  <=  a_aEL
;  aEM  <=  b_aEM
;  aEO  <=  c_aEO
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aEL (Array SortaEw (Maybe SortaEx)))
; (declare-const aEM (Array SortaEw (Maybe SortaEx)))
; (declare-const aEO (Array SortaEw (Maybe SortaEx)))
(declare-const
   aEL
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEM
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEO
   (Array
      SortaEw
      (Maybe SortaEx)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 (
                   (_ map both1943117632352165408)
                   aEL
                   aEM)
                 aEO)
               aEC))
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 aEL
                 (
                   (_ map both1943117632352165408)
                   aEM
                   aEO))
               aEE)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaEx!val!5
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!6
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!4
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!0
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!1
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!3
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!2
;      ()
;      SortaEx)
;   (forall
;      (
;        (x SortaEx))
;      (or
;         (= x SortaEx!val!5)
;         (= x SortaEx!val!6)
;         (= x SortaEx!val!4)
;         (= x SortaEx!val!0)
;         (= x SortaEx!val!1)
;         (= x SortaEx!val!3)
;         (= x SortaEx!val!2)))
;   (declare-fun
;      SortaEw!val!0
;      ()
;      SortaEw)
;   (forall
;      (
;        (x SortaEw))
;      (= x SortaEw!val!0))
;   (define-fun
;      aEE
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEC
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= aEZ aEA))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEA
;           aEB)
;         aF4))
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
;                      (_ map both1943117632352165408)
;                      (
;                        (_ map both1943117632352165408)
;                        aEL
;                        aEM)
;                      aEO)
;                    aEC)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1943117632352165408)
;                      aEL
;                      (
;                        (_ map both1943117632352165408)
;                        aEM
;                        aEO))
;                    aEE))))
;         (or a!1 a!2)))
;   (define-fun
;      aEz
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= aF9 aED))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= aF4 aEC))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aFe aEE))
;   (define-fun
;      aEB
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aED)
;         aFe))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aEz)
;         aEZ))
;   (define-fun
;      aF4
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEz
;           aEB)
;         aF9))
;   (define-fun
;      aED
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aFe
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEZ
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEy
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!6))
;         SortaEw!val!0
;         (just SortaEx!val!5)))
;   (define-fun
;      aEA
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEM
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!1))
;         SortaEw!val!0
;         (just SortaEx!val!3)))
;   (define-fun
;      aF9
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEL
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!0))
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEO
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      both1943117632352165408
;      (
;        (x!0
;           (Maybe SortaEx))
;        (x!1
;           (Maybe SortaEx)))
;      (Maybe SortaEx)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaEx!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaEx!val!0))
;                  (=
;                     x!1
;                     (just SortaEx!val!1)))
;               (just SortaEx!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaEx!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaEx!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaEx!val!2))
;                           (=
;                              x!1
;                              (just SortaEx!val!3)))
;                        (just SortaEx!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaEx!val!2))
;                              (=
;                                 x!1
;                                 (just SortaEx!val!4)))
;                           (just SortaEx!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaEx!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaEx!val!3))
;                                    (=
;                                       x!1
;                                       (just SortaEx!val!4)))
;                                 (just SortaEx!val!3)
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
; [G] co_aFa {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aF5 {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFf {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aF0 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aFb {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aF1 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aF6 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFg {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFr} {2}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aFB} {2}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aEw,aEx,aEz,aEB],aF9)
; (IntersectL [aEw,aEx,aEA,aEB],aF4)
; (IntersectL [aEw,aEx,aEy,aED],aFe)
; (IntersectL [aEw,aEx,aEy,aEz],aEZ)
; (aF9,aED)
; (aEZ,aEA)
; (aF4,aEC)
; (aFe,aEE)

; WANTEDS (Thoralf style)
; (IntersectL [aEw,aEx,IntersectL [aEw,aEx,aEL,aEM],aEO],aEC)
; (IntersectL [aEw,aEx,aEL,IntersectL [aEw,aEx,aEM,aEO]],aEE)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aFr} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFB} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; GIVENS (names)
;  aEy  <=  a
;  aEz  <=  b
;  aEA  <=  ab
;  aEB  <=  c
;  aEC  <=  abc
;  aED  <=  bc
;  aEE  <=  abc'
;  aEZ  <=  fsk_aEZ
;  aF4  <=  fsk_aF4
;  aF9  <=  fsk_aF9
;  aFe  <=  fsk_aFe
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaEx)) (y (Maybe SortaEx))) (=> (and ((_ is (just (SortaEx) (Maybe SortaEx))) x) ((_ is (just (SortaEx) (Maybe SortaEx))) y)) (= (both1943117632352165408 x y) x))))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 y (as nothing (Maybe SortaEx))) (as nothing (Maybe SortaEx)))))
; (declare-const aEA (Array SortaEw (Maybe SortaEx)))
; (declare-const aEB (Array SortaEw (Maybe SortaEx)))
; (declare-const aEC (Array SortaEw (Maybe SortaEx)))
; (declare-const aED (Array SortaEw (Maybe SortaEx)))
; (declare-const aEE (Array SortaEw (Maybe SortaEx)))
; (declare-const aEZ (Array SortaEw (Maybe SortaEx)))
; (declare-const aEy (Array SortaEw (Maybe SortaEx)))
; (declare-const aEz (Array SortaEw (Maybe SortaEx)))
; (declare-const aF4 (Array SortaEw (Maybe SortaEx)))
; (declare-const aF9 (Array SortaEw (Maybe SortaEx)))
; (declare-const aFe (Array SortaEw (Maybe SortaEx)))
; (declare-fun both1943117632352165408 ((Maybe SortaEx) (Maybe SortaEx)) (Maybe SortaEx))
; (declare-sort SortaEw)
; (declare-sort SortaEx)
(declare-sort SortaEw)
(declare-sort SortaEx)
(declare-const
   aEy
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEz
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEA
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEB
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEC
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aED
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEE
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEZ
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF4
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF9
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aFe
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-fun
   both1943117632352165408
   (
     (Maybe SortaEx)
     (Maybe SortaEx))
   (Maybe SortaEx))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408
            y
            (as
               nothing
               (Maybe SortaEx)))
         (as
            nothing
            (Maybe SortaEx)))))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaEx))
        (y
           (Maybe SortaEx)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              x)
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              y))
         (=
            (both1943117632352165408 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEz
           aEB)
         aF9)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEA
           aEB)
         aF4)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aED)
         aFe)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aEz)
         aEZ)
      :named
      given-2.4))
(assert
   (!
      (= aF9 aED)
      :named
      given-2.5))
(assert
   (!
      (= aEZ aEA)
      :named
      given-2.6))
(assert
   (!
      (= aF4 aEC)
      :named
      given-2.7))
(assert
   (!
      (= aFe aEE)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aFr} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFB} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; WANTEDS (names)
;  aEC  <=  abc
;  aEE  <=  abc'
;  aEL  <=  a_aEL
;  aEM  <=  b_aEM
;  aEO  <=  c_aEO
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aEL (Array SortaEw (Maybe SortaEx)))
; (declare-const aEM (Array SortaEw (Maybe SortaEx)))
; (declare-const aEO (Array SortaEw (Maybe SortaEx)))
(declare-const
   aEL
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEM
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEO
   (Array
      SortaEw
      (Maybe SortaEx)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 (
                   (_ map both1943117632352165408)
                   aEL
                   aEM)
                 aEO)
               aEC))
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 aEL
                 (
                   (_ map both1943117632352165408)
                   aEM
                   aEO))
               aEE)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaEx!val!5
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!6
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!4
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!0
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!1
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!3
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!2
;      ()
;      SortaEx)
;   (forall
;      (
;        (x SortaEx))
;      (or
;         (= x SortaEx!val!5)
;         (= x SortaEx!val!6)
;         (= x SortaEx!val!4)
;         (= x SortaEx!val!0)
;         (= x SortaEx!val!1)
;         (= x SortaEx!val!3)
;         (= x SortaEx!val!2)))
;   (declare-fun
;      SortaEw!val!0
;      ()
;      SortaEw)
;   (forall
;      (
;        (x SortaEw))
;      (= x SortaEw!val!0))
;   (define-fun
;      aEE
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEC
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= aEZ aEA))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEA
;           aEB)
;         aF4))
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
;                      (_ map both1943117632352165408)
;                      (
;                        (_ map both1943117632352165408)
;                        aEL
;                        aEM)
;                      aEO)
;                    aEC)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1943117632352165408)
;                      aEL
;                      (
;                        (_ map both1943117632352165408)
;                        aEM
;                        aEO))
;                    aEE))))
;         (or a!1 a!2)))
;   (define-fun
;      aEz
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= aF9 aED))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= aF4 aEC))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aFe aEE))
;   (define-fun
;      aEB
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aED)
;         aFe))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aEz)
;         aEZ))
;   (define-fun
;      aF4
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEz
;           aEB)
;         aF9))
;   (define-fun
;      aED
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aFe
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEZ
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEy
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!6))
;         SortaEw!val!0
;         (just SortaEx!val!5)))
;   (define-fun
;      aEA
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEM
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!1))
;         SortaEw!val!0
;         (just SortaEx!val!3)))
;   (define-fun
;      aF9
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      aEL
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!0))
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEO
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      both1943117632352165408
;      (
;        (x!0
;           (Maybe SortaEx))
;        (x!1
;           (Maybe SortaEx)))
;      (Maybe SortaEx)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaEx!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaEx!val!0))
;                  (=
;                     x!1
;                     (just SortaEx!val!1)))
;               (just SortaEx!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaEx!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaEx!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaEx!val!2))
;                           (=
;                              x!1
;                              (just SortaEx!val!3)))
;                        (just SortaEx!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaEx!val!2))
;                              (=
;                                 x!1
;                                 (just SortaEx!val!4)))
;                           (just SortaEx!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaEx!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaEx!val!3))
;                                    (=
;                                       x!1
;                                       (just SortaEx!val!4)))
;                                 (just SortaEx!val!3)
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
; [G] co_aFa {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aF5 {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFf {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aF0 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aFb {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aF1 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aF6 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFg {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFG} {3}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aFL} {3}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aEw,aEx,aEz,aEB],aF9)
; (IntersectL [aEw,aEx,aEA,aEB],aF4)
; (IntersectL [aEw,aEx,aEy,aED],aFe)
; (IntersectL [aEw,aEx,aEy,aEz],aEZ)
; (aF9,aED)
; (aEZ,aEA)
; (aF4,aEC)
; (aFe,aEE)

; WANTEDS (Thoralf style)
; (IntersectL [aEw,aEx,IntersectL [aEw,aEx,aEL,aEM],aEO],aEC)
; (IntersectL [aEw,aEx,aEL,IntersectL [aEw,aEx,aEM,aEO]],aEE)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aFG} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFL} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; GIVENS (names)
;  aEy  <=  a
;  aEz  <=  b
;  aEA  <=  ab
;  aEB  <=  c
;  aEC  <=  abc
;  aED  <=  bc
;  aEE  <=  abc'
;  aEZ  <=  fsk_aEZ
;  aF4  <=  fsk_aF4
;  aF9  <=  fsk_aF9
;  aFe  <=  fsk_aFe
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaEx)) (y (Maybe SortaEx))) (=> (and ((_ is (just (SortaEx) (Maybe SortaEx))) x) ((_ is (just (SortaEx) (Maybe SortaEx))) y)) (= (both1943117632352165408 x y) x))))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 y (as nothing (Maybe SortaEx))) (as nothing (Maybe SortaEx)))))
; (declare-const aEA (Array SortaEw (Maybe SortaEx)))
; (declare-const aEB (Array SortaEw (Maybe SortaEx)))
; (declare-const aEC (Array SortaEw (Maybe SortaEx)))
; (declare-const aED (Array SortaEw (Maybe SortaEx)))
; (declare-const aEE (Array SortaEw (Maybe SortaEx)))
; (declare-const aEZ (Array SortaEw (Maybe SortaEx)))
; (declare-const aEy (Array SortaEw (Maybe SortaEx)))
; (declare-const aEz (Array SortaEw (Maybe SortaEx)))
; (declare-const aF4 (Array SortaEw (Maybe SortaEx)))
; (declare-const aF9 (Array SortaEw (Maybe SortaEx)))
; (declare-const aFe (Array SortaEw (Maybe SortaEx)))
; (declare-fun both1943117632352165408 ((Maybe SortaEx) (Maybe SortaEx)) (Maybe SortaEx))
; (declare-sort SortaEw)
; (declare-sort SortaEx)
; DECS1 (unseen) 
(declare-sort SortaEw)
(declare-sort SortaEx)
(declare-const
   aEy
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEz
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEA
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEB
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEC
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aED
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEE
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEZ
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF4
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF9
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aFe
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-fun
   both1943117632352165408
   (
     (Maybe SortaEx)
     (Maybe SortaEx))
   (Maybe SortaEx))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408
            y
            (as
               nothing
               (Maybe SortaEx)))
         (as
            nothing
            (Maybe SortaEx)))))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaEx))
        (y
           (Maybe SortaEx)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              x)
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              y))
         (=
            (both1943117632352165408 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEz
           aEB)
         aF9)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEA
           aEB)
         aF4)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aED)
         aFe)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aEz)
         aEZ)
      :named
      given-3.4))
(assert
   (!
      (= aF9 aED)
      :named
      given-3.5))
(assert
   (!
      (= aEZ aEA)
      :named
      given-3.6))
(assert
   (!
      (= aF4 aEC)
      :named
      given-3.7))
(assert
   (!
      (= aFe aEE)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aFG} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFL} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; WANTEDS (names)
;  aEC  <=  abc
;  aEE  <=  abc'
;  aEL  <=  a_aEL
;  aEM  <=  b_aEM
;  aEO  <=  c_aEO
; DECS2 (seen) 
; (declare-const aEL (Array SortaEw (Maybe SortaEx)))
; (declare-const aEM (Array SortaEw (Maybe SortaEx)))
; (declare-const aEO (Array SortaEw (Maybe SortaEx)))
; DECS2 (unseen) 
(declare-const
   aEL
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEM
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEO
   (Array
      SortaEw
      (Maybe SortaEx)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 (
                   (_ map both1943117632352165408)
                   aEL
                   aEM)
                 aEO)
               aEC))
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 aEL
                 (
                   (_ map both1943117632352165408)
                   aEM
                   aEO))
               aEE)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      SortaEx!val!1
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!3
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!5
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!2
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!4
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!0
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!6
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!7
;      ()
;      SortaEx)
;   (forall
;      (
;        (x SortaEx))
;      (or
;         (= x SortaEx!val!1)
;         (= x SortaEx!val!3)
;         (= x SortaEx!val!5)
;         (= x SortaEx!val!2)
;         (= x SortaEx!val!4)
;         (= x SortaEx!val!0)
;         (= x SortaEx!val!6)
;         (= x SortaEx!val!7)))
;   (declare-fun
;      SortaEw!val!0
;      ()
;      SortaEw)
;   (forall
;      (
;        (x SortaEw))
;      (= x SortaEw!val!0))
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
;                      (_ map both1943117632352165408)
;                      (
;                        (_ map both1943117632352165408)
;                        aEL
;                        aEM)
;                      aEO)
;                    aEC)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1943117632352165408)
;                      aEL
;                      (
;                        (_ map both1943117632352165408)
;                        aEM
;                        aEO))
;                    aEE))))
;         (or a!1 a!2)))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= aEZ aEA))
;   (define-fun
;      aEL
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!0))
;         SortaEw!val!0
;         (just SortaEx!val!3)))
;   (define-fun
;      aEE
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEC
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEO
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEA
;           aEB)
;         aF4))
;   (define-fun
;      aEz
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      aEB
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!5)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= aF9 aED))
;   (define-fun
;      aF4
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEz
;           aEB)
;         aF9))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= aFe aEE))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= aF4 aEC))
;   (define-fun
;      aED
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      aFe
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEy
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!7))
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEA
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEZ
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aF9
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      aEM
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!1))
;         SortaEw!val!0
;         (just SortaEx!val!6)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aEz)
;         aEZ))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aED)
;         aFe))
;   (define-fun
;      both1943117632352165408
;      (
;        (x!0
;           (Maybe SortaEx))
;        (x!1
;           (Maybe SortaEx)))
;      (Maybe SortaEx)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaEx!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaEx!val!0))
;                  (=
;                     x!1
;                     (just SortaEx!val!1)))
;               (just SortaEx!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaEx!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaEx!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaEx!val!2))
;                           (=
;                              x!1
;                              (just SortaEx!val!5)))
;                        (just SortaEx!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaEx!val!3))
;                              (=
;                                 x!1
;                                 (just SortaEx!val!6)))
;                           (just SortaEx!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaEx!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaEx!val!4))
;                                    (=
;                                       x!1
;                                       (just SortaEx!val!5)))
;                                 (just SortaEx!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just SortaEx!val!2))
;                                       (=
;                                          x!1
;                                          (just SortaEx!val!4)))
;                                    (just SortaEx!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just SortaEx!val!6))
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
; [G] co_aFa {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aF5 {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFf {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aF0 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aFb {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aF1 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aF6 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFg {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFG} {3}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aFL} {3}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aEw,aEx,aEz,aEB],aF9)
; (IntersectL [aEw,aEx,aEA,aEB],aF4)
; (IntersectL [aEw,aEx,aEy,aED],aFe)
; (IntersectL [aEw,aEx,aEy,aEz],aEZ)
; (aF9,aED)
; (aEZ,aEA)
; (aF4,aEC)
; (aFe,aEE)

; WANTEDS (Thoralf style)
; (IntersectL [aEw,aEx,IntersectL [aEw,aEx,aEL,aEM],aEO],aEC)
; (IntersectL [aEw,aEx,aEL,IntersectL [aEw,aEx,aEM,aEO]],aEE)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aFG} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFL} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; GIVENS (names)
;  aEy  <=  a
;  aEz  <=  b
;  aEA  <=  ab
;  aEB  <=  c
;  aEC  <=  abc
;  aED  <=  bc
;  aEE  <=  abc'
;  aEZ  <=  fsk_aEZ
;  aF4  <=  fsk_aF4
;  aF9  <=  fsk_aF9
;  aFe  <=  fsk_aFe
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaEx)) (y (Maybe SortaEx))) (=> (and ((_ is (just (SortaEx) (Maybe SortaEx))) x) ((_ is (just (SortaEx) (Maybe SortaEx))) y)) (= (both1943117632352165408 x y) x))))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaEx))) (= (both1943117632352165408 y (as nothing (Maybe SortaEx))) (as nothing (Maybe SortaEx)))))
; (declare-const aEA (Array SortaEw (Maybe SortaEx)))
; (declare-const aEB (Array SortaEw (Maybe SortaEx)))
; (declare-const aEC (Array SortaEw (Maybe SortaEx)))
; (declare-const aED (Array SortaEw (Maybe SortaEx)))
; (declare-const aEE (Array SortaEw (Maybe SortaEx)))
; (declare-const aEZ (Array SortaEw (Maybe SortaEx)))
; (declare-const aEy (Array SortaEw (Maybe SortaEx)))
; (declare-const aEz (Array SortaEw (Maybe SortaEx)))
; (declare-const aF4 (Array SortaEw (Maybe SortaEx)))
; (declare-const aF9 (Array SortaEw (Maybe SortaEx)))
; (declare-const aFe (Array SortaEw (Maybe SortaEx)))
; (declare-fun both1943117632352165408 ((Maybe SortaEx) (Maybe SortaEx)) (Maybe SortaEx))
; (declare-sort SortaEw)
; (declare-sort SortaEx)
; DECS1 (unseen) 
(declare-sort SortaEw)
(declare-sort SortaEx)
(declare-const
   aEy
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEz
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEA
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEB
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEC
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aED
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEE
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEZ
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF4
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aF9
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aFe
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-fun
   both1943117632352165408
   (
     (Maybe SortaEx)
     (Maybe SortaEx))
   (Maybe SortaEx))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408
            y
            (as
               nothing
               (Maybe SortaEx)))
         (as
            nothing
            (Maybe SortaEx)))))
(assert
   (forall
      (
        (y
           (Maybe SortaEx)))
      (=
         (both1943117632352165408 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaEx))
        (y
           (Maybe SortaEx)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              x)
            (
              (_
                 is
                 (just
                    (SortaEx)
                    (Maybe SortaEx)))
              y))
         (=
            (both1943117632352165408 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEz
           aEB)
         aF9)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEA
           aEB)
         aF4)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aED)
         aFe)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both1943117632352165408)
           aEy
           aEz)
         aEZ)
      :named
      given-3.4))
(assert
   (!
      (= aF9 aED)
      :named
      given-3.5))
(assert
   (!
      (= aEZ aEA)
      :named
      given-3.6))
(assert
   (!
      (= aF4 aEC)
      :named
      given-3.7))
(assert
   (!
      (= aFe aEE)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aFG} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      (
;        (_ map both1943117632352165408)
;        aEL
;        aEM)
;      aEO)
;    aEC)

;      [WD] hole{co_aFL} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1943117632352165408)
;      aEL
;      (
;        (_ map both1943117632352165408)
;        aEM
;        aEO))
;    aEE)

; WANTEDS (names)
;  aEC  <=  abc
;  aEE  <=  abc'
;  aEL  <=  a_aEL
;  aEM  <=  b_aEM
;  aEO  <=  c_aEO
; DECS2 (seen) 
; (declare-const aEL (Array SortaEw (Maybe SortaEx)))
; (declare-const aEM (Array SortaEw (Maybe SortaEx)))
; (declare-const aEO (Array SortaEw (Maybe SortaEx)))
; DECS2 (unseen) 
(declare-const
   aEL
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEM
   (Array
      SortaEw
      (Maybe SortaEx)))
(declare-const
   aEO
   (Array
      SortaEw
      (Maybe SortaEx)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 (
                   (_ map both1943117632352165408)
                   aEL
                   aEM)
                 aEO)
               aEC))
         (not
            (=
               (
                 (_ map both1943117632352165408)
                 aEL
                 (
                   (_ map both1943117632352165408)
                   aEM
                   aEO))
               aEE)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      SortaEx!val!1
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!3
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!5
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!2
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!4
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!0
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!6
;      ()
;      SortaEx)
;   (declare-fun
;      SortaEx!val!7
;      ()
;      SortaEx)
;   (forall
;      (
;        (x SortaEx))
;      (or
;         (= x SortaEx!val!1)
;         (= x SortaEx!val!3)
;         (= x SortaEx!val!5)
;         (= x SortaEx!val!2)
;         (= x SortaEx!val!4)
;         (= x SortaEx!val!0)
;         (= x SortaEx!val!6)
;         (= x SortaEx!val!7)))
;   (declare-fun
;      SortaEw!val!0
;      ()
;      SortaEw)
;   (forall
;      (
;        (x SortaEw))
;      (= x SortaEw!val!0))
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
;                      (_ map both1943117632352165408)
;                      (
;                        (_ map both1943117632352165408)
;                        aEL
;                        aEM)
;                      aEO)
;                    aEC)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1943117632352165408)
;                      aEL
;                      (
;                        (_ map both1943117632352165408)
;                        aEM
;                        aEO))
;                    aEE))))
;         (or a!1 a!2)))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= aEZ aEA))
;   (define-fun
;      aEL
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!0))
;         SortaEw!val!0
;         (just SortaEx!val!3)))
;   (define-fun
;      aEE
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEC
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEO
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (
;        (as
;           const
;           (Array
;              SortaEw
;              (Maybe SortaEx)))
;        nothing))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEA
;           aEB)
;         aF4))
;   (define-fun
;      aEz
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      aEB
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!5)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= aF9 aED))
;   (define-fun
;      aF4
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEz
;           aEB)
;         aF9))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= aFe aEE))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= aF4 aEC))
;   (define-fun
;      aED
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      aFe
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEy
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!7))
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEA
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aEZ
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!2)))
;   (define-fun
;      aF9
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           nothing)
;         SortaEw!val!0
;         (just SortaEx!val!4)))
;   (define-fun
;      aEM
;      ()
;      (Array
;         SortaEw
;         (Maybe SortaEx))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEw
;                 (Maybe SortaEx)))
;           (just SortaEx!val!1))
;         SortaEw!val!0
;         (just SortaEx!val!6)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aEz)
;         aEZ))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1943117632352165408)
;           aEy
;           aED)
;         aFe))
;   (define-fun
;      both1943117632352165408
;      (
;        (x!0
;           (Maybe SortaEx))
;        (x!1
;           (Maybe SortaEx)))
;      (Maybe SortaEx)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaEx!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaEx!val!0))
;                  (=
;                     x!1
;                     (just SortaEx!val!1)))
;               (just SortaEx!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaEx!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaEx!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaEx!val!2))
;                           (=
;                              x!1
;                              (just SortaEx!val!5)))
;                        (just SortaEx!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaEx!val!3))
;                              (=
;                                 x!1
;                                 (just SortaEx!val!6)))
;                           (just SortaEx!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaEx!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaEx!val!4))
;                                    (=
;                                       x!1
;                                       (just SortaEx!val!5)))
;                                 (just SortaEx!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just SortaEx!val!2))
;                                       (=
;                                          x!1
;                                          (just SortaEx!val!4)))
;                                    (just SortaEx!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just SortaEx!val!6))
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
; [G] co_aGO {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aGJ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aGT {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aGE {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aGP {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aGF {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aGK {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aGU {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aH5} {2}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aHf} {2}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aGa,aGb,aGd,aGf],aGN)
; (UnionL [aGa,aGb,aGe,aGf],aGI)
; (UnionL [aGa,aGb,aGc,aGh],aGS)
; (UnionL [aGa,aGb,aGc,aGd],aGD)
; (aGN,aGh)
; (aGD,aGe)
; (aGI,aGg)
; (aGS,aGi)

; WANTEDS (Thoralf style)
; (UnionL [aGa,aGb,UnionL [aGa,aGb,aGp,aGq],aGs],aGg)
; (UnionL [aGa,aGb,aGp,UnionL [aGa,aGb,aGq,aGs]],aGi)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aH5} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHf} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; GIVENS (names)
;  aGc  <=  a
;  aGd  <=  b
;  aGe  <=  ab
;  aGf  <=  c
;  aGg  <=  abc
;  aGh  <=  bc
;  aGi  <=  abc'
;  aGD  <=  fsk_aGD
;  aGI  <=  fsk_aGI
;  aGN  <=  fsk_aGN
;  aGS  <=  fsk_aGS
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaGb)) (y (Maybe SortaGb))) (=> ((_ is (just (SortaGb) (Maybe SortaGb))) x) (= (either1941175894817123232 x y) x))))
; (assert (forall ((y (Maybe SortaGb))) (= (either1941175894817123232 (as nothing (Maybe SortaGb)) y) y)))
; (declare-const aGD (Array SortaGa (Maybe SortaGb)))
; (declare-const aGI (Array SortaGa (Maybe SortaGb)))
; (declare-const aGN (Array SortaGa (Maybe SortaGb)))
; (declare-const aGS (Array SortaGa (Maybe SortaGb)))
; (declare-const aGc (Array SortaGa (Maybe SortaGb)))
; (declare-const aGd (Array SortaGa (Maybe SortaGb)))
; (declare-const aGe (Array SortaGa (Maybe SortaGb)))
; (declare-const aGf (Array SortaGa (Maybe SortaGb)))
; (declare-const aGg (Array SortaGa (Maybe SortaGb)))
; (declare-const aGh (Array SortaGa (Maybe SortaGb)))
; (declare-const aGi (Array SortaGa (Maybe SortaGb)))
; (declare-fun either1941175894817123232 ((Maybe SortaGb) (Maybe SortaGb)) (Maybe SortaGb))
; (declare-sort SortaGa)
; (declare-sort SortaGb)
(declare-sort SortaGa)
(declare-sort SortaGb)
(declare-const
   aGc
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGd
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGe
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGf
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGg
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGh
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGi
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGD
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGI
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGN
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGS
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-fun
   either1941175894817123232
   (
     (Maybe SortaGb)
     (Maybe SortaGb))
   (Maybe SortaGb))
(assert
   (forall
      (
        (y
           (Maybe SortaGb)))
      (=
         (either1941175894817123232
            (as
               nothing
               (Maybe SortaGb))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaGb))
        (y
           (Maybe SortaGb)))
      (=>
         (
           (_
              is
              (just
                 (SortaGb)
                 (Maybe SortaGb)))
           x)
         (=
            (either1941175894817123232 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGd
           aGf)
         aGN)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGe
           aGf)
         aGI)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGh)
         aGS)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGd)
         aGD)
      :named
      given-5.4))
(assert
   (!
      (= aGN aGh)
      :named
      given-5.5))
(assert
   (!
      (= aGD aGe)
      :named
      given-5.6))
(assert
   (!
      (= aGI aGg)
      :named
      given-5.7))
(assert
   (!
      (= aGS aGi)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aH5} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHf} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; WANTEDS (names)
;  aGg  <=  abc
;  aGi  <=  abc'
;  aGp  <=  a_aGp
;  aGq  <=  b_aGq
;  aGs  <=  c_aGs
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGp (Array SortaGa (Maybe SortaGb)))
; (declare-const aGq (Array SortaGa (Maybe SortaGb)))
; (declare-const aGs (Array SortaGa (Maybe SortaGb)))
(declare-const
   aGp
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGq
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGs
   (Array
      SortaGa
      (Maybe SortaGb)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 (
                   (_ map either1941175894817123232)
                   aGp
                   aGq)
                 aGs)
               aGg))
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 aGp
                 (
                   (_ map either1941175894817123232)
                   aGq
                   aGs))
               aGi)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      SortaGa!val!0
;      ()
;      SortaGa)
;   (declare-fun
;      SortaGa!val!1
;      ()
;      SortaGa)
;   (forall
;      (
;        (x SortaGa))
;      (or
;         (= x SortaGa!val!0)
;         (= x SortaGa!val!1)))
;   (declare-fun
;      SortaGb!val!2
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!3
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!4
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!5
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!1
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!0
;      ()
;      SortaGb)
;   (forall
;      (
;        (x SortaGb))
;      (or
;         (= x SortaGb!val!2)
;         (= x SortaGb!val!3)
;         (= x SortaGb!val!4)
;         (= x SortaGb!val!5)
;         (= x SortaGb!val!1)
;         (= x SortaGb!val!0)))
;   (define-fun
;      aGh
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGD
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           (just SortaGb!val!0))
;         SortaGa!val!0
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
;                      (_ map either1941175894817123232)
;                      (
;                        (_ map either1941175894817123232)
;                        aGp
;                        aGq)
;                      aGs)
;                    aGg)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1941175894817123232)
;                      aGp
;                      (
;                        (_ map either1941175894817123232)
;                        aGq
;                        aGs))
;                    aGi))))
;         (or a!1 a!2)))
;   (define-fun
;      aGd
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGe
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGd
;           aGf)
;         aGN))
;   (define-fun
;      aGS
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGI
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGc
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGd)
;         aGD))
;   (define-fun
;      aGi
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= aGS aGi))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGh)
;         aGS))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= aGD aGe))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= aGI aGg))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGe
;           aGf)
;         aGI))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= aGN aGh))
;   (define-fun
;      aGN
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGp
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGq
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           nothing)
;         SortaGa!val!0
;         (just SortaGb!val!3)))
;   (define-fun
;      aGg
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGf
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           nothing)
;         SortaGa!val!0
;         (just SortaGb!val!2)))
;   (define-fun
;      k!79
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         (just SortaGb!val!3)
;         (just SortaGb!val!0)))
;   (define-fun
;      either1941175894817123232
;      (
;        (x!0
;           (Maybe SortaGb))
;        (x!1
;           (Maybe SortaGb)))
;      (Maybe SortaGb)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGb!val!4))
;            (= x!1 nothing))
;         (just SortaGb!val!4)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaGb!val!4)))
;            (just SortaGb!val!4)
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
;                        (just SortaGb!val!0)))
;                  (just SortaGb!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaGb!val!2)))
;                     (just SortaGb!val!2)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaGb!val!3)))
;                        (just SortaGb!val!3)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaGb!val!5))
;                              (= x!1 nothing))
;                           (just SortaGb!val!5)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just SortaGb!val!5)))
;                              (just SortaGb!val!5)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaGb!val!3))
;                                    (= x!1 nothing))
;                                 (just SortaGb!val!3)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1)))))))))))
;   (define-fun
;      k!73
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         (just SortaGb!val!2)
;         (ite
;            (= x!0 SortaGa!val!1)
;            (just SortaGb!val!5)
;            (just SortaGb!val!4)))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_aGO {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aGJ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aGT {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aGE {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aGP {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aGF {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aGK {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aGU {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aH5} {2}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aHf} {2}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aGa,aGb,aGd,aGf],aGN)
; (UnionL [aGa,aGb,aGe,aGf],aGI)
; (UnionL [aGa,aGb,aGc,aGh],aGS)
; (UnionL [aGa,aGb,aGc,aGd],aGD)
; (aGN,aGh)
; (aGD,aGe)
; (aGI,aGg)
; (aGS,aGi)

; WANTEDS (Thoralf style)
; (UnionL [aGa,aGb,UnionL [aGa,aGb,aGp,aGq],aGs],aGg)
; (UnionL [aGa,aGb,aGp,UnionL [aGa,aGb,aGq,aGs]],aGi)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aH5} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHf} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; GIVENS (names)
;  aGc  <=  a
;  aGd  <=  b
;  aGe  <=  ab
;  aGf  <=  c
;  aGg  <=  abc
;  aGh  <=  bc
;  aGi  <=  abc'
;  aGD  <=  fsk_aGD
;  aGI  <=  fsk_aGI
;  aGN  <=  fsk_aGN
;  aGS  <=  fsk_aGS
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaGb)) (y (Maybe SortaGb))) (=> ((_ is (just (SortaGb) (Maybe SortaGb))) x) (= (either1941175894817123232 x y) x))))
; (assert (forall ((y (Maybe SortaGb))) (= (either1941175894817123232 (as nothing (Maybe SortaGb)) y) y)))
; (declare-const aGD (Array SortaGa (Maybe SortaGb)))
; (declare-const aGI (Array SortaGa (Maybe SortaGb)))
; (declare-const aGN (Array SortaGa (Maybe SortaGb)))
; (declare-const aGS (Array SortaGa (Maybe SortaGb)))
; (declare-const aGc (Array SortaGa (Maybe SortaGb)))
; (declare-const aGd (Array SortaGa (Maybe SortaGb)))
; (declare-const aGe (Array SortaGa (Maybe SortaGb)))
; (declare-const aGf (Array SortaGa (Maybe SortaGb)))
; (declare-const aGg (Array SortaGa (Maybe SortaGb)))
; (declare-const aGh (Array SortaGa (Maybe SortaGb)))
; (declare-const aGi (Array SortaGa (Maybe SortaGb)))
; (declare-fun either1941175894817123232 ((Maybe SortaGb) (Maybe SortaGb)) (Maybe SortaGb))
; (declare-sort SortaGa)
; (declare-sort SortaGb)
(declare-sort SortaGa)
(declare-sort SortaGb)
(declare-const
   aGc
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGd
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGe
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGf
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGg
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGh
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGi
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGD
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGI
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGN
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGS
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-fun
   either1941175894817123232
   (
     (Maybe SortaGb)
     (Maybe SortaGb))
   (Maybe SortaGb))
(assert
   (forall
      (
        (y
           (Maybe SortaGb)))
      (=
         (either1941175894817123232
            (as
               nothing
               (Maybe SortaGb))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaGb))
        (y
           (Maybe SortaGb)))
      (=>
         (
           (_
              is
              (just
                 (SortaGb)
                 (Maybe SortaGb)))
           x)
         (=
            (either1941175894817123232 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGd
           aGf)
         aGN)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGe
           aGf)
         aGI)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGh)
         aGS)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGd)
         aGD)
      :named
      given-5.4))
(assert
   (!
      (= aGN aGh)
      :named
      given-5.5))
(assert
   (!
      (= aGD aGe)
      :named
      given-5.6))
(assert
   (!
      (= aGI aGg)
      :named
      given-5.7))
(assert
   (!
      (= aGS aGi)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aH5} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHf} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; WANTEDS (names)
;  aGg  <=  abc
;  aGi  <=  abc'
;  aGp  <=  a_aGp
;  aGq  <=  b_aGq
;  aGs  <=  c_aGs
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGp (Array SortaGa (Maybe SortaGb)))
; (declare-const aGq (Array SortaGa (Maybe SortaGb)))
; (declare-const aGs (Array SortaGa (Maybe SortaGb)))
(declare-const
   aGp
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGq
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGs
   (Array
      SortaGa
      (Maybe SortaGb)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 (
                   (_ map either1941175894817123232)
                   aGp
                   aGq)
                 aGs)
               aGg))
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 aGp
                 (
                   (_ map either1941175894817123232)
                   aGq
                   aGs))
               aGi)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      SortaGa!val!0
;      ()
;      SortaGa)
;   (declare-fun
;      SortaGa!val!1
;      ()
;      SortaGa)
;   (forall
;      (
;        (x SortaGa))
;      (or
;         (= x SortaGa!val!0)
;         (= x SortaGa!val!1)))
;   (declare-fun
;      SortaGb!val!2
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!3
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!4
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!5
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!1
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!0
;      ()
;      SortaGb)
;   (forall
;      (
;        (x SortaGb))
;      (or
;         (= x SortaGb!val!2)
;         (= x SortaGb!val!3)
;         (= x SortaGb!val!4)
;         (= x SortaGb!val!5)
;         (= x SortaGb!val!1)
;         (= x SortaGb!val!0)))
;   (define-fun
;      aGh
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGD
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           (just SortaGb!val!0))
;         SortaGa!val!0
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
;                      (_ map either1941175894817123232)
;                      (
;                        (_ map either1941175894817123232)
;                        aGp
;                        aGq)
;                      aGs)
;                    aGg)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1941175894817123232)
;                      aGp
;                      (
;                        (_ map either1941175894817123232)
;                        aGq
;                        aGs))
;                    aGi))))
;         (or a!1 a!2)))
;   (define-fun
;      aGd
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGe
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGd
;           aGf)
;         aGN))
;   (define-fun
;      aGS
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGI
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGc
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGd)
;         aGD))
;   (define-fun
;      aGi
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= aGS aGi))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGh)
;         aGS))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= aGD aGe))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= aGI aGg))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGe
;           aGf)
;         aGI))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= aGN aGh))
;   (define-fun
;      aGN
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGp
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGq
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           nothing)
;         SortaGa!val!0
;         (just SortaGb!val!3)))
;   (define-fun
;      aGg
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            (just SortaGb!val!2))
;         SortaGa!val!1
;         (just SortaGb!val!5)))
;   (define-fun
;      aGf
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           nothing)
;         SortaGa!val!0
;         (just SortaGb!val!2)))
;   (define-fun
;      k!79
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         (just SortaGb!val!3)
;         (just SortaGb!val!0)))
;   (define-fun
;      either1941175894817123232
;      (
;        (x!0
;           (Maybe SortaGb))
;        (x!1
;           (Maybe SortaGb)))
;      (Maybe SortaGb)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGb!val!4))
;            (= x!1 nothing))
;         (just SortaGb!val!4)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaGb!val!4)))
;            (just SortaGb!val!4)
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
;                        (just SortaGb!val!0)))
;                  (just SortaGb!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaGb!val!2)))
;                     (just SortaGb!val!2)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaGb!val!3)))
;                        (just SortaGb!val!3)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaGb!val!5))
;                              (= x!1 nothing))
;                           (just SortaGb!val!5)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just SortaGb!val!5)))
;                              (just SortaGb!val!5)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaGb!val!3))
;                                    (= x!1 nothing))
;                                 (just SortaGb!val!3)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1)))))))))))
;   (define-fun
;      k!73
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         (just SortaGb!val!2)
;         (ite
;            (= x!0 SortaGa!val!1)
;            (just SortaGb!val!5)
;            (just SortaGb!val!4)))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aGO {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aGJ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aGT {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aGE {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aGP {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aGF {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aGK {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aGU {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHk} {3}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aHp} {3}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aGa,aGb,aGd,aGf],aGN)
; (UnionL [aGa,aGb,aGe,aGf],aGI)
; (UnionL [aGa,aGb,aGc,aGh],aGS)
; (UnionL [aGa,aGb,aGc,aGd],aGD)
; (aGN,aGh)
; (aGD,aGe)
; (aGI,aGg)
; (aGS,aGi)

; WANTEDS (Thoralf style)
; (UnionL [aGa,aGb,UnionL [aGa,aGb,aGp,aGq],aGs],aGg)
; (UnionL [aGa,aGb,aGp,UnionL [aGa,aGb,aGq,aGs]],aGi)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aHk} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHp} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; GIVENS (names)
;  aGc  <=  a
;  aGd  <=  b
;  aGe  <=  ab
;  aGf  <=  c
;  aGg  <=  abc
;  aGh  <=  bc
;  aGi  <=  abc'
;  aGD  <=  fsk_aGD
;  aGI  <=  fsk_aGI
;  aGN  <=  fsk_aGN
;  aGS  <=  fsk_aGS
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaGb)) (y (Maybe SortaGb))) (=> ((_ is (just (SortaGb) (Maybe SortaGb))) x) (= (either1941175894817123232 x y) x))))
; (assert (forall ((y (Maybe SortaGb))) (= (either1941175894817123232 (as nothing (Maybe SortaGb)) y) y)))
; (declare-const aGD (Array SortaGa (Maybe SortaGb)))
; (declare-const aGI (Array SortaGa (Maybe SortaGb)))
; (declare-const aGN (Array SortaGa (Maybe SortaGb)))
; (declare-const aGS (Array SortaGa (Maybe SortaGb)))
; (declare-const aGc (Array SortaGa (Maybe SortaGb)))
; (declare-const aGd (Array SortaGa (Maybe SortaGb)))
; (declare-const aGe (Array SortaGa (Maybe SortaGb)))
; (declare-const aGf (Array SortaGa (Maybe SortaGb)))
; (declare-const aGg (Array SortaGa (Maybe SortaGb)))
; (declare-const aGh (Array SortaGa (Maybe SortaGb)))
; (declare-const aGi (Array SortaGa (Maybe SortaGb)))
; (declare-fun either1941175894817123232 ((Maybe SortaGb) (Maybe SortaGb)) (Maybe SortaGb))
; (declare-sort SortaGa)
; (declare-sort SortaGb)
; DECS1 (unseen) 
(declare-sort SortaGa)
(declare-sort SortaGb)
(declare-const
   aGc
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGd
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGe
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGf
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGg
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGh
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGi
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGD
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGI
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGN
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGS
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-fun
   either1941175894817123232
   (
     (Maybe SortaGb)
     (Maybe SortaGb))
   (Maybe SortaGb))
(assert
   (forall
      (
        (y
           (Maybe SortaGb)))
      (=
         (either1941175894817123232
            (as
               nothing
               (Maybe SortaGb))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaGb))
        (y
           (Maybe SortaGb)))
      (=>
         (
           (_
              is
              (just
                 (SortaGb)
                 (Maybe SortaGb)))
           x)
         (=
            (either1941175894817123232 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGd
           aGf)
         aGN)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGe
           aGf)
         aGI)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGh)
         aGS)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGd)
         aGD)
      :named
      given-6.4))
(assert
   (!
      (= aGN aGh)
      :named
      given-6.5))
(assert
   (!
      (= aGD aGe)
      :named
      given-6.6))
(assert
   (!
      (= aGI aGg)
      :named
      given-6.7))
(assert
   (!
      (= aGS aGi)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aHk} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHp} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; WANTEDS (names)
;  aGg  <=  abc
;  aGi  <=  abc'
;  aGp  <=  a_aGp
;  aGq  <=  b_aGq
;  aGs  <=  c_aGs
; DECS2 (seen) 
; (declare-const aGp (Array SortaGa (Maybe SortaGb)))
; (declare-const aGq (Array SortaGa (Maybe SortaGb)))
; (declare-const aGs (Array SortaGa (Maybe SortaGb)))
; DECS2 (unseen) 
(declare-const
   aGp
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGq
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGs
   (Array
      SortaGa
      (Maybe SortaGb)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 (
                   (_ map either1941175894817123232)
                   aGp
                   aGq)
                 aGs)
               aGg))
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 aGp
                 (
                   (_ map either1941175894817123232)
                   aGq
                   aGs))
               aGi)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      SortaGa!val!0
;      ()
;      SortaGa)
;   (declare-fun
;      SortaGa!val!1
;      ()
;      SortaGa)
;   (forall
;      (
;        (x SortaGa))
;      (or
;         (= x SortaGa!val!0)
;         (= x SortaGa!val!1)))
;   (declare-fun
;      SortaGb!val!2
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!3
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!4
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!1
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!0
;      ()
;      SortaGb)
;   (forall
;      (
;        (x SortaGb))
;      (or
;         (= x SortaGb!val!2)
;         (= x SortaGb!val!3)
;         (= x SortaGb!val!4)
;         (= x SortaGb!val!1)
;         (= x SortaGb!val!0)))
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
;                      (_ map either1941175894817123232)
;                      (
;                        (_ map either1941175894817123232)
;                        aGp
;                        aGq)
;                      aGs)
;                    aGg)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1941175894817123232)
;                      aGp
;                      (
;                        (_ map either1941175894817123232)
;                        aGq
;                        aGs))
;                    aGi))))
;         (or a!1 a!2)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= aGS aGi))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGd)
;         aGD))
;   (define-fun
;      aGh
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGe
;           aGf)
;         aGI))
;   (define-fun
;      aGD
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         nothing))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!0))
;            SortaGa!val!0
;            (just SortaGb!val!1))
;         SortaGa!val!1
;         (just SortaGb!val!2)))
;   (define-fun
;      aGd
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         nothing))
;   (define-fun
;      aGe
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= aGN aGh))
;   (define-fun
;      aGS
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      aGI
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      aGc
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGi
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      aGp
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGq
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGN
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGh)
;         aGS))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGd
;           aGf)
;         aGN))
;   (define-fun
;      aGg
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= aGI aGg))
;   (define-fun
;      aGf
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= aGD aGe))
;   (define-fun
;      k!100
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         nothing
;         (ite
;            (= x!0 SortaGa!val!1)
;            (just SortaGb!val!3)
;            (just SortaGb!val!4))))
;   (define-fun
;      k!106
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         (just SortaGb!val!1)
;         (ite
;            (= x!0 SortaGa!val!1)
;            (just SortaGb!val!2)
;            (just SortaGb!val!0))))
;   (define-fun
;      either1941175894817123232
;      (
;        (x!0
;           (Maybe SortaGb))
;        (x!1
;           (Maybe SortaGb)))
;      (Maybe SortaGb)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGb!val!4))
;            (= x!1 nothing))
;         (just SortaGb!val!4)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaGb!val!4)))
;            (just SortaGb!val!4)
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
;                        (just SortaGb!val!0)))
;                  (just SortaGb!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaGb!val!1)))
;                     (just SortaGb!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaGb!val!2)))
;                        (just SortaGb!val!2)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaGb!val!3)))
;                           (just SortaGb!val!3)
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
; [G] co_aGO {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aGJ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aGT {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aGE {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aGP {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aGF {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aGK {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aGU {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHk} {3}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aHp} {3}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aGa,aGb,aGd,aGf],aGN)
; (UnionL [aGa,aGb,aGe,aGf],aGI)
; (UnionL [aGa,aGb,aGc,aGh],aGS)
; (UnionL [aGa,aGb,aGc,aGd],aGD)
; (aGN,aGh)
; (aGD,aGe)
; (aGI,aGg)
; (aGS,aGi)

; WANTEDS (Thoralf style)
; (UnionL [aGa,aGb,UnionL [aGa,aGb,aGp,aGq],aGs],aGg)
; (UnionL [aGa,aGb,aGp,UnionL [aGa,aGb,aGq,aGs]],aGi)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aHk} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHp} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; GIVENS (names)
;  aGc  <=  a
;  aGd  <=  b
;  aGe  <=  ab
;  aGf  <=  c
;  aGg  <=  abc
;  aGh  <=  bc
;  aGi  <=  abc'
;  aGD  <=  fsk_aGD
;  aGI  <=  fsk_aGI
;  aGN  <=  fsk_aGN
;  aGS  <=  fsk_aGS
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaGb)) (y (Maybe SortaGb))) (=> ((_ is (just (SortaGb) (Maybe SortaGb))) x) (= (either1941175894817123232 x y) x))))
; (assert (forall ((y (Maybe SortaGb))) (= (either1941175894817123232 (as nothing (Maybe SortaGb)) y) y)))
; (declare-const aGD (Array SortaGa (Maybe SortaGb)))
; (declare-const aGI (Array SortaGa (Maybe SortaGb)))
; (declare-const aGN (Array SortaGa (Maybe SortaGb)))
; (declare-const aGS (Array SortaGa (Maybe SortaGb)))
; (declare-const aGc (Array SortaGa (Maybe SortaGb)))
; (declare-const aGd (Array SortaGa (Maybe SortaGb)))
; (declare-const aGe (Array SortaGa (Maybe SortaGb)))
; (declare-const aGf (Array SortaGa (Maybe SortaGb)))
; (declare-const aGg (Array SortaGa (Maybe SortaGb)))
; (declare-const aGh (Array SortaGa (Maybe SortaGb)))
; (declare-const aGi (Array SortaGa (Maybe SortaGb)))
; (declare-fun either1941175894817123232 ((Maybe SortaGb) (Maybe SortaGb)) (Maybe SortaGb))
; (declare-sort SortaGa)
; (declare-sort SortaGb)
; DECS1 (unseen) 
(declare-sort SortaGa)
(declare-sort SortaGb)
(declare-const
   aGc
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGd
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGe
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGf
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGg
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGh
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGi
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGD
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGI
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGN
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGS
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-fun
   either1941175894817123232
   (
     (Maybe SortaGb)
     (Maybe SortaGb))
   (Maybe SortaGb))
(assert
   (forall
      (
        (y
           (Maybe SortaGb)))
      (=
         (either1941175894817123232
            (as
               nothing
               (Maybe SortaGb))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaGb))
        (y
           (Maybe SortaGb)))
      (=>
         (
           (_
              is
              (just
                 (SortaGb)
                 (Maybe SortaGb)))
           x)
         (=
            (either1941175894817123232 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGd
           aGf)
         aGN)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGe
           aGf)
         aGI)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGh)
         aGS)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either1941175894817123232)
           aGc
           aGd)
         aGD)
      :named
      given-6.4))
(assert
   (!
      (= aGN aGh)
      :named
      given-6.5))
(assert
   (!
      (= aGD aGe)
      :named
      given-6.6))
(assert
   (!
      (= aGI aGg)
      :named
      given-6.7))
(assert
   (!
      (= aGS aGi)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aHk} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      (
;        (_ map either1941175894817123232)
;        aGp
;        aGq)
;      aGs)
;    aGg)

;      [WD] hole{co_aHp} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1941175894817123232)
;      aGp
;      (
;        (_ map either1941175894817123232)
;        aGq
;        aGs))
;    aGi)

; WANTEDS (names)
;  aGg  <=  abc
;  aGi  <=  abc'
;  aGp  <=  a_aGp
;  aGq  <=  b_aGq
;  aGs  <=  c_aGs
; DECS2 (seen) 
; (declare-const aGp (Array SortaGa (Maybe SortaGb)))
; (declare-const aGq (Array SortaGa (Maybe SortaGb)))
; (declare-const aGs (Array SortaGa (Maybe SortaGb)))
; DECS2 (unseen) 
(declare-const
   aGp
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGq
   (Array
      SortaGa
      (Maybe SortaGb)))
(declare-const
   aGs
   (Array
      SortaGa
      (Maybe SortaGb)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 (
                   (_ map either1941175894817123232)
                   aGp
                   aGq)
                 aGs)
               aGg))
         (not
            (=
               (
                 (_ map either1941175894817123232)
                 aGp
                 (
                   (_ map either1941175894817123232)
                   aGq
                   aGs))
               aGi)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      SortaGa!val!0
;      ()
;      SortaGa)
;   (declare-fun
;      SortaGa!val!1
;      ()
;      SortaGa)
;   (forall
;      (
;        (x SortaGa))
;      (or
;         (= x SortaGa!val!0)
;         (= x SortaGa!val!1)))
;   (declare-fun
;      SortaGb!val!2
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!3
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!4
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!1
;      ()
;      SortaGb)
;   (declare-fun
;      SortaGb!val!0
;      ()
;      SortaGb)
;   (forall
;      (
;        (x SortaGb))
;      (or
;         (= x SortaGb!val!2)
;         (= x SortaGb!val!3)
;         (= x SortaGb!val!4)
;         (= x SortaGb!val!1)
;         (= x SortaGb!val!0)))
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
;                      (_ map either1941175894817123232)
;                      (
;                        (_ map either1941175894817123232)
;                        aGp
;                        aGq)
;                      aGs)
;                    aGg)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1941175894817123232)
;                      aGp
;                      (
;                        (_ map either1941175894817123232)
;                        aGq
;                        aGs))
;                    aGi))))
;         (or a!1 a!2)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= aGS aGi))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGd)
;         aGD))
;   (define-fun
;      aGh
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGe
;           aGf)
;         aGI))
;   (define-fun
;      aGD
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         nothing))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!0))
;            SortaGa!val!0
;            (just SortaGb!val!1))
;         SortaGa!val!1
;         (just SortaGb!val!2)))
;   (define-fun
;      aGd
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         nothing))
;   (define-fun
;      aGe
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= aGN aGh))
;   (define-fun
;      aGS
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      aGI
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      aGc
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGi
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      aGp
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGq
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (
;        (as
;           const
;           (Array
;              SortaGa
;              (Maybe SortaGb)))
;        nothing))
;   (define-fun
;      aGN
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGc
;           aGh)
;         aGS))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1941175894817123232)
;           aGd
;           aGf)
;         aGN))
;   (define-fun
;      aGg
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaGa
;                    (Maybe SortaGb)))
;              (just SortaGb!val!4))
;            SortaGa!val!0
;            nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= aGI aGg))
;   (define-fun
;      aGf
;      ()
;      (Array
;         SortaGa
;         (Maybe SortaGb))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGa
;                 (Maybe SortaGb)))
;           nothing)
;         SortaGa!val!1
;         (just SortaGb!val!3)))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= aGD aGe))
;   (define-fun
;      k!100
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         nothing
;         (ite
;            (= x!0 SortaGa!val!1)
;            (just SortaGb!val!3)
;            (just SortaGb!val!4))))
;   (define-fun
;      k!106
;      (
;        (x!0 SortaGa))
;      (Maybe SortaGb)
;      (ite
;         (= x!0 SortaGa!val!0)
;         (just SortaGb!val!1)
;         (ite
;            (= x!0 SortaGa!val!1)
;            (just SortaGb!val!2)
;            (just SortaGb!val!0))))
;   (define-fun
;      either1941175894817123232
;      (
;        (x!0
;           (Maybe SortaGb))
;        (x!1
;           (Maybe SortaGb)))
;      (Maybe SortaGb)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGb!val!4))
;            (= x!1 nothing))
;         (just SortaGb!val!4)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaGb!val!4)))
;            (just SortaGb!val!4)
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
;                        (just SortaGb!val!0)))
;                  (just SortaGb!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaGb!val!1)))
;                     (just SortaGb!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaGb!val!2)))
;                        (just SortaGb!val!2)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaGb!val!3)))
;                           (just SortaGb!val!3)
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
; [G] co_aHY {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aHV {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aHZ {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aI1 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aI6} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aHI,"ok",2],aHX)
; (Alter [Symbol [],Nat [],aHH,"ok",2],aHU)
; (aHX,aHJ)
; (aHU,aHI)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],aHM,"ok",2],aHI)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aI6} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHM
;       "ok"
;       (just 2))
;    aHI)

; GIVENS (names)
;  aHH  <=  m1
;  aHI  <=  m2
;  aHJ  <=  m3
;  aHU  <=  fsk_aHU
;  aHX  <=  fsk_aHX
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aHH (Array String (Maybe Int)))
; (declare-const aHI (Array String (Maybe Int)))
; (declare-const aHJ (Array String (Maybe Int)))
; (declare-const aHU (Array String (Maybe Int)))
; (declare-const aHX (Array String (Maybe Int)))
(declare-const
   aHH
   (Array
      String
      (Maybe Int)))
(declare-const
   aHI
   (Array
      String
      (Maybe Int)))
(declare-const
   aHJ
   (Array
      String
      (Maybe Int)))
(declare-const
   aHU
   (Array
      String
      (Maybe Int)))
(declare-const
   aHX
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aHI
            "ok"
            (just 2))
         aHX)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aHH
            "ok"
            (just 2))
         aHU)
      :named
      given-8.2))
(assert
   (!
      (= aHX aHJ)
      :named
      given-8.3))
(assert
   (!
      (= aHU aHI)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aI6} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHM
;       "ok"
;       (just 2))
;    aHI)

; WANTEDS (names)
;  aHI  <=  m2
;  aHM  <=  m1_aHM
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHM (Array String (Maybe Int)))
(declare-const
   aHM
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aHM
               "ok"
               (just 2))
            aHI))
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
;      (= aHX aHJ))
;   (define-fun
;      aHI
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
;      given-8.4
;      ()
;      Bool
;      (= aHU aHI))
;   (define-fun
;      aHX
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
;      aHH
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
;      aHM
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
;            aHH
;            "ok"
;            (just 2))
;         aHU))
;   (define-fun
;      aHJ
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
;               aHM
;               "ok"
;               (just 2))
;            aHI)))
;   (define-fun
;      aHU
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
;            aHI
;            "ok"
;            (just 2))
;         aHX)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aHY {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aHV {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aHZ {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aI1 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aI6} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aHI,"ok",2],aHX)
; (Alter [Symbol [],Nat [],aHH,"ok",2],aHU)
; (aHX,aHJ)
; (aHU,aHI)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],aHM,"ok",2],aHI)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aI6} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHM
;       "ok"
;       (just 2))
;    aHI)

; GIVENS (names)
;  aHH  <=  m1
;  aHI  <=  m2
;  aHJ  <=  m3
;  aHU  <=  fsk_aHU
;  aHX  <=  fsk_aHX
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aHH (Array String (Maybe Int)))
; (declare-const aHI (Array String (Maybe Int)))
; (declare-const aHJ (Array String (Maybe Int)))
; (declare-const aHU (Array String (Maybe Int)))
; (declare-const aHX (Array String (Maybe Int)))
(declare-const
   aHH
   (Array
      String
      (Maybe Int)))
(declare-const
   aHI
   (Array
      String
      (Maybe Int)))
(declare-const
   aHJ
   (Array
      String
      (Maybe Int)))
(declare-const
   aHU
   (Array
      String
      (Maybe Int)))
(declare-const
   aHX
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aHI
            "ok"
            (just 2))
         aHX)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aHH
            "ok"
            (just 2))
         aHU)
      :named
      given-8.2))
(assert
   (!
      (= aHX aHJ)
      :named
      given-8.3))
(assert
   (!
      (= aHU aHI)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aI6} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHM
;       "ok"
;       (just 2))
;    aHI)

; WANTEDS (names)
;  aHI  <=  m2
;  aHM  <=  m1_aHM
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHM (Array String (Maybe Int)))
(declare-const
   aHM
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aHM
               "ok"
               (just 2))
            aHI))
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
;      (= aHX aHJ))
;   (define-fun
;      aHI
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
;      given-8.4
;      ()
;      Bool
;      (= aHU aHI))
;   (define-fun
;      aHX
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
;      aHH
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
;      aHM
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
;            aHH
;            "ok"
;            (just 2))
;         aHU))
;   (define-fun
;      aHJ
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
;               aHM
;               "ok"
;               (just 2))
;            aHI)))
;   (define-fun
;      aHU
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
;            aHI
;            "ok"
;            (just 2))
;         aHX)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_aIG {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aID {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aIH {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aIJ {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIO} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aIn,aIp,"bob"],aIF)
; (Delete [Symbol [],aIn,aIo,"bob"],aIC)
; (aIF,aIq)
; (aIC,aIp)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aIn,aIu,"bob"],aIp)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_aIO} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aIu
;       "bob"
;       (as
;          nothing
;          (Maybe SortaIn)))
;    aIp)

; GIVENS (names)
;  aIo  <=  m1
;  aIp  <=  m2
;  aIq  <=  m3
;  aIC  <=  fsk_aIC
;  aIF  <=  fsk_aIF
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIC (Array String (Maybe SortaIn)))
; (declare-const aIF (Array String (Maybe SortaIn)))
; (declare-const aIo (Array String (Maybe SortaIn)))
; (declare-const aIp (Array String (Maybe SortaIn)))
; (declare-const aIq (Array String (Maybe SortaIn)))
; (declare-sort SortaIn)
(declare-sort SortaIn)
(declare-const
   aIo
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIp
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIq
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIC
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIF
   (Array
      String
      (Maybe SortaIn)))
(assert
   (!
      (=
         (store
            aIp
            "bob"
            (as
               nothing
               (Maybe SortaIn)))
         aIF)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            aIo
            "bob"
            (as
               nothing
               (Maybe SortaIn)))
         aIC)
      :named
      given-10.2))
(assert
   (!
      (= aIF aIq)
      :named
      given-10.3))
(assert
   (!
      (= aIC aIp)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_aIO} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aIu
;       "bob"
;       (as
;          nothing
;          (Maybe SortaIn)))
;    aIp)

; WANTEDS (names)
;  aIp  <=  m2
;  aIu  <=  m1_aIu
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aIu (Array String (Maybe SortaIn)))
(declare-const
   aIu
   (Array
      String
      (Maybe SortaIn)))
(assert
   (!
      (not
         (=
            (store
               aIu
               "bob"
               (as
                  nothing
                  (Maybe SortaIn)))
            aIp))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      SortaIn!val!1
;      ()
;      SortaIn)
;   (declare-fun
;      SortaIn!val!2
;      ()
;      SortaIn)
;   (declare-fun
;      SortaIn!val!0
;      ()
;      SortaIn)
;   (forall
;      (
;        (x SortaIn))
;      (or
;         (= x SortaIn!val!1)
;         (= x SortaIn!val!2)
;         (= x SortaIn!val!0)))
;   (define-fun
;      aIo
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaIn)))
;           (just SortaIn!val!1))
;         "b"
;         nothing))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store aIp "bob" nothing)
;         aIF))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= aIC aIp))
;   (define-fun
;      aIF
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= aIF aIq))
;   (define-fun
;      aIp
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store aIo "bob" nothing)
;         aIC))
;   (define-fun
;      aIC
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aIq
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aIu
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaIn)))
;           (just SortaIn!val!2))
;         "b"
;         (just SortaIn!val!0)))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store aIu "bob" nothing)
;            aIp))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_aIG {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aID {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aIH {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aIJ {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIO} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aIn,aIp,"bob"],aIF)
; (Delete [Symbol [],aIn,aIo,"bob"],aIC)
; (aIF,aIq)
; (aIC,aIp)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aIn,aIu,"bob"],aIp)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_aIO} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aIu
;       "bob"
;       (as
;          nothing
;          (Maybe SortaIn)))
;    aIp)

; GIVENS (names)
;  aIo  <=  m1
;  aIp  <=  m2
;  aIq  <=  m3
;  aIC  <=  fsk_aIC
;  aIF  <=  fsk_aIF
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIC (Array String (Maybe SortaIn)))
; (declare-const aIF (Array String (Maybe SortaIn)))
; (declare-const aIo (Array String (Maybe SortaIn)))
; (declare-const aIp (Array String (Maybe SortaIn)))
; (declare-const aIq (Array String (Maybe SortaIn)))
; (declare-sort SortaIn)
(declare-sort SortaIn)
(declare-const
   aIo
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIp
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIq
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIC
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aIF
   (Array
      String
      (Maybe SortaIn)))
(assert
   (!
      (=
         (store
            aIp
            "bob"
            (as
               nothing
               (Maybe SortaIn)))
         aIF)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            aIo
            "bob"
            (as
               nothing
               (Maybe SortaIn)))
         aIC)
      :named
      given-10.2))
(assert
   (!
      (= aIF aIq)
      :named
      given-10.3))
(assert
   (!
      (= aIC aIp)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_aIO} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aIu
;       "bob"
;       (as
;          nothing
;          (Maybe SortaIn)))
;    aIp)

; WANTEDS (names)
;  aIp  <=  m2
;  aIu  <=  m1_aIu
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aIu (Array String (Maybe SortaIn)))
(declare-const
   aIu
   (Array
      String
      (Maybe SortaIn)))
(assert
   (!
      (not
         (=
            (store
               aIu
               "bob"
               (as
                  nothing
                  (Maybe SortaIn)))
            aIp))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      SortaIn!val!1
;      ()
;      SortaIn)
;   (declare-fun
;      SortaIn!val!2
;      ()
;      SortaIn)
;   (declare-fun
;      SortaIn!val!0
;      ()
;      SortaIn)
;   (forall
;      (
;        (x SortaIn))
;      (or
;         (= x SortaIn!val!1)
;         (= x SortaIn!val!2)
;         (= x SortaIn!val!0)))
;   (define-fun
;      aIo
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaIn)))
;           (just SortaIn!val!1))
;         "b"
;         nothing))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store aIp "bob" nothing)
;         aIF))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= aIC aIp))
;   (define-fun
;      aIF
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= aIF aIq))
;   (define-fun
;      aIp
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store aIo "bob" nothing)
;         aIC))
;   (define-fun
;      aIC
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aIq
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaIn)))
;              (just SortaIn!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aIu
;      ()
;      (Array
;         String
;         (Maybe SortaIn))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaIn)))
;           (just SortaIn!val!2))
;         "b"
;         (just SortaIn!val!0)))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store aIu "bob" nothing)
;            aIp))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aKf} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                         ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_aKf} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                              ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
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
;      [WD] hole{co_aKf} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                              ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
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
; [G] co_aKy {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aKt {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aKD {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aKo {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aKz {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aKp {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aKu {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aKE {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJg} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aJ0,aJ1,aJ3,aJ5],aKx)
; (IntersectL [aJ0,aJ1,aJ4,aJ5],aKs)
; (IntersectL [aJ0,aJ1,aJ2,aJ7],aKC)
; (IntersectL [aJ0,aJ1,aJ2,aJ3],aKn)
; (aKx,aJ7)
; (aKn,aJ4)
; (aKs,aJ6)
; (aKC,aJ8)

; WANTEDS (Thoralf style)
; (aJ6,aJ8)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_aJg} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aJ6 aJ8)

; GIVENS (names)
;  aJ2  <=  a
;  aJ3  <=  b
;  aJ4  <=  ab
;  aJ5  <=  c
;  aJ6  <=  abc
;  aJ7  <=  bc
;  aJ8  <=  abc'
;  aKn  <=  fsk_aKn
;  aKs  <=  fsk_aKs
;  aKx  <=  fsk_aKx
;  aKC  <=  fsk_aKC
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaJ1)) (y (Maybe SortaJ1))) (=> (and ((_ is (just (SortaJ1) (Maybe SortaJ1))) x) ((_ is (just (SortaJ1) (Maybe SortaJ1))) y)) (= (both1944031326515019532 x y) x))))
; (assert (forall ((y (Maybe SortaJ1))) (= (both1944031326515019532 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaJ1))) (= (both1944031326515019532 y (as nothing (Maybe SortaJ1))) (as nothing (Maybe SortaJ1)))))
; (declare-const aJ2 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aJ3 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aJ4 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aJ5 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aJ6 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aJ7 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aJ8 (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aKC (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aKn (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aKs (Array SortaJ0 (Maybe SortaJ1)))
; (declare-const aKx (Array SortaJ0 (Maybe SortaJ1)))
; (declare-fun both1944031326515019532 ((Maybe SortaJ1) (Maybe SortaJ1)) (Maybe SortaJ1))
; (declare-sort SortaJ0)
; (declare-sort SortaJ1)
(declare-sort SortaJ0)
(declare-sort SortaJ1)
(declare-const
   aJ2
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aJ3
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aJ4
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aJ5
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aJ6
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aJ7
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aJ8
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aKn
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aKs
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aKx
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-const
   aKC
   (Array
      SortaJ0
      (Maybe SortaJ1)))
(declare-fun
   both1944031326515019532
   (
     (Maybe SortaJ1)
     (Maybe SortaJ1))
   (Maybe SortaJ1))
(assert
   (forall
      (
        (y
           (Maybe SortaJ1)))
      (=
         (both1944031326515019532
            y
            (as
               nothing
               (Maybe SortaJ1)))
         (as
            nothing
            (Maybe SortaJ1)))))
(assert
   (forall
      (
        (y
           (Maybe SortaJ1)))
      (=
         (both1944031326515019532 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaJ1))
        (y
           (Maybe SortaJ1)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaJ1)
                    (Maybe SortaJ1)))
              x)
            (
              (_
                 is
                 (just
                    (SortaJ1)
                    (Maybe SortaJ1)))
              y))
         (=
            (both1944031326515019532 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1944031326515019532)
           aJ3
           aJ5)
         aKx)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both1944031326515019532)
           aJ4
           aJ5)
         aKs)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both1944031326515019532)
           aJ2
           aJ7)
         aKC)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both1944031326515019532)
           aJ2
           aJ3)
         aKn)
      :named
      given-13.4))
(assert
   (!
      (= aKx aJ7)
      :named
      given-13.5))
(assert
   (!
      (= aKn aJ4)
      :named
      given-13.6))
(assert
   (!
      (= aKs aJ6)
      :named
      given-13.7))
(assert
   (!
      (= aKC aJ8)
      :named
      given-13.8))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_aJg} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aJ6 aJ8)

; WANTEDS (names)
;  aJ6  <=  abc
;  aJ8  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aJ6 aJ8))
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
;           (Maybe SortaJ1)))
;      (=
;         (both1944031326515019532
;            y
;            (as
;               nothing
;               (Maybe SortaJ1)))
;         (as
;            nothing
;            (Maybe SortaJ1))))
;   (forall
;      (
;        (y
;           (Maybe SortaJ1)))
;      (=
;         (both1944031326515019532 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe SortaJ1))
;        (y
;           (Maybe SortaJ1)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (SortaJ1)
;                    (Maybe SortaJ1)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (SortaJ1)
;                    (Maybe SortaJ1)))
;              y))
;         (=
;            (both1944031326515019532 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both1944031326515019532)
;           aJ3
;           aJ5)
;         aKx)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map both1944031326515019532)
;           aJ4
;           aJ5)
;         aKs)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map both1944031326515019532)
;           aJ2
;           aJ7)
;         aKC)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map both1944031326515019532)
;           aJ2
;           aJ3)
;         aKn)
;      :named
;      given-13.4)
;   (!
;      (= aKx aJ7)
;      :named
;      given-13.5)
;   (!
;      (= aKn aJ4)
;      :named
;      given-13.6)
;   (!
;      (= aKs aJ6)
;      :named
;      given-13.7)
;   (!
;      (= aKC aJ8)
;      :named
;      given-13.8)
;   (!
;      (not
;         (= aJ6 aJ8))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1
;    given-13.5
;    given-13.2
;    given-13.4
;    given-13.8
;    given-13.6
;    given-13.3
;    wanted-13
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
; [G] co_aKS {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aKN {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aKX {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aKI {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aKT {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aKJ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aKO {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aKY {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJy} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aJi,aJj,aJl,aJn],aKR)
; (UnionL [aJi,aJj,aJm,aJn],aKM)
; (UnionL [aJi,aJj,aJk,aJp],aKW)
; (UnionL [aJi,aJj,aJk,aJl],aKH)
; (aKR,aJp)
; (aKH,aJm)
; (aKM,aJo)
; (aKW,aJq)

; WANTEDS (Thoralf style)
; (aJo,aJq)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_aJy} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aJo aJq)

; GIVENS (names)
;  aJk  <=  a
;  aJl  <=  b
;  aJm  <=  ab
;  aJn  <=  c
;  aJo  <=  abc
;  aJp  <=  bc
;  aJq  <=  abc'
;  aKH  <=  fsk_aKH
;  aKM  <=  fsk_aKM
;  aKR  <=  fsk_aKR
;  aKW  <=  fsk_aKW
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaJj)) (y (Maybe SortaJj))) (=> ((_ is (just (SortaJj) (Maybe SortaJj))) x) (= (either1943970853375467921 x y) x))))
; (assert (forall ((y (Maybe SortaJj))) (= (either1943970853375467921 (as nothing (Maybe SortaJj)) y) y)))
; (declare-const aJk (Array SortaJi (Maybe SortaJj)))
; (declare-const aJl (Array SortaJi (Maybe SortaJj)))
; (declare-const aJm (Array SortaJi (Maybe SortaJj)))
; (declare-const aJn (Array SortaJi (Maybe SortaJj)))
; (declare-const aJo (Array SortaJi (Maybe SortaJj)))
; (declare-const aJp (Array SortaJi (Maybe SortaJj)))
; (declare-const aJq (Array SortaJi (Maybe SortaJj)))
; (declare-const aKH (Array SortaJi (Maybe SortaJj)))
; (declare-const aKM (Array SortaJi (Maybe SortaJj)))
; (declare-const aKR (Array SortaJi (Maybe SortaJj)))
; (declare-const aKW (Array SortaJi (Maybe SortaJj)))
; (declare-fun either1943970853375467921 ((Maybe SortaJj) (Maybe SortaJj)) (Maybe SortaJj))
; (declare-sort SortaJi)
; (declare-sort SortaJj)
(declare-sort SortaJi)
(declare-sort SortaJj)
(declare-const
   aJk
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aJl
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aJm
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aJn
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aJo
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aJp
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aJq
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aKH
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aKM
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aKR
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-const
   aKW
   (Array
      SortaJi
      (Maybe SortaJj)))
(declare-fun
   either1943970853375467921
   (
     (Maybe SortaJj)
     (Maybe SortaJj))
   (Maybe SortaJj))
(assert
   (forall
      (
        (y
           (Maybe SortaJj)))
      (=
         (either1943970853375467921
            (as
               nothing
               (Maybe SortaJj))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaJj))
        (y
           (Maybe SortaJj)))
      (=>
         (
           (_
              is
              (just
                 (SortaJj)
                 (Maybe SortaJj)))
           x)
         (=
            (either1943970853375467921 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1943970853375467921)
           aJl
           aJn)
         aKR)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either1943970853375467921)
           aJm
           aJn)
         aKM)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either1943970853375467921)
           aJk
           aJp)
         aKW)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either1943970853375467921)
           aJk
           aJl)
         aKH)
      :named
      given-15.4))
(assert
   (!
      (= aKR aJp)
      :named
      given-15.5))
(assert
   (!
      (= aKH aJm)
      :named
      given-15.6))
(assert
   (!
      (= aKM aJo)
      :named
      given-15.7))
(assert
   (!
      (= aKW aJq)
      :named
      given-15.8))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_aJy} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aJo aJq)

; WANTEDS (names)
;  aJo  <=  abc
;  aJq  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aJo aJq))
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
;           (Maybe SortaJj)))
;      (=
;         (either1943970853375467921
;            (as
;               nothing
;               (Maybe SortaJj))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe SortaJj))
;        (y
;           (Maybe SortaJj)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (SortaJj)
;                 (Maybe SortaJj)))
;           x)
;         (=
;            (either1943970853375467921 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either1943970853375467921)
;           aJl
;           aJn)
;         aKR)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_ map either1943970853375467921)
;           aJm
;           aJn)
;         aKM)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_ map either1943970853375467921)
;           aJk
;           aJp)
;         aKW)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_ map either1943970853375467921)
;           aJk
;           aJl)
;         aKH)
;      :named
;      given-15.4)
;   (!
;      (= aKR aJp)
;      :named
;      given-15.5)
;   (!
;      (= aKH aJm)
;      :named
;      given-15.6)
;   (!
;      (= aKM aJo)
;      :named
;      given-15.7)
;   (!
;      (= aKW aJq)
;      :named
;      given-15.8)
;   (!
;      (not
;         (= aJo aJq))
;      :named
;      wanted-15))
(get-unsat-core)
; (wanted-15
;    given-15.2
;    given-15.4
;    given-15.7
;    given-15.8
;    given-15.6
;    given-15.5
;    given-15.1
;    given-15.3)
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
; [G] co_aL5 {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aL2 {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aL6 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aL8 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJI} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aJB,"ok",2],aL4)
; (Alter [Symbol [],Nat [],aJA,"ok",2],aL1)
; (aL4,aJC)
; (aL1,aJB)

; WANTEDS (Thoralf style)
; (aJB,aJC)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_aJI} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aJB aJC)

; GIVENS (names)
;  aJA  <=  m1
;  aJB  <=  m2
;  aJC  <=  m3
;  aL1  <=  fsk_aL1
;  aL4  <=  fsk_aL4
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aJA (Array String (Maybe Int)))
; (declare-const aJB (Array String (Maybe Int)))
; (declare-const aJC (Array String (Maybe Int)))
; (declare-const aL1 (Array String (Maybe Int)))
; (declare-const aL4 (Array String (Maybe Int)))
(declare-const
   aJA
   (Array
      String
      (Maybe Int)))
(declare-const
   aJB
   (Array
      String
      (Maybe Int)))
(declare-const
   aJC
   (Array
      String
      (Maybe Int)))
(declare-const
   aL1
   (Array
      String
      (Maybe Int)))
(declare-const
   aL4
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aJB
            "ok"
            (just 2))
         aL4)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            aJA
            "ok"
            (just 2))
         aL1)
      :named
      given-17.2))
(assert
   (!
      (= aL4 aJC)
      :named
      given-17.3))
(assert
   (!
      (= aL1 aJB)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_aJI} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aJB aJC)

; WANTEDS (names)
;  aJB  <=  m2
;  aJC  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aJB aJC))
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
;            aJB
;            "ok"
;            (just 2))
;         aL4)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            aJA
;            "ok"
;            (just 2))
;         aL1)
;      :named
;      given-17.2)
;   (!
;      (= aL4 aJC)
;      :named
;      given-17.3)
;   (!
;      (= aL1 aJB)
;      :named
;      given-17.4)
;   (!
;      (not
;         (= aJB aJC))
;      :named
;      wanted-17))
(get-unsat-core)
; (wanted-17 given-17.1 given-17.4 given-17.2 given-17.3)
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
; [G] co_aLf {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aLc {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aLg {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aLi {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJT} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aJK,aJM,"bob"],aLe)
; (Delete [Symbol [],aJK,aJL,"bob"],aLb)
; (aLe,aJN)
; (aLb,aJM)

; WANTEDS (Thoralf style)
; (aJM,aJN)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_aJT} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aJM aJN)

; GIVENS (names)
;  aJL  <=  m1
;  aJM  <=  m2
;  aJN  <=  m3
;  aLb  <=  fsk_aLb
;  aLe  <=  fsk_aLe
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aJL (Array String (Maybe SortaJK)))
; (declare-const aJM (Array String (Maybe SortaJK)))
; (declare-const aJN (Array String (Maybe SortaJK)))
; (declare-const aLb (Array String (Maybe SortaJK)))
; (declare-const aLe (Array String (Maybe SortaJK)))
; (declare-sort SortaJK)
(declare-sort SortaJK)
(declare-const
   aJL
   (Array
      String
      (Maybe SortaJK)))
(declare-const
   aJM
   (Array
      String
      (Maybe SortaJK)))
(declare-const
   aJN
   (Array
      String
      (Maybe SortaJK)))
(declare-const
   aLb
   (Array
      String
      (Maybe SortaJK)))
(declare-const
   aLe
   (Array
      String
      (Maybe SortaJK)))
(assert
   (!
      (=
         (store
            aJM
            "bob"
            (as
               nothing
               (Maybe SortaJK)))
         aLe)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            aJL
            "bob"
            (as
               nothing
               (Maybe SortaJK)))
         aLb)
      :named
      given-19.2))
(assert
   (!
      (= aLe aJN)
      :named
      given-19.3))
(assert
   (!
      (= aLb aJM)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_aJT} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aJM aJN)

; WANTEDS (names)
;  aJM  <=  m2
;  aJN  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aJM aJN))
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
;            aJM
;            "bob"
;            (as
;               nothing
;               (Maybe SortaJK)))
;         aLe)
;      :named
;      given-19.1)
;   (!
;      (=
;         (store
;            aJL
;            "bob"
;            (as
;               nothing
;               (Maybe SortaJK)))
;         aLb)
;      :named
;      given-19.2)
;   (!
;      (= aLe aJN)
;      :named
;      given-19.3)
;   (!
;      (= aLb aJM)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= aJM aJN))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.1 given-19.3 wanted-19 given-19.4 given-19.2)
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")
(echo "solver-finish-cycle-19")
(exit)
(exit)
; [2 of 4] Compiling Nat
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
; [WD] hole{co_a27w} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a27f,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a27w} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27f
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
;      [WD] hole{co_a27w} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27f
;    (lit "63A"))

; WANTEDS (names)
;  a27f  <=  t_a27f
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a27f Type)
(declare-const a27f Type)
(assert
   (!
      (not
         (=
            a27f
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
;            a27f
;            (lit "63A"))))
;   (define-fun
;      a27f
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
; [WD] hole{co_a27w} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a27f,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a27w} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27f
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
;      [WD] hole{co_a27w} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27f
;    (lit "63A"))

; WANTEDS (names)
;  a27f  <=  t_a27f
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a27f Type)
(declare-const a27f Type)
(assert
   (!
      (not
         (=
            a27f
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
;            a27f
;            (lit "63A"))))
;   (define-fun
;      a27f
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
; [WD] hole{co_a27S} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a27N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a27X} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a27z,a27A],<? [a27C,a27D])
; (<? [a27B,a27D],<? [a27y,a27A])
; (<? [a27y,a27z],<? [a27B,a27C])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a27S} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27z a27A)
;    (< a27C a27D))

;      [WD] hole{co_a27N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27B a27D)
;    (< a27y a27A))

;      [WD] hole{co_a27X} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27y a27z)
;    (< a27B a27C))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a27S} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27z a27A)
;    (< a27C a27D))

;      [WD] hole{co_a27N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27B a27D)
;    (< a27y a27A))

;      [WD] hole{co_a27X} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27y a27z)
;    (< a27B a27C))

; WANTEDS (names)
;  a27y  <=  a
;  a27z  <=  b
;  a27A  <=  c
;  a27B  <=  a_a27B
;  a27C  <=  b_a27C
;  a27D  <=  c_a27D
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a27A))
; (assert (<= 0 a27B))
; (assert (<= 0 a27C))
; (assert (<= 0 a27D))
; (assert (<= 0 a27y))
; (assert (<= 0 a27z))
; (declare-const a27A Int)
; (declare-const a27B Int)
; (declare-const a27C Int)
; (declare-const a27D Int)
; (declare-const a27y Int)
; (declare-const a27z Int)
(declare-const a27y Int)
(declare-const a27z Int)
(declare-const a27A Int)
(declare-const a27B Int)
(declare-const a27C Int)
(declare-const a27D Int)
(assert
   (<= 0 a27y))
(assert
   (<= 0 a27z))
(assert
   (<= 0 a27A))
(assert
   (<= 0 a27B))
(assert
   (<= 0 a27C))
(assert
   (<= 0 a27D))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a27z a27A)
                  (< a27C a27D)))
            (not
               (=
                  (< a27B a27D)
                  (< a27y a27A))))
         (not
            (=
               (< a27y a27z)
               (< a27B a27C))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a27z
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
;               (< a27z a27A)
;               (< a27C a27D)))
;         (not
;            (=
;               (< a27B a27D)
;               (< a27y a27A)))
;         (not
;            (=
;               (< a27y a27z)
;               (< a27B a27C)))))
;   (define-fun
;      a27A
;      ()
;      Int
;      0)
;   (define-fun
;      a27B
;      ()
;      Int
;      0)
;   (define-fun
;      a27y
;      ()
;      Int
;      0)
;   (define-fun
;      a27C
;      ()
;      Int
;      1)
;   (define-fun
;      a27D
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a27S} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a27N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a27X} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a27z,a27A],<? [a27C,a27D])
; (<? [a27B,a27D],<? [a27y,a27A])
; (<? [a27y,a27z],<? [a27B,a27C])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a27S} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27z a27A)
;    (< a27C a27D))

;      [WD] hole{co_a27N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27B a27D)
;    (< a27y a27A))

;      [WD] hole{co_a27X} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27y a27z)
;    (< a27B a27C))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a27S} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27z a27A)
;    (< a27C a27D))

;      [WD] hole{co_a27N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27B a27D)
;    (< a27y a27A))

;      [WD] hole{co_a27X} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27y a27z)
;    (< a27B a27C))

; WANTEDS (names)
;  a27y  <=  a
;  a27z  <=  b
;  a27A  <=  c
;  a27B  <=  a_a27B
;  a27C  <=  b_a27C
;  a27D  <=  c_a27D
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a27A))
; (assert (<= 0 a27B))
; (assert (<= 0 a27C))
; (assert (<= 0 a27D))
; (assert (<= 0 a27y))
; (assert (<= 0 a27z))
; (declare-const a27A Int)
; (declare-const a27B Int)
; (declare-const a27C Int)
; (declare-const a27D Int)
; (declare-const a27y Int)
; (declare-const a27z Int)
(declare-const a27y Int)
(declare-const a27z Int)
(declare-const a27A Int)
(declare-const a27B Int)
(declare-const a27C Int)
(declare-const a27D Int)
(assert
   (<= 0 a27y))
(assert
   (<= 0 a27z))
(assert
   (<= 0 a27A))
(assert
   (<= 0 a27B))
(assert
   (<= 0 a27C))
(assert
   (<= 0 a27D))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a27z a27A)
                  (< a27C a27D)))
            (not
               (=
                  (< a27B a27D)
                  (< a27y a27A))))
         (not
            (=
               (< a27y a27z)
               (< a27B a27C))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a27z
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
;               (< a27z a27A)
;               (< a27C a27D)))
;         (not
;            (=
;               (< a27B a27D)
;               (< a27y a27A)))
;         (not
;            (=
;               (< a27y a27z)
;               (< a27B a27C)))))
;   (define-fun
;      a27A
;      ()
;      Int
;      0)
;   (define-fun
;      a27B
;      ()
;      Int
;      0)
;   (define-fun
;      a27y
;      ()
;      Int
;      0)
;   (define-fun
;      a27C
;      ()
;      Int
;      1)
;   (define-fun
;      a27D
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a28v} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a28A} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a28l,a28m],+ [a28j,a28k])
; (+ [a28m,a28l],+ [a28k,a28j])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a28v} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28l a28m)
;    (+ a28j a28k))

;      [WD] hole{co_a28A} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28m a28l)
;    (+ a28k a28j))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a28v} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28l a28m)
;    (+ a28j a28k))

;      [WD] hole{co_a28A} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28m a28l)
;    (+ a28k a28j))

; WANTEDS (names)
;  a28j  <=  a
;  a28k  <=  b
;  a28l  <=  a_a28l
;  a28m  <=  b_a28m
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a28j))
; (assert (<= 0 a28k))
; (assert (<= 0 a28l))
; (assert (<= 0 a28m))
; (declare-const a28j Int)
; (declare-const a28k Int)
; (declare-const a28l Int)
; (declare-const a28m Int)
(declare-const a28j Int)
(declare-const a28k Int)
(declare-const a28l Int)
(declare-const a28m Int)
(assert
   (<= 0 a28j))
(assert
   (<= 0 a28k))
(assert
   (<= 0 a28l))
(assert
   (<= 0 a28m))
(assert
   (!
      (or
         (not
            (=
               (+ a28l a28m)
               (+ a28j a28k)))
         (not
            (=
               (+ a28m a28l)
               (+ a28k a28j))))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      a28l
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a28l a28m)
;               (+ a28j a28k)))
;         (not
;            (=
;               (+ a28m a28l)
;               (+ a28k a28j)))))
;   (define-fun
;      a28k
;      ()
;      Int
;      0)
;   (define-fun
;      a28j
;      ()
;      Int
;      0)
;   (define-fun
;      a28m
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a28v} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a28A} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a28l,a28m],+ [a28j,a28k])
; (+ [a28m,a28l],+ [a28k,a28j])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a28v} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28l a28m)
;    (+ a28j a28k))

;      [WD] hole{co_a28A} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28m a28l)
;    (+ a28k a28j))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a28v} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28l a28m)
;    (+ a28j a28k))

;      [WD] hole{co_a28A} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28m a28l)
;    (+ a28k a28j))

; WANTEDS (names)
;  a28j  <=  a
;  a28k  <=  b
;  a28l  <=  a_a28l
;  a28m  <=  b_a28m
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a28j))
; (assert (<= 0 a28k))
; (assert (<= 0 a28l))
; (assert (<= 0 a28m))
; (declare-const a28j Int)
; (declare-const a28k Int)
; (declare-const a28l Int)
; (declare-const a28m Int)
(declare-const a28j Int)
(declare-const a28k Int)
(declare-const a28l Int)
(declare-const a28m Int)
(assert
   (<= 0 a28j))
(assert
   (<= 0 a28k))
(assert
   (<= 0 a28l))
(assert
   (<= 0 a28m))
(assert
   (!
      (or
         (not
            (=
               (+ a28l a28m)
               (+ a28j a28k)))
         (not
            (=
               (+ a28m a28l)
               (+ a28k a28j))))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      a28l
;      ()
;      Int
;      1)
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a28l a28m)
;               (+ a28j a28k)))
;         (not
;            (=
;               (+ a28m a28l)
;               (+ a28k a28j)))))
;   (define-fun
;      a28k
;      ()
;      Int
;      0)
;   (define-fun
;      a28j
;      ()
;      Int
;      0)
;   (define-fun
;      a28m
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
; [G] co_a2fo {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fr {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fp {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a2fs {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2fy} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a297],a2fn)
; (+ [1,a299],a2fq)
; (a2fn,a28V)
; (a2fq,a28W)

; WANTEDS (Thoralf style)
; (- [a299,a297],- [a28W,a28V])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a2fy} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a299 a297)
;    (- a28W a28V))

; GIVENS (names)
;  a28V  <=  n
;  a28W  <=  m
;  a297  <=  n
;  a299  <=  n
;  a2fn  <=  fsk_a2fn
;  a2fq  <=  fsk_a2fq
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a28V))
; (assert (<= 0 a28W))
; (assert (<= 0 a297))
; (assert (<= 0 a299))
; (assert (<= 0 a2fn))
; (assert (<= 0 a2fq))
; (declare-const a28V Int)
; (declare-const a28W Int)
; (declare-const a297 Int)
; (declare-const a299 Int)
; (declare-const a2fn Int)
; (declare-const a2fq Int)
(declare-const a28V Int)
(declare-const a28W Int)
(declare-const a297 Int)
(declare-const a299 Int)
(declare-const a2fn Int)
(declare-const a2fq Int)
(assert
   (<= 0 a28V))
(assert
   (<= 0 a28W))
(assert
   (<= 0 a297))
(assert
   (<= 0 a299))
(assert
   (<= 0 a2fn))
(assert
   (<= 0 a2fq))
(assert
   (!
      (=
         (+ 1 a297)
         a2fn)
      :named
      given-10.1))
(assert
   (!
      (=
         (+ 1 a299)
         a2fq)
      :named
      given-10.2))
(assert
   (!
      (= a2fn a28V)
      :named
      given-10.3))
(assert
   (!
      (= a2fq a28W)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a2fy} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a299 a297)
;    (- a28W a28V))

; WANTEDS (names)
;  a28V  <=  n
;  a28W  <=  m
;  a297  <=  n
;  a299  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a299 a297)
            (- a28W a28V)))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (<= 0 a28V)
;   (<= 0 a28W)
;   (<= 0 a297)
;   (<= 0 a299)
;   (<= 0 a2fn)
;   (<= 0 a2fq)
;   (!
;      (=
;         (+ 1 a297)
;         a2fn)
;      :named
;      given-10.1)
;   (!
;      (=
;         (+ 1 a299)
;         a2fq)
;      :named
;      given-10.2)
;   (!
;      (= a2fn a28V)
;      :named
;      given-10.3)
;   (!
;      (= a2fq a28W)
;      :named
;      given-10.4)
;   (!
;      (not
;         (=
;            (- a299 a297)
;            (- a28W a28V)))
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
; [G] co_a2fM {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fN {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2fV} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2a3],a2fL)
; (a2fL,a29W)

; WANTEDS (Thoralf style)
; (+ [1,+ [a2a3,a29Y]],+ [a29W,a29Y])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a2fV} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2a3 a29Y))
;    (+ a29W a29Y))

; GIVENS (names)
;  a29W  <=  n
;  a2a3  <=  n
;  a2fL  <=  fsk_a2fL
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a29W))
; (assert (<= 0 a2a3))
; (assert (<= 0 a2fL))
; (declare-const a29W Int)
; (declare-const a2a3 Int)
; (declare-const a2fL Int)
(declare-const a29W Int)
(declare-const a2a3 Int)
(declare-const a2fL Int)
(assert
   (<= 0 a29W))
(assert
   (<= 0 a2a3))
(assert
   (<= 0 a2fL))
(assert
   (!
      (=
         (+ 1 a2a3)
         a2fL)
      :named
      given-17.1))
(assert
   (!
      (= a2fL a29W)
      :named
      given-17.2))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a2fV} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2a3 a29Y))
;    (+ a29W a29Y))

; WANTEDS (names)
;  a29W  <=  n
;  a29Y  <=  m
;  a2a3  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a29Y))
; (declare-const a29Y Int)
(declare-const a29Y Int)
(assert
   (<= 0 a29Y))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a2a3 a29Y))
            (+ a29W a29Y)))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (<= 0 a29W)
;   (<= 0 a2a3)
;   (<= 0 a2fL)
;   (!
;      (=
;         (+ 1 a2a3)
;         a2fL)
;      :named
;      given-17.1)
;   (!
;      (= a2fL a29W)
;      :named
;      given-17.2)
;   (<= 0 a29Y)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a2a3 a29Y))
;            (+ a29W a29Y)))
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
; [G] co_a2fX {1}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a2g0 {1}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a2fY {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a2g1 {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2g5} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a2dC,a2dD],a2fW)
; (<? [a2dD,a2dE],a2fZ)
; (a2fW,True [])
; (a2fZ,True [])

; WANTEDS (Thoralf style)
; (<? [a2dC,a2dE],True [])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{co_a2g5} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a2dC a2dE)
;    true)

; GIVENS (names)
;  a2dC  <=  a
;  a2dD  <=  b
;  a2dE  <=  c
;  a2fW  <=  fsk_a2fW
;  a2fZ  <=  fsk_a2fZ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2dC))
; (assert (<= 0 a2dD))
; (assert (<= 0 a2dE))
; (declare-const a2dC Int)
; (declare-const a2dD Int)
; (declare-const a2dE Int)
; (declare-const a2fW Bool)
; (declare-const a2fZ Bool)
(declare-const a2dC Int)
(declare-const a2dD Int)
(declare-const a2dE Int)
(declare-const a2fW Bool)
(declare-const a2fZ Bool)
(assert
   (<= 0 a2dC))
(assert
   (<= 0 a2dD))
(assert
   (<= 0 a2dE))
(assert
   (!
      (=
         (< a2dC a2dD)
         a2fW)
      :named
      given-20.1))
(assert
   (!
      (=
         (< a2dD a2dE)
         a2fZ)
      :named
      given-20.2))
(assert
   (!
      (= a2fW true)
      :named
      given-20.3))
(assert
   (!
      (= a2fZ true)
      :named
      given-20.4))
(check-sat)
; sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{co_a2g5} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a2dC a2dE)
;    true)

; WANTEDS (names)
;  a2dC  <=  a
;  a2dE  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a2dC a2dE)
            true))
      :named
      wanted-20))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-20")
(get-assertions)
; (
;   (<= 0 a2dC)
;   (<= 0 a2dD)
;   (<= 0 a2dE)
;   (!
;      (=
;         (< a2dC a2dD)
;         a2fW)
;      :named
;      given-20.1)
;   (!
;      (=
;         (< a2dD a2dE)
;         a2fZ)
;      :named
;      given-20.2)
;   (!
;      (= a2fW true)
;      :named
;      given-20.3)
;   (!
;      (= a2fZ true)
;      :named
;      given-20.4)
;   (!
;      (not
;         (=
;            (< a2dC a2dE)
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
; [G] co_a2g9 {1}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a2g7 {1}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a2dR {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2dU} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a2dO,a2dP],a2g8)
; (+ [a2dO,a2dO],a2g6)
; (a2g6,a2g8)

; WANTEDS (Thoralf style)
; (a2dO,a2dP)

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a2dU} {0}:: a ~ b (CNonCanonical)
;  =>  (= a2dO a2dP)

; GIVENS (names)
;  a2dO  <=  a
;  a2dP  <=  b
;  a2g6  <=  fsk_a2g6
;  a2g8  <=  fsk_a2g8
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2dO))
; (assert (<= 0 a2dP))
; (assert (<= 0 a2g6))
; (assert (<= 0 a2g8))
; (declare-const a2dO Int)
; (declare-const a2dP Int)
; (declare-const a2g6 Int)
; (declare-const a2g8 Int)
(declare-const a2dO Int)
(declare-const a2dP Int)
(declare-const a2g6 Int)
(declare-const a2g8 Int)
(assert
   (<= 0 a2dO))
(assert
   (<= 0 a2dP))
(assert
   (<= 0 a2g6))
(assert
   (<= 0 a2g8))
(assert
   (!
      (=
         (+ a2dO a2dP)
         a2g8)
      :named
      given-22.1))
(assert
   (!
      (=
         (+ a2dO a2dO)
         a2g6)
      :named
      given-22.2))
(assert
   (!
      (= a2g6 a2g8)
      :named
      given-22.3))
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a2dU} {0}:: a ~ b (CNonCanonical)
;  =>  (= a2dO a2dP)

; WANTEDS (names)
;  a2dO  <=  a
;  a2dP  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a2dO a2dP))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a2dO)
;   (<= 0 a2dP)
;   (<= 0 a2g6)
;   (<= 0 a2g8)
;   (!
;      (=
;         (+ a2dO a2dP)
;         a2g8)
;      :named
;      given-22.1)
;   (!
;      (=
;         (+ a2dO a2dO)
;         a2g6)
;      :named
;      given-22.2)
;   (!
;      (= a2g6 a2g8)
;      :named
;      given-22.3)
;   (!
;      (not
;         (= a2dO a2dP))
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
; [WD] hole{co_a2gd} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2dX,a2dY],+ [a2dY,a2dX])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a2gd} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2dX a2dY)
;    (+ a2dY a2dX))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a2gd} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2dX a2dY)
;    (+ a2dY a2dX))

; WANTEDS (names)
;  a2dX  <=  a
;  a2dY  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2dX))
; (assert (<= 0 a2dY))
; (declare-const a2dX Int)
; (declare-const a2dY Int)
(declare-const a2dX Int)
(declare-const a2dY Int)
(assert
   (<= 0 a2dX))
(assert
   (<= 0 a2dY))
(assert
   (!
      (not
         (=
            (+ a2dX a2dY)
            (+ a2dY a2dX)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a2dX)
;   (<= 0 a2dY)
;   (!
;      (not
;         (=
;            (+ a2dX a2dY)
;            (+ a2dY a2dX)))
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
; [WD] hole{co_a2gl} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2e5,1],+ [1,a2e5])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{co_a2gl} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a2e5 1)
;    (+ 1 a2e5))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
;      [WD] hole{co_a2gl} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a2e5 1)
;    (+ 1 a2e5))

; WANTEDS (names)
;  a2e5  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2e5))
; (declare-const a2e5 Int)
(declare-const a2e5 Int)
(assert
   (<= 0 a2e5))
(assert
   (!
      (not
         (=
            (+ a2e5 1)
            (+ 1 a2e5)))
      :named
      wanted-24))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-24")
(get-assertions)
; (
;   (<= 0 a2e5)
;   (!
;      (not
;         (=
;            (+ a2e5 1)
;            (+ 1 a2e5)))
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
; [3 of 4] Compiling RowTypes
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
; [WD] hole{co_a3By} {1}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a3Bm} {1}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a3By} {1}:: Alter
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

;      [WD] hole{co_a3Bm} {1}:: Alter
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
;      [WD] hole{co_a3By} {1}:: Alter
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

;      [WD] hole{co_a3Bm} {1}:: Alter
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
; [G] co_a3C5 {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3Ca {1}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] co_a3C6 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Cb {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Cg} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zq,"price",Int []],a3C4)
; (Delete [Symbol [],TYPE [LiftedRep []],a3zt,a3zu],a3C9)
; (a3C4,a3zq)
; (a3C9,a3zq)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zt,"price",Int []],a3zt)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a3Cg} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zt
;       "price"
;       (just
;          (lit "3u")))
;    a3zt)

; GIVENS (names)
;  a3zq  <=  m
;  a3zt  <=  m
;  a3zu  <=  field
;  a3C4  <=  fsk_a3C4
;  a3C9  <=  fsk_a3C9
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a3C4 (Array String (Maybe Type)))
; (declare-const a3C9 (Array String (Maybe Type)))
; (declare-const a3zq (Array String (Maybe Type)))
; (declare-const a3zt (Array String (Maybe Type)))
; (declare-const a3zu String)
(declare-const
   a3zq
   (Array
      String
      (Maybe Type)))
(declare-const
   a3zt
   (Array
      String
      (Maybe Type)))
(declare-const a3zu String)
(declare-const
   a3C4
   (Array
      String
      (Maybe Type)))
(declare-const
   a3C9
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a3zq
            "price"
            (just
               (lit "3u")))
         a3C4)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a3zt
            a3zu
            (as
               nothing
               (Maybe Type)))
         a3C9)
      :named
      given-8.2))
(assert
   (!
      (= a3C4 a3zq)
      :named
      given-8.3))
(assert
   (!
      (= a3C9 a3zq)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a3Cg} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zt
;       "price"
;       (just
;          (lit "3u")))
;    a3zt)

; WANTEDS (names)
;  a3zt  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a3zt
               "price"
               (just
                  (lit "3u")))
            a3zt))
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
;            a3zq
;            "price"
;            (just
;               (lit "3u")))
;         a3C4)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a3zt
;            a3zu
;            (as
;               nothing
;               (Maybe Type)))
;         a3C9)
;      :named
;      given-8.2)
;   (!
;      (= a3C4 a3zq)
;      :named
;      given-8.3)
;   (!
;      (= a3C9 a3zq)
;      :named
;      given-8.4)
;   (!
;      (not
;         (=
;            (store
;               a3zt
;               "price"
;               (just
;                  (lit "3u")))
;            a3zt))
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
; [G] co_a3C5 {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3Cn {2}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] co_a3Ck {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3C6 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Cm {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3zR} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zq,"price",Int []],a3C4)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zA,"price",a3zC],a3Ci)
; (a3Ci,a3zq)
; (a3C4,a3zq)
; (a3zB,"price")

; WANTEDS (Thoralf style)
; (a3zC,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a3zR} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a3zC
;    (lit "3u"))

; GIVENS (names)
;  a3zq  <=  m
;  a3zA  <=  m
;  a3zB  <=  field
;  a3zC  <=  val
;  a3C4  <=  fsk_a3C4
;  a3Ci  <=  fsk_a3Ci
(push 1)
; DECS1 (seen) 
; (declare-const a3C4 (Array String (Maybe Type)))
; (declare-const a3zq (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a3Ci (Array String (Maybe Type)))
; (declare-const a3zA (Array String (Maybe Type)))
; (declare-const a3zB String)
; (declare-const a3zC Type)
(declare-const
   a3zq
   (Array
      String
      (Maybe Type)))
(declare-const
   a3zA
   (Array
      String
      (Maybe Type)))
(declare-const a3zB String)
(declare-const a3zC Type)
(declare-const
   a3C4
   (Array
      String
      (Maybe Type)))
(declare-const
   a3Ci
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a3zq
            "price"
            (just
               (lit "3u")))
         a3C4)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a3zA
            "price"
            (just a3zC))
         a3Ci)
      :named
      given-11.2))
(assert
   (!
      (= a3Ci a3zq)
      :named
      given-11.3))
(assert
   (!
      (= a3C4 a3zq)
      :named
      given-11.4))
(assert
   (!
      (= a3zB "price")
      :named
      given-11.5))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a3zR} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a3zC
;    (lit "3u"))

; WANTEDS (names)
;  a3zC  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a3zC
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
;            a3zq
;            "price"
;            (just
;               (lit "3u")))
;         a3C4)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a3zA
;            "price"
;            (just a3zC))
;         a3Ci)
;      :named
;      given-11.2)
;   (!
;      (= a3Ci a3zq)
;      :named
;      given-11.3)
;   (!
;      (= a3C4 a3zq)
;      :named
;      given-11.4)
;   (!
;      (= a3zB "price")
;      :named
;      given-11.5)
;   (!
;      (not
;         (=
;            a3zC
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
; [G] $dDisEquality_a3zT {0}:: DisEquality field "price" (CDictCan)
; [G] co_a3C5 {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3Cj {1}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] co_a3C6 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Ck {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Cr} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a3zT {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zq,"price",Int []],a3C4)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zA,a3zB,a3zC],a3Ci)
; (a3C4,a3zq)
; (a3Ci,a3zq)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zA,"price",Int []],a3zA)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a3Cr} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zA
;       "price"
;       (just
;          (lit "3u")))
;    a3zA)

; GIVENS (names)
;  a3zq  <=  m
;  a3zA  <=  m
;  a3zB  <=  field
;  a3zC  <=  val
;  a3C4  <=  fsk_a3C4
;  a3Ci  <=  fsk_a3Ci
(push 1)
; DECS1 (seen) 
; (declare-const a3C4 (Array String (Maybe Type)))
; (declare-const a3Ci (Array String (Maybe Type)))
; (declare-const a3zA (Array String (Maybe Type)))
; (declare-const a3zB String)
; (declare-const a3zC Type)
; (declare-const a3zq (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a3zq
   (Array
      String
      (Maybe Type)))
(declare-const
   a3zA
   (Array
      String
      (Maybe Type)))
(declare-const a3zB String)
(declare-const a3zC Type)
(declare-const
   a3C4
   (Array
      String
      (Maybe Type)))
(declare-const
   a3Ci
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a3zB "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a3zq
            "price"
            (just
               (lit "3u")))
         a3C4)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a3zA
            a3zB
            (just a3zC))
         a3Ci)
      :named
      given-13.3))
(assert
   (!
      (= a3C4 a3zq)
      :named
      given-13.4))
(assert
   (!
      (= a3Ci a3zq)
      :named
      given-13.5))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a3Cr} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zA
;       "price"
;       (just
;          (lit "3u")))
;    a3zA)

; WANTEDS (names)
;  a3zA  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a3zA
               "price"
               (just
                  (lit "3u")))
            a3zA))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a3zB "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a3zq
;            "price"
;            (just
;               (lit "3u")))
;         a3C4)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a3zA
;            a3zB
;            (just a3zC))
;         a3Ci)
;      :named
;      given-13.3)
;   (!
;      (= a3C4 a3zq)
;      :named
;      given-13.4)
;   (!
;      (= a3Ci a3zq)
;      :named
;      given-13.5)
;   (!
;      (not
;         (=
;            (store
;               a3zA
;               "price"
;               (just
;                  (lit "3u")))
;            a3zA))
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
; [4 of 4] Compiling Main
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
; Test suite rows: RUNNING...
; Test suite rows: PASS