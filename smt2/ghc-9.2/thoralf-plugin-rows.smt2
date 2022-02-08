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
; [G] co_aGZ {1}:: IntersectL b_aGt[sk:1] c_aGv[sk:1]
;                  ~# bc_aGx[sk:1] (CEqCan)
; [G] co_aGW {1}:: IntersectL ab_aGu[sk:1] c_aGv[sk:1]
;                  ~# abc_aGw[sk:1] (CEqCan)
; [G] co_aGT {1}:: IntersectL a_aGs[sk:1] b_aGt[sk:1]
;                  ~# ab_aGu[sk:1] (CEqCan)
; [G] co_aH2 {1}:: IntersectL a_aGs[sk:1] bc_aGx[sk:1]
;                  ~# abc'_aGy[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aH9} {2}:: IntersectL
;                           a_aGF[tau:1] (IntersectL b_aGG[tau:1] c_aGI[tau:1])
;                         ~# abc'_aGy[sk:1] (CNonCanonical)
; [WD] hole{co_aH6} {2}:: IntersectL
;                           (IntersectL a_aGF[tau:1] b_aGG[tau:1]) c_aGI[tau:1]
;                         ~# abc_aGw[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aGq,aGr,aGt,aGv],aGx)
; (IntersectL [aGq,aGr,aGu,aGv],aGw)
; (IntersectL [aGq,aGr,aGs,aGt],aGu)
; (IntersectL [aGq,aGr,aGs,aGx],aGy)

; WANTEDS (Thoralf style)
; (IntersectL [aGq,aGr,aGF,IntersectL [aGq,aGr,aGG,aGI]],aGy)
; (IntersectL [aGq,aGr,IntersectL [aGq,aGr,aGF,aGG],aGI],aGw)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aH9} {2}:: IntersectL
;                                a_aGF[tau:1] (IntersectL b_aGG[tau:1] c_aGI[tau:1])
;                              ~# abc'_aGy[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      aGF
;      (
;        (_ map both1941158302631071856)
;        aGG
;        aGI))
;    aGy)

;      [WD] hole{co_aH6} {2}:: IntersectL
;                                (IntersectL a_aGF[tau:1] b_aGG[tau:1]) c_aGI[tau:1]
;                              ~# abc_aGw[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      (
;        (_ map both1941158302631071856)
;        aGF
;        aGG)
;      aGI)
;    aGw)

; GIVENS (names)
;  aGs  <=  a_aGs[sk:1]
;  aGt  <=  b_aGt[sk:1]
;  aGu  <=  ab_aGu[sk:1]
;  aGv  <=  c_aGv[sk:1]
;  aGw  <=  abc_aGw[sk:1]
;  aGx  <=  bc_aGx[sk:1]
;  aGy  <=  abc'_aGy[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaGr)) (y (Maybe SortaGr))) (=> (and ((_ is (just (SortaGr) (Maybe SortaGr))) x) ((_ is (just (SortaGr) (Maybe SortaGr))) y)) (= (both1941158302631071856 x y) x))))
; (assert (forall ((y (Maybe SortaGr))) (= (both1941158302631071856 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaGr))) (= (both1941158302631071856 y (as nothing (Maybe SortaGr))) (as nothing (Maybe SortaGr)))))
; (declare-const aGs (Array SortaGq (Maybe SortaGr)))
; (declare-const aGt (Array SortaGq (Maybe SortaGr)))
; (declare-const aGu (Array SortaGq (Maybe SortaGr)))
; (declare-const aGv (Array SortaGq (Maybe SortaGr)))
; (declare-const aGw (Array SortaGq (Maybe SortaGr)))
; (declare-const aGx (Array SortaGq (Maybe SortaGr)))
; (declare-const aGy (Array SortaGq (Maybe SortaGr)))
; (declare-fun both1941158302631071856 ((Maybe SortaGr) (Maybe SortaGr)) (Maybe SortaGr))
; (declare-sort SortaGq)
; (declare-sort SortaGr)
(declare-sort SortaGq)
(declare-sort SortaGr)
(declare-const
   aGs
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGt
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGu
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGv
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGw
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGx
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGy
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-fun
   both1941158302631071856
   (
     (Maybe SortaGr)
     (Maybe SortaGr))
   (Maybe SortaGr))
(assert
   (forall
      (
        (y
           (Maybe SortaGr)))
      (=
         (both1941158302631071856
            y
            (as
               nothing
               (Maybe SortaGr)))
         (as
            nothing
            (Maybe SortaGr)))))
(assert
   (forall
      (
        (y
           (Maybe SortaGr)))
      (=
         (both1941158302631071856 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaGr))
        (y
           (Maybe SortaGr)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaGr)
                    (Maybe SortaGr)))
              x)
            (
              (_
                 is
                 (just
                    (SortaGr)
                    (Maybe SortaGr)))
              y))
         (=
            (both1941158302631071856 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGt
           aGv)
         aGx)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGu
           aGv)
         aGw)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGs
           aGt)
         aGu)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGs
           aGx)
         aGy)
      :named
      given-2.4))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aH9} {2}:: IntersectL
;                                a_aGF[tau:1] (IntersectL b_aGG[tau:1] c_aGI[tau:1])
;                              ~# abc'_aGy[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      aGF
;      (
;        (_ map both1941158302631071856)
;        aGG
;        aGI))
;    aGy)

;      [WD] hole{co_aH6} {2}:: IntersectL
;                                (IntersectL a_aGF[tau:1] b_aGG[tau:1]) c_aGI[tau:1]
;                              ~# abc_aGw[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      (
;        (_ map both1941158302631071856)
;        aGF
;        aGG)
;      aGI)
;    aGw)

; WANTEDS (names)
;  aGw  <=  abc_aGw[sk:1]
;  aGy  <=  abc'_aGy[sk:1]
;  aGF  <=  a_aGF[tau:1]
;  aGG  <=  b_aGG[tau:1]
;  aGI  <=  c_aGI[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGF (Array SortaGq (Maybe SortaGr)))
; (declare-const aGG (Array SortaGq (Maybe SortaGr)))
; (declare-const aGI (Array SortaGq (Maybe SortaGr)))
(declare-const
   aGF
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGG
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGI
   (Array
      SortaGq
      (Maybe SortaGr)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1941158302631071856)
                 aGF
                 (
                   (_ map both1941158302631071856)
                   aGG
                   aGI))
               aGy))
         (not
            (=
               (
                 (_ map both1941158302631071856)
                 (
                   (_ map both1941158302631071856)
                   aGF
                   aGG)
                 aGI)
               aGw)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaGr!val!2
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!4
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!0
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!1
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!3
;      ()
;      SortaGr)
;   (forall
;      (
;        (x SortaGr))
;      (or
;         (= x SortaGr!val!2)
;         (= x SortaGr!val!4)
;         (= x SortaGr!val!0)
;         (= x SortaGr!val!1)
;         (= x SortaGr!val!3)))
;   (declare-fun
;      SortaGq!val!0
;      ()
;      SortaGq)
;   (forall
;      (
;        (x SortaGq))
;      (= x SortaGq!val!0))
;   (define-fun
;      aGw
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGt
;           aGv)
;         aGx))
;   (define-fun
;      aGy
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGs
;           aGt)
;         aGu))
;   (define-fun
;      aGx
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           (just SortaGr!val!1))
;         SortaGq!val!0
;         nothing))
;   (define-fun
;      aGG
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           nothing)
;         SortaGq!val!0
;         (just SortaGr!val!3)))
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
;                      (_ map both1941158302631071856)
;                      aGF
;                      (
;                        (_ map both1941158302631071856)
;                        aGG
;                        aGI))
;                    aGy)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1941158302631071856)
;                      (
;                        (_ map both1941158302631071856)
;                        aGF
;                        aGG)
;                      aGI)
;                    aGw))))
;         (or a!1 a!2)))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGs
;           aGx)
;         aGy))
;   (define-fun
;      aGv
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGu
;           aGv)
;         aGw))
;   (define-fun
;      aGI
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           nothing)
;         SortaGq!val!0
;         (just SortaGr!val!4)))
;   (define-fun
;      aGF
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           (just SortaGr!val!0))
;         SortaGq!val!0
;         (just SortaGr!val!2)))
;   (define-fun
;      aGt
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      aGu
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      both1941158302631071856
;      (
;        (x!0
;           (Maybe SortaGr))
;        (x!1
;           (Maybe SortaGr)))
;      (Maybe SortaGr)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGr!val!1))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaGr!val!0))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaGr!val!2))
;                  (=
;                     x!1
;                     (just SortaGr!val!3)))
;               (just SortaGr!val!2)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaGr!val!2))
;                     (=
;                        x!1
;                        (just SortaGr!val!4)))
;                  (just SortaGr!val!2)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaGr!val!3))
;                           (=
;                              x!1
;                              (just SortaGr!val!4)))
;                        (just SortaGr!val!3)
;                        (ite
;                           (and
;                              (
;                                (_ is just)
;                                x!0)
;                              (
;                                (_ is just)
;                                x!1))
;                           x!0
;                           nothing)))))))))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] co_aGZ {1}:: IntersectL b_aGt[sk:1] c_aGv[sk:1]
;                  ~# bc_aGx[sk:1] (CEqCan)
; [G] co_aGW {1}:: IntersectL ab_aGu[sk:1] c_aGv[sk:1]
;                  ~# abc_aGw[sk:1] (CEqCan)
; [G] co_aGT {1}:: IntersectL a_aGs[sk:1] b_aGt[sk:1]
;                  ~# ab_aGu[sk:1] (CEqCan)
; [G] co_aH2 {1}:: IntersectL a_aGs[sk:1] bc_aGx[sk:1]
;                  ~# abc'_aGy[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aH9} {2}:: IntersectL
;                           a_aGF[tau:1] (IntersectL b_aGG[tau:1] c_aGI[tau:1])
;                         ~# abc'_aGy[sk:1] (CNonCanonical)
; [WD] hole{co_aH6} {2}:: IntersectL
;                           (IntersectL a_aGF[tau:1] b_aGG[tau:1]) c_aGI[tau:1]
;                         ~# abc_aGw[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aGq,aGr,aGt,aGv],aGx)
; (IntersectL [aGq,aGr,aGu,aGv],aGw)
; (IntersectL [aGq,aGr,aGs,aGt],aGu)
; (IntersectL [aGq,aGr,aGs,aGx],aGy)

; WANTEDS (Thoralf style)
; (IntersectL [aGq,aGr,aGF,IntersectL [aGq,aGr,aGG,aGI]],aGy)
; (IntersectL [aGq,aGr,IntersectL [aGq,aGr,aGF,aGG],aGI],aGw)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aH9} {2}:: IntersectL
;                                a_aGF[tau:1] (IntersectL b_aGG[tau:1] c_aGI[tau:1])
;                              ~# abc'_aGy[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      aGF
;      (
;        (_ map both1941158302631071856)
;        aGG
;        aGI))
;    aGy)

;      [WD] hole{co_aH6} {2}:: IntersectL
;                                (IntersectL a_aGF[tau:1] b_aGG[tau:1]) c_aGI[tau:1]
;                              ~# abc_aGw[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      (
;        (_ map both1941158302631071856)
;        aGF
;        aGG)
;      aGI)
;    aGw)

; GIVENS (names)
;  aGs  <=  a_aGs[sk:1]
;  aGt  <=  b_aGt[sk:1]
;  aGu  <=  ab_aGu[sk:1]
;  aGv  <=  c_aGv[sk:1]
;  aGw  <=  abc_aGw[sk:1]
;  aGx  <=  bc_aGx[sk:1]
;  aGy  <=  abc'_aGy[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaGr)) (y (Maybe SortaGr))) (=> (and ((_ is (just (SortaGr) (Maybe SortaGr))) x) ((_ is (just (SortaGr) (Maybe SortaGr))) y)) (= (both1941158302631071856 x y) x))))
; (assert (forall ((y (Maybe SortaGr))) (= (both1941158302631071856 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaGr))) (= (both1941158302631071856 y (as nothing (Maybe SortaGr))) (as nothing (Maybe SortaGr)))))
; (declare-const aGs (Array SortaGq (Maybe SortaGr)))
; (declare-const aGt (Array SortaGq (Maybe SortaGr)))
; (declare-const aGu (Array SortaGq (Maybe SortaGr)))
; (declare-const aGv (Array SortaGq (Maybe SortaGr)))
; (declare-const aGw (Array SortaGq (Maybe SortaGr)))
; (declare-const aGx (Array SortaGq (Maybe SortaGr)))
; (declare-const aGy (Array SortaGq (Maybe SortaGr)))
; (declare-fun both1941158302631071856 ((Maybe SortaGr) (Maybe SortaGr)) (Maybe SortaGr))
; (declare-sort SortaGq)
; (declare-sort SortaGr)
(declare-sort SortaGq)
(declare-sort SortaGr)
(declare-const
   aGs
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGt
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGu
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGv
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGw
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGx
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGy
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-fun
   both1941158302631071856
   (
     (Maybe SortaGr)
     (Maybe SortaGr))
   (Maybe SortaGr))
