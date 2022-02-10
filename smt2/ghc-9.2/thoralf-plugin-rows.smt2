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
; [G] co_aGY {1}:: IntersectL b_aGs[sk:1] c_aGu[sk:1]
;                  ~# bc_aGw[sk:1] (CEqCan)
; [G] co_aGV {1}:: IntersectL ab_aGt[sk:1] c_aGu[sk:1]
;                  ~# abc_aGv[sk:1] (CEqCan)
; [G] co_aGS {1}:: IntersectL a_aGr[sk:1] b_aGs[sk:1]
;                  ~# ab_aGt[sk:1] (CEqCan)
; [G] co_aH1 {1}:: IntersectL a_aGr[sk:1] bc_aGw[sk:1]
;                  ~# abc'_aGx[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aH8} {2}:: IntersectL
;                           a_aGE[tau:1] (IntersectL b_aGF[tau:1] c_aGH[tau:1])
;                         ~# abc'_aGx[sk:1] (CNonCanonical)
; [WD] hole{co_aH5} {2}:: IntersectL
;                           (IntersectL a_aGE[tau:1] b_aGF[tau:1]) c_aGH[tau:1]
;                         ~# abc_aGv[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aGp,aGq,aGs,aGu],aGw)
; (IntersectL [aGp,aGq,aGt,aGu],aGv)
; (IntersectL [aGp,aGq,aGr,aGs],aGt)
; (IntersectL [aGp,aGq,aGr,aGw],aGx)

; WANTEDS (Thoralf style)
; (IntersectL [aGp,aGq,aGE,IntersectL [aGp,aGq,aGF,aGH]],aGx)
; (IntersectL [aGp,aGq,IntersectL [aGp,aGq,aGE,aGF],aGH],aGv)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aH8} {2}:: IntersectL
;                                a_aGE[tau:1] (IntersectL b_aGF[tau:1] c_aGH[tau:1])
;                              ~# abc'_aGx[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      aGE
;      (
;        (_ map both1941159402142700077)
;        aGF
;        aGH))
;    aGx)

;      [WD] hole{co_aH5} {2}:: IntersectL
;                                (IntersectL a_aGE[tau:1] b_aGF[tau:1]) c_aGH[tau:1]
;                              ~# abc_aGv[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      (
;        (_ map both1941159402142700077)
;        aGE
;        aGF)
;      aGH)
;    aGv)

; GIVENS (names)
;  aGr  <=  a_aGr[sk:1]
;  aGs  <=  b_aGs[sk:1]
;  aGt  <=  ab_aGt[sk:1]
;  aGu  <=  c_aGu[sk:1]
;  aGv  <=  abc_aGv[sk:1]
;  aGw  <=  bc_aGw[sk:1]
;  aGx  <=  abc'_aGx[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaGq)) (y (Maybe SortaGq))) (=> (and ((_ is (just (SortaGq) (Maybe SortaGq))) x) ((_ is (just (SortaGq) (Maybe SortaGq))) y)) (= (both1941159402142700077 x y) x))))
; (assert (forall ((y (Maybe SortaGq))) (= (both1941159402142700077 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaGq))) (= (both1941159402142700077 y (as nothing (Maybe SortaGq))) (as nothing (Maybe SortaGq)))))
; (declare-const aGr (Array SortaGp (Maybe SortaGq)))
; (declare-const aGs (Array SortaGp (Maybe SortaGq)))
; (declare-const aGt (Array SortaGp (Maybe SortaGq)))
; (declare-const aGu (Array SortaGp (Maybe SortaGq)))
; (declare-const aGv (Array SortaGp (Maybe SortaGq)))
; (declare-const aGw (Array SortaGp (Maybe SortaGq)))
; (declare-const aGx (Array SortaGp (Maybe SortaGq)))
; (declare-fun both1941159402142700077 ((Maybe SortaGq) (Maybe SortaGq)) (Maybe SortaGq))
; (declare-sort SortaGp)
; (declare-sort SortaGq)
(declare-sort SortaGp)
(declare-sort SortaGq)
(declare-const
   aGr
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGs
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGt
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGu
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGv
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGw
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGx
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-fun
   both1941159402142700077
   (
     (Maybe SortaGq)
     (Maybe SortaGq))
   (Maybe SortaGq))
(assert
   (forall
      (
        (y
           (Maybe SortaGq)))
      (=
         (both1941159402142700077
            y
            (as
               nothing
               (Maybe SortaGq)))
         (as
            nothing
            (Maybe SortaGq)))))
(assert
   (forall
      (
        (y
           (Maybe SortaGq)))
      (=
         (both1941159402142700077 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaGq))
        (y
           (Maybe SortaGq)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaGq)
                    (Maybe SortaGq)))
              x)
            (
              (_
                 is
                 (just
                    (SortaGq)
                    (Maybe SortaGq)))
              y))
         (=
            (both1941159402142700077 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGs
           aGu)
         aGw)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGt
           aGu)
         aGv)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGr
           aGs)
         aGt)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGr
           aGw)
         aGx)
      :named
      given-2.4))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aH8} {2}:: IntersectL
;                                a_aGE[tau:1] (IntersectL b_aGF[tau:1] c_aGH[tau:1])
;                              ~# abc'_aGx[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      aGE
;      (
;        (_ map both1941159402142700077)
;        aGF
;        aGH))
;    aGx)

;      [WD] hole{co_aH5} {2}:: IntersectL
;                                (IntersectL a_aGE[tau:1] b_aGF[tau:1]) c_aGH[tau:1]
;                              ~# abc_aGv[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      (
;        (_ map both1941159402142700077)
;        aGE
;        aGF)
;      aGH)
;    aGv)

; WANTEDS (names)
;  aGv  <=  abc_aGv[sk:1]
;  aGx  <=  abc'_aGx[sk:1]
;  aGE  <=  a_aGE[tau:1]
;  aGF  <=  b_aGF[tau:1]
;  aGH  <=  c_aGH[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGE (Array SortaGp (Maybe SortaGq)))
; (declare-const aGF (Array SortaGp (Maybe SortaGq)))
; (declare-const aGH (Array SortaGp (Maybe SortaGq)))
(declare-const
   aGE
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGF
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGH
   (Array
      SortaGp
      (Maybe SortaGq)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1941159402142700077)
                 aGE
                 (
                   (_ map both1941159402142700077)
                   aGF
                   aGH))
               aGx))
         (not
            (=
               (
                 (_ map both1941159402142700077)
                 (
                   (_ map both1941159402142700077)
                   aGE
                   aGF)
                 aGH)
               aGv)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaGq!val!3
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!0
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!2
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!4
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!1
;      ()
;      SortaGq)
;   (forall
;      (
;        (x SortaGq))
;      (or
;         (= x SortaGq!val!3)
;         (= x SortaGq!val!0)
;         (= x SortaGq!val!2)
;         (= x SortaGq!val!4)
;         (= x SortaGq!val!1)))
;   (declare-fun
;      SortaGp!val!0
;      ()
;      SortaGp)
;   (forall
;      (
;        (x SortaGp))
;      (= x SortaGp!val!0))
;   (define-fun
;      aGF
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           nothing)
;         SortaGp!val!0
;         (just SortaGq!val!3)))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGs
;           aGu)
;         aGw))
;   (define-fun
;      aGu
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGt
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGE
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           (just SortaGq!val!0))
;         SortaGp!val!0
;         (just SortaGq!val!2)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGr
;           aGs)
;         aGt))
;   (define-fun
;      aGw
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
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
;                      (_ map both1941159402142700077)
;                      aGE
;                      (
;                        (_ map both1941159402142700077)
;                        aGF
;                        aGH))
;                    aGx)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1941159402142700077)
;                      (
;                        (_ map both1941159402142700077)
;                        aGE
;                        aGF)
;                      aGH)
;                    aGv))))
;         (or a!1 a!2)))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGr
;           aGw)
;         aGx))
;   (define-fun
;      aGH
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           nothing)
;         SortaGp!val!0
;         (just SortaGq!val!4)))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGt
;           aGu)
;         aGv))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGx
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGr
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           (just SortaGq!val!1))
;         SortaGp!val!0
;         nothing))
;   (define-fun
;      aGv
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      both1941159402142700077
;      (
;        (x!0
;           (Maybe SortaGq))
;        (x!1
;           (Maybe SortaGq)))
;      (Maybe SortaGq)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGq!val!1))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaGq!val!0))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaGq!val!2))
;                  (=
;                     x!1
;                     (just SortaGq!val!3)))
;               (just SortaGq!val!2)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaGq!val!2))
;                     (=
;                        x!1
;                        (just SortaGq!val!4)))
;                  (just SortaGq!val!2)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaGq!val!3))
;                           (=
;                              x!1
;                              (just SortaGq!val!4)))
;                        (just SortaGq!val!3)
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
; [G] co_aGY {1}:: IntersectL b_aGs[sk:1] c_aGu[sk:1]
;                  ~# bc_aGw[sk:1] (CEqCan)
; [G] co_aGV {1}:: IntersectL ab_aGt[sk:1] c_aGu[sk:1]
;                  ~# abc_aGv[sk:1] (CEqCan)
; [G] co_aGS {1}:: IntersectL a_aGr[sk:1] b_aGs[sk:1]
;                  ~# ab_aGt[sk:1] (CEqCan)
; [G] co_aH1 {1}:: IntersectL a_aGr[sk:1] bc_aGw[sk:1]
;                  ~# abc'_aGx[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aH8} {2}:: IntersectL
;                           a_aGE[tau:1] (IntersectL b_aGF[tau:1] c_aGH[tau:1])
;                         ~# abc'_aGx[sk:1] (CNonCanonical)
; [WD] hole{co_aH5} {2}:: IntersectL
;                           (IntersectL a_aGE[tau:1] b_aGF[tau:1]) c_aGH[tau:1]
;                         ~# abc_aGv[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aGp,aGq,aGs,aGu],aGw)
; (IntersectL [aGp,aGq,aGt,aGu],aGv)
; (IntersectL [aGp,aGq,aGr,aGs],aGt)
; (IntersectL [aGp,aGq,aGr,aGw],aGx)

; WANTEDS (Thoralf style)
; (IntersectL [aGp,aGq,aGE,IntersectL [aGp,aGq,aGF,aGH]],aGx)
; (IntersectL [aGp,aGq,IntersectL [aGp,aGq,aGE,aGF],aGH],aGv)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_aH8} {2}:: IntersectL
;                                a_aGE[tau:1] (IntersectL b_aGF[tau:1] c_aGH[tau:1])
;                              ~# abc'_aGx[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      aGE
;      (
;        (_ map both1941159402142700077)
;        aGF
;        aGH))
;    aGx)

;      [WD] hole{co_aH5} {2}:: IntersectL
;                                (IntersectL a_aGE[tau:1] b_aGF[tau:1]) c_aGH[tau:1]
;                              ~# abc_aGv[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      (
;        (_ map both1941159402142700077)
;        aGE
;        aGF)
;      aGH)
;    aGv)

; GIVENS (names)
;  aGr  <=  a_aGr[sk:1]
;  aGs  <=  b_aGs[sk:1]
;  aGt  <=  ab_aGt[sk:1]
;  aGu  <=  c_aGu[sk:1]
;  aGv  <=  abc_aGv[sk:1]
;  aGw  <=  bc_aGw[sk:1]
;  aGx  <=  abc'_aGx[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaGq)) (y (Maybe SortaGq))) (=> (and ((_ is (just (SortaGq) (Maybe SortaGq))) x) ((_ is (just (SortaGq) (Maybe SortaGq))) y)) (= (both1941159402142700077 x y) x))))
; (assert (forall ((y (Maybe SortaGq))) (= (both1941159402142700077 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaGq))) (= (both1941159402142700077 y (as nothing (Maybe SortaGq))) (as nothing (Maybe SortaGq)))))
; (declare-const aGr (Array SortaGp (Maybe SortaGq)))
; (declare-const aGs (Array SortaGp (Maybe SortaGq)))
; (declare-const aGt (Array SortaGp (Maybe SortaGq)))
; (declare-const aGu (Array SortaGp (Maybe SortaGq)))
; (declare-const aGv (Array SortaGp (Maybe SortaGq)))
; (declare-const aGw (Array SortaGp (Maybe SortaGq)))
; (declare-const aGx (Array SortaGp (Maybe SortaGq)))
; (declare-fun both1941159402142700077 ((Maybe SortaGq) (Maybe SortaGq)) (Maybe SortaGq))
; (declare-sort SortaGp)
; (declare-sort SortaGq)
(declare-sort SortaGp)
(declare-sort SortaGq)
(declare-const
   aGr
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGs
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGt
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGu
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGv
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGw
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGx
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-fun
   both1941159402142700077
   (
     (Maybe SortaGq)
     (Maybe SortaGq))
   (Maybe SortaGq))
