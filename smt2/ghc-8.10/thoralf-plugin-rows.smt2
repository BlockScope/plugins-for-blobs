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
; [G] co_aDN {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aDI {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aDS {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aDD {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aDO {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aDE {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aDJ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aDT {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aE4} {2}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aEe} {2}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aD9,aDa,aDc,aDe],aDM)
; (IntersectL [aD9,aDa,aDd,aDe],aDH)
; (IntersectL [aD9,aDa,aDb,aDg],aDR)
; (IntersectL [aD9,aDa,aDb,aDc],aDC)
; (aDM,aDg)
; (aDC,aDd)
; (aDH,aDf)
; (aDR,aDh)

; WANTEDS (Thoralf style)
; (IntersectL [aD9,aDa,IntersectL [aD9,aDa,aDo,aDp],aDr],aDf)
; (IntersectL [aD9,aDa,aDo,IntersectL [aD9,aDa,aDp,aDr]],aDh)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aE4} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEe} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; GIVENS (names)
;  aDb  <=  a
;  aDc  <=  b
;  aDd  <=  ab
;  aDe  <=  c
;  aDf  <=  abc
;  aDg  <=  bc
;  aDh  <=  abc'
;  aDC  <=  fsk_aDC
;  aDH  <=  fsk_aDH
;  aDM  <=  fsk_aDM
;  aDR  <=  fsk_aDR
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaDa)) (y (Maybe SortaDa))) (=> (and ((_ is (just (SortaDa) (Maybe SortaDa))) x) ((_ is (just (SortaDa) (Maybe SortaDa))) y)) (= (both1942276505956773230 x y) x))))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 y (as nothing (Maybe SortaDa))) (as nothing (Maybe SortaDa)))))
; (declare-const aDC (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDH (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDM (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDR (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDb (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDc (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDd (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDe (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDf (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDg (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDh (Array SortaD9 (Maybe SortaDa)))
; (declare-fun both1942276505956773230 ((Maybe SortaDa) (Maybe SortaDa)) (Maybe SortaDa))
; (declare-sort SortaD9)
; (declare-sort SortaDa)
(declare-sort SortaD9)
(declare-sort SortaDa)
(declare-const
   aDb
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDc
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDd
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDe
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDf
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDg
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDh
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDC
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDH
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDM
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDR
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-fun
   both1942276505956773230
   (
     (Maybe SortaDa)
     (Maybe SortaDa))
   (Maybe SortaDa))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230
            y
            (as
               nothing
               (Maybe SortaDa)))
         (as
            nothing
            (Maybe SortaDa)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDa))
        (y
           (Maybe SortaDa)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              y))
         (=
            (both1942276505956773230 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDc
           aDe)
         aDM)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDd
           aDe)
         aDH)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDg)
         aDR)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDc)
         aDC)
      :named
      given-2.4))
(assert
   (!
      (= aDM aDg)
      :named
      given-2.5))
(assert
   (!
      (= aDC aDd)
      :named
      given-2.6))
(assert
   (!
      (= aDH aDf)
      :named
      given-2.7))
(assert
   (!
      (= aDR aDh)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aE4} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEe} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; WANTEDS (names)
;  aDf  <=  abc
;  aDh  <=  abc'
;  aDo  <=  a_aDo
;  aDp  <=  b_aDp
;  aDr  <=  c_aDr
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aDo (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDp (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDr (Array SortaD9 (Maybe SortaDa)))
(declare-const
   aDo
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDp
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDr
   (Array
      SortaD9
      (Maybe SortaDa)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 (
                   (_ map both1942276505956773230)
                   aDo
                   aDp)
                 aDr)
               aDf))
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 aDo
                 (
                   (_ map both1942276505956773230)
                   aDp
                   aDr))
               aDh)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaDa!val!0
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!2
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!5
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!6
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!4
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!1
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!3
;      ()
;      SortaDa)
;   (forall
;      (
;        (x SortaDa))
;      (or
;         (= x SortaDa!val!0)
;         (= x SortaDa!val!2)
;         (= x SortaDa!val!5)
;         (= x SortaDa!val!6)
;         (= x SortaDa!val!4)
;         (= x SortaDa!val!1)
;         (= x SortaDa!val!3)))
;   (declare-fun
;      SortaD9!val!0
;      ()
;      SortaD9)
;   (forall
;      (
;        (x SortaD9))
;      (= x SortaD9!val!0))
;   (define-fun
;      aDM
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDc
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= aDC aDd))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDd
;           aDe)
;         aDH))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
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
;                      (_ map both1942276505956773230)
;                      (
;                        (_ map both1942276505956773230)
;                        aDo
;                        aDp)
;                      aDr)
;                    aDf)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942276505956773230)
;                      aDo
;                      (
;                        (_ map both1942276505956773230)
;                        aDp
;                        aDr))
;                    aDh))))
;         (or a!1 a!2)))
;   (define-fun
;      aDh
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= aDM aDg))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= aDH aDf))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aDR aDh))
;   (define-fun
;      aDo
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!0))
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDC
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDg)
;         aDR))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDc)
;         aDC))
;   (define-fun
;      aDb
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!6))
;         SortaD9!val!0
;         (just SortaDa!val!5)))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDc
;           aDe)
;         aDM))
;   (define-fun
;      aDp
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!1))
;         SortaD9!val!0
;         (just SortaDa!val!3)))
;   (define-fun
;      aDr
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      aDe
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDd
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDf
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDg
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      both1942276505956773230
;      (
;        (x!0
;           (Maybe SortaDa))
;        (x!1
;           (Maybe SortaDa)))
;      (Maybe SortaDa)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDa!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDa!val!0))
;                  (=
;                     x!1
;                     (just SortaDa!val!1)))
;               (just SortaDa!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDa!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDa!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDa!val!2))
;                           (=
;                              x!1
;                              (just SortaDa!val!3)))
;                        (just SortaDa!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDa!val!2))
;                              (=
;                                 x!1
;                                 (just SortaDa!val!4)))
;                           (just SortaDa!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDa!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDa!val!3))
;                                    (=
;                                       x!1
;                                       (just SortaDa!val!4)))
;                                 (just SortaDa!val!3)
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
; [G] co_aDN {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aDI {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aDS {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aDD {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aDO {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aDE {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aDJ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aDT {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aE4} {2}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aEe} {2}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aD9,aDa,aDc,aDe],aDM)
; (IntersectL [aD9,aDa,aDd,aDe],aDH)
; (IntersectL [aD9,aDa,aDb,aDg],aDR)
; (IntersectL [aD9,aDa,aDb,aDc],aDC)
; (aDM,aDg)
; (aDC,aDd)
; (aDH,aDf)
; (aDR,aDh)

; WANTEDS (Thoralf style)
; (IntersectL [aD9,aDa,IntersectL [aD9,aDa,aDo,aDp],aDr],aDf)
; (IntersectL [aD9,aDa,aDo,IntersectL [aD9,aDa,aDp,aDr]],aDh)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aE4} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEe} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; GIVENS (names)
;  aDb  <=  a
;  aDc  <=  b
;  aDd  <=  ab
;  aDe  <=  c
;  aDf  <=  abc
;  aDg  <=  bc
;  aDh  <=  abc'
;  aDC  <=  fsk_aDC
;  aDH  <=  fsk_aDH
;  aDM  <=  fsk_aDM
;  aDR  <=  fsk_aDR
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaDa)) (y (Maybe SortaDa))) (=> (and ((_ is (just (SortaDa) (Maybe SortaDa))) x) ((_ is (just (SortaDa) (Maybe SortaDa))) y)) (= (both1942276505956773230 x y) x))))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 y (as nothing (Maybe SortaDa))) (as nothing (Maybe SortaDa)))))
; (declare-const aDC (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDH (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDM (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDR (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDb (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDc (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDd (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDe (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDf (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDg (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDh (Array SortaD9 (Maybe SortaDa)))
; (declare-fun both1942276505956773230 ((Maybe SortaDa) (Maybe SortaDa)) (Maybe SortaDa))
; (declare-sort SortaD9)
; (declare-sort SortaDa)
(declare-sort SortaD9)
(declare-sort SortaDa)
(declare-const
   aDb
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDc
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDd
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDe
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDf
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDg
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDh
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDC
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDH
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDM
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDR
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-fun
   both1942276505956773230
   (
     (Maybe SortaDa)
     (Maybe SortaDa))
   (Maybe SortaDa))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230
            y
            (as
               nothing
               (Maybe SortaDa)))
         (as
            nothing
            (Maybe SortaDa)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDa))
        (y
           (Maybe SortaDa)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              y))
         (=
            (both1942276505956773230 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDc
           aDe)
         aDM)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDd
           aDe)
         aDH)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDg)
         aDR)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDc)
         aDC)
      :named
      given-2.4))
(assert
   (!
      (= aDM aDg)
      :named
      given-2.5))
(assert
   (!
      (= aDC aDd)
      :named
      given-2.6))
(assert
   (!
      (= aDH aDf)
      :named
      given-2.7))
(assert
   (!
      (= aDR aDh)
      :named
      given-2.8))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aE4} {2}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEe} {2}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; WANTEDS (names)
;  aDf  <=  abc
;  aDh  <=  abc'
;  aDo  <=  a_aDo
;  aDp  <=  b_aDp
;  aDr  <=  c_aDr
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aDo (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDp (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDr (Array SortaD9 (Maybe SortaDa)))
(declare-const
   aDo
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDp
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDr
   (Array
      SortaD9
      (Maybe SortaDa)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 (
                   (_ map both1942276505956773230)
                   aDo
                   aDp)
                 aDr)
               aDf))
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 aDo
                 (
                   (_ map both1942276505956773230)
                   aDp
                   aDr))
               aDh)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaDa!val!0
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!2
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!5
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!6
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!4
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!1
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!3
;      ()
;      SortaDa)
;   (forall
;      (
;        (x SortaDa))
;      (or
;         (= x SortaDa!val!0)
;         (= x SortaDa!val!2)
;         (= x SortaDa!val!5)
;         (= x SortaDa!val!6)
;         (= x SortaDa!val!4)
;         (= x SortaDa!val!1)
;         (= x SortaDa!val!3)))
;   (declare-fun
;      SortaD9!val!0
;      ()
;      SortaD9)
;   (forall
;      (
;        (x SortaD9))
;      (= x SortaD9!val!0))
;   (define-fun
;      aDM
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDc
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.6
;      ()
;      Bool
;      (= aDC aDd))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDd
;           aDe)
;         aDH))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
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
;                      (_ map both1942276505956773230)
;                      (
;                        (_ map both1942276505956773230)
;                        aDo
;                        aDp)
;                      aDr)
;                    aDf)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942276505956773230)
;                      aDo
;                      (
;                        (_ map both1942276505956773230)
;                        aDp
;                        aDr))
;                    aDh))))
;         (or a!1 a!2)))
;   (define-fun
;      aDh
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.5
;      ()
;      Bool
;      (= aDM aDg))
;   (define-fun
;      given-2.7
;      ()
;      Bool
;      (= aDH aDf))
;   (define-fun
;      given-2.8
;      ()
;      Bool
;      (= aDR aDh))
;   (define-fun
;      aDo
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!0))
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDC
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDg)
;         aDR))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDc)
;         aDC))
;   (define-fun
;      aDb
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!6))
;         SortaD9!val!0
;         (just SortaDa!val!5)))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDc
;           aDe)
;         aDM))
;   (define-fun
;      aDp
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!1))
;         SortaD9!val!0
;         (just SortaDa!val!3)))
;   (define-fun
;      aDr
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      aDe
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDd
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDf
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDg
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      both1942276505956773230
;      (
;        (x!0
;           (Maybe SortaDa))
;        (x!1
;           (Maybe SortaDa)))
;      (Maybe SortaDa)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDa!val!6))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDa!val!0))
;                  (=
;                     x!1
;                     (just SortaDa!val!1)))
;               (just SortaDa!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDa!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDa!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDa!val!2))
;                           (=
;                              x!1
;                              (just SortaDa!val!3)))
;                        (just SortaDa!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDa!val!2))
;                              (=
;                                 x!1
;                                 (just SortaDa!val!4)))
;                           (just SortaDa!val!2)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDa!val!5))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDa!val!3))
;                                    (=
;                                       x!1
;                                       (just SortaDa!val!4)))
;                                 (just SortaDa!val!3)
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
; [G] co_aDN {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aDI {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aDS {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aDD {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aDO {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aDE {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aDJ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aDT {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aEj} {3}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aEo} {3}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aD9,aDa,aDc,aDe],aDM)
; (IntersectL [aD9,aDa,aDd,aDe],aDH)
; (IntersectL [aD9,aDa,aDb,aDg],aDR)
; (IntersectL [aD9,aDa,aDb,aDc],aDC)
; (aDM,aDg)
; (aDC,aDd)
; (aDH,aDf)
; (aDR,aDh)

; WANTEDS (Thoralf style)
; (IntersectL [aD9,aDa,IntersectL [aD9,aDa,aDo,aDp],aDr],aDf)
; (IntersectL [aD9,aDa,aDo,IntersectL [aD9,aDa,aDp,aDr]],aDh)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aEj} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEo} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; GIVENS (names)
;  aDb  <=  a
;  aDc  <=  b
;  aDd  <=  ab
;  aDe  <=  c
;  aDf  <=  abc
;  aDg  <=  bc
;  aDh  <=  abc'
;  aDC  <=  fsk_aDC
;  aDH  <=  fsk_aDH
;  aDM  <=  fsk_aDM
;  aDR  <=  fsk_aDR
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaDa)) (y (Maybe SortaDa))) (=> (and ((_ is (just (SortaDa) (Maybe SortaDa))) x) ((_ is (just (SortaDa) (Maybe SortaDa))) y)) (= (both1942276505956773230 x y) x))))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 y (as nothing (Maybe SortaDa))) (as nothing (Maybe SortaDa)))))
; (declare-const aDC (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDH (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDM (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDR (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDb (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDc (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDd (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDe (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDf (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDg (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDh (Array SortaD9 (Maybe SortaDa)))
; (declare-fun both1942276505956773230 ((Maybe SortaDa) (Maybe SortaDa)) (Maybe SortaDa))
; (declare-sort SortaD9)
; (declare-sort SortaDa)
; DECS1 (unseen) 
(declare-sort SortaD9)
(declare-sort SortaDa)
(declare-const
   aDb
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDc
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDd
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDe
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDf
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDg
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDh
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDC
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDH
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDM
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDR
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-fun
   both1942276505956773230
   (
     (Maybe SortaDa)
     (Maybe SortaDa))
   (Maybe SortaDa))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230
            y
            (as
               nothing
               (Maybe SortaDa)))
         (as
            nothing
            (Maybe SortaDa)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDa))
        (y
           (Maybe SortaDa)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              y))
         (=
            (both1942276505956773230 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDc
           aDe)
         aDM)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDd
           aDe)
         aDH)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDg)
         aDR)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDc)
         aDC)
      :named
      given-3.4))