(assert
   (forall
      (
        (y
           (Maybe SortaGr)))
      (=
         (both1941158302631071856
            y
            (as
               nothing
               (Maybe SortaGr)))
         (as
            nothing
            (Maybe SortaGr)))))
(assert
   (forall
      (
        (y
           (Maybe SortaGr)))
      (=
         (both1941158302631071856 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaGr))
        (y
           (Maybe SortaGr)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaGr)
                    (Maybe SortaGr)))
              x)
            (
              (_
                 is
                 (just
                    (SortaGr)
                    (Maybe SortaGr)))
              y))
         (=
            (both1941158302631071856 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGt
           aGv)
         aGx)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGu
           aGv)
         aGw)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGs
           aGt)
         aGu)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1941158302631071856)
           aGs
           aGx)
         aGy)
      :named
      given-2.4))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aH9} {2}:: IntersectL
;                                a_aGF[tau:1] (IntersectL b_aGG[tau:1] c_aGI[tau:1])
;                              ~# abc'_aGy[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      aGF
;      (
;        (_ map both1941158302631071856)
;        aGG
;        aGI))
;    aGy)

;      [WD] hole{co_aH6} {2}:: IntersectL
;                                (IntersectL a_aGF[tau:1] b_aGG[tau:1]) c_aGI[tau:1]
;                              ~# abc_aGw[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941158302631071856)
;      (
;        (_ map both1941158302631071856)
;        aGF
;        aGG)
;      aGI)
;    aGw)

; WANTEDS (names)
;  aGw  <=  abc_aGw[sk:1]
;  aGy  <=  abc'_aGy[sk:1]
;  aGF  <=  a_aGF[tau:1]
;  aGG  <=  b_aGG[tau:1]
;  aGI  <=  c_aGI[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGF (Array SortaGq (Maybe SortaGr)))
; (declare-const aGG (Array SortaGq (Maybe SortaGr)))
; (declare-const aGI (Array SortaGq (Maybe SortaGr)))
(declare-const
   aGF
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGG
   (Array
      SortaGq
      (Maybe SortaGr)))
(declare-const
   aGI
   (Array
      SortaGq
      (Maybe SortaGr)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1941158302631071856)
                 aGF
                 (
                   (_ map both1941158302631071856)
                   aGG
                   aGI))
               aGy))
         (not
            (=
               (
                 (_ map both1941158302631071856)
                 (
                   (_ map both1941158302631071856)
                   aGF
                   aGG)
                 aGI)
               aGw)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaGr!val!2
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!4
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!0
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!1
;      ()
;      SortaGr)
;   (declare-fun
;      SortaGr!val!3
;      ()
;      SortaGr)
;   (forall
;      (
;        (x SortaGr))
;      (or
;         (= x SortaGr!val!2)
;         (= x SortaGr!val!4)
;         (= x SortaGr!val!0)
;         (= x SortaGr!val!1)
;         (= x SortaGr!val!3)))
;   (declare-fun
;      SortaGq!val!0
;      ()
;      SortaGq)
;   (forall
;      (
;        (x SortaGq))
;      (= x SortaGq!val!0))
;   (define-fun
;      aGw
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGt
;           aGv)
;         aGx))
;   (define-fun
;      aGy
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGs
;           aGt)
;         aGu))
;   (define-fun
;      aGx
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           (just SortaGr!val!1))
;         SortaGq!val!0
;         nothing))
;   (define-fun
;      aGG
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           nothing)
;         SortaGq!val!0
;         (just SortaGr!val!3)))
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
;                      (_ map both1941158302631071856)
;                      aGF
;                      (
;                        (_ map both1941158302631071856)
;                        aGG
;                        aGI))
;                    aGy)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1941158302631071856)
;                      (
;                        (_ map both1941158302631071856)
;                        aGF
;                        aGG)
;                      aGI)
;                    aGw))))
;         (or a!1 a!2)))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGs
;           aGx)
;         aGy))
;   (define-fun
;      aGv
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941158302631071856)
;           aGu
;           aGv)
;         aGw))
;   (define-fun
;      aGI
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           nothing)
;         SortaGq!val!0
;         (just SortaGr!val!4)))
;   (define-fun
;      aGF
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGq
;                 (Maybe SortaGr)))
;           (just SortaGr!val!0))
;         SortaGq!val!0
;         (just SortaGr!val!2)))
;   (define-fun
;      aGt
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      aGu
;      ()
;      (Array
;         SortaGq
;         (Maybe SortaGr))
;      (
;        (as
;           const
;           (Array
;              SortaGq
;              (Maybe SortaGr)))
;        nothing))
;   (define-fun
;      both1941158302631071856
;      (
;        (x!0
;           (Maybe SortaGr))
;        (x!1
;           (Maybe SortaGr)))
;      (Maybe SortaGr)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGr!val!1))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaGr!val!0))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaGr!val!2))
;                  (=
;                     x!1
;                     (just SortaGr!val!3)))
;               (just SortaGr!val!2)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaGr!val!2))
;                     (=
;                        x!1
;                        (just SortaGr!val!4)))
;                  (just SortaGr!val!2)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaGr!val!3))
;                           (=
;                              x!1
;                              (just SortaGr!val!4)))
;                        (just SortaGr!val!3)
;                        (ite
;                           (and
;                              (
;                                (_ is just)
;                                x!0)
;                              (
;                                (_ is just)
;                                x!1))
;                           x!0
;                           nothing)))))))))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_aI9 {1}:: UnionL b_aHD[sk:1] c_aHF[sk:1]
;                  ~# bc_aHH[sk:1] (CEqCan)
; [G] co_aI6 {1}:: UnionL ab_aHE[sk:1] c_aHF[sk:1]
;                  ~# abc_aHG[sk:1] (CEqCan)
; [G] co_aI3 {1}:: UnionL a_aHC[sk:1] b_aHD[sk:1]
;                  ~# ab_aHE[sk:1] (CEqCan)
; [G] co_aIc {1}:: UnionL a_aHC[sk:1] bc_aHH[sk:1]
;                  ~# abc'_aHI[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIj} {2}:: UnionL
;                           a_aHP[tau:1] (UnionL b_aHQ[tau:1] c_aHS[tau:1])
;                         ~# abc'_aHI[sk:1] (CNonCanonical)
; [WD] hole{co_aIg} {2}:: UnionL
;                           (UnionL a_aHP[tau:1] b_aHQ[tau:1]) c_aHS[tau:1]
;                         ~# abc_aHG[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aHA,aHB,aHD,aHF],aHH)
; (UnionL [aHA,aHB,aHE,aHF],aHG)
; (UnionL [aHA,aHB,aHC,aHD],aHE)
; (UnionL [aHA,aHB,aHC,aHH],aHI)

; WANTEDS (Thoralf style)
; (UnionL [aHA,aHB,aHP,UnionL [aHA,aHB,aHQ,aHS]],aHI)
; (UnionL [aHA,aHB,UnionL [aHA,aHB,aHP,aHQ],aHS],aHG)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aIj} {2}:: UnionL
;                                a_aHP[tau:1] (UnionL b_aHQ[tau:1] c_aHS[tau:1])
;                              ~# abc'_aHI[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      aHP
;      (
;        (_ map either1945923586026792211)
;        aHQ
;        aHS))
;    aHI)

;      [WD] hole{co_aIg} {2}:: UnionL
;                                (UnionL a_aHP[tau:1] b_aHQ[tau:1]) c_aHS[tau:1]
;                              ~# abc_aHG[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      (
;        (_ map either1945923586026792211)
;        aHP
;        aHQ)
;      aHS)
;    aHG)

; GIVENS (names)
;  aHC  <=  a_aHC[sk:1]
;  aHD  <=  b_aHD[sk:1]
;  aHE  <=  ab_aHE[sk:1]
;  aHF  <=  c_aHF[sk:1]
;  aHG  <=  abc_aHG[sk:1]
;  aHH  <=  bc_aHH[sk:1]
;  aHI  <=  abc'_aHI[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaHB)) (y (Maybe SortaHB))) (=> ((_ is (just (SortaHB) (Maybe SortaHB))) x) (= (either1945923586026792211 x y) x))))
; (assert (forall ((y (Maybe SortaHB))) (= (either1945923586026792211 (as nothing (Maybe SortaHB)) y) y)))
; (declare-const aHC (Array SortaHA (Maybe SortaHB)))
; (declare-const aHD (Array SortaHA (Maybe SortaHB)))
; (declare-const aHE (Array SortaHA (Maybe SortaHB)))
; (declare-const aHF (Array SortaHA (Maybe SortaHB)))
; (declare-const aHG (Array SortaHA (Maybe SortaHB)))
; (declare-const aHH (Array SortaHA (Maybe SortaHB)))
; (declare-const aHI (Array SortaHA (Maybe SortaHB)))
; (declare-fun either1945923586026792211 ((Maybe SortaHB) (Maybe SortaHB)) (Maybe SortaHB))
; (declare-sort SortaHA)
; (declare-sort SortaHB)
(declare-sort SortaHA)
(declare-sort SortaHB)
(declare-const
   aHC
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHD
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHE
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHF
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHG
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHH
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHI
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-fun
   either1945923586026792211
   (
     (Maybe SortaHB)
     (Maybe SortaHB))
   (Maybe SortaHB))
(assert
   (forall
      (
        (y
           (Maybe SortaHB)))
      (=
         (either1945923586026792211
            (as
               nothing
               (Maybe SortaHB))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaHB))
        (y
           (Maybe SortaHB)))
      (=>
         (
           (_
              is
              (just
                 (SortaHB)
                 (Maybe SortaHB)))
           x)
         (=
            (either1945923586026792211 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHD
           aHF)
         aHH)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHE
           aHF)
         aHG)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHC
           aHD)
         aHE)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHC
           aHH)
         aHI)
      :named
      given-4.4))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aIj} {2}:: UnionL
;                                a_aHP[tau:1] (UnionL b_aHQ[tau:1] c_aHS[tau:1])
;                              ~# abc'_aHI[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      aHP
;      (
;        (_ map either1945923586026792211)
;        aHQ
;        aHS))
;    aHI)

;      [WD] hole{co_aIg} {2}:: UnionL
;                                (UnionL a_aHP[tau:1] b_aHQ[tau:1]) c_aHS[tau:1]
;                              ~# abc_aHG[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      (
;        (_ map either1945923586026792211)
;        aHP
;        aHQ)
;      aHS)
;    aHG)