(assert
   (forall
      (
        (y
           (Maybe SortaGq)))
      (=
         (both1941159402142700077
            y
            (as
               nothing
               (Maybe SortaGq)))
         (as
            nothing
            (Maybe SortaGq)))))
(assert
   (forall
      (
        (y
           (Maybe SortaGq)))
      (=
         (both1941159402142700077 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaGq))
        (y
           (Maybe SortaGq)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaGq)
                    (Maybe SortaGq)))
              x)
            (
              (_
                 is
                 (just
                    (SortaGq)
                    (Maybe SortaGq)))
              y))
         (=
            (both1941159402142700077 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGs
           aGu)
         aGw)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGt
           aGu)
         aGv)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGr
           aGs)
         aGt)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both1941159402142700077)
           aGr
           aGw)
         aGx)
      :named
      given-2.4))
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_aH8} {2}:: IntersectL
;                                a_aGE[tau:1] (IntersectL b_aGF[tau:1] c_aGH[tau:1])
;                              ~# abc'_aGx[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      aGE
;      (
;        (_ map both1941159402142700077)
;        aGF
;        aGH))
;    aGx)

;      [WD] hole{co_aH5} {2}:: IntersectL
;                                (IntersectL a_aGE[tau:1] b_aGF[tau:1]) c_aGH[tau:1]
;                              ~# abc_aGv[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map both1941159402142700077)
;      (
;        (_ map both1941159402142700077)
;        aGE
;        aGF)
;      aGH)
;    aGv)

; WANTEDS (names)
;  aGv  <=  abc_aGv[sk:1]
;  aGx  <=  abc'_aGx[sk:1]
;  aGE  <=  a_aGE[tau:1]
;  aGF  <=  b_aGF[tau:1]
;  aGH  <=  c_aGH[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aGE (Array SortaGp (Maybe SortaGq)))
; (declare-const aGF (Array SortaGp (Maybe SortaGq)))
; (declare-const aGH (Array SortaGp (Maybe SortaGq)))
(declare-const
   aGE
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGF
   (Array
      SortaGp
      (Maybe SortaGq)))
(declare-const
   aGH
   (Array
      SortaGp
      (Maybe SortaGq)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map both1941159402142700077)
                 aGE
                 (
                   (_ map both1941159402142700077)
                   aGF
                   aGH))
               aGx))
         (not
            (=
               (
                 (_ map both1941159402142700077)
                 (
                   (_ map both1941159402142700077)
                   aGE
                   aGF)
                 aGH)
               aGv)))
      :named
      wanted-2))
(check-sat)
; sat
(echo "wanteds-finish-cycle-2")
(get-model)
; (
;   (declare-fun
;      SortaGq!val!3
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!0
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!2
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!4
;      ()
;      SortaGq)
;   (declare-fun
;      SortaGq!val!1
;      ()
;      SortaGq)
;   (forall
;      (
;        (x SortaGq))
;      (or
;         (= x SortaGq!val!3)
;         (= x SortaGq!val!0)
;         (= x SortaGq!val!2)
;         (= x SortaGq!val!4)
;         (= x SortaGq!val!1)))
;   (declare-fun
;      SortaGp!val!0
;      ()
;      SortaGp)
;   (forall
;      (
;        (x SortaGp))
;      (= x SortaGp!val!0))
;   (define-fun
;      aGF
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           nothing)
;         SortaGp!val!0
;         (just SortaGq!val!3)))
;   (define-fun
;      given-2.1
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGs
;           aGu)
;         aGw))
;   (define-fun
;      aGu
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGt
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGE
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           (just SortaGq!val!0))
;         SortaGp!val!0
;         (just SortaGq!val!2)))
;   (define-fun
;      given-2.3
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGr
;           aGs)
;         aGt))
;   (define-fun
;      aGw
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
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
;                      (_ map both1941159402142700077)
;                      aGE
;                      (
;                        (_ map both1941159402142700077)
;                        aGF
;                        aGH))
;                    aGx)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map both1941159402142700077)
;                      (
;                        (_ map both1941159402142700077)
;                        aGE
;                        aGF)
;                      aGH)
;                    aGv))))
;         (or a!1 a!2)))
;   (define-fun
;      given-2.4
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGr
;           aGw)
;         aGx))
;   (define-fun
;      aGH
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           nothing)
;         SortaGp!val!0
;         (just SortaGq!val!4)))
;   (define-fun
;      given-2.2
;      ()
;      Bool
;      (=
;         (
;           (_ map both1941159402142700077)
;           aGt
;           aGu)
;         aGv))
;   (define-fun
;      aGs
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGx
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      aGr
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaGp
;                 (Maybe SortaGq)))
;           (just SortaGq!val!1))
;         SortaGp!val!0
;         nothing))
;   (define-fun
;      aGv
;      ()
;      (Array
;         SortaGp
;         (Maybe SortaGq))
;      (
;        (as
;           const
;           (Array
;              SortaGp
;              (Maybe SortaGq)))
;        nothing))
;   (define-fun
;      both1941159402142700077
;      (
;        (x!0
;           (Maybe SortaGq))
;        (x!1
;           (Maybe SortaGq)))
;      (Maybe SortaGq)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaGq!val!1))
;            (= x!1 nothing))
;         nothing
;         (ite
;            (and
;               (=
;                  x!0
;                  (just SortaGq!val!0))
;               (= x!1 nothing))
;            nothing
;            (ite
;               (and
;                  (=
;                     x!0
;                     (just SortaGq!val!2))
;                  (=
;                     x!1
;                     (just SortaGq!val!3)))
;               (just SortaGq!val!2)
;               (ite
;                  (and
;                     (=
;                        x!0
;                        (just SortaGq!val!2))
;                     (=
;                        x!1
;                        (just SortaGq!val!4)))
;                  (just SortaGq!val!2)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (= x!1 nothing))
;                     nothing
;                     (ite
;                        (and
;                           (=
;                              x!0
;                              (just SortaGq!val!3))
;                           (=
;                              x!1
;                              (just SortaGq!val!4)))
;                        (just SortaGq!val!3)
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
; [G] co_aI8 {1}:: UnionL b_aHC[sk:1] c_aHE[sk:1]
;                  ~# bc_aHG[sk:1] (CEqCan)
; [G] co_aI5 {1}:: UnionL ab_aHD[sk:1] c_aHE[sk:1]
;                  ~# abc_aHF[sk:1] (CEqCan)
; [G] co_aI2 {1}:: UnionL a_aHB[sk:1] b_aHC[sk:1]
;                  ~# ab_aHD[sk:1] (CEqCan)
; [G] co_aIb {1}:: UnionL a_aHB[sk:1] bc_aHG[sk:1]
;                  ~# abc'_aHH[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIi} {2}:: UnionL
;                           a_aHO[tau:1] (UnionL b_aHP[tau:1] c_aHR[tau:1])
;                         ~# abc'_aHH[sk:1] (CNonCanonical)
; [WD] hole{co_aIf} {2}:: UnionL
;                           (UnionL a_aHO[tau:1] b_aHP[tau:1]) c_aHR[tau:1]
;                         ~# abc_aHF[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aHz,aHA,aHC,aHE],aHG)
; (UnionL [aHz,aHA,aHD,aHE],aHF)
; (UnionL [aHz,aHA,aHB,aHC],aHD)
; (UnionL [aHz,aHA,aHB,aHG],aHH)

; WANTEDS (Thoralf style)
; (UnionL [aHz,aHA,aHO,UnionL [aHz,aHA,aHP,aHR]],aHH)
; (UnionL [aHz,aHA,UnionL [aHz,aHA,aHO,aHP],aHR],aHF)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aIi} {2}:: UnionL
;                                a_aHO[tau:1] (UnionL b_aHP[tau:1] c_aHR[tau:1])
;                              ~# abc'_aHH[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      aHO
;      (
;        (_ map either1945926884561676842)
;        aHP
;        aHR))
;    aHH)

;      [WD] hole{co_aIf} {2}:: UnionL
;                                (UnionL a_aHO[tau:1] b_aHP[tau:1]) c_aHR[tau:1]
;                              ~# abc_aHF[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      (
;        (_ map either1945926884561676842)
;        aHO
;        aHP)
;      aHR)
;    aHF)

; GIVENS (names)
;  aHB  <=  a_aHB[sk:1]
;  aHC  <=  b_aHC[sk:1]
;  aHD  <=  ab_aHD[sk:1]
;  aHE  <=  c_aHE[sk:1]
;  aHF  <=  abc_aHF[sk:1]
;  aHG  <=  bc_aHG[sk:1]
;  aHH  <=  abc'_aHH[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaHA)) (y (Maybe SortaHA))) (=> ((_ is (just (SortaHA) (Maybe SortaHA))) x) (= (either1945926884561676842 x y) x))))
; (assert (forall ((y (Maybe SortaHA))) (= (either1945926884561676842 (as nothing (Maybe SortaHA)) y) y)))
; (declare-const aHB (Array SortaHz (Maybe SortaHA)))
; (declare-const aHC (Array SortaHz (Maybe SortaHA)))
; (declare-const aHD (Array SortaHz (Maybe SortaHA)))
; (declare-const aHE (Array SortaHz (Maybe SortaHA)))
; (declare-const aHF (Array SortaHz (Maybe SortaHA)))
; (declare-const aHG (Array SortaHz (Maybe SortaHA)))
; (declare-const aHH (Array SortaHz (Maybe SortaHA)))
; (declare-fun either1945926884561676842 ((Maybe SortaHA) (Maybe SortaHA)) (Maybe SortaHA))
; (declare-sort SortaHA)
; (declare-sort SortaHz)
(declare-sort SortaHz)
(declare-sort SortaHA)
(declare-const
   aHB
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHC
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHD
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHE
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHF
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHG
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHH
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-fun
   either1945926884561676842
   (
     (Maybe SortaHA)
     (Maybe SortaHA))
   (Maybe SortaHA))
(assert
   (forall
      (
        (y
           (Maybe SortaHA)))
      (=
         (either1945926884561676842
            (as
               nothing
               (Maybe SortaHA))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaHA))
        (y
           (Maybe SortaHA)))
      (=>
         (
           (_
              is
              (just
                 (SortaHA)
                 (Maybe SortaHA)))
           x)
         (=
            (either1945926884561676842 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHC
           aHE)
         aHG)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHD
           aHE)
         aHF)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHB
           aHC)
         aHD)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHB
           aHG)
         aHH)
      :named
      given-4.4))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aIi} {2}:: UnionL
;                                a_aHO[tau:1] (UnionL b_aHP[tau:1] c_aHR[tau:1])
;                              ~# abc'_aHH[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      aHO
;      (
;        (_ map either1945926884561676842)
;        aHP
;        aHR))
;    aHH)

;      [WD] hole{co_aIf} {2}:: UnionL
;                                (UnionL a_aHO[tau:1] b_aHP[tau:1]) c_aHR[tau:1]
;                              ~# abc_aHF[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      (
;        (_ map either1945926884561676842)
;        aHO
;        aHP)
;      aHR)
;    aHF)

