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
; [G] co_aEg {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aEb {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aEl {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aE6 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aEh {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aE7 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aEc {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aEm {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aEx} {2}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aEH} {2}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aDC,aDD,aDF,aDH],aEf)
; (IntersectL [aDC,aDD,aDG,aDH],aEa)
; (IntersectL [aDC,aDD,aDE,aDJ],aEk)
; (IntersectL [aDC,aDD,aDE,aDF],aE5)
; (aEf,aDJ)
; (aE5,aDG)
; (aEa,aDI)
; (aEk,aDK)

; WANTEDS (Thoralf style)
; (IntersectL [aDC,aDD,IntersectL [aDC,aDD,aDR,aDS],aDU],aDI)
; (IntersectL [aDC,aDD,aDR,IntersectL [aDC,aDD,aDS,aDU]],aDK)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aEx} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aEH} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; GIVENS (names)
;  aDE  <=  a
;  aDF  <=  b
;  aDG  <=  ab
;  aDH  <=  c
;  aDI  <=  abc
;  aDJ  <=  bc
;  aDK  <=  abc'
;  aE5  <=  fsk_aE5
;  aEa  <=  fsk_aEa
;  aEf  <=  fsk_aEf
;  aEk  <=  fsk_aEk
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaDD)) (y (Maybe SortaDD))) (=> (and ((_ is (just (SortaDD) (Maybe SortaDD))) x) ((_ is (just (SortaDD) (Maybe SortaDD))) y)) (= (both1942244620119555109 x y) x))))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 y (as nothing (Maybe SortaDD))) (as nothing (Maybe SortaDD)))))
; (declare-const aDE (Array SortaDC (Maybe SortaDD)))
; (declare-const aDF (Array SortaDC (Maybe SortaDD)))
; (declare-const aDG (Array SortaDC (Maybe SortaDD)))
; (declare-const aDH (Array SortaDC (Maybe SortaDD)))
; (declare-const aDI (Array SortaDC (Maybe SortaDD)))
; (declare-const aDJ (Array SortaDC (Maybe SortaDD)))
; (declare-const aDK (Array SortaDC (Maybe SortaDD)))
; (declare-const aE5 (Array SortaDC (Maybe SortaDD)))
; (declare-const aEa (Array SortaDC (Maybe SortaDD)))
; (declare-const aEf (Array SortaDC (Maybe SortaDD)))
; (declare-const aEk (Array SortaDC (Maybe SortaDD)))
; (declare-fun both1942244620119555109 ((Maybe SortaDD) (Maybe SortaDD)) (Maybe SortaDD))
; (declare-sort SortaDC)
; (declare-sort SortaDD)
(declare-sort SortaDC)
(declare-sort SortaDD)
(declare-const
   aDE
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDF
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDG
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDH
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDI
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDJ
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDK
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aE5
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEa
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEf
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEk
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-fun
   both1942244620119555109
   (
     (Maybe SortaDD)
     (Maybe SortaDD))
   (Maybe SortaDD))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109
            y
            (as
               nothing
               (Maybe SortaDD)))
         (as
            nothing
            (Maybe SortaDD)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDD))
        (y
           (Maybe SortaDD)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              y))
         (=
            (both1942244620119555109 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDF
           aDH)
         aEf)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDG
           aDH)
         aEa)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDJ)
         aEk)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDF)
         aE5)
      :named
      given-2.4))
(assert
   (!
      (= aEf aDJ)
      :named
      given-2.5))
(assert
   (!
      (= aE5 aDG)
      :named
      given-2.6))
(assert
   (!
      (= aEa aDI)
      :named
      given-2.7))
(assert
   (!
      (= aEk aDK)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aEx} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aEH} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; WANTEDS (names)
;  aDI  <=  abc
;  aDK  <=  abc'
;  aDR  <=  a_aDR
;  aDS  <=  b_aDS
;  aDU  <=  c_aDU
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aDR (Array SortaDC (Maybe SortaDD)))
; (declare-const aDS (Array SortaDC (Maybe SortaDD)))
; (declare-const aDU (Array SortaDC (Maybe SortaDD)))
(declare-const
   aDR
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDS
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDU
   (Array
      SortaDC
      (Maybe SortaDD)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 (
                   (_ map both1942244620119555109)
                   aDR
                   aDS)
                 aDU)
               aDI))
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 aDR
                 (
                   (_ map both1942244620119555109)
                   aDS
                   aDU))
               aDK)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaDD!val!2
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!5
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!6
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!0
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!1
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!3
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!4
;      ()
;      SortaDD)
;   (forall
;      (
;        (x SortaDD))
;      (or
;         (= x SortaDD!val!2)
;         (= x SortaDD!val!5)
;         (= x SortaDD!val!6)
;         (= x SortaDD!val!0)
;         (= x SortaDD!val!1)
;         (= x SortaDD!val!3)
;         (= x SortaDD!val!4)))
;   (declare-fun
;      SortaDC!val!0
;      ()
;      SortaDC)
;   (forall
;      (
;        (x SortaDC))
;      (= x SortaDC!val!0))
;   (define-fun
;      aDF
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDI
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= aE5 aDG))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDG
;           aDH)
;         aEa))
;   (define-fun
;      aDG
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
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
;                      (_ map both1942244620119555109)
;                      (
;                        (_ map both1942244620119555109)
;                        aDR
;                        aDS)
;                      aDU)
;                    aDI)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942244620119555109)
;                      aDR
;                      (
;                        (_ map both1942244620119555109)
;                        aDS
;                        aDU))
;                    aDK))))
;         (or a!1 a!2)))
;   (define-fun
;      aDE
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!6))
;         SortaDC!val!0
;         (just SortaDD!val!5)))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= aEf aDJ))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= aEa aDI))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aEk aDK))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aEf
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aE5
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDJ)
;         aEk))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDF)
;         aE5))
;   (define-fun
;      aEa
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDJ
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDF
;           aDH)
;         aEf))
;   (define-fun
;      aDK
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDS
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!1))
;         SortaDC!val!0
;         (just SortaDD!val!3)))
;   (define-fun
;      aDU
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!0))
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aEk
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      both1942244620119555109
;      (
;        (x!0
;           (Maybe SortaDD))
;        (x!1
;           (Maybe SortaDD)))
;      (Maybe SortaDD)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDD!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDD!val!0))
;                  (=
;                     x!1
;                     (just SortaDD!val!1)))
;               (just SortaDD!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDD!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDD!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDD!val!2))
;                           (=
;                              x!1
;                              (just SortaDD!val!3)))
;                        (just SortaDD!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDD!val!2))
;                              (=
;                                 x!1
;                                 (just SortaDD!val!4)))
;                           (just SortaDD!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDD!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDD!val!3))
;                                    (=
;                                       x!1
;                                       (just SortaDD!val!4)))
;                                 (just SortaDD!val!3)
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
; [G] co_aEg {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aEb {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aEl {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aE6 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aEh {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aE7 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aEc {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aEm {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aEx} {2}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aEH} {2}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aDC,aDD,aDF,aDH],aEf)
; (IntersectL [aDC,aDD,aDG,aDH],aEa)
; (IntersectL [aDC,aDD,aDE,aDJ],aEk)
; (IntersectL [aDC,aDD,aDE,aDF],aE5)
; (aEf,aDJ)
; (aE5,aDG)
; (aEa,aDI)
; (aEk,aDK)

; WANTEDS (Thoralf style)
; (IntersectL [aDC,aDD,IntersectL [aDC,aDD,aDR,aDS],aDU],aDI)
; (IntersectL [aDC,aDD,aDR,IntersectL [aDC,aDD,aDS,aDU]],aDK)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aEx} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aEH} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; GIVENS (names)
;  aDE  <=  a
;  aDF  <=  b
;  aDG  <=  ab
;  aDH  <=  c
;  aDI  <=  abc
;  aDJ  <=  bc
;  aDK  <=  abc'
;  aE5  <=  fsk_aE5
;  aEa  <=  fsk_aEa
;  aEf  <=  fsk_aEf
;  aEk  <=  fsk_aEk
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaDD)) (y (Maybe SortaDD))) (=> (and ((_ is (just (SortaDD) (Maybe SortaDD))) x) ((_ is (just (SortaDD) (Maybe SortaDD))) y)) (= (both1942244620119555109 x y) x))))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 y (as nothing (Maybe SortaDD))) (as nothing (Maybe SortaDD)))))
; (declare-const aDE (Array SortaDC (Maybe SortaDD)))
; (declare-const aDF (Array SortaDC (Maybe SortaDD)))
; (declare-const aDG (Array SortaDC (Maybe SortaDD)))
; (declare-const aDH (Array SortaDC (Maybe SortaDD)))
; (declare-const aDI (Array SortaDC (Maybe SortaDD)))
; (declare-const aDJ (Array SortaDC (Maybe SortaDD)))
; (declare-const aDK (Array SortaDC (Maybe SortaDD)))
; (declare-const aE5 (Array SortaDC (Maybe SortaDD)))
; (declare-const aEa (Array SortaDC (Maybe SortaDD)))
; (declare-const aEf (Array SortaDC (Maybe SortaDD)))
; (declare-const aEk (Array SortaDC (Maybe SortaDD)))
; (declare-fun both1942244620119555109 ((Maybe SortaDD) (Maybe SortaDD)) (Maybe SortaDD))
; (declare-sort SortaDC)
; (declare-sort SortaDD)
(declare-sort SortaDC)
(declare-sort SortaDD)
(declare-const
   aDE
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDF
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDG
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDH
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDI
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDJ
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDK
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aE5
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEa
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEf
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEk
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-fun
   both1942244620119555109
   (
     (Maybe SortaDD)
     (Maybe SortaDD))
   (Maybe SortaDD))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109
            y
            (as
               nothing
               (Maybe SortaDD)))
         (as
            nothing
            (Maybe SortaDD)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDD))
        (y
           (Maybe SortaDD)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              y))
         (=
            (both1942244620119555109 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDF
           aDH)
         aEf)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDG
           aDH)
         aEa)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDJ)
         aEk)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDF)
         aE5)
      :named
      given-2.4))
(assert
   (!
      (= aEf aDJ)
      :named
      given-2.5))
(assert
   (!
      (= aE5 aDG)
      :named
      given-2.6))
(assert
   (!
      (= aEa aDI)
      :named
      given-2.7))
(assert
   (!
      (= aEk aDK)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aEx} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aEH} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; WANTEDS (names)
;  aDI  <=  abc
;  aDK  <=  abc'
;  aDR  <=  a_aDR
;  aDS  <=  b_aDS
;  aDU  <=  c_aDU
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aDR (Array SortaDC (Maybe SortaDD)))
; (declare-const aDS (Array SortaDC (Maybe SortaDD)))
; (declare-const aDU (Array SortaDC (Maybe SortaDD)))
(declare-const
   aDR
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDS
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDU
   (Array
      SortaDC
      (Maybe SortaDD)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 (
                   (_ map both1942244620119555109)
                   aDR
                   aDS)
                 aDU)
               aDI))
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 aDR
                 (
                   (_ map both1942244620119555109)
                   aDS
                   aDU))
               aDK)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaDD!val!2
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!5
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!6
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!0
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!1
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!3
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!4
;      ()
;      SortaDD)
;   (forall
;      (
;        (x SortaDD))
;      (or
;         (= x SortaDD!val!2)
;         (= x SortaDD!val!5)
;         (= x SortaDD!val!6)
;         (= x SortaDD!val!0)
;         (= x SortaDD!val!1)
;         (= x SortaDD!val!3)
;         (= x SortaDD!val!4)))
;   (declare-fun
;      SortaDC!val!0
;      ()
;      SortaDC)
;   (forall
;      (
;        (x SortaDC))
;      (= x SortaDC!val!0))
;   (define-fun
;      aDF
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDI
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= aE5 aDG))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDG
;           aDH)
;         aEa))
;   (define-fun
;      aDG
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
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
;                      (_ map both1942244620119555109)
;                      (
;                        (_ map both1942244620119555109)
;                        aDR
;                        aDS)
;                      aDU)
;                    aDI)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942244620119555109)
;                      aDR
;                      (
;                        (_ map both1942244620119555109)
;                        aDS
;                        aDU))
;                    aDK))))
;         (or a!1 a!2)))
;   (define-fun
;      aDE
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!6))
;         SortaDC!val!0
;         (just SortaDD!val!5)))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= aEf aDJ))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= aEa aDI))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aEk aDK))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aEf
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aE5
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDJ)
;         aEk))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDF)
;         aE5))
;   (define-fun
;      aEa
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDJ
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDF
;           aDH)
;         aEf))
;   (define-fun
;      aDK
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDS
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!1))
;         SortaDC!val!0
;         (just SortaDD!val!3)))
;   (define-fun
;      aDU
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!0))
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aEk
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      both1942244620119555109
;      (
;        (x!0
;           (Maybe SortaDD))
;        (x!1
;           (Maybe SortaDD)))
;      (Maybe SortaDD)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDD!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDD!val!0))
;                  (=
;                     x!1
;                     (just SortaDD!val!1)))
;               (just SortaDD!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDD!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDD!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDD!val!2))
;                           (=
;                              x!1
;                              (just SortaDD!val!3)))
;                        (just SortaDD!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDD!val!2))
;                              (=
;                                 x!1
;                                 (just SortaDD!val!4)))
;                           (just SortaDD!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDD!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDD!val!3))
;                                    (=
;                                       x!1
;                                       (just SortaDD!val!4)))
;                                 (just SortaDD!val!3)
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
; [G] co_aEg {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aEb {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aEl {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aE6 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aEh {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aE7 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aEc {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aEm {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aEM} {3}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aER} {3}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aDC,aDD,aDF,aDH],aEf)
; (IntersectL [aDC,aDD,aDG,aDH],aEa)
; (IntersectL [aDC,aDD,aDE,aDJ],aEk)
; (IntersectL [aDC,aDD,aDE,aDF],aE5)
; (aEf,aDJ)
; (aE5,aDG)
; (aEa,aDI)
; (aEk,aDK)

; WANTEDS (Thoralf style)
; (IntersectL [aDC,aDD,IntersectL [aDC,aDD,aDR,aDS],aDU],aDI)
; (IntersectL [aDC,aDD,aDR,IntersectL [aDC,aDD,aDS,aDU]],aDK)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aEM} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aER} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; GIVENS (names)
;  aDE  <=  a
;  aDF  <=  b
;  aDG  <=  ab
;  aDH  <=  c
;  aDI  <=  abc
;  aDJ  <=  bc
;  aDK  <=  abc'
;  aE5  <=  fsk_aE5
;  aEa  <=  fsk_aEa
;  aEf  <=  fsk_aEf
;  aEk  <=  fsk_aEk
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaDD)) (y (Maybe SortaDD))) (=> (and ((_ is (just (SortaDD) (Maybe SortaDD))) x) ((_ is (just (SortaDD) (Maybe SortaDD))) y)) (= (both1942244620119555109 x y) x))))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 y (as nothing (Maybe SortaDD))) (as nothing (Maybe SortaDD)))))
; (declare-const aDE (Array SortaDC (Maybe SortaDD)))
; (declare-const aDF (Array SortaDC (Maybe SortaDD)))
; (declare-const aDG (Array SortaDC (Maybe SortaDD)))
; (declare-const aDH (Array SortaDC (Maybe SortaDD)))
; (declare-const aDI (Array SortaDC (Maybe SortaDD)))
; (declare-const aDJ (Array SortaDC (Maybe SortaDD)))
; (declare-const aDK (Array SortaDC (Maybe SortaDD)))
; (declare-const aE5 (Array SortaDC (Maybe SortaDD)))
; (declare-const aEa (Array SortaDC (Maybe SortaDD)))
; (declare-const aEf (Array SortaDC (Maybe SortaDD)))
; (declare-const aEk (Array SortaDC (Maybe SortaDD)))
; (declare-fun both1942244620119555109 ((Maybe SortaDD) (Maybe SortaDD)) (Maybe SortaDD))
; (declare-sort SortaDC)
; (declare-sort SortaDD)
; DECS1 (unseen) 
(declare-sort SortaDC)
(declare-sort SortaDD)
(declare-const
   aDE
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDF
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDG
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDH
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDI
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDJ
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDK
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aE5
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEa
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEf
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEk
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-fun
   both1942244620119555109
   (
     (Maybe SortaDD)
     (Maybe SortaDD))
   (Maybe SortaDD))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109
            y
            (as
               nothing
               (Maybe SortaDD)))
         (as
            nothing
            (Maybe SortaDD)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDD))
        (y
           (Maybe SortaDD)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              y))
         (=
            (both1942244620119555109 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDF
           aDH)
         aEf)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDG
           aDH)
         aEa)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDJ)
         aEk)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDF)
         aE5)
      :named
      given-3.4))