(assert
   (!
      (= aDM aDg)
      :named
      given-3.5))
(assert
   (!
      (= aDC aDd)
      :named
      given-3.6))
(assert
   (!
      (= aDH aDf)
      :named
      given-3.7))
(assert
   (!
      (= aDR aDh)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aEj} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEo} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; WANTEDS (names)
;  aDf  <=  abc
;  aDh  <=  abc'
;  aDo  <=  a_aDo
;  aDp  <=  b_aDp
;  aDr  <=  c_aDr
; DECS2 (seen) 
; (declare-const aDo (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDp (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDr (Array SortaD9 (Maybe SortaDa)))
; DECS2 (unseen) 
(declare-const
   aDo
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDp
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDr
   (Array
      SortaD9
      (Maybe SortaDa)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 (
                   (_ map both1942276505956773230)
                   aDo
                   aDp)
                 aDr)
               aDf))
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 aDo
                 (
                   (_ map both1942276505956773230)
                   aDp
                   aDr))
               aDh)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      SortaDa!val!7
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!3
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!0
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!2
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!5
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!6
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!4
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!1
;      ()
;      SortaDa)
;   (forall
;      (
;        (x SortaDa))
;      (or
;         (= x SortaDa!val!7)
;         (= x SortaDa!val!3)
;         (= x SortaDa!val!0)
;         (= x SortaDa!val!2)
;         (= x SortaDa!val!5)
;         (= x SortaDa!val!6)
;         (= x SortaDa!val!4)
;         (= x SortaDa!val!1)))
;   (declare-fun
;      SortaD9!val!0
;      ()
;      SortaD9)
;   (forall
;      (
;        (x SortaD9))
;      (= x SortaD9!val!0))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDc
;           aDe)
;         aDM))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= aDM aDg))
;   (define-fun
;      aDM
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      aDc
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= aDH aDf))
;   (define-fun
;      aDh
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDo
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!0))
;         SortaD9!val!0
;         (just SortaDa!val!3)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDc)
;         aDC))
;   (define-fun
;      aDC
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDp
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!1))
;         SortaD9!val!0
;         (just SortaDa!val!6)))
;   (define-fun
;      aDb
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!7))
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDg)
;         aDR))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
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
;                      (_ map both1942276505956773230)
;                      (
;                        (_ map both1942276505956773230)
;                        aDo
;                        aDp)
;                      aDr)
;                    aDf)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942276505956773230)
;                      aDo
;                      (
;                        (_ map both1942276505956773230)
;                        aDp
;                        aDr))
;                    aDh))))
;         (or a!1 a!2)))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= aDC aDd))
;   (define-fun
;      aDr
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDe
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!5)))
;   (define-fun
;      aDd
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDf
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDg
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDd
;           aDe)
;         aDH))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= aDR aDh))
;   (define-fun
;      both1942276505956773230
;      (
;        (x!0
;           (Maybe SortaDa))
;        (x!1
;           (Maybe SortaDa)))
;      (Maybe SortaDa)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDa!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDa!val!0))
;                  (=
;                     x!1
;                     (just SortaDa!val!1)))
;               (just SortaDa!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDa!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDa!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDa!val!2))
;                           (=
;                              x!1
;                              (just SortaDa!val!5)))
;                        (just SortaDa!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDa!val!3))
;                              (=
;                                 x!1
;                                 (just SortaDa!val!6)))
;                           (just SortaDa!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDa!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDa!val!4))
;                                    (=
;                                       x!1
;                                       (just SortaDa!val!5)))
;                                 (just SortaDa!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just SortaDa!val!2))
;                                       (=
;                                          x!1
;                                          (just SortaDa!val!4)))
;                                    (just SortaDa!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just SortaDa!val!6))
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
; [G] co_aDN {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aDI {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aDS {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aDD {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aDO {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aDE {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aDJ {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aDT {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aEj} {3}:: IntersectL (IntersectL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aEo} {3}:: IntersectL a0 (IntersectL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aD9,aDa,aDc,aDe],aDM)
; (IntersectL [aD9,aDa,aDd,aDe],aDH)
; (IntersectL [aD9,aDa,aDb,aDg],aDR)
; (IntersectL [aD9,aDa,aDb,aDc],aDC)
; (aDM,aDg)
; (aDC,aDd)
; (aDH,aDf)
; (aDR,aDh)

; WANTEDS (Thoralf style)
; (IntersectL [aD9,aDa,IntersectL [aD9,aDa,aDo,aDp],aDr],aDf)
; (IntersectL [aD9,aDa,aDo,IntersectL [aD9,aDa,aDp,aDr]],aDh)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_aEj} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEo} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; GIVENS (names)
;  aDb  <=  a
;  aDc  <=  b
;  aDd  <=  ab
;  aDe  <=  c
;  aDf  <=  abc
;  aDg  <=  bc
;  aDh  <=  abc'
;  aDC  <=  fsk_aDC
;  aDH  <=  fsk_aDH
;  aDM  <=  fsk_aDM
;  aDR  <=  fsk_aDR
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaDa)) (y (Maybe SortaDa))) (=> (and ((_ is (just (SortaDa) (Maybe SortaDa))) x) ((_ is (just (SortaDa) (Maybe SortaDa))) y)) (= (both1942276505956773230 x y) x))))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaDa))) (= (both1942276505956773230 y (as nothing (Maybe SortaDa))) (as nothing (Maybe SortaDa)))))
; (declare-const aDC (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDH (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDM (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDR (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDb (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDc (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDd (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDe (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDf (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDg (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDh (Array SortaD9 (Maybe SortaDa)))
; (declare-fun both1942276505956773230 ((Maybe SortaDa) (Maybe SortaDa)) (Maybe SortaDa))
; (declare-sort SortaD9)
; (declare-sort SortaDa)
; DECS1 (unseen) 
(declare-sort SortaD9)
(declare-sort SortaDa)
(declare-const
   aDb
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDc
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDd
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDe
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDf
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDg
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDh
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDC
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDH
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDM
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDR
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-fun
   both1942276505956773230
   (
     (Maybe SortaDa)
     (Maybe SortaDa))
   (Maybe SortaDa))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230
            y
            (as
               nothing
               (Maybe SortaDa)))
         (as
            nothing
            (Maybe SortaDa)))))
(assert
   (forall
      (
        (y
           (Maybe SortaDa)))
      (=
         (both1942276505956773230 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaDa))
        (y
           (Maybe SortaDa)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              x)
            (
              (_
                 is
                 (just
                    (SortaDa)
                    (Maybe SortaDa)))
              y))
         (=
            (both1942276505956773230 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDc
           aDe)
         aDM)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDd
           aDe)
         aDH)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDg)
         aDR)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both1942276505956773230)
           aDb
           aDc)
         aDC)
      :named
      given-3.4))
(assert
   (!
      (= aDM aDg)
      :named
      given-3.5))
(assert
   (!
      (= aDC aDd)
      :named
      given-3.6))
(assert
   (!
      (= aDH aDf)
      :named
      given-3.7))
(assert
   (!
      (= aDR aDh)
      :named
      given-3.8))
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_aEj} {3}:: IntersectL (IntersectL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      (
;        (_ map both1942276505956773230)
;        aDo
;        aDp)
;      aDr)
;    aDf)

;      [WD] hole{co_aEo} {3}:: IntersectL a0 (IntersectL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1942276505956773230)
;      aDo
;      (
;        (_ map both1942276505956773230)
;        aDp
;        aDr))
;    aDh)

; WANTEDS (names)
;  aDf  <=  abc
;  aDh  <=  abc'
;  aDo  <=  a_aDo
;  aDp  <=  b_aDp
;  aDr  <=  c_aDr
; DECS2 (seen) 
; (declare-const aDo (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDp (Array SortaD9 (Maybe SortaDa)))
; (declare-const aDr (Array SortaD9 (Maybe SortaDa)))
; DECS2 (unseen) 
(declare-const
   aDo
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDp
   (Array
      SortaD9
      (Maybe SortaDa)))
(declare-const
   aDr
   (Array
      SortaD9
      (Maybe SortaDa)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 (
                   (_ map both1942276505956773230)
                   aDo
                   aDp)
                 aDr)
               aDf))
         (not
            (=
               (
                 (_ map both1942276505956773230)
                 aDo
                 (
                   (_ map both1942276505956773230)
                   aDp
                   aDr))
               aDh)))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (declare-fun
;      SortaDa!val!7
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!3
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!0
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!2
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!5
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!6
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!4
;      ()
;      SortaDa)
;   (declare-fun
;      SortaDa!val!1
;      ()
;      SortaDa)
;   (forall
;      (
;        (x SortaDa))
;      (or
;         (= x SortaDa!val!7)
;         (= x SortaDa!val!3)
;         (= x SortaDa!val!0)
;         (= x SortaDa!val!2)
;         (= x SortaDa!val!5)
;         (= x SortaDa!val!6)
;         (= x SortaDa!val!4)
;         (= x SortaDa!val!1)))
;   (declare-fun
;      SortaD9!val!0
;      ()
;      SortaD9)
;   (forall
;      (
;        (x SortaD9))
;      (= x SortaD9!val!0))
;   (define-fun
;      given-3.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDc
;           aDe)
;         aDM))
;   (define-fun
;      given-3.5
;      ()
;      Bool
;      (= aDM aDg))
;   (define-fun
;      aDM
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      aDc
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      aDH
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      given-3.7
;      ()
;      Bool
;      (= aDH aDf))
;   (define-fun
;      aDh
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDo
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!0))
;         SortaD9!val!0
;         (just SortaDa!val!3)))
;   (define-fun
;      given-3.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDc)
;         aDC))
;   (define-fun
;      aDC
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDp
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!1))
;         SortaD9!val!0
;         (just SortaDa!val!6)))
;   (define-fun
;      aDb
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           (just SortaDa!val!7))
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      given-3.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDb
;           aDg)
;         aDR))
;   (define-fun
;      aDR
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
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
;                      (_ map both1942276505956773230)
;                      (
;                        (_ map both1942276505956773230)
;                        aDo
;                        aDp)
;                      aDr)
;                    aDf)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1942276505956773230)
;                      aDo
;                      (
;                        (_ map both1942276505956773230)
;                        aDp
;                        aDr))
;                    aDh))))
;         (or a!1 a!2)))
;   (define-fun
;      given-3.6
;      ()
;      Bool
;      (= aDC aDd))
;   (define-fun
;      aDr
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (
;        (as
;           const
;           (Array
;              SortaD9
;              (Maybe SortaDa)))
;        nothing))
;   (define-fun
;      aDe
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!5)))
;   (define-fun
;      aDd
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDf
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!2)))
;   (define-fun
;      aDg
;      ()
;      (Array
;         SortaD9
;         (Maybe SortaDa))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaD9
;                 (Maybe SortaDa)))
;           nothing)
;         SortaD9!val!0
;         (just SortaDa!val!4)))
;   (define-fun
;      given-3.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1942276505956773230)
;           aDd
;           aDe)
;         aDH))
;   (define-fun
;      given-3.8
;      ()
;      Bool
;      (= aDR aDh))
;   (define-fun
;      both1942276505956773230
;      (
;        (x!0
;           (Maybe SortaDa))
;        (x!1
;           (Maybe SortaDa)))
;      (Maybe SortaDa)
;      (ite
;         (and
;            (= x!0 nothing)
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaDa!val!7))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaDa!val!0))
;                  (=
;                     x!1
;                     (just SortaDa!val!1)))
;               (just SortaDa!val!0)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaDa!val!1))
;                     (= x!1 nothing))
;                  nothing
;                  (ite
;                     (and
;                        (=
;                           x!0
;                           (just SortaDa!val!0))
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaDa!val!2))
;                           (=
;                              x!1
;                              (just SortaDa!val!5)))
;                        (just SortaDa!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaDa!val!3))
;                              (=
;                                 x!1
;                                 (just SortaDa!val!6)))
;                           (just SortaDa!val!3)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaDa!val!3))
;                                 (= x!1 nothing))
;                              nothing
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaDa!val!4))
;                                    (=
;                                       x!1
;                                       (just SortaDa!val!5)))
;                                 (just SortaDa!val!4)
;                                 (ite
;                                    (and
;                                       (=
;                                          x!0
;                                          (just SortaDa!val!2))
;                                       (=
;                                          x!1
;                                          (just SortaDa!val!4)))
;                                    (just SortaDa!val!2)
;                                    (ite
;                                       (and
;                                          (=
;                                             x!0
;                                             (just SortaDa!val!6))
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
; [G] co_aFr {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFm {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFw {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFh {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFs {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFi {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFn {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFx {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFI} {2}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aFS} {2}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aEN,aEO,aEQ,aES],aFq)
; (UnionL [aEN,aEO,aER,aES],aFl)
; (UnionL [aEN,aEO,aEP,aEU],aFv)
; (UnionL [aEN,aEO,aEP,aEQ],aFg)
; (aFq,aEU)
; (aFg,aER)
; (aFl,aET)
; (aFv,aEV)

; WANTEDS (Thoralf style)
; (UnionL [aEN,aEO,UnionL [aEN,aEO,aF2,aF3],aF5],aET)
; (UnionL [aEN,aEO,aF2,UnionL [aEN,aEO,aF3,aF5]],aEV)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aFI} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aFS} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; GIVENS (names)
;  aEP  <=  a
;  aEQ  <=  b
;  aER  <=  ab
;  aES  <=  c
;  aET  <=  abc
;  aEU  <=  bc
;  aEV  <=  abc'
;  aFg  <=  fsk_aFg
;  aFl  <=  fsk_aFl
;  aFq  <=  fsk_aFq
;  aFv  <=  fsk_aFv
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaEO)) (y (Maybe SortaEO))) (=> ((_ is (just (SortaEO) (Maybe SortaEO))) x) (= (either1943061557259126649 x y) x))))
; (assert (forall ((y (Maybe SortaEO))) (= (either1943061557259126649 (as nothing (Maybe SortaEO)) y) y)))
; (declare-const aEP (Array SortaEN (Maybe SortaEO)))
; (declare-const aEQ (Array SortaEN (Maybe SortaEO)))
; (declare-const aER (Array SortaEN (Maybe SortaEO)))
; (declare-const aES (Array SortaEN (Maybe SortaEO)))
; (declare-const aET (Array SortaEN (Maybe SortaEO)))
; (declare-const aEU (Array SortaEN (Maybe SortaEO)))
; (declare-const aEV (Array SortaEN (Maybe SortaEO)))
; (declare-const aFg (Array SortaEN (Maybe SortaEO)))
; (declare-const aFl (Array SortaEN (Maybe SortaEO)))
; (declare-const aFq (Array SortaEN (Maybe SortaEO)))
; (declare-const aFv (Array SortaEN (Maybe SortaEO)))
; (declare-fun either1943061557259126649 ((Maybe SortaEO) (Maybe SortaEO)) (Maybe SortaEO))
; (declare-sort SortaEN)
; (declare-sort SortaEO)
(declare-sort SortaEN)
(declare-sort SortaEO)
(declare-const
   aEP
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEQ
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aER
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aES
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aET
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEU
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEV
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFg
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFl
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFq
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFv
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-fun
   either1943061557259126649
   (
     (Maybe SortaEO)
     (Maybe SortaEO))
   (Maybe SortaEO))
