; Build profile: -w ghc-8.2.2 -O1
; [1 of 3] Compiling Defs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaHD} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aaHD} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aaHD} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; WANTEDS (names)
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base "s" one)
                 (store base "s" one)))))
      :named
      wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaI8} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{aaI8} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{aaI8} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; WANTEDS (names)
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base "m" one)
                 (store base "m" one)))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(exit)
; [2 of 3] Compiling UoM
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_aaSx {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_aaSz {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_aaSB {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_aaSF {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Base ["m"],aaSw)
; (Base ["s"],aaSy)
; (/: [aaSw,aaSy],aaSA)
; (aaSA,aaSm)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
aaSm  <=  mps
aaSw  <=  fsk_aaSw
aaSy  <=  fsk_aaSy
aaSA  <=  fsk_aaSA
(push 1)
(declare-const
   aaSm
   (Array String Int))
(declare-const
   aaSw
   (Array String Int))
(declare-const
   aaSy
   (Array String Int))
(declare-const
   aaSA
   (Array String Int))
(assert
   (!
      (=
         (store base "m" one)
         aaSw)
      :named
      given-1.1))
(assert
   (!
      (=
         (store base "s" one)
         aaSy)
      :named
      given-1.2))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aaSw
           aaSy)
         aaSA)
      :named
      given-1.3))
(assert
   (!
      (= aaSA aaSm)
      :named
      given-1.4))
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] cobox_aaTL {1}:: (a /: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aaTP {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (/: [aaTA,aaTB],aaTK)
; (aaTK,aaTC)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-2")
; GIVENS (conversions)
; GIVENS (names)
aaTA  <=  a
aaTB  <=  b
aaTC  <=  c
aaTK  <=  fsk_aaTK
(push 1)
(declare-const
   aaTA
   (Array String Int))
(declare-const
   aaTB
   (Array String Int))
(declare-const
   aaTC
   (Array String Int))
(declare-const
   aaTK
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aaTA
           aaTB)
         aaTK)
      :named
      given-2.1))
(assert
   (!
      (= aaTK aaTC)
      :named
      given-2.2))
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_aaUo {1}:: (a *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aaUs {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [aaU9,aaUa],aaUn)
; (aaUn,aaUb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
; GIVENS (conversions)
; GIVENS (names)
aaU9  <=  a
aaUa  <=  b
aaUb  <=  c
aaUn  <=  fsk_aaUn
(push 1)
(declare-const
   aaU9
   (Array String Int))
(declare-const
   aaUa
   (Array String Int))
(declare-const
   aaUb
   (Array String Int))
(declare-const
   aaUn
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aaU9
           aaUa)
         aaUn)
      :named
      given-3.1))
(assert
   (!
      (= aaUn aaUb)
      :named
      given-3.2))
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [W] hole{aaWE} {2}:: Base "m"
;                      ~
;                      ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
; [D] _ {2}:: Base "m"
;             ~
;             ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Base ["m"],*: [/: [Base ["m"],Base ["s"]],Base ["s"]])
; (Base ["m"],*: [/: [Base ["m"],Base ["s"]],Base ["s"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [W] hole{aaWE} {2}:: Base "m"
;                           ~
;                           ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (store base "m" one)
;        (store base "s" one))
;      (store base "s" one)))

;      [D] _ {2}:: Base "m"
;                  ~
;                  ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (store base "m" one)
;        (store base "s" one))
;      (store base "s" one)))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [W] hole{aaWE} {2}:: Base "m"
;                           ~
;                           ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (store base "m" one)
;        (store base "s" one))
;      (store base "s" one)))

;      [D] _ {2}:: Base "m"
;                  ~
;                  ((Base "m" /: Base "s") *: Base "s") (CNonCanonical)
;  =>  (=
;    (store base "m" one)
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      (
;        (_
;           map
;           (-
;              (Int Int)
;              Int))
;        (store base "m" one)
;        (store base "s" one))
;      (store base "s" one)))

; WANTEDS (names)
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (store base "m" one)
                  (
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
                      (store base "m" one)
                      (store base "s" one))
                    (store base "s" one)))))
         (not
            (=
               (store base "m" one)
               (
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
                   (store base "m" one)
                   (store base "s" one))
                 (store base "s" one)))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_aaWU {1}:: (a /: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aaWY {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (/: [aaVf,aaVg],aaWT)
; (aaWT,aaVh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
; GIVENS (conversions)
; GIVENS (names)
aaVf  <=  a
aaVg  <=  b
aaVh  <=  c
aaWT  <=  fsk_aaWT
(push 1)
(declare-const
   aaVf
   (Array String Int))
(declare-const
   aaVg
   (Array String Int))
(declare-const
   aaVh
   (Array String Int))
(declare-const
   aaWT
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aaVf
           aaVg)
         aaWT)
      :named
      given-5.1))
(assert
   (!
      (= aaWT aaVh)
      :named
      given-5.2))
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-5))
(check-sat)
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_aaX3 {1}:: (a *: b) ~ fsk0 (CFunEqCan)
; [G] cobox_aaX7 {1}:: fsk0 ~ c (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (*: [aaVw,aaVx],aaX2)
; (aaX2,aaVy)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
aaVw  <=  a
aaVx  <=  b
aaVy  <=  c
aaX2  <=  fsk_aaX2
(push 1)
(declare-const
   aaVw
   (Array String Int))
(declare-const
   aaVx
   (Array String Int))
(declare-const
   aaVy
   (Array String Int))
(declare-const
   aaX2
   (Array String Int))
(assert
   (!
      (=
         (
           (_
              map
              (+
                 (Int Int)
                 Int))
           aaVw
           aaVx)
         aaX2)
      :named
      given-6.1))
(assert
   (!
      (= aaX2 aaVy)
      :named
      given-6.2))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-6))