(assert
   (!
      (= aEf aDJ)
      :named
      given-3.5))
(assert
   (!
      (= aE5 aDG)
      :named
      given-3.6))
(assert
   (!
      (= aEa aDI)
      :named
      given-3.7))
(assert
   (!
      (= aEk aDK)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aEM} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aER} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; WANTEDS (names)
;  aDI  <=  abc
;  aDK  <=  abc'
;  aDR  <=  a_aDR
;  aDS  <=  b_aDS
;  aDU  <=  c_aDU
; DECS2 (seen) 
; (declare-const aDR (Array SortaDC (Maybe SortaDD)))
; (declare-const aDS (Array SortaDC (Maybe SortaDD)))
; (declare-const aDU (Array SortaDC (Maybe SortaDD)))
; DECS2 (unseen) 
(declare-const
   aDR
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDS
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDU
   (Array
      SortaDC
      (Maybe SortaDD)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 (
                   (_ map both1942244620119555109)
                   aDR
                   aDS)
                 aDU)
               aDI))
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 aDR
                 (
                   (_ map both1942244620119555109)
                   aDS
                   aDU))
               aDK)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      SortaDD!val!2
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!0
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!1
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!5
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!6
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!4
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!3
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!7
;      ()
;      SortaDD)
;   (forall
;      (
;        (x SortaDD))
;      (or
;         (= x SortaDD!val!2)
;         (= x SortaDD!val!0)
;         (= x SortaDD!val!1)
;         (= x SortaDD!val!5)
;         (= x SortaDD!val!6)
;         (= x SortaDD!val!4)
;         (= x SortaDD!val!3)
;         (= x SortaDD!val!7)))
;   (declare-fun
;      SortaDC!val!0
;      ()
;      SortaDC)
;   (forall
;      (
;        (x SortaDC))
;      (= x SortaDC!val!0))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= aE5 aDG))
;   (define-fun
;      aDF
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
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
;                      (_ map both1942244620119555109)
;                      (
;                        (_ map both1942244620119555109)
;                        aDR
;                        aDS)
;                      aDU)
;                    aDI)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942244620119555109)
;                      aDR
;                      (
;                        (_ map both1942244620119555109)
;                        aDS
;                        aDU))
;                    aDK))))
;         (or a!1 a!2)))
;   (define-fun
;      aDI
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aDG
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDG
;           aDH)
;         aEa))
;   (define-fun
;      aE5
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aDS
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!1))
;         SortaDC!val!0
;         (just SortaDD!val!6)))
;   (define-fun
;      aDE
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!7))
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!5)))
;   (define-fun
;      aEf
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= aEf aDJ))
;   (define-fun
;      aDJ
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
;   (define-fun
;      aDK
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDF
;           aDH)
;         aEf))
;   (define-fun
;      aEa
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= aEk aDK))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= aEa aDI))
;   (define-fun
;      aDU
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!0))
;         SortaDC!val!0
;         (just SortaDD!val!3)))
;   (define-fun
;      aEk
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDF)
;         aE5))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDJ)
;         aEk))
;   (define-fun
;      both1942244620119555109
;      (
;        (x!0
;           (Maybe SortaDD))
;        (x!1
;           (Maybe SortaDD)))
;      (Maybe SortaDD)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDD!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDD!val!0))
;                  (=
;                     x!1
;                     (just SortaDD!val!1)))
;               (just SortaDD!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDD!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDD!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDD!val!2))
;                           (=
;                              x!1
;                              (just SortaDD!val!5)))
;                        (just SortaDD!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDD!val!3))
;                              (=
;                                 x!1
;                                 (just SortaDD!val!6)))
;                           (just SortaDD!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDD!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDD!val!4))
;                                    (=
;                                       x!1
;                                       (just SortaDD!val!5)))
;                                 (just SortaDD!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just SortaDD!val!2))
;                                       (=
;                                          x!1
;                                          (just SortaDD!val!4)))
;                                    (just SortaDD!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just SortaDD!val!6))
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
; [G] co_aEg {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aEb {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aEl {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aE6 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aEh {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aE7 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aEc {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aEm {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aEM} {3}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aER} {3}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aDC,aDD,aDF,aDH],aEf)
; (IntersectL [aDC,aDD,aDG,aDH],aEa)
; (IntersectL [aDC,aDD,aDE,aDJ],aEk)
; (IntersectL [aDC,aDD,aDE,aDF],aE5)
; (aEf,aDJ)
; (aE5,aDG)
; (aEa,aDI)
; (aEk,aDK)

; WANTEDS (Thoralf style)
; (IntersectL [aDC,aDD,IntersectL [aDC,aDD,aDR,aDS],aDU],aDI)
; (IntersectL [aDC,aDD,aDR,IntersectL [aDC,aDD,aDS,aDU]],aDK)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aEM} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aER} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; GIVENS (names)
;  aDE  <=  a
;  aDF  <=  b
;  aDG  <=  ab
;  aDH  <=  c
;  aDI  <=  abc
;  aDJ  <=  bc
;  aDK  <=  abc'
;  aE5  <=  fsk_aE5
;  aEa  <=  fsk_aEa
;  aEf  <=  fsk_aEf
;  aEk  <=  fsk_aEk
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaDD)) (y (Maybe SortaDD))) (=> (and ((_ is (just (SortaDD) (Maybe SortaDD))) x) ((_ is (just (SortaDD) (Maybe SortaDD))) y)) (= (both1942244620119555109 x y) x))))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDD))) (= (both1942244620119555109 y (as nothing (Maybe SortaDD))) (as nothing (Maybe SortaDD)))))
; (declare-const aDE (Array SortaDC (Maybe SortaDD)))
; (declare-const aDF (Array SortaDC (Maybe SortaDD)))
; (declare-const aDG (Array SortaDC (Maybe SortaDD)))
; (declare-const aDH (Array SortaDC (Maybe SortaDD)))
; (declare-const aDI (Array SortaDC (Maybe SortaDD)))
; (declare-const aDJ (Array SortaDC (Maybe SortaDD)))
; (declare-const aDK (Array SortaDC (Maybe SortaDD)))
; (declare-const aE5 (Array SortaDC (Maybe SortaDD)))
; (declare-const aEa (Array SortaDC (Maybe SortaDD)))
; (declare-const aEf (Array SortaDC (Maybe SortaDD)))
; (declare-const aEk (Array SortaDC (Maybe SortaDD)))
; (declare-fun both1942244620119555109 ((Maybe SortaDD) (Maybe SortaDD)) (Maybe SortaDD))
; (declare-sort SortaDC)
; (declare-sort SortaDD)
; DECS1 (unseen) 
(declare-sort SortaDC)
(declare-sort SortaDD)
(declare-const
   aDE
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDF
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDG
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDH
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDI
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDJ
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDK
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aE5
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEa
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEf
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aEk
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-fun
   both1942244620119555109
   (
     (Maybe SortaDD)
     (Maybe SortaDD))
   (Maybe SortaDD))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109
            y
            (as
               nothing
               (Maybe SortaDD)))
         (as
            nothing
            (Maybe SortaDD)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDD)))
      (=
         (both1942244620119555109 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDD))
        (y
           (Maybe SortaDD)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDD)
                    (Maybe SortaDD)))
              y))
         (=
            (both1942244620119555109 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDF
           aDH)
         aEf)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDG
           aDH)
         aEa)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDJ)
         aEk)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both1942244620119555109)
           aDE
           aDF)
         aE5)
      :named
      given-3.4))
(assert
   (!
      (= aEf aDJ)
      :named
      given-3.5))
(assert
   (!
      (= aE5 aDG)
      :named
      given-3.6))
(assert
   (!
      (= aEa aDI)
      :named
      given-3.7))
(assert
   (!
      (= aEk aDK)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aEM} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      (
;        (_ map both1942244620119555109)
;        aDR
;        aDS)
;      aDU)
;    aDI)

;      [WD] hole{co_aER} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942244620119555109)
;      aDR
;      (
;        (_ map both1942244620119555109)
;        aDS
;        aDU))
;    aDK)

; WANTEDS (names)
;  aDI  <=  abc
;  aDK  <=  abc'
;  aDR  <=  a_aDR
;  aDS  <=  b_aDS
;  aDU  <=  c_aDU
; DECS2 (seen) 
; (declare-const aDR (Array SortaDC (Maybe SortaDD)))
; (declare-const aDS (Array SortaDC (Maybe SortaDD)))
; (declare-const aDU (Array SortaDC (Maybe SortaDD)))
; DECS2 (unseen) 
(declare-const
   aDR
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDS
   (Array
      SortaDC
      (Maybe SortaDD)))
(declare-const
   aDU
   (Array
      SortaDC
      (Maybe SortaDD)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 (
                   (_ map both1942244620119555109)
                   aDR
                   aDS)
                 aDU)
               aDI))
         (not
            (=
               (
                 (_ map both1942244620119555109)
                 aDR
                 (
                   (_ map both1942244620119555109)
                   aDS
                   aDU))
               aDK)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      SortaDD!val!2
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!0
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!1
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!5
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!6
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!4
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!3
;      ()
;      SortaDD)
;   (declare-fun
;      SortaDD!val!7
;      ()
;      SortaDD)
;   (forall
;      (
;        (x SortaDD))
;      (or
;         (= x SortaDD!val!2)
;         (= x SortaDD!val!0)
;         (= x SortaDD!val!1)
;         (= x SortaDD!val!5)
;         (= x SortaDD!val!6)
;         (= x SortaDD!val!4)
;         (= x SortaDD!val!3)
;         (= x SortaDD!val!7)))
;   (declare-fun
;      SortaDC!val!0
;      ()
;      SortaDC)
;   (forall
;      (
;        (x SortaDC))
;      (= x SortaDC!val!0))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= aE5 aDG))
;   (define-fun
;      aDF
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
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
;                      (_ map both1942244620119555109)
;                      (
;                        (_ map both1942244620119555109)
;                        aDR
;                        aDS)
;                      aDU)
;                    aDI)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942244620119555109)
;                      aDR
;                      (
;                        (_ map both1942244620119555109)
;                        aDS
;                        aDU))
;                    aDK))))
;         (or a!1 a!2)))
;   (define-fun
;      aDI
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aDG
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDG
;           aDH)
;         aEa))
;   (define-fun
;      aE5
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aDS
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!1))
;         SortaDC!val!0
;         (just SortaDD!val!6)))
;   (define-fun
;      aDE
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!7))
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!5)))
;   (define-fun
;      aEf
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= aEf aDJ))
;   (define-fun
;      aDJ
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!4)))
;   (define-fun
;      aDK
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDF
;           aDH)
;         aEf))
;   (define-fun
;      aEa
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= aEk aDK))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= aEa aDI))
;   (define-fun
;      aDU
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (
;        (as
;           const
;           (Array
;              SortaDC
;              (Maybe SortaDD)))
;        nothing))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           (just SortaDD!val!0))
;         SortaDC!val!0
;         (just SortaDD!val!3)))
;   (define-fun
;      aEk
;      ()
;      (Array
;         SortaDC
;         (Maybe SortaDD))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaDC
;                 (Maybe SortaDD)))
;           nothing)
;         SortaDC!val!0
;         (just SortaDD!val!2)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDF)
;         aE5))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942244620119555109)
;           aDE
;           aDJ)
;         aEk))
;   (define-fun
;      both1942244620119555109
;      (
;        (x!0
;           (Maybe SortaDD))
;        (x!1
;           (Maybe SortaDD)))
;      (Maybe SortaDD)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDD!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDD!val!0))
;                  (=
;                     x!1
;                     (just SortaDD!val!1)))
;               (just SortaDD!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDD!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDD!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDD!val!2))
;                           (=
;                              x!1
;                              (just SortaDD!val!5)))
;                        (just SortaDD!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDD!val!3))
;                              (=
;                                 x!1
;                                 (just SortaDD!val!6)))
;                           (just SortaDD!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDD!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDD!val!4))
;                                    (=
;                                       x!1
;                                       (just SortaDD!val!5)))
;                                 (just SortaDD!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just SortaDD!val!2))
;                                       (=
;                                          x!1
;                                          (just SortaDD!val!4)))
;                                    (just SortaDD!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just SortaDD!val!6))
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
; [G] co_aFV {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFQ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aG0 {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFL {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFW {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFM {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFR {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aG1 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aGc} {2}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aGm} {2}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aFh,aFi,aFk,aFm],aFU)
; (UnionL [aFh,aFi,aFl,aFm],aFP)
; (UnionL [aFh,aFi,aFj,aFo],aFZ)
; (UnionL [aFh,aFi,aFj,aFk],aFK)
; (aFU,aFo)
; (aFK,aFl)
; (aFP,aFn)
; (aFZ,aFp)

; WANTEDS (Thoralf style)
; (UnionL [aFh,aFi,UnionL [aFh,aFi,aFw,aFx],aFz],aFn)
; (UnionL [aFh,aFi,aFw,UnionL [aFh,aFi,aFx,aFz]],aFp)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aGc} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGm} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; GIVENS (names)
;  aFj  <=  a
;  aFk  <=  b
;  aFl  <=  ab
;  aFm  <=  c
;  aFn  <=  abc
;  aFo  <=  bc
;  aFp  <=  abc'
;  aFK  <=  fsk_aFK
;  aFP  <=  fsk_aFP
;  aFU  <=  fsk_aFU
;  aFZ  <=  fsk_aFZ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaFi)) (y (Maybe SortaFi))) (=> ((_ is (just (SortaFi) (Maybe SortaFi))) x) (= (either1940284190886833336 x y) x))))
; (assert (forall ((y (Maybe SortaFi))) (= (either1940284190886833336 (as nothing (Maybe SortaFi)) y) y)))
; (declare-const aFK (Array SortaFh (Maybe SortaFi)))
; (declare-const aFP (Array SortaFh (Maybe SortaFi)))
; (declare-const aFU (Array SortaFh (Maybe SortaFi)))
; (declare-const aFZ (Array SortaFh (Maybe SortaFi)))
; (declare-const aFj (Array SortaFh (Maybe SortaFi)))
; (declare-const aFk (Array SortaFh (Maybe SortaFi)))
; (declare-const aFl (Array SortaFh (Maybe SortaFi)))
; (declare-const aFm (Array SortaFh (Maybe SortaFi)))
; (declare-const aFn (Array SortaFh (Maybe SortaFi)))
; (declare-const aFo (Array SortaFh (Maybe SortaFi)))
; (declare-const aFp (Array SortaFh (Maybe SortaFi)))
; (declare-fun either1940284190886833336 ((Maybe SortaFi) (Maybe SortaFi)) (Maybe SortaFi))
; (declare-sort SortaFh)
; (declare-sort SortaFi)
(declare-sort SortaFh)
(declare-sort SortaFi)
(declare-const
   aFj
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFk
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFl
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFm
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFn
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFo
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFp
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFK
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFP
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFU
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFZ
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-fun
   either1940284190886833336
   (
     (Maybe SortaFi)
     (Maybe SortaFi))
   (Maybe SortaFi))