; WANTEDS (names)
;  aHG  <=  abc_aHG[sk:1]
;  aHI  <=  abc'_aHI[sk:1]
;  aHP  <=  a_aHP[tau:1]
;  aHQ  <=  b_aHQ[tau:1]
;  aHS  <=  c_aHS[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHP (Array SortaHA (Maybe SortaHB)))
; (declare-const aHQ (Array SortaHA (Maybe SortaHB)))
; (declare-const aHS (Array SortaHA (Maybe SortaHB)))
(declare-const
   aHP
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHQ
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHS
   (Array
      SortaHA
      (Maybe SortaHB)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1945923586026792211)
                 aHP
                 (
                   (_ map either1945923586026792211)
                   aHQ
                   aHS))
               aHI))
         (not
            (=
               (
                 (_ map either1945923586026792211)
                 (
                   (_ map either1945923586026792211)
                   aHP
                   aHQ)
                 aHS)
               aHG)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (declare-fun
;      SortaHA!val!0
;      ()
;      SortaHA)
;   (declare-fun
;      SortaHA!val!1
;      ()
;      SortaHA)
;   (forall
;      (
;        (x SortaHA))
;      (or
;         (= x SortaHA!val!0)
;         (= x SortaHA!val!1)))
;   (declare-fun
;      SortaHB!val!3
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!0
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!4
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!2
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!1
;      ()
;      SortaHB)
;   (forall
;      (
;        (x SortaHB))
;      (or
;         (= x SortaHB!val!3)
;         (= x SortaHB!val!0)
;         (= x SortaHB!val!4)
;         (= x SortaHB!val!2)
;         (= x SortaHB!val!1)))
;   (define-fun
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHD
;           aHF)
;         aHH))
;   (define-fun
;      aHD
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            nothing)
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHH
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            (just SortaHB!val!1))
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHQ
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (
;        (as
;           const
;           (Array
;              SortaHA
;              (Maybe SortaHB)))
;        nothing))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHC
;           aHH)
;         aHI))
;   (define-fun
;      aHI
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            (just SortaHB!val!1))
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHE
;           aHF)
;         aHG))
;   (define-fun
;      aHF
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHA
;                 (Maybe SortaHB)))
;           nothing)
;         SortaHA!val!1
;         (just SortaHB!val!1)))
;   (define-fun
;      aHG
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            (just SortaHB!val!1))
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHC
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (
;        (as
;           const
;           (Array
;              SortaHA
;              (Maybe SortaHB)))
;        nothing))
;   (define-fun
;      aHE
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            nothing)
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHP
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (
;        (as
;           const
;           (Array
;              SortaHA
;              (Maybe SortaHB)))
;        nothing))
;   (define-fun
;      aHS
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHA
;                 (Maybe SortaHB)))
;           (just SortaHB!val!0))
;         SortaHA!val!1
;         (just SortaHB!val!2)))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHC
;           aHD)
;         aHE))
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
;                      (_ map either1945923586026792211)
;                      aHP
;                      (
;                        (_ map either1945923586026792211)
;                        aHQ
;                        aHS))
;                    aHI)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1945923586026792211)
;                      (
;                        (_ map either1945923586026792211)
;                        aHP
;                        aHQ)
;                      aHS)
;                    aHG))))
;         (or a!1 a!2)))
;   (define-fun
;      k!52
;      (
;        (x!0 SortaHA))
;      (Maybe SortaHB)
;      (ite
;         (= x!0 SortaHA!val!1)
;         (just SortaHB!val!2)
;         (just SortaHB!val!0)))
;   (define-fun
;      k!45
;      (
;        (x!0 SortaHA))
;      (Maybe SortaHB)
;      (ite
;         (= x!0 SortaHA!val!1)
;         (just SortaHB!val!1)
;         (ite
;            (= x!0 SortaHA!val!0)
;            (just SortaHB!val!3)
;            (just SortaHB!val!4))))
;   (define-fun
;      either1945923586026792211
;      (
;        (x!0
;           (Maybe SortaHB))
;        (x!1
;           (Maybe SortaHB)))
;      (Maybe SortaHB)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaHB!val!4))
;            (= x!1 nothing))
;         (just SortaHB!val!4)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaHB!val!4)))
;            (just SortaHB!val!4)
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
;                        (just SortaHB!val!0)))
;                  (just SortaHB!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaHB!val!3)))
;                     (just SortaHB!val!3)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaHB!val!2)))
;                        (just SortaHB!val!2)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaHB!val!1)))
;                           (just SortaHB!val!1)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaHB!val!3))
;                                 (= x!1 nothing))
;                              (just SortaHB!val!3)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1)))))))))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_aI9 {1}:: UnionL b_aHD[sk:1] c_aHF[sk:1]
;                  ~# bc_aHH[sk:1] (CEqCan)
; [G] co_aI6 {1}:: UnionL ab_aHE[sk:1] c_aHF[sk:1]
;                  ~# abc_aHG[sk:1] (CEqCan)
; [G] co_aI3 {1}:: UnionL a_aHC[sk:1] b_aHD[sk:1]
;                  ~# ab_aHE[sk:1] (CEqCan)
; [G] co_aIc {1}:: UnionL a_aHC[sk:1] bc_aHH[sk:1]
;                  ~# abc'_aHI[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIj} {2}:: UnionL
;                           a_aHP[tau:1] (UnionL b_aHQ[tau:1] c_aHS[tau:1])
;                         ~# abc'_aHI[sk:1] (CNonCanonical)
; [WD] hole{co_aIg} {2}:: UnionL
;                           (UnionL a_aHP[tau:1] b_aHQ[tau:1]) c_aHS[tau:1]
;                         ~# abc_aHG[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aHA,aHB,aHD,aHF],aHH)
; (UnionL [aHA,aHB,aHE,aHF],aHG)
; (UnionL [aHA,aHB,aHC,aHD],aHE)
; (UnionL [aHA,aHB,aHC,aHH],aHI)

; WANTEDS (Thoralf style)
; (UnionL [aHA,aHB,aHP,UnionL [aHA,aHB,aHQ,aHS]],aHI)
; (UnionL [aHA,aHB,UnionL [aHA,aHB,aHP,aHQ],aHS],aHG)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aIj} {2}:: UnionL
;                                a_aHP[tau:1] (UnionL b_aHQ[tau:1] c_aHS[tau:1])
;                              ~# abc'_aHI[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      aHP
;      (
;        (_ map either1945923586026792211)
;        aHQ
;        aHS))
;    aHI)

;      [WD] hole{co_aIg} {2}:: UnionL
;                                (UnionL a_aHP[tau:1] b_aHQ[tau:1]) c_aHS[tau:1]
;                              ~# abc_aHG[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      (
;        (_ map either1945923586026792211)
;        aHP
;        aHQ)
;      aHS)
;    aHG)

; GIVENS (names)
;  aHC  <=  a_aHC[sk:1]
;  aHD  <=  b_aHD[sk:1]
;  aHE  <=  ab_aHE[sk:1]
;  aHF  <=  c_aHF[sk:1]
;  aHG  <=  abc_aHG[sk:1]
;  aHH  <=  bc_aHH[sk:1]
;  aHI  <=  abc'_aHI[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaHB)) (y (Maybe SortaHB))) (=> ((_ is (just (SortaHB) (Maybe SortaHB))) x) (= (either1945923586026792211 x y) x))))
; (assert (forall ((y (Maybe SortaHB))) (= (either1945923586026792211 (as nothing (Maybe SortaHB)) y) y)))
; (declare-const aHC (Array SortaHA (Maybe SortaHB)))
; (declare-const aHD (Array SortaHA (Maybe SortaHB)))
; (declare-const aHE (Array SortaHA (Maybe SortaHB)))
; (declare-const aHF (Array SortaHA (Maybe SortaHB)))
; (declare-const aHG (Array SortaHA (Maybe SortaHB)))
; (declare-const aHH (Array SortaHA (Maybe SortaHB)))
; (declare-const aHI (Array SortaHA (Maybe SortaHB)))
; (declare-fun either1945923586026792211 ((Maybe SortaHB) (Maybe SortaHB)) (Maybe SortaHB))
; (declare-sort SortaHA)
; (declare-sort SortaHB)
(declare-sort SortaHA)
(declare-sort SortaHB)
(declare-const
   aHC
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHD
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHE
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHF
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHG
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHH
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHI
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-fun
   either1945923586026792211
   (
     (Maybe SortaHB)
     (Maybe SortaHB))
   (Maybe SortaHB))
(assert
   (forall
      (
        (y
           (Maybe SortaHB)))
      (=
         (either1945923586026792211
            (as
               nothing
               (Maybe SortaHB))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaHB))
        (y
           (Maybe SortaHB)))
      (=>
         (
           (_
              is
              (just
                 (SortaHB)
                 (Maybe SortaHB)))
           x)
         (=
            (either1945923586026792211 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHD
           aHF)
         aHH)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHE
           aHF)
         aHG)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHC
           aHD)
         aHE)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map either1945923586026792211)
           aHC
           aHH)
         aHI)
      :named
      given-4.4))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aIj} {2}:: UnionL
;                                a_aHP[tau:1] (UnionL b_aHQ[tau:1] c_aHS[tau:1])
;                              ~# abc'_aHI[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      aHP
;      (
;        (_ map either1945923586026792211)
;        aHQ
;        aHS))
;    aHI)

;      [WD] hole{co_aIg} {2}:: UnionL
;                                (UnionL a_aHP[tau:1] b_aHQ[tau:1]) c_aHS[tau:1]
;                              ~# abc_aHG[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945923586026792211)
;      (
;        (_ map either1945923586026792211)
;        aHP
;        aHQ)
;      aHS)
;    aHG)

; WANTEDS (names)
;  aHG  <=  abc_aHG[sk:1]
;  aHI  <=  abc'_aHI[sk:1]
;  aHP  <=  a_aHP[tau:1]
;  aHQ  <=  b_aHQ[tau:1]
;  aHS  <=  c_aHS[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHP (Array SortaHA (Maybe SortaHB)))
; (declare-const aHQ (Array SortaHA (Maybe SortaHB)))
; (declare-const aHS (Array SortaHA (Maybe SortaHB)))
(declare-const
   aHP
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHQ
   (Array
      SortaHA
      (Maybe SortaHB)))
(declare-const
   aHS
   (Array
      SortaHA
      (Maybe SortaHB)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1945923586026792211)
                 aHP
                 (
                   (_ map either1945923586026792211)
                   aHQ
                   aHS))
               aHI))
         (not
            (=
               (
                 (_ map either1945923586026792211)
                 (
                   (_ map either1945923586026792211)
                   aHP
                   aHQ)
                 aHS)
               aHG)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (declare-fun
;      SortaHA!val!0
;      ()
;      SortaHA)
;   (declare-fun
;      SortaHA!val!1
;      ()
;      SortaHA)
;   (forall
;      (
;        (x SortaHA))
;      (or
;         (= x SortaHA!val!0)
;         (= x SortaHA!val!1)))
;   (declare-fun
;      SortaHB!val!3
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!0
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!4
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!2
;      ()
;      SortaHB)
;   (declare-fun
;      SortaHB!val!1
;      ()
;      SortaHB)
;   (forall
;      (
;        (x SortaHB))
;      (or
;         (= x SortaHB!val!3)
;         (= x SortaHB!val!0)
;         (= x SortaHB!val!4)
;         (= x SortaHB!val!2)
;         (= x SortaHB!val!1)))
;   (define-fun
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHD
;           aHF)
;         aHH))
;   (define-fun
;      aHD
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            nothing)
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHH
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            (just SortaHB!val!1))
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHQ
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (
;        (as
;           const
;           (Array
;              SortaHA
;              (Maybe SortaHB)))
;        nothing))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHC
;           aHH)
;         aHI))
;   (define-fun
;      aHI
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            (just SortaHB!val!1))
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHE
;           aHF)
;         aHG))
;   (define-fun
;      aHF
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHA
;                 (Maybe SortaHB)))
;           nothing)
;         SortaHA!val!1
;         (just SortaHB!val!1)))
;   (define-fun
;      aHG
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            (just SortaHB!val!1))
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHC
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (
;        (as
;           const
;           (Array
;              SortaHA
;              (Maybe SortaHB)))
;        nothing))
;   (define-fun
;      aHE
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    SortaHA
;                    (Maybe SortaHB)))
;              (just SortaHB!val!4))
;            SortaHA!val!1
;            nothing)
;         SortaHA!val!0
;         (just SortaHB!val!3)))
;   (define-fun
;      aHP
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (
;        (as
;           const
;           (Array
;              SortaHA
;              (Maybe SortaHB)))
;        nothing))
;   (define-fun
;      aHS
;      ()
;      (Array
;         SortaHA
;         (Maybe SortaHB))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHA
;                 (Maybe SortaHB)))
;           (just SortaHB!val!0))
;         SortaHA!val!1
;         (just SortaHB!val!2)))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945923586026792211)
;           aHC
;           aHD)
;         aHE))
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
;                      (_ map either1945923586026792211)
;                      aHP
;                      (
;                        (_ map either1945923586026792211)
;                        aHQ
;                        aHS))
;                    aHI)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1945923586026792211)
;                      (
;                        (_ map either1945923586026792211)
;                        aHP
;                        aHQ)
;                      aHS)
;                    aHG))))
;         (or a!1 a!2)))
;   (define-fun
;      k!52
;      (
;        (x!0 SortaHA))
;      (Maybe SortaHB)
;      (ite
;         (= x!0 SortaHA!val!1)
;         (just SortaHB!val!2)
;         (just SortaHB!val!0)))
;   (define-fun
;      k!45
;      (
;        (x!0 SortaHA))
;      (Maybe SortaHB)
;      (ite
;         (= x!0 SortaHA!val!1)
;         (just SortaHB!val!1)
;         (ite
;            (= x!0 SortaHA!val!0)
;            (just SortaHB!val!3)
;            (just SortaHB!val!4))))
;   (define-fun
;      either1945923586026792211
;      (
;        (x!0
;           (Maybe SortaHB))
;        (x!1
;           (Maybe SortaHB)))
;      (Maybe SortaHB)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaHB!val!4))
;            (= x!1 nothing))
;         (just SortaHB!val!4)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaHB!val!4)))
;            (just SortaHB!val!4)
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
;                        (just SortaHB!val!0)))
;                  (just SortaHB!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaHB!val!3)))
;                     (just SortaHB!val!3)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaHB!val!2)))
;                        (just SortaHB!val!2)
;                        (ite
;                           (and
;                              (= x!0 nothing)
;                              (=
;                                 x!1
;                                 (just SortaHB!val!1)))
;                           (just SortaHB!val!1)
;                           (ite
;                              (and
;                                 (=
;                                    x!0
;                                    (just SortaHB!val!3))
;                                 (= x!1 nothing))
;                              (just SortaHB!val!3)
;                              (ite
;                                 (
;                                   (_ is just)
;                                   x!0)
;                                 x!0
;                                 x!1)))))))))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aIR {2}:: Alter m1_aID[sk:1] "ok" 2 ~# m2_aIE[sk:1] (CEqCan)
; [G] co_aIV {2}:: Alter m2_aIE[sk:1] "ok" 2 ~# m3_aIF[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIZ} {3}:: Alter m1_aII[tau:1] "ok" 2
;                         ~# m2_aIE[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Natural [],aID,"ok",2],aIE)
; (Alter [Symbol [],Natural [],aIE,"ok",2],aIF)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Natural [],aII,"ok",2],aIE)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aIZ} {3}:: Alter m1_aII[tau:1] "ok" 2
;                              ~# m2_aIE[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aII
;       "ok"
;       (just 2))
;    aIE)

