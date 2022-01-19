(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
; (push 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
(declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
(declare-const one Int)
(assert (! (= one 1) :named one=1))
(declare-const base (Array String Int))
(declare-const enc (Array String Int))
(declare-const exp (Array String Int))
(assert (! (= enc base) :named enc=base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1Bz {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1Bx {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1BD {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1BB {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1BF {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1BH {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1BL {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],a1By)
; (Base ["m"],a1Bw)
; (Base ["s"],a1BC)
; (*: [a1Bw,a1By],a1BA)
; (*: [a1BC,a1By],a1BE)
; (/: [a1BA,a1BE],a1BG)
; (a1BG,a1u1)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1u1 (Array String Int))
(declare-const a1Bw (Array String Int))
(declare-const a1By (Array String Int))
(declare-const a1BA (Array String Int))
(declare-const a1BC (Array String Int))
(declare-const a1BE (Array String Int))
(declare-const a1BG (Array String Int))
(assert
   (! (= ((as const (Array String Int)) 0) a1By) :named a1By=1))
(assert
   (! (= (store base "m" one) a1Bw) :named a1Bw=m))
(assert
   (! (= (store base "s" one) a1BC) :named a1BC=s))
(assert
   (! (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1Bw
  a1By) a1BA) :named a1BA=a1Bw*a1By))
(assert
   (! (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1BC
  a1By) a1BE) :named a1BE=a1BC*a1By))
(assert
   (! (= (
  (_
     map
     (-
        (Int Int)
        Int))
  a1BA
  a1BE) a1BG) :named a1BG=a1BA/a1BE))
(assert
   (= a1BG a1u1))
(echo "checkpoint #1")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1Cw {1}:: (a /: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1CA {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (/: [a1Cl,a1Cm],a1Cv)
; (a1Cv,a1Cn)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1Cl (Array String Int))
(declare-const a1Cm (Array String Int))
(declare-const a1Cn (Array String Int))
(declare-const a1Cv (Array String Int))
(assert
   (! (= (
  (_
     map
     (-
        (Int Int)
        Int))
  a1Cl
  a1Cm) a1Cv) :named a1Cv=a1Cl/a1Cm))
(assert
   (! (= a1Cv a1Cn) :named a1Cn=a1Cv))
(echo "checkpoint #2")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1D9 {1}:: (a *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1Dd {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [a1CU,a1CV],a1D8)
; (a1D8,a1CW)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1CU (Array String Int))
(declare-const a1CV (Array String Int))
(declare-const a1CW (Array String Int))
(declare-const a1D8 (Array String Int))
(assert
   (! (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1CU
  a1CV) a1D8) :named a1D8=a1CU*a1CV))
(assert
   (! (= a1D8 a1CW) :named a1CW=a1D8))
(echo "checkpoint #3")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1Ek {1}:: Enc s n ~ fsk0 (CFunEqCan)
; [G] cobox_a1Eo {1}:: fsk0 ~ b (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Enc [a1E5,a1E6],a1Ej)
; (a1Ej,a1E7)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1E5 String)
(declare-const a1E6 Int)
(declare-const a1E7 (Array String Int))
(declare-const a1Ej (Array String Int))
(assert (! (<= 0 a1E6) :named a1E6>0))
(assert
   (! (= (store enc a1E5 a1E6) a1Ej) :named a1Ej=enc@a1E5=a1E6))
(assert
   (! (= a1Ej a1E7) :named a1E7=a1Ej))
(echo "checkpoint #4")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1Gp} {2}:: (Base "m" *: One)
;                       ~
;                       (((Base "m" *: One) /: (Base "s" *: One))
;                        *: (Base "s" *: One)) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (*: [Base ["m"],One []],*: [/: [*: [Base ["m"],One []],*: [Base ["s"],One []]],*: [Base ["s"],One []]])

; (push 1)
; (check-sat)
; sat
(assert
   (or
      false
      (not
         (= (
  (_
     map
     (+
        (Int Int)
        Int))
  (store base "m" one)
  (
    (as
       const
       (Array String Int))
    0)) (
  (_
     map
     (+
        (Int Int)
        Int))
  (
    (_
       map
       (-
          (Int Int)
          Int))
    (
      (_
         map
         (+
            (Int Int)
            Int))
      (store base "m" one)
      (
        (as
           const
           (Array String Int))
        0))
    (
      (_
         map
         (+
            (Int Int)
            Int))
      (store base "s" one)
      (
        (as
           const
           (Array String Int))
        0)))
  (
    (_
       map
       (+
          (Int Int)
          Int))
    (store base "s" one)
    (
      (as
         const
         (Array String Int))
      0)))))))
(echo "checkpoint #5")
(check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1GP {1}:: (a /: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1GT {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (/: [a1EB,a1EC],a1GO)
; (a1GO,a1ED)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1EB (Array String Int))
(declare-const a1EC (Array String Int))
(declare-const a1ED (Array String Int))
(declare-const a1GO (Array String Int))
(assert
   (! (= (
  (_
     map
     (-
        (Int Int)
        Int))
  a1EB
  a1EC) a1GO) :named a1GO=a1EB/a1EC))
(assert
   (! (= a1GO a1ED) :named a1ED=a1GO))
(echo "checkpoint #6")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1GY {1}:: (a *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_a1H2 {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [a1ER,a1ES],a1GX)
; (a1GX,a1ET)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1ER (Array String Int))
(declare-const a1ES (Array String Int))
(declare-const a1ET (Array String Int))
(declare-const a1GX (Array String Int))
(assert
   (! (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1ER
  a1ES) a1GX) :named a1GX=a1ER*a1ES))
(assert
   (! (= a1GX a1ET) :named a1ET=a1GX))
(echo "checkpoint #7")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1H9 {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1H7 {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hd {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hb {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hf {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hh {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hl {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (One [],a1H8)
; (Base ["m"],a1H6)
; (Base ["s"],a1Hc)
; (*: [a1H6,a1H8],a1Ha)
; (*: [a1Hc,a1H8],a1He)
; (/: [a1Ha,a1He],a1Hg)
; (a1Hg,a1Fi)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1Fi (Array String Int))
(declare-const a1H6 (Array String Int))
(declare-const a1H8 (Array String Int))
(declare-const a1Ha (Array String Int))
(declare-const a1Hc (Array String Int))
(declare-const a1He (Array String Int))
(declare-const a1Hg (Array String Int))
(assert
   (= ((as const (Array String Int)) 0) a1H8))
(assert
   (! (= (store base "m" one) a1H6) :named a1H6=m))
(assert
   (! (= (store base "s" one) a1Hc) :named a1Hc=s))
(assert
   (! (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1H6
  a1H8) a1Ha) :named a1Ha=a1H6*a1H8))
(assert
   (! (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1Hc
  a1H8) a1He) :named a1He=a1Hc*a1H8))
(assert
   (! (= (
  (_
     map
     (-
        (Int Int)
        Int))
  a1Ha
  a1He) a1Hg) :named a1Hg=a1Ha/a1He))
(assert
   (! (= a1Hg a1Fi) :named a1Fi=a1Hg))
(echo "checkpoint #8")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1H9 {3}:: One ~ fsk0 (CFunEqCan)
; [G] cobox_a1H7 {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hd {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_a1Hb {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hf {2}:: (fsk0 *: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hh {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_a1Hl {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1Hw} {3}:: (mps *: (Base "s" *: One))
;                       ~
;                       (Base "m" *: One) (CNonCanonical)

; GIVENS (Thoralf style)
; (One [],a1H8)
; (Base ["m"],a1H6)
; (Base ["s"],a1Hc)
; (*: [a1H6,a1H8],a1Ha)
; (*: [a1Hc,a1H8],a1He)
; (/: [a1Ha,a1He],a1Hg)
; (a1Hg,a1Fi)

; WANTEDS (Thoralf style)
; (*: [a1Fi,*: [Base ["s"],One []]],*: [Base ["m"],One []])

; (push 1)
; (declare-const a1Fi (Array String Int))
; (declare-const a1H6 (Array String Int))
; (declare-const a1H8 (Array String Int))
; (declare-const a1Ha (Array String Int))
; (declare-const a1Hc (Array String Int))
; (declare-const a1He (Array String Int))
; (declare-const a1Hg (Array String Int))
; (assert
;    (! (= ((as const (Array String Int)) 0) a1H8) :named a1H8=1))
; (assert
;   (! (= (store base "m" one) a1H6) :named a1H6=m))
; (assert
;    (! (= (store base "s" one) a1Hc) :named a1Hc=s))
; (assert
;    (! (= (
;   (_
;      map
;      (+
;         (Int Int)
;         Int))
;   a1H6
;   a1H8) a1Ha) :named a1Ha=a1H6*a1H8))
; (assert
;    (! (= (
;   (_
;      map
;      (+
;         (Int Int)
;         Int))
;   a1Hc
;   a1H8) a1He) :named a1He=a1Hc*a1H8))
; (assert
;    (! (= (
;   (_
;      map
;      (-
;         (Int Int)
;         Int))
;   a1Ha
;   a1He) a1Hg) :named a1Hg=a1Ha/a1He))
; (assert
;    (! (= a1Hg a1Fi) :named a1Fi=a1Hg))
; (check-sat)
; sat
(assert
   (or
      false
      (not
         (= (
  (_
     map
     (+
        (Int Int)
        Int))
  a1Fi
  (
    (_
       map
       (+
          (Int Int)
          Int))
    (store base "s" one)
    (
      (as
         const
         (Array String Int))
      0))) (
  (_
     map
     (+
        (Int Int)
        Int))
  (store base "m" one)
  (
    (as
       const
       (Array String Int))
    0))))))
(echo "checkpoint #9")
(check-sat)
; unsat
; (pop 1)
; (exit)
; (set-option :print-success true)
; (set-option :produce-models true)
; (declare-datatypes () ((Type (apply (fst Type) (snd Type)) (lit (getstr String)))))
; (declare-const one Int)
; (assert (= one 1))
; (declare-const base (Array String Int))
; (declare-const enc (Array String Int))
; (declare-const exp (Array String Int))
; (assert (= enc base))
; (push 1)

; GIVENS (GHC style)
; [G] cobox_a1Hy {1}:: Enc s n ~ fsk0 (CFunEqCan)
; [G] cobox_a1HC {1}:: fsk0 ~ b (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Enc [a1FE,a1FF],a1Hx)
; (a1Hx,a1FG)

; WANTEDS (Thoralf style)
; []

; (push 1)
(declare-const a1FE String)
(declare-const a1FF Int)
(declare-const a1FG (Array String Int))
(declare-const a1Hx (Array String Int))
(assert (<= 0 a1FF))
(assert
   (! (= (store enc a1FE a1FF) a1Hx) :named a1Hx=enc@a1FE=a1FF))
(assert
   (! (= a1Hx a1FG) :named a1FG=a1Hx))
(echo "checkpoint #10")
(check-sat)
; sat
; (assert false)
; (check-sat)
; unsat
; (pop 1)
; (exit)
(get-assertions)