; WANTEDS (names)
;  aHF  <=  abc_aHF[sk:1]
;  aHH  <=  abc'_aHH[sk:1]
;  aHO  <=  a_aHO[tau:1]
;  aHP  <=  b_aHP[tau:1]
;  aHR  <=  c_aHR[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHO (Array SortaHz (Maybe SortaHA)))
; (declare-const aHP (Array SortaHz (Maybe SortaHA)))
; (declare-const aHR (Array SortaHz (Maybe SortaHA)))
(declare-const
   aHO
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHP
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHR
   (Array
      SortaHz
      (Maybe SortaHA)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1945926884561676842)
                 aHO
                 (
                   (_ map either1945926884561676842)
                   aHP
                   aHR))
               aHH))
         (not
            (=
               (
                 (_ map either1945926884561676842)
                 (
                   (_ map either1945926884561676842)
                   aHO
                   aHP)
                 aHR)
               aHF)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (declare-fun
;      SortaHz!val!0
;      ()
;      SortaHz)
;   (forall
;      (
;        (x SortaHz))
;      (= x SortaHz!val!0))
;   (declare-fun
;      SortaHA!val!2
;      ()
;      SortaHA)
;   (declare-fun
;      SortaHA!val!3
;      ()
;      SortaHA)
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
;         (= x SortaHA!val!2)
;         (= x SortaHA!val!3)
;         (= x SortaHA!val!0)
;         (= x SortaHA!val!1)))
;   (define-fun
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHC
;           aHE)
;         aHG))
;   (define-fun
;      aHP
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      aHD
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      aHH
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHB
;           aHG)
;         aHH))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHD
;           aHE)
;         aHF))
;   (define-fun
;      aHB
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      aHO
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      aHR
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!0))
;         SortaHz!val!0
;         (just SortaHA!val!2)))
;   (define-fun
;      aHF
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      aHG
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      aHC
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHB
;           aHC)
;         aHD))
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
;                      (_ map either1945926884561676842)
;                      aHO
;                      (
;                        (_ map either1945926884561676842)
;                        aHP
;                        aHR))
;                    aHH)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1945926884561676842)
;                      (
;                        (_ map either1945926884561676842)
;                        aHO
;                        aHP)
;                      aHR)
;                    aHF))))
;         (or a!1 a!2)))
;   (define-fun
;      aHE
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      either1945926884561676842
;      (
;        (x!0
;           (Maybe SortaHA))
;        (x!1
;           (Maybe SortaHA)))
;      (Maybe SortaHA)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaHA!val!1))
;            (= x!1 nothing))
;         (just SortaHA!val!1)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaHA!val!1)))
;            (just SortaHA!val!1)
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
;                        (just SortaHA!val!0)))
;                  (just SortaHA!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaHA!val!3)))
;                     (just SortaHA!val!3)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaHA!val!2)))
;                        (just SortaHA!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaHA!val!3))
;                              (= x!1 nothing))
;                           (just SortaHA!val!3)
;                           (ite
;                              (
;                                (_ is just)
;                                x!0)
;                              x!0
;                              x!1))))))))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] co_aI8 {1}:: UnionL b_aHC[sk:1] c_aHE[sk:1]
;                  ~# bc_aHG[sk:1] (CEqCan)
; [G] co_aI5 {1}:: UnionL ab_aHD[sk:1] c_aHE[sk:1]
;                  ~# abc_aHF[sk:1] (CEqCan)
; [G] co_aI2 {1}:: UnionL a_aHB[sk:1] b_aHC[sk:1]
;                  ~# ab_aHD[sk:1] (CEqCan)
; [G] co_aIb {1}:: UnionL a_aHB[sk:1] bc_aHG[sk:1]
;                  ~# abc'_aHH[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIi} {2}:: UnionL
;                           a_aHO[tau:1] (UnionL b_aHP[tau:1] c_aHR[tau:1])
;                         ~# abc'_aHH[sk:1] (CNonCanonical)
; [WD] hole{co_aIf} {2}:: UnionL
;                           (UnionL a_aHO[tau:1] b_aHP[tau:1]) c_aHR[tau:1]
;                         ~# abc_aHF[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aHz,aHA,aHC,aHE],aHG)
; (UnionL [aHz,aHA,aHD,aHE],aHF)
; (UnionL [aHz,aHA,aHB,aHC],aHD)
; (UnionL [aHz,aHA,aHB,aHG],aHH)

; WANTEDS (Thoralf style)
; (UnionL [aHz,aHA,aHO,UnionL [aHz,aHA,aHP,aHR]],aHH)
; (UnionL [aHz,aHA,UnionL [aHz,aHA,aHO,aHP],aHR],aHF)

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{co_aIi} {2}:: UnionL
;                                a_aHO[tau:1] (UnionL b_aHP[tau:1] c_aHR[tau:1])
;                              ~# abc'_aHH[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      aHO
;      (
;        (_ map either1945926884561676842)
;        aHP
;        aHR))
;    aHH)

;      [WD] hole{co_aIf} {2}:: UnionL
;                                (UnionL a_aHO[tau:1] b_aHP[tau:1]) c_aHR[tau:1]
;                              ~# abc_aHF[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      (
;        (_ map either1945926884561676842)
;        aHO
;        aHP)
;      aHR)
;    aHF)

; GIVENS (names)
;  aHB  <=  a_aHB[sk:1]
;  aHC  <=  b_aHC[sk:1]
;  aHD  <=  ab_aHD[sk:1]
;  aHE  <=  c_aHE[sk:1]
;  aHF  <=  abc_aHF[sk:1]
;  aHG  <=  bc_aHG[sk:1]
;  aHH  <=  abc'_aHH[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaHA)) (y (Maybe SortaHA))) (=> ((_ is (just (SortaHA) (Maybe SortaHA))) x) (= (either1945926884561676842 x y) x))))
; (assert (forall ((y (Maybe SortaHA))) (= (either1945926884561676842 (as nothing (Maybe SortaHA)) y) y)))
; (declare-const aHB (Array SortaHz (Maybe SortaHA)))
; (declare-const aHC (Array SortaHz (Maybe SortaHA)))
; (declare-const aHD (Array SortaHz (Maybe SortaHA)))
; (declare-const aHE (Array SortaHz (Maybe SortaHA)))
; (declare-const aHF (Array SortaHz (Maybe SortaHA)))
; (declare-const aHG (Array SortaHz (Maybe SortaHA)))
; (declare-const aHH (Array SortaHz (Maybe SortaHA)))
; (declare-fun either1945926884561676842 ((Maybe SortaHA) (Maybe SortaHA)) (Maybe SortaHA))
; (declare-sort SortaHA)
; (declare-sort SortaHz)
(declare-sort SortaHz)
(declare-sort SortaHA)
(declare-const
   aHB
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHC
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHD
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHE
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHF
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHG
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHH
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-fun
   either1945926884561676842
   (
     (Maybe SortaHA)
     (Maybe SortaHA))
   (Maybe SortaHA))
(assert
   (forall
      (
        (y
           (Maybe SortaHA)))
      (=
         (either1945926884561676842
            (as
               nothing
               (Maybe SortaHA))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaHA))
        (y
           (Maybe SortaHA)))
      (=>
         (
           (_
              is
              (just
                 (SortaHA)
                 (Maybe SortaHA)))
           x)
         (=
            (either1945926884561676842 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHC
           aHE)
         aHG)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHD
           aHE)
         aHF)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHB
           aHC)
         aHD)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map either1945926884561676842)
           aHB
           aHG)
         aHH)
      :named
      given-4.4))
(check-sat)
; sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{co_aIi} {2}:: UnionL
;                                a_aHO[tau:1] (UnionL b_aHP[tau:1] c_aHR[tau:1])
;                              ~# abc'_aHH[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      aHO
;      (
;        (_ map either1945926884561676842)
;        aHP
;        aHR))
;    aHH)

;      [WD] hole{co_aIf} {2}:: UnionL
;                                (UnionL a_aHO[tau:1] b_aHP[tau:1]) c_aHR[tau:1]
;                              ~# abc_aHF[sk:1] (CNonCanonical)
;  =>  (=
;    (
;      (_ map either1945926884561676842)
;      (
;        (_ map either1945926884561676842)
;        aHO
;        aHP)
;      aHR)
;    aHF)

; WANTEDS (names)
;  aHF  <=  abc_aHF[sk:1]
;  aHH  <=  abc'_aHH[sk:1]
;  aHO  <=  a_aHO[tau:1]
;  aHP  <=  b_aHP[tau:1]
;  aHR  <=  c_aHR[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aHO (Array SortaHz (Maybe SortaHA)))
; (declare-const aHP (Array SortaHz (Maybe SortaHA)))
; (declare-const aHR (Array SortaHz (Maybe SortaHA)))
(declare-const
   aHO
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHP
   (Array
      SortaHz
      (Maybe SortaHA)))
(declare-const
   aHR
   (Array
      SortaHz
      (Maybe SortaHA)))
(assert
   (!
      (or
         (not
            (=
               (
                 (_ map either1945926884561676842)
                 aHO
                 (
                   (_ map either1945926884561676842)
                   aHP
                   aHR))
               aHH))
         (not
            (=
               (
                 (_ map either1945926884561676842)
                 (
                   (_ map either1945926884561676842)
                   aHO
                   aHP)
                 aHR)
               aHF)))
      :named
      wanted-4))
(check-sat)
; sat
(echo "wanteds-finish-cycle-4")
(get-model)
; (
;   (declare-fun
;      SortaHz!val!0
;      ()
;      SortaHz)
;   (forall
;      (
;        (x SortaHz))
;      (= x SortaHz!val!0))
;   (declare-fun
;      SortaHA!val!2
;      ()
;      SortaHA)
;   (declare-fun
;      SortaHA!val!3
;      ()
;      SortaHA)
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
;         (= x SortaHA!val!2)
;         (= x SortaHA!val!3)
;         (= x SortaHA!val!0)
;         (= x SortaHA!val!1)))
;   (define-fun
;      given-4.1
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHC
;           aHE)
;         aHG))
;   (define-fun
;      aHP
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      aHD
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      aHH
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      given-4.4
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHB
;           aHG)
;         aHH))
;   (define-fun
;      given-4.2
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHD
;           aHE)
;         aHF))
;   (define-fun
;      aHB
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      aHO
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      aHR
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!0))
;         SortaHz!val!0
;         (just SortaHA!val!2)))
;   (define-fun
;      aHF
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      aHG
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      aHC
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (store
;         (
;           (as
;              const
;              (Array
;                 SortaHz
;                 (Maybe SortaHA)))
;           (just SortaHA!val!1))
;         SortaHz!val!0
;         (just SortaHA!val!3)))
;   (define-fun
;      given-4.3
;      ()
;      Bool
;      (=
;         (
;           (_ map either1945926884561676842)
;           aHB
;           aHC)
;         aHD))
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
;                      (_ map either1945926884561676842)
;                      aHO
;                      (
;                        (_ map either1945926884561676842)
;                        aHP
;                        aHR))
;                    aHH)))
;           (a!2
;              (not
;                 (=
;                    (
;                      (_ map either1945926884561676842)
;                      (
;                        (_ map either1945926884561676842)
;                        aHO
;                        aHP)
;                      aHR)
;                    aHF))))
;         (or a!1 a!2)))
;   (define-fun
;      aHE
;      ()
;      (Array
;         SortaHz
;         (Maybe SortaHA))
;      (
;        (as
;           const
;           (Array
;              SortaHz
;              (Maybe SortaHA)))
;        nothing))
;   (define-fun
;      either1945926884561676842
;      (
;        (x!0
;           (Maybe SortaHA))
;        (x!1
;           (Maybe SortaHA)))
;      (Maybe SortaHA)
;      (ite
;         (and
;            (=
;               x!0
;               (just SortaHA!val!1))
;            (= x!1 nothing))
;         (just SortaHA!val!1)
;         (ite
;            (and
;               (= x!0 nothing)
;               (=
;                  x!1
;                  (just SortaHA!val!1)))
;            (just SortaHA!val!1)
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
;                        (just SortaHA!val!0)))
;                  (just SortaHA!val!0)
;                  (ite
;                     (and
;                        (= x!0 nothing)
;                        (=
;                           x!1
;                           (just SortaHA!val!3)))
;                     (just SortaHA!val!3)
;                     (ite
;                        (and
;                           (= x!0 nothing)
;                           (=
;                              x!1
;                              (just SortaHA!val!2)))
;                        (just SortaHA!val!2)
;                        (ite
;                           (and
;                              (=
;                                 x!0
;                                 (just SortaHA!val!3))
;                              (= x!1 nothing))
;                           (just SortaHA!val!3)
;                           (ite
;                              (
;                                (_ is just)
;                                x!0)
;                              x!0
;                              x!1))))))))))
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aIQ {2}:: Alter m1_aIC[sk:1] "ok" 2 ~# m2_aID[sk:1] (CEqCan)
; [G] co_aIU {2}:: Alter m2_aID[sk:1] "ok" 2 ~# m3_aIE[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIY} {3}:: Alter m1_aIH[tau:1] "ok" 2
;                         ~# m2_aID[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Natural [],aIC,"ok",2],aID)
; (Alter [Symbol [],Natural [],aID,"ok",2],aIE)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Natural [],aIH,"ok",2],aID)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aIY} {3}:: Alter m1_aIH[tau:1] "ok" 2
;                              ~# m2_aID[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aIH
;       "ok"
;       (just 2))
;    aID)

; GIVENS (names)
;  aIC  <=  m1_aIC[sk:1]
;  aID  <=  m2_aID[sk:1]
;  aIE  <=  m3_aIE[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIC (Array String (Maybe Int)))
; (declare-const aID (Array String (Maybe Int)))
; (declare-const aIE (Array String (Maybe Int)))
(declare-const
   aIC
   (Array
      String
      (Maybe Int)))
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
(assert
   (!
      (=
         (store
            aIC
            "ok"
            (just 2))
         aID)
      :named
      given-6.1))