(assert
   (forall
      (
        (y
           (Maybe SortaEO)))
      (=
         (either1943061557259126649
            (as
               nothing
               (Maybe SortaEO))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaEO))
        (y
           (Maybe SortaEO)))
      (=>
         (
           (_
              is
              (just
                 (SortaEO)
                 (Maybe SortaEO)))
           x)
         (=
            (either1943061557259126649 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEQ
           aES)
         aFq)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aER
           aES)
         aFl)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEU)
         aFv)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEQ)
         aFg)
      :named
      given-5.4))
(assert
   (!
      (= aFq aEU)
      :named
      given-5.5))
(assert
   (!
      (= aFg aER)
      :named
      given-5.6))
(assert
   (!
      (= aFl aET)
      :named
      given-5.7))
(assert
   (!
      (= aFv aEV)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aFI} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aFS} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; WANTEDS (names)
;  aET  <=  abc
;  aEV  <=  abc'
;  aF2  <=  a_aF2
;  aF3  <=  b_aF3
;  aF5  <=  c_aF5
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aF2 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF3 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF5 (Array SortaEN (Maybe SortaEO)))
(declare-const
   aF2
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF3
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF5
   (Array
      SortaEN
      (Maybe SortaEO)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 (
                   (_ map either1943061557259126649)
                   aF2
                   aF3)
                 aF5)
               aET))
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 aF2
                 (
                   (_ map either1943061557259126649)
                   aF3
                   aF5))
               aEV)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      SortaEN!val!1
;      ()
;      SortaEN)
;   (declare-fun
;      SortaEN!val!0
;      ()
;      SortaEN)
;   (forall
;      (
;        (x SortaEN))
;      (or
;         (= x SortaEN!val!1)
;         (= x SortaEN!val!0)))
;   (declare-fun
;      SortaEO!val!3
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!1
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!2
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!0
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!4
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!5
;      ()
;      SortaEO)
;   (forall
;      (
;        (x SortaEO))
;      (or
;         (= x SortaEO!val!3)
;         (= x SortaEO!val!1)
;         (= x SortaEO!val!2)
;         (= x SortaEO!val!0)
;         (= x SortaEO!val!4)
;         (= x SortaEO!val!5)))
;   (define-fun
;      aF2
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      aF5
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!0))
;            SortaEN!val!0
;            (just SortaEO!val!1))
;         SortaEN!val!1
;         (just SortaEO!val!2)))
;   (define-fun
;      aEU
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
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
;                      (_ map either1943061557259126649)
;                      (
;                        (_ map either1943061557259126649)
;                        aF2
;                        aF3)
;                      aF5)
;                    aET)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1943061557259126649)
;                      aF2
;                      (
;                        (_ map either1943061557259126649)
;                        aF3
;                        aF5))
;                    aEV))))
;         (or a!1 a!2)))
;   (define-fun
;      aES
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           nothing)
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aF3
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEQ
;           aES)
;         aFq))
;   (define-fun
;      aEQ
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         nothing))
;   (define-fun
;      aFq
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEQ)
;         aFg))
;   (define-fun
;      aEP
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= aFv aEV))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEU)
;         aFv))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= aFg aER))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= aFl aET))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aER
;           aES)
;         aFl))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= aFq aEU))
;   (define-fun
;      aER
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         nothing))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aFv
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aFg
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         nothing))
;   (define-fun
;      aET
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aEV
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      k!79
;      (
;        (x!0 SortaEN))
;      (Maybe SortaEO)
;      (ite
;         (= x!0 SortaEN!val!0)
;         (just SortaEO!val!1)
;         (ite
;            (= x!0 SortaEN!val!1)
;            (just SortaEO!val!2)
;            (just SortaEO!val!0))))
;   (define-fun
;      either1943061557259126649
;      (
;        (x!0
;           (Maybe SortaEO))
;        (x!1
;           (Maybe SortaEO)))
;      (Maybe SortaEO)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaEO!val!5))
;            (= x!1 nothing))
;         (just SortaEO!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaEO!val!5)))
;            (just SortaEO!val!5)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaEO!val!0)))
;               (just SortaEO!val!0)
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
;                           (just SortaEO!val!1)))
;                     (just SortaEO!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaEO!val!4)))
;                        (just SortaEO!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaEO!val!3)))
;                           (just SortaEO!val!3)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just SortaEO!val!2)))
;                              (just SortaEO!val!2)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaEO!val!4))
;                                    (= x!1 nothing))
;                                 (just SortaEO!val!4)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1)))))))))))
;   (define-fun
;      k!73
;      (
;        (x!0 SortaEN))
;      (Maybe SortaEO)
;      (ite
;         (= x!0 SortaEN!val!0)
;         (just SortaEO!val!4)
;         (ite
;            (= x!0 SortaEN!val!1)
;            (just SortaEO!val!3)
;            (just SortaEO!val!5)))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] co_aFr {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFm {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFw {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFh {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFs {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFi {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFn {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFx {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFI} {2}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aFS} {2}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aEN,aEO,aEQ,aES],aFq)
; (UnionL [aEN,aEO,aER,aES],aFl)
; (UnionL [aEN,aEO,aEP,aEU],aFv)
; (UnionL [aEN,aEO,aEP,aEQ],aFg)
; (aFq,aEU)
; (aFg,aER)
; (aFl,aET)
; (aFv,aEV)

; WANTEDS (Thoralf style)
; (UnionL [aEN,aEO,UnionL [aEN,aEO,aF2,aF3],aF5],aET)
; (UnionL [aEN,aEO,aF2,UnionL [aEN,aEO,aF3,aF5]],aEV)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_aFI} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aFS} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; GIVENS (names)
;  aEP  <=  a
;  aEQ  <=  b
;  aER  <=  ab
;  aES  <=  c
;  aET  <=  abc
;  aEU  <=  bc
;  aEV  <=  abc'
;  aFg  <=  fsk_aFg
;  aFl  <=  fsk_aFl
;  aFq  <=  fsk_aFq
;  aFv  <=  fsk_aFv
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaEO)) (y (Maybe SortaEO))) (=> ((_ is (just (SortaEO) (Maybe SortaEO))) x) (= (either1943061557259126649 x y) x))))
; (assert (forall ((y (Maybe SortaEO))) (= (either1943061557259126649 (as nothing (Maybe SortaEO)) y) y)))
; (declare-const aEP (Array SortaEN (Maybe SortaEO)))
; (declare-const aEQ (Array SortaEN (Maybe SortaEO)))
; (declare-const aER (Array SortaEN (Maybe SortaEO)))
; (declare-const aES (Array SortaEN (Maybe SortaEO)))
; (declare-const aET (Array SortaEN (Maybe SortaEO)))
; (declare-const aEU (Array SortaEN (Maybe SortaEO)))
; (declare-const aEV (Array SortaEN (Maybe SortaEO)))
; (declare-const aFg (Array SortaEN (Maybe SortaEO)))
; (declare-const aFl (Array SortaEN (Maybe SortaEO)))
; (declare-const aFq (Array SortaEN (Maybe SortaEO)))
; (declare-const aFv (Array SortaEN (Maybe SortaEO)))
; (declare-fun either1943061557259126649 ((Maybe SortaEO) (Maybe SortaEO)) (Maybe SortaEO))
; (declare-sort SortaEN)
; (declare-sort SortaEO)
(declare-sort SortaEN)
(declare-sort SortaEO)
(declare-const
   aEP
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEQ
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aER
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aES
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aET
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEU
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEV
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFg
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFl
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFq
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFv
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-fun
   either1943061557259126649
   (
     (Maybe SortaEO)
     (Maybe SortaEO))
   (Maybe SortaEO))
(assert
   (forall
      (
        (y
           (Maybe SortaEO)))
      (=
         (either1943061557259126649
            (as
               nothing
               (Maybe SortaEO))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaEO))
        (y
           (Maybe SortaEO)))
      (=>
         (
           (_
              is
              (just
                 (SortaEO)
                 (Maybe SortaEO)))
           x)
         (=
            (either1943061557259126649 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEQ
           aES)
         aFq)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aER
           aES)
         aFl)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEU)
         aFv)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEQ)
         aFg)
      :named
      given-5.4))
(assert
   (!
      (= aFq aEU)
      :named
      given-5.5))
(assert
   (!
      (= aFg aER)
      :named
      given-5.6))
(assert
   (!
      (= aFl aET)
      :named
      given-5.7))
(assert
   (!
      (= aFv aEV)
      :named
      given-5.8))
(check-sat)
; sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{co_aFI} {2}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aFS} {2}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; WANTEDS (names)
;  aET  <=  abc
;  aEV  <=  abc'
;  aF2  <=  a_aF2
;  aF3  <=  b_aF3
;  aF5  <=  c_aF5
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aF2 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF3 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF5 (Array SortaEN (Maybe SortaEO)))
(declare-const
   aF2
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF3
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF5
   (Array
      SortaEN
      (Maybe SortaEO)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 (
                   (_ map either1943061557259126649)
                   aF2
                   aF3)
                 aF5)
               aET))
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 aF2
                 (
                   (_ map either1943061557259126649)
                   aF3
                   aF5))
               aEV)))
      :named
      wanted-5))
(check-sat)
; sat
(echo "wanteds-finish-cycle-5")
(get-model)
; (
;   (declare-fun
;      SortaEN!val!1
;      ()
;      SortaEN)
;   (declare-fun
;      SortaEN!val!0
;      ()
;      SortaEN)
;   (forall
;      (
;        (x SortaEN))
;      (or
;         (= x SortaEN!val!1)
;         (= x SortaEN!val!0)))
;   (declare-fun
;      SortaEO!val!3
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!1
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!2
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!0
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!4
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!5
;      ()
;      SortaEO)
;   (forall
;      (
;        (x SortaEO))
;      (or
;         (= x SortaEO!val!3)
;         (= x SortaEO!val!1)
;         (= x SortaEO!val!2)
;         (= x SortaEO!val!0)
;         (= x SortaEO!val!4)
;         (= x SortaEO!val!5)))
;   (define-fun
;      aF2
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      aF5
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!0))
;            SortaEN!val!0
;            (just SortaEO!val!1))
;         SortaEN!val!1
;         (just SortaEO!val!2)))
;   (define-fun
;      aEU
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
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
;                      (_ map either1943061557259126649)
;                      (
;                        (_ map either1943061557259126649)
;                        aF2
;                        aF3)
;                      aF5)
;                    aET)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1943061557259126649)
;                      aF2
;                      (
;                        (_ map either1943061557259126649)
;                        aF3
;                        aF5))
;                    aEV))))
;         (or a!1 a!2)))
;   (define-fun
;      aES
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           nothing)
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aF3
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      given-5.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEQ
;           aES)
;         aFq))
;   (define-fun
;      aEQ
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         nothing))
;   (define-fun
;      aFq
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      given-5.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEQ)
;         aFg))
;   (define-fun
;      aEP
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      given-5.8
;      ()
;      Bool
;      (= aFv aEV))
;   (define-fun
;      given-5.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEU)
;         aFv))
;   (define-fun
;      given-5.6
;      ()
;      Bool
;      (= aFg aER))
;   (define-fun
;      given-5.7
;      ()
;      Bool
;      (= aFl aET))
;   (define-fun
;      given-5.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aER
;           aES)
;         aFl))
;   (define-fun
;      given-5.5
;      ()
;      Bool
;      (= aFq aEU))
;   (define-fun
;      aER
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         nothing))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aFv
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aFg
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         nothing))
;   (define-fun
;      aET
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      aEV
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaEN
;                    (Maybe SortaEO)))
;              (just SortaEO!val!5))
;            SortaEN!val!0
;            (just SortaEO!val!4))
;         SortaEN!val!1
;         (just SortaEO!val!3)))
;   (define-fun
;      k!79
;      (
;        (x!0 SortaEN))
;      (Maybe SortaEO)
;      (ite
;         (= x!0 SortaEN!val!0)
;         (just SortaEO!val!1)
;         (ite
;            (= x!0 SortaEN!val!1)
;            (just SortaEO!val!2)
;            (just SortaEO!val!0))))
;   (define-fun
;      either1943061557259126649
;      (
;        (x!0
;           (Maybe SortaEO))
;        (x!1
;           (Maybe SortaEO)))
;      (Maybe SortaEO)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaEO!val!5))
;            (= x!1 nothing))
;         (just SortaEO!val!5)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaEO!val!5)))
;            (just SortaEO!val!5)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaEO!val!0)))
;               (just SortaEO!val!0)
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
;                           (just SortaEO!val!1)))
;                     (just SortaEO!val!1)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaEO!val!4)))
;                        (just SortaEO!val!4)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaEO!val!3)))
;                           (just SortaEO!val!3)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just SortaEO!val!2)))
;                              (just SortaEO!val!2)
;                              (ite
;                                 (and
;                                    (=
;                                       x!0
;                                       (just SortaEO!val!4))
;                                    (= x!1 nothing))
;                                 (just SortaEO!val!4)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1)))))))))))
;   (define-fun
;      k!73
;      (
;        (x!0 SortaEN))
;      (Maybe SortaEO)
;      (ite
;         (= x!0 SortaEN!val!0)
;         (just SortaEO!val!4)
;         (ite
;            (= x!0 SortaEN!val!1)
;            (just SortaEO!val!3)
;            (just SortaEO!val!5)))))
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aFr {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFm {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFw {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFh {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFs {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFi {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFn {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFx {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFX} {3}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aG2} {3}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aEN,aEO,aEQ,aES],aFq)
; (UnionL [aEN,aEO,aER,aES],aFl)
; (UnionL [aEN,aEO,aEP,aEU],aFv)
; (UnionL [aEN,aEO,aEP,aEQ],aFg)
; (aFq,aEU)
; (aFg,aER)
; (aFl,aET)
; (aFv,aEV)

; WANTEDS (Thoralf style)
; (UnionL [aEN,aEO,UnionL [aEN,aEO,aF2,aF3],aF5],aET)
; (UnionL [aEN,aEO,aF2,UnionL [aEN,aEO,aF3,aF5]],aEV)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aFX} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aG2} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; GIVENS (names)
;  aEP  <=  a
;  aEQ  <=  b
;  aER  <=  ab
;  aES  <=  c
;  aET  <=  abc
;  aEU  <=  bc
;  aEV  <=  abc'
;  aFg  <=  fsk_aFg
;  aFl  <=  fsk_aFl
;  aFq  <=  fsk_aFq
;  aFv  <=  fsk_aFv
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaEO)) (y (Maybe SortaEO))) (=> ((_ is (just (SortaEO) (Maybe SortaEO))) x) (= (either1943061557259126649 x y) x))))
; (assert (forall ((y (Maybe SortaEO))) (= (either1943061557259126649 (as nothing (Maybe SortaEO)) y) y)))
; (declare-const aEP (Array SortaEN (Maybe SortaEO)))
; (declare-const aEQ (Array SortaEN (Maybe SortaEO)))
; (declare-const aER (Array SortaEN (Maybe SortaEO)))
; (declare-const aES (Array SortaEN (Maybe SortaEO)))
; (declare-const aET (Array SortaEN (Maybe SortaEO)))
; (declare-const aEU (Array SortaEN (Maybe SortaEO)))
; (declare-const aEV (Array SortaEN (Maybe SortaEO)))
; (declare-const aFg (Array SortaEN (Maybe SortaEO)))
; (declare-const aFl (Array SortaEN (Maybe SortaEO)))
; (declare-const aFq (Array SortaEN (Maybe SortaEO)))
; (declare-const aFv (Array SortaEN (Maybe SortaEO)))
; (declare-fun either1943061557259126649 ((Maybe SortaEO) (Maybe SortaEO)) (Maybe SortaEO))
; (declare-sort SortaEN)
; (declare-sort SortaEO)
; DECS1 (unseen) 
(declare-sort SortaEN)
(declare-sort SortaEO)
(declare-const
   aEP
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEQ
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aER
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aES
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aET
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEU
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEV
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFg
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFl
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFq
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFv
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-fun
   either1943061557259126649
   (
     (Maybe SortaEO)
     (Maybe SortaEO))
   (Maybe SortaEO))