; GIVENS (names)
;  aID  <=  m1_aID[sk:1]
;  aIE  <=  m2_aIE[sk:1]
;  aIF  <=  m3_aIF[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aID (Array String (Maybe Int)))
; (declare-const aIE (Array String (Maybe Int)))
; (declare-const aIF (Array String (Maybe Int)))
(declare-const
   aID
   (Array
      String
      (Maybe Int)))
(declare-const
   aIE
   (Array
      String
      (Maybe Int)))
(declare-const
   aIF
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aID
            "ok"
            (just 2))
         aIE)
      :named
      given-6.1))
(assert
   (!
      (=
         (store
            aIE
            "ok"
            (just 2))
         aIF)
      :named
      given-6.2))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aIZ} {3}:: Alter m1_aII[tau:1] "ok" 2
;                              ~# m2_aIE[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aII
;       "ok"
;       (just 2))
;    aIE)

; WANTEDS (names)
;  aIE  <=  m2_aIE[sk:1]
;  aII  <=  m1_aII[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aII (Array String (Maybe Int)))
(declare-const
   aII
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aII
               "ok"
               (just 2))
            aIE))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (define-fun
;      wanted-6
;      ()
;      Bool
;      (not
;         (=
;            (store
;               aII
;               "ok"
;               (just 2))
;            aIE)))
;   (define-fun
;      aII
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
;         (just 3)))
;   (define-fun
;      aIF
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
;            nothing)
;         "ok"
;         (just 2)))
;   (define-fun
;      aID
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
;         nothing))
;   (define-fun
;      aIE
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
;            nothing)
;         "ok"
;         (just 2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (store
;            aIE
;            "ok"
;            (just 2))
;         aIF))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (store
;            aID
;            "ok"
;            (just 2))
;         aIE)))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aIR {2}:: Alter m1_aID[sk:1] "ok" 2 ~# m2_aIE[sk:1] (CEqCan)
; [G] co_aIV {2}:: Alter m2_aIE[sk:1] "ok" 2 ~# m3_aIF[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIZ} {3}:: Alter m1_aII[tau:1] "ok" 2
;                         ~# m2_aIE[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Natural [],aID,"ok",2],aIE)
; (Alter [Symbol [],Natural [],aIE,"ok",2],aIF)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Natural [],aII,"ok",2],aIE)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aIZ} {3}:: Alter m1_aII[tau:1] "ok" 2
;                              ~# m2_aIE[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aII
;       "ok"
;       (just 2))
;    aIE)

; GIVENS (names)
;  aID  <=  m1_aID[sk:1]
;  aIE  <=  m2_aIE[sk:1]
;  aIF  <=  m3_aIF[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aID (Array String (Maybe Int)))
; (declare-const aIE (Array String (Maybe Int)))
; (declare-const aIF (Array String (Maybe Int)))
(declare-const
   aID
   (Array
      String
      (Maybe Int)))
(declare-const
   aIE
   (Array
      String
      (Maybe Int)))
(declare-const
   aIF
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aID
            "ok"
            (just 2))
         aIE)
      :named
      given-6.1))
(assert
   (!
      (=
         (store
            aIE
            "ok"
            (just 2))
         aIF)
      :named
      given-6.2))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aIZ} {3}:: Alter m1_aII[tau:1] "ok" 2
;                              ~# m2_aIE[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aII
;       "ok"
;       (just 2))
;    aIE)

; WANTEDS (names)
;  aIE  <=  m2_aIE[sk:1]
;  aII  <=  m1_aII[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aII (Array String (Maybe Int)))
(declare-const
   aII
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aII
               "ok"
               (just 2))
            aIE))
      :named
      wanted-6))
(check-sat)
; sat
(echo "wanteds-finish-cycle-6")
(get-model)
; (
;   (define-fun
;      wanted-6
;      ()
;      Bool
;      (not
;         (=
;            (store
;               aII
;               "ok"
;               (just 2))
;            aIE)))
;   (define-fun
;      aII
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
;         (just 3)))
;   (define-fun
;      aIF
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
;            nothing)
;         "ok"
;         (just 2)))
;   (define-fun
;      aID
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
;         nothing))
;   (define-fun
;      aIE
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
;            nothing)
;         "ok"
;         (just 2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (store
;            aIE
;            "ok"
;            (just 2))
;         aIF))
;   (define-fun
;      given-6.1
;      ()
;      Bool
;      (=
;         (store
;            aID
;            "ok"
;            (just 2))
;         aIE)))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aJy {2}:: Delete m1_aJj[sk:1] "bob" ~# m2_aJk[sk:1] (CEqCan)
; [G] co_aJC {2}:: Delete m2_aJk[sk:1] "bob" ~# m3_aJl[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJG} {3}:: Delete m1_aJp[tau:1] "bob"
;                         ~# m2_aJk[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aJi,aJj,"bob"],aJk)
; (Delete [Symbol [],aJi,aJk,"bob"],aJl)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aJi,aJp,"bob"],aJk)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aJG} {3}:: Delete m1_aJp[tau:1] "bob"
;                              ~# m2_aJk[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJp
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJi)))
;    aJk)

; GIVENS (names)
;  aJj  <=  m1_aJj[sk:1]
;  aJk  <=  m2_aJk[sk:1]
;  aJl  <=  m3_aJl[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aJj (Array String (Maybe SortaJi)))
; (declare-const aJk (Array String (Maybe SortaJi)))
; (declare-const aJl (Array String (Maybe SortaJi)))
; (declare-sort SortaJi)
(declare-sort SortaJi)
(declare-const
   aJj
   (Array
      String
      (Maybe SortaJi)))
(declare-const
   aJk
   (Array
      String
      (Maybe SortaJi)))
(declare-const
   aJl
   (Array
      String
      (Maybe SortaJi)))
(assert
   (!
      (=
         (store
            aJj
            "bob"
            (as
               nothing
               (Maybe SortaJi)))
         aJk)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aJk
            "bob"
            (as
               nothing
               (Maybe SortaJi)))
         aJl)
      :named
      given-8.2))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aJG} {3}:: Delete m1_aJp[tau:1] "bob"
;                              ~# m2_aJk[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJp
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJi)))
;    aJk)

; WANTEDS (names)
;  aJk  <=  m2_aJk[sk:1]
;  aJp  <=  m1_aJp[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aJp (Array String (Maybe SortaJi)))
(declare-const
   aJp
   (Array
      String
      (Maybe SortaJi)))
(assert
   (!
      (not
         (=
            (store
               aJp
               "bob"
               (as
                  nothing
                  (Maybe SortaJi)))
            aJk))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (declare-fun
;      SortaJi!val!1
;      ()
;      SortaJi)
;   (declare-fun
;      SortaJi!val!0
;      ()
;      SortaJi)
;   (declare-fun
;      SortaJi!val!2
;      ()
;      SortaJi)
;   (forall
;      (
;        (x SortaJi))
;      (or
;         (= x SortaJi!val!1)
;         (= x SortaJi!val!0)
;         (= x SortaJi!val!2)))
;   (define-fun
;      aJl
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJi)))
;              (just SortaJi!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aJk
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJi)))
;              (just SortaJi!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aJj
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJi)))
;           (just SortaJi!val!1))
;         "b"
;         nothing))
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store aJp "bob" nothing)
;            aJk)))
;   (define-fun
;      aJp
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJi)))
;           (just SortaJi!val!2))
;         "b"
;         (just SortaJi!val!0)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (store aJj "bob" nothing)
;         aJk))
;   (define-fun
;      given-8.2
;      ()
;      Bool
;      (=
;         (store aJk "bob" nothing)
;         aJl)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aJy {2}:: Delete m1_aJj[sk:1] "bob" ~# m2_aJk[sk:1] (CEqCan)
; [G] co_aJC {2}:: Delete m2_aJk[sk:1] "bob" ~# m3_aJl[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJG} {3}:: Delete m1_aJp[tau:1] "bob"
;                         ~# m2_aJk[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aJi,aJj,"bob"],aJk)
; (Delete [Symbol [],aJi,aJk,"bob"],aJl)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aJi,aJp,"bob"],aJk)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aJG} {3}:: Delete m1_aJp[tau:1] "bob"
;                              ~# m2_aJk[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJp
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJi)))
;    aJk)

; GIVENS (names)
;  aJj  <=  m1_aJj[sk:1]
;  aJk  <=  m2_aJk[sk:1]
;  aJl  <=  m3_aJl[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aJj (Array String (Maybe SortaJi)))
; (declare-const aJk (Array String (Maybe SortaJi)))
; (declare-const aJl (Array String (Maybe SortaJi)))
; (declare-sort SortaJi)
(declare-sort SortaJi)
(declare-const
   aJj
   (Array
      String
      (Maybe SortaJi)))
(declare-const
   aJk
   (Array
      String
      (Maybe SortaJi)))
(declare-const
   aJl
   (Array
      String
      (Maybe SortaJi)))
(assert
   (!
      (=
         (store
            aJj
            "bob"
            (as
               nothing
               (Maybe SortaJi)))
         aJk)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aJk
            "bob"
            (as
               nothing
               (Maybe SortaJi)))
         aJl)
      :named
      given-8.2))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aJG} {3}:: Delete m1_aJp[tau:1] "bob"
;                              ~# m2_aJk[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJp
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJi)))
;    aJk)

; WANTEDS (names)
;  aJk  <=  m2_aJk[sk:1]
;  aJp  <=  m1_aJp[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aJp (Array String (Maybe SortaJi)))
(declare-const
   aJp
   (Array
      String
      (Maybe SortaJi)))