(assert
   (!
      (=
         (store
            aID
            "ok"
            (just 2))
         aIE)
      :named
      given-6.2))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aIY} {3}:: Alter m1_aIH[tau:1] "ok" 2
;                              ~# m2_aID[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aIH
;       "ok"
;       (just 2))
;    aID)

; WANTEDS (names)
;  aID  <=  m2_aID[sk:1]
;  aIH  <=  m1_aIH[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aIH (Array String (Maybe Int)))
(declare-const
   aIH
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aIH
               "ok"
               (just 2))
            aID))
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
;               aIH
;               "ok"
;               (just 2))
;            aID)))
;   (define-fun
;      aID
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
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (store
;            aID
;            "ok"
;            (just 2))
;         aIE))
;   (define-fun
;      aIC
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
;      given-6.1
;      ()
;      Bool
;      (=
;         (store
;            aIC
;            "ok"
;            (just 2))
;         aID))
;   (define-fun
;      aIH
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
;         nothing)))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] co_aIQ {2}:: Alter m1_aIC[sk:1] "ok" 2 ~# m2_aID[sk:1] (CEqCan)
; [G] co_aIU {2}:: Alter m2_aID[sk:1] "ok" 2 ~# m3_aIE[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aIY} {3}:: Alter m1_aIH[tau:1] "ok" 2
;                         ~# m2_aID[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Natural [],aIC,"ok",2],aID)
; (Alter [Symbol [],Natural [],aID,"ok",2],aIE)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Natural [],aIH,"ok",2],aID)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{co_aIY} {3}:: Alter m1_aIH[tau:1] "ok" 2
;                              ~# m2_aID[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aIH
;       "ok"
;       (just 2))
;    aID)

; GIVENS (names)
;  aIC  <=  m1_aIC[sk:1]
;  aID  <=  m2_aID[sk:1]
;  aIE  <=  m3_aIE[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aIC (Array String (Maybe Int)))
; (declare-const aID (Array String (Maybe Int)))
; (declare-const aIE (Array String (Maybe Int)))
(declare-const
   aIC
   (Array
      String
      (Maybe Int)))
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
(assert
   (!
      (=
         (store
            aIC
            "ok"
            (just 2))
         aID)
      :named
      given-6.1))
(assert
   (!
      (=
         (store
            aID
            "ok"
            (just 2))
         aIE)
      :named
      given-6.2))
(check-sat)
; sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{co_aIY} {3}:: Alter m1_aIH[tau:1] "ok" 2
;                              ~# m2_aID[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aIH
;       "ok"
;       (just 2))
;    aID)

; WANTEDS (names)
;  aID  <=  m2_aID[sk:1]
;  aIH  <=  m1_aIH[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aIH (Array String (Maybe Int)))
(declare-const
   aIH
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (not
         (=
            (store
               aIH
               "ok"
               (just 2))
            aID))
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
;               aIH
;               "ok"
;               (just 2))
;            aID)))
;   (define-fun
;      aID
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
;            (just 3))
;         "ok"
;         (just 2)))
;   (define-fun
;      given-6.2
;      ()
;      Bool
;      (=
;         (store
;            aID
;            "ok"
;            (just 2))
;         aIE))
;   (define-fun
;      aIC
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
;      given-6.1
;      ()
;      Bool
;      (=
;         (store
;            aIC
;            "ok"
;            (just 2))
;         aID))
;   (define-fun
;      aIH
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
;         nothing)))
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-7")
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aJx {2}:: Delete m1_aJi[sk:1] "bob" ~# m2_aJj[sk:1] (CEqCan)
; [G] co_aJB {2}:: Delete m2_aJj[sk:1] "bob" ~# m3_aJk[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJF} {3}:: Delete m1_aJo[tau:1] "bob"
;                         ~# m2_aJj[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aJh,aJi,"bob"],aJj)
; (Delete [Symbol [],aJh,aJj,"bob"],aJk)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aJh,aJo,"bob"],aJj)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aJF} {3}:: Delete m1_aJo[tau:1] "bob"
;                              ~# m2_aJj[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJo
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJh)))
;    aJj)

; GIVENS (names)
;  aJi  <=  m1_aJi[sk:1]
;  aJj  <=  m2_aJj[sk:1]
;  aJk  <=  m3_aJk[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aJi (Array String (Maybe SortaJh)))
; (declare-const aJj (Array String (Maybe SortaJh)))
; (declare-const aJk (Array String (Maybe SortaJh)))
; (declare-sort SortaJh)
(declare-sort SortaJh)
(declare-const
   aJi
   (Array
      String
      (Maybe SortaJh)))
(declare-const
   aJj
   (Array
      String
      (Maybe SortaJh)))
(declare-const
   aJk
   (Array
      String
      (Maybe SortaJh)))
(assert
   (!
      (=
         (store
            aJi
            "bob"
            (as
               nothing
               (Maybe SortaJh)))
         aJj)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aJj
            "bob"
            (as
               nothing
               (Maybe SortaJh)))
         aJk)
      :named
      given-8.2))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aJF} {3}:: Delete m1_aJo[tau:1] "bob"
;                              ~# m2_aJj[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJo
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJh)))
;    aJj)

; WANTEDS (names)
;  aJj  <=  m2_aJj[sk:1]
;  aJo  <=  m1_aJo[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aJo (Array String (Maybe SortaJh)))
(declare-const
   aJo
   (Array
      String
      (Maybe SortaJh)))
(assert
   (!
      (not
         (=
            (store
               aJo
               "bob"
               (as
                  nothing
                  (Maybe SortaJh)))
            aJj))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (declare-fun
;      SortaJh!val!0
;      ()
;      SortaJh)
;   (declare-fun
;      SortaJh!val!2
;      ()
;      SortaJh)
;   (declare-fun
;      SortaJh!val!1
;      ()
;      SortaJh)
;   (forall
;      (
;        (x SortaJh))
;      (or
;         (= x SortaJh!val!0)
;         (= x SortaJh!val!2)
;         (= x SortaJh!val!1)))
;   (define-fun
;      aJi
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJh)))
;           (just SortaJh!val!1))
;         "b"
;         (just SortaJh!val!0)))
;   (define-fun
;      given-8.2
;      ()
;      Bool
;      (=
;         (store aJj "bob" nothing)
;         aJk))
;   (define-fun
;      aJo
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJh)))
;           (just SortaJh!val!2))
;         "b"
;         nothing))
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store aJo "bob" nothing)
;            aJj)))
;   (define-fun
;      aJj
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJh)))
;              (just SortaJh!val!1))
;            "bob"
;            nothing)
;         "b"
;         (just SortaJh!val!0)))
;   (define-fun
;      aJk
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJh)))
;              (just SortaJh!val!1))
;            "bob"
;            nothing)
;         "b"
;         (just SortaJh!val!0)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (store aJi "bob" nothing)
;         aJj)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] co_aJx {2}:: Delete m1_aJi[sk:1] "bob" ~# m2_aJj[sk:1] (CEqCan)
; [G] co_aJB {2}:: Delete m2_aJj[sk:1] "bob" ~# m3_aJk[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aJF} {3}:: Delete m1_aJo[tau:1] "bob"
;                         ~# m2_aJj[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aJh,aJi,"bob"],aJj)
; (Delete [Symbol [],aJh,aJj,"bob"],aJk)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],aJh,aJo,"bob"],aJj)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_aJF} {3}:: Delete m1_aJo[tau:1] "bob"
;                              ~# m2_aJj[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJo
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJh)))
;    aJj)

; GIVENS (names)
;  aJi  <=  m1_aJi[sk:1]
;  aJj  <=  m2_aJj[sk:1]
;  aJk  <=  m3_aJk[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aJi (Array String (Maybe SortaJh)))
; (declare-const aJj (Array String (Maybe SortaJh)))
; (declare-const aJk (Array String (Maybe SortaJh)))
; (declare-sort SortaJh)
(declare-sort SortaJh)
(declare-const
   aJi
   (Array
      String
      (Maybe SortaJh)))
(declare-const
   aJj
   (Array
      String
      (Maybe SortaJh)))
(declare-const
   aJk
   (Array
      String
      (Maybe SortaJh)))
(assert
   (!
      (=
         (store
            aJi
            "bob"
            (as
               nothing
               (Maybe SortaJh)))
         aJj)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            aJj
            "bob"
            (as
               nothing
               (Maybe SortaJh)))
         aJk)
      :named
      given-8.2))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_aJF} {3}:: Delete m1_aJo[tau:1] "bob"
;                              ~# m2_aJj[sk:1] (CNonCanonical)
;  =>  (=
;    (store
;       aJo
;       "bob"
;       (as
;          nothing
;          (Maybe SortaJh)))
;    aJj)

; WANTEDS (names)
;  aJj  <=  m2_aJj[sk:1]
;  aJo  <=  m1_aJo[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (declare-const aJo (Array String (Maybe SortaJh)))
(declare-const
   aJo
   (Array
      String
      (Maybe SortaJh)))
(assert
   (!
      (not
         (=
            (store
               aJo
               "bob"
               (as
                  nothing
                  (Maybe SortaJh)))
            aJj))
      :named
      wanted-8))
(check-sat)
; sat
(echo "wanteds-finish-cycle-8")
(get-model)
; (
;   (declare-fun
;      SortaJh!val!0
;      ()
;      SortaJh)
;   (declare-fun
;      SortaJh!val!2
;      ()
;      SortaJh)
;   (declare-fun
;      SortaJh!val!1
;      ()
;      SortaJh)
;   (forall
;      (
;        (x SortaJh))
;      (or
;         (= x SortaJh!val!0)
;         (= x SortaJh!val!2)
;         (= x SortaJh!val!1)))
;   (define-fun
;      aJi
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJh)))
;           (just SortaJh!val!1))
;         "b"
;         (just SortaJh!val!0)))
;   (define-fun
;      given-8.2
;      ()
;      Bool
;      (=
;         (store aJj "bob" nothing)
;         aJk))
;   (define-fun
;      aJo
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (
;           (as
;              const
;              (Array
;                 String
;                 (Maybe SortaJh)))
;           (just SortaJh!val!2))
;         "b"
;         nothing))
;   (define-fun
;      wanted-8
;      ()
;      Bool
;      (not
;         (=
;            (store aJo "bob" nothing)
;            aJj)))
;   (define-fun
;      aJj
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJh)))
;              (just SortaJh!val!1))
;            "bob"
;            nothing)
;         "b"
;         (just SortaJh!val!0)))
;   (define-fun
;      aJk
;      ()
;      (Array
;         String
;         (Maybe SortaJh))
;      (store
;         (store
;            (
;              (as
;                 const
;                 (Array
;                    String
;                    (Maybe SortaJh)))
;              (just SortaJh!val!1))
;            "bob"
;            nothing)
;         "b"
;         (just SortaJh!val!0)))
;   (define-fun
;      given-8.1
;      ()
;      Bool
;      (=
;         (store aJi "bob" nothing)
;         aJj)))
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_aL2} {1}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                         ~# Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Natural [],Symbol [],Alter [Natural [],Symbol [],Nil [Natural [],Symbol []],1,"ok"],2,"hi"],Alter [Natural [],Symbol [],Alter [Natural [],Symbol [],Nil [Natural [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_aL2} {1}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
;      [WD] hole{co_aL2} {1}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
; [G] co_aLa {1}:: IntersectL b_aJX[sk:1] c_aJZ[sk:1]
;                  ~# bc_aK1[sk:1] (CEqCan)
; [G] co_aL7 {1}:: IntersectL ab_aJY[sk:1] c_aJZ[sk:1]
;                  ~# abc_aK0[sk:1] (CEqCan)
; [G] co_aL4 {1}:: IntersectL a_aJW[sk:1] b_aJX[sk:1]
;                  ~# ab_aJY[sk:1] (CEqCan)
; [G] co_aLd {1}:: IntersectL a_aJW[sk:1] bc_aK1[sk:1]
;                  ~# abc'_aK2[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aK9} {0}:: abc_aK0[sk:1]
;                         ~# abc'_aK2[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [aJU,aJV,aJX,aJZ],aK1)
; (IntersectL [aJU,aJV,aJY,aJZ],aK0)
; (IntersectL [aJU,aJV,aJW,aJX],aJY)
; (IntersectL [aJU,aJV,aJW,aK1],aK2)