(assert
   (forall
      (
        (y
           (Maybe SortaEO)))
      (=
         (either1943061557259126649
            (as
               nothing
               (Maybe SortaEO))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaEO))
        (y
           (Maybe SortaEO)))
      (=>
         (
           (_
              is
              (just
                 (SortaEO)
                 (Maybe SortaEO)))
           x)
         (=
            (either1943061557259126649 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEQ
           aES)
         aFq)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aER
           aES)
         aFl)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEU)
         aFv)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEQ)
         aFg)
      :named
      given-6.4))
(assert
   (!
      (= aFq aEU)
      :named
      given-6.5))
(assert
   (!
      (= aFg aER)
      :named
      given-6.6))
(assert
   (!
      (= aFl aET)
      :named
      given-6.7))
(assert
   (!
      (= aFv aEV)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aFX} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aG2} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; WANTEDS (names)
;  aET  <=  abc
;  aEV  <=  abc'
;  aF2  <=  a_aF2
;  aF3  <=  b_aF3
;  aF5  <=  c_aF5
; DECS2 (seen) 
; (declare-const aF2 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF3 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF5 (Array SortaEN (Maybe SortaEO)))
; DECS2 (unseen) 
(declare-const
   aF2
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF3
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF5
   (Array
      SortaEN
      (Maybe SortaEO)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 (
                   (_ map either1943061557259126649)
                   aF2
                   aF3)
                 aF5)
               aET))
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 aF2
                 (
                   (_ map either1943061557259126649)
                   aF3
                   aF5))
               aEV)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      SortaEN!val!0
;      ()
;      SortaEN)
;   (forall
;      (
;        (x SortaEN))
;      (= x SortaEN!val!0))
;   (declare-fun
;      SortaEO!val!3
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!1
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!2
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!0
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!4
;      ()
;      SortaEO)
;   (forall
;      (
;        (x SortaEO))
;      (or
;         (= x SortaEO!val!3)
;         (= x SortaEO!val!1)
;         (= x SortaEO!val!2)
;         (= x SortaEO!val!0)
;         (= x SortaEO!val!4)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= aFv aEV))
;   (define-fun
;      aF2
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEQ)
;         aFg))
;   (define-fun
;      aEU
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aER
;           aES)
;         aFl))
;   (define-fun
;      aF5
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!0))
;         SortaEN!val!0
;         nothing))
;   (define-fun
;      aES
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           nothing)
;         SortaEN!val!0
;         (just SortaEO!val!1)))
;   (define-fun
;      aF3
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           nothing)
;         SortaEN!val!0
;         (just SortaEO!val!4)))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= aFq aEU))
;   (define-fun
;      aEQ
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aFq
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aEP
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      aFv
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aFg
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEU)
;         aFv))
;   (define-fun
;      aER
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aET
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aEV
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEQ
;           aES)
;         aFq))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= aFg aER))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= aFl aET))
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
;                      (_ map either1943061557259126649)
;                      (
;                        (_ map either1943061557259126649)
;                        aF2
;                        aF3)
;                      aF5)
;                    aET)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1943061557259126649)
;                      aF2
;                      (
;                        (_ map either1943061557259126649)
;                        aF3
;                        aF5))
;                    aEV))))
;         (or a!1 a!2)))
;   (define-fun
;      either1943061557259126649
;      (
;        (x!0
;           (Maybe SortaEO))
;        (x!1
;           (Maybe SortaEO)))
;      (Maybe SortaEO)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaEO!val!3))
;            (= x!1 nothing))
;         (just SortaEO!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaEO!val!3)))
;            (just SortaEO!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaEO!val!0)))
;               (just SortaEO!val!0)
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
;                           (just SortaEO!val!1)))
;                     (just SortaEO!val!1)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaEO!val!2))
;                           (=
;                              x!1
;                              (just SortaEO!val!1)))
;                        (just SortaEO!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaEO!val!4))
;                              (= x!1 nothing))
;                           (just SortaEO!val!4)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just SortaEO!val!2)))
;                              (just SortaEO!val!2)
;                              (ite
;                                 (and
;                                    (= x!0 nothing)
;                                    (=
;                                       x!1
;                                       (just SortaEO!val!4)))
;                                 (just SortaEO!val!4)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1))))))))))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aFr {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aFm {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aFw {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aFh {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aFs {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aFi {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aFn {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aFx {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aFX} {3}:: UnionL (UnionL a0 b0) c0
;                         ~ abc (CNonCanonical)
; [WD] hole{co_aG2} {3}:: UnionL a0 (UnionL b0 c0)
;                         ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aEN,aEO,aEQ,aES],aFq)
; (UnionL [aEN,aEO,aER,aES],aFl)
; (UnionL [aEN,aEO,aEP,aEU],aFv)
; (UnionL [aEN,aEO,aEP,aEQ],aFg)
; (aFq,aEU)
; (aFg,aER)
; (aFl,aET)
; (aFv,aEV)

; WANTEDS (Thoralf style)
; (UnionL [aEN,aEO,UnionL [aEN,aEO,aF2,aF3],aF5],aET)
; (UnionL [aEN,aEO,aF2,UnionL [aEN,aEO,aF3,aF5]],aEV)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aFX} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aG2} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; GIVENS (names)
;  aEP  <=  a
;  aEQ  <=  b
;  aER  <=  ab
;  aES  <=  c
;  aET  <=  abc
;  aEU  <=  bc
;  aEV  <=  abc'
;  aFg  <=  fsk_aFg
;  aFl  <=  fsk_aFl
;  aFq  <=  fsk_aFq
;  aFv  <=  fsk_aFv
(push 1)
; DECS1 (seen) 
; (assert (forall ((x (Maybe SortaEO)) (y (Maybe SortaEO))) (=> ((_ is (just (SortaEO) (Maybe SortaEO))) x) (= (either1943061557259126649 x y) x))))
; (assert (forall ((y (Maybe SortaEO))) (= (either1943061557259126649 (as nothing (Maybe SortaEO)) y) y)))
; (declare-const aEP (Array SortaEN (Maybe SortaEO)))
; (declare-const aEQ (Array SortaEN (Maybe SortaEO)))
; (declare-const aER (Array SortaEN (Maybe SortaEO)))
; (declare-const aES (Array SortaEN (Maybe SortaEO)))
; (declare-const aET (Array SortaEN (Maybe SortaEO)))
; (declare-const aEU (Array SortaEN (Maybe SortaEO)))
; (declare-const aEV (Array SortaEN (Maybe SortaEO)))
; (declare-const aFg (Array SortaEN (Maybe SortaEO)))
; (declare-const aFl (Array SortaEN (Maybe SortaEO)))
; (declare-const aFq (Array SortaEN (Maybe SortaEO)))
; (declare-const aFv (Array SortaEN (Maybe SortaEO)))
; (declare-fun either1943061557259126649 ((Maybe SortaEO) (Maybe SortaEO)) (Maybe SortaEO))
; (declare-sort SortaEN)
; (declare-sort SortaEO)
; DECS1 (unseen) 
(declare-sort SortaEN)
(declare-sort SortaEO)
(declare-const
   aEP
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEQ
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aER
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aES
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aET
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEU
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aEV
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFg
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFl
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFq
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aFv
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-fun
   either1943061557259126649
   (
     (Maybe SortaEO)
     (Maybe SortaEO))
   (Maybe SortaEO))
(assert
   (forall
      (
        (y
           (Maybe SortaEO)))
      (=
         (either1943061557259126649
            (as
               nothing
               (Maybe SortaEO))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaEO))
        (y
           (Maybe SortaEO)))
      (=>
         (
           (_
              is
              (just
                 (SortaEO)
                 (Maybe SortaEO)))
           x)
         (=
            (either1943061557259126649 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEQ
           aES)
         aFq)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aER
           aES)
         aFl)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEU)
         aFv)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either1943061557259126649)
           aEP
           aEQ)
         aFg)
      :named
      given-6.4))
(assert
   (!
      (= aFq aEU)
      :named
      given-6.5))
(assert
   (!
      (= aFg aER)
      :named
      given-6.6))
(assert
   (!
      (= aFl aET)
      :named
      given-6.7))
(assert
   (!
      (= aFv aEV)
      :named
      given-6.8))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aFX} {3}:: UnionL (UnionL a0 b0) c0
;                              ~ abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      (
;        (_ map either1943061557259126649)
;        aF2
;        aF3)
;      aF5)
;    aET)

;      [WD] hole{co_aG2} {3}:: UnionL a0 (UnionL b0 c0)
;                              ~ abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1943061557259126649)
;      aF2
;      (
;        (_ map either1943061557259126649)
;        aF3
;        aF5))
;    aEV)

; WANTEDS (names)
;  aET  <=  abc
;  aEV  <=  abc'
;  aF2  <=  a_aF2
;  aF3  <=  b_aF3
;  aF5  <=  c_aF5
; DECS2 (seen) 
; (declare-const aF2 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF3 (Array SortaEN (Maybe SortaEO)))
; (declare-const aF5 (Array SortaEN (Maybe SortaEO)))
; DECS2 (unseen) 
(declare-const
   aF2
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF3
   (Array
      SortaEN
      (Maybe SortaEO)))