(assert
   (forall
      (
        (y
           (Maybe SortaFi)))
      (=
         (either1940284190886833336
            (as
               nothing
               (Maybe SortaFi))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaFi))
        (y
           (Maybe SortaFi)))
      (=>
         (
           (_
              is
              (just
                 (SortaFi)
                 (Maybe SortaFi)))
           x)
         (=
            (either1940284190886833336 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFk
           aFm)
         aFU)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFl
           aFm)
         aFP)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFo)
         aFZ)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFk)
         aFK)
      :named
      given-5.4))
(assert
   (!
      (= aFU aFo)
      :named
      given-5.5))
(assert
   (!
      (= aFK aFl)
      :named
      given-5.6))
(assert
   (!
      (= aFP aFn)
      :named
      given-5.7))
(assert
   (!
      (= aFZ aFp)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aGc} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGm} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; WANTEDS (names)
;  aFn  <=  abc
;  aFp  <=  abc'
;  aFw  <=  a_aFw
;  aFx  <=  b_aFx
;  aFz  <=  c_aFz
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aFw (Array SortaFh (Maybe SortaFi)))
; (declare-const aFx (Array SortaFh (Maybe SortaFi)))
; (declare-const aFz (Array SortaFh (Maybe SortaFi)))
(declare-const
   aFw
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFx
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFz
   (Array
      SortaFh
      (Maybe SortaFi)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 (
                   (_ map either1940284190886833336)
                   aFw
                   aFx)
                 aFz)
               aFn))
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 aFw
                 (
                   (_ map either1940284190886833336)
                   aFx
                   aFz))
               aFp)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      SortaFh!val!0
;      ()
;      SortaFh)
;   (forall
;      (
;        (x SortaFh))
;      (= x SortaFh!val!0))
;   (declare-fun
;      SortaFi!val!0
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!1
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!2
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!4
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!3
;      ()
;      SortaFi)
;   (forall
;      (
;        (x SortaFi))
;      (or
;         (= x SortaFi!val!0)
;         (= x SortaFi!val!1)
;         (= x SortaFi!val!2)
;         (= x SortaFi!val!4)
;         (= x SortaFi!val!3)))
;   (define-fun
;      aFk
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
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
;                      (_ map either1940284190886833336)
;                      (
;                        (_ map either1940284190886833336)
;                        aFw
;                        aFx)
;                      aFz)
;                    aFn)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1940284190886833336)
;                      aFw
;                      (
;                        (_ map either1940284190886833336)
;                        aFx
;                        aFz))
;                    aFp))))
;         (or a!1 a!2)))
;   (define-fun
;      aFj
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      aFK
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         nothing))
;   (define-fun
;      aFz
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!0))
;         SortaFh!val!0
;         (just SortaFi!val!4)))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFk
;           aFm)
;         aFU))
;   (define-fun
;      aFx
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFk)
;         aFK))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= aFZ aFp))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFo)
;         aFZ))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= aFK aFl))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= aFP aFn))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFl
;           aFm)
;         aFP))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= aFU aFo))
;   (define-fun
;      aFm
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           nothing)
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFU
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         nothing))
;   (define-fun
;      aFP
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFo
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFZ
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFn
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFp
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFw
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      either1940284190886833336
;      (
;        (x!0
;           (Maybe SortaFi))
;        (x!1
;           (Maybe SortaFi)))
;      (Maybe SortaFi)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaFi!val!3))
;            (= x!1 nothing))
;         (just SortaFi!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaFi!val!3)))
;            (just SortaFi!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaFi!val!0)))
;               (just SortaFi!val!0)
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
;                           (just SortaFi!val!2)))
;                     (just SortaFi!val!2)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaFi!val!4)))
;                        (just SortaFi!val!4)
;                        (ite
;                           (
;                             (_ is just)
;                             x!0)
;                           x!0
;                           x!1)))))))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_aFV {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFQ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aG0 {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFL {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFW {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFM {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFR {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aG1 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aGc} {2}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aGm} {2}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aFh,aFi,aFk,aFm],aFU)
; (UnionL [aFh,aFi,aFl,aFm],aFP)
; (UnionL [aFh,aFi,aFj,aFo],aFZ)
; (UnionL [aFh,aFi,aFj,aFk],aFK)
; (aFU,aFo)
; (aFK,aFl)
; (aFP,aFn)
; (aFZ,aFp)

; WANTEDS (Thoralf style)
; (UnionL [aFh,aFi,UnionL [aFh,aFi,aFw,aFx],aFz],aFn)
; (UnionL [aFh,aFi,aFw,UnionL [aFh,aFi,aFx,aFz]],aFp)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aGc} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGm} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; GIVENS (names)
;  aFj  <=  a
;  aFk  <=  b
;  aFl  <=  ab
;  aFm  <=  c
;  aFn  <=  abc
;  aFo  <=  bc
;  aFp  <=  abc'
;  aFK  <=  fsk_aFK
;  aFP  <=  fsk_aFP
;  aFU  <=  fsk_aFU
;  aFZ  <=  fsk_aFZ
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaFi)) (y (Maybe SortaFi))) (=> ((_ is (just (SortaFi) (Maybe SortaFi))) x) (= (either1940284190886833336 x y) x))))
; (assert (forall ((y (Maybe SortaFi))) (= (either1940284190886833336 (as nothing (Maybe SortaFi)) y) y)))
; (declare-const aFK (Array SortaFh (Maybe SortaFi)))
; (declare-const aFP (Array SortaFh (Maybe SortaFi)))
; (declare-const aFU (Array SortaFh (Maybe SortaFi)))
; (declare-const aFZ (Array SortaFh (Maybe SortaFi)))
; (declare-const aFj (Array SortaFh (Maybe SortaFi)))
; (declare-const aFk (Array SortaFh (Maybe SortaFi)))
; (declare-const aFl (Array SortaFh (Maybe SortaFi)))
; (declare-const aFm (Array SortaFh (Maybe SortaFi)))
; (declare-const aFn (Array SortaFh (Maybe SortaFi)))
; (declare-const aFo (Array SortaFh (Maybe SortaFi)))
; (declare-const aFp (Array SortaFh (Maybe SortaFi)))
; (declare-fun either1940284190886833336 ((Maybe SortaFi) (Maybe SortaFi)) (Maybe SortaFi))
; (declare-sort SortaFh)
; (declare-sort SortaFi)
(declare-sort SortaFh)
(declare-sort SortaFi)
(declare-const
   aFj
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFk
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFl
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFm
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFn
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFo
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFp
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFK
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFP
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFU
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFZ
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-fun
   either1940284190886833336
   (
     (Maybe SortaFi)
     (Maybe SortaFi))
   (Maybe SortaFi))
(assert
   (forall
      (
        (y
           (Maybe SortaFi)))
      (=
         (either1940284190886833336
            (as
               nothing
               (Maybe SortaFi))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaFi))
        (y
           (Maybe SortaFi)))
      (=>
         (
           (_
              is
              (just
                 (SortaFi)
                 (Maybe SortaFi)))
           x)
         (=
            (either1940284190886833336 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFk
           aFm)
         aFU)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFl
           aFm)
         aFP)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFo)
         aFZ)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFk)
         aFK)
      :named
      given-5.4))
(assert
   (!
      (= aFU aFo)
      :named
      given-5.5))
(assert
   (!
      (= aFK aFl)
      :named
      given-5.6))
(assert
   (!
      (= aFP aFn)
      :named
      given-5.7))
(assert
   (!
      (= aFZ aFp)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aGc} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGm} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; WANTEDS (names)
;  aFn  <=  abc
;  aFp  <=  abc'
;  aFw  <=  a_aFw
;  aFx  <=  b_aFx
;  aFz  <=  c_aFz
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aFw (Array SortaFh (Maybe SortaFi)))
; (declare-const aFx (Array SortaFh (Maybe SortaFi)))
; (declare-const aFz (Array SortaFh (Maybe SortaFi)))
(declare-const
   aFw
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFx
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFz
   (Array
      SortaFh
      (Maybe SortaFi)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 (
                   (_ map either1940284190886833336)
                   aFw
                   aFx)
                 aFz)
               aFn))
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 aFw
                 (
                   (_ map either1940284190886833336)
                   aFx
                   aFz))
               aFp)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      SortaFh!val!0
;      ()
;      SortaFh)
;   (forall
;      (
;        (x SortaFh))
;      (= x SortaFh!val!0))
;   (declare-fun
;      SortaFi!val!0
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!1
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!2
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!4
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!3
;      ()
;      SortaFi)
;   (forall
;      (
;        (x SortaFi))
;      (or
;         (= x SortaFi!val!0)
;         (= x SortaFi!val!1)
;         (= x SortaFi!val!2)
;         (= x SortaFi!val!4)
;         (= x SortaFi!val!3)))
;   (define-fun
;      aFk
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
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
;                      (_ map either1940284190886833336)
;                      (
;                        (_ map either1940284190886833336)
;                        aFw
;                        aFx)
;                      aFz)
;                    aFn)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1940284190886833336)
;                      aFw
;                      (
;                        (_ map either1940284190886833336)
;                        aFx
;                        aFz))
;                    aFp))))
;         (or a!1 a!2)))
;   (define-fun
;      aFj
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      aFK
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         nothing))
;   (define-fun
;      aFz
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!0))
;         SortaFh!val!0
;         (just SortaFi!val!4)))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFk
;           aFm)
;         aFU))
;   (define-fun
;      aFx
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFk)
;         aFK))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= aFZ aFp))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFo)
;         aFZ))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= aFK aFl))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= aFP aFn))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFl
;           aFm)
;         aFP))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= aFU aFo))
;   (define-fun
;      aFm
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           nothing)
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFU
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         nothing))
;   (define-fun
;      aFP
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFo
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFZ
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFn
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFp
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           (just SortaFi!val!3))
;         SortaFh!val!0
;         (just SortaFi!val!2)))
;   (define-fun
;      aFw
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      either1940284190886833336
;      (
;        (x!0
;           (Maybe SortaFi))
;        (x!1
;           (Maybe SortaFi)))
;      (Maybe SortaFi)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaFi!val!3))
;            (= x!1 nothing))
;         (just SortaFi!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaFi!val!3)))
;            (just SortaFi!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaFi!val!0)))
;               (just SortaFi!val!0)
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
;                           (just SortaFi!val!2)))
;                     (just SortaFi!val!2)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaFi!val!4)))
;                        (just SortaFi!val!4)
;                        (ite
;                           (
;                             (_ is just)
;                             x!0)
;                           x!0
;                           x!1)))))))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aFV {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFQ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aG0 {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFL {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFW {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFM {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFR {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aG1 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aGr} {3}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aGw} {3}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aFh,aFi,aFk,aFm],aFU)
; (UnionL [aFh,aFi,aFl,aFm],aFP)
; (UnionL [aFh,aFi,aFj,aFo],aFZ)
; (UnionL [aFh,aFi,aFj,aFk],aFK)
; (aFU,aFo)
; (aFK,aFl)
; (aFP,aFn)
; (aFZ,aFp)

; WANTEDS (Thoralf style)
; (UnionL [aFh,aFi,UnionL [aFh,aFi,aFw,aFx],aFz],aFn)
; (UnionL [aFh,aFi,aFw,UnionL [aFh,aFi,aFx,aFz]],aFp)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aGr} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGw} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; GIVENS (names)
;  aFj  <=  a
;  aFk  <=  b
;  aFl  <=  ab
;  aFm  <=  c
;  aFn  <=  abc
;  aFo  <=  bc
;  aFp  <=  abc'
;  aFK  <=  fsk_aFK
;  aFP  <=  fsk_aFP
;  aFU  <=  fsk_aFU
;  aFZ  <=  fsk_aFZ
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaFi)) (y (Maybe SortaFi))) (=> ((_ is (just (SortaFi) (Maybe SortaFi))) x) (= (either1940284190886833336 x y) x))))
; (assert (forall ((y (Maybe SortaFi))) (= (either1940284190886833336 (as nothing (Maybe SortaFi)) y) y)))
; (declare-const aFK (Array SortaFh (Maybe SortaFi)))
; (declare-const aFP (Array SortaFh (Maybe SortaFi)))
; (declare-const aFU (Array SortaFh (Maybe SortaFi)))
; (declare-const aFZ (Array SortaFh (Maybe SortaFi)))
; (declare-const aFj (Array SortaFh (Maybe SortaFi)))
; (declare-const aFk (Array SortaFh (Maybe SortaFi)))
; (declare-const aFl (Array SortaFh (Maybe SortaFi)))
; (declare-const aFm (Array SortaFh (Maybe SortaFi)))
; (declare-const aFn (Array SortaFh (Maybe SortaFi)))
; (declare-const aFo (Array SortaFh (Maybe SortaFi)))
; (declare-const aFp (Array SortaFh (Maybe SortaFi)))
; (declare-fun either1940284190886833336 ((Maybe SortaFi) (Maybe SortaFi)) (Maybe SortaFi))
; (declare-sort SortaFh)
; (declare-sort SortaFi)
; DECS1 (unseen) 
(declare-sort SortaFh)
(declare-sort SortaFi)
(declare-const
   aFj
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFk
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFl
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFm
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFn
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFo
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFp
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFK
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFP
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFU
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFZ
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-fun
   either1940284190886833336
   (
     (Maybe SortaFi)
     (Maybe SortaFi))
   (Maybe SortaFi))