; WANTEDS (Thoralf style)
; (aK0,aK2)

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_aK9} {0}:: abc_aK0[sk:1]
;                              ~# abc'_aK2[sk:1] (CNonCanonical)
;  =>  (= aK0 aK2)

; GIVENS (names)
;  aJW  <=  a_aJW[sk:1]
;  aJX  <=  b_aJX[sk:1]
;  aJY  <=  ab_aJY[sk:1]
;  aJZ  <=  c_aJZ[sk:1]
;  aK0  <=  abc_aK0[sk:1]
;  aK1  <=  bc_aK1[sk:1]
;  aK2  <=  abc'_aK2[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaJV)) (y (Maybe SortaJV))) (=> (and ((_ is (just (SortaJV) (Maybe SortaJV))) x) ((_ is (just (SortaJV) (Maybe SortaJV))) y)) (= (both1944001639701057837 x y) x))))
; (assert (forall ((y (Maybe SortaJV))) (= (both1944001639701057837 nothing y) nothing)))
; (assert (forall ((y (Maybe SortaJV))) (= (both1944001639701057837 y (as nothing (Maybe SortaJV))) (as nothing (Maybe SortaJV)))))
; (declare-const aJW (Array SortaJU (Maybe SortaJV)))
; (declare-const aJX (Array SortaJU (Maybe SortaJV)))
; (declare-const aJY (Array SortaJU (Maybe SortaJV)))
; (declare-const aJZ (Array SortaJU (Maybe SortaJV)))
; (declare-const aK0 (Array SortaJU (Maybe SortaJV)))
; (declare-const aK1 (Array SortaJU (Maybe SortaJV)))
; (declare-const aK2 (Array SortaJU (Maybe SortaJV)))
; (declare-fun both1944001639701057837 ((Maybe SortaJV) (Maybe SortaJV)) (Maybe SortaJV))
; (declare-sort SortaJU)
; (declare-sort SortaJV)
(declare-sort SortaJU)
(declare-sort SortaJV)
(declare-const
   aJW
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-const
   aJX
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-const
   aJY
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-const
   aJZ
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-const
   aK0
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-const
   aK1
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-const
   aK2
   (Array
      SortaJU
      (Maybe SortaJV)))
(declare-fun
   both1944001639701057837
   (
     (Maybe SortaJV)
     (Maybe SortaJV))
   (Maybe SortaJV))
(assert
   (forall
      (
        (y
           (Maybe SortaJV)))
      (=
         (both1944001639701057837
            y
            (as
               nothing
               (Maybe SortaJV)))
         (as
            nothing
            (Maybe SortaJV)))))
(assert
   (forall
      (
        (y
           (Maybe SortaJV)))
      (=
         (both1944001639701057837 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe SortaJV))
        (y
           (Maybe SortaJV)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (SortaJV)
                    (Maybe SortaJV)))
              x)
            (
              (_
                 is
                 (just
                    (SortaJV)
                    (Maybe SortaJV)))
              y))
         (=
            (both1944001639701057837 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both1944001639701057837)
           aJX
           aJZ)
         aK1)
      :named
      given-11.1))
(assert
   (!
      (=
         (
           (_ map both1944001639701057837)
           aJY
           aJZ)
         aK0)
      :named
      given-11.2))
(assert
   (!
      (=
         (
           (_ map both1944001639701057837)
           aJW
           aJX)
         aJY)
      :named
      given-11.3))
(assert
   (!
      (=
         (
           (_ map both1944001639701057837)
           aJW
           aK1)
         aK2)
      :named
      given-11.4))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_aK9} {0}:: abc_aK0[sk:1]
;                              ~# abc'_aK2[sk:1] (CNonCanonical)
;  =>  (= aK0 aK2)

; WANTEDS (names)
;  aK0  <=  abc_aK0[sk:1]
;  aK2  <=  abc'_aK2[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aK0 aK2))
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
;           (Maybe SortaJV)))
;      (=
;         (both1944001639701057837
;            y
;            (as
;               nothing
;               (Maybe SortaJV)))
;         (as
;            nothing
;            (Maybe SortaJV))))
;   (forall
;      (
;        (y
;           (Maybe SortaJV)))
;      (=
;         (both1944001639701057837 nothing y)
;         nothing))
;   (forall
;      (
;        (x
;           (Maybe SortaJV))
;        (y
;           (Maybe SortaJV)))
;      (=>
;         (and
;            (
;              (_
;                 is
;                 (just
;                    (SortaJV)
;                    (Maybe SortaJV)))
;              x)
;            (
;              (_
;                 is
;                 (just
;                    (SortaJV)
;                    (Maybe SortaJV)))
;              y))
;         (=
;            (both1944001639701057837 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map both1944001639701057837)
;           aJX
;           aJZ)
;         aK1)
;      :named
;      given-11.1)
;   (!
;      (=
;         (
;           (_ map both1944001639701057837)
;           aJY
;           aJZ)
;         aK0)
;      :named
;      given-11.2)
;   (!
;      (=
;         (
;           (_ map both1944001639701057837)
;           aJW
;           aJX)
;         aJY)
;      :named
;      given-11.3)
;   (!
;      (=
;         (
;           (_ map both1944001639701057837)
;           aJW
;           aK1)
;         aK2)
;      :named
;      given-11.4)
;   (!
;      (not
;         (= aK0 aK2))
;      :named
;      wanted-11))
(get-unsat-core)
; (given-11.2 given-11.3 given-11.4 wanted-11 given-11.1)
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
; [G] co_aLm {1}:: UnionL b_aKf[sk:1] c_aKh[sk:1]
;                  ~# bc_aKj[sk:1] (CEqCan)
; [G] co_aLj {1}:: UnionL ab_aKg[sk:1] c_aKh[sk:1]
;                  ~# abc_aKi[sk:1] (CEqCan)
; [G] co_aLg {1}:: UnionL a_aKe[sk:1] b_aKf[sk:1]
;                  ~# ab_aKg[sk:1] (CEqCan)
; [G] co_aLp {1}:: UnionL a_aKe[sk:1] bc_aKj[sk:1]
;                  ~# abc'_aKk[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKr} {0}:: abc_aKi[sk:1]
;                         ~# abc'_aKk[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [aKc,aKd,aKf,aKh],aKj)
; (UnionL [aKc,aKd,aKg,aKh],aKi)
; (UnionL [aKc,aKd,aKe,aKf],aKg)
; (UnionL [aKc,aKd,aKe,aKj],aKk)

; WANTEDS (Thoralf style)
; (aKi,aKk)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_aKr} {0}:: abc_aKi[sk:1]
;                              ~# abc'_aKk[sk:1] (CNonCanonical)
;  =>  (= aKi aKk)

; GIVENS (names)
;  aKe  <=  a_aKe[sk:1]
;  aKf  <=  b_aKf[sk:1]
;  aKg  <=  ab_aKg[sk:1]
;  aKh  <=  c_aKh[sk:1]
;  aKi  <=  abc_aKi[sk:1]
;  aKj  <=  bc_aKj[sk:1]
;  aKk  <=  abc'_aKk[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (forall ((x (Maybe SortaKd)) (y (Maybe SortaKd))) (=> ((_ is (just (SortaKd) (Maybe SortaKd))) x) (= (either1945079161096515386 x y) x))))
; (assert (forall ((y (Maybe SortaKd))) (= (either1945079161096515386 (as nothing (Maybe SortaKd)) y) y)))
; (declare-const aKe (Array SortaKc (Maybe SortaKd)))
; (declare-const aKf (Array SortaKc (Maybe SortaKd)))
; (declare-const aKg (Array SortaKc (Maybe SortaKd)))
; (declare-const aKh (Array SortaKc (Maybe SortaKd)))
; (declare-const aKi (Array SortaKc (Maybe SortaKd)))
; (declare-const aKj (Array SortaKc (Maybe SortaKd)))
; (declare-const aKk (Array SortaKc (Maybe SortaKd)))
; (declare-fun either1945079161096515386 ((Maybe SortaKd) (Maybe SortaKd)) (Maybe SortaKd))
; (declare-sort SortaKc)
; (declare-sort SortaKd)
(declare-sort SortaKc)
(declare-sort SortaKd)
(declare-const
   aKe
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-const
   aKf
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-const
   aKg
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-const
   aKh
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-const
   aKi
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-const
   aKj
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-const
   aKk
   (Array
      SortaKc
      (Maybe SortaKd)))
(declare-fun
   either1945079161096515386
   (
     (Maybe SortaKd)
     (Maybe SortaKd))
   (Maybe SortaKd))
(assert
   (forall
      (
        (y
           (Maybe SortaKd)))
      (=
         (either1945079161096515386
            (as
               nothing
               (Maybe SortaKd))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe SortaKd))
        (y
           (Maybe SortaKd)))
      (=>
         (
           (_
              is
              (just
                 (SortaKd)
                 (Maybe SortaKd)))
           x)
         (=
            (either1945079161096515386 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either1945079161096515386)
           aKf
           aKh)
         aKj)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map either1945079161096515386)
           aKg
           aKh)
         aKi)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map either1945079161096515386)
           aKe
           aKf)
         aKg)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map either1945079161096515386)
           aKe
           aKj)
         aKk)
      :named
      given-13.4))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_aKr} {0}:: abc_aKi[sk:1]
;                              ~# abc'_aKk[sk:1] (CNonCanonical)
;  =>  (= aKi aKk)

; WANTEDS (names)
;  aKi  <=  abc_aKi[sk:1]
;  aKk  <=  abc'_aKk[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aKi aKk))
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
;           (Maybe SortaKd)))
;      (=
;         (either1945079161096515386
;            (as
;               nothing
;               (Maybe SortaKd))
;            y)
;         y))
;   (forall
;      (
;        (x
;           (Maybe SortaKd))
;        (y
;           (Maybe SortaKd)))
;      (=>
;         (
;           (_
;              is
;              (just
;                 (SortaKd)
;                 (Maybe SortaKd)))
;           x)
;         (=
;            (either1945079161096515386 x y)
;            x)))
;   (!
;      (=
;         (
;           (_ map either1945079161096515386)
;           aKf
;           aKh)
;         aKj)
;      :named
;      given-13.1)
;   (!
;      (=
;         (
;           (_ map either1945079161096515386)
;           aKg
;           aKh)
;         aKi)
;      :named
;      given-13.2)
;   (!
;      (=
;         (
;           (_ map either1945079161096515386)
;           aKe
;           aKf)
;         aKg)
;      :named
;      given-13.3)
;   (!
;      (=
;         (
;           (_ map either1945079161096515386)
;           aKe
;           aKj)
;         aKk)
;      :named
;      given-13.4)
;   (!
;      (not
;         (= aKi aKk))
;      :named
;      wanted-13))
(get-unsat-core)
; (given-13.4 wanted-13 given-13.1 given-13.2 given-13.3)
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
; [G] co_aLt {2}:: Alter m1_aKu[sk:1] "ok" 2 ~# m2_aKv[sk:1] (CEqCan)
; [G] co_aLx {2}:: Alter m2_aKv[sk:1] "ok" 2 ~# m3_aKw[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKB} {0}:: m2_aKv[sk:1]
;                         ~# m3_aKw[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Natural [],aKu,"ok",2],aKv)
; (Alter [Symbol [],Natural [],aKv,"ok",2],aKw)

; WANTEDS (Thoralf style)
; (aKv,aKw)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{co_aKB} {0}:: m2_aKv[sk:1]
;                              ~# m3_aKw[sk:1] (CNonCanonical)
;  =>  (= aKv aKw)

; GIVENS (names)
;  aKu  <=  m1_aKu[sk:1]
;  aKv  <=  m2_aKv[sk:1]
;  aKw  <=  m3_aKw[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aKu (Array String (Maybe Int)))
; (declare-const aKv (Array String (Maybe Int)))
; (declare-const aKw (Array String (Maybe Int)))
(declare-const
   aKu
   (Array
      String
      (Maybe Int)))
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
(assert
   (!
      (=
         (store
            aKu
            "ok"
            (just 2))
         aKv)
      :named
      given-15.1))
(assert
   (!
      (=
         (store
            aKv
            "ok"
            (just 2))
         aKw)
      :named
      given-15.2))
(check-sat)
; sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{co_aKB} {0}:: m2_aKv[sk:1]
;                              ~# m3_aKw[sk:1] (CNonCanonical)
;  =>  (= aKv aKw)