(declare-const
   aF5
   (Array
      SortaEN
      (Maybe SortaEO)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 (
                   (_ map either1943061557259126649)
                   aF2
                   aF3)
                 aF5)
               aET))
         (not
            (=
               (
                 (_ map either1943061557259126649)
                 aF2
                 (
                   (_ map either1943061557259126649)
                   aF3
                   aF5))
               aEV)))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (declare-fun
;      SortaEN!val!0
;      ()
;      SortaEN)
;   (forall
;      (
;        (x SortaEN))
;      (= x SortaEN!val!0))
;   (declare-fun
;      SortaEO!val!3
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!1
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!2
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!0
;      ()
;      SortaEO)
;   (declare-fun
;      SortaEO!val!4
;      ()
;      SortaEO)
;   (forall
;      (
;        (x SortaEO))
;      (or
;         (= x SortaEO!val!3)
;         (= x SortaEO!val!1)
;         (= x SortaEO!val!2)
;         (= x SortaEO!val!0)
;         (= x SortaEO!val!4)))
;   (define-fun
;      given-6.8
;      ()
;      Bool
;      (= aFv aEV))
;   (define-fun
;      aF2
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      given-6.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEQ)
;         aFg))
;   (define-fun
;      aEU
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aER
;           aES)
;         aFl))
;   (define-fun
;      aF5
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!0))
;         SortaEN!val!0
;         nothing))
;   (define-fun
;      aES
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           nothing)
;         SortaEN!val!0
;         (just SortaEO!val!1)))
;   (define-fun
;      aF3
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           nothing)
;         SortaEN!val!0
;         (just SortaEO!val!4)))
;   (define-fun
;      given-6.5
;      ()
;      Bool
;      (= aFq aEU))
;   (define-fun
;      aEQ
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aFq
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aEP
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (
;        (as
;           const
;           (Array
;              SortaEN
;              (Maybe SortaEO)))
;        nothing))
;   (define-fun
;      aFv
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aFg
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      given-6.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEP
;           aEU)
;         aFv))
;   (define-fun
;      aER
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aET
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aFl
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      aEV
;      ()
;      (Array
;         SortaEN
;         (Maybe SortaEO))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaEN
;                 (Maybe SortaEO)))
;           (just SortaEO!val!3))
;         SortaEN!val!0
;         (just SortaEO!val!2)))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1943061557259126649)
;           aEQ
;           aES)
;         aFq))
;   (define-fun
;      given-6.6
;      ()
;      Bool
;      (= aFg aER))
;   (define-fun
;      given-6.7
;      ()
;      Bool
;      (= aFl aET))
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
;                      (_ map either1943061557259126649)
;                      (
;                        (_ map either1943061557259126649)
;                        aF2
;                        aF3)
;                      aF5)
;                    aET)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1943061557259126649)
;                      aF2
;                      (
;                        (_ map either1943061557259126649)
;                        aF3
;                        aF5))
;                    aEV))))
;         (or a!1 a!2)))
;   (define-fun
;      either1943061557259126649
;      (
;        (x!0
;           (Maybe SortaEO))
;        (x!1
;           (Maybe SortaEO)))
;      (Maybe SortaEO)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaEO!val!3))
;            (= x!1 nothing))
;         (just SortaEO!val!3)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaEO!val!3)))
;            (just SortaEO!val!3)
;            (ite
;               (and
;                  (= x!0 nothing)
;                  (=
;                     x!1
;                     (just SortaEO!val!0)))
;               (just SortaEO!val!0)
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
;                           (just SortaEO!val!1)))
;                     (just SortaEO!val!1)
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaEO!val!2))
;                           (=
;                              x!1
;                              (just SortaEO!val!1)))
;                        (just SortaEO!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaEO!val!4))
;                              (= x!1 nothing))
;                           (just SortaEO!val!4)
;                           (ite
;                              (and
;                                 (= x!0 nothing)
;                                 (=
;                                    x!1
;                                    (just SortaEO!val!2)))
;                              (just SortaEO!val!2)
;                              (ite
;                                 (and
;                                    (= x!0 nothing)
;                                    (=
;                                       x!1
;                                       (just SortaEO!val!4)))
;                                 (just SortaEO!val!4)
;                                 (ite
;                                    (
;                                      (_ is just)
;                                      x!0)
;                                    x!0
;                                    x!1))))))))))))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aGB {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aGy {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aGC {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aGE {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aGJ} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aGl,"ok",2],aGA)
; (Alter [Symbol [],Nat [],aGk,"ok",2],aGx)
; (aGA,aGm)
; (aGx,aGl)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],aGp,"ok",2],aGl)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aGJ} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGp
;       "ok"
;       (just 2))
;    aGl)

; GIVENS (names)
;  aGk  <=  m1
;  aGl  <=  m2
;  aGm  <=  m3
;  aGx  <=  fsk_aGx
;  aGA  <=  fsk_aGA
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aGA (Array String (Maybe Int)))
; (declare-const aGk (Array String (Maybe Int)))
; (declare-const aGl (Array String (Maybe Int)))
; (declare-const aGm (Array String (Maybe Int)))
; (declare-const aGx (Array String (Maybe Int)))
(declare-const
   aGk
   (Array
      String
      (Maybe Int)))
(declare-const
   aGl
   (Array
      String
      (Maybe Int)))
(declare-const
   aGm
   (Array
      String
      (Maybe Int)))
(declare-const
   aGx
   (Array
      String
      (Maybe Int)))
(declare-const
   aGA
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aGl
            "ok"
            (just 2))
         aGA)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aGk
            "ok"
            (just 2))
         aGx)
      :named
      given-8.2))
(assert
   (!
      (= aGA aGm)
      :named
      given-8.3))
(assert
   (!
      (= aGx aGl)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aGJ} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGp
;       "ok"
;       (just 2))
;    aGl)

; WANTEDS (names)
;  aGl  <=  m2
;  aGp  <=  m1_aGp
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGp (Array String (Maybe Int)))
(declare-const
   aGp
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aGp
               "ok"
               (just 2))
            aGl))
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
;      (= aGA aGm))
;   (define-fun
;      aGx
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
;      (= aGx aGl))
;   (define-fun
;      aGA
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
;      aGm
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
;      aGl
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
;            aGk
;            "ok"
;            (just 2))
;         aGx))
;   (define-fun
;      aGp
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
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store
;               aGp
;               "ok"
;               (just 2))
;            aGl)))
;   (define-fun
;      aGk
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
;      given-8.1
;      ()
;      Bool
;      (=
;         (store
;            aGl
;            "ok"
;            (just 2))
;         aGA)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aGB {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aGy {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aGC {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aGE {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aGJ} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aGl,"ok",2],aGA)
; (Alter [Symbol [],Nat [],aGk,"ok",2],aGx)
; (aGA,aGm)
; (aGx,aGl)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],aGp,"ok",2],aGl)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aGJ} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGp
;       "ok"
;       (just 2))
;    aGl)

; GIVENS (names)
;  aGk  <=  m1
;  aGl  <=  m2
;  aGm  <=  m3
;  aGx  <=  fsk_aGx
;  aGA  <=  fsk_aGA
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aGA (Array String (Maybe Int)))
; (declare-const aGk (Array String (Maybe Int)))
; (declare-const aGl (Array String (Maybe Int)))
; (declare-const aGm (Array String (Maybe Int)))
; (declare-const aGx (Array String (Maybe Int)))
(declare-const
   aGk
   (Array
      String
      (Maybe Int)))
(declare-const
   aGl
   (Array
      String
      (Maybe Int)))
(declare-const
   aGm
   (Array
      String
      (Maybe Int)))
(declare-const
   aGx
   (Array
      String
      (Maybe Int)))
(declare-const
   aGA
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aGl
            "ok"
            (just 2))
         aGA)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aGk
            "ok"
            (just 2))
         aGx)
      :named
      given-8.2))
(assert
   (!
      (= aGA aGm)
      :named
      given-8.3))
(assert
   (!
      (= aGx aGl)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aGJ} {1}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aGp
;       "ok"
;       (just 2))
;    aGl)

; WANTEDS (names)
;  aGl  <=  m2
;  aGp  <=  m1_aGp
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGp (Array String (Maybe Int)))
(declare-const
   aGp
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aGp
               "ok"
               (just 2))
            aGl))
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
;      (= aGA aGm))
;   (define-fun
;      aGx
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
;      (= aGx aGl))
;   (define-fun
;      aGA
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
;      aGm
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
;      aGl
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
;            aGk
;            "ok"
;            (just 2))
;         aGx))
;   (define-fun
;      aGp
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
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store
;               aGp
;               "ok"
;               (just 2))
;            aGl)))
;   (define-fun
;      aGk
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
;      given-8.1
;      ()
;      Bool
;      (=
;         (store
;            aGl
;            "ok"
;            (just 2))
;         aGA)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_aHj {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHg {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHk {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aHm {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHr} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aH0,aH2,"bob"],aHi)
; (Delete [Symbol [],aH0,aH1,"bob"],aHf)
; (aHi,aH3)
; (aHf,aH2)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aH0,aH7,"bob"],aH2)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_aHr} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aH7
;       "bob"
;       (as
;          nothing
;          (Maybe SortaH0)))
;    aH2)

; GIVENS (names)
;  aH1  <=  m1
;  aH2  <=  m2
;  aH3  <=  m3
;  aHf  <=  fsk_aHf
;  aHi  <=  fsk_aHi
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aH1 (Array String (Maybe SortaH0)))
; (declare-const aH2 (Array String (Maybe SortaH0)))
; (declare-const aH3 (Array String (Maybe SortaH0)))
; (declare-const aHf (Array String (Maybe SortaH0)))
; (declare-const aHi (Array String (Maybe SortaH0)))
; (declare-sort SortaH0)
(declare-sort SortaH0)
(declare-const
   aH1
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aH2
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aH3
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aHf
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aHi
   (Array
      String
      (Maybe SortaH0)))
(assert
   (!
      (=
         (store
            aH2
            "bob"
            (as
               nothing
               (Maybe SortaH0)))
         aHi)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            aH1
            "bob"
            (as
               nothing
               (Maybe SortaH0)))
         aHf)
      :named
      given-10.2))
(assert
   (!
      (= aHi aH3)
      :named
      given-10.3))
(assert
   (!
      (= aHf aH2)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_aHr} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aH7
;       "bob"
;       (as
;          nothing
;          (Maybe SortaH0)))
;    aH2)

; WANTEDS (names)
;  aH2  <=  m2
;  aH7  <=  m1_aH7
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aH7 (Array String (Maybe SortaH0)))
(declare-const
   aH7
   (Array
      String
      (Maybe SortaH0)))
(assert
   (!
      (not
         (=
            (store
               aH7
               "bob"
               (as
                  nothing
                  (Maybe SortaH0)))
            aH2))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      SortaH0!val!1
;      ()
;      SortaH0)
;   (declare-fun
;      SortaH0!val!0
;      ()
;      SortaH0)
;   (declare-fun
;      SortaH0!val!2
;      ()
;      SortaH0)
;   (forall
;      (
;        (x SortaH0))
;      (or
;         (= x SortaH0!val!1)
;         (= x SortaH0!val!0)
;         (= x SortaH0!val!2)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store aH2 "bob" nothing)
;         aHi))
;   (define-fun
;      aH7
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaH0)))
;           (just SortaH0!val!2))
;         "b"
;         (just SortaH0!val!0)))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= aHf aH2))
;   (define-fun
;      aH1
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaH0)))
;           (just SortaH0!val!1))
;         "b"
;         nothing))
;   (define-fun
;      aHi
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= aHi aH3))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store aH1 "bob" nothing)
;         aHf))
;   (define-fun
;      aHf
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aH3
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aH2
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store aH7 "bob" nothing)
;            aH2))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] co_aHj {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHg {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aHk {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aHm {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHr} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aH0,aH2,"bob"],aHi)
; (Delete [Symbol [],aH0,aH1,"bob"],aHf)
; (aHi,aH3)
; (aHf,aH2)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aH0,aH7,"bob"],aH2)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_aHr} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aH7
;       "bob"
;       (as
;          nothing
;          (Maybe SortaH0)))
;    aH2)

; GIVENS (names)
;  aH1  <=  m1
;  aH2  <=  m2
;  aH3  <=  m3
;  aHf  <=  fsk_aHf
;  aHi  <=  fsk_aHi
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aH1 (Array String (Maybe SortaH0)))
; (declare-const aH2 (Array String (Maybe SortaH0)))
; (declare-const aH3 (Array String (Maybe SortaH0)))
; (declare-const aHf (Array String (Maybe SortaH0)))
; (declare-const aHi (Array String (Maybe SortaH0)))
; (declare-sort SortaH0)
(declare-sort SortaH0)
(declare-const
   aH1
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aH2
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aH3
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aHf
   (Array
      String
      (Maybe SortaH0)))
(declare-const
   aHi
   (Array
      String
      (Maybe SortaH0)))
(assert
   (!
      (=
         (store
            aH2
            "bob"
            (as
               nothing
               (Maybe SortaH0)))
         aHi)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            aH1
            "bob"
            (as
               nothing
               (Maybe SortaH0)))
         aHf)
      :named
      given-10.2))
(assert
   (!
      (= aHi aH3)
      :named
      given-10.3))
(assert
   (!
      (= aHf aH2)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_aHr} {1}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       aH7
;       "bob"
;       (as
;          nothing
;          (Maybe SortaH0)))
;    aH2)

; WANTEDS (names)
;  aH2  <=  m2
;  aH7  <=  m1_aH7
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aH7 (Array String (Maybe SortaH0)))
(declare-const
   aH7
   (Array
      String
      (Maybe SortaH0)))
(assert
   (!
      (not
         (=
            (store
               aH7
               "bob"
               (as
                  nothing
                  (Maybe SortaH0)))
            aH2))
      :named
      wanted-10))
(check-sat)
; sat
(echo "wanteds-finish-cycle-10")
(get-model)
; (
;   (declare-fun
;      SortaH0!val!1
;      ()
;      SortaH0)
;   (declare-fun
;      SortaH0!val!0
;      ()
;      SortaH0)
;   (declare-fun
;      SortaH0!val!2
;      ()
;      SortaH0)
;   (forall
;      (
;        (x SortaH0))
;      (or
;         (= x SortaH0!val!1)
;         (= x SortaH0!val!0)
;         (= x SortaH0!val!2)))
;   (define-fun
;      given-10.1
;      ()
;      Bool
;      (=
;         (store aH2 "bob" nothing)
;         aHi))
;   (define-fun
;      aH7
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaH0)))
;           (just SortaH0!val!2))
;         "b"
;         (just SortaH0!val!0)))
;   (define-fun
;      given-10.4
;      ()
;      Bool
;      (= aHf aH2))
;   (define-fun
;      aH1
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaH0)))
;           (just SortaH0!val!1))
;         "b"
;         nothing))
;   (define-fun
;      aHi
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      given-10.3
;      ()
;      Bool
;      (= aHi aH3))
;   (define-fun
;      given-10.2
;      ()
;      Bool
;      (=
;         (store aH1 "bob" nothing)
;         aHf))
;   (define-fun
;      aHf
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aH3
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aH2
;      ()
;      (Array
;         String
;         (Maybe SortaH0))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaH0)))
;              (just SortaH0!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      wanted-10
;      ()
;      Bool
;      (not
;         (=
;            (store aH7 "bob" nothing)
;            aH2))))
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aIS} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                         ~ Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_aIS} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
;      [WD] hole{co_aIS} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
; [G] co_aJb {1}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] co_aJ6 {1}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] co_aJg {1}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] co_aJ1 {1}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] co_aJc {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aJ2 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aJ7 {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aJh {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aHT} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aHD,aHE,aHG,aHI],aJa)
; (IntersectL [aHD,aHE,aHH,aHI],aJ5)
; (IntersectL [aHD,aHE,aHF,aHK],aJf)
; (IntersectL [aHD,aHE,aHF,aHG],aJ0)
; (aJa,aHK)
; (aJ0,aHH)
; (aJ5,aHJ)
; (aJf,aHL)

; WANTEDS (Thoralf style)
; (aHJ,aHL)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_aHT} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aHJ aHL)