(assert
   (forall
      (
        (y
           (Maybe SortaFi)))
      (=
         (either1940284190886833336
            (as
               nothing
               (Maybe SortaFi))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaFi))
        (y
           (Maybe SortaFi)))
      (=>
         (
           (_
              is
              (just
                 (SortaFi)
                 (Maybe SortaFi)))
           x)
         (=
            (either1940284190886833336 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFk
           aFm)
         aFU)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFl
           aFm)
         aFP)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFo)
         aFZ)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFk)
         aFK)
      :named
      given-6.4))
(assert
   (!
      (= aFU aFo)
      :named
      given-6.5))
(assert
   (!
      (= aFK aFl)
      :named
      given-6.6))
(assert
   (!
      (= aFP aFn)
      :named
      given-6.7))
(assert
   (!
      (= aFZ aFp)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aGr} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGw} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; WANTEDS (names)
;  aFn  <=  abc
;  aFp  <=  abc'
;  aFw  <=  a_aFw
;  aFx  <=  b_aFx
;  aFz  <=  c_aFz
; DECS2 (seen) 
; (declare-const aFw (Array SortaFh (Maybe SortaFi)))
; (declare-const aFx (Array SortaFh (Maybe SortaFi)))
; (declare-const aFz (Array SortaFh (Maybe SortaFi)))
; DECS2 (unseen) 
(declare-const
   aFw
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFx
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFz
   (Array
      SortaFh
      (Maybe SortaFi)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 (
                   (_ map either1940284190886833336)
                   aFw
                   aFx)
                 aFz)
               aFn))
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 aFw
                 (
                   (_ map either1940284190886833336)
                   aFx
                   aFz))
               aFp)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      SortaFh!val!1
;      ()
;      SortaFh)
;   (declare-fun
;      SortaFh!val!0
;      ()
;      SortaFh)
;   (forall
;      (
;        (x SortaFh))
;      (or
;         (= x SortaFh!val!1)
;         (= x SortaFh!val!0)))
;   (declare-fun
;      SortaFi!val!0
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!5
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!1
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!2
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!4
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!3
;      ()
;      SortaFi)
;   (forall
;      (
;        (x SortaFi))
;      (or
;         (= x SortaFi!val!0)
;         (= x SortaFi!val!5)
;         (= x SortaFi!val!1)
;         (= x SortaFi!val!2)
;         (= x SortaFi!val!4)
;         (= x SortaFi!val!3)))
;   (define-fun
;      aFk
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= aFU aFo))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFk)
;         aFK))
;   (define-fun
;      aFn
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFl
;           aFm)
;         aFP))
;   (define-fun
;      aFp
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFj
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      aFK
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         nothing))
;   (define-fun
;      aFw
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      aFz
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!0))
;            SortaFh!val!0
;            nothing)
;         SortaFh!val!1
;         (just SortaFi!val!2)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFo)
;         aFZ))
;   (define-fun
;      aFx
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           nothing)
;         SortaFh!val!0
;         (just SortaFi!val!1)))
;   (define-fun
;      aFU
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFP
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFm
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           nothing)
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFk
;           aFm)
;         aFU))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         nothing))
;   (define-fun
;      aFo
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFZ
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= aFK aFl))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= aFP aFn))
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
;                      (_ map either1940284190886833336)
;                      (
;                        (_ map either1940284190886833336)
;                        aFw
;                        aFx)
;                      aFz)
;                    aFn)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1940284190886833336)
;                      aFw
;                      (
;                        (_ map either1940284190886833336)
;                        aFx
;                        aFz))
;                    aFp))))
;         (or a!1 a!2)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= aFZ aFp))
;   (define-fun
;      k!100
;      (
;        (x!0 SortaFh))
;      (Maybe SortaFi)
;      (ite
;         (= x!0 SortaFh!val!0)
;         (just SortaFi!val!4)
;         (ite
;            (= x!0 SortaFh!val!1)
;            (just SortaFi!val!3)
;            (just SortaFi!val!5))))
;   (define-fun
;      either1940284190886833336
;      (
;        (x!0
;           (Maybe SortaFi))
;        (x!1
;           (Maybe SortaFi)))
;      (Maybe SortaFi)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaFi!val!5))
;            (= x!1 nothing))
;         (just SortaFi!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaFi!val!5)))
;            (just SortaFi!val!5)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaFi!val!0)))
;               (just SortaFi!val!0)
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
;                           (just SortaFi!val!1)))
;                     (just SortaFi!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaFi!val!3)))
;                        (just SortaFi!val!3)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaFi!val!2)))
;                           (just SortaFi!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaFi!val!4))
;                                 (= x!1 nothing))
;                              (just SortaFi!val!4)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaFi!val!1))
;                                    (= x!1 nothing))
;                                 (just SortaFi!val!1)
;                                 (ite
;                                    (and
;                                       (= x!0 nothing)
;                                       (=
;                                          x!1
;                                          (just SortaFi!val!4)))
;                                    (just SortaFi!val!4)
;                                    (ite
;                                       (
;                                         (_ is just)
;                                         x!0)
;                                       x!0
;                                       x!1))))))))))))
;   (define-fun
;      k!106
;      (
;        (x!0 SortaFh))
;      (Maybe SortaFi)
;      (ite
;         (= x!0 SortaFh!val!0)
;         (just SortaFi!val!1)
;         (ite
;            (= x!0 SortaFh!val!1)
;            (just SortaFi!val!2)
;            (just SortaFi!val!0)))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aFV {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFQ {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aG0 {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFL {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFW {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFM {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFR {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aG1 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aGr} {3}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aGw} {3}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aFh,aFi,aFk,aFm],aFU)
; (UnionL [aFh,aFi,aFl,aFm],aFP)
; (UnionL [aFh,aFi,aFj,aFo],aFZ)
; (UnionL [aFh,aFi,aFj,aFk],aFK)
; (aFU,aFo)
; (aFK,aFl)
; (aFP,aFn)
; (aFZ,aFp)

; WANTEDS (Thoralf style)
; (UnionL [aFh,aFi,UnionL [aFh,aFi,aFw,aFx],aFz],aFn)
; (UnionL [aFh,aFi,aFw,UnionL [aFh,aFi,aFx,aFz]],aFp)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aGr} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGw} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; GIVENS (names)
;  aFj  <=  a
;  aFk  <=  b
;  aFl  <=  ab
;  aFm  <=  c
;  aFn  <=  abc
;  aFo  <=  bc
;  aFp  <=  abc'
;  aFK  <=  fsk_aFK
;  aFP  <=  fsk_aFP
;  aFU  <=  fsk_aFU
;  aFZ  <=  fsk_aFZ
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaFi)) (y (Maybe SortaFi))) (=> ((_ is (just (SortaFi) (Maybe SortaFi))) x) (= (either1940284190886833336 x y) x))))
; (assert (forall ((y (Maybe SortaFi))) (= (either1940284190886833336 (as nothing (Maybe SortaFi)) y) y)))
; (declare-const aFK (Array SortaFh (Maybe SortaFi)))
; (declare-const aFP (Array SortaFh (Maybe SortaFi)))
; (declare-const aFU (Array SortaFh (Maybe SortaFi)))
; (declare-const aFZ (Array SortaFh (Maybe SortaFi)))
; (declare-const aFj (Array SortaFh (Maybe SortaFi)))
; (declare-const aFk (Array SortaFh (Maybe SortaFi)))
; (declare-const aFl (Array SortaFh (Maybe SortaFi)))
; (declare-const aFm (Array SortaFh (Maybe SortaFi)))
; (declare-const aFn (Array SortaFh (Maybe SortaFi)))
; (declare-const aFo (Array SortaFh (Maybe SortaFi)))
; (declare-const aFp (Array SortaFh (Maybe SortaFi)))
; (declare-fun either1940284190886833336 ((Maybe SortaFi) (Maybe SortaFi)) (Maybe SortaFi))
; (declare-sort SortaFh)
; (declare-sort SortaFi)
; DECS1 (unseen) 
(declare-sort SortaFh)
(declare-sort SortaFi)
(declare-const
   aFj
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFk
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFl
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFm
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFn
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFo
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFp
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFK
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFP
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFU
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFZ
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-fun
   either1940284190886833336
   (
     (Maybe SortaFi)
     (Maybe SortaFi))
   (Maybe SortaFi))
(assert
   (forall
      (
        (y
           (Maybe SortaFi)))
      (=
         (either1940284190886833336
            (as
               nothing
               (Maybe SortaFi))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaFi))
        (y
           (Maybe SortaFi)))
      (=>
         (
           (_
              is
              (just
                 (SortaFi)
                 (Maybe SortaFi)))
           x)
         (=
            (either1940284190886833336 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFk
           aFm)
         aFU)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFl
           aFm)
         aFP)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFo)
         aFZ)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either1940284190886833336)
           aFj
           aFk)
         aFK)
      :named
      given-6.4))
(assert
   (!
      (= aFU aFo)
      :named
      given-6.5))
(assert
   (!
      (= aFK aFl)
      :named
      given-6.6))
(assert
   (!
      (= aFP aFn)
      :named
      given-6.7))
(assert
   (!
      (= aFZ aFp)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aGr} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      (
;        (_ map either1940284190886833336)
;        aFw
;        aFx)
;      aFz)
;    aFn)

;      [WD] hole{co_aGw} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1940284190886833336)
;      aFw
;      (
;        (_ map either1940284190886833336)
;        aFx
;        aFz))
;    aFp)

; WANTEDS (names)
;  aFn  <=  abc
;  aFp  <=  abc'
;  aFw  <=  a_aFw
;  aFx  <=  b_aFx
;  aFz  <=  c_aFz
; DECS2 (seen) 
; (declare-const aFw (Array SortaFh (Maybe SortaFi)))
; (declare-const aFx (Array SortaFh (Maybe SortaFi)))
; (declare-const aFz (Array SortaFh (Maybe SortaFi)))
; DECS2 (unseen) 
(declare-const
   aFw
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFx
   (Array
      SortaFh
      (Maybe SortaFi)))