(assert
   (!
      (not
         (=
            (store
               aJp
               "bob"
               (as
                  nothing
                  (Maybe SortaJi)))
            aJk))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (declare-fun
;      SortaJi!val!1
;      ()
;      SortaJi)
;   (declare-fun
;      SortaJi!val!0
;      ()
;      SortaJi)
;   (declare-fun
;      SortaJi!val!2
;      ()
;      SortaJi)
;   (forall
;      (
;        (x SortaJi))
;      (or
;         (= x SortaJi!val!1)
;         (= x SortaJi!val!0)
;         (= x SortaJi!val!2)))
;   (define-fun
;      aJl
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJi)))
;              (just SortaJi!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aJk
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJi)))
;              (just SortaJi!val!1))
;            "bob"
;            nothing)
;         "b"
;         nothing))
;   (define-fun
;      aJj
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJi)))
;           (just SortaJi!val!1))
;         "b"
;         nothing))
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store aJp "bob" nothing)
;            aJk)))
;   (define-fun
;      aJp
;      ()
;      (Array
;         String
;         (Maybe SortaJi))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJi)))
;           (just SortaJi!val!2))
;         "b"
;         (just SortaJi!val!0)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (store aJj "bob" nothing)
;         aJk))
;   (define-fun
;      given-8.2
;      ()
;      Bool
;      (=
;         (store aJk "bob" nothing)
;         aJl)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aL3} {1}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                         ~# Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Natural [],Symbol [],Alter [Natural [],Symbol [],Nil [Natural [],Symbol []],1,"ok"],2,"hi"],Alter [Natural [],Symbol [],Alter [Natural [],Symbol [],Nil [Natural [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_aL3} {1}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                              ~# Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
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
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_aL3} {1}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                              ~# Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)
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
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
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
;      wanted-9))
(get-unsat-core)
; (wanted-9)
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] co_aLb {1}:: IntersectL b_aJY[sk:1] c_aK0[sk:1]
;                  ~# bc_aK2[sk:1] (CEqCan)
; [G] co_aL8 {1}:: IntersectL ab_aJZ[sk:1] c_aK0[sk:1]
;                  ~# abc_aK1[sk:1] (CEqCan)
; [G] co_aL5 {1}:: IntersectL a_aJX[sk:1] b_aJY[sk:1]
;                  ~# ab_aJZ[sk:1] (CEqCan)
; [G] co_aLe {1}:: IntersectL a_aJX[sk:1] bc_aK2[sk:1]
;                  ~# abc'_aK3[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKa} {0}:: abc_aK1[sk:1]
;                         ~# abc'_aK3[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aJV,aJW,aJY,aK0],aK2)
; (IntersectL [aJV,aJW,aJZ,aK0],aK1)
; (IntersectL [aJV,aJW,aJX,aJY],aJZ)
; (IntersectL [aJV,aJW,aJX,aK2],aK3)

; WANTEDS (Thoralf style)
; (aK1,aK3)

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_aKa} {0}:: abc_aK1[sk:1]
;                              ~# abc'_aK3[sk:1] (CNonCanonical)
;  =>  (= aK1 aK3)

; GIVENS (names)
;  aJX  <=  a_aJX[sk:1]
;  aJY  <=  b_aJY[sk:1]
;  aJZ  <=  ab_aJZ[sk:1]
;  aK0  <=  c_aK0[sk:1]
;  aK1  <=  abc_aK1[sk:1]
;  aK2  <=  bc_aK2[sk:1]
;  aK3  <=  abc'_aK3[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaJW)) (y (Maybe SortaJW))) (=> (and ((_ is (just (SortaJW) (Maybe SortaJW))) x) ((_ is (just (SortaJW) (Maybe SortaJW))) y)) (= (both1944002739212686042 x y) x))))
; (assert (forall ((y (Maybe SortaJW))) (= (both1944002739212686042 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaJW))) (= (both1944002739212686042 y (as nothing (Maybe SortaJW))) (as nothing (Maybe SortaJW)))))
; (declare-const aJX (Array SortaJV (Maybe SortaJW)))
; (declare-const aJY (Array SortaJV (Maybe SortaJW)))
; (declare-const aJZ (Array SortaJV (Maybe SortaJW)))
; (declare-const aK0 (Array SortaJV (Maybe SortaJW)))
; (declare-const aK1 (Array SortaJV (Maybe SortaJW)))
; (declare-const aK2 (Array SortaJV (Maybe SortaJW)))
; (declare-const aK3 (Array SortaJV (Maybe SortaJW)))
; (declare-fun both1944002739212686042 ((Maybe SortaJW) (Maybe SortaJW)) (Maybe SortaJW))
; (declare-sort SortaJV)
; (declare-sort SortaJW)
(declare-sort SortaJV)
(declare-sort SortaJW)
(declare-const
   aJX
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-const
   aJY
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-const
   aJZ
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-const
   aK0
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-const
   aK1
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-const
   aK2
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-const
   aK3
   (Array
      SortaJV
      (Maybe SortaJW)))
(declare-fun
   both1944002739212686042
   (
     (Maybe SortaJW)
     (Maybe SortaJW))
   (Maybe SortaJW))
(assert
   (forall
      (
        (y
           (Maybe SortaJW)))
      (=
         (both1944002739212686042
            y
            (as
               nothing
               (Maybe SortaJW)))
         (as
            nothing
            (Maybe SortaJW)))))
(assert
   (forall
      (
        (y
           (Maybe SortaJW)))
      (=
         (both1944002739212686042 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaJW))
        (y
           (Maybe SortaJW)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaJW)
                    (Maybe SortaJW)))
              x)
            (
              (_
                 is
                 (just
                    (SortaJW)
                    (Maybe SortaJW)))
              y))
         (=
            (both1944002739212686042 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1944002739212686042)
           aJY
           aK0)
         aK2)
      :named
      given-11.1))
(assert
   (!
      (=
         (
           (_ map both1944002739212686042)
           aJZ
           aK0)
         aK1)
      :named
      given-11.2))
(assert
   (!
      (=
         (
           (_ map both1944002739212686042)
           aJX
           aJY)
         aJZ)
      :named
      given-11.3))
(assert
   (!
      (=
         (
           (_ map both1944002739212686042)
           aJX
           aK2)
         aK3)
      :named
      given-11.4))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_aKa} {0}:: abc_aK1[sk:1]
;                              ~# abc'_aK3[sk:1] (CNonCanonical)
;  =>  (= aK1 aK3)

; WANTEDS (names)
;  aK1  <=  abc_aK1[sk:1]
;  aK3  <=  abc'_aK3[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aK1 aK3))
      :named
      wanted-11))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-11")
(get-assertions)
; (
;   (forall
;      (
;        (y
;           (Maybe SortaJW)))
;      (=
;         (both1944002739212686042
;            y
;            (as
;               nothing
;               (Maybe SortaJW)))
;         (as
;            nothing
;            (Maybe SortaJW))))
;   (forall
;      (
;        (y
;           (Maybe SortaJW)))
;      (=
;         (both1944002739212686042 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe SortaJW))
;        (y
;           (Maybe SortaJW)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (SortaJW)
;                    (Maybe SortaJW)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (SortaJW)
;                    (Maybe SortaJW)))
;              y))
;         (=
;            (both1944002739212686042 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both1944002739212686042)
;           aJY
;           aK0)
;         aK2)
;      :named
;      given-11.1)
;   (!
;      (=
;         (
;           (_ map both1944002739212686042)
;           aJZ
;           aK0)
;         aK1)
;      :named
;      given-11.2)
;   (!
;      (=
;         (
;           (_ map both1944002739212686042)
;           aJX
;           aJY)
;         aJZ)
;      :named
;      given-11.3)
;   (!
;      (=
;         (
;           (_ map both1944002739212686042)
;           aJX
;           aK2)
;         aK3)
;      :named
;      given-11.4)
;   (!
;      (not
;         (= aK1 aK3))
;      :named
;      wanted-11))
(get-unsat-core)
; (given-11.3 given-11.2 given-11.1 given-11.4 wanted-11)
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
; [G] co_aLn {1}:: UnionL b_aKg[sk:1] c_aKi[sk:1]
;                  ~# bc_aKk[sk:1] (CEqCan)
; [G] co_aLk {1}:: UnionL ab_aKh[sk:1] c_aKi[sk:1]
;                  ~# abc_aKj[sk:1] (CEqCan)
; [G] co_aLh {1}:: UnionL a_aKf[sk:1] b_aKg[sk:1]
;                  ~# ab_aKh[sk:1] (CEqCan)
; [G] co_aLq {1}:: UnionL a_aKf[sk:1] bc_aKk[sk:1]
;                  ~# abc'_aKl[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKs} {0}:: abc_aKj[sk:1]
;                         ~# abc'_aKl[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aKd,aKe,aKg,aKi],aKk)
; (UnionL [aKd,aKe,aKh,aKi],aKj)
; (UnionL [aKd,aKe,aKf,aKg],aKh)
; (UnionL [aKd,aKe,aKf,aKk],aKl)

; WANTEDS (Thoralf style)
; (aKj,aKl)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_aKs} {0}:: abc_aKj[sk:1]
;                              ~# abc'_aKl[sk:1] (CNonCanonical)
;  =>  (= aKj aKl)

; GIVENS (names)
;  aKf  <=  a_aKf[sk:1]
;  aKg  <=  b_aKg[sk:1]
;  aKh  <=  ab_aKh[sk:1]
;  aKi  <=  c_aKi[sk:1]
;  aKj  <=  abc_aKj[sk:1]
;  aKk  <=  bc_aKk[sk:1]
;  aKl  <=  abc'_aKl[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaKe)) (y (Maybe SortaKe))) (=> ((_ is (just (SortaKe) (Maybe SortaKe))) x) (= (either1945078061584887181 x y) x))))
; (assert (forall ((y (Maybe SortaKe))) (= (either1945078061584887181 (as nothing (Maybe SortaKe)) y) y)))
; (declare-const aKf (Array SortaKd (Maybe SortaKe)))
; (declare-const aKg (Array SortaKd (Maybe SortaKe)))
; (declare-const aKh (Array SortaKd (Maybe SortaKe)))
; (declare-const aKi (Array SortaKd (Maybe SortaKe)))
; (declare-const aKj (Array SortaKd (Maybe SortaKe)))
; (declare-const aKk (Array SortaKd (Maybe SortaKe)))
; (declare-const aKl (Array SortaKd (Maybe SortaKe)))
; (declare-fun either1945078061584887181 ((Maybe SortaKe) (Maybe SortaKe)) (Maybe SortaKe))
; (declare-sort SortaKd)
; (declare-sort SortaKe)
(declare-sort SortaKd)
(declare-sort SortaKe)
(declare-const
   aKf
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-const
   aKg
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-const
   aKh
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-const
   aKi
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-const
   aKj
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-const
   aKk
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-const
   aKl
   (Array
      SortaKd
      (Maybe SortaKe)))
(declare-fun
   either1945078061584887181
   (
     (Maybe SortaKe)
     (Maybe SortaKe))
   (Maybe SortaKe))
(assert
   (forall
      (
        (y
           (Maybe SortaKe)))
      (=
         (either1945078061584887181
            (as
               nothing
               (Maybe SortaKe))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaKe))
        (y
           (Maybe SortaKe)))
      (=>
         (
           (_
              is
              (just
                 (SortaKe)
                 (Maybe SortaKe)))
           x)
         (=
            (either1945078061584887181 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945078061584887181)
           aKg
           aKi)
         aKk)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map either1945078061584887181)
           aKh
           aKi)
         aKj)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map either1945078061584887181)
           aKf
           aKg)
         aKh)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map either1945078061584887181)
           aKf
           aKk)
         aKl)
      :named
      given-13.4))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_aKs} {0}:: abc_aKj[sk:1]
;                              ~# abc'_aKl[sk:1] (CNonCanonical)
;  =>  (= aKj aKl)

; WANTEDS (names)
;  aKj  <=  abc_aKj[sk:1]
;  aKl  <=  abc'_aKl[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aKj aKl))
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
;           (Maybe SortaKe)))
;      (=
;         (either1945078061584887181
;            (as
;               nothing
;               (Maybe SortaKe))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe SortaKe))
;        (y
;           (Maybe SortaKe)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (SortaKe)
;                 (Maybe SortaKe)))
;           x)
;         (=
;            (either1945078061584887181 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either1945078061584887181)
;           aKg
;           aKi)
;         aKk)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map either1945078061584887181)
;           aKh
;           aKi)
;         aKj)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map either1945078061584887181)
;           aKf
;           aKg)
;         aKh)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map either1945078061584887181)
;           aKf
;           aKk)
;         aKl)
;      :named
;      given-13.4)
;   (!
;      (not
;         (= aKj aKl))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.3 given-13.4 wanted-13 given-13.1 given-13.2)
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
; [G] co_aLu {2}:: Alter m1_aKv[sk:1] "ok" 2 ~# m2_aKw[sk:1] (CEqCan)
; [G] co_aLy {2}:: Alter m2_aKw[sk:1] "ok" 2 ~# m3_aKx[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKC} {0}:: m2_aKw[sk:1]
;                         ~# m3_aKx[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Natural [],aKv,"ok",2],aKw)
; (Alter [Symbol [],Natural [],aKw,"ok",2],aKx)

; WANTEDS (Thoralf style)
; (aKw,aKx)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_aKC} {0}:: m2_aKw[sk:1]
;                              ~# m3_aKx[sk:1] (CNonCanonical)
;  =>  (= aKw aKx)