; WANTEDS (names)
;  aKv  <=  m2_aKv[sk:1]
;  aKw  <=  m3_aKw[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aKv aKw))
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
;            aKu
;            "ok"
;            (just 2))
;         aKv)
;      :named
;      given-15.1)
;   (!
;      (=
;         (store
;            aKv
;            "ok"
;            (just 2))
;         aKw)
;      :named
;      given-15.2)
;   (!
;      (not
;         (= aKv aKw))
;      :named
;      wanted-15))
(get-unsat-core)
; (given-15.1 given-15.2 wanted-15)
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
; [G] co_aLB {2}:: Delete m1_aKF[sk:1] "bob" ~# m2_aKG[sk:1] (CEqCan)
; [G] co_aLF {2}:: Delete m2_aKG[sk:1] "bob" ~# m3_aKH[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_aKM} {0}:: m2_aKG[sk:1]
;                         ~# m3_aKH[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],aKE,aKF,"bob"],aKG)
; (Delete [Symbol [],aKE,aKG,"bob"],aKH)

; WANTEDS (Thoralf style)
; (aKG,aKH)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{co_aKM} {0}:: m2_aKG[sk:1]
;                              ~# m3_aKH[sk:1] (CNonCanonical)
;  =>  (= aKG aKH)

; GIVENS (names)
;  aKF  <=  m1_aKF[sk:1]
;  aKG  <=  m2_aKG[sk:1]
;  aKH  <=  m3_aKH[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const aKF (Array String (Maybe SortaKE)))
; (declare-const aKG (Array String (Maybe SortaKE)))
; (declare-const aKH (Array String (Maybe SortaKE)))
; (declare-sort SortaKE)
(declare-sort SortaKE)
(declare-const
   aKF
   (Array
      String
      (Maybe SortaKE)))
(declare-const
   aKG
   (Array
      String
      (Maybe SortaKE)))
(declare-const
   aKH
   (Array
      String
      (Maybe SortaKE)))
(assert
   (!
      (=
         (store
            aKF
            "bob"
            (as
               nothing
               (Maybe SortaKE)))
         aKG)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            aKG
            "bob"
            (as
               nothing
               (Maybe SortaKE)))
         aKH)
      :named
      given-17.2))
(check-sat)
; sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{co_aKM} {0}:: m2_aKG[sk:1]
;                              ~# m3_aKH[sk:1] (CNonCanonical)
;  =>  (= aKG aKH)

; WANTEDS (names)
;  aKG  <=  m2_aKG[sk:1]
;  aKH  <=  m3_aKH[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= aKG aKH))
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
;            aKF
;            "bob"
;            (as
;               nothing
;               (Maybe SortaKE)))
;         aKG)
;      :named
;      given-17.1)
;   (!
;      (=
;         (store
;            aKG
;            "bob"
;            (as
;               nothing
;               (Maybe SortaKE)))
;         aKH)
;      :named
;      given-17.2)
;   (!
;      (not
;         (= aKG aKH))
;      :named
;      wanted-17))
(get-unsat-core)
; (given-17.2 wanted-17 given-17.1)
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
; [WD] hole{co_a1yk} {0}:: (b_a1yh[tau:1] <? c_a1yi[tau:1])
;                          ~# (b_a1ye[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yj} {0}:: (a_a1yg[tau:1] <? b_a1yh[tau:1])
;                          ~# (a_a1yd[sk:1] <? b_a1ye[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yl} {0}:: (a_a1yg[tau:1] <? c_a1yi[tau:1])
;                          ~# (a_a1yd[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a1yh,a1yi],<? [a1ye,a1yf])
; (<? [a1yg,a1yh],<? [a1yd,a1ye])
; (<? [a1yg,a1yi],<? [a1yd,a1yf])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1yk} {0}:: (b_a1yh[tau:1] <? c_a1yi[tau:1])
;                               ~# (b_a1ye[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1yj} {0}:: (a_a1yg[tau:1] <? b_a1yh[tau:1])
;                               ~# (a_a1yd[sk:1] <? b_a1ye[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yh)
;    (< a1yd a1ye))

;      [WD] hole{co_a1yl} {0}:: (a_a1yg[tau:1] <? c_a1yi[tau:1])
;                               ~# (a_a1yd[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yi)
;    (< a1yd a1yf))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1yk} {0}:: (b_a1yh[tau:1] <? c_a1yi[tau:1])
;                               ~# (b_a1ye[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1yj} {0}:: (a_a1yg[tau:1] <? b_a1yh[tau:1])
;                               ~# (a_a1yd[sk:1] <? b_a1ye[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yh)
;    (< a1yd a1ye))

;      [WD] hole{co_a1yl} {0}:: (a_a1yg[tau:1] <? c_a1yi[tau:1])
;                               ~# (a_a1yd[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yi)
;    (< a1yd a1yf))

; WANTEDS (names)
;  a1yd  <=  a_a1yd[sk:1]
;  a1ye  <=  b_a1ye[sk:1]
;  a1yf  <=  c_a1yf[sk:1]
;  a1yg  <=  a_a1yg[tau:1]
;  a1yh  <=  b_a1yh[tau:1]
;  a1yi  <=  c_a1yi[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1yd))
; (assert (<= 0 a1ye))
; (assert (<= 0 a1yf))
; (assert (<= 0 a1yg))
; (assert (<= 0 a1yh))
; (assert (<= 0 a1yi))
; (declare-const a1yd Int)
; (declare-const a1ye Int)
; (declare-const a1yf Int)
; (declare-const a1yg Int)
; (declare-const a1yh Int)
; (declare-const a1yi Int)
(declare-const a1yd Int)
(declare-const a1ye Int)
(declare-const a1yf Int)
(declare-const a1yg Int)
(declare-const a1yh Int)
(declare-const a1yi Int)
(assert
   (<= 0 a1yd))
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
   (!
      (or
         (or
            (not
               (=
                  (< a1yh a1yi)
                  (< a1ye a1yf)))
            (not
               (=
                  (< a1yg a1yh)
                  (< a1yd a1ye))))
         (not
            (=
               (< a1yg a1yi)
               (< a1yd a1yf))))
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
;               (< a1yh a1yi)
;               (< a1ye a1yf)))
;         (not
;            (=
;               (< a1yg a1yh)
;               (< a1yd a1ye)))
;         (not
;            (=
;               (< a1yg a1yi)
;               (< a1yd a1yf)))))
;   (define-fun
;      a1yf
;      ()
;      Int
;      1)
;   (define-fun
;      a1yh
;      ()
;      Int
;      0)
;   (define-fun
;      a1yi
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
;      0)
;   (define-fun
;      a1yd
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1yk} {0}:: (b_a1yh[tau:1] <? c_a1yi[tau:1])
;                          ~# (b_a1ye[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yj} {0}:: (a_a1yg[tau:1] <? b_a1yh[tau:1])
;                          ~# (a_a1yd[sk:1] <? b_a1ye[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yl} {0}:: (a_a1yg[tau:1] <? c_a1yi[tau:1])
;                          ~# (a_a1yd[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a1yh,a1yi],<? [a1ye,a1yf])
; (<? [a1yg,a1yh],<? [a1yd,a1ye])
; (<? [a1yg,a1yi],<? [a1yd,a1yf])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{co_a1yk} {0}:: (b_a1yh[tau:1] <? c_a1yi[tau:1])
;                               ~# (b_a1ye[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1yj} {0}:: (a_a1yg[tau:1] <? b_a1yh[tau:1])
;                               ~# (a_a1yd[sk:1] <? b_a1ye[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yh)
;    (< a1yd a1ye))

;      [WD] hole{co_a1yl} {0}:: (a_a1yg[tau:1] <? c_a1yi[tau:1])
;                               ~# (a_a1yd[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yi)
;    (< a1yd a1yf))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{co_a1yk} {0}:: (b_a1yh[tau:1] <? c_a1yi[tau:1])
;                               ~# (b_a1ye[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yh a1yi)
;    (< a1ye a1yf))

;      [WD] hole{co_a1yj} {0}:: (a_a1yg[tau:1] <? b_a1yh[tau:1])
;                               ~# (a_a1yd[sk:1] <? b_a1ye[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yh)
;    (< a1yd a1ye))

;      [WD] hole{co_a1yl} {0}:: (a_a1yg[tau:1] <? c_a1yi[tau:1])
;                               ~# (a_a1yd[sk:1] <? c_a1yf[sk:1]) (CNonCanonical)
;  =>  (=
;    (< a1yg a1yi)
;    (< a1yd a1yf))

; WANTEDS (names)
;  a1yd  <=  a_a1yd[sk:1]
;  a1ye  <=  b_a1ye[sk:1]
;  a1yf  <=  c_a1yf[sk:1]
;  a1yg  <=  a_a1yg[tau:1]
;  a1yh  <=  b_a1yh[tau:1]
;  a1yi  <=  c_a1yi[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1yd))
; (assert (<= 0 a1ye))
; (assert (<= 0 a1yf))
; (assert (<= 0 a1yg))
; (assert (<= 0 a1yh))
; (assert (<= 0 a1yi))
; (declare-const a1yd Int)
; (declare-const a1ye Int)
; (declare-const a1yf Int)
; (declare-const a1yg Int)
; (declare-const a1yh Int)
; (declare-const a1yi Int)
(declare-const a1yd Int)
(declare-const a1ye Int)
(declare-const a1yf Int)
(declare-const a1yg Int)
(declare-const a1yh Int)
(declare-const a1yi Int)
(assert
   (<= 0 a1yd))
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
   (!
      (or
         (or
            (not
               (=
                  (< a1yh a1yi)
                  (< a1ye a1yf)))
            (not
               (=
                  (< a1yg a1yh)
                  (< a1yd a1ye))))
         (not
            (=
               (< a1yg a1yi)
               (< a1yd a1yf))))
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
;               (< a1yh a1yi)
;               (< a1ye a1yf)))
;         (not
;            (=
;               (< a1yg a1yh)
;               (< a1yd a1ye)))
;         (not
;            (=
;               (< a1yg a1yi)
;               (< a1yd a1yf)))))
;   (define-fun
;      a1yf
;      ()
;      Int
;      1)
;   (define-fun
;      a1yh
;      ()
;      Int
;      0)
;   (define-fun
;      a1yi
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
;      0)
;   (define-fun
;      a1yd
;      ()
;      Int
;      0))
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1yR} {0}:: (a_a1yP[tau:1] + b_a1yQ[tau:1])
;                          ~# (a_a1yN[sk:1] + b_a1yO[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yS} {0}:: (b_a1yQ[tau:1] + a_a1yP[tau:1])
;                          ~# (b_a1yO[sk:1] + a_a1yN[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1yP,a1yQ],+ [a1yN,a1yO])
; (+ [a1yQ,a1yP],+ [a1yO,a1yN])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1yR} {0}:: (a_a1yP[tau:1] + b_a1yQ[tau:1])
;                               ~# (a_a1yN[sk:1] + b_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yP a1yQ)
;    (+ a1yN a1yO))

;      [WD] hole{co_a1yS} {0}:: (b_a1yQ[tau:1] + a_a1yP[tau:1])
;                               ~# (b_a1yO[sk:1] + a_a1yN[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yP)
;    (+ a1yO a1yN))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1yR} {0}:: (a_a1yP[tau:1] + b_a1yQ[tau:1])
;                               ~# (a_a1yN[sk:1] + b_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yP a1yQ)
;    (+ a1yN a1yO))

;      [WD] hole{co_a1yS} {0}:: (b_a1yQ[tau:1] + a_a1yP[tau:1])
;                               ~# (b_a1yO[sk:1] + a_a1yN[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yP)
;    (+ a1yO a1yN))

; WANTEDS (names)
;  a1yN  <=  a_a1yN[sk:1]
;  a1yO  <=  b_a1yO[sk:1]
;  a1yP  <=  a_a1yP[tau:1]
;  a1yQ  <=  b_a1yQ[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1yN))
; (assert (<= 0 a1yO))
; (assert (<= 0 a1yP))
; (assert (<= 0 a1yQ))
; (declare-const a1yN Int)
; (declare-const a1yO Int)
; (declare-const a1yP Int)
; (declare-const a1yQ Int)
(declare-const a1yN Int)
(declare-const a1yO Int)
(declare-const a1yP Int)
(declare-const a1yQ Int)
(assert
   (<= 0 a1yN))
(assert
   (<= 0 a1yO))
(assert
   (<= 0 a1yP))
(assert
   (<= 0 a1yQ))