(declare-const
   aFz
   (Array
      SortaFh
      (Maybe SortaFi)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 (
                   (_ map either1940284190886833336)
                   aFw
                   aFx)
                 aFz)
               aFn))
         (not
            (=
               (
                 (_ map either1940284190886833336)
                 aFw
                 (
                   (_ map either1940284190886833336)
                   aFx
                   aFz))
               aFp)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      SortaFh!val!1
;      ()
;      SortaFh)
;   (declare-fun
;      SortaFh!val!0
;      ()
;      SortaFh)
;   (forall
;      (
;        (x SortaFh))
;      (or
;         (= x SortaFh!val!1)
;         (= x SortaFh!val!0)))
;   (declare-fun
;      SortaFi!val!0
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!5
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!1
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!2
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!4
;      ()
;      SortaFi)
;   (declare-fun
;      SortaFi!val!3
;      ()
;      SortaFi)
;   (forall
;      (
;        (x SortaFi))
;      (or
;         (= x SortaFi!val!0)
;         (= x SortaFi!val!5)
;         (= x SortaFi!val!1)
;         (= x SortaFi!val!2)
;         (= x SortaFi!val!4)
;         (= x SortaFi!val!3)))
;   (define-fun
;      aFk
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         nothing))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= aFU aFo))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFk)
;         aFK))
;   (define-fun
;      aFn
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFl
;           aFm)
;         aFP))
;   (define-fun
;      aFp
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFj
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      aFK
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         nothing))
;   (define-fun
;      aFw
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (
;        (as
;           const
;           (Array
;              SortaFh
;              (Maybe SortaFi)))
;        nothing))
;   (define-fun
;      aFz
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!0))
;            SortaFh!val!0
;            nothing)
;         SortaFh!val!1
;         (just SortaFi!val!2)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFj
;           aFo)
;         aFZ))
;   (define-fun
;      aFx
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           nothing)
;         SortaFh!val!0
;         (just SortaFi!val!1)))
;   (define-fun
;      aFU
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFP
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFm
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaFh
;                 (Maybe SortaFi)))
;           nothing)
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1940284190886833336)
;           aFk
;           aFm)
;         aFU))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         nothing))
;   (define-fun
;      aFo
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      aFZ
;      ()
;      (Array
;         SortaFh
;         (Maybe SortaFi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaFh
;                    (Maybe SortaFi)))
;              (just SortaFi!val!5))
;            SortaFh!val!0
;            (just SortaFi!val!4))
;         SortaFh!val!1
;         (just SortaFi!val!3)))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= aFK aFl))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= aFP aFn))
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
;                      (_ map either1940284190886833336)
;                      (
;                        (_ map either1940284190886833336)
;                        aFw
;                        aFx)
;                      aFz)
;                    aFn)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1940284190886833336)
;                      aFw
;                      (
;                        (_ map either1940284190886833336)
;                        aFx
;                        aFz))
;                    aFp))))
;         (or a!1 a!2)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= aFZ aFp))
;   (define-fun
;      k!100
;      (
;        (x!0 SortaFh))
;      (Maybe SortaFi)
;      (ite
;         (= x!0 SortaFh!val!0)
;         (just SortaFi!val!4)
;         (ite
;            (= x!0 SortaFh!val!1)
;            (just SortaFi!val!3)
;            (just SortaFi!val!5))))
;   (define-fun
;      either1940284190886833336
;      (
;        (x!0
;           (Maybe SortaFi))
;        (x!1
;           (Maybe SortaFi)))
;      (Maybe SortaFi)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaFi!val!5))
;            (= x!1 nothing))
;         (just SortaFi!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaFi!val!5)))
;            (just SortaFi!val!5)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaFi!val!0)))
;               (just SortaFi!val!0)
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
;                           (just SortaFi!val!1)))
;                     (just SortaFi!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaFi!val!3)))
;                        (just SortaFi!val!3)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaFi!val!2)))
;                           (just SortaFi!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaFi!val!4))
;                                 (= x!1 nothing))
;                              (just SortaFi!val!4)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaFi!val!1))
;                                    (= x!1 nothing))
;                                 (just SortaFi!val!1)
;                                 (ite
;                                    (and
;                                       (= x!0 nothing)
;                                       (=
;                                          x!1
;                                          (just SortaFi!val!4)))
;                                    (just SortaFi!val!4)
;                                    (ite
;                                       (
;                                         (_ is just)
;                                         x!0)
;                                       x!0
;                                       x!1))))))))))))
;   (define-fun
;      k!106
;      (
;        (x!0 SortaFh))
;      (Maybe SortaFi)
;      (ite
;         (= x!0 SortaFh!val!0)
;         (just SortaFi!val!1)
;         (ite
;            (= x!0 SortaFh!val!1)
;            (just SortaFi!val!2)
;            (just SortaFi!val!0)))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aH6 {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aH3 {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aH7 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aH9 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHe} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aGQ,"ok",2],aH5)
; (Alter [Symbol [],Nat [],aGP,"ok",2],aH2)
; (aH5,aGR)
; (aH2,aGQ)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],aGU,"ok",2],aGQ)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aHe} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGU
;       "ok"
;       (just 2))
;    aGQ)

; GIVENS (names)
;  aGP  <=  m1
;  aGQ  <=  m2
;  aGR  <=  m3
;  aH2  <=  fsk_aH2
;  aH5  <=  fsk_aH5
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aGP (Array String (Maybe Int)))
; (declare-const aGQ (Array String (Maybe Int)))
; (declare-const aGR (Array String (Maybe Int)))
; (declare-const aH2 (Array String (Maybe Int)))
; (declare-const aH5 (Array String (Maybe Int)))
(declare-const
   aGP
   (Array
      String
      (Maybe Int)))
(declare-const
   aGQ
   (Array
      String
      (Maybe Int)))
(declare-const
   aGR
   (Array
      String
      (Maybe Int)))
(declare-const
   aH2
   (Array
      String
      (Maybe Int)))
(declare-const
   aH5
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aGQ
            "ok"
            (just 2))
         aH5)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aGP
            "ok"
            (just 2))
         aH2)
      :named
      given-8.2))
(assert
   (!
      (= aH5 aGR)
      :named
      given-8.3))
(assert
   (!
      (= aH2 aGQ)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aHe} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGU
;       "ok"
;       (just 2))
;    aGQ)

; WANTEDS (names)
;  aGQ  <=  m2
;  aGU  <=  m1_aGU
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGU (Array String (Maybe Int)))
(declare-const
   aGU
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aGU
               "ok"
               (just 2))
            aGQ))
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
;      (= aH5 aGR))
;   (define-fun
;      given-8.4
;      ()
;      Bool
;      (= aH2 aGQ))
;   (define-fun
;      aH5
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
;      aGU
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
;      aGP
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
;      given-8.2
;      ()
;      Bool
;      (=
;         (store
;            aGP
;            "ok"
;            (just 2))
;         aH2))
;   (define-fun
;      aGR
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
;               aGU
;               "ok"
;               (just 2))
;            aGQ)))
;   (define-fun
;      aGQ
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
;      aH2
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
;            aGQ
;            "ok"
;            (just 2))
;         aH5)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aH6 {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aH3 {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aH7 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aH9 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHe} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aGQ,"ok",2],aH5)
; (Alter [Symbol [],Nat [],aGP,"ok",2],aH2)
; (aH5,aGR)
; (aH2,aGQ)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],aGU,"ok",2],aGQ)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aHe} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGU
;       "ok"
;       (just 2))
;    aGQ)

; GIVENS (names)
;  aGP  <=  m1
;  aGQ  <=  m2
;  aGR  <=  m3
;  aH2  <=  fsk_aH2
;  aH5  <=  fsk_aH5
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aGP (Array String (Maybe Int)))
; (declare-const aGQ (Array String (Maybe Int)))
; (declare-const aGR (Array String (Maybe Int)))
; (declare-const aH2 (Array String (Maybe Int)))
; (declare-const aH5 (Array String (Maybe Int)))
(declare-const
   aGP
   (Array
      String
      (Maybe Int)))
(declare-const
   aGQ
   (Array
      String
      (Maybe Int)))
(declare-const
   aGR
   (Array
      String
      (Maybe Int)))
(declare-const
   aH2
   (Array
      String
      (Maybe Int)))
(declare-const
   aH5
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aGQ
            "ok"
            (just 2))
         aH5)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aGP
            "ok"
            (just 2))
         aH2)
      :named
      given-8.2))
(assert
   (!
      (= aH5 aGR)
      :named
      given-8.3))
(assert
   (!
      (= aH2 aGQ)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aHe} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGU
;       "ok"
;       (just 2))
;    aGQ)

; WANTEDS (names)
;  aGQ  <=  m2
;  aGU  <=  m1_aGU
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGU (Array String (Maybe Int)))
(declare-const
   aGU
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aGU
               "ok"
               (just 2))
            aGQ))
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
;      (= aH5 aGR))
;   (define-fun
;      given-8.4
;      ()
;      Bool
;      (= aH2 aGQ))
;   (define-fun
;      aH5
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
;      aGU
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
;      aGP
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
;      given-8.2
;      ()
;      Bool
;      (=
;         (store
;            aGP
;            "ok"
;            (just 2))
;         aH2))
;   (define-fun
;      aGR
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
;               aGU
;               "ok"
;               (just 2))
;            aGQ)))
;   (define-fun
;      aGQ
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
;      aH2
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
;            aGQ
;            "ok"
;            (just 2))
;         aH5)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_aHP {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHM {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHQ {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aHS {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHX} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aHw,aHy,"bob"],aHO)
; (Delete [Symbol [],aHw,aHx,"bob"],aHL)
; (aHO,aHz)
; (aHL,aHy)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aHw,aHD,"bob"],aHy)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_aHX} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHD
;       "bob"
;       (as
;          nothing
;          (Maybe SortaHw)))
;    aHy)

; GIVENS (names)
;  aHx  <=  m1
;  aHy  <=  m2
;  aHz  <=  m3
;  aHL  <=  fsk_aHL
;  aHO  <=  fsk_aHO
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aHL (Array String (Maybe SortaHw)))
; (declare-const aHO (Array String (Maybe SortaHw)))
; (declare-const aHx (Array String (Maybe SortaHw)))
; (declare-const aHy (Array String (Maybe SortaHw)))
; (declare-const aHz (Array String (Maybe SortaHw)))
; (declare-sort SortaHw)
(declare-sort SortaHw)
(declare-const
   aHx
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHy
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHz
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHL
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHO
   (Array
      String
      (Maybe SortaHw)))
(assert
   (!
      (=
         (store
            aHy
            "bob"
            (as
               nothing
               (Maybe SortaHw)))
         aHO)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            aHx
            "bob"
            (as
               nothing
               (Maybe SortaHw)))
         aHL)
      :named
      given-10.2))
(assert
   (!
      (= aHO aHz)
      :named
      given-10.3))
(assert
   (!
      (= aHL aHy)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_aHX} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHD
;       "bob"
;       (as
;          nothing
;          (Maybe SortaHw)))
;    aHy)

; WANTEDS (names)
;  aHy  <=  m2
;  aHD  <=  m1_aHD
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHD (Array String (Maybe SortaHw)))
(declare-const
   aHD
   (Array
      String
      (Maybe SortaHw)))
(assert
   (!
      (not
         (=
            (store
               aHD
               "bob"
               (as
                  nothing
                  (Maybe SortaHw)))
            aHy))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      SortaHw!val!1
;      ()
;      SortaHw)
;   (declare-fun
;      SortaHw!val!2
;      ()
;      SortaHw)
;   (declare-fun
;      SortaHw!val!0
;      ()
;      SortaHw)
;   (forall
;      (
;        (x SortaHw))
;      (or
;         (= x SortaHw!val!1)
;         (= x SortaHw!val!2)
;         (= x SortaHw!val!0)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store aHy "bob" nothing)
;         aHO))
;   (define-fun
;      aHL
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      aHz
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= aHL aHy))
;   (define-fun
;      aHO
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store aHx "bob" nothing)
;         aHL))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= aHO aHz))
;   (define-fun
;      aHD
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaHw)))
;           (just SortaHw!val!2))
;         "b"
;         (just SortaHw!val!0)))
;   (define-fun
;      aHy
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      aHx
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaHw)))
;           (just SortaHw!val!1))
;         "b"
;         nothing))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store aHD "bob" nothing)
;            aHy))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_aHP {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHM {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHQ {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aHS {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHX} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aHw,aHy,"bob"],aHO)
; (Delete [Symbol [],aHw,aHx,"bob"],aHL)
; (aHO,aHz)
; (aHL,aHy)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aHw,aHD,"bob"],aHy)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_aHX} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHD
;       "bob"
;       (as
;          nothing
;          (Maybe SortaHw)))
;    aHy)

; GIVENS (names)
;  aHx  <=  m1
;  aHy  <=  m2
;  aHz  <=  m3
;  aHL  <=  fsk_aHL
;  aHO  <=  fsk_aHO
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aHL (Array String (Maybe SortaHw)))
; (declare-const aHO (Array String (Maybe SortaHw)))
; (declare-const aHx (Array String (Maybe SortaHw)))
; (declare-const aHy (Array String (Maybe SortaHw)))
; (declare-const aHz (Array String (Maybe SortaHw)))
; (declare-sort SortaHw)
(declare-sort SortaHw)
(declare-const
   aHx
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHy
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHz
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHL
   (Array
      String
      (Maybe SortaHw)))
(declare-const
   aHO
   (Array
      String
      (Maybe SortaHw)))
(assert
   (!
      (=
         (store
            aHy
            "bob"
            (as
               nothing
               (Maybe SortaHw)))
         aHO)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            aHx
            "bob"
            (as
               nothing
               (Maybe SortaHw)))
         aHL)
      :named
      given-10.2))
(assert
   (!
      (= aHO aHz)
      :named
      given-10.3))
(assert
   (!
      (= aHL aHy)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_aHX} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aHD
;       "bob"
;       (as
;          nothing
;          (Maybe SortaHw)))
;    aHy)

; WANTEDS (names)
;  aHy  <=  m2
;  aHD  <=  m1_aHD
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHD (Array String (Maybe SortaHw)))
(declare-const
   aHD
   (Array
      String
      (Maybe SortaHw)))
(assert
   (!
      (not
         (=
            (store
               aHD
               "bob"
               (as
                  nothing
                  (Maybe SortaHw)))
            aHy))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      SortaHw!val!1
;      ()
;      SortaHw)
;   (declare-fun
;      SortaHw!val!2
;      ()
;      SortaHw)
;   (declare-fun
;      SortaHw!val!0
;      ()
;      SortaHw)
;   (forall
;      (
;        (x SortaHw))
;      (or
;         (= x SortaHw!val!1)
;         (= x SortaHw!val!2)
;         (= x SortaHw!val!0)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store aHy "bob" nothing)
;         aHO))
;   (define-fun
;      aHL
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      aHz
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= aHL aHy))
;   (define-fun
;      aHO
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store aHx "bob" nothing)
;         aHL))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= aHO aHz))
;   (define-fun
;      aHD
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaHw)))
;           (just SortaHw!val!2))
;         "b"
;         (just SortaHw!val!0)))
;   (define-fun
;      aHy
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaHw)))
;              (just SortaHw!val!1))
;            "b"
;            nothing)
;         "bob"
;         nothing))
;   (define-fun
;      aHx
;      ()
;      (Array
;         String
;         (Maybe SortaHw))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaHw)))
;           (just SortaHw!val!1))
;         "b"
;         nothing))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store aHD "bob" nothing)
;            aHy))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aJp} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                         ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_aJp} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
;      [WD] hole{co_aJp} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
; [G] co_aJI {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aJD {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aJN {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aJy {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aJJ {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aJz {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aJE {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aJO {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIq} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aIb,aIc,aIe,aIg],aJH)
; (IntersectL [aIb,aIc,aIf,aIg],aJC)
; (IntersectL [aIb,aIc,aId,aIi],aJM)
; (IntersectL [aIb,aIc,aId,aIe],aJx)
; (aJH,aIi)
; (aJx,aIf)
; (aJC,aIh)
; (aJM,aIj)

; WANTEDS (Thoralf style)
; (aIh,aIj)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_aIq} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aIh aIj)

; GIVENS (names)
;  aId  <=  a
;  aIe  <=  b
;  aIf  <=  ab
;  aIg  <=  c
;  aIh  <=  abc
;  aIi  <=  bc
;  aIj  <=  abc'
;  aJx  <=  fsk_aJx
;  aJC  <=  fsk_aJC
;  aJH  <=  fsk_aJH
;  aJM  <=  fsk_aJM
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaIc)) (y (Maybe SortaIc))) (=> (and ((_ is (just (SortaIc) (Maybe SortaIc))) x) ((_ is (just (SortaIc) (Maybe SortaIc))) y)) (= (both1947059381538544945 x y) x))))
; (assert (forall ((y (Maybe SortaIc))) (= (both1947059381538544945 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaIc))) (= (both1947059381538544945 y (as nothing (Maybe SortaIc))) (as nothing (Maybe SortaIc)))))
; (declare-const aId (Array SortaIb (Maybe SortaIc)))
; (declare-const aIe (Array SortaIb (Maybe SortaIc)))
; (declare-const aIf (Array SortaIb (Maybe SortaIc)))
; (declare-const aIg (Array SortaIb (Maybe SortaIc)))
; (declare-const aIh (Array SortaIb (Maybe SortaIc)))
; (declare-const aIi (Array SortaIb (Maybe SortaIc)))
; (declare-const aIj (Array SortaIb (Maybe SortaIc)))
; (declare-const aJC (Array SortaIb (Maybe SortaIc)))
; (declare-const aJH (Array SortaIb (Maybe SortaIc)))
; (declare-const aJM (Array SortaIb (Maybe SortaIc)))
; (declare-const aJx (Array SortaIb (Maybe SortaIc)))
; (declare-fun both1947059381538544945 ((Maybe SortaIc) (Maybe SortaIc)) (Maybe SortaIc))
; (declare-sort SortaIb)
; (declare-sort SortaIc)
(declare-sort SortaIb)
(declare-sort SortaIc)
(declare-const
   aId
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aIe
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aIf
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aIg
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aIh
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aIi
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aIj
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aJx
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aJC
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aJH
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-const
   aJM
   (Array
      SortaIb
      (Maybe SortaIc)))