; GIVENS (names)
;  aHF  <=  a
;  aHG  <=  b
;  aHH  <=  ab
;  aHI  <=  c
;  aHJ  <=  abc
;  aHK  <=  bc
;  aHL  <=  abc'
;  aJ0  <=  fsk_aJ0
;  aJ5  <=  fsk_aJ5
;  aJa  <=  fsk_aJa
;  aJf  <=  fsk_aJf
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaHE)) (y (Maybe SortaHE))) (=> (and ((_ is (just (SortaHE) (Maybe SortaHE))) x) ((_ is (just (SortaHE) (Maybe SortaHE))) y)) (= (both1945922486515164006 x y) x))))
; (assert (forall ((y (Maybe SortaHE))) (= (both1945922486515164006 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaHE))) (= (both1945922486515164006 y (as nothing (Maybe SortaHE))) (as nothing (Maybe SortaHE)))))
; (declare-const aHF (Array SortaHD (Maybe SortaHE)))
; (declare-const aHG (Array SortaHD (Maybe SortaHE)))
; (declare-const aHH (Array SortaHD (Maybe SortaHE)))
; (declare-const aHI (Array SortaHD (Maybe SortaHE)))
; (declare-const aHJ (Array SortaHD (Maybe SortaHE)))
; (declare-const aHK (Array SortaHD (Maybe SortaHE)))
; (declare-const aHL (Array SortaHD (Maybe SortaHE)))
; (declare-const aJ0 (Array SortaHD (Maybe SortaHE)))
; (declare-const aJ5 (Array SortaHD (Maybe SortaHE)))
; (declare-const aJa (Array SortaHD (Maybe SortaHE)))
; (declare-const aJf (Array SortaHD (Maybe SortaHE)))
; (declare-fun both1945922486515164006 ((Maybe SortaHE) (Maybe SortaHE)) (Maybe SortaHE))
; (declare-sort SortaHD)
; (declare-sort SortaHE)
(declare-sort SortaHD)
(declare-sort SortaHE)
(declare-const
   aHF
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aHG
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aHH
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aHI
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aHJ
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aHK
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aHL
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aJ0
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aJ5
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aJa
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-const
   aJf
   (Array
      SortaHD
      (Maybe SortaHE)))
(declare-fun
   both1945922486515164006
   (
     (Maybe SortaHE)
     (Maybe SortaHE))
   (Maybe SortaHE))
(assert
   (forall
      (
        (y
           (Maybe SortaHE)))
      (=
         (both1945922486515164006
            y
            (as
               nothing
               (Maybe SortaHE)))
         (as
            nothing
            (Maybe SortaHE)))))
(assert
   (forall
      (
        (y
           (Maybe SortaHE)))
      (=
         (both1945922486515164006 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaHE))
        (y
           (Maybe SortaHE)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaHE)
                    (Maybe SortaHE)))
              x)
            (
              (_
                 is
                 (just
                    (SortaHE)
                    (Maybe SortaHE)))
              y))
         (=
            (both1945922486515164006 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1945922486515164006)
           aHG
           aHI)
         aJa)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both1945922486515164006)
           aHH
           aHI)
         aJ5)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both1945922486515164006)
           aHF
           aHK)
         aJf)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both1945922486515164006)
           aHF
           aHG)
         aJ0)
      :named
      given-13.4))
(assert
   (!
      (= aJa aHK)
      :named
      given-13.5))
(assert
   (!
      (= aJ0 aHH)
      :named
      given-13.6))
(assert
   (!
      (= aJ5 aHJ)
      :named
      given-13.7))
(assert
   (!
      (= aJf aHL)
      :named
      given-13.8))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_aHT} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aHJ aHL)

; WANTEDS (names)
;  aHJ  <=  abc
;  aHL  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aHJ aHL))
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
;           (Maybe SortaHE)))
;      (=
;         (both1945922486515164006
;            y
;            (as
;               nothing
;               (Maybe SortaHE)))
;         (as
;            nothing
;            (Maybe SortaHE))))
;   (forall
;      (
;        (y
;           (Maybe SortaHE)))
;      (=
;         (both1945922486515164006 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe SortaHE))
;        (y
;           (Maybe SortaHE)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (SortaHE)
;                    (Maybe SortaHE)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (SortaHE)
;                    (Maybe SortaHE)))
;              y))
;         (=
;            (both1945922486515164006 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both1945922486515164006)
;           aHG
;           aHI)
;         aJa)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map both1945922486515164006)
;           aHH
;           aHI)
;         aJ5)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map both1945922486515164006)
;           aHF
;           aHK)
;         aJf)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map both1945922486515164006)
;           aHF
;           aHG)
;         aJ0)
;      :named
;      given-13.4)
;   (!
;      (= aJa aHK)
;      :named
;      given-13.5)
;   (!
;      (= aJ0 aHH)
;      :named
;      given-13.6)
;   (!
;      (= aJ5 aHJ)
;      :named
;      given-13.7)
;   (!
;      (= aJf aHL)
;      :named
;      given-13.8)
;   (!
;      (not
;         (= aHJ aHL))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1
;    given-13.5
;    given-13.2
;    given-13.3
;    given-13.6
;    given-13.4
;    wanted-13
;    given-13.7
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
; [G] co_aJv {1}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] co_aJq {1}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] co_aJA {1}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] co_aJl {1}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] co_aJw {1}:: fsk0 ~ bc (CTyEqCan)
; [G] co_aJm {1}:: fsk0 ~ ab (CTyEqCan)
; [G] co_aJr {1}:: fsk0 ~ abc (CTyEqCan)
; [G] co_aJB {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIb} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aHV,aHW,aHY,aI0],aJu)
; (UnionL [aHV,aHW,aHZ,aI0],aJp)
; (UnionL [aHV,aHW,aHX,aI2],aJz)
; (UnionL [aHV,aHW,aHX,aHY],aJk)
; (aJu,aI2)
; (aJk,aHZ)
; (aJp,aI1)
; (aJz,aI3)

; WANTEDS (Thoralf style)
; (aI1,aI3)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_aIb} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aI1 aI3)

; GIVENS (names)
;  aHX  <=  a
;  aHY  <=  b
;  aHZ  <=  ab
;  aI0  <=  c
;  aI1  <=  abc
;  aI2  <=  bc
;  aI3  <=  abc'
;  aJk  <=  fsk_aJk
;  aJp  <=  fsk_aJp
;  aJu  <=  fsk_aJu
;  aJz  <=  fsk_aJz
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaHW)) (y (Maybe SortaHW))) (=> ((_ is (just (SortaHW) (Maybe SortaHW))) x) (= (either1945902695305856204 x y) x))))
; (assert (forall ((y (Maybe SortaHW))) (= (either1945902695305856204 (as nothing (Maybe SortaHW)) y) y)))
; (declare-const aHX (Array SortaHV (Maybe SortaHW)))
; (declare-const aHY (Array SortaHV (Maybe SortaHW)))
; (declare-const aHZ (Array SortaHV (Maybe SortaHW)))
; (declare-const aI0 (Array SortaHV (Maybe SortaHW)))
; (declare-const aI1 (Array SortaHV (Maybe SortaHW)))
; (declare-const aI2 (Array SortaHV (Maybe SortaHW)))
; (declare-const aI3 (Array SortaHV (Maybe SortaHW)))
; (declare-const aJk (Array SortaHV (Maybe SortaHW)))
; (declare-const aJp (Array SortaHV (Maybe SortaHW)))
; (declare-const aJu (Array SortaHV (Maybe SortaHW)))
; (declare-const aJz (Array SortaHV (Maybe SortaHW)))
; (declare-fun either1945902695305856204 ((Maybe SortaHW) (Maybe SortaHW)) (Maybe SortaHW))
; (declare-sort SortaHV)
; (declare-sort SortaHW)
(declare-sort SortaHV)
(declare-sort SortaHW)
(declare-const
   aHX
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aHY
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aHZ
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aI0
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aI1
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aI2
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aI3
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aJk
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aJp
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aJu
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-const
   aJz
   (Array
      SortaHV
      (Maybe SortaHW)))
(declare-fun
   either1945902695305856204
   (
     (Maybe SortaHW)
     (Maybe SortaHW))
   (Maybe SortaHW))
(assert
   (forall
      (
        (y
           (Maybe SortaHW)))
      (=
         (either1945902695305856204
            (as
               nothing
               (Maybe SortaHW))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaHW))
        (y
           (Maybe SortaHW)))
      (=>
         (
           (_
              is
              (just
                 (SortaHW)
                 (Maybe SortaHW)))
           x)
         (=
            (either1945902695305856204 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945902695305856204)
           aHY
           aI0)
         aJu)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either1945902695305856204)
           aHZ
           aI0)
         aJp)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either1945902695305856204)
           aHX
           aI2)
         aJz)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either1945902695305856204)
           aHX
           aHY)
         aJk)
      :named
      given-15.4))
(assert
   (!
      (= aJu aI2)
      :named
      given-15.5))
(assert
   (!
      (= aJk aHZ)
      :named
      given-15.6))
(assert
   (!
      (= aJp aI1)
      :named
      given-15.7))
(assert
   (!
      (= aJz aI3)
      :named
      given-15.8))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_aIb} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= aI1 aI3)

; WANTEDS (names)
;  aI1  <=  abc
;  aI3  <=  abc'
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aI1 aI3))
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
;           (Maybe SortaHW)))
;      (=
;         (either1945902695305856204
;            (as
;               nothing
;               (Maybe SortaHW))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe SortaHW))
;        (y
;           (Maybe SortaHW)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (SortaHW)
;                 (Maybe SortaHW)))
;           x)
;         (=
;            (either1945902695305856204 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either1945902695305856204)
;           aHY
;           aI0)
;         aJu)
;      :named
;      given-15.1)
;   (!
;      (=
;         (
;           (_ map either1945902695305856204)
;           aHZ
;           aI0)
;         aJp)
;      :named
;      given-15.2)
;   (!
;      (=
;         (
;           (_ map either1945902695305856204)
;           aHX
;           aI2)
;         aJz)
;      :named
;      given-15.3)
;   (!
;      (=
;         (
;           (_ map either1945902695305856204)
;           aHX
;           aHY)
;         aJk)
;      :named
;      given-15.4)
;   (!
;      (= aJu aI2)
;      :named
;      given-15.5)
;   (!
;      (= aJk aHZ)
;      :named
;      given-15.6)
;   (!
;      (= aJp aI1)
;      :named
;      given-15.7)
;   (!
;      (= aJz aI3)
;      :named
;      given-15.8)
;   (!
;      (not
;         (= aI1 aI3))
;      :named
;      wanted-15))
(get-unsat-core)
; (wanted-15
;    given-15.3
;    given-15.2
;    given-15.4
;    given-15.6
;    given-15.7
;    given-15.8
;    given-15.1
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
; [G] co_aJI {1}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aJF {1}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] co_aJJ {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aJL {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIl} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],aIe,"ok",2],aJH)
; (Alter [Symbol [],Nat [],aId,"ok",2],aJE)
; (aJH,aIf)
; (aJE,aIe)

; WANTEDS (Thoralf style)
; (aIe,aIf)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_aIl} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIe aIf)

; GIVENS (names)
;  aId  <=  m1
;  aIe  <=  m2
;  aIf  <=  m3
;  aJE  <=  fsk_aJE
;  aJH  <=  fsk_aJH
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aId (Array String (Maybe Int)))
; (declare-const aIe (Array String (Maybe Int)))
; (declare-const aIf (Array String (Maybe Int)))
; (declare-const aJE (Array String (Maybe Int)))
; (declare-const aJH (Array String (Maybe Int)))
(declare-const
   aId
   (Array
      String
      (Maybe Int)))
(declare-const
   aIe
   (Array
      String
      (Maybe Int)))
(declare-const
   aIf
   (Array
      String
      (Maybe Int)))
(declare-const
   aJE
   (Array
      String
      (Maybe Int)))
(declare-const
   aJH
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aIe
            "ok"
            (just 2))
         aJH)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            aId
            "ok"
            (just 2))
         aJE)
      :named
      given-17.2))
(assert
   (!
      (= aJH aIf)
      :named
      given-17.3))
(assert
   (!
      (= aJE aIe)
      :named
      given-17.4))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_aIl} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIe aIf)

; WANTEDS (names)
;  aIe  <=  m2
;  aIf  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aIe aIf))
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
;            aIe
;            "ok"
;            (just 2))
;         aJH)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            aId
;            "ok"
;            (just 2))
;         aJE)
;      :named
;      given-17.2)
;   (!
;      (= aJH aIf)
;      :named
;      given-17.3)
;   (!
;      (= aJE aIe)
;      :named
;      given-17.4)
;   (!
;      (not
;         (= aIe aIf))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.3 given-17.2 wanted-17 given-17.1 given-17.4)
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
; [G] co_aJS {1}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aJP {1}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] co_aJT {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] co_aJV {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIw} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aIn,aIp,"bob"],aJR)
; (Delete [Symbol [],aIn,aIo,"bob"],aJO)
; (aJR,aIq)
; (aJO,aIp)

; WANTEDS (Thoralf style)
; (aIp,aIq)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_aIw} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIp aIq)

; GIVENS (names)
;  aIo  <=  m1
;  aIp  <=  m2
;  aIq  <=  m3
;  aJO  <=  fsk_aJO
;  aJR  <=  fsk_aJR
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIo (Array String (Maybe SortaIn)))
; (declare-const aIp (Array String (Maybe SortaIn)))
; (declare-const aIq (Array String (Maybe SortaIn)))
; (declare-const aJO (Array String (Maybe SortaIn)))
; (declare-const aJR (Array String (Maybe SortaIn)))
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
   aJO
   (Array
      String
      (Maybe SortaIn)))
(declare-const
   aJR
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
         aJR)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            aIo
            "bob"
            (as
               nothing
               (Maybe SortaIn)))
         aJO)
      :named
      given-19.2))
(assert
   (!
      (= aJR aIq)
      :named
      given-19.3))
(assert
   (!
      (= aJO aIp)
      :named
      given-19.4))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_aIw} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= aIp aIq)