(assert
   (!
      (or
         (not
            (=
               (+ a1yP a1yQ)
               (+ a1yN a1yO)))
         (not
            (=
               (+ a1yQ a1yP)
               (+ a1yO a1yN))))
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
;      0)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a1yP a1yQ)
;               (+ a1yN a1yO)))
;         (not
;            (=
;               (+ a1yQ a1yP)
;               (+ a1yO a1yN)))))
;   (define-fun
;      a1yN
;      ()
;      Int
;      0)
;   (define-fun
;      a1yO
;      ()
;      Int
;      0)
;   (define-fun
;      a1yP
;      ()
;      Int
;      1))
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{co_a1yR} {0}:: (a_a1yP[tau:1] + b_a1yQ[tau:1])
;                          ~# (a_a1yN[sk:1] + b_a1yO[sk:1]) (CNonCanonical)
; [WD] hole{co_a1yS} {0}:: (b_a1yQ[tau:1] + a_a1yP[tau:1])
;                          ~# (b_a1yO[sk:1] + a_a1yN[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1yP,a1yQ],+ [a1yN,a1yO])
; (+ [a1yQ,a1yP],+ [a1yO,a1yN])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{co_a1yR} {0}:: (a_a1yP[tau:1] + b_a1yQ[tau:1])
;                               ~# (a_a1yN[sk:1] + b_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yP a1yQ)
;    (+ a1yN a1yO))

;      [WD] hole{co_a1yS} {0}:: (b_a1yQ[tau:1] + a_a1yP[tau:1])
;                               ~# (b_a1yO[sk:1] + a_a1yN[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yP)
;    (+ a1yO a1yN))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{co_a1yR} {0}:: (a_a1yP[tau:1] + b_a1yQ[tau:1])
;                               ~# (a_a1yN[sk:1] + b_a1yO[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yP a1yQ)
;    (+ a1yN a1yO))

;      [WD] hole{co_a1yS} {0}:: (b_a1yQ[tau:1] + a_a1yP[tau:1])
;                               ~# (b_a1yO[sk:1] + a_a1yN[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1yQ a1yP)
;    (+ a1yO a1yN))

; WANTEDS (names)
;  a1yN  <=  a_a1yN[sk:1]
;  a1yO  <=  b_a1yO[sk:1]
;  a1yP  <=  a_a1yP[tau:1]
;  a1yQ  <=  b_a1yQ[tau:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1yN))
; (assert (<= 0 a1yO))
; (assert (<= 0 a1yP))
; (assert (<= 0 a1yQ))
; (declare-const a1yN Int)
; (declare-const a1yO Int)
; (declare-const a1yP Int)
; (declare-const a1yQ Int)
(declare-const a1yN Int)
(declare-const a1yO Int)
(declare-const a1yP Int)
(declare-const a1yQ Int)
(assert
   (<= 0 a1yN))
(assert
   (<= 0 a1yO))
(assert
   (<= 0 a1yP))
(assert
   (<= 0 a1yQ))
(assert
   (!
      (or
         (not
            (=
               (+ a1yP a1yQ)
               (+ a1yN a1yO)))
         (not
            (=
               (+ a1yQ a1yP)
               (+ a1yO a1yN))))
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
;      0)
;   (define-fun
;      wanted-3
;      ()
;      Bool
;      (or
;         (not
;            (=
;               (+ a1yP a1yQ)
;               (+ a1yN a1yO)))
;         (not
;            (=
;               (+ a1yQ a1yP)
;               (+ a1yO a1yN)))))
;   (define-fun
;      a1yN
;      ()
;      Int
;      0)
;   (define-fun
;      a1yO
;      ()
;      Int
;      0)
;   (define-fun
;      a1yP
;      ()
;      Int
;      1))
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
; [G] co_a1Fz {1}:: (1 + n_a1zr[ssk:2]) ~# n_a1zf[sk:1] (CEqCan)
; [G] co_a1FA {1}:: (1 + n_a1zt[ssk:3]) ~# m_a1zg[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1zB} {0}:: (n_a1zt[ssk:3] - n_a1zr[ssk:2])
;                          ~# (m_a1zg[sk:1] - n_a1zf[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a1zr],a1zf)
; (+ [1,a1zt],a1zg)

; WANTEDS (Thoralf style)
; (- [a1zt,a1zr],- [a1zg,a1zf])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{co_a1zB} {0}:: (n_a1zt[ssk:3] - n_a1zr[ssk:2])
;                               ~# (m_a1zg[sk:1] - n_a1zf[sk:1]) (CNonCanonical)
;  =>  (=
;    (- a1zt a1zr)
;    (- a1zg a1zf))

; GIVENS (names)
;  a1zf  <=  n_a1zf[sk:1]
;  a1zg  <=  m_a1zg[sk:1]
;  a1zr  <=  n_a1zr[ssk:2]
;  a1zt  <=  n_a1zt[ssk:3]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1zf))
; (assert (<= 0 a1zg))
; (assert (<= 0 a1zr))
; (assert (<= 0 a1zt))
; (declare-const a1zf Int)
; (declare-const a1zg Int)
; (declare-const a1zr Int)
; (declare-const a1zt Int)
(declare-const a1zf Int)
(declare-const a1zg Int)
(declare-const a1zr Int)
(declare-const a1zt Int)
(assert
   (<= 0 a1zf))
(assert
   (<= 0 a1zg))
(assert
   (<= 0 a1zr))
(assert
   (<= 0 a1zt))
(assert
   (!
      (=
         (+ 1 a1zr)
         a1zf)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a1zt)
         a1zg)
      :named
      given-9.2))
(check-sat)
; sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{co_a1zB} {0}:: (n_a1zt[ssk:3] - n_a1zr[ssk:2])
;                               ~# (m_a1zg[sk:1] - n_a1zf[sk:1]) (CNonCanonical)
;  =>  (=
;    (- a1zt a1zr)
;    (- a1zg a1zf))

; WANTEDS (names)
;  a1zf  <=  n_a1zf[sk:1]
;  a1zg  <=  m_a1zg[sk:1]
;  a1zr  <=  n_a1zr[ssk:2]
;  a1zt  <=  n_a1zt[ssk:3]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (- a1zt a1zr)
            (- a1zg a1zf)))
      :named
      wanted-9))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-9")
(get-assertions)
; (
;   (<= 0 a1zf)
;   (<= 0 a1zg)
;   (<= 0 a1zr)
;   (<= 0 a1zt)
;   (!
;      (=
;         (+ 1 a1zr)
;         a1zf)
;      :named
;      given-9.1)
;   (!
;      (=
;         (+ 1 a1zt)
;         a1zg)
;      :named
;      given-9.2)
;   (!
;      (not
;         (=
;            (- a1zt a1zr)
;            (- a1zg a1zf)))
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
; [G] co_a1FI {1}:: (1 + n_a1As[ssk:2]) ~# n_a1Am[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1Ay} {0}:: (1 + (n_a1As[ssk:2] + m_a1Ao[sk:1]))
;                          ~# (n_a1Am[sk:1] + m_a1Ao[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a1As],a1Am)

; WANTEDS (Thoralf style)
; (+ [1,+ [a1As,a1Ao]],+ [a1Am,a1Ao])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{co_a1Ay} {0}:: (1 + (n_a1As[ssk:2] + m_a1Ao[sk:1]))
;                               ~# (n_a1Am[sk:1] + m_a1Ao[sk:1]) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a1As a1Ao))
;    (+ a1Am a1Ao))

; GIVENS (names)
;  a1Am  <=  n_a1Am[sk:1]
;  a1As  <=  n_a1As[ssk:2]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1Am))
; (assert (<= 0 a1As))
; (declare-const a1Am Int)
; (declare-const a1As Int)
(declare-const a1Am Int)
(declare-const a1As Int)
(assert
   (<= 0 a1Am))
(assert
   (<= 0 a1As))
(assert
   (!
      (=
         (+ 1 a1As)
         a1Am)
      :named
      given-16.1))
(check-sat)
; sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{co_a1Ay} {0}:: (1 + (n_a1As[ssk:2] + m_a1Ao[sk:1]))
;                               ~# (n_a1Am[sk:1] + m_a1Ao[sk:1]) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a1As a1Ao))
;    (+ a1Am a1Ao))

; WANTEDS (names)
;  a1Am  <=  n_a1Am[sk:1]
;  a1Ao  <=  m_a1Ao[sk:1]
;  a1As  <=  n_a1As[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1Ao))
; (declare-const a1Ao Int)
(declare-const a1Ao Int)
(assert
   (<= 0 a1Ao))
(assert
   (!
      (not
         (=
            (+
               1
               (+ a1As a1Ao))
            (+ a1Am a1Ao)))
      :named
      wanted-16))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-16")
(get-assertions)
; (
;   (<= 0 a1Am)
;   (<= 0 a1As)
;   (!
;      (=
;         (+ 1 a1As)
;         a1Am)
;      :named
;      given-16.1)
;   (<= 0 a1Ao)
;   (!
;      (not
;         (=
;            (+
;               1
;               (+ a1As a1Ao))
;            (+ a1Am a1Ao)))
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
; [G] co_a1FK {1}:: (a_a1DN[sk:1] <? b_a1DO[sk:1]) ~# 'True (CEqCan)
; [G] co_a1FL {1}:: (b_a1DO[sk:1] <? c_a1DP[sk:1]) ~# 'True (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1FM} {1}:: (a_a1DN[sk:1] <? c_a1DP[sk:1])
;                          ~# 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a1DN,a1DO],True [])
; (<? [a1DO,a1DP],True [])

; WANTEDS (Thoralf style)
; (<? [a1DN,a1DP],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{co_a1FM} {1}:: (a_a1DN[sk:1] <? c_a1DP[sk:1])
;                               ~# 'True (CNonCanonical)
;  =>  (=
;    (< a1DN a1DP)
;    true)

; GIVENS (names)
;  a1DN  <=  a_a1DN[sk:1]
;  a1DO  <=  b_a1DO[sk:1]
;  a1DP  <=  c_a1DP[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1DN))
; (assert (<= 0 a1DO))
; (assert (<= 0 a1DP))
; (declare-const a1DN Int)
; (declare-const a1DO Int)
; (declare-const a1DP Int)
(declare-const a1DN Int)
(declare-const a1DO Int)
(declare-const a1DP Int)
(assert
   (<= 0 a1DN))
(assert
   (<= 0 a1DO))
(assert
   (<= 0 a1DP))
(assert
   (!
      (=
         (< a1DN a1DO)
         true)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a1DO a1DP)
         true)
      :named
      given-19.2))
(check-sat)
; sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{co_a1FM} {1}:: (a_a1DN[sk:1] <? c_a1DP[sk:1])
;                               ~# 'True (CNonCanonical)
;  =>  (=
;    (< a1DN a1DP)
;    true)

; WANTEDS (names)
;  a1DN  <=  a_a1DN[sk:1]
;  a1DP  <=  c_a1DP[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (< a1DN a1DP)
            true))
      :named
      wanted-19))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-19")