(declare-fun
   both1947059381538544945
   (
     (Maybe SortaIc)
     (Maybe SortaIc))
   (Maybe SortaIc))
(assert
   (forall
      (
        (y
           (Maybe SortaIc)))
      (=
         (both1947059381538544945
            y
            (as
               nothing
               (Maybe SortaIc)))
         (as
            nothing
            (Maybe SortaIc)))))
(assert
   (forall
      (
        (y
           (Maybe SortaIc)))
      (=
         (both1947059381538544945 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaIc))
        (y
           (Maybe SortaIc)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaIc)
                    (Maybe SortaIc)))
              x)
            (
              (_
                 is
                 (just
                    (SortaIc)
                    (Maybe SortaIc)))
              y))
         (=
            (both1947059381538544945 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1947059381538544945)
           aIe
           aIg)
         aJH)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both1947059381538544945)
           aIf
           aIg)
         aJC)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both1947059381538544945)
           aId
           aIi)
         aJM)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both1947059381538544945)
           aId
           aIe)
         aJx)
      :named
      given-13.4))
(assert
   (!
      (= aJH aIi)
      :named
      given-13.5))
(assert
   (!
      (= aJx aIf)
      :named
      given-13.6))
(assert
   (!
      (= aJC aIh)
      :named
      given-13.7))
(assert
   (!
      (= aJM aIj)
      :named
      given-13.8))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_aIq} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aIh aIj)

; WANTEDS (names)
;  aIh  <=  abc
;  aIj  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aIh aIj))
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
;           (Maybe SortaIc)))
;      (=
;         (both1947059381538544945
;            y
;            (as
;               nothing
;               (Maybe SortaIc)))
;         (as
;            nothing
;            (Maybe SortaIc))))
;   (forall
;      (
;        (y
;           (Maybe SortaIc)))
;      (=
;         (both1947059381538544945 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe SortaIc))
;        (y
;           (Maybe SortaIc)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (SortaIc)
;                    (Maybe SortaIc)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (SortaIc)
;                    (Maybe SortaIc)))
;              y))
;         (=
;            (both1947059381538544945 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both1947059381538544945)
;           aIe
;           aIg)
;         aJH)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map both1947059381538544945)
;           aIf
;           aIg)
;         aJC)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map both1947059381538544945)
;           aId
;           aIi)
;         aJM)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map both1947059381538544945)
;           aId
;           aIe)
;         aJx)
;      :named
;      given-13.4)
;   (!
;      (= aJH aIi)
;      :named
;      given-13.5)
;   (!
;      (= aJx aIf)
;      :named
;      given-13.6)
;   (!
;      (= aJC aIh)
;      :named
;      given-13.7)
;   (!
;      (= aJM aIj)
;      :named
;      given-13.8)
;   (!
;      (not
;         (= aIh aIj))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.3
;    given-13.1
;    given-13.2
;    wanted-13
;    given-13.5
;    given-13.4
;    given-13.7
;    given-13.8
;    given-13.6)
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
; [G] co_aK2 {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aJX {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aK7 {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aJS {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aK3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aJT {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aJY {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aK8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aII} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aIt,aIu,aIw,aIy],aK1)
; (UnionL [aIt,aIu,aIx,aIy],aJW)
; (UnionL [aIt,aIu,aIv,aIA],aK6)
; (UnionL [aIt,aIu,aIv,aIw],aJR)
; (aK1,aIA)
; (aJR,aIx)
; (aJW,aIz)
; (aK6,aIB)

; WANTEDS (Thoralf style)
; (aIz,aIB)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_aII} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aIz aIB)

; GIVENS (names)
;  aIv  <=  a
;  aIw  <=  b
;  aIx  <=  ab
;  aIy  <=  c
;  aIz  <=  abc
;  aIA  <=  bc
;  aIB  <=  abc'
;  aJR  <=  fsk_aJR
;  aJW  <=  fsk_aJW
;  aK1  <=  fsk_aK1
;  aK6  <=  fsk_aK6
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaIu)) (y (Maybe SortaIu))) (=> ((_ is (just (SortaIu) (Maybe SortaIu))) x) (= (either1947043988375749995 x y) x))))
; (assert (forall ((y (Maybe SortaIu))) (= (either1947043988375749995 (as nothing (Maybe SortaIu)) y) y)))
; (declare-const aIA (Array SortaIt (Maybe SortaIu)))
; (declare-const aIB (Array SortaIt (Maybe SortaIu)))
; (declare-const aIv (Array SortaIt (Maybe SortaIu)))
; (declare-const aIw (Array SortaIt (Maybe SortaIu)))
; (declare-const aIx (Array SortaIt (Maybe SortaIu)))
; (declare-const aIy (Array SortaIt (Maybe SortaIu)))
; (declare-const aIz (Array SortaIt (Maybe SortaIu)))
; (declare-const aJR (Array SortaIt (Maybe SortaIu)))
; (declare-const aJW (Array SortaIt (Maybe SortaIu)))
; (declare-const aK1 (Array SortaIt (Maybe SortaIu)))
; (declare-const aK6 (Array SortaIt (Maybe SortaIu)))
; (declare-fun either1947043988375749995 ((Maybe SortaIu) (Maybe SortaIu)) (Maybe SortaIu))
; (declare-sort SortaIt)
; (declare-sort SortaIu)
(declare-sort SortaIt)
(declare-sort SortaIu)
(declare-const
   aIv
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aIw
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aIx
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aIy
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aIz
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aIA
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aIB
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aJR
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aJW
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aK1
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-const
   aK6
   (Array
      SortaIt
      (Maybe SortaIu)))
(declare-fun
   either1947043988375749995
   (
     (Maybe SortaIu)
     (Maybe SortaIu))
   (Maybe SortaIu))
(assert
   (forall
      (
        (y
           (Maybe SortaIu)))
      (=
         (either1947043988375749995
            (as
               nothing
               (Maybe SortaIu))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaIu))
        (y
           (Maybe SortaIu)))
      (=>
         (
           (_
              is
              (just
                 (SortaIu)
                 (Maybe SortaIu)))
           x)
         (=
            (either1947043988375749995 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1947043988375749995)
           aIw
           aIy)
         aK1)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either1947043988375749995)
           aIx
           aIy)
         aJW)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either1947043988375749995)
           aIv
           aIA)
         aK6)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either1947043988375749995)
           aIv
           aIw)
         aJR)
      :named
      given-15.4))
(assert
   (!
      (= aK1 aIA)
      :named
      given-15.5))
(assert
   (!
      (= aJR aIx)
      :named
      given-15.6))
(assert
   (!
      (= aJW aIz)
      :named
      given-15.7))
(assert
   (!
      (= aK6 aIB)
      :named
      given-15.8))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_aII} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aIz aIB)

; WANTEDS (names)
;  aIz  <=  abc
;  aIB  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aIz aIB))
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
;           (Maybe SortaIu)))
;      (=
;         (either1947043988375749995
;            (as
;               nothing
;               (Maybe SortaIu))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe SortaIu))
;        (y
;           (Maybe SortaIu)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (SortaIu)
;                 (Maybe SortaIu)))
;           x)
;         (=
;            (either1947043988375749995 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either1947043988375749995)
;           aIw
;           aIy)
;         aK1)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_ map either1947043988375749995)
;           aIx
;           aIy)
;         aJW)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_ map either1947043988375749995)
;           aIv
;           aIA)
;         aK6)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_ map either1947043988375749995)
;           aIv
;           aIw)
;         aJR)
;      :named
;      given-15.4)
;   (!
;      (= aK1 aIA)
;      :named
;      given-15.5)
;   (!
;      (= aJR aIx)
;      :named
;      given-15.6)
;   (!
;      (= aJW aIz)
;      :named
;      given-15.7)
;   (!
;      (= aK6 aIB)
;      :named
;      given-15.8)
;   (!
;      (not
;         (= aIz aIB))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.8
;    given-15.3
;    given-15.4
;    wanted-15
;    given-15.7
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
; [G] co_aKf {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aKc {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aKg {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aKi {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIS} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aIM,"ok",2],aKe)
; (Alter [Symbol [],Nat [],aIL,"ok",2],aKb)
; (aKe,aIN)
; (aKb,aIM)

; WANTEDS (Thoralf style)
; (aIM,aIN)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_aIS} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIM aIN)

; GIVENS (names)
;  aIL  <=  m1
;  aIM  <=  m2
;  aIN  <=  m3
;  aKb  <=  fsk_aKb
;  aKe  <=  fsk_aKe
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIL (Array String (Maybe Int)))
; (declare-const aIM (Array String (Maybe Int)))
; (declare-const aIN (Array String (Maybe Int)))
; (declare-const aKb (Array String (Maybe Int)))
; (declare-const aKe (Array String (Maybe Int)))
(declare-const
   aIL
   (Array
      String
      (Maybe Int)))
(declare-const
   aIM
   (Array
      String
      (Maybe Int)))
(declare-const
   aIN
   (Array
      String
      (Maybe Int)))
(declare-const
   aKb
   (Array
      String
      (Maybe Int)))
(declare-const
   aKe
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aIM
            "ok"
            (just 2))
         aKe)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            aIL
            "ok"
            (just 2))
         aKb)
      :named
      given-17.2))
(assert
   (!
      (= aKe aIN)
      :named
      given-17.3))
(assert
   (!
      (= aKb aIM)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_aIS} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIM aIN)

; WANTEDS (names)
;  aIM  <=  m2
;  aIN  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aIM aIN))
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
;            aIM
;            "ok"
;            (just 2))
;         aKe)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            aIL
;            "ok"
;            (just 2))
;         aKb)
;      :named
;      given-17.2)
;   (!
;      (= aKe aIN)
;      :named
;      given-17.3)
;   (!
;      (= aKb aIM)
;      :named
;      given-17.4)
;   (!
;      (not
;         (= aIM aIN))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.2 given-17.1 given-17.4 wanted-17 given-17.3)
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
; [G] co_aKp {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aKm {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aKq {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aKs {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJ3} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aIV,aIX,"bob"],aKo)
; (Delete [Symbol [],aIV,aIW,"bob"],aKl)
; (aKo,aIY)
; (aKl,aIX)

; WANTEDS (Thoralf style)
; (aIX,aIY)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_aJ3} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIX aIY)

; GIVENS (names)
;  aIW  <=  m1
;  aIX  <=  m2
;  aIY  <=  m3
;  aKl  <=  fsk_aKl
;  aKo  <=  fsk_aKo
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIW (Array String (Maybe SortaIV)))
; (declare-const aIX (Array String (Maybe SortaIV)))
; (declare-const aIY (Array String (Maybe SortaIV)))
; (declare-const aKl (Array String (Maybe SortaIV)))
; (declare-const aKo (Array String (Maybe SortaIV)))
; (declare-sort SortaIV)
(declare-sort SortaIV)
(declare-const
   aIW
   (Array
      String
      (Maybe SortaIV)))
(declare-const
   aIX
   (Array
      String
      (Maybe SortaIV)))
(declare-const
   aIY
   (Array
      String
      (Maybe SortaIV)))
(declare-const
   aKl
   (Array
      String
      (Maybe SortaIV)))
(declare-const
   aKo
   (Array
      String
      (Maybe SortaIV)))
(assert
   (!
      (=
         (store
            aIX
            "bob"
            (as
               nothing
               (Maybe SortaIV)))
         aKo)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            aIW
            "bob"
            (as
               nothing
               (Maybe SortaIV)))
         aKl)
      :named
      given-19.2))
(assert
   (!
      (= aKo aIY)
      :named
      given-19.3))
(assert
   (!
      (= aKl aIX)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_aJ3} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIX aIY)

; WANTEDS (names)
;  aIX  <=  m2
;  aIY  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aIX aIY))
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
;            aIX
;            "bob"
;            (as
;               nothing
;               (Maybe SortaIV)))
;         aKo)
;      :named
;      given-19.1)
;   (!
;      (=
;         (store
;            aIW
;            "bob"
;            (as
;               nothing
;               (Maybe SortaIV)))
;         aKl)
;      :named
;      given-19.2)
;   (!
;      (= aKo aIY)
;      :named
;      given-19.3)
;   (!
;      (= aKl aIX)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= aIX aIY))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.1 given-19.3 wanted-19 given-19.2 given-19.4)
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
; [WD] hole{co_a26m} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a265,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a26m} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a265
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
;      [WD] hole{co_a26m} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a265
;    (lit "63A"))

; WANTEDS (names)
;  a265  <=  t_a265
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a265 Type)
(declare-const a265 Type)
(assert
   (!
      (not
         (=
            a265
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
;            a265
;            (lit "63A"))))
;   (define-fun
;      a265
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
; [WD] hole{co_a26m} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a265,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a26m} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a265
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
;      [WD] hole{co_a26m} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a265
;    (lit "63A"))