; GIVENS (names)
;  aKv  <=  m1_aKv[sk:1]
;  aKw  <=  m2_aKw[sk:1]
;  aKx  <=  m3_aKx[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aKv (Array String (Maybe Int)))
; (declare-const aKw (Array String (Maybe Int)))
; (declare-const aKx (Array String (Maybe Int)))
(declare-const
   aKv
   (Array
      String
      (Maybe Int)))
(declare-const
   aKw
   (Array
      String
      (Maybe Int)))
(declare-const
   aKx
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            aKv
            "ok"
            (just 2))
         aKw)
      :named
      given-15.1))
(assert
   (!
      (=
         (store
            aKw
            "ok"
            (just 2))
         aKx)
      :named
      given-15.2))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_aKC} {0}:: m2_aKw[sk:1]
;                              ~# m3_aKx[sk:1] (CNonCanonical)
;  =>  (= aKw aKx)

; WANTEDS (names)
;  aKw  <=  m2_aKw[sk:1]
;  aKx  <=  m3_aKx[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aKw aKx))
      :named
      wanted-15))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-15")
(get-assertions)
; (
;   (!
;      (=
;         (store
;            aKv
;            "ok"
;            (just 2))
;         aKw)
;      :named
;      given-15.1)
;   (!
;      (=
;         (store
;            aKw
;            "ok"
;            (just 2))
;         aKx)
;      :named
;      given-15.2)
;   (!
;      (not
;         (= aKw aKx))
;      :named
;      wanted-15))
(get-unsat-core)
; (wanted-15 given-15.1 given-15.2)
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
; [G] co_aLC {2}:: Delete m1_aKG[sk:1] "bob" ~# m2_aKH[sk:1] (CEqCan)
; [G] co_aLG {2}:: Delete m2_aKH[sk:1] "bob" ~# m3_aKI[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKN} {0}:: m2_aKH[sk:1]
;                         ~# m3_aKI[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aKF,aKG,"bob"],aKH)
; (Delete [Symbol [],aKF,aKH,"bob"],aKI)

; WANTEDS (Thoralf style)
; (aKH,aKI)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_aKN} {0}:: m2_aKH[sk:1]
;                              ~# m3_aKI[sk:1] (CNonCanonical)
;  =>  (= aKH aKI)

; GIVENS (names)
;  aKG  <=  m1_aKG[sk:1]
;  aKH  <=  m2_aKH[sk:1]
;  aKI  <=  m3_aKI[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aKG (Array String (Maybe SortaKF)))
; (declare-const aKH (Array String (Maybe SortaKF)))
; (declare-const aKI (Array String (Maybe SortaKF)))
; (declare-sort SortaKF)
(declare-sort SortaKF)
(declare-const
   aKG
   (Array
      String
      (Maybe SortaKF)))
(declare-const
   aKH
   (Array
      String
      (Maybe SortaKF)))
(declare-const
   aKI
   (Array
      String
      (Maybe SortaKF)))
(assert
   (!
      (=
         (store
            aKG
            "bob"
            (as
               nothing
               (Maybe SortaKF)))
         aKH)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            aKH
            "bob"
            (as
               nothing
               (Maybe SortaKF)))
         aKI)
      :named
      given-17.2))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_aKN} {0}:: m2_aKH[sk:1]
;                              ~# m3_aKI[sk:1] (CNonCanonical)
;  =>  (= aKH aKI)

; WANTEDS (names)
;  aKH  <=  m2_aKH[sk:1]
;  aKI  <=  m3_aKI[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aKH aKI))
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
;            aKG
;            "bob"
;            (as
;               nothing
;               (Maybe SortaKF)))
;         aKH)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            aKH
;            "bob"
;            (as
;               nothing
;               (Maybe SortaKF)))
;         aKI)
;      :named
;      given-17.2)
;   (!
;      (not
;         (= aKH aKI))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.2 given-17.1 wanted-17)
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")
(echo "solver-finish-cycle-17")
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
; [WD] hole{co_a1yl} {0}:: (b_a1yi[tau:1] <? c_a1yj[tau:1])
;                          ~# (b_a1yf[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yk} {0}:: (a_a1yh[tau:1] <? b_a1yi[tau:1])
;                          ~# (a_a1ye[sk:1] <? b_a1yf[sk:1]) (CNonCanonical)
; [WD] hole{co_a1ym} {0}:: (a_a1yh[tau:1] <? c_a1yj[tau:1])
;                          ~# (a_a1ye[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a1yi,a1yj],<? [a1yf,a1yg])
; (<? [a1yh,a1yi],<? [a1ye,a1yf])
; (<? [a1yh,a1yj],<? [a1ye,a1yg])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1yl} {0}:: (b_a1yi[tau:1] <? c_a1yj[tau:1])
;                               ~# (b_a1yf[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yi a1yj)
;    (< a1yf a1yg))

;      [WD] hole{co_a1yk} {0}:: (a_a1yh[tau:1] <? b_a1yi[tau:1])
;                               ~# (a_a1ye[sk:1] <? b_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1ym} {0}:: (a_a1yh[tau:1] <? c_a1yj[tau:1])
;                               ~# (a_a1ye[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yj)
;    (< a1ye a1yg))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1yl} {0}:: (b_a1yi[tau:1] <? c_a1yj[tau:1])
;                               ~# (b_a1yf[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yi a1yj)
;    (< a1yf a1yg))

;      [WD] hole{co_a1yk} {0}:: (a_a1yh[tau:1] <? b_a1yi[tau:1])
;                               ~# (a_a1ye[sk:1] <? b_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1ym} {0}:: (a_a1yh[tau:1] <? c_a1yj[tau:1])
;                               ~# (a_a1ye[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yj)
;    (< a1ye a1yg))

; WANTEDS (names)
;  a1ye  <=  a_a1ye[sk:1]
;  a1yf  <=  b_a1yf[sk:1]
;  a1yg  <=  c_a1yg[sk:1]
;  a1yh  <=  a_a1yh[tau:1]
;  a1yi  <=  b_a1yi[tau:1]
;  a1yj  <=  c_a1yj[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1ye))
; (assert (<= 0 a1yf))
; (assert (<= 0 a1yg))
; (assert (<= 0 a1yh))
; (assert (<= 0 a1yi))
; (assert (<= 0 a1yj))
; (declare-const a1ye Int)
; (declare-const a1yf Int)
; (declare-const a1yg Int)
; (declare-const a1yh Int)
; (declare-const a1yi Int)
; (declare-const a1yj Int)
(declare-const a1ye Int)
(declare-const a1yf Int)
(declare-const a1yg Int)
(declare-const a1yh Int)
(declare-const a1yi Int)
(declare-const a1yj Int)
(assert
   (<= 0 a1ye))
(assert
   (<= 0 a1yf))
(assert
   (<= 0 a1yg))
(assert
   (<= 0 a1yh))
(assert
   (<= 0 a1yi))
(assert
   (<= 0 a1yj))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a1yi a1yj)
                  (< a1yf a1yg)))
            (not
               (=
                  (< a1yh a1yi)
                  (< a1ye a1yf))))
         (not
            (=
               (< a1yh a1yj)
               (< a1ye a1yg))))
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
;               (< a1yi a1yj)
;               (< a1yf a1yg)))
;         (not
;            (=
;               (< a1yh a1yi)
;               (< a1ye a1yf)))
;         (not
;            (=
;               (< a1yh a1yj)
;               (< a1ye a1yg)))))
;   (define-fun
;      a1yf
;      ()
;      Int
;      0)
;   (define-fun
;      a1yi
;      ()
;      Int
;      0)
;   (define-fun
;      a1yh
;      ()
;      Int
;      0)
;   (define-fun
;      a1yj
;      ()
;      Int
;      0)
;   (define-fun
;      a1ye
;      ()
;      Int
;      0)
;   (define-fun
;      a1yg
;      ()
;      Int
;      1))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1yl} {0}:: (b_a1yi[tau:1] <? c_a1yj[tau:1])
;                          ~# (b_a1yf[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yk} {0}:: (a_a1yh[tau:1] <? b_a1yi[tau:1])
;                          ~# (a_a1ye[sk:1] <? b_a1yf[sk:1]) (CNonCanonical)
; [WD] hole{co_a1ym} {0}:: (a_a1yh[tau:1] <? c_a1yj[tau:1])
;                          ~# (a_a1ye[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a1yi,a1yj],<? [a1yf,a1yg])
; (<? [a1yh,a1yi],<? [a1ye,a1yf])
; (<? [a1yh,a1yj],<? [a1ye,a1yg])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1yl} {0}:: (b_a1yi[tau:1] <? c_a1yj[tau:1])
;                               ~# (b_a1yf[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yi a1yj)
;    (< a1yf a1yg))

;      [WD] hole{co_a1yk} {0}:: (a_a1yh[tau:1] <? b_a1yi[tau:1])
;                               ~# (a_a1ye[sk:1] <? b_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1ym} {0}:: (a_a1yh[tau:1] <? c_a1yj[tau:1])
;                               ~# (a_a1ye[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yj)
;    (< a1ye a1yg))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1yl} {0}:: (b_a1yi[tau:1] <? c_a1yj[tau:1])
;                               ~# (b_a1yf[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yi a1yj)
;    (< a1yf a1yg))

;      [WD] hole{co_a1yk} {0}:: (a_a1yh[tau:1] <? b_a1yi[tau:1])
;                               ~# (a_a1ye[sk:1] <? b_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1ym} {0}:: (a_a1yh[tau:1] <? c_a1yj[tau:1])
;                               ~# (a_a1ye[sk:1] <? c_a1yg[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yj)
;    (< a1ye a1yg))

; WANTEDS (names)
;  a1ye  <=  a_a1ye[sk:1]
;  a1yf  <=  b_a1yf[sk:1]
;  a1yg  <=  c_a1yg[sk:1]
;  a1yh  <=  a_a1yh[tau:1]
;  a1yi  <=  b_a1yi[tau:1]
;  a1yj  <=  c_a1yj[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1ye))
; (assert (<= 0 a1yf))
; (assert (<= 0 a1yg))
; (assert (<= 0 a1yh))
; (assert (<= 0 a1yi))
; (assert (<= 0 a1yj))
; (declare-const a1ye Int)
; (declare-const a1yf Int)
; (declare-const a1yg Int)
; (declare-const a1yh Int)
; (declare-const a1yi Int)
; (declare-const a1yj Int)
(declare-const a1ye Int)
(declare-const a1yf Int)
(declare-const a1yg Int)
(declare-const a1yh Int)
(declare-const a1yi Int)
(declare-const a1yj Int)
(assert
   (<= 0 a1ye))
(assert
   (<= 0 a1yf))
(assert
   (<= 0 a1yg))
(assert
   (<= 0 a1yh))
(assert
   (<= 0 a1yi))
(assert
   (<= 0 a1yj))
(assert
   (!
      (or
         (or
            (not
               (=
                  (< a1yi a1yj)
                  (< a1yf a1yg)))
            (not
               (=
                  (< a1yh a1yi)
                  (< a1ye a1yf))))
         (not
            (=
               (< a1yh a1yj)
               (< a1ye a1yg))))
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
;               (< a1yi a1yj)
;               (< a1yf a1yg)))
;         (not
;            (=
;               (< a1yh a1yi)
;               (< a1ye a1yf)))
;         (not
;            (=
;               (< a1yh a1yj)
;               (< a1ye a1yg)))))
;   (define-fun
;      a1yf
;      ()
;      Int
;      0)
;   (define-fun
;      a1yi
;      ()
;      Int
;      0)
;   (define-fun
;      a1yh
;      ()
;      Int
;      0)
;   (define-fun
;      a1yj
;      ()
;      Int
;      0)
;   (define-fun
;      a1ye
;      ()
;      Int
;      0)
;   (define-fun
;      a1yg
;      ()
;      Int
;      1))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1yS} {0}:: (a_a1yQ[tau:1] + b_a1yR[tau:1])
;                          ~# (a_a1yO[sk:1] + b_a1yP[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yT} {0}:: (b_a1yR[tau:1] + a_a1yQ[tau:1])
;                          ~# (b_a1yP[sk:1] + a_a1yO[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1yQ,a1yR],+ [a1yO,a1yP])
; (+ [a1yR,a1yQ],+ [a1yP,a1yO])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1yS} {0}:: (a_a1yQ[tau:1] + b_a1yR[tau:1])
;                               ~# (a_a1yO[sk:1] + b_a1yP[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yR)
;    (+ a1yO a1yP))