(get-assertions)
; (
;   (<= 0 a1DN)
;   (<= 0 a1DO)
;   (<= 0 a1DP)
;   (!
;      (=
;         (< a1DN a1DO)
;         true)
;      :named
;      given-19.1)
;   (!
;      (=
;         (< a1DO a1DP)
;         true)
;      :named
;      given-19.2)
;   (!
;      (not
;         (=
;            (< a1DN a1DP)
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
; [G] co_a1E1 {0}:: (a_a1DZ[sk:1] + a_a1DZ[sk:1])
;                   ~# (a_a1DZ[sk:1] + b_a1E0[sk:1]) (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a1E4} {0}:: a_a1DZ[sk:1]
;                          ~# b_a1E0[sk:1] (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a1DZ,a1DZ],+ [a1DZ,a1E0])

; WANTEDS (Thoralf style)
; (a1DZ,a1E0)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{co_a1E4} {0}:: a_a1DZ[sk:1]
;                               ~# b_a1E0[sk:1] (CNonCanonical)
;  =>  (= a1DZ a1E0)

; GIVENS (names)
;  a1DZ  <=  a_a1DZ[sk:1]
;  a1E0  <=  b_a1E0[sk:1]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (assert (<= 0 a1DZ))
; (assert (<= 0 a1E0))
; (declare-const a1DZ Int)
; (declare-const a1E0 Int)
(declare-const a1DZ Int)
(declare-const a1E0 Int)
(assert
   (<= 0 a1DZ))
(assert
   (<= 0 a1E0))
(assert
   (!
      (=
         (+ a1DZ a1DZ)
         (+ a1DZ a1E0))
      :named
      given-21.1))
(check-sat)
; sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{co_a1E4} {0}:: a_a1DZ[sk:1]
;                               ~# b_a1E0[sk:1] (CNonCanonical)
;  =>  (= a1DZ a1E0)

; WANTEDS (names)
;  a1DZ  <=  a_a1DZ[sk:1]
;  a1E0  <=  b_a1E0[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (= a1DZ a1E0))
      :named
      wanted-21))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-21")
(get-assertions)
; (
;   (<= 0 a1DZ)
;   (<= 0 a1E0)
;   (!
;      (=
;         (+ a1DZ a1DZ)
;         (+ a1DZ a1E0))
;      :named
;      given-21.1)
;   (!
;      (not
;         (= a1DZ a1E0))
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
; [WD] hole{co_a1Ed} {0}:: (a_a1E8[sk:1] + b_a1E9[sk:1])
;                          ~# (b_a1E9[sk:1] + a_a1E8[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1E8,a1E9],+ [a1E9,a1E8])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{co_a1Ed} {0}:: (a_a1E8[sk:1] + b_a1E9[sk:1])
;                               ~# (b_a1E9[sk:1] + a_a1E8[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1E8 a1E9)
;    (+ a1E9 a1E8))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{co_a1Ed} {0}:: (a_a1E8[sk:1] + b_a1E9[sk:1])
;                               ~# (b_a1E9[sk:1] + a_a1E8[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1E8 a1E9)
;    (+ a1E9 a1E8))

; WANTEDS (names)
;  a1E8  <=  a_a1E8[sk:1]
;  a1E9  <=  b_a1E9[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1E8))
; (assert (<= 0 a1E9))
; (declare-const a1E8 Int)
; (declare-const a1E9 Int)
(declare-const a1E8 Int)
(declare-const a1E9 Int)
(assert
   (<= 0 a1E8))
(assert
   (<= 0 a1E9))
(assert
   (!
      (not
         (=
            (+ a1E8 a1E9)
            (+ a1E9 a1E8)))
      :named
      wanted-22))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-22")
(get-assertions)
; (
;   (<= 0 a1E8)
;   (<= 0 a1E9)
;   (!
;      (not
;         (=
;            (+ a1E8 a1E9)
;            (+ a1E9 a1E8)))
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
; [WD] hole{co_a1Ek} {0}:: (a_a1Eg[sk:1] + 1)
;                          ~# (1 + a_a1Eg[sk:1]) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a1Eg,1],+ [1,a1Eg])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{co_a1Ek} {0}:: (a_a1Eg[sk:1] + 1)
;                               ~# (1 + a_a1Eg[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1Eg 1)
;    (+ 1 a1Eg))

; GIVENS (names)
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
(check-sat)
; sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{co_a1Ek} {0}:: (a_a1Eg[sk:1] + 1)
;                               ~# (1 + a_a1Eg[sk:1]) (CNonCanonical)
;  =>  (=
;    (+ a1Eg 1)
;    (+ 1 a1Eg))

; WANTEDS (names)
;  a1Eg  <=  a_a1Eg[sk:1]
; DECS2 (seen) 
; DECS2 (unseen) 
; (assert (<= 0 a1Eg))
; (declare-const a1Eg Int)
(declare-const a1Eg Int)
(assert
   (<= 0 a1Eg))
(assert
   (!
      (not
         (=
            (+ a1Eg 1)
            (+ 1 a1Eg)))
      :named
      wanted-23))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-23")
(get-assertions)
; (
;   (<= 0 a1Eg)
;   (!
;      (not
;         (=
;            (+ a1Eg 1)
;            (+ 1 a1Eg)))
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
; [WD] hole{co_a2NS} {3}:: Alter
;                            (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                          ~# Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{co_a2NK} {3}:: Alter
;                            (Alter (Alter Nil "pilot" String) "price" Int) "price" Int
;                          ~# Alter (Alter Nil "pilot" String) "price" Int (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"price",Int []],"make",[] [Char []]],"price",Int []],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"price",Int []],"make",[] [Char []]])
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"pilot",[] [Char []]],"price",Int []],"price",Int []],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Alter [Symbol [],TYPE [BoxedRep [Lifted []]],Nil [Symbol [],TYPE [BoxedRep [Lifted []]]],"pilot",[] [Char []]],"price",Int []])

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{co_a2NS} {3}:: Alter
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

;      [WD] hole{co_a2NK} {3}:: Alter
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
;      [WD] hole{co_a2NS} {3}:: Alter
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

;      [WD] hole{co_a2NK} {3}:: Alter
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
; [G] co_a2O5 {2}:: Alter m_a2LS[sk:1] "price" Int
;                   ~# m_a2LS[sk:1] (CEqCan)
; [G] co_a2O9 {2}:: Delete m_a2LU[ssk:2] field_a2LV[ssk:2]
;                   ~# m_a2LS[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2Od} {3}:: Alter m_a2LU[ssk:2] "price" Int
;                          ~# m_a2LU[ssk:2] (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LS,"price",Int []],a2LS)
; (Delete [Symbol [],TYPE [BoxedRep [Lifted []]],a2LU,a2LV],a2LS)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LU,"price",Int []],a2LU)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{co_a2Od} {3}:: Alter m_a2LU[ssk:2] "price" Int
;                               ~# m_a2LU[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2LU
;       "price"
;       (just
;          (lit "3u")))
;    a2LU)

; GIVENS (names)
;  a2LS  <=  m_a2LS[sk:1]
;  a2LU  <=  m_a2LU[ssk:2]
;  a2LV  <=  field_a2LV[ssk:2]
(push 1)
; DECS1 (seen) 
; DECS1 (unseen) 
; (declare-const a2LS (Array String (Maybe Type)))
; (declare-const a2LU (Array String (Maybe Type)))
; (declare-const a2LV String)
(declare-const
   a2LS
   (Array
      String
      (Maybe Type)))
(declare-const
   a2LU
   (Array
      String
      (Maybe Type)))
(declare-const a2LV String)
(assert
   (!
      (=
         (store
            a2LS
            "price"
            (just
               (lit "3u")))
         a2LS)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a2LU
            a2LV
            (as
               nothing
               (Maybe Type)))
         a2LS)
      :named
      given-8.2))
(check-sat)
; sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{co_a2Od} {3}:: Alter m_a2LU[ssk:2] "price" Int
;                               ~# m_a2LU[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2LU
;       "price"
;       (just
;          (lit "3u")))
;    a2LU)

; WANTEDS (names)
;  a2LU  <=  m_a2LU[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a2LU
               "price"
               (just
                  (lit "3u")))
            a2LU))
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
;            a2LS
;            "price"
;            (just
;               (lit "3u")))
;         a2LS)
;      :named
;      given-8.1)
;   (!
;      (=
;         (store
;            a2LU
;            a2LV
;            (as
;               nothing
;               (Maybe Type)))
;         a2LS)
;      :named
;      given-8.2)
;   (!
;      (not
;         (=
;            (store
;               a2LU
;               "price"
;               (just
;                  (lit "3u")))
;            a2LU))
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
; [G] co_a2O5 {2}:: Alter m_a2LS[sk:1] "price" Int
;                   ~# m_a2LS[sk:1] (CEqCan)
; [G] co_a2Ol {5}:: Alter m_a2M1[ssk:2] "price" val_a2M3[ssk:2]
;                   ~# m_a2LS[sk:1] (CEqCan)
; [G] co_a2Oi {1}:: field_a2M2[ssk:2] ~# "price" (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2Mi} {0}:: val_a2M3[ssk:2] ~# Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LS,"price",Int []],a2LS)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2M1,"price",a2M3],a2LS)
; (a2M2,"price")

; WANTEDS (Thoralf style)
; (a2M3,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{co_a2Mi} {0}:: val_a2M3[ssk:2]
;                               ~# Int (CNonCanonical)
;  =>  (=
;    a2M3
;    (lit "3u"))

; GIVENS (names)
;  a2LS  <=  m_a2LS[sk:1]
;  a2M1  <=  m_a2M1[ssk:2]
;  a2M2  <=  field_a2M2[ssk:2]
;  a2M3  <=  val_a2M3[ssk:2]
(push 1)
; DECS1 (seen) 
; (declare-const a2LS (Array String (Maybe Type)))
; DECS1 (unseen) 
; (declare-const a2M1 (Array String (Maybe Type)))
; (declare-const a2M2 String)
; (declare-const a2M3 Type)
(declare-const
   a2LS
   (Array
      String
      (Maybe Type)))
(declare-const
   a2M1
   (Array
      String
      (Maybe Type)))
(declare-const a2M2 String)
(declare-const a2M3 Type)
(assert
   (!
      (=
         (store
            a2LS
            "price"
            (just
               (lit "3u")))
         a2LS)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a2M1
            "price"
            (just a2M3))
         a2LS)
      :named
      given-11.2))
(assert
   (!
      (= a2M2 "price")
      :named
      given-11.3))
(check-sat)
; sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{co_a2Mi} {0}:: val_a2M3[ssk:2]
;                               ~# Int (CNonCanonical)
;  =>  (=
;    a2M3
;    (lit "3u"))

; WANTEDS (names)
;  a2M3  <=  val_a2M3[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            a2M3
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
;            a2LS
;            "price"
;            (just
;               (lit "3u")))
;         a2LS)
;      :named
;      given-11.1)
;   (!
;      (=
;         (store
;            a2M1
;            "price"
;            (just a2M3))
;         a2LS)
;      :named
;      given-11.2)
;   (!
;      (= a2M2 "price")
;      :named
;      given-11.3)
;   (!
;      (not
;         (=
;            a2M3
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
; [G] $dDisEquality_a2Mk {0}:: DisEquality
;                                field_a2M2[ssk:2] "price" (CDictCan)
; [G] co_a2O5 {2}:: Alter m_a2LS[sk:1] "price" Int
;                   ~# m_a2LS[sk:1] (CEqCan)
; [G] co_a2Og {2}:: Alter
;                     m_a2M1[ssk:2] field_a2M2[ssk:2] val_a2M3[ssk:2]
;                   ~# m_a2LS[sk:1] (CEqCan)

; WANTEDS (GHC style)
; [WD] hole{co_a2Oo} {3}:: Alter m_a2M1[ssk:2] "price" Int
;                          ~# m_a2M1[ssk:2] (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a2Mk {0}:: DisEquality
                               field_a2M2[ssk:2] "price" (CDictCan)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2LS,"price",Int []],a2LS)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2M1,a2M2,a2M3],a2LS)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [BoxedRep [Lifted []]],a2M1,"price",Int []],a2M1)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{co_a2Oo} {3}:: Alter m_a2M1[ssk:2] "price" Int
;                               ~# m_a2M1[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2M1
;       "price"
;       (just
;          (lit "3u")))
;    a2M1)

; GIVENS (names)
;  a2LS  <=  m_a2LS[sk:1]
;  a2M1  <=  m_a2M1[ssk:2]
;  a2M2  <=  field_a2M2[ssk:2]
;  a2M3  <=  val_a2M3[ssk:2]
(push 1)
; DECS1 (seen) 
; (declare-const a2LS (Array String (Maybe Type)))
; (declare-const a2M1 (Array String (Maybe Type)))
; (declare-const a2M2 String)
; (declare-const a2M3 Type)
; DECS1 (unseen) 
(declare-const
   a2LS
   (Array
      String
      (Maybe Type)))
(declare-const
   a2M1
   (Array
      String
      (Maybe Type)))
(declare-const a2M2 String)
(declare-const a2M3 Type)
(assert
   (!
      (not
         (= a2M2 "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a2LS
            "price"
            (just
               (lit "3u")))
         a2LS)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a2M1
            a2M2
            (just a2M3))
         a2LS)
      :named
      given-13.3))
(check-sat)
; sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{co_a2Oo} {3}:: Alter m_a2M1[ssk:2] "price" Int
;                               ~# m_a2M1[ssk:2] (CNonCanonical)
;  =>  (=
;    (store
;       a2M1
;       "price"
;       (just
;          (lit "3u")))
;    a2M1)

; WANTEDS (names)
;  a2M1  <=  m_a2M1[ssk:2]
; DECS2 (seen) 
; DECS2 (unseen) 
(assert
   (!
      (not
         (=
            (store
               a2M1
               "price"
               (just
                  (lit "3u")))
            a2M1))
      :named
      wanted-13))
(check-sat)
; unsat
(echo "wanteds-finish-cycle-13")
(get-assertions)
; (
;   (!
;      (not
;         (= a2M2 "price"))
;      :named
;      given-13.1)
;   (!
;      (=
;         (store
;            a2LS
;            "price"
;            (just
;               (lit "3u")))
;         a2LS)
;      :named
;      given-13.2)
;   (!
;      (=
;         (store
;            a2M1
;            a2M2
;            (just a2M3))
;         a2LS)
;      :named
;      given-13.3)
;   (!
;      (not
;         (=
;            (store
;               a2M1
;               "price"
;               (just
;                  (lit "3u")))
;            a2M1))
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