; WANTEDS (names)
;  a265  <=  t_a265
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a265 Type)
(declare-const a265 Type)
(assert
   (!
      (not
         (=
            a265
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
;            a265
;            (lit "63A"))))
;   (define-fun
;      a265
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
; [WD] hole{co_a26I} {1}:: (b0 <? c0) ~ (b <? c) (CNonCanonical)
; [WD] hole{co_a26D} {1}:: (a0 <? b0) ~ (a <? b) (CNonCanonical)
; [WD] hole{co_a26N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a26s,a26t],<? [a26p,a26q])
; (<? [a26r,a26s],<? [a26o,a26p])
; (<? [a26r,a26t],<? [a26o,a26q])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a26I} {1}:: (b0 <? c0) ~ (b <? c) (CNonCanonical)
;  =>  (=
;    (< a26s a26t)
;    (< a26p a26q))

;      [WD] hole{co_a26D} {1}:: (a0 <? b0) ~ (a <? b) (CNonCanonical)
;  =>  (=
;    (< a26r a26s)
;    (< a26o a26p))

;      [WD] hole{co_a26N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a26r a26t)
;    (< a26o a26q))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a26I} {1}:: (b0 <? c0) ~ (b <? c) (CNonCanonical)
;  =>  (=
;    (< a26s a26t)
;    (< a26p a26q))

;      [WD] hole{co_a26D} {1}:: (a0 <? b0) ~ (a <? b) (CNonCanonical)
;  =>  (=
;    (< a26r a26s)
;    (< a26o a26p))

;      [WD] hole{co_a26N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a26r a26t)
;    (< a26o a26q))

; WANTEDS (names)
;  a26o  <=  a
;  a26p  <=  b
;  a26q  <=  c
;  a26r  <=  a_a26r
;  a26s  <=  b_a26s
;  a26t  <=  c_a26t
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a26o))
; (assert (<= 0 a26p))
; (assert (<= 0 a26q))
; (assert (<= 0 a26r))
; (assert (<= 0 a26s))
; (assert (<= 0 a26t))
; (declare-const a26o Int)
; (declare-const a26p Int)
; (declare-const a26q Int)
; (declare-const a26r Int)
; (declare-const a26s Int)
; (declare-const a26t Int)
(declare-const a26o Int)
(declare-const a26p Int)
(declare-const a26q Int)
(declare-const a26r Int)
(declare-const a26s Int)
(declare-const a26t Int)
(assert
   (<= 0 a26o))
(assert
   (<= 0 a26p))
(assert
   (<= 0 a26q))
(assert
   (<= 0 a26r))
(assert
   (<= 0 a26s))
(assert
   (<= 0 a26t))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a26s a26t)
                  (< a26p a26q)))
            (not
               (=
                  (< a26r a26s)
                  (< a26o a26p))))
         (not
            (=
               (< a26r a26t)
               (< a26o a26q))))
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
;               (< a26s a26t)
;               (< a26p a26q)))
;         (not
;            (=
;               (< a26r a26s)
;               (< a26o a26p)))
;         (not
;            (=
;               (< a26r a26t)
;               (< a26o a26q)))))
;   (define-fun
;      a26q
;      ()
;      Int
;      1)
;   (define-fun
;      a26o
;      ()
;      Int
;      0)
;   (define-fun
;      a26r
;      ()
;      Int
;      0)
;   (define-fun
;      a26t
;      ()
;      Int
;      0)
;   (define-fun
;      a26p
;      ()
;      Int
;      0)
;   (define-fun
;      a26s
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a26I} {1}:: (b0 <? c0) ~ (b <? c) (CNonCanonical)
; [WD] hole{co_a26D} {1}:: (a0 <? b0) ~ (a <? b) (CNonCanonical)
; [WD] hole{co_a26N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a26s,a26t],<? [a26p,a26q])
; (<? [a26r,a26s],<? [a26o,a26p])
; (<? [a26r,a26t],<? [a26o,a26q])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a26I} {1}:: (b0 <? c0) ~ (b <? c) (CNonCanonical)
;  =>  (=
;    (< a26s a26t)
;    (< a26p a26q))

;      [WD] hole{co_a26D} {1}:: (a0 <? b0) ~ (a <? b) (CNonCanonical)
;  =>  (=
;    (< a26r a26s)
;    (< a26o a26p))

;      [WD] hole{co_a26N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a26r a26t)
;    (< a26o a26q))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a26I} {1}:: (b0 <? c0) ~ (b <? c) (CNonCanonical)
;  =>  (=
;    (< a26s a26t)
;    (< a26p a26q))

;      [WD] hole{co_a26D} {1}:: (a0 <? b0) ~ (a <? b) (CNonCanonical)
;  =>  (=
;    (< a26r a26s)
;    (< a26o a26p))

;      [WD] hole{co_a26N} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a26r a26t)
;    (< a26o a26q))

; WANTEDS (names)
;  a26o  <=  a
;  a26p  <=  b
;  a26q  <=  c
;  a26r  <=  a_a26r
;  a26s  <=  b_a26s
;  a26t  <=  c_a26t
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a26o))
; (assert (<= 0 a26p))
; (assert (<= 0 a26q))
; (assert (<= 0 a26r))
; (assert (<= 0 a26s))
; (assert (<= 0 a26t))
; (declare-const a26o Int)
; (declare-const a26p Int)
; (declare-const a26q Int)
; (declare-const a26r Int)
; (declare-const a26s Int)
; (declare-const a26t Int)
(declare-const a26o Int)
(declare-const a26p Int)
(declare-const a26q Int)
(declare-const a26r Int)
(declare-const a26s Int)
(declare-const a26t Int)
(assert
   (<= 0 a26o))
(assert
   (<= 0 a26p))
(assert
   (<= 0 a26q))
(assert
   (<= 0 a26r))
(assert
   (<= 0 a26s))
(assert
   (<= 0 a26t))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a26s a26t)
                  (< a26p a26q)))
            (not
               (=
                  (< a26r a26s)
                  (< a26o a26p))))
         (not
            (=
               (< a26r a26t)
               (< a26o a26q))))
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
;               (< a26s a26t)
;               (< a26p a26q)))
;         (not
;            (=
;               (< a26r a26s)
;               (< a26o a26p)))
;         (not
;            (=
;               (< a26r a26t)
;               (< a26o a26q)))))
;   (define-fun
;      a26q
;      ()
;      Int
;      1)
;   (define-fun
;      a26o
;      ()
;      Int
;      0)
;   (define-fun
;      a26r
;      ()
;      Int
;      0)
;   (define-fun
;      a26t
;      ()
;      Int
;      0)
;   (define-fun
;      a26p
;      ()
;      Int
;      0)
;   (define-fun
;      a26s
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a27n} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a27s} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a27d,a27e],+ [a27b,a27c])
; (+ [a27e,a27d],+ [a27c,a27b])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a27n} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a27d a27e)
;    (+ a27b a27c))

;      [WD] hole{co_a27s} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a27e a27d)
;    (+ a27c a27b))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a27n} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a27d a27e)
;    (+ a27b a27c))

;      [WD] hole{co_a27s} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a27e a27d)
;    (+ a27c a27b))

; WANTEDS (names)
;  a27b  <=  a
;  a27c  <=  b
;  a27d  <=  a_a27d
;  a27e  <=  b_a27e
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a27b))
; (assert (<= 0 a27c))
; (assert (<= 0 a27d))
; (assert (<= 0 a27e))
; (declare-const a27b Int)
; (declare-const a27c Int)
; (declare-const a27d Int)
; (declare-const a27e Int)
(declare-const a27b Int)
(declare-const a27c Int)
(declare-const a27d Int)
(declare-const a27e Int)
(assert
   (<= 0 a27b))
(assert
   (<= 0 a27c))
(assert
   (<= 0 a27d))
(assert
   (<= 0 a27e))
(assert
   (!
      (or
         (not
            (=
               (+ a27d a27e)
               (+ a27b a27c)))
         (not
            (=
               (+ a27e a27d)
               (+ a27c a27b))))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      a27c
;      ()
;      Int
;      0)
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a27d a27e)
;               (+ a27b a27c)))
;         (not
;            (=
;               (+ a27e a27d)
;               (+ a27c a27b)))))
;   (define-fun
;      a27b
;      ()
;      Int
;      0)
;   (define-fun
;      a27d
;      ()
;      Int
;      1)
;   (define-fun
;      a27e
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a27n} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a27s} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a27d,a27e],+ [a27b,a27c])
; (+ [a27e,a27d],+ [a27c,a27b])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a27n} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a27d a27e)
;    (+ a27b a27c))

;      [WD] hole{co_a27s} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a27e a27d)
;    (+ a27c a27b))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a27n} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a27d a27e)
;    (+ a27b a27c))

;      [WD] hole{co_a27s} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a27e a27d)
;    (+ a27c a27b))

; WANTEDS (names)
;  a27b  <=  a
;  a27c  <=  b
;  a27d  <=  a_a27d
;  a27e  <=  b_a27e
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a27b))
; (assert (<= 0 a27c))
; (assert (<= 0 a27d))
; (assert (<= 0 a27e))
; (declare-const a27b Int)
; (declare-const a27c Int)
; (declare-const a27d Int)
; (declare-const a27e Int)
(declare-const a27b Int)
(declare-const a27c Int)
(declare-const a27d Int)
(declare-const a27e Int)
(assert
   (<= 0 a27b))
(assert
   (<= 0 a27c))
(assert
   (<= 0 a27d))
(assert
   (<= 0 a27e))
(assert
   (!
      (or
         (not
            (=
               (+ a27d a27e)
               (+ a27b a27c)))
         (not
            (=
               (+ a27e a27d)
               (+ a27c a27b))))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      a27c
;      ()
;      Int
;      0)
;   (define-fun
;      wanted-4
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a27d a27e)
;               (+ a27b a27c)))
;         (not
;            (=
;               (+ a27e a27d)
;               (+ a27c a27b)))))
;   (define-fun
;      a27b
;      ()
;      Int
;      0)
;   (define-fun
;      a27d
;      ()
;      Int
;      1)
;   (define-fun
;      a27e
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
; [G] co_a2f9 {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fc {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fa {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a2fd {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2fj} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a282],a2f8)
; (+ [1,a284],a2fb)
; (a2f8,a27Q)
; (a2fb,a27R)

; WANTEDS (Thoralf style)
; (- [a284,a282],- [a27R,a27Q])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a2fj} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a284 a282)
;    (- a27R a27Q))

; GIVENS (names)
;  a27Q  <=  n
;  a27R  <=  m
;  a282  <=  n
;  a284  <=  n
;  a2f8  <=  fsk_a2f8
;  a2fb  <=  fsk_a2fb
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a27Q))
; (assert (<= 0 a27R))
; (assert (<= 0 a282))
; (assert (<= 0 a284))
; (assert (<= 0 a2f8))
; (assert (<= 0 a2fb))
; (declare-const a27Q Int)
; (declare-const a27R Int)
; (declare-const a282 Int)
; (declare-const a284 Int)
; (declare-const a2f8 Int)
; (declare-const a2fb Int)
(declare-const a27Q Int)
(declare-const a27R Int)
(declare-const a282 Int)
(declare-const a284 Int)
(declare-const a2f8 Int)
(declare-const a2fb Int)
(assert
   (<= 0 a27Q))
(assert
   (<= 0 a27R))
(assert
   (<= 0 a282))
(assert
   (<= 0 a284))
(assert
   (<= 0 a2f8))
(assert
   (<= 0 a2fb))
(assert
   (!
      (=
         (+ 1 a282)
         a2f8)
      :named
      given-10.1))
(assert
   (!
      (=
         (+ 1 a284)
         a2fb)
      :named
      given-10.2))
(assert
   (!
      (= a2f8 a27Q)
      :named
      given-10.3))
(assert
   (!
      (= a2fb a27R)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a2fj} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a284 a282)
;    (- a27R a27Q))

; WANTEDS (names)
;  a27Q  <=  n
;  a27R  <=  m
;  a282  <=  n
;  a284  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a284 a282)
            (- a27R a27Q)))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (<= 0 a27Q)
;   (<= 0 a27R)
;   (<= 0 a282)
;   (<= 0 a284)
;   (<= 0 a2f8)
;   (<= 0 a2fb)
;   (!
;      (=
;         (+ 1 a282)
;         a2f8)
;      :named
;      given-10.1)
;   (!
;      (=
;         (+ 1 a284)
;         a2fb)
;      :named
;      given-10.2)
;   (!
;      (= a2f8 a27Q)
;      :named
;      given-10.3)
;   (!
;      (= a2fb a27R)
;      :named
;      given-10.4)
;   (!
;      (not
;         (=
;            (- a284 a282)
;            (- a27R a27Q)))
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
; [G] co_a2fx {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fy {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2fG} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a296],a2fw)
; (a2fw,a290)

; WANTEDS (Thoralf style)
; (+ [1,+ [a296,a292]],+ [a290,a292])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a2fG} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a296 a292))
;    (+ a290 a292))

; GIVENS (names)
;  a290  <=  n
;  a296  <=  n
;  a2fw  <=  fsk_a2fw
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a290))
; (assert (<= 0 a296))
; (assert (<= 0 a2fw))
; (declare-const a290 Int)
; (declare-const a296 Int)
; (declare-const a2fw Int)
(declare-const a290 Int)
(declare-const a296 Int)
(declare-const a2fw Int)
(assert
   (<= 0 a290))
(assert
   (<= 0 a296))
(assert
   (<= 0 a2fw))
(assert
   (!
      (=
         (+ 1 a296)
         a2fw)
      :named
      given-17.1))
(assert
   (!
      (= a2fw a290)
      :named
      given-17.2))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a2fG} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a296 a292))
;    (+ a290 a292))

; WANTEDS (names)
;  a290  <=  n
;  a292  <=  m
;  a296  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a292))
; (declare-const a292 Int)
(declare-const a292 Int)
(assert
   (<= 0 a292))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a296 a292))
            (+ a290 a292)))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (<= 0 a290)
;   (<= 0 a296)
;   (<= 0 a2fw)
;   (!
;      (=
;         (+ 1 a296)
;         a2fw)
;      :named
;      given-17.1)
;   (!
;      (= a2fw a290)
;      :named
;      given-17.2)
;   (<= 0 a292)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a296 a292))
;            (+ a290 a292)))
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
; [G] co_a2fI {1}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a2fL {1}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a2fJ {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a2fM {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2fQ} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a2dh,a2di],a2fH)
; (<? [a2di,a2dj],a2fK)
; (a2fH,True [])
; (a2fK,True [])