; WANTEDS (names)
;  aIp  <=  m2
;  aIq  <=  m3
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aIp aIq))
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
;            aIp
;            "bob"
;            (as
;               nothing
;               (Maybe SortaIn)))
;         aJR)
;      :named
;      given-19.1)
;   (!
;      (=
;         (store
;            aIo
;            "bob"
;            (as
;               nothing
;               (Maybe SortaIn)))
;         aJO)
;      :named
;      given-19.2)
;   (!
;      (= aJR aIq)
;      :named
;      given-19.3)
;   (!
;      (= aJO aIp)
;      :named
;      given-19.4)
;   (!
;      (not
;         (= aIp aIq))
;      :named
;      wanted-19))
(get-unsat-core)
; (wanted-19 given-19.1 given-19.2 given-19.3 given-19.4)
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
; [WD] hole{co_a27E} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a27n,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a27E} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27n
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
;      [WD] hole{co_a27E} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27n
;    (lit "63A"))

; WANTEDS (names)
;  a27n  <=  t_a27n
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a27n Type)
(declare-const a27n Type)
(assert
   (!
      (not
         (=
            a27n
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
;            a27n
;            (lit "63A"))))
;   (define-fun
;      a27n
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
; [WD] hole{co_a27E} {1}:: t0 ~ 'LiftedRep (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (a27n,LiftedRep [])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a27E} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27n
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
;      [WD] hole{co_a27E} {1}:: t0 ~ 'LiftedRep (CNonCanonical)
;  =>  (=
;    a27n
;    (lit "63A"))

; WANTEDS (names)
;  a27n  <=  t_a27n
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const a27n Type)
(declare-const a27n Type)
(assert
   (!
      (not
         (=
            a27n
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
;            a27n
;            (lit "63A"))))
;   (define-fun
;      a27n
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
; [WD] hole{co_a280} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a27V} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a285} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a27H,a27I],<? [a27K,a27L])
; (<? [a27J,a27L],<? [a27G,a27I])
; (<? [a27G,a27H],<? [a27J,a27K])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a280} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27H a27I)
;    (< a27K a27L))

;      [WD] hole{co_a27V} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27J a27L)
;    (< a27G a27I))

;      [WD] hole{co_a285} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27G a27H)
;    (< a27J a27K))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a280} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27H a27I)
;    (< a27K a27L))

;      [WD] hole{co_a27V} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27J a27L)
;    (< a27G a27I))

;      [WD] hole{co_a285} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27G a27H)
;    (< a27J a27K))

; WANTEDS (names)
;  a27G  <=  a
;  a27H  <=  b
;  a27I  <=  c
;  a27J  <=  a_a27J
;  a27K  <=  b_a27K
;  a27L  <=  c_a27L
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a27G))
; (assert (<= 0 a27H))
; (assert (<= 0 a27I))
; (assert (<= 0 a27J))
; (assert (<= 0 a27K))
; (assert (<= 0 a27L))
; (declare-const a27G Int)
; (declare-const a27H Int)
; (declare-const a27I Int)
; (declare-const a27J Int)
; (declare-const a27K Int)
; (declare-const a27L Int)
(declare-const a27G Int)
(declare-const a27H Int)
(declare-const a27I Int)
(declare-const a27J Int)
(declare-const a27K Int)
(declare-const a27L Int)
(assert
   (<= 0 a27G))
(assert
   (<= 0 a27H))
(assert
   (<= 0 a27I))
(assert
   (<= 0 a27J))
(assert
   (<= 0 a27K))
(assert
   (<= 0 a27L))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a27H a27I)
                  (< a27K a27L)))
            (not
               (=
                  (< a27J a27L)
                  (< a27G a27I))))
         (not
            (=
               (< a27G a27H)
               (< a27J a27K))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a27G
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
;               (< a27H a27I)
;               (< a27K a27L)))
;         (not
;            (=
;               (< a27J a27L)
;               (< a27G a27I)))
;         (not
;            (=
;               (< a27G a27H)
;               (< a27J a27K)))))
;   (define-fun
;      a27H
;      ()
;      Int
;      0)
;   (define-fun
;      a27L
;      ()
;      Int
;      0)
;   (define-fun
;      a27I
;      ()
;      Int
;      0)
;   (define-fun
;      a27K
;      ()
;      Int
;      1)
;   (define-fun
;      a27J
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a280} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{co_a27V} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{co_a285} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a27H,a27I],<? [a27K,a27L])
; (<? [a27J,a27L],<? [a27G,a27I])
; (<? [a27G,a27H],<? [a27J,a27K])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a280} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27H a27I)
;    (< a27K a27L))

;      [WD] hole{co_a27V} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27J a27L)
;    (< a27G a27I))

;      [WD] hole{co_a285} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27G a27H)
;    (< a27J a27K))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a280} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a27H a27I)
;    (< a27K a27L))

;      [WD] hole{co_a27V} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a27J a27L)
;    (< a27G a27I))

;      [WD] hole{co_a285} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a27G a27H)
;    (< a27J a27K))

; WANTEDS (names)
;  a27G  <=  a
;  a27H  <=  b
;  a27I  <=  c
;  a27J  <=  a_a27J
;  a27K  <=  b_a27K
;  a27L  <=  c_a27L
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a27G))
; (assert (<= 0 a27H))
; (assert (<= 0 a27I))
; (assert (<= 0 a27J))
; (assert (<= 0 a27K))
; (assert (<= 0 a27L))
; (declare-const a27G Int)
; (declare-const a27H Int)
; (declare-const a27I Int)
; (declare-const a27J Int)
; (declare-const a27K Int)
; (declare-const a27L Int)
(declare-const a27G Int)
(declare-const a27H Int)
(declare-const a27I Int)
(declare-const a27J Int)
(declare-const a27K Int)
(declare-const a27L Int)
(assert
   (<= 0 a27G))
(assert
   (<= 0 a27H))
(assert
   (<= 0 a27I))
(assert
   (<= 0 a27J))
(assert
   (<= 0 a27K))
(assert
   (<= 0 a27L))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a27H a27I)
                  (< a27K a27L)))
            (not
               (=
                  (< a27J a27L)
                  (< a27G a27I))))
         (not
            (=
               (< a27G a27H)
               (< a27J a27K))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a27G
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
;               (< a27H a27I)
;               (< a27K a27L)))
;         (not
;            (=
;               (< a27J a27L)
;               (< a27G a27I)))
;         (not
;            (=
;               (< a27G a27H)
;               (< a27J a27K)))))
;   (define-fun
;      a27H
;      ()
;      Int
;      0)
;   (define-fun
;      a27L
;      ()
;      Int
;      0)
;   (define-fun
;      a27I
;      ()
;      Int
;      0)
;   (define-fun
;      a27K
;      ()
;      Int
;      1)
;   (define-fun
;      a27J
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a28D} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a28I} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a28t,a28u],+ [a28r,a28s])
; (+ [a28u,a28t],+ [a28s,a28r])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a28D} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28t a28u)
;    (+ a28r a28s))

;      [WD] hole{co_a28I} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28u a28t)
;    (+ a28s a28r))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a28D} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28t a28u)
;    (+ a28r a28s))

;      [WD] hole{co_a28I} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28u a28t)
;    (+ a28s a28r))

; WANTEDS (names)
;  a28r  <=  a
;  a28s  <=  b
;  a28t  <=  a_a28t
;  a28u  <=  b_a28u
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a28r))
; (assert (<= 0 a28s))
; (assert (<= 0 a28t))
; (assert (<= 0 a28u))
; (declare-const a28r Int)
; (declare-const a28s Int)
; (declare-const a28t Int)
; (declare-const a28u Int)
(declare-const a28r Int)
(declare-const a28s Int)
(declare-const a28t Int)
(declare-const a28u Int)
(assert
   (<= 0 a28r))
(assert
   (<= 0 a28s))
(assert
   (<= 0 a28t))
(assert
   (<= 0 a28u))
(assert
   (!
      (or
         (not
            (=
               (+ a28t a28u)
               (+ a28r a28s)))
         (not
            (=
               (+ a28u a28t)
               (+ a28s a28r))))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      a28s
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
;               (+ a28t a28u)
;               (+ a28r a28s)))
;         (not
;            (=
;               (+ a28u a28t)
;               (+ a28s a28r)))))
;   (define-fun
;      a28r
;      ()
;      Int
;      0)
;   (define-fun
;      a28u
;      ()
;      Int
;      0)
;   (define-fun
;      a28t
;      ()
;      Int
;      1))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a28D} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{co_a28I} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a28t,a28u],+ [a28r,a28s])
; (+ [a28u,a28t],+ [a28s,a28r])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_a28D} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28t a28u)
;    (+ a28r a28s))

;      [WD] hole{co_a28I} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28u a28t)
;    (+ a28s a28r))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_a28D} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a28t a28u)
;    (+ a28r a28s))

;      [WD] hole{co_a28I} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a28u a28t)
;    (+ a28s a28r))

; WANTEDS (names)
;  a28r  <=  a
;  a28s  <=  b
;  a28t  <=  a_a28t
;  a28u  <=  b_a28u
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a28r))
; (assert (<= 0 a28s))
; (assert (<= 0 a28t))
; (assert (<= 0 a28u))
; (declare-const a28r Int)
; (declare-const a28s Int)
; (declare-const a28t Int)
; (declare-const a28u Int)
(declare-const a28r Int)
(declare-const a28s Int)
(declare-const a28t Int)
(declare-const a28u Int)
(assert
   (<= 0 a28r))
(assert
   (<= 0 a28s))
(assert
   (<= 0 a28t))
(assert
   (<= 0 a28u))
(assert
   (!
      (or
         (not
            (=
               (+ a28t a28u)
               (+ a28r a28s)))
         (not
            (=
               (+ a28u a28t)
               (+ a28s a28r))))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (define-fun
;      a28s
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
;               (+ a28t a28u)
;               (+ a28r a28s)))
;         (not
;            (=
;               (+ a28u a28t)
;               (+ a28s a28r)))))
;   (define-fun
;      a28r
;      ()
;      Int
;      0)
;   (define-fun
;      a28u
;      ()
;      Int
;      0)
;   (define-fun
;      a28t
;      ()
;      Int
;      1))
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
; [G] co_a2fw {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fz {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fx {1}:: fsk0 ~ n (CTyEqCan)
; [G] co_a2fA {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2fG} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a29f],a2fv)
; (+ [1,a29h],a2fy)
; (a2fv,a293)
; (a2fy,a294)

; WANTEDS (Thoralf style)
; (- [a29h,a29f],- [a294,a293])

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{co_a2fG} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a29h a29f)
;    (- a294 a293))

; GIVENS (names)
;  a293  <=  n
;  a294  <=  m
;  a29f  <=  n
;  a29h  <=  n
;  a2fv  <=  fsk_a2fv
;  a2fy  <=  fsk_a2fy
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a293))
; (assert (<= 0 a294))
; (assert (<= 0 a29f))
; (assert (<= 0 a29h))
; (assert (<= 0 a2fv))
; (assert (<= 0 a2fy))
; (declare-const a293 Int)
; (declare-const a294 Int)
; (declare-const a29f Int)
; (declare-const a29h Int)
; (declare-const a2fv Int)
; (declare-const a2fy Int)
(declare-const a293 Int)
(declare-const a294 Int)
(declare-const a29f Int)
(declare-const a29h Int)
(declare-const a2fv Int)
(declare-const a2fy Int)
(assert
   (<= 0 a293))
(assert
   (<= 0 a294))
(assert
   (<= 0 a29f))
(assert
   (<= 0 a29h))
(assert
   (<= 0 a2fv))
(assert
   (<= 0 a2fy))
(assert
   (!
      (=
         (+ 1 a29f)
         a2fv)
      :named
      given-10.1))
(assert
   (!
      (=
         (+ 1 a29h)
         a2fy)
      :named
      given-10.2))
(assert
   (!
      (= a2fv a293)
      :named
      given-10.3))
(assert
   (!
      (= a2fy a294)
      :named
      given-10.4))
(check-sat)
; sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{co_a2fG} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a29h a29f)
;    (- a294 a293))

; WANTEDS (names)
;  a293  <=  n
;  a294  <=  m
;  a29f  <=  n
;  a29h  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a29h a29f)
            (- a294 a293)))
      :named
      wanted-10))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-10")
(get-assertions)
; (
;   (<= 0 a293)
;   (<= 0 a294)
;   (<= 0 a29f)
;   (<= 0 a29h)
;   (<= 0 a2fv)
;   (<= 0 a2fy)
;   (!
;      (=
;         (+ 1 a29f)
;         a2fv)
;      :named
;      given-10.1)
;   (!
;      (=
;         (+ 1 a29h)
;         a2fy)
;      :named
;      given-10.2)
;   (!
;      (= a2fv a293)
;      :named
;      given-10.3)
;   (!
;      (= a2fy a294)
;      :named
;      given-10.4)
;   (!
;      (not
;         (=
;            (- a29h a29f)
;            (- a294 a293)))
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
; [G] co_a2fU {1}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] co_a2fV {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2g3} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2ab],a2fT)
; (a2fT,a2a4)

; WANTEDS (Thoralf style)
; (+ [1,+ [a2ab,a2a6]],+ [a2a4,a2a6])

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_a2g3} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2ab a2a6))
;    (+ a2a4 a2a6))

; GIVENS (names)
;  a2a4  <=  n
;  a2ab  <=  n
;  a2fT  <=  fsk_a2fT
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2a4))
; (assert (<= 0 a2ab))
; (assert (<= 0 a2fT))
; (declare-const a2a4 Int)
; (declare-const a2ab Int)
; (declare-const a2fT Int)
(declare-const a2a4 Int)
(declare-const a2ab Int)
(declare-const a2fT Int)
(assert
   (<= 0 a2a4))
(assert
   (<= 0 a2ab))
(assert
   (<= 0 a2fT))
(assert
   (!
      (=
         (+ 1 a2ab)
         a2fT)
      :named
      given-17.1))
(assert
   (!
      (= a2fT a2a4)
      :named
      given-17.2))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_a2g3} {1}:: (1 + (n + m))
;                               ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2ab a2a6))
;    (+ a2a4 a2a6))

; WANTEDS (names)
;  a2a4  <=  n
;  a2a6  <=  m
;  a2ab  <=  n
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2a6))
; (declare-const a2a6 Int)
(declare-const a2a6 Int)
(assert
   (<= 0 a2a6))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a2ab a2a6))
            (+ a2a4 a2a6)))
      :named
      wanted-17))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-17")