;      [WD] hole{co_a1yT} {0}:: (b_a1yR[tau:1] + a_a1yQ[tau:1])
;                               ~# (b_a1yP[sk:1] + a_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yR a1yQ)
;    (+ a1yP a1yO))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1yS} {0}:: (a_a1yQ[tau:1] + b_a1yR[tau:1])
;                               ~# (a_a1yO[sk:1] + b_a1yP[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yR)
;    (+ a1yO a1yP))

;      [WD] hole{co_a1yT} {0}:: (b_a1yR[tau:1] + a_a1yQ[tau:1])
;                               ~# (b_a1yP[sk:1] + a_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yR a1yQ)
;    (+ a1yP a1yO))

; WANTEDS (names)
;  a1yO  <=  a_a1yO[sk:1]
;  a1yP  <=  b_a1yP[sk:1]
;  a1yQ  <=  a_a1yQ[tau:1]
;  a1yR  <=  b_a1yR[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1yO))
; (assert (<= 0 a1yP))
; (assert (<= 0 a1yQ))
; (assert (<= 0 a1yR))
; (declare-const a1yO Int)
; (declare-const a1yP Int)
; (declare-const a1yQ Int)
; (declare-const a1yR Int)
(declare-const a1yO Int)
(declare-const a1yP Int)
(declare-const a1yQ Int)
(declare-const a1yR Int)
(assert
   (<= 0 a1yO))
(assert
   (<= 0 a1yP))
(assert
   (<= 0 a1yQ))
(assert
   (<= 0 a1yR))
(assert
   (!
      (or
         (not
            (=
               (+ a1yQ a1yR)
               (+ a1yO a1yP)))
         (not
            (=
               (+ a1yR a1yQ)
               (+ a1yP a1yO))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a1yQ
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
;               (+ a1yQ a1yR)
;               (+ a1yO a1yP)))
;         (not
;            (=
;               (+ a1yR a1yQ)
;               (+ a1yP a1yO)))))
;   (define-fun
;      a1yO
;      ()
;      Int
;      0)
;   (define-fun
;      a1yP
;      ()
;      Int
;      0)
;   (define-fun
;      a1yR
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1yS} {0}:: (a_a1yQ[tau:1] + b_a1yR[tau:1])
;                          ~# (a_a1yO[sk:1] + b_a1yP[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yT} {0}:: (b_a1yR[tau:1] + a_a1yQ[tau:1])
;                          ~# (b_a1yP[sk:1] + a_a1yO[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1yQ,a1yR],+ [a1yO,a1yP])
; (+ [a1yR,a1yQ],+ [a1yP,a1yO])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1yS} {0}:: (a_a1yQ[tau:1] + b_a1yR[tau:1])
;                               ~# (a_a1yO[sk:1] + b_a1yP[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yR)
;    (+ a1yO a1yP))

;      [WD] hole{co_a1yT} {0}:: (b_a1yR[tau:1] + a_a1yQ[tau:1])
;                               ~# (b_a1yP[sk:1] + a_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yR a1yQ)
;    (+ a1yP a1yO))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1yS} {0}:: (a_a1yQ[tau:1] + b_a1yR[tau:1])
;                               ~# (a_a1yO[sk:1] + b_a1yP[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yR)
;    (+ a1yO a1yP))

;      [WD] hole{co_a1yT} {0}:: (b_a1yR[tau:1] + a_a1yQ[tau:1])
;                               ~# (b_a1yP[sk:1] + a_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yR a1yQ)
;    (+ a1yP a1yO))

; WANTEDS (names)
;  a1yO  <=  a_a1yO[sk:1]
;  a1yP  <=  b_a1yP[sk:1]
;  a1yQ  <=  a_a1yQ[tau:1]
;  a1yR  <=  b_a1yR[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1yO))
; (assert (<= 0 a1yP))
; (assert (<= 0 a1yQ))
; (assert (<= 0 a1yR))
; (declare-const a1yO Int)
; (declare-const a1yP Int)
; (declare-const a1yQ Int)
; (declare-const a1yR Int)
(declare-const a1yO Int)
(declare-const a1yP Int)
(declare-const a1yQ Int)
(declare-const a1yR Int)
(assert
   (<= 0 a1yO))
(assert
   (<= 0 a1yP))
(assert
   (<= 0 a1yQ))
(assert
   (<= 0 a1yR))
(assert
   (!
      (or
         (not
            (=
               (+ a1yQ a1yR)
               (+ a1yO a1yP)))
         (not
            (=
               (+ a1yR a1yQ)
               (+ a1yP a1yO))))
      :named
      wanted-3))
(check-sat)
; sat
(echo "wanteds-finish-cycle-3")
(get-model)
; (
;   (define-fun
;      a1yQ
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
;               (+ a1yQ a1yR)
;               (+ a1yO a1yP)))
;         (not
;            (=
;               (+ a1yR a1yQ)
;               (+ a1yP a1yO)))))
;   (define-fun
;      a1yO
;      ()
;      Int
;      0)
;   (define-fun
;      a1yP
;      ()
;      Int
;      0)
;   (define-fun
;      a1yR
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
; [G] co_a1FA {1}:: (1 + n_a1zs[ssk:2]) ~# n_a1zg[sk:1] (CEqCan)
; [G] co_a1FB {1}:: (1 + n_a1zu[ssk:3]) ~# m_a1zh[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1zC} {0}:: (n_a1zu[ssk:3] - n_a1zs[ssk:2])
;                          ~# (m_a1zh[sk:1] - n_a1zg[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a1zs],a1zg)
; (+ [1,a1zu],a1zh)

; WANTEDS (Thoralf style)
; (- [a1zu,a1zs],- [a1zh,a1zg])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a1zC} {0}:: (n_a1zu[ssk:3] - n_a1zs[ssk:2])
;                               ~# (m_a1zh[sk:1] - n_a1zg[sk:1]) (CNonCanonical)
;  =>  (=
;    (- a1zu a1zs)
;    (- a1zh a1zg))

; GIVENS (names)
;  a1zg  <=  n_a1zg[sk:1]
;  a1zh  <=  m_a1zh[sk:1]
;  a1zs  <=  n_a1zs[ssk:2]
;  a1zu  <=  n_a1zu[ssk:3]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1zg))
; (assert (<= 0 a1zh))
; (assert (<= 0 a1zs))
; (assert (<= 0 a1zu))
; (declare-const a1zg Int)
; (declare-const a1zh Int)
; (declare-const a1zs Int)
; (declare-const a1zu Int)
(declare-const a1zg Int)
(declare-const a1zh Int)
(declare-const a1zs Int)
(declare-const a1zu Int)
(assert
   (<= 0 a1zg))
(assert
   (<= 0 a1zh))
(assert
   (<= 0 a1zs))
(assert
   (<= 0 a1zu))
(assert
   (!
      (=
         (+ 1 a1zs)
         a1zg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a1zu)
         a1zh)
      :named
      given-9.2))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a1zC} {0}:: (n_a1zu[ssk:3] - n_a1zs[ssk:2])
;                               ~# (m_a1zh[sk:1] - n_a1zg[sk:1]) (CNonCanonical)
;  =>  (=
;    (- a1zu a1zs)
;    (- a1zh a1zg))

; WANTEDS (names)
;  a1zg  <=  n_a1zg[sk:1]
;  a1zh  <=  m_a1zh[sk:1]
;  a1zs  <=  n_a1zs[ssk:2]
;  a1zu  <=  n_a1zu[ssk:3]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a1zu a1zs)
            (- a1zh a1zg)))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (<= 0 a1zg)
;   (<= 0 a1zh)
;   (<= 0 a1zs)
;   (<= 0 a1zu)
;   (!
;      (=
;         (+ 1 a1zs)
;         a1zg)
;      :named
;      given-9.1)
;   (!
;      (=
;         (+ 1 a1zu)
;         a1zh)
;      :named
;      given-9.2)
;   (!
;      (not
;         (=
;            (- a1zu a1zs)
;            (- a1zh a1zg)))
;      :named
;      wanted-9))
(get-unsat-core)
; (given-9.2 wanted-9 given-9.1)
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
; [G] co_a1FJ {1}:: (1 + n_a1At[ssk:2]) ~# n_a1An[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1Az} {0}:: (1 + (n_a1At[ssk:2] + m_a1Ap[sk:1]))
;                          ~# (n_a1An[sk:1] + m_a1Ap[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a1At],a1An)

; WANTEDS (Thoralf style)
; (+ [1,+ [a1At,a1Ap]],+ [a1An,a1Ap])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a1Az} {0}:: (1 + (n_a1At[ssk:2] + m_a1Ap[sk:1]))
;                               ~# (n_a1An[sk:1] + m_a1Ap[sk:1]) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a1At a1Ap))
;    (+ a1An a1Ap))

; GIVENS (names)
;  a1An  <=  n_a1An[sk:1]
;  a1At  <=  n_a1At[ssk:2]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1An))
; (assert (<= 0 a1At))
; (declare-const a1An Int)
; (declare-const a1At Int)
(declare-const a1An Int)
(declare-const a1At Int)
(assert
   (<= 0 a1An))
(assert
   (<= 0 a1At))
(assert
   (!
      (=
         (+ 1 a1At)
         a1An)
      :named
      given-16.1))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a1Az} {0}:: (1 + (n_a1At[ssk:2] + m_a1Ap[sk:1]))
;                               ~# (n_a1An[sk:1] + m_a1Ap[sk:1]) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a1At a1Ap))
;    (+ a1An a1Ap))

; WANTEDS (names)
;  a1An  <=  n_a1An[sk:1]
;  a1Ap  <=  m_a1Ap[sk:1]
;  a1At  <=  n_a1At[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1Ap))
; (declare-const a1Ap Int)
(declare-const a1Ap Int)
(assert
   (<= 0 a1Ap))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a1At a1Ap))
            (+ a1An a1Ap)))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
(get-assertions)
; (
;   (<= 0 a1An)
;   (<= 0 a1At)
;   (!
;      (=
;         (+ 1 a1At)
;         a1An)
;      :named
;      given-16.1)
;   (<= 0 a1Ap)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a1At a1Ap))
;            (+ a1An a1Ap)))
;      :named
;      wanted-16))
(get-unsat-core)
; (given-16.1 wanted-16)
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
; [G] co_a1FL {1}:: (a_a1DO[sk:1] <? b_a1DP[sk:1]) ~# 'True (CEqCan)
; [G] co_a1FM {1}:: (b_a1DP[sk:1] <? c_a1DQ[sk:1]) ~# 'True (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1FN} {1}:: (a_a1DO[sk:1] <? c_a1DQ[sk:1])
;                          ~# 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a1DO,a1DP],True [])
; (<? [a1DP,a1DQ],True [])

; WANTEDS (Thoralf style)
; (<? [a1DO,a1DQ],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a1FN} {1}:: (a_a1DO[sk:1] <? c_a1DQ[sk:1])
;                               ~# 'True (CNonCanonical)
;  =>  (=
;    (< a1DO a1DQ)
;    true)

; GIVENS (names)
;  a1DO  <=  a_a1DO[sk:1]
;  a1DP  <=  b_a1DP[sk:1]
;  a1DQ  <=  c_a1DQ[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1DO))
; (assert (<= 0 a1DP))
; (assert (<= 0 a1DQ))
; (declare-const a1DO Int)
; (declare-const a1DP Int)
; (declare-const a1DQ Int)
(declare-const a1DO Int)
(declare-const a1DP Int)
(declare-const a1DQ Int)
(assert
   (<= 0 a1DO))
(assert
   (<= 0 a1DP))
(assert
   (<= 0 a1DQ))
(assert
   (!
      (=
         (< a1DO a1DP)
         true)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a1DP a1DQ)
         true)
      :named
      given-19.2))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a1FN} {1}:: (a_a1DO[sk:1] <? c_a1DQ[sk:1])
;                               ~# 'True (CNonCanonical)
;  =>  (=
;    (< a1DO a1DQ)
;    true)

; WANTEDS (names)
;  a1DO  <=  a_a1DO[sk:1]
;  a1DQ  <=  c_a1DQ[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a1DO a1DQ)
            true))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (<= 0 a1DO)