; WANTEDS (Thoralf style)
; (<? [a2dh,a2dj],True [])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{co_a2fQ} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a2dh a2dj)
;    true)

; GIVENS (names)
;  a2dh  <=  a
;  a2di  <=  b
;  a2dj  <=  c
;  a2fH  <=  fsk_a2fH
;  a2fK  <=  fsk_a2fK
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2dh))
; (assert (<= 0 a2di))
; (assert (<= 0 a2dj))
; (declare-const a2dh Int)
; (declare-const a2di Int)
; (declare-const a2dj Int)
; (declare-const a2fH Bool)
; (declare-const a2fK Bool)
(declare-const a2dh Int)
(declare-const a2di Int)
(declare-const a2dj Int)
(declare-const a2fH Bool)
(declare-const a2fK Bool)
(assert
   (<= 0 a2dh))
(assert
   (<= 0 a2di))
(assert
   (<= 0 a2dj))
(assert
   (!
      (=
         (< a2dh a2di)
         a2fH)
      :named
      given-20.1))
(assert
   (!
      (=
         (< a2di a2dj)
         a2fK)
      :named
      given-20.2))
(assert
   (!
      (= a2fH true)
      :named
      given-20.3))
(assert
   (!
      (= a2fK true)
      :named
      given-20.4))
(check-sat)
; sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{co_a2fQ} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a2dh a2dj)
;    true)

; WANTEDS (names)
;  a2dh  <=  a
;  a2dj  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a2dh a2dj)
            true))
      :named
      wanted-20))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-20")
(get-assertions)
; (
;   (<= 0 a2dh)
;   (<= 0 a2di)
;   (<= 0 a2dj)
;   (!
;      (=
;         (< a2dh a2di)
;         a2fH)
;      :named
;      given-20.1)
;   (!
;      (=
;         (< a2di a2dj)
;         a2fK)
;      :named
;      given-20.2)
;   (!
;      (= a2fH true)
;      :named
;      given-20.3)
;   (!
;      (= a2fK true)
;      :named
;      given-20.4)
;   (!
;      (not
;         (=
;            (< a2dh a2dj)
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
; [G] co_a2fU {1}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a2fS {1}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a2dv {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2dy} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a2dt,a2du],a2fT)
; (+ [a2dt,a2dt],a2fR)
; (a2fR,a2fT)

; WANTEDS (Thoralf style)
; (a2dt,a2du)

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a2dy} {0}:: a ~ b (CNonCanonical)
;  =>  (= a2dt a2du)

; GIVENS (names)
;  a2dt  <=  a
;  a2du  <=  b
;  a2fR  <=  fsk_a2fR
;  a2fT  <=  fsk_a2fT
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2dt))
; (assert (<= 0 a2du))
; (assert (<= 0 a2fR))
; (assert (<= 0 a2fT))
; (declare-const a2dt Int)
; (declare-const a2du Int)
; (declare-const a2fR Int)
; (declare-const a2fT Int)
(declare-const a2dt Int)
(declare-const a2du Int)
(declare-const a2fR Int)
(declare-const a2fT Int)
(assert
   (<= 0 a2dt))
(assert
   (<= 0 a2du))
(assert
   (<= 0 a2fR))
(assert
   (<= 0 a2fT))
(assert
   (!
      (=
         (+ a2dt a2du)
         a2fT)
      :named
      given-22.1))
(assert
   (!
      (=
         (+ a2dt a2dt)
         a2fR)
      :named
      given-22.2))
(assert
   (!
      (= a2fR a2fT)
      :named
      given-22.3))
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a2dy} {0}:: a ~ b (CNonCanonical)
;  =>  (= a2dt a2du)

; WANTEDS (names)
;  a2dt  <=  a
;  a2du  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a2dt a2du))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a2dt)
;   (<= 0 a2du)
;   (<= 0 a2fR)
;   (<= 0 a2fT)
;   (!
;      (=
;         (+ a2dt a2du)
;         a2fT)
;      :named
;      given-22.1)
;   (!
;      (=
;         (+ a2dt a2dt)
;         a2fR)
;      :named
;      given-22.2)
;   (!
;      (= a2fR a2fT)
;      :named
;      given-22.3)
;   (!
;      (not
;         (= a2dt a2du))
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
; [WD] hole{co_a2fY} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2dC,a2dD],+ [a2dD,a2dC])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a2fY} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2dC a2dD)
;    (+ a2dD a2dC))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a2fY} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2dC a2dD)
;    (+ a2dD a2dC))

; WANTEDS (names)
;  a2dC  <=  a
;  a2dD  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2dC))
; (assert (<= 0 a2dD))
; (declare-const a2dC Int)
; (declare-const a2dD Int)
(declare-const a2dC Int)
(declare-const a2dD Int)
(assert
   (<= 0 a2dC))
(assert
   (<= 0 a2dD))
(assert
   (!
      (not
         (=
            (+ a2dC a2dD)
            (+ a2dD a2dC)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a2dC)
;   (<= 0 a2dD)
;   (!
;      (not
;         (=
;            (+ a2dC a2dD)
;            (+ a2dD a2dC)))
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
; [WD] hole{co_a2g6} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2dK,1],+ [1,a2dK])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{co_a2g6} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a2dK 1)
;    (+ 1 a2dK))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
;      [WD] hole{co_a2g6} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a2dK 1)
;    (+ 1 a2dK))

; WANTEDS (names)
;  a2dK  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2dK))
; (declare-const a2dK Int)
(declare-const a2dK Int)
(assert
   (<= 0 a2dK))
(assert
   (!
      (not
         (=
            (+ a2dK 1)
            (+ 1 a2dK)))
      :named
      wanted-24))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-24")
(get-assertions)
; (
;   (<= 0 a2dK)
;   (!
;      (not
;         (=
;            (+ a2dK 1)
;            (+ 1 a2dK)))
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
; [WD] hole{co_a3yw} {1}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a3yk} {1}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a3yw} {1}:: Alter
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

;      [WD] hole{co_a3yk} {1}:: Alter
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
;      [WD] hole{co_a3yw} {1}:: Alter
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

;      [WD] hole{co_a3yk} {1}:: Alter
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
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] co_a3yQ {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3yV {1}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] co_a3yR {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3yW {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3z1} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3wq,"price",Int []],a3yP)
; (Delete [Symbol [],TYPE [LiftedRep []],a3ws,a3wt],a3yU)
; (a3yP,a3wq)
; (a3yU,a3wq)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3ws,"price",Int []],a3ws)

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a3z1} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3ws
;       "price"
;       (just
;          (lit "3u")))
;    a3ws)

; GIVENS (names)
;  a3wq  <=  m
;  a3ws  <=  m
;  a3wt  <=  field
;  a3yP  <=  fsk_a3yP
;  a3yU  <=  fsk_a3yU
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a3wq (Array String (Maybe Type)))
; (declare-const a3ws (Array String (Maybe Type)))
; (declare-const a3wt String)
; (declare-const a3yP (Array String (Maybe Type)))
; (declare-const a3yU (Array String (Maybe Type)))
(declare-const
   a3wq
   (Array
      String
      (Maybe Type)))
(declare-const
   a3ws
   (Array
      String
      (Maybe Type)))
(declare-const a3wt String)
(declare-const
   a3yP
   (Array
      String
      (Maybe Type)))
(declare-const
   a3yU
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a3wq
            "price"
            (just
               (lit "3u")))
         a3yP)
      :named
      given-9.1))
(assert
   (!
      (=
         (store
            a3ws
            a3wt
            (as
               nothing
               (Maybe Type)))
         a3yU)
      :named
      given-9.2))
(assert
   (!
      (= a3yP a3wq)
      :named
      given-9.3))
(assert
   (!
      (= a3yU a3wq)
      :named
      given-9.4))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a3z1} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3ws
;       "price"
;       (just
;          (lit "3u")))
;    a3ws)

; WANTEDS (names)
;  a3ws  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a3ws
               "price"
               (just
                  (lit "3u")))
            a3ws))
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
;            a3wq
;            "price"
;            (just
;               (lit "3u")))
;         a3yP)
;      :named
;      given-9.1)
;   (!
;      (=
;         (store
;            a3ws
;            a3wt
;            (as
;               nothing
;               (Maybe Type)))
;         a3yU)
;      :named
;      given-9.2)
;   (!
;      (= a3yP a3wq)
;      :named
;      given-9.3)
;   (!
;      (= a3yU a3wq)
;      :named
;      given-9.4)
;   (!
;      (not
;         (=
;            (store
;               a3ws
;               "price"
;               (just
;                  (lit "3u")))
;            a3ws))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.3 given-9.2 given-9.4 given-9.1 wanted-9)
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
; [G] co_a3yQ {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3z8 {2}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] co_a3z5 {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3yR {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3z7 {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3wP} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3wq,"price",Int []],a3yP)
; (Alter [Symbol [],TYPE [LiftedRep []],a3wz,"price",a3wB],a3z3)
; (a3z3,a3wq)
; (a3yP,a3wq)
; (a3wA,"price")

; WANTEDS (Thoralf style)
; (a3wB,Int [])

(echo "givens-start-cycle-12")
; GIVENS (conversions)
;      [WD] hole{co_a3wP} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a3wB
;    (lit "3u"))

; GIVENS (names)
;  a3wq  <=  m
;  a3wz  <=  m
;  a3wA  <=  field
;  a3wB  <=  val
;  a3yP  <=  fsk_a3yP
;  a3z3  <=  fsk_a3z3
(push 1)
; DECS1 (seen) 
; (declare-const a3wq (Array String (Maybe Type)))
; (declare-const a3yP (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a3wA String)
; (declare-const a3wB Type)
; (declare-const a3wz (Array String (Maybe Type)))
; (declare-const a3z3 (Array String (Maybe Type)))
(declare-const
   a3wq
   (Array
      String
      (Maybe Type)))
(declare-const
   a3wz
   (Array
      String
      (Maybe Type)))
(declare-const a3wA String)
(declare-const a3wB Type)
(declare-const
   a3yP
   (Array
      String
      (Maybe Type)))
(declare-const
   a3z3
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a3wq
            "price"
            (just
               (lit "3u")))
         a3yP)
      :named
      given-12.1))
(assert
   (!
      (=
         (store
            a3wz
            "price"
            (just a3wB))
         a3z3)
      :named
      given-12.2))
(assert
   (!
      (= a3z3 a3wq)
      :named
      given-12.3))
(assert
   (!
      (= a3yP a3wq)
      :named
      given-12.4))
(assert
   (!
      (= a3wA "price")
      :named
      given-12.5))
(check-sat)
; sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
;      [WD] hole{co_a3wP} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a3wB
;    (lit "3u"))

; WANTEDS (names)
;  a3wB  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a3wB
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
;            a3wq
;            "price"
;            (just
;               (lit "3u")))
;         a3yP)
;      :named
;      given-12.1)
;   (!
;      (=
;         (store
;            a3wz
;            "price"
;            (just a3wB))
;         a3z3)
;      :named
;      given-12.2)
;   (!
;      (= a3z3 a3wq)
;      :named
;      given-12.3)
;   (!
;      (= a3yP a3wq)
;      :named
;      given-12.4)
;   (!
;      (= a3wA "price")
;      :named
;      given-12.5)
;   (!
;      (not
;         (=
;            a3wB
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
; [G] $dDisEquality_a3wR {0}:: DisEquality field "price" (CDictCan)
; [G] co_a3yQ {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3z4 {1}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] co_a3yR {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3z5 {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3zc} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a3wR {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a3wq,"price",Int []],a3yP)
; (Alter [Symbol [],TYPE [LiftedRep []],a3wz,a3wA,a3wB],a3z3)
; (a3yP,a3wq)
; (a3z3,a3wq)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3wz,"price",Int []],a3wz)

(echo "givens-start-cycle-14")
; GIVENS (conversions)
;      [WD] hole{co_a3zc} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3wz
;       "price"
;       (just
;          (lit "3u")))
;    a3wz)

; GIVENS (names)
;  a3wq  <=  m
;  a3wz  <=  m
;  a3wA  <=  field
;  a3wB  <=  val
;  a3yP  <=  fsk_a3yP
;  a3z3  <=  fsk_a3z3
(push 1)
; DECS1 (seen) 
; (declare-const a3wA String)
; (declare-const a3wB Type)
; (declare-const a3wq (Array String (Maybe Type)))
; (declare-const a3wz (Array String (Maybe Type)))
; (declare-const a3yP (Array String (Maybe Type)))
; (declare-const a3z3 (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a3wq
   (Array
      String
      (Maybe Type)))
(declare-const
   a3wz
   (Array
      String
      (Maybe Type)))
(declare-const a3wA String)
(declare-const a3wB Type)
(declare-const
   a3yP
   (Array
      String
      (Maybe Type)))
(declare-const
   a3z3
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a3wA "price"))
      :named
      given-14.1))
(assert
   (!
      (=
         (store
            a3wq
            "price"
            (just
               (lit "3u")))
         a3yP)
      :named
      given-14.2))
(assert
   (!
      (=
         (store
            a3wz
            a3wA
            (just a3wB))
         a3z3)
      :named
      given-14.3))
(assert
   (!
      (= a3yP a3wq)
      :named
      given-14.4))
(assert
   (!
      (= a3z3 a3wq)
      :named
      given-14.5))
(check-sat)
; sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
;      [WD] hole{co_a3zc} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3wz
;       "price"
;       (just
;          (lit "3u")))
;    a3wz)

; WANTEDS (names)
;  a3wz  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a3wz
               "price"
               (just
                  (lit "3u")))
            a3wz))
      :named
      wanted-14))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-14")
(get-assertions)
; (
;   (!
;      (not
;         (= a3wA "price"))
;      :named
;      given-14.1)
;   (!
;      (=
;         (store
;            a3wq
;            "price"
;            (just
;               (lit "3u")))
;         a3yP)
;      :named
;      given-14.2)
;   (!
;      (=
;         (store
;            a3wz
;            a3wA
;            (just a3wB))
;         a3z3)
;      :named
;      given-14.3)
;   (!
;      (= a3yP a3wq)
;      :named
;      given-14.4)
;   (!
;      (= a3z3 a3wq)
;      :named
;      given-14.5)
;   (!
;      (not
;         (=
;            (store
;               a3wz
;               "price"
;               (just
;                  (lit "3u")))
;            a3wz))
;      :named
;      wanted-14))
(get-unsat-core)
; (given-14.1
;    given-14.3
;    given-14.4
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