(get-assertions)
; (
;   (<= 0 a2a4)
;   (<= 0 a2ab)
;   (<= 0 a2fT)
;   (!
;      (=
;         (+ 1 a2ab)
;         a2fT)
;      :named
;      given-17.1)
;   (!
;      (= a2fT a2a4)
;      :named
;      given-17.2)
;   (<= 0 a2a6)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a2ab a2a6))
;            (+ a2a4 a2a6)))
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
; [G] co_a2g5 {1}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] co_a2g8 {1}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] co_a2g6 {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] co_a2g9 {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2gd} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a2dK,a2dL],a2g4)
; (<? [a2dL,a2dM],a2g7)
; (a2g4,True [])
; (a2g7,True [])

; WANTEDS (Thoralf style)
; (<? [a2dK,a2dM],True [])

(echo "givens-start-cycle-20")
; GIVENS (conversions)
;      [WD] hole{co_a2gd} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a2dK a2dM)
;    true)

; GIVENS (names)
;  a2dK  <=  a
;  a2dL  <=  b
;  a2dM  <=  c
;  a2g4  <=  fsk_a2g4
;  a2g7  <=  fsk_a2g7
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2dK))
; (assert (<= 0 a2dL))
; (assert (<= 0 a2dM))
; (declare-const a2dK Int)
; (declare-const a2dL Int)
; (declare-const a2dM Int)
; (declare-const a2g4 Bool)
; (declare-const a2g7 Bool)
(declare-const a2dK Int)
(declare-const a2dL Int)
(declare-const a2dM Int)
(declare-const a2g4 Bool)
(declare-const a2g7 Bool)
(assert
   (<= 0 a2dK))
(assert
   (<= 0 a2dL))
(assert
   (<= 0 a2dM))
(assert
   (!
      (=
         (< a2dK a2dL)
         a2g4)
      :named
      given-20.1))
(assert
   (!
      (=
         (< a2dL a2dM)
         a2g7)
      :named
      given-20.2))
(assert
   (!
      (= a2g4 true)
      :named
      given-20.3))
(assert
   (!
      (= a2g7 true)
      :named
      given-20.4))
(check-sat)
; sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
;      [WD] hole{co_a2gd} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a2dK a2dM)
;    true)

; WANTEDS (names)
;  a2dK  <=  a
;  a2dM  <=  c
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a2dK a2dM)
            true))
      :named
      wanted-20))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-20")
(get-assertions)
; (
;   (<= 0 a2dK)
;   (<= 0 a2dL)
;   (<= 0 a2dM)
;   (!
;      (=
;         (< a2dK a2dL)
;         a2g4)
;      :named
;      given-20.1)
;   (!
;      (=
;         (< a2dL a2dM)
;         a2g7)
;      :named
;      given-20.2)
;   (!
;      (= a2g4 true)
;      :named
;      given-20.3)
;   (!
;      (= a2g7 true)
;      :named
;      given-20.4)
;   (!
;      (not
;         (=
;            (< a2dK a2dM)
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
; [G] co_a2gh {1}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] co_a2gf {1}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] co_a2dZ {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2e2} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a2dW,a2dX],a2gg)
; (+ [a2dW,a2dW],a2ge)
; (a2ge,a2gg)

; WANTEDS (Thoralf style)
; (a2dW,a2dX)

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a2e2} {0}:: a ~ b (CNonCanonical)
;  =>  (= a2dW a2dX)

; GIVENS (names)
;  a2dW  <=  a
;  a2dX  <=  b
;  a2ge  <=  fsk_a2ge
;  a2gg  <=  fsk_a2gg
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a2dW))
; (assert (<= 0 a2dX))
; (assert (<= 0 a2ge))
; (assert (<= 0 a2gg))
; (declare-const a2dW Int)
; (declare-const a2dX Int)
; (declare-const a2ge Int)
; (declare-const a2gg Int)
(declare-const a2dW Int)
(declare-const a2dX Int)
(declare-const a2ge Int)
(declare-const a2gg Int)
(assert
   (<= 0 a2dW))
(assert
   (<= 0 a2dX))
(assert
   (<= 0 a2ge))
(assert
   (<= 0 a2gg))
(assert
   (!
      (=
         (+ a2dW a2dX)
         a2gg)
      :named
      given-22.1))
(assert
   (!
      (=
         (+ a2dW a2dW)
         a2ge)
      :named
      given-22.2))
(assert
   (!
      (= a2ge a2gg)
      :named
      given-22.3))
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a2e2} {0}:: a ~ b (CNonCanonical)
;  =>  (= a2dW a2dX)

; WANTEDS (names)
;  a2dW  <=  a
;  a2dX  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a2dW a2dX))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a2dW)
;   (<= 0 a2dX)
;   (<= 0 a2ge)
;   (<= 0 a2gg)
;   (!
;      (=
;         (+ a2dW a2dX)
;         a2gg)
;      :named
;      given-22.1)
;   (!
;      (=
;         (+ a2dW a2dW)
;         a2ge)
;      :named
;      given-22.2)
;   (!
;      (= a2ge a2gg)
;      :named
;      given-22.3)
;   (!
;      (not
;         (= a2dW a2dX))
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
; [WD] hole{co_a2gl} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2e5,a2e6],+ [a2e6,a2e5])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a2gl} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2e5 a2e6)
;    (+ a2e6 a2e5))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a2gl} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2e5 a2e6)
;    (+ a2e6 a2e5))

; WANTEDS (names)
;  a2e5  <=  a
;  a2e6  <=  b
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2e5))
; (assert (<= 0 a2e6))
; (declare-const a2e5 Int)
; (declare-const a2e6 Int)
(declare-const a2e5 Int)
(declare-const a2e6 Int)
(assert
   (<= 0 a2e5))
(assert
   (<= 0 a2e6))
(assert
   (!
      (not
         (=
            (+ a2e5 a2e6)
            (+ a2e6 a2e5)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a2e5)
;   (<= 0 a2e6)
;   (!
;      (not
;         (=
;            (+ a2e5 a2e6)
;            (+ a2e6 a2e5)))
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
; [WD] hole{co_a2gt} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2ed,1],+ [1,a2ed])

(echo "givens-start-cycle-24")
; GIVENS (conversions)
;      [WD] hole{co_a2gt} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a2ed 1)
;    (+ 1 a2ed))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
;      [WD] hole{co_a2gt} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a2ed 1)
;    (+ 1 a2ed))

; WANTEDS (names)
;  a2ed  <=  a
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a2ed))
; (declare-const a2ed Int)
(declare-const a2ed Int)
(assert
   (<= 0 a2ed))
(assert
   (!
      (not
         (=
            (+ a2ed 1)
            (+ 1 a2ed)))
      :named
      wanted-24))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-24")
(get-assertions)
; (
;   (<= 0 a2ed)
;   (!
;      (not
;         (=
;            (+ a2ed 1)
;            (+ 1 a2ed)))
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
; [WD] hole{co_a3BG} {1}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~ Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a3Bu} {1}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~ Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [LiftedRep []],Alter [Symbol [],TYPE [LiftedRep []],Nil [Symbol [],TYPE [LiftedRep []]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a3BG} {1}:: Alter
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

;      [WD] hole{co_a3Bu} {1}:: Alter
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
;      [WD] hole{co_a3BG} {1}:: Alter
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

;      [WD] hole{co_a3Bu} {1}:: Alter
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
; [G] co_a3Cd {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3Ci {1}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] co_a3Ce {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Cj {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Co} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zy,"price",Int []],a3Cc)
; (Delete [Symbol [],TYPE [LiftedRep []],a3zB,a3zC],a3Ch)
; (a3Cc,a3zy)
; (a3Ch,a3zy)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zB,"price",Int []],a3zB)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a3Co} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zB
;       "price"
;       (just
;          (lit "3u")))
;    a3zB)

; GIVENS (names)
;  a3zy  <=  m
;  a3zB  <=  m
;  a3zC  <=  field
;  a3Cc  <=  fsk_a3Cc
;  a3Ch  <=  fsk_a3Ch
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a3Cc (Array String (Maybe Type)))
; (declare-const a3Ch (Array String (Maybe Type)))
; (declare-const a3zB (Array String (Maybe Type)))
; (declare-const a3zC String)
; (declare-const a3zy (Array String (Maybe Type)))
(declare-const
   a3zy
   (Array
      String
      (Maybe Type)))
(declare-const
   a3zB
   (Array
      String
      (Maybe Type)))
(declare-const a3zC String)
(declare-const
   a3Cc
   (Array
      String
      (Maybe Type)))
(declare-const
   a3Ch
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a3zy
            "price"
            (just
               (lit "3u")))
         a3Cc)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a3zB
            a3zC
            (as
               nothing
               (Maybe Type)))
         a3Ch)
      :named
      given-8.2))
(assert
   (!
      (= a3Cc a3zy)
      :named
      given-8.3))
(assert
   (!
      (= a3Ch a3zy)
      :named
      given-8.4))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a3Co} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zB
;       "price"
;       (just
;          (lit "3u")))
;    a3zB)

; WANTEDS (names)
;  a3zB  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a3zB
               "price"
               (just
                  (lit "3u")))
            a3zB))
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
;            a3zy
;            "price"
;            (just
;               (lit "3u")))
;         a3Cc)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a3zB
;            a3zC
;            (as
;               nothing
;               (Maybe Type)))
;         a3Ch)
;      :named
;      given-8.2)
;   (!
;      (= a3Cc a3zy)
;      :named
;      given-8.3)
;   (!
;      (= a3Ch a3zy)
;      :named
;      given-8.4)
;   (!
;      (not
;         (=
;            (store
;               a3zB
;               "price"
;               (just
;                  (lit "3u")))
;            a3zB))
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
; [G] co_a3Cd {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3Cv {2}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] co_a3Cs {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Ce {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Cu {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3zZ} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zy,"price",Int []],a3Cc)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zI,"price",a3zK],a3Cq)
; (a3Cq,a3zy)
; (a3Cc,a3zy)
; (a3zJ,"price")

; WANTEDS (Thoralf style)
; (a3zK,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a3zZ} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a3zK
;    (lit "3u"))

; GIVENS (names)
;  a3zy  <=  m
;  a3zI  <=  m
;  a3zJ  <=  field
;  a3zK  <=  val
;  a3Cc  <=  fsk_a3Cc
;  a3Cq  <=  fsk_a3Cq
(push 1)
; DECS1 (seen) 
; (declare-const a3Cc (Array String (Maybe Type)))
; (declare-const a3zy (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a3Cq (Array String (Maybe Type)))
; (declare-const a3zI (Array String (Maybe Type)))
; (declare-const a3zJ String)
; (declare-const a3zK Type)
(declare-const
   a3zy
   (Array
      String
      (Maybe Type)))
(declare-const
   a3zI
   (Array
      String
      (Maybe Type)))
(declare-const a3zJ String)
(declare-const a3zK Type)
(declare-const
   a3Cc
   (Array
      String
      (Maybe Type)))
(declare-const
   a3Cq
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a3zy
            "price"
            (just
               (lit "3u")))
         a3Cc)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a3zI
            "price"
            (just a3zK))
         a3Cq)
      :named
      given-11.2))
(assert
   (!
      (= a3Cq a3zy)
      :named
      given-11.3))
(assert
   (!
      (= a3Cc a3zy)
      :named
      given-11.4))
(assert
   (!
      (= a3zJ "price")
      :named
      given-11.5))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a3zZ} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a3zK
;    (lit "3u"))

; WANTEDS (names)
;  a3zK  <=  val
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a3zK
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
;            a3zy
;            "price"
;            (just
;               (lit "3u")))
;         a3Cc)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a3zI
;            "price"
;            (just a3zK))
;         a3Cq)
;      :named
;      given-11.2)
;   (!
;      (= a3Cq a3zy)
;      :named
;      given-11.3)
;   (!
;      (= a3Cc a3zy)
;      :named
;      given-11.4)
;   (!
;      (= a3zJ "price")
;      :named
;      given-11.5)
;   (!
;      (not
;         (=
;            a3zK
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
; [G] $dDisEquality_a3A1 {0}:: DisEquality field "price" (CDictCan)
; [G] co_a3Cd {1}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] co_a3Cr {1}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] co_a3Ce {1}:: fsk0 ~ m (CTyEqCan)
; [G] co_a3Cs {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a3Cz} {1}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a3A1 {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zy,"price",Int []],a3Cc)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zI,a3zJ,a3zK],a3Cq)
; (a3Cc,a3zy)
; (a3Cq,a3zy)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a3zI,"price",Int []],a3zI)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a3Cz} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zI
;       "price"
;       (just
;          (lit "3u")))
;    a3zI)

; GIVENS (names)
;  a3zy  <=  m
;  a3zI  <=  m
;  a3zJ  <=  field
;  a3zK  <=  val
;  a3Cc  <=  fsk_a3Cc
;  a3Cq  <=  fsk_a3Cq
(push 1)
; DECS1 (seen) 
; (declare-const a3Cc (Array String (Maybe Type)))
; (declare-const a3Cq (Array String (Maybe Type)))
; (declare-const a3zI (Array String (Maybe Type)))
; (declare-const a3zJ String)
; (declare-const a3zK Type)
; (declare-const a3zy (Array String (Maybe Type)))
; DECS1 (unseen) 
(declare-const
   a3zy
   (Array
      String
      (Maybe Type)))
(declare-const
   a3zI
   (Array
      String
      (Maybe Type)))
(declare-const a3zJ String)
(declare-const a3zK Type)
(declare-const
   a3Cc
   (Array
      String
      (Maybe Type)))
(declare-const
   a3Cq
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a3zJ "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a3zy
            "price"
            (just
               (lit "3u")))
         a3Cc)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a3zI
            a3zJ
            (just a3zK))
         a3Cq)
      :named
      given-13.3))
(assert
   (!
      (= a3Cc a3zy)
      :named
      given-13.4))
(assert
   (!
      (= a3Cq a3zy)
      :named
      given-13.5))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a3Cz} {1}:: Alter m "price" Int
;                               ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a3zI
;       "price"
;       (just
;          (lit "3u")))
;    a3zI)

; WANTEDS (names)
;  a3zI  <=  m
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a3zI
               "price"
               (just
                  (lit "3u")))
            a3zI))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a3zJ "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a3zy
;            "price"
;            (just
;               (lit "3u")))
;         a3Cc)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a3zI
;            a3zJ
;            (just a3zK))
;         a3Cq)
;      :named
;      given-13.3)
;   (!
;      (= a3Cc a3zy)
;      :named
;      given-13.4)
;   (!
;      (= a3Cq a3zy)
;      :named
;      given-13.5)
;   (!
;      (not
;         (=
;            (store
;               a3zI
;               "price"
;               (just
;                  (lit "3u")))
;            a3zI))
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