(check-sat)
unsat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_aaXc {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_aaXe {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_aaXg {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_aaXk {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Base ["m"],aaXb)
; (Base ["s"],aaXd)
; (/: [aaXb,aaXd],aaXf)
; (aaXf,aaVY)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
aaVY  <=  mps
aaXb  <=  fsk_aaXb
aaXd  <=  fsk_aaXd
aaXf  <=  fsk_aaXf
(push 1)
(declare-const
   aaVY
   (Array String Int))
(declare-const
   aaXb
   (Array String Int))
(declare-const
   aaXd
   (Array String Int))
(declare-const
   aaXf
   (Array String Int))
(assert
   (!
      (=
         (store base "m" one)
         aaXb)
      :named
      given-7.1))
(assert
   (!
      (=
         (store base "s" one)
         aaXd)
      :named
      given-7.2))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aaXb
           aaXd)
         aaXf)
      :named
      given-7.3))
(assert
   (!
      (= aaXf aaVY)
      :named
      given-7.4))
(check-sat)
sat
(echo "givens-finish-cycle-7")
(echo "wanteds-start-cycle-7")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-7))
(check-sat)
unsat
(echo "wanteds-finish-cycle-7")
(pop 1)
(echo "solver-finish-cycle-7")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_aaXc {2}:: Base "m" ~ fsk0 (CFunEqCan)
; [G] cobox_aaXe {2}:: Base "s" ~ fsk0 (CFunEqCan)
; [G] cobox_aaXg {1}:: (fsk0 /: fsk1) ~ fsk2 (CFunEqCan)
; [G] cobox_aaXk {1}:: fsk0 ~ mps (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{aaXv} {3}:: (mps *: Base "s") ~ Base "m" (CNonCanonical)

; GIVENS (Thoralf style)
; (Base ["m"],aaXb)
; (Base ["s"],aaXd)
; (/: [aaXb,aaXd],aaXf)
; (aaXf,aaVY)

; WANTEDS (Thoralf style)
; (*: [aaVY,Base ["s"]],Base ["m"])

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{aaXv} {3}:: (mps *: Base "s")
;                            ~
;                            Base "m" (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaVY
;      (store base "s" one))
;    (store base "m" one))

; GIVENS (names)
aaVY  <=  mps
aaXb  <=  fsk_aaXb
aaXd  <=  fsk_aaXd
aaXf  <=  fsk_aaXf
(push 1)
(declare-const
   aaVY
   (Array String Int))
(declare-const
   aaXb
   (Array String Int))
(declare-const
   aaXd
   (Array String Int))
(declare-const
   aaXf
   (Array String Int))
(assert
   (!
      (=
         (store base "m" one)
         aaXb)
      :named
      given-8.1))
(assert
   (!
      (=
         (store base "s" one)
         aaXd)
      :named
      given-8.2))
(assert
   (!
      (=
         (
           (_
              map
              (-
                 (Int Int)
                 Int))
           aaXb
           aaXd)
         aaXf)
      :named
      given-8.3))
(assert
   (!
      (= aaXf aaVY)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{aaXv} {3}:: (mps *: Base "s")
;                            ~
;                            Base "m" (CNonCanonical)
;  =>  (=
;    (
;      (_
;         map
;         (+
;            (Int Int)
;            Int))
;      aaVY
;      (store base "s" one))
;    (store base "m" one))

; WANTEDS (names)
aaVY  <=  mps
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (_
                    map
                    (+
                       (Int Int)
                       Int))
                 aaVY
                 (store base "s" one))
               (store base "m" one))))
      :named
      wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(exit)
; [3 of 3] Compiling Main
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(exit)
; [1 of 3] Compiling Defs
(set-option :print-success true)
(set-option :produce-models true)
(set-option :interactive-mode true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(declare-const one Int)
(assert
   (= one 1))
(declare-const
   base
   (Array String Int))
(declare-const
   enc
   (Array String Int))
(declare-const
   exp
   (Array String Int))
(assert
   (= enc base))
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-1")
(echo "wanteds-start-cycle-1")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-1))
(check-sat)
unsat
(echo "wanteds-finish-cycle-1")
(pop 1)
(echo "solver-finish-cycle-1")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaHS} {2}:: One ~ (Base "s" /: Base "s") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["s"],Base ["s"]])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{aaHS} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{aaHS} {2}:: One
;                            ~
;                            (Base "s" /: Base "s") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "s" one)
;      (store base "s" one)))

; WANTEDS (names)
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base "s" one)
                 (store base "s" one)))))
      :named
      wanted-2))
(check-sat)
unsat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-3))
(check-sat)
unsat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{aaIn} {2}:: One ~ (Base "m" /: Base "m") (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (One [],/: [Base ["m"],Base ["m"]])

(echo "givens-start-cycle-4")
; GIVENS (conversions)
;      [WD] hole{aaIn} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
;      [WD] hole{aaIn} {2}:: One
;                            ~
;                            (Base "m" /: Base "m") (CNonCanonical)
;  =>  (=
;    (
;      (as
;         const
;         (Array String Int))
;      0)
;    (
;      (_
;         map
;         (-
;            (Int Int)
;            Int))
;      (store base "m" one)
;      (store base "m" one)))

; WANTEDS (names)
(assert
   (!
      (or
         false
         (not
            (=
               (
                 (as
                    const
                    (Array String Int))
                 0)
               (
                 (_
                    map
                    (-
                       (Int Int)
                       Int))
                 (store base "m" one)
                 (store base "m" one)))))
      :named
      wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(exit)
; Test suite uom-quantity: RUNNING...
; Test suite uom-quantity: PASS