;   (<= 0 a1DP)
;   (<= 0 a1DQ)
;   (!
;      (=
;         (< a1DO a1DP)
;         true)
;      :named
;      given-19.1)
;   (!
;      (=
;         (< a1DP a1DQ)
;         true)
;      :named
;      given-19.2)
;   (!
;      (not
;         (=
;            (< a1DO a1DQ)
;            true))
;      :named
;      wanted-19))
(get-unsat-core)
; (given-19.2 wanted-19 given-19.1)
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
; [G] co_a1E2 {0}:: (a_a1E0[sk:1] + a_a1E0[sk:1])
;                   ~# (a_a1E0[sk:1] + b_a1E1[sk:1]) (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1E5} {0}:: a_a1E0[sk:1]
;                          ~# b_a1E1[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a1E0,a1E0],+ [a1E0,a1E1])

; WANTEDS (Thoralf style)
; (a1E0,a1E1)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{co_a1E5} {0}:: a_a1E0[sk:1]
;                               ~# b_a1E1[sk:1] (CNonCanonical)
;  =>  (= a1E0 a1E1)

; GIVENS (names)
;  a1E0  <=  a_a1E0[sk:1]
;  a1E1  <=  b_a1E1[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1E0))
; (assert (<= 0 a1E1))
; (declare-const a1E0 Int)
; (declare-const a1E1 Int)
(declare-const a1E0 Int)
(declare-const a1E1 Int)
(assert
   (<= 0 a1E0))
(assert
   (<= 0 a1E1))
(assert
   (!
      (=
         (+ a1E0 a1E0)
         (+ a1E0 a1E1))
      :named
      given-21.1))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{co_a1E5} {0}:: a_a1E0[sk:1]
;                               ~# b_a1E1[sk:1] (CNonCanonical)
;  =>  (= a1E0 a1E1)

; WANTEDS (names)
;  a1E0  <=  a_a1E0[sk:1]
;  a1E1  <=  b_a1E1[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1E0 a1E1))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (<= 0 a1E0)
;   (<= 0 a1E1)
;   (!
;      (=
;         (+ a1E0 a1E0)
;         (+ a1E0 a1E1))
;      :named
;      given-21.1)
;   (!
;      (not
;         (= a1E0 a1E1))
;      :named
;      wanted-21))
(get-unsat-core)
; (wanted-21 given-21.1)
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1Ee} {0}:: (a_a1E9[sk:1] + b_a1Ea[sk:1])
;                          ~# (b_a1Ea[sk:1] + a_a1E9[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1E9,a1Ea],+ [a1Ea,a1E9])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a1Ee} {0}:: (a_a1E9[sk:1] + b_a1Ea[sk:1])
;                               ~# (b_a1Ea[sk:1] + a_a1E9[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1E9 a1Ea)
;    (+ a1Ea a1E9))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a1Ee} {0}:: (a_a1E9[sk:1] + b_a1Ea[sk:1])
;                               ~# (b_a1Ea[sk:1] + a_a1E9[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1E9 a1Ea)
;    (+ a1Ea a1E9))

; WANTEDS (names)
;  a1E9  <=  a_a1E9[sk:1]
;  a1Ea  <=  b_a1Ea[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1E9))
; (assert (<= 0 a1Ea))
; (declare-const a1E9 Int)
; (declare-const a1Ea Int)
(declare-const a1E9 Int)
(declare-const a1Ea Int)
(assert
   (<= 0 a1E9))
(assert
   (<= 0 a1Ea))
(assert
   (!
      (not
         (=
            (+ a1E9 a1Ea)
            (+ a1Ea a1E9)))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a1E9)
;   (<= 0 a1Ea)
;   (!
;      (not
;         (=
;            (+ a1E9 a1Ea)
;            (+ a1Ea a1E9)))
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
; [WD] hole{co_a1El} {0}:: (a_a1Eh[sk:1] + 1)
;                          ~# (1 + a_a1Eh[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1Eh,1],+ [1,a1Eh])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a1El} {0}:: (a_a1Eh[sk:1] + 1)
;                               ~# (1 + a_a1Eh[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1Eh 1)
;    (+ 1 a1Eh))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a1El} {0}:: (a_a1Eh[sk:1] + 1)
;                               ~# (1 + a_a1Eh[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1Eh 1)
;    (+ 1 a1Eh))

; WANTEDS (names)
;  a1Eh  <=  a_a1Eh[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1Eh))
; (declare-const a1Eh Int)
(declare-const a1Eh Int)
(assert
   (<= 0 a1Eh))
(assert
   (!
      (not
         (=
            (+ a1Eh 1)
            (+ 1 a1Eh)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a1Eh)
;   (!
;      (not
;         (=
;            (+ a1Eh 1)
;            (+ 1 a1Eh)))
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
; [WD] hole{co_a2NT} {3}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~# Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a2NL} {3}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~# Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a2NT} {3}:: Alter
;                                 (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                               ~# Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
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

;      [WD] hole{co_a2NL} {3}:: Alter
;                                 (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                               ~# Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)
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
;      [WD] hole{co_a2NT} {3}:: Alter
;                                 (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                               ~# Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
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

;      [WD] hole{co_a2NL} {3}:: Alter
;                                 (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                               ~# Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)
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
; [G] co_a2O6 {2}:: Alter m_a2LT[sk:1] "price" Int
;                   ~# m_a2LT[sk:1] (CEqCan)
; [G] co_a2Oa {2}:: Delete m_a2LV[ssk:2] field_a2LW[ssk:2]
;                   ~# m_a2LT[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2Oe} {3}:: Alter m_a2LV[ssk:2] "price" Int
;                          ~# m_a2LV[ssk:2] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LT,"price",Int []],a2LT)
; (Delete [Symbol [],TYPE [BoxedRep [Lifted []]],a2LV,a2LW],a2LT)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LV,"price",Int []],a2LV)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a2Oe} {3}:: Alter m_a2LV[ssk:2] "price" Int
;                               ~# m_a2LV[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2LV
;       "price"
;       (just
;          (lit "3u")))
;    a2LV)

; GIVENS (names)
;  a2LT  <=  m_a2LT[sk:1]
;  a2LV  <=  m_a2LV[ssk:2]
;  a2LW  <=  field_a2LW[ssk:2]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a2LT (Array String (Maybe Type)))
; (declare-const a2LV (Array String (Maybe Type)))
; (declare-const a2LW String)
(declare-const
   a2LT
   (Array
      String
      (Maybe Type)))
(declare-const
   a2LV
   (Array
      String
      (Maybe Type)))
(declare-const a2LW String)
(assert
   (!
      (=
         (store
            a2LT
            "price"
            (just
               (lit "3u")))
         a2LT)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a2LV
            a2LW
            (as
               nothing
               (Maybe Type)))
         a2LT)
      :named
      given-8.2))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a2Oe} {3}:: Alter m_a2LV[ssk:2] "price" Int
;                               ~# m_a2LV[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2LV
;       "price"
;       (just
;          (lit "3u")))
;    a2LV)

; WANTEDS (names)
;  a2LV  <=  m_a2LV[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a2LV
               "price"
               (just
                  (lit "3u")))
            a2LV))
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
;            a2LT
;            "price"
;            (just
;               (lit "3u")))
;         a2LT)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a2LV
;            a2LW
;            (as
;               nothing
;               (Maybe Type)))
;         a2LT)
;      :named
;      given-8.2)
;   (!
;      (not
;         (=
;            (store
;               a2LV
;               "price"
;               (just
;                  (lit "3u")))
;            a2LV))
;      :named
;      wanted-8))
(get-unsat-core)
; (given-8.2 given-8.1 wanted-8)
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
; [G] co_a2O6 {2}:: Alter m_a2LT[sk:1] "price" Int
;                   ~# m_a2LT[sk:1] (CEqCan)
; [G] co_a2Om {5}:: Alter m_a2M2[ssk:2] "price" val_a2M4[ssk:2]
;                   ~# m_a2LT[sk:1] (CEqCan)
; [G] co_a2Oj {1}:: field_a2M3[ssk:2] ~# "price" (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2Mj} {0}:: val_a2M4[ssk:2] ~# Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LT,"price",Int []],a2LT)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2M2,"price",a2M4],a2LT)
; (a2M3,"price")

; WANTEDS (Thoralf style)
; (a2M4,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a2Mj} {0}:: val_a2M4[ssk:2]
;                               ~# Int (CNonCanonical)
;  =>  (=
;    a2M4
;    (lit "3u"))

; GIVENS (names)
;  a2LT  <=  m_a2LT[sk:1]
;  a2M2  <=  m_a2M2[ssk:2]
;  a2M3  <=  field_a2M3[ssk:2]
;  a2M4  <=  val_a2M4[ssk:2]
(push 1)
; DECS1 (seen) 
; (declare-const a2LT (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a2M2 (Array String (Maybe Type)))
; (declare-const a2M3 String)
; (declare-const a2M4 Type)
(declare-const
   a2LT
   (Array
      String
      (Maybe Type)))
(declare-const
   a2M2
   (Array
      String
      (Maybe Type)))
(declare-const a2M3 String)
(declare-const a2M4 Type)
(assert
   (!
      (=
         (store
            a2LT
            "price"
            (just
               (lit "3u")))
         a2LT)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a2M2
            "price"
            (just a2M4))
         a2LT)
      :named
      given-11.2))
(assert
   (!
      (= a2M3 "price")
      :named
      given-11.3))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a2Mj} {0}:: val_a2M4[ssk:2]
;                               ~# Int (CNonCanonical)
;  =>  (=
;    a2M4
;    (lit "3u"))

; WANTEDS (names)
;  a2M4  <=  val_a2M4[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a2M4
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
;            a2LT
;            "price"
;            (just
;               (lit "3u")))
;         a2LT)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a2M2
;            "price"
;            (just a2M4))
;         a2LT)
;      :named
;      given-11.2)
;   (!
;      (= a2M3 "price")
;      :named
;      given-11.3)
;   (!
;      (not
;         (=
;            a2M4
;            (lit "3u")))
;      :named
;      wanted-11))
(get-unsat-core)
; (given-11.2 given-11.1 wanted-11)
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
; [G] $dDisEquality_a2Ml {0}:: DisEquality
;                                field_a2M3[ssk:2] "price" (CDictCan)
; [G] co_a2O6 {2}:: Alter m_a2LT[sk:1] "price" Int
;                   ~# m_a2LT[sk:1] (CEqCan)
; [G] co_a2Oh {2}:: Alter
;                     m_a2M2[ssk:2] field_a2M3[ssk:2] val_a2M4[ssk:2]
;                   ~# m_a2LT[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2Op} {3}:: Alter m_a2M2[ssk:2] "price" Int
;                          ~# m_a2M2[ssk:2] (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a2Ml {0}:: DisEquality
                               field_a2M3[ssk:2] "price" (CDictCan)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LT,"price",Int []],a2LT)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2M2,a2M3,a2M4],a2LT)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2M2,"price",Int []],a2M2)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a2Op} {3}:: Alter m_a2M2[ssk:2] "price" Int
;                               ~# m_a2M2[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2M2
;       "price"
;       (just
;          (lit "3u")))
;    a2M2)

; GIVENS (names)
;  a2LT  <=  m_a2LT[sk:1]
;  a2M2  <=  m_a2M2[ssk:2]
;  a2M3  <=  field_a2M3[ssk:2]
;  a2M4  <=  val_a2M4[ssk:2]
(push 1)
; DECS1 (seen) 
; (declare-const a2LT (Array String (Maybe Type)))
; (declare-const a2M2 (Array String (Maybe Type)))
; (declare-const a2M3 String)
; (declare-const a2M4 Type)
; DECS1 (unseen) 
(declare-const
   a2LT
   (Array
      String
      (Maybe Type)))
(declare-const
   a2M2
   (Array
      String
      (Maybe Type)))
(declare-const a2M3 String)
(declare-const a2M4 Type)
(assert
   (!
      (not
         (= a2M3 "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a2LT
            "price"
            (just
               (lit "3u")))
         a2LT)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a2M2
            a2M3
            (just a2M4))
         a2LT)
      :named
      given-13.3))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a2Op} {3}:: Alter m_a2M2[ssk:2] "price" Int
;                               ~# m_a2M2[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2M2
;       "price"
;       (just
;          (lit "3u")))
;    a2M2)

; WANTEDS (names)
;  a2M2  <=  m_a2M2[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a2M2
               "price"
               (just
                  (lit "3u")))
            a2M2))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a2M3 "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a2LT
;            "price"
;            (just
;               (lit "3u")))
;         a2LT)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a2M2
;            a2M3
;            (just a2M4))
;         a2LT)
;      :named
;      given-13.3)
;   (!
;      (not
;         (=
;            (store
;               a2M2
;               "price"
;               (just
;                  (lit "3u")))
;            a2M2))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.1 given-13.3 wanted-13 given-13.2)
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
