; Build profile: -w ghc-8.2.2 -O1
; [1 of 4] Compiling FiniteMaps
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_a1a2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a19X {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1a7 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a19S {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1a3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a19T {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a19Y {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1a8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (IntersectL [a19n,a19o,a19q,a19s],a1a1)
; (IntersectL [a19n,a19o,a19r,a19s],a19W)
; (IntersectL [a19n,a19o,a19p,a19u],a1a6)
; (IntersectL [a19n,a19o,a19p,a19q],a19R)
; (a1a1,a19u)
; (a19R,a19r)
; (a19W,a19t)
; (a1a6,a19v)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
a19p  <=  a
a19q  <=  b
a19r  <=  ab
a19s  <=  c
a19t  <=  abc
a19u  <=  bc
a19v  <=  abc'
a19R  <=  fsk_a19R
a19W  <=  fsk_a19W
a1a1  <=  fsk_a1a1
a1a6  <=  fsk_a1a6
(push 1)
(declare-sort Sorta19n)
(declare-sort Sorta19o)
(declare-const
   a19p
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19q
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19r
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19s
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19t
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19u
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19v
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19R
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19W
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a1
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a6
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-fun
   both8514226977520841413
   (
     (Maybe Sorta19o)
     (Maybe Sorta19o))
   (Maybe Sorta19o))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413
            y
            (as
               nothing
               (Maybe Sorta19o)))
         (as
            nothing
            (Maybe Sorta19o)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta19o))
        (y
           (Maybe Sorta19o)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              y))
         (=
            (both8514226977520841413 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19q
           a19s)
         a1a1)
      :named
      given-1.1))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19r
           a19s)
         a19W)
      :named
      given-1.2))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19u)
         a1a6)
      :named
      given-1.3))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19q)
         a19R)
      :named
      given-1.4))
(assert
   (!
      (= a1a1 a19u)
      :named
      given-1.5))
(assert
   (!
      (= a19R a19r)
      :named
      given-1.6))
(assert
   (!
      (= a19W a19t)
      :named
      given-1.7))
(assert
   (!
      (= a1a6 a19v)
      :named
      given-1.8))
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
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_a1a2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a19X {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1a7 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a19S {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1a3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a19T {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a19Y {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1a8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (IntersectL [a19n,a19o,a19q,a19s],a1a1)
; (IntersectL [a19n,a19o,a19r,a19s],a19W)
; (IntersectL [a19n,a19o,a19p,a19u],a1a6)
; (IntersectL [a19n,a19o,a19p,a19q],a19R)
; (a1a1,a19u)
; (a19R,a19r)
; (a19W,a19t)
; (a1a6,a19v)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
a19p  <=  a
a19q  <=  b
a19r  <=  ab
a19s  <=  c
a19t  <=  abc
a19u  <=  bc
a19v  <=  abc'
a19R  <=  fsk_a19R
a19W  <=  fsk_a19W
a1a1  <=  fsk_a1a1
a1a6  <=  fsk_a1a6
(push 1)
(declare-sort Sorta19n)
(declare-sort Sorta19o)
(declare-const
   a19p
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19q
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19r
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19s
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19t
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19u
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19v
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19R
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19W
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a1
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a6
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-fun
   both8514226977520841413
   (
     (Maybe Sorta19o)
     (Maybe Sorta19o))
   (Maybe Sorta19o))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413
            y
            (as
               nothing
               (Maybe Sorta19o)))
         (as
            nothing
            (Maybe Sorta19o)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta19o))
        (y
           (Maybe Sorta19o)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              y))
         (=
            (both8514226977520841413 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19q
           a19s)
         a1a1)
      :named
      given-1.1))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19r
           a19s)
         a19W)
      :named
      given-1.2))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19u)
         a1a6)
      :named
      given-1.3))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19q)
         a19R)
      :named
      given-1.4))
(assert
   (!
      (= a1a1 a19u)
      :named
      given-1.5))
(assert
   (!
      (= a19R a19r)
      :named
      given-1.6))
(assert
   (!
      (= a19W a19t)
      :named
      given-1.7))
(assert
   (!
      (= a1a6 a19v)
      :named
      given-1.8))
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
; [G] cobox_a1a2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a19X {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1a7 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a19S {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1a3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a19T {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a19Y {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1a8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1aw} {3}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1aI} {3}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a19n,a19o,a19q,a19s],a1a1)
; (IntersectL [a19n,a19o,a19r,a19s],a19W)
; (IntersectL [a19n,a19o,a19p,a19u],a1a6)
; (IntersectL [a19n,a19o,a19p,a19q],a19R)
; (a1a1,a19u)
; (a19R,a19r)
; (a19W,a19t)
; (a1a6,a19v)

; WANTEDS (Thoralf style)
; (IntersectL [a19n,a19o,IntersectL [a19n,a19o,a19C,a19D],a19F],a19t)
; (IntersectL [a19n,a19o,a19C,IntersectL [a19n,a19o,a19D,a19F]],a19v)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a1aw} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aI} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; GIVENS (names)
a19p  <=  a
a19q  <=  b
a19r  <=  ab
a19s  <=  c
a19t  <=  abc
a19u  <=  bc
a19v  <=  abc'
a19R  <=  fsk_a19R
a19W  <=  fsk_a19W
a1a1  <=  fsk_a1a1
a1a6  <=  fsk_a1a6
(push 1)
(declare-sort Sorta19n)
(declare-sort Sorta19o)
(declare-const
   a19p
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19q
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19r
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19s
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19t
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19u
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19v
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19R
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19W
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a1
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a6
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-fun
   both8514226977520841413
   (
     (Maybe Sorta19o)
     (Maybe Sorta19o))
   (Maybe Sorta19o))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413
            y
            (as
               nothing
               (Maybe Sorta19o)))
         (as
            nothing
            (Maybe Sorta19o)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta19o))
        (y
           (Maybe Sorta19o)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              y))
         (=
            (both8514226977520841413 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19q
           a19s)
         a1a1)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19r
           a19s)
         a19W)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19u)
         a1a6)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19q)
         a19R)
      :named
      given-2.4))
(assert
   (!
      (= a1a1 a19u)
      :named
      given-2.5))
(assert
   (!
      (= a19R a19r)
      :named
      given-2.6))
(assert
   (!
      (= a19W a19t)
      :named
      given-2.7))
(assert
   (!
      (= a1a6 a19v)
      :named
      given-2.8))
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a1aw} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aI} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; WANTEDS (names)
a19t  <=  abc
a19v  <=  abc'
a19C  <=  a_a19C
a19D  <=  b_a19D
a19F  <=  c_a19F
(declare-const
   a19C
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19D
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19F
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map both8514226977520841413)
                    (
                      (_ map both8514226977520841413)
                      a19C
                      a19D)
                    a19F)
                  a19t)))
         (not
            (=
               (
                 (_ map both8514226977520841413)
                 a19C
                 (
                   (_ map both8514226977520841413)
                   a19D
                   a19F))
               a19v)))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] cobox_a1a2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a19X {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1a7 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a19S {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1a3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a19T {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a19Y {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1a8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1aw} {3}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1aI} {3}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a19n,a19o,a19q,a19s],a1a1)
; (IntersectL [a19n,a19o,a19r,a19s],a19W)
; (IntersectL [a19n,a19o,a19p,a19u],a1a6)
; (IntersectL [a19n,a19o,a19p,a19q],a19R)
; (a1a1,a19u)
; (a19R,a19r)
; (a19W,a19t)
; (a1a6,a19v)

; WANTEDS (Thoralf style)
; (IntersectL [a19n,a19o,IntersectL [a19n,a19o,a19C,a19D],a19F],a19t)
; (IntersectL [a19n,a19o,a19C,IntersectL [a19n,a19o,a19D,a19F]],a19v)

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a1aw} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aI} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; GIVENS (names)
a19p  <=  a
a19q  <=  b
a19r  <=  ab
a19s  <=  c
a19t  <=  abc
a19u  <=  bc
a19v  <=  abc'
a19R  <=  fsk_a19R
a19W  <=  fsk_a19W
a1a1  <=  fsk_a1a1
a1a6  <=  fsk_a1a6
(push 1)
(declare-sort Sorta19n)
(declare-sort Sorta19o)
(declare-const
   a19p
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19q
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19r
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19s
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19t
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19u
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19v
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19R
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19W
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a1
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a6
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-fun
   both8514226977520841413
   (
     (Maybe Sorta19o)
     (Maybe Sorta19o))
   (Maybe Sorta19o))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413
            y
            (as
               nothing
               (Maybe Sorta19o)))
         (as
            nothing
            (Maybe Sorta19o)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta19o))
        (y
           (Maybe Sorta19o)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              y))
         (=
            (both8514226977520841413 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19q
           a19s)
         a1a1)
      :named
      given-2.1))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19r
           a19s)
         a19W)
      :named
      given-2.2))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19u)
         a1a6)
      :named
      given-2.3))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19q)
         a19R)
      :named
      given-2.4))
(assert
   (!
      (= a1a1 a19u)
      :named
      given-2.5))
(assert
   (!
      (= a19R a19r)
      :named
      given-2.6))
(assert
   (!
      (= a19W a19t)
      :named
      given-2.7))
(assert
   (!
      (= a1a6 a19v)
      :named
      given-2.8))
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a1aw} {3}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aI} {3}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; WANTEDS (names)
a19t  <=  abc
a19v  <=  abc'
a19C  <=  a_a19C
a19D  <=  b_a19D
a19F  <=  c_a19F
(declare-const
   a19C
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19D
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19F
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map both8514226977520841413)
                    (
                      (_ map both8514226977520841413)
                      a19C
                      a19D)
                    a19F)
                  a19t)))
         (not
            (=
               (
                 (_ map both8514226977520841413)
                 a19C
                 (
                   (_ map both8514226977520841413)
                   a19D
                   a19F))
               a19v)))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_a1a2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a19X {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1a7 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a19S {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1a3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a19T {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a19Y {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1a8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1aN} {4}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1aS} {4}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a19n,a19o,a19q,a19s],a1a1)
; (IntersectL [a19n,a19o,a19r,a19s],a19W)
; (IntersectL [a19n,a19o,a19p,a19u],a1a6)
; (IntersectL [a19n,a19o,a19p,a19q],a19R)
; (a1a1,a19u)
; (a19R,a19r)
; (a19W,a19t)
; (a1a6,a19v)

; WANTEDS (Thoralf style)
; (IntersectL [a19n,a19o,IntersectL [a19n,a19o,a19C,a19D],a19F],a19t)
; (IntersectL [a19n,a19o,a19C,IntersectL [a19n,a19o,a19D,a19F]],a19v)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a1aN} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aS} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; GIVENS (names)
a19p  <=  a
a19q  <=  b
a19r  <=  ab
a19s  <=  c
a19t  <=  abc
a19u  <=  bc
a19v  <=  abc'
a19R  <=  fsk_a19R
a19W  <=  fsk_a19W
a1a1  <=  fsk_a1a1
a1a6  <=  fsk_a1a6
(push 1)
(declare-sort Sorta19n)
(declare-sort Sorta19o)
(declare-const
   a19p
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19q
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19r
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19s
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19t
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19u
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19v
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19R
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19W
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a1
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a6
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-fun
   both8514226977520841413
   (
     (Maybe Sorta19o)
     (Maybe Sorta19o))
   (Maybe Sorta19o))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413
            y
            (as
               nothing
               (Maybe Sorta19o)))
         (as
            nothing
            (Maybe Sorta19o)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta19o))
        (y
           (Maybe Sorta19o)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              y))
         (=
            (both8514226977520841413 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19q
           a19s)
         a1a1)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19r
           a19s)
         a19W)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19u)
         a1a6)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19q)
         a19R)
      :named
      given-3.4))
(assert
   (!
      (= a1a1 a19u)
      :named
      given-3.5))
(assert
   (!
      (= a19R a19r)
      :named
      given-3.6))
(assert
   (!
      (= a19W a19t)
      :named
      given-3.7))
(assert
   (!
      (= a1a6 a19v)
      :named
      given-3.8))
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a1aN} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aS} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; WANTEDS (names)
a19t  <=  abc
a19v  <=  abc'
a19C  <=  a_a19C
a19D  <=  b_a19D
a19F  <=  c_a19F
(declare-const
   a19C
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19D
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19F
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map both8514226977520841413)
                    (
                      (_ map both8514226977520841413)
                      a19C
                      a19D)
                    a19F)
                  a19t)))
         (not
            (=
               (
                 (_ map both8514226977520841413)
                 a19C
                 (
                   (_ map both8514226977520841413)
                   a19D
                   a19F))
               a19v)))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_a1a2 {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a19X {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1a7 {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a19S {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1a3 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a19T {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a19Y {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1a8 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1aN} {4}:: IntersectL (IntersectL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1aS} {4}:: IntersectL a0 (IntersectL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a19n,a19o,a19q,a19s],a1a1)
; (IntersectL [a19n,a19o,a19r,a19s],a19W)
; (IntersectL [a19n,a19o,a19p,a19u],a1a6)
; (IntersectL [a19n,a19o,a19p,a19q],a19R)
; (a1a1,a19u)
; (a19R,a19r)
; (a19W,a19t)
; (a1a6,a19v)

; WANTEDS (Thoralf style)
; (IntersectL [a19n,a19o,IntersectL [a19n,a19o,a19C,a19D],a19F],a19t)
; (IntersectL [a19n,a19o,a19C,IntersectL [a19n,a19o,a19D,a19F]],a19v)

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a1aN} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aS} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; GIVENS (names)
a19p  <=  a
a19q  <=  b
a19r  <=  ab
a19s  <=  c
a19t  <=  abc
a19u  <=  bc
a19v  <=  abc'
a19R  <=  fsk_a19R
a19W  <=  fsk_a19W
a1a1  <=  fsk_a1a1
a1a6  <=  fsk_a1a6
(push 1)
(declare-sort Sorta19n)
(declare-sort Sorta19o)
(declare-const
   a19p
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19q
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19r
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19s
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19t
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19u
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19v
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19R
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19W
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a1
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a1a6
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-fun
   both8514226977520841413
   (
     (Maybe Sorta19o)
     (Maybe Sorta19o))
   (Maybe Sorta19o))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413
            y
            (as
               nothing
               (Maybe Sorta19o)))
         (as
            nothing
            (Maybe Sorta19o)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta19o)))
      (=
         (both8514226977520841413 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta19o))
        (y
           (Maybe Sorta19o)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta19o)
                    (Maybe Sorta19o)))
              y))
         (=
            (both8514226977520841413 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19q
           a19s)
         a1a1)
      :named
      given-3.1))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19r
           a19s)
         a19W)
      :named
      given-3.2))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19u)
         a1a6)
      :named
      given-3.3))
(assert
   (!
      (=
         (
           (_ map both8514226977520841413)
           a19p
           a19q)
         a19R)
      :named
      given-3.4))
(assert
   (!
      (= a1a1 a19u)
      :named
      given-3.5))
(assert
   (!
      (= a19R a19r)
      :named
      given-3.6))
(assert
   (!
      (= a19W a19t)
      :named
      given-3.7))
(assert
   (!
      (= a1a6 a19v)
      :named
      given-3.8))
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a1aN} {4}:: IntersectL (IntersectL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      (
;        (_ map both8514226977520841413)
;        a19C
;        a19D)
;      a19F)
;    a19t)

;      [WD] hole{a1aS} {4}:: IntersectL a0 (IntersectL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map both8514226977520841413)
;      a19C
;      (
;        (_ map both8514226977520841413)
;        a19D
;        a19F))
;    a19v)

; WANTEDS (names)
a19t  <=  abc
a19v  <=  abc'
a19C  <=  a_a19C
a19D  <=  b_a19D
a19F  <=  c_a19F
(declare-const
   a19C
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19D
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(declare-const
   a19F
   (Array
      Sorta19n
      (Maybe Sorta19o)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map both8514226977520841413)
                    (
                      (_ map both8514226977520841413)
                      a19C
                      a19D)
                    a19F)
                  a19t)))
         (not
            (=
               (
                 (_ map both8514226977520841413)
                 a19C
                 (
                   (_ map both8514226977520841413)
                   a19D
                   a19F))
               a19v)))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] cobox_a1bZ {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1bU {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1c4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1bP {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1c0 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1bQ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1bV {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1c5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (UnionL [a1bk,a1bl,a1bn,a1bp],a1bY)
; (UnionL [a1bk,a1bl,a1bo,a1bp],a1bT)
; (UnionL [a1bk,a1bl,a1bm,a1br],a1c3)
; (UnionL [a1bk,a1bl,a1bm,a1bn],a1bO)
; (a1bY,a1br)
; (a1bO,a1bo)
; (a1bT,a1bq)
; (a1c3,a1bs)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
a1bm  <=  a
a1bn  <=  b
a1bo  <=  ab
a1bp  <=  c
a1bq  <=  abc
a1br  <=  bc
a1bs  <=  abc'
a1bO  <=  fsk_a1bO
a1bT  <=  fsk_a1bT
a1bY  <=  fsk_a1bY
a1c3  <=  fsk_a1c3
(push 1)
(declare-sort Sorta1bk)
(declare-sort Sorta1bl)
(declare-const
   a1bm
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bn
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bo
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bp
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bq
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1br
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bs
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bO
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bT
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bY
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1c3
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-fun
   either8570520873362452143
   (
     (Maybe Sorta1bl)
     (Maybe Sorta1bl))
   (Maybe Sorta1bl))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bl)))
      (=
         (either8570520873362452143
            (as
               nothing
               (Maybe Sorta1bl))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bl))
        (y
           (Maybe Sorta1bl)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bl)
                 (Maybe Sorta1bl)))
           x)
         (=
            (either8570520873362452143 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bn
           a1bp)
         a1bY)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bo
           a1bp)
         a1bT)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1br)
         a1c3)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1bn)
         a1bO)
      :named
      given-4.4))
(assert
   (!
      (= a1bY a1br)
      :named
      given-4.5))
(assert
   (!
      (= a1bO a1bo)
      :named
      given-4.6))
(assert
   (!
      (= a1bT a1bq)
      :named
      given-4.7))
(assert
   (!
      (= a1c3 a1bs)
      :named
      given-4.8))
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] cobox_a1bZ {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1bU {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1c4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1bP {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1c0 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1bQ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1bV {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1c5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (UnionL [a1bk,a1bl,a1bn,a1bp],a1bY)
; (UnionL [a1bk,a1bl,a1bo,a1bp],a1bT)
; (UnionL [a1bk,a1bl,a1bm,a1br],a1c3)
; (UnionL [a1bk,a1bl,a1bm,a1bn],a1bO)
; (a1bY,a1br)
; (a1bO,a1bo)
; (a1bT,a1bq)
; (a1c3,a1bs)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
a1bm  <=  a
a1bn  <=  b
a1bo  <=  ab
a1bp  <=  c
a1bq  <=  abc
a1br  <=  bc
a1bs  <=  abc'
a1bO  <=  fsk_a1bO
a1bT  <=  fsk_a1bT
a1bY  <=  fsk_a1bY
a1c3  <=  fsk_a1c3
(push 1)
(declare-sort Sorta1bk)
(declare-sort Sorta1bl)
(declare-const
   a1bm
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bn
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bo
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bp
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bq
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1br
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bs
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bO
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bT
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bY
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1c3
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-fun
   either8570520873362452143
   (
     (Maybe Sorta1bl)
     (Maybe Sorta1bl))
   (Maybe Sorta1bl))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bl)))
      (=
         (either8570520873362452143
            (as
               nothing
               (Maybe Sorta1bl))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bl))
        (y
           (Maybe Sorta1bl)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bl)
                 (Maybe Sorta1bl)))
           x)
         (=
            (either8570520873362452143 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bn
           a1bp)
         a1bY)
      :named
      given-4.1))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bo
           a1bp)
         a1bT)
      :named
      given-4.2))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1br)
         a1c3)
      :named
      given-4.3))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1bn)
         a1bO)
      :named
      given-4.4))
(assert
   (!
      (= a1bY a1br)
      :named
      given-4.5))
(assert
   (!
      (= a1bO a1bo)
      :named
      given-4.6))
(assert
   (!
      (= a1bT a1bq)
      :named
      given-4.7))
(assert
   (!
      (= a1c3 a1bs)
      :named
      given-4.8))
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a1bZ {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1bU {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1c4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1bP {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1c0 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1bQ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1bV {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1c5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1cp} {3}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1cB} {3}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1bk,a1bl,a1bn,a1bp],a1bY)
; (UnionL [a1bk,a1bl,a1bo,a1bp],a1bT)
; (UnionL [a1bk,a1bl,a1bm,a1br],a1c3)
; (UnionL [a1bk,a1bl,a1bm,a1bn],a1bO)
; (a1bY,a1br)
; (a1bO,a1bo)
; (a1bT,a1bq)
; (a1c3,a1bs)

; WANTEDS (Thoralf style)
; (UnionL [a1bk,a1bl,UnionL [a1bk,a1bl,a1bz,a1bA],a1bC],a1bq)
; (UnionL [a1bk,a1bl,a1bz,UnionL [a1bk,a1bl,a1bA,a1bC]],a1bs)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a1cp} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cB} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; GIVENS (names)
a1bm  <=  a
a1bn  <=  b
a1bo  <=  ab
a1bp  <=  c
a1bq  <=  abc
a1br  <=  bc
a1bs  <=  abc'
a1bO  <=  fsk_a1bO
a1bT  <=  fsk_a1bT
a1bY  <=  fsk_a1bY
a1c3  <=  fsk_a1c3
(push 1)
(declare-sort Sorta1bk)
(declare-sort Sorta1bl)
(declare-const
   a1bm
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bn
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bo
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bp
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bq
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1br
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bs
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bO
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bT
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bY
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1c3
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-fun
   either8570520873362452143
   (
     (Maybe Sorta1bl)
     (Maybe Sorta1bl))
   (Maybe Sorta1bl))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bl)))
      (=
         (either8570520873362452143
            (as
               nothing
               (Maybe Sorta1bl))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bl))
        (y
           (Maybe Sorta1bl)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bl)
                 (Maybe Sorta1bl)))
           x)
         (=
            (either8570520873362452143 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bn
           a1bp)
         a1bY)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bo
           a1bp)
         a1bT)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1br)
         a1c3)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1bn)
         a1bO)
      :named
      given-5.4))
(assert
   (!
      (= a1bY a1br)
      :named
      given-5.5))
(assert
   (!
      (= a1bO a1bo)
      :named
      given-5.6))
(assert
   (!
      (= a1bT a1bq)
      :named
      given-5.7))
(assert
   (!
      (= a1c3 a1bs)
      :named
      given-5.8))
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{a1cp} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cB} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; WANTEDS (names)
a1bq  <=  abc
a1bs  <=  abc'
a1bz  <=  a_a1bz
a1bA  <=  b_a1bA
a1bC  <=  c_a1bC
(declare-const
   a1bz
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bA
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bC
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map either8570520873362452143)
                    (
                      (_ map either8570520873362452143)
                      a1bz
                      a1bA)
                    a1bC)
                  a1bq)))
         (not
            (=
               (
                 (_ map either8570520873362452143)
                 a1bz
                 (
                   (_ map either8570520873362452143)
                   a1bA
                   a1bC))
               a1bs)))
      :named
      wanted-5))
(check-sat)
sat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a1bZ {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1bU {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1c4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1bP {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1c0 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1bQ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1bV {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1c5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1cp} {3}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1cB} {3}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1bk,a1bl,a1bn,a1bp],a1bY)
; (UnionL [a1bk,a1bl,a1bo,a1bp],a1bT)
; (UnionL [a1bk,a1bl,a1bm,a1br],a1c3)
; (UnionL [a1bk,a1bl,a1bm,a1bn],a1bO)
; (a1bY,a1br)
; (a1bO,a1bo)
; (a1bT,a1bq)
; (a1c3,a1bs)

; WANTEDS (Thoralf style)
; (UnionL [a1bk,a1bl,UnionL [a1bk,a1bl,a1bz,a1bA],a1bC],a1bq)
; (UnionL [a1bk,a1bl,a1bz,UnionL [a1bk,a1bl,a1bA,a1bC]],a1bs)

(echo "givens-start-cycle-5")
; GIVENS (conversions)
;      [WD] hole{a1cp} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cB} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; GIVENS (names)
a1bm  <=  a
a1bn  <=  b
a1bo  <=  ab
a1bp  <=  c
a1bq  <=  abc
a1br  <=  bc
a1bs  <=  abc'
a1bO  <=  fsk_a1bO
a1bT  <=  fsk_a1bT
a1bY  <=  fsk_a1bY
a1c3  <=  fsk_a1c3
(push 1)
(declare-sort Sorta1bk)
(declare-sort Sorta1bl)
(declare-const
   a1bm
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bn
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bo
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bp
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bq
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1br
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bs
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bO
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bT
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bY
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1c3
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-fun
   either8570520873362452143
   (
     (Maybe Sorta1bl)
     (Maybe Sorta1bl))
   (Maybe Sorta1bl))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bl)))
      (=
         (either8570520873362452143
            (as
               nothing
               (Maybe Sorta1bl))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bl))
        (y
           (Maybe Sorta1bl)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bl)
                 (Maybe Sorta1bl)))
           x)
         (=
            (either8570520873362452143 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bn
           a1bp)
         a1bY)
      :named
      given-5.1))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bo
           a1bp)
         a1bT)
      :named
      given-5.2))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1br)
         a1c3)
      :named
      given-5.3))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1bn)
         a1bO)
      :named
      given-5.4))
(assert
   (!
      (= a1bY a1br)
      :named
      given-5.5))
(assert
   (!
      (= a1bO a1bo)
      :named
      given-5.6))
(assert
   (!
      (= a1bT a1bq)
      :named
      given-5.7))
(assert
   (!
      (= a1c3 a1bs)
      :named
      given-5.8))
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{a1cp} {3}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cB} {3}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; WANTEDS (names)
a1bq  <=  abc
a1bs  <=  abc'
a1bz  <=  a_a1bz
a1bA  <=  b_a1bA
a1bC  <=  c_a1bC
(declare-const
   a1bz
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bA
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bC
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map either8570520873362452143)
                    (
                      (_ map either8570520873362452143)
                      a1bz
                      a1bA)
                    a1bC)
                  a1bq)))
         (not
            (=
               (
                 (_ map either8570520873362452143)
                 a1bz
                 (
                   (_ map either8570520873362452143)
                   a1bA
                   a1bC))
               a1bs)))
      :named
      wanted-5))
(check-sat)
sat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a1bZ {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1bU {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1c4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1bP {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1c0 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1bQ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1bV {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1c5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1cG} {4}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1cL} {4}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1bk,a1bl,a1bn,a1bp],a1bY)
; (UnionL [a1bk,a1bl,a1bo,a1bp],a1bT)
; (UnionL [a1bk,a1bl,a1bm,a1br],a1c3)
; (UnionL [a1bk,a1bl,a1bm,a1bn],a1bO)
; (a1bY,a1br)
; (a1bO,a1bo)
; (a1bT,a1bq)
; (a1c3,a1bs)

; WANTEDS (Thoralf style)
; (UnionL [a1bk,a1bl,UnionL [a1bk,a1bl,a1bz,a1bA],a1bC],a1bq)
; (UnionL [a1bk,a1bl,a1bz,UnionL [a1bk,a1bl,a1bA,a1bC]],a1bs)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{a1cG} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cL} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; GIVENS (names)
a1bm  <=  a
a1bn  <=  b
a1bo  <=  ab
a1bp  <=  c
a1bq  <=  abc
a1br  <=  bc
a1bs  <=  abc'
a1bO  <=  fsk_a1bO
a1bT  <=  fsk_a1bT
a1bY  <=  fsk_a1bY
a1c3  <=  fsk_a1c3
(push 1)
(declare-sort Sorta1bk)
(declare-sort Sorta1bl)
(declare-const
   a1bm
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bn
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bo
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bp
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bq
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1br
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bs
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bO
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bT
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bY
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1c3
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-fun
   either8570520873362452143
   (
     (Maybe Sorta1bl)
     (Maybe Sorta1bl))
   (Maybe Sorta1bl))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bl)))
      (=
         (either8570520873362452143
            (as
               nothing
               (Maybe Sorta1bl))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bl))
        (y
           (Maybe Sorta1bl)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bl)
                 (Maybe Sorta1bl)))
           x)
         (=
            (either8570520873362452143 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bn
           a1bp)
         a1bY)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bo
           a1bp)
         a1bT)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1br)
         a1c3)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1bn)
         a1bO)
      :named
      given-6.4))
(assert
   (!
      (= a1bY a1br)
      :named
      given-6.5))
(assert
   (!
      (= a1bO a1bo)
      :named
      given-6.6))
(assert
   (!
      (= a1bT a1bq)
      :named
      given-6.7))
(assert
   (!
      (= a1c3 a1bs)
      :named
      given-6.8))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{a1cG} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cL} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; WANTEDS (names)
a1bq  <=  abc
a1bs  <=  abc'
a1bz  <=  a_a1bz
a1bA  <=  b_a1bA
a1bC  <=  c_a1bC
(declare-const
   a1bz
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bA
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bC
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map either8570520873362452143)
                    (
                      (_ map either8570520873362452143)
                      a1bz
                      a1bA)
                    a1bC)
                  a1bq)))
         (not
            (=
               (
                 (_ map either8570520873362452143)
                 a1bz
                 (
                   (_ map either8570520873362452143)
                   a1bA
                   a1bC))
               a1bs)))
      :named
      wanted-6))
(check-sat)
sat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a1bZ {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1bU {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1c4 {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1bP {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1c0 {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1bQ {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1bV {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1c5 {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1cG} {4}:: UnionL (UnionL a0 b0) c0
;                       ~
;                       abc (CNonCanonical)
; [WD] hole{a1cL} {4}:: UnionL a0 (UnionL b0 c0)
;                       ~
;                       abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1bk,a1bl,a1bn,a1bp],a1bY)
; (UnionL [a1bk,a1bl,a1bo,a1bp],a1bT)
; (UnionL [a1bk,a1bl,a1bm,a1br],a1c3)
; (UnionL [a1bk,a1bl,a1bm,a1bn],a1bO)
; (a1bY,a1br)
; (a1bO,a1bo)
; (a1bT,a1bq)
; (a1c3,a1bs)

; WANTEDS (Thoralf style)
; (UnionL [a1bk,a1bl,UnionL [a1bk,a1bl,a1bz,a1bA],a1bC],a1bq)
; (UnionL [a1bk,a1bl,a1bz,UnionL [a1bk,a1bl,a1bA,a1bC]],a1bs)

(echo "givens-start-cycle-6")
; GIVENS (conversions)
;      [WD] hole{a1cG} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cL} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; GIVENS (names)
a1bm  <=  a
a1bn  <=  b
a1bo  <=  ab
a1bp  <=  c
a1bq  <=  abc
a1br  <=  bc
a1bs  <=  abc'
a1bO  <=  fsk_a1bO
a1bT  <=  fsk_a1bT
a1bY  <=  fsk_a1bY
a1c3  <=  fsk_a1c3
(push 1)
(declare-sort Sorta1bk)
(declare-sort Sorta1bl)
(declare-const
   a1bm
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bn
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bo
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bp
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bq
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1br
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bs
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bO
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bT
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bY
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1c3
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-fun
   either8570520873362452143
   (
     (Maybe Sorta1bl)
     (Maybe Sorta1bl))
   (Maybe Sorta1bl))
(assert
   (forall
      (
        (y
           (Maybe Sorta1bl)))
      (=
         (either8570520873362452143
            (as
               nothing
               (Maybe Sorta1bl))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1bl))
        (y
           (Maybe Sorta1bl)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1bl)
                 (Maybe Sorta1bl)))
           x)
         (=
            (either8570520873362452143 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bn
           a1bp)
         a1bY)
      :named
      given-6.1))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bo
           a1bp)
         a1bT)
      :named
      given-6.2))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1br)
         a1c3)
      :named
      given-6.3))
(assert
   (!
      (=
         (
           (_ map either8570520873362452143)
           a1bm
           a1bn)
         a1bO)
      :named
      given-6.4))
(assert
   (!
      (= a1bY a1br)
      :named
      given-6.5))
(assert
   (!
      (= a1bO a1bo)
      :named
      given-6.6))
(assert
   (!
      (= a1bT a1bq)
      :named
      given-6.7))
(assert
   (!
      (= a1c3 a1bs)
      :named
      given-6.8))
(check-sat)
sat
(echo "givens-finish-cycle-6")
(echo "wanteds-start-cycle-6")
; WANTEDS (conversions)
;      [WD] hole{a1cG} {4}:: UnionL (UnionL a0 b0) c0
;                            ~
;                            abc (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      (
;        (_ map either8570520873362452143)
;        a1bz
;        a1bA)
;      a1bC)
;    a1bq)

;      [WD] hole{a1cL} {4}:: UnionL a0 (UnionL b0 c0)
;                            ~
;                            abc' (CNonCanonical)
;  =>  (=
;    (
;      (_ map either8570520873362452143)
;      a1bz
;      (
;        (_ map either8570520873362452143)
;        a1bA
;        a1bC))
;    a1bs)

; WANTEDS (names)
a1bq  <=  abc
a1bs  <=  abc'
a1bz  <=  a_a1bz
a1bA  <=  b_a1bA
a1bC  <=  c_a1bC
(declare-const
   a1bz
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bA
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(declare-const
   a1bC
   (Array
      Sorta1bk
      (Maybe Sorta1bl)))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (
                    (_ map either8570520873362452143)
                    (
                      (_ map either8570520873362452143)
                      a1bz
                      a1bA)
                    a1bC)
                  a1bq)))
         (not
            (=
               (
                 (_ map either8570520873362452143)
                 a1bz
                 (
                   (_ map either8570520873362452143)
                   a1bA
                   a1bC))
               a1bs)))
      :named
      wanted-6))
(check-sat)
sat
(echo "wanteds-finish-cycle-6")
(pop 1)
(echo "solver-finish-cycle-6")
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a1dp {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dl {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dq {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1dr {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1d7,"ok",2],a1do)
; (Alter [Symbol [],Nat [],a1d6,"ok",2],a1dk)
; (a1do,a1d8)
; (a1dk,a1d7)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a1d6  <=  m1
a1d7  <=  m2
a1d8  <=  m3
a1dk  <=  fsk_a1dk
a1do  <=  fsk_a1do
(push 1)
(declare-const
   a1d6
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d7
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d8
   (Array
      String
      (Maybe Int)))
(declare-const
   a1dk
   (Array
      String
      (Maybe Int)))
(declare-const
   a1do
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1d7
            "ok"
            (just 2))
         a1do)
      :named
      given-7.1))
(assert
   (!
      (=
         (store
            a1d6
            "ok"
            (just 2))
         a1dk)
      :named
      given-7.2))
(assert
   (!
      (= a1do a1d8)
      :named
      given-7.3))
(assert
   (!
      (= a1dk a1d7)
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
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a1dp {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dl {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dq {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1dr {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1d7,"ok",2],a1do)
; (Alter [Symbol [],Nat [],a1d6,"ok",2],a1dk)
; (a1do,a1d8)
; (a1dk,a1d7)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a1d6  <=  m1
a1d7  <=  m2
a1d8  <=  m3
a1dk  <=  fsk_a1dk
a1do  <=  fsk_a1do
(push 1)
(declare-const
   a1d6
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d7
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d8
   (Array
      String
      (Maybe Int)))
(declare-const
   a1dk
   (Array
      String
      (Maybe Int)))
(declare-const
   a1do
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1d7
            "ok"
            (just 2))
         a1do)
      :named
      given-7.1))
(assert
   (!
      (=
         (store
            a1d6
            "ok"
            (just 2))
         a1dk)
      :named
      given-7.2))
(assert
   (!
      (= a1do a1d8)
      :named
      given-7.3))
(assert
   (!
      (= a1dk a1d7)
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
; [G] cobox_a1dp {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dl {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dq {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1dr {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1dA} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1d7,"ok",2],a1do)
; (Alter [Symbol [],Nat [],a1d6,"ok",2],a1dk)
; (a1do,a1d8)
; (a1dk,a1d7)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1db,"ok",2],a1d7)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a1dA} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1db
;       "ok"
;       (just 2))
;    a1d7)

; GIVENS (names)
a1d6  <=  m1
a1d7  <=  m2
a1d8  <=  m3
a1dk  <=  fsk_a1dk
a1do  <=  fsk_a1do
(push 1)
(declare-const
   a1d6
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d7
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d8
   (Array
      String
      (Maybe Int)))
(declare-const
   a1dk
   (Array
      String
      (Maybe Int)))
(declare-const
   a1do
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1d7
            "ok"
            (just 2))
         a1do)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1d6
            "ok"
            (just 2))
         a1dk)
      :named
      given-8.2))
(assert
   (!
      (= a1do a1d8)
      :named
      given-8.3))
(assert
   (!
      (= a1dk a1d7)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a1dA} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1db
;       "ok"
;       (just 2))
;    a1d7)

; WANTEDS (names)
a1d7  <=  m2
a1db  <=  m1_a1db
(declare-const
   a1db
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (or
         false
         (not
            (=
               (store
                  a1db
                  "ok"
                  (just 2))
               a1d7)))
      :named
      wanted-8))
(check-sat)
sat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a1dp {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dl {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1dq {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1dr {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1dA} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1d7,"ok",2],a1do)
; (Alter [Symbol [],Nat [],a1d6,"ok",2],a1dk)
; (a1do,a1d8)
; (a1dk,a1d7)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],Nat [],a1db,"ok",2],a1d7)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a1dA} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1db
;       "ok"
;       (just 2))
;    a1d7)

; GIVENS (names)
a1d6  <=  m1
a1d7  <=  m2
a1d8  <=  m3
a1dk  <=  fsk_a1dk
a1do  <=  fsk_a1do
(push 1)
(declare-const
   a1d6
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d7
   (Array
      String
      (Maybe Int)))
(declare-const
   a1d8
   (Array
      String
      (Maybe Int)))
(declare-const
   a1dk
   (Array
      String
      (Maybe Int)))
(declare-const
   a1do
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1d7
            "ok"
            (just 2))
         a1do)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a1d6
            "ok"
            (just 2))
         a1dk)
      :named
      given-8.2))
(assert
   (!
      (= a1do a1d8)
      :named
      given-8.3))
(assert
   (!
      (= a1dk a1d7)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a1dA} {2}:: Alter m10 "ok" 2 ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1db
;       "ok"
;       (just 2))
;    a1d7)

; WANTEDS (names)
a1d7  <=  m2
a1db  <=  m1_a1db
(declare-const
   a1db
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (or
         false
         (not
            (=
               (store
                  a1db
                  "ok"
                  (just 2))
               a1d7)))
      :named
      wanted-8))
(check-sat)
sat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a1ef {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eb {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eg {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1eh {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1dU,a1dW,"bob"],a1ee)
; (Delete [Symbol [],a1dU,a1dV,"bob"],a1ea)
; (a1ee,a1dX)
; (a1ea,a1dW)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
; GIVENS (conversions)
; GIVENS (names)
a1dV  <=  m1
a1dW  <=  m2
a1dX  <=  m3
a1ea  <=  fsk_a1ea
a1ee  <=  fsk_a1ee
(push 1)
(declare-sort Sorta1dU)
(declare-const
   a1dV
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dW
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dX
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ea
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ee
   (Array
      String
      (Maybe Sorta1dU)))
(assert
   (!
      (=
         (store
            a1dW
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ee)
      :named
      given-9.1))
(assert
   (!
      (=
         (store
            a1dV
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ea)
      :named
      given-9.2))
(assert
   (!
      (= a1ee a1dX)
      :named
      given-9.3))
(assert
   (!
      (= a1ea a1dW)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a1ef {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eb {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eg {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1eh {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1dU,a1dW,"bob"],a1ee)
; (Delete [Symbol [],a1dU,a1dV,"bob"],a1ea)
; (a1ee,a1dX)
; (a1ea,a1dW)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
; GIVENS (conversions)
; GIVENS (names)
a1dV  <=  m1
a1dW  <=  m2
a1dX  <=  m3
a1ea  <=  fsk_a1ea
a1ee  <=  fsk_a1ee
(push 1)
(declare-sort Sorta1dU)
(declare-const
   a1dV
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dW
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dX
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ea
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ee
   (Array
      String
      (Maybe Sorta1dU)))
(assert
   (!
      (=
         (store
            a1dW
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ee)
      :named
      given-9.1))
(assert
   (!
      (=
         (store
            a1dV
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ea)
      :named
      given-9.2))
(assert
   (!
      (= a1ee a1dX)
      :named
      given-9.3))
(assert
   (!
      (= a1ea a1dW)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a1ef {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eb {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eg {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1eh {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1eq} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1dU,a1dW,"bob"],a1ee)
; (Delete [Symbol [],a1dU,a1dV,"bob"],a1ea)
; (a1ee,a1dX)
; (a1ea,a1dW)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1dU,a1e1,"bob"],a1dW)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{a1eq} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1e1
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1dU)))
;    a1dW)

; GIVENS (names)
a1dV  <=  m1
a1dW  <=  m2
a1dX  <=  m3
a1ea  <=  fsk_a1ea
a1ee  <=  fsk_a1ee
(push 1)
(declare-sort Sorta1dU)
(declare-const
   a1dV
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dW
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dX
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ea
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ee
   (Array
      String
      (Maybe Sorta1dU)))
(assert
   (!
      (=
         (store
            a1dW
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ee)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1dV
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ea)
      :named
      given-10.2))
(assert
   (!
      (= a1ee a1dX)
      :named
      given-10.3))
(assert
   (!
      (= a1ea a1dW)
      :named
      given-10.4))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{a1eq} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1e1
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1dU)))
;    a1dW)

; WANTEDS (names)
a1dW  <=  m2
a1e1  <=  m1_a1e1
(declare-const
   a1e1
   (Array
      String
      (Maybe Sorta1dU)))
(assert
   (!
      (or
         false
         (not
            (=
               (store
                  a1e1
                  "bob"
                  (as
                     nothing
                     (Maybe Sorta1dU)))
               a1dW)))
      :named
      wanted-10))
(check-sat)
sat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a1ef {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eb {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1eg {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1eh {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1eq} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1dU,a1dW,"bob"],a1ee)
; (Delete [Symbol [],a1dU,a1dV,"bob"],a1ea)
; (a1ee,a1dX)
; (a1ea,a1dW)

; WANTEDS (Thoralf style)
; (Delete [Symbol [],a1dU,a1e1,"bob"],a1dW)

(echo "givens-start-cycle-10")
; GIVENS (conversions)
;      [WD] hole{a1eq} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1e1
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1dU)))
;    a1dW)

; GIVENS (names)
a1dV  <=  m1
a1dW  <=  m2
a1dX  <=  m3
a1ea  <=  fsk_a1ea
a1ee  <=  fsk_a1ee
(push 1)
(declare-sort Sorta1dU)
(declare-const
   a1dV
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dW
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1dX
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ea
   (Array
      String
      (Maybe Sorta1dU)))
(declare-const
   a1ee
   (Array
      String
      (Maybe Sorta1dU)))
(assert
   (!
      (=
         (store
            a1dW
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ee)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a1dV
            "bob"
            (as
               nothing
               (Maybe Sorta1dU)))
         a1ea)
      :named
      given-10.2))
(assert
   (!
      (= a1ee a1dX)
      :named
      given-10.3))
(assert
   (!
      (= a1ea a1dW)
      :named
      given-10.4))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
;      [WD] hole{a1eq} {2}:: Delete m10 "bob" ~ m2 (CNonCanonical)
;  =>  (=
;    (store
;       a1e1
;       "bob"
;       (as
;          nothing
;          (Maybe Sorta1dU)))
;    a1dW)

; WANTEDS (names)
a1dW  <=  m2
a1e1  <=  m1_a1e1
(declare-const
   a1e1
   (Array
      String
      (Maybe Sorta1dU)))
(assert
   (!
      (or
         false
         (not
            (=
               (store
                  a1e1
                  "bob"
                  (as
                     nothing
                     (Maybe Sorta1dU)))
               a1dW)))
      :named
      wanted-10))
(check-sat)
sat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a1fU} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
;                       ~
;                       Alter (Alter Nil 2 "hi") 1 "ok" (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],1,"ok"],2,"hi"],Alter [Nat [],Symbol [],Alter [Nat [],Symbol [],Nil [Nat [],Symbol []],2,"hi"],1,"ok"])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{a1fU} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{a1fU} {2}:: Alter (Alter Nil 1 "ok") 2 "hi"
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
(assert
   (!
      (or
         false
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
                  (just "ok")))))
      :named
      wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a1ge {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1g9 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gj {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1g4 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gf {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1g5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1ga {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (IntersectL [a1eE,a1eF,a1eH,a1eJ],a1gd)
; (IntersectL [a1eE,a1eF,a1eI,a1eJ],a1g8)
; (IntersectL [a1eE,a1eF,a1eG,a1eL],a1gi)
; (IntersectL [a1eE,a1eF,a1eG,a1eH],a1g3)
; (a1gd,a1eL)
; (a1g3,a1eI)
; (a1g8,a1eK)
; (a1gi,a1eM)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a1eG  <=  a
a1eH  <=  b
a1eI  <=  ab
a1eJ  <=  c
a1eK  <=  abc
a1eL  <=  bc
a1eM  <=  abc'
a1g3  <=  fsk_a1g3
a1g8  <=  fsk_a1g8
a1gd  <=  fsk_a1gd
a1gi  <=  fsk_a1gi
(push 1)
(declare-sort Sorta1eE)
(declare-sort Sorta1eF)
(declare-const
   a1eG
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eH
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eI
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eJ
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eK
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eL
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eM
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g3
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g8
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gd
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gi
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-fun
   both8571567608432319790
   (
     (Maybe Sorta1eF)
     (Maybe Sorta1eF))
   (Maybe Sorta1eF))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790
            y
            (as
               nothing
               (Maybe Sorta1eF)))
         (as
            nothing
            (Maybe Sorta1eF)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eF))
        (y
           (Maybe Sorta1eF)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              y))
         (=
            (both8571567608432319790 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eH
           a1eJ)
         a1gd)
      :named
      given-12.1))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eI
           a1eJ)
         a1g8)
      :named
      given-12.2))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eL)
         a1gi)
      :named
      given-12.3))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eH)
         a1g3)
      :named
      given-12.4))
(assert
   (!
      (= a1gd a1eL)
      :named
      given-12.5))
(assert
   (!
      (= a1g3 a1eI)
      :named
      given-12.6))
(assert
   (!
      (= a1g8 a1eK)
      :named
      given-12.7))
(assert
   (!
      (= a1gi a1eM)
      :named
      given-12.8))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a1ge {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1g9 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gj {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1g4 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gf {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1g5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1ga {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (IntersectL [a1eE,a1eF,a1eH,a1eJ],a1gd)
; (IntersectL [a1eE,a1eF,a1eI,a1eJ],a1g8)
; (IntersectL [a1eE,a1eF,a1eG,a1eL],a1gi)
; (IntersectL [a1eE,a1eF,a1eG,a1eH],a1g3)
; (a1gd,a1eL)
; (a1g3,a1eI)
; (a1g8,a1eK)
; (a1gi,a1eM)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a1eG  <=  a
a1eH  <=  b
a1eI  <=  ab
a1eJ  <=  c
a1eK  <=  abc
a1eL  <=  bc
a1eM  <=  abc'
a1g3  <=  fsk_a1g3
a1g8  <=  fsk_a1g8
a1gd  <=  fsk_a1gd
a1gi  <=  fsk_a1gi
(push 1)
(declare-sort Sorta1eE)
(declare-sort Sorta1eF)
(declare-const
   a1eG
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eH
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eI
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eJ
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eK
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eL
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eM
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g3
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g8
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gd
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gi
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-fun
   both8571567608432319790
   (
     (Maybe Sorta1eF)
     (Maybe Sorta1eF))
   (Maybe Sorta1eF))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790
            y
            (as
               nothing
               (Maybe Sorta1eF)))
         (as
            nothing
            (Maybe Sorta1eF)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eF))
        (y
           (Maybe Sorta1eF)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              y))
         (=
            (both8571567608432319790 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eH
           a1eJ)
         a1gd)
      :named
      given-12.1))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eI
           a1eJ)
         a1g8)
      :named
      given-12.2))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eL)
         a1gi)
      :named
      given-12.3))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eH)
         a1g3)
      :named
      given-12.4))
(assert
   (!
      (= a1gd a1eL)
      :named
      given-12.5))
(assert
   (!
      (= a1g3 a1eI)
      :named
      given-12.6))
(assert
   (!
      (= a1g8 a1eK)
      :named
      given-12.7))
(assert
   (!
      (= a1gi a1eM)
      :named
      given-12.8))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a1ge {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1g9 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gj {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1g4 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gf {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1g5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1ga {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1eU} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (IntersectL [a1eE,a1eF,a1eH,a1eJ],a1gd)
; (IntersectL [a1eE,a1eF,a1eI,a1eJ],a1g8)
; (IntersectL [a1eE,a1eF,a1eG,a1eL],a1gi)
; (IntersectL [a1eE,a1eF,a1eG,a1eH],a1g3)
; (a1gd,a1eL)
; (a1g3,a1eI)
; (a1g8,a1eK)
; (a1gi,a1eM)

; WANTEDS (Thoralf style)
; (a1eK,a1eM)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{a1eU} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1eK a1eM)

; GIVENS (names)
a1eG  <=  a
a1eH  <=  b
a1eI  <=  ab
a1eJ  <=  c
a1eK  <=  abc
a1eL  <=  bc
a1eM  <=  abc'
a1g3  <=  fsk_a1g3
a1g8  <=  fsk_a1g8
a1gd  <=  fsk_a1gd
a1gi  <=  fsk_a1gi
(push 1)
(declare-sort Sorta1eE)
(declare-sort Sorta1eF)
(declare-const
   a1eG
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eH
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eI
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eJ
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eK
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eL
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eM
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g3
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g8
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gd
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gi
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-fun
   both8571567608432319790
   (
     (Maybe Sorta1eF)
     (Maybe Sorta1eF))
   (Maybe Sorta1eF))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790
            y
            (as
               nothing
               (Maybe Sorta1eF)))
         (as
            nothing
            (Maybe Sorta1eF)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eF))
        (y
           (Maybe Sorta1eF)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              y))
         (=
            (both8571567608432319790 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eH
           a1eJ)
         a1gd)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eI
           a1eJ)
         a1g8)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eL)
         a1gi)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eH)
         a1g3)
      :named
      given-13.4))
(assert
   (!
      (= a1gd a1eL)
      :named
      given-13.5))
(assert
   (!
      (= a1g3 a1eI)
      :named
      given-13.6))
(assert
   (!
      (= a1g8 a1eK)
      :named
      given-13.7))
(assert
   (!
      (= a1gi a1eM)
      :named
      given-13.8))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{a1eU} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1eK a1eM)

; WANTEDS (names)
a1eK  <=  abc
a1eM  <=  abc'
(assert
   (!
      (or
         false
         (not
            (= a1eK a1eM)))
      :named
      wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a1ge {0}:: IntersectL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1g9 {0}:: IntersectL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gj {0}:: IntersectL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1g4 {0}:: IntersectL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gf {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1g5 {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1ga {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gk {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (IntersectL [a1eE,a1eF,a1eH,a1eJ],a1gd)
; (IntersectL [a1eE,a1eF,a1eI,a1eJ],a1g8)
; (IntersectL [a1eE,a1eF,a1eG,a1eL],a1gi)
; (IntersectL [a1eE,a1eF,a1eG,a1eH],a1g3)
; (a1gd,a1eL)
; (a1g3,a1eI)
; (a1g8,a1eK)
; (a1gi,a1eM)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
; GIVENS (conversions)
; GIVENS (names)
a1eG  <=  a
a1eH  <=  b
a1eI  <=  ab
a1eJ  <=  c
a1eK  <=  abc
a1eL  <=  bc
a1eM  <=  abc'
a1g3  <=  fsk_a1g3
a1g8  <=  fsk_a1g8
a1gd  <=  fsk_a1gd
a1gi  <=  fsk_a1gi
(push 1)
(declare-sort Sorta1eE)
(declare-sort Sorta1eF)
(declare-const
   a1eG
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eH
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eI
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eJ
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eK
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eL
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1eM
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g3
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1g8
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gd
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-const
   a1gi
   (Array
      Sorta1eE
      (Maybe Sorta1eF)))
(declare-fun
   both8571567608432319790
   (
     (Maybe Sorta1eF)
     (Maybe Sorta1eF))
   (Maybe Sorta1eF))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790
            y
            (as
               nothing
               (Maybe Sorta1eF)))
         (as
            nothing
            (Maybe Sorta1eF)))))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eF)))
      (=
         (both8571567608432319790 nothing y)
         nothing)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eF))
        (y
           (Maybe Sorta1eF)))
      (=>
         (and
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              x)
            (
              (_
                 is
                 (just
                    (Sorta1eF)
                    (Maybe Sorta1eF)))
              y))
         (=
            (both8571567608432319790 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eH
           a1eJ)
         a1gd)
      :named
      given-13.1))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eI
           a1eJ)
         a1g8)
      :named
      given-13.2))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eL)
         a1gi)
      :named
      given-13.3))
(assert
   (!
      (=
         (
           (_ map both8571567608432319790)
           a1eG
           a1eH)
         a1g3)
      :named
      given-13.4))
(assert
   (!
      (= a1gd a1eL)
      :named
      given-13.5))
(assert
   (!
      (= a1g3 a1eI)
      :named
      given-13.6))
(assert
   (!
      (= a1g8 a1eK)
      :named
      given-13.7))
(assert
   (!
      (= a1gi a1eM)
      :named
      given-13.8))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a1gG {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gB {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gL {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1gw {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gH {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1gx {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1gC {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gM {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (UnionL [a1eW,a1eX,a1eZ,a1f1],a1gF)
; (UnionL [a1eW,a1eX,a1f0,a1f1],a1gA)
; (UnionL [a1eW,a1eX,a1eY,a1f3],a1gK)
; (UnionL [a1eW,a1eX,a1eY,a1eZ],a1gv)
; (a1gF,a1f3)
; (a1gv,a1f0)
; (a1gA,a1f2)
; (a1gK,a1f4)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a1eY  <=  a
a1eZ  <=  b
a1f0  <=  ab
a1f1  <=  c
a1f2  <=  abc
a1f3  <=  bc
a1f4  <=  abc'
a1gv  <=  fsk_a1gv
a1gA  <=  fsk_a1gA
a1gF  <=  fsk_a1gF
a1gK  <=  fsk_a1gK
(push 1)
(declare-sort Sorta1eW)
(declare-sort Sorta1eX)
(declare-const
   a1eY
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1eZ
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f0
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f1
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f2
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f3
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f4
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gv
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gA
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gF
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gK
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-fun
   either8571596195734653276
   (
     (Maybe Sorta1eX)
     (Maybe Sorta1eX))
   (Maybe Sorta1eX))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eX)))
      (=
         (either8571596195734653276
            (as
               nothing
               (Maybe Sorta1eX))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eX))
        (y
           (Maybe Sorta1eX)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eX)
                 (Maybe Sorta1eX)))
           x)
         (=
            (either8571596195734653276 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eZ
           a1f1)
         a1gF)
      :named
      given-14.1))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1f0
           a1f1)
         a1gA)
      :named
      given-14.2))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1f3)
         a1gK)
      :named
      given-14.3))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1eZ)
         a1gv)
      :named
      given-14.4))
(assert
   (!
      (= a1gF a1f3)
      :named
      given-14.5))
(assert
   (!
      (= a1gv a1f0)
      :named
      given-14.6))
(assert
   (!
      (= a1gA a1f2)
      :named
      given-14.7))
(assert
   (!
      (= a1gK a1f4)
      :named
      given-14.8))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a1gG {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gB {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gL {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1gw {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gH {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1gx {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1gC {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gM {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (UnionL [a1eW,a1eX,a1eZ,a1f1],a1gF)
; (UnionL [a1eW,a1eX,a1f0,a1f1],a1gA)
; (UnionL [a1eW,a1eX,a1eY,a1f3],a1gK)
; (UnionL [a1eW,a1eX,a1eY,a1eZ],a1gv)
; (a1gF,a1f3)
; (a1gv,a1f0)
; (a1gA,a1f2)
; (a1gK,a1f4)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a1eY  <=  a
a1eZ  <=  b
a1f0  <=  ab
a1f1  <=  c
a1f2  <=  abc
a1f3  <=  bc
a1f4  <=  abc'
a1gv  <=  fsk_a1gv
a1gA  <=  fsk_a1gA
a1gF  <=  fsk_a1gF
a1gK  <=  fsk_a1gK
(push 1)
(declare-sort Sorta1eW)
(declare-sort Sorta1eX)
(declare-const
   a1eY
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1eZ
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f0
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f1
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f2
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f3
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f4
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gv
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gA
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gF
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gK
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-fun
   either8571596195734653276
   (
     (Maybe Sorta1eX)
     (Maybe Sorta1eX))
   (Maybe Sorta1eX))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eX)))
      (=
         (either8571596195734653276
            (as
               nothing
               (Maybe Sorta1eX))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eX))
        (y
           (Maybe Sorta1eX)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eX)
                 (Maybe Sorta1eX)))
           x)
         (=
            (either8571596195734653276 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eZ
           a1f1)
         a1gF)
      :named
      given-14.1))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1f0
           a1f1)
         a1gA)
      :named
      given-14.2))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1f3)
         a1gK)
      :named
      given-14.3))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1eZ)
         a1gv)
      :named
      given-14.4))
(assert
   (!
      (= a1gF a1f3)
      :named
      given-14.5))
(assert
   (!
      (= a1gv a1f0)
      :named
      given-14.6))
(assert
   (!
      (= a1gA a1f2)
      :named
      given-14.7))
(assert
   (!
      (= a1gK a1f4)
      :named
      given-14.8))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a1gG {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gB {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gL {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1gw {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gH {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1gx {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1gC {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gM {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1fc} {0}:: abc ~ abc' (CNonCanonical)

; GIVENS (Thoralf style)
; (UnionL [a1eW,a1eX,a1eZ,a1f1],a1gF)
; (UnionL [a1eW,a1eX,a1f0,a1f1],a1gA)
; (UnionL [a1eW,a1eX,a1eY,a1f3],a1gK)
; (UnionL [a1eW,a1eX,a1eY,a1eZ],a1gv)
; (a1gF,a1f3)
; (a1gv,a1f0)
; (a1gA,a1f2)
; (a1gK,a1f4)

; WANTEDS (Thoralf style)
; (a1f2,a1f4)

(echo "givens-start-cycle-15")
; GIVENS (conversions)
;      [WD] hole{a1fc} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1f2 a1f4)

; GIVENS (names)
a1eY  <=  a
a1eZ  <=  b
a1f0  <=  ab
a1f1  <=  c
a1f2  <=  abc
a1f3  <=  bc
a1f4  <=  abc'
a1gv  <=  fsk_a1gv
a1gA  <=  fsk_a1gA
a1gF  <=  fsk_a1gF
a1gK  <=  fsk_a1gK
(push 1)
(declare-sort Sorta1eW)
(declare-sort Sorta1eX)
(declare-const
   a1eY
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1eZ
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f0
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f1
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f2
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f3
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f4
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gv
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gA
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gF
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gK
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-fun
   either8571596195734653276
   (
     (Maybe Sorta1eX)
     (Maybe Sorta1eX))
   (Maybe Sorta1eX))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eX)))
      (=
         (either8571596195734653276
            (as
               nothing
               (Maybe Sorta1eX))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eX))
        (y
           (Maybe Sorta1eX)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eX)
                 (Maybe Sorta1eX)))
           x)
         (=
            (either8571596195734653276 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eZ
           a1f1)
         a1gF)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1f0
           a1f1)
         a1gA)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1f3)
         a1gK)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1eZ)
         a1gv)
      :named
      given-15.4))
(assert
   (!
      (= a1gF a1f3)
      :named
      given-15.5))
(assert
   (!
      (= a1gv a1f0)
      :named
      given-15.6))
(assert
   (!
      (= a1gA a1f2)
      :named
      given-15.7))
(assert
   (!
      (= a1gK a1f4)
      :named
      given-15.8))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
;      [WD] hole{a1fc} {0}:: abc ~ abc' (CNonCanonical)
;  =>  (= a1f2 a1f4)

; WANTEDS (names)
a1f2  <=  abc
a1f4  <=  abc'
(assert
   (!
      (or
         false
         (not
            (= a1f2 a1f4)))
      :named
      wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a1gG {0}:: UnionL b c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gB {0}:: UnionL ab c ~ fsk0 (CFunEqCan)
; [G] cobox_a1gL {0}:: UnionL a bc ~ fsk0 (CFunEqCan)
; [G] cobox_a1gw {0}:: UnionL a b ~ fsk0 (CFunEqCan)
; [G] cobox_a1gH {1}:: fsk0 ~ bc (CTyEqCan)
; [G] cobox_a1gx {1}:: fsk0 ~ ab (CTyEqCan)
; [G] cobox_a1gC {1}:: fsk0 ~ abc (CTyEqCan)
; [G] cobox_a1gM {1}:: fsk0 ~ abc' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (UnionL [a1eW,a1eX,a1eZ,a1f1],a1gF)
; (UnionL [a1eW,a1eX,a1f0,a1f1],a1gA)
; (UnionL [a1eW,a1eX,a1eY,a1f3],a1gK)
; (UnionL [a1eW,a1eX,a1eY,a1eZ],a1gv)
; (a1gF,a1f3)
; (a1gv,a1f0)
; (a1gA,a1f2)
; (a1gK,a1f4)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
; GIVENS (conversions)
; GIVENS (names)
a1eY  <=  a
a1eZ  <=  b
a1f0  <=  ab
a1f1  <=  c
a1f2  <=  abc
a1f3  <=  bc
a1f4  <=  abc'
a1gv  <=  fsk_a1gv
a1gA  <=  fsk_a1gA
a1gF  <=  fsk_a1gF
a1gK  <=  fsk_a1gK
(push 1)
(declare-sort Sorta1eW)
(declare-sort Sorta1eX)
(declare-const
   a1eY
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1eZ
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f0
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f1
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f2
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f3
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1f4
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gv
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gA
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gF
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-const
   a1gK
   (Array
      Sorta1eW
      (Maybe Sorta1eX)))
(declare-fun
   either8571596195734653276
   (
     (Maybe Sorta1eX)
     (Maybe Sorta1eX))
   (Maybe Sorta1eX))
(assert
   (forall
      (
        (y
           (Maybe Sorta1eX)))
      (=
         (either8571596195734653276
            (as
               nothing
               (Maybe Sorta1eX))
            y)
         y)))
(assert
   (forall
      (
        (x
           (Maybe Sorta1eX))
        (y
           (Maybe Sorta1eX)))
      (=>
         (
           (_
              is
              (just
                 (Sorta1eX)
                 (Maybe Sorta1eX)))
           x)
         (=
            (either8571596195734653276 x y)
            x))))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eZ
           a1f1)
         a1gF)
      :named
      given-15.1))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1f0
           a1f1)
         a1gA)
      :named
      given-15.2))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1f3)
         a1gK)
      :named
      given-15.3))
(assert
   (!
      (=
         (
           (_ map either8571596195734653276)
           a1eY
           a1eZ)
         a1gv)
      :named
      given-15.4))
(assert
   (!
      (= a1gF a1f3)
      :named
      given-15.5))
(assert
   (!
      (= a1gv a1f0)
      :named
      given-15.6))
(assert
   (!
      (= a1gA a1f2)
      :named
      given-15.7))
(assert
   (!
      (= a1gK a1f4)
      :named
      given-15.8))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a1h2 {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1gY {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1h3 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1h4 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ff,"ok",2],a1h1)
; (Alter [Symbol [],Nat [],a1fe,"ok",2],a1gX)
; (a1h1,a1fg)
; (a1gX,a1ff)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-16")
; GIVENS (conversions)
; GIVENS (names)
a1fe  <=  m1
a1ff  <=  m2
a1fg  <=  m3
a1gX  <=  fsk_a1gX
a1h1  <=  fsk_a1h1
(push 1)
(declare-const
   a1fe
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ff
   (Array
      String
      (Maybe Int)))
(declare-const
   a1fg
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gX
   (Array
      String
      (Maybe Int)))
(declare-const
   a1h1
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ff
            "ok"
            (just 2))
         a1h1)
      :named
      given-16.1))
(assert
   (!
      (=
         (store
            a1fe
            "ok"
            (just 2))
         a1gX)
      :named
      given-16.2))
(assert
   (!
      (= a1h1 a1fg)
      :named
      given-16.3))
(assert
   (!
      (= a1gX a1ff)
      :named
      given-16.4))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a1h2 {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1gY {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1h3 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1h4 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ff,"ok",2],a1h1)
; (Alter [Symbol [],Nat [],a1fe,"ok",2],a1gX)
; (a1h1,a1fg)
; (a1gX,a1ff)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-16")
; GIVENS (conversions)
; GIVENS (names)
a1fe  <=  m1
a1ff  <=  m2
a1fg  <=  m3
a1gX  <=  fsk_a1gX
a1h1  <=  fsk_a1h1
(push 1)
(declare-const
   a1fe
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ff
   (Array
      String
      (Maybe Int)))
(declare-const
   a1fg
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gX
   (Array
      String
      (Maybe Int)))
(declare-const
   a1h1
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ff
            "ok"
            (just 2))
         a1h1)
      :named
      given-16.1))
(assert
   (!
      (=
         (store
            a1fe
            "ok"
            (just 2))
         a1gX)
      :named
      given-16.2))
(assert
   (!
      (= a1h1 a1fg)
      :named
      given-16.3))
(assert
   (!
      (= a1gX a1ff)
      :named
      given-16.4))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a1h2 {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1gY {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1h3 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1h4 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1fm} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ff,"ok",2],a1h1)
; (Alter [Symbol [],Nat [],a1fe,"ok",2],a1gX)
; (a1h1,a1fg)
; (a1gX,a1ff)

; WANTEDS (Thoralf style)
; (a1ff,a1fg)

(echo "givens-start-cycle-17")
; GIVENS (conversions)
;      [WD] hole{a1fm} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ff a1fg)

; GIVENS (names)
a1fe  <=  m1
a1ff  <=  m2
a1fg  <=  m3
a1gX  <=  fsk_a1gX
a1h1  <=  fsk_a1h1
(push 1)
(declare-const
   a1fe
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ff
   (Array
      String
      (Maybe Int)))
(declare-const
   a1fg
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gX
   (Array
      String
      (Maybe Int)))
(declare-const
   a1h1
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ff
            "ok"
            (just 2))
         a1h1)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            a1fe
            "ok"
            (just 2))
         a1gX)
      :named
      given-17.2))
(assert
   (!
      (= a1h1 a1fg)
      :named
      given-17.3))
(assert
   (!
      (= a1gX a1ff)
      :named
      given-17.4))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
;      [WD] hole{a1fm} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1ff a1fg)

; WANTEDS (names)
a1ff  <=  m2
a1fg  <=  m3
(assert
   (!
      (or
         false
         (not
            (= a1ff a1fg)))
      :named
      wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a1h2 {0}:: Alter m2 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1gY {0}:: Alter m1 "ok" 2 ~ fsk0 (CFunEqCan)
; [G] cobox_a1h3 {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1h4 {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],Nat [],a1ff,"ok",2],a1h1)
; (Alter [Symbol [],Nat [],a1fe,"ok",2],a1gX)
; (a1h1,a1fg)
; (a1gX,a1ff)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
; GIVENS (conversions)
; GIVENS (names)
a1fe  <=  m1
a1ff  <=  m2
a1fg  <=  m3
a1gX  <=  fsk_a1gX
a1h1  <=  fsk_a1h1
(push 1)
(declare-const
   a1fe
   (Array
      String
      (Maybe Int)))
(declare-const
   a1ff
   (Array
      String
      (Maybe Int)))
(declare-const
   a1fg
   (Array
      String
      (Maybe Int)))
(declare-const
   a1gX
   (Array
      String
      (Maybe Int)))
(declare-const
   a1h1
   (Array
      String
      (Maybe Int)))
(assert
   (!
      (=
         (store
            a1ff
            "ok"
            (just 2))
         a1h1)
      :named
      given-17.1))
(assert
   (!
      (=
         (store
            a1fe
            "ok"
            (just 2))
         a1gX)
      :named
      given-17.2))
(assert
   (!
      (= a1h1 a1fg)
      :named
      given-17.3))
(assert
   (!
      (= a1gX a1ff)
      :named
      given-17.4))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a1hg {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hc {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hh {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1hi {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1fo,a1fq,"bob"],a1hf)
; (Delete [Symbol [],a1fo,a1fp,"bob"],a1hb)
; (a1hf,a1fr)
; (a1hb,a1fq)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
; GIVENS (conversions)
; GIVENS (names)
a1fp  <=  m1
a1fq  <=  m2
a1fr  <=  m3
a1hb  <=  fsk_a1hb
a1hf  <=  fsk_a1hf
(push 1)
(declare-sort Sorta1fo)
(declare-const
   a1fp
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fq
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fr
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hb
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hf
   (Array
      String
      (Maybe Sorta1fo)))
(assert
   (!
      (=
         (store
            a1fq
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hf)
      :named
      given-18.1))
(assert
   (!
      (=
         (store
            a1fp
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hb)
      :named
      given-18.2))
(assert
   (!
      (= a1hf a1fr)
      :named
      given-18.3))
(assert
   (!
      (= a1hb a1fq)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a1hg {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hc {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hh {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1hi {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1fo,a1fq,"bob"],a1hf)
; (Delete [Symbol [],a1fo,a1fp,"bob"],a1hb)
; (a1hf,a1fr)
; (a1hb,a1fq)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
; GIVENS (conversions)
; GIVENS (names)
a1fp  <=  m1
a1fq  <=  m2
a1fr  <=  m3
a1hb  <=  fsk_a1hb
a1hf  <=  fsk_a1hf
(push 1)
(declare-sort Sorta1fo)
(declare-const
   a1fp
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fq
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fr
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hb
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hf
   (Array
      String
      (Maybe Sorta1fo)))
(assert
   (!
      (=
         (store
            a1fq
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hf)
      :named
      given-18.1))
(assert
   (!
      (=
         (store
            a1fp
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hb)
      :named
      given-18.2))
(assert
   (!
      (= a1hf a1fr)
      :named
      given-18.3))
(assert
   (!
      (= a1hb a1fq)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a1hg {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hc {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hh {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1hi {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a1fx} {0}:: m2 ~ m3 (CNonCanonical)

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1fo,a1fq,"bob"],a1hf)
; (Delete [Symbol [],a1fo,a1fp,"bob"],a1hb)
; (a1hf,a1fr)
; (a1hb,a1fq)

; WANTEDS (Thoralf style)
; (a1fq,a1fr)

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{a1fx} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1fq a1fr)

; GIVENS (names)
a1fp  <=  m1
a1fq  <=  m2
a1fr  <=  m3
a1hb  <=  fsk_a1hb
a1hf  <=  fsk_a1hf
(push 1)
(declare-sort Sorta1fo)
(declare-const
   a1fp
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fq
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fr
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hb
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hf
   (Array
      String
      (Maybe Sorta1fo)))
(assert
   (!
      (=
         (store
            a1fq
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hf)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            a1fp
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hb)
      :named
      given-19.2))
(assert
   (!
      (= a1hf a1fr)
      :named
      given-19.3))
(assert
   (!
      (= a1hb a1fq)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{a1fx} {0}:: m2 ~ m3 (CNonCanonical)
;  =>  (= a1fq a1fr)

; WANTEDS (names)
a1fq  <=  m2
a1fr  <=  m3
(assert
   (!
      (or
         false
         (not
            (= a1fq a1fr)))
      :named
      wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a1hg {0}:: Delete m2 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hc {0}:: Delete m1 "bob" ~ fsk0 (CFunEqCan)
; [G] cobox_a1hh {1}:: fsk0 ~ m3 (CTyEqCan)
; [G] cobox_a1hi {1}:: fsk0 ~ m2 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],a1fo,a1fq,"bob"],a1hf)
; (Delete [Symbol [],a1fo,a1fp,"bob"],a1hb)
; (a1hf,a1fr)
; (a1hb,a1fq)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-19")
; GIVENS (conversions)
; GIVENS (names)
a1fp  <=  m1
a1fq  <=  m2
a1fr  <=  m3
a1hb  <=  fsk_a1hb
a1hf  <=  fsk_a1hf
(push 1)
(declare-sort Sorta1fo)
(declare-const
   a1fp
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fq
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1fr
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hb
   (Array
      String
      (Maybe Sorta1fo)))
(declare-const
   a1hf
   (Array
      String
      (Maybe Sorta1fo)))
(assert
   (!
      (=
         (store
            a1fq
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hf)
      :named
      given-19.1))
(assert
   (!
      (=
         (store
            a1fp
            "bob"
            (as
               nothing
               (Maybe Sorta1fo)))
         a1hb)
      :named
      given-19.2))
(assert
   (!
      (= a1hf a1fr)
      :named
      given-19.3))
(assert
   (!
      (= a1hb a1fq)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(exit)
(exit)
; [2 of 4] Compiling Nat
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
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
; [WD] hole{a3jV} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a3jQ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a3k0} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3jC,a3jD],<? [a3jF,a3jG])
; (<? [a3jE,a3jG],<? [a3jB,a3jD])
; (<? [a3jB,a3jC],<? [a3jE,a3jF])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a3jV} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jC a3jD)
;    (< a3jF a3jG))

;      [WD] hole{a3jQ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jE a3jG)
;    (< a3jB a3jD))

;      [WD] hole{a3k0} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3jB a3jC)
;    (< a3jE a3jF))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a3jV} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jC a3jD)
;    (< a3jF a3jG))

;      [WD] hole{a3jQ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jE a3jG)
;    (< a3jB a3jD))

;      [WD] hole{a3k0} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3jB a3jC)
;    (< a3jE a3jF))

; WANTEDS (names)
a3jB  <=  a
a3jC  <=  b
a3jD  <=  c
a3jE  <=  a_a3jE
a3jF  <=  b_a3jF
a3jG  <=  c_a3jG
(declare-const a3jB Int)
(declare-const a3jC Int)
(declare-const a3jD Int)
(declare-const a3jE Int)
(declare-const a3jF Int)
(declare-const a3jG Int)
(assert
   (<= 0 a3jB))
(assert
   (<= 0 a3jC))
(assert
   (<= 0 a3jD))
(assert
   (<= 0 a3jE))
(assert
   (<= 0 a3jF))
(assert
   (<= 0 a3jG))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a3jC a3jD)
                     (< a3jF a3jG))))
            (not
               (=
                  (< a3jE a3jG)
                  (< a3jB a3jD))))
         (not
            (=
               (< a3jB a3jC)
               (< a3jE a3jF))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3jV} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a3jQ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a3k0} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a3jC,a3jD],<? [a3jF,a3jG])
; (<? [a3jE,a3jG],<? [a3jB,a3jD])
; (<? [a3jB,a3jC],<? [a3jE,a3jF])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a3jV} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jC a3jD)
;    (< a3jF a3jG))

;      [WD] hole{a3jQ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jE a3jG)
;    (< a3jB a3jD))

;      [WD] hole{a3k0} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3jB a3jC)
;    (< a3jE a3jF))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a3jV} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a3jC a3jD)
;    (< a3jF a3jG))

;      [WD] hole{a3jQ} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a3jE a3jG)
;    (< a3jB a3jD))

;      [WD] hole{a3k0} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a3jB a3jC)
;    (< a3jE a3jF))

; WANTEDS (names)
a3jB  <=  a
a3jC  <=  b
a3jD  <=  c
a3jE  <=  a_a3jE
a3jF  <=  b_a3jF
a3jG  <=  c_a3jG
(declare-const a3jB Int)
(declare-const a3jC Int)
(declare-const a3jD Int)
(declare-const a3jE Int)
(declare-const a3jF Int)
(declare-const a3jG Int)
(assert
   (<= 0 a3jB))
(assert
   (<= 0 a3jC))
(assert
   (<= 0 a3jD))
(assert
   (<= 0 a3jE))
(assert
   (<= 0 a3jF))
(assert
   (<= 0 a3jG))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a3jC a3jD)
                     (< a3jF a3jG))))
            (not
               (=
                  (< a3jE a3jG)
                  (< a3jB a3jD))))
         (not
            (=
               (< a3jB a3jC)
               (< a3jE a3jF))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3kC} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a3kH} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ks,a3kt],+ [a3kq,a3kr])
; (+ [a3kt,a3ks],+ [a3kr,a3kq])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a3kC} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3ks a3kt)
;    (+ a3kq a3kr))

;      [WD] hole{a3kH} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3kt a3ks)
;    (+ a3kr a3kq))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a3kC} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3ks a3kt)
;    (+ a3kq a3kr))

;      [WD] hole{a3kH} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3kt a3ks)
;    (+ a3kr a3kq))

; WANTEDS (names)
a3kq  <=  a
a3kr  <=  b
a3ks  <=  a_a3ks
a3kt  <=  b_a3kt
(declare-const a3kq Int)
(declare-const a3kr Int)
(declare-const a3ks Int)
(declare-const a3kt Int)
(assert
   (<= 0 a3kq))
(assert
   (<= 0 a3kr))
(assert
   (<= 0 a3ks))
(assert
   (<= 0 a3kt))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a3ks a3kt)
                  (+ a3kq a3kr))))
         (not
            (=
               (+ a3kt a3ks)
               (+ a3kr a3kq))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3kC} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a3kH} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ks,a3kt],+ [a3kq,a3kr])
; (+ [a3kt,a3ks],+ [a3kr,a3kq])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a3kC} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3ks a3kt)
;    (+ a3kq a3kr))

;      [WD] hole{a3kH} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3kt a3ks)
;    (+ a3kr a3kq))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a3kC} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a3ks a3kt)
;    (+ a3kq a3kr))

;      [WD] hole{a3kH} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3kt a3ks)
;    (+ a3kr a3kq))

; WANTEDS (names)
a3kq  <=  a
a3kr  <=  b
a3ks  <=  a_a3ks
a3kt  <=  b_a3kt
(declare-const a3kq Int)
(declare-const a3kr Int)
(declare-const a3ks Int)
(declare-const a3kt Int)
(assert
   (<= 0 a3kq))
(assert
   (<= 0 a3kr))
(assert
   (<= 0 a3ks))
(assert
   (<= 0 a3kt))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a3ks a3kt)
                  (+ a3kq a3kr))))
         (not
            (=
               (+ a3kt a3ks)
               (+ a3kr a3kq))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a3le {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3la,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
(push 1)
(declare-const a3la Int)
(assert
   (<= 0 a3la))
(assert
   (!
      (= a3la 0)
      :named
      given-5.1))
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
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a3le {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3la,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
(push 1)
(declare-const a3la Int)
(assert
   (<= 0 a3la))
(assert
   (!
      (= a3la 0)
      :named
      given-5.1))
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
; [G] cobox_a3li {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3lb,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
a3lb  <=  m
(push 1)
(declare-const a3lb Int)
(assert
   (<= 0 a3lb))
(assert
   (!
      (= a3lb 0)
      :named
      given-6.1))
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
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a3li {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3lb,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
a3lb  <=  m
(push 1)
(declare-const a3lb Int)
(assert
   (<= 0 a3lb))
(assert
   (!
      (= a3lb 0)
      :named
      given-6.1))
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
; [G] cobox_a3sy {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sz {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lm],a3sx)
; (a3sx,a3la)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
a3lm  <=  n
a3sx  <=  fsk_a3sx
(push 1)
(declare-const a3la Int)
(declare-const a3lm Int)
(declare-const a3sx Int)
(assert
   (<= 0 a3la))
(assert
   (<= 0 a3lm))
(assert
   (<= 0 a3sx))
(assert
   (!
      (=
         (+ 1 a3lm)
         a3sx)
      :named
      given-7.1))
(assert
   (!
      (= a3sx a3la)
      :named
      given-7.2))
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
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a3sy {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sz {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lm],a3sx)
; (a3sx,a3la)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
a3lm  <=  n
a3sx  <=  fsk_a3sx
(push 1)
(declare-const a3la Int)
(declare-const a3lm Int)
(declare-const a3sx Int)
(assert
   (<= 0 a3la))
(assert
   (<= 0 a3lm))
(assert
   (<= 0 a3sx))
(assert
   (!
      (=
         (+ 1 a3lm)
         a3sx)
      :named
      given-7.1))
(assert
   (!
      (= a3sx a3la)
      :named
      given-7.2))
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
; [G] cobox_a3sy {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sB {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sz {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3sC {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lm],a3sx)
; (+ [1,a3lo],a3sA)
; (a3sx,a3la)
; (a3sA,a3lb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
a3lb  <=  m
a3lm  <=  n
a3lo  <=  n
a3sx  <=  fsk_a3sx
a3sA  <=  fsk_a3sA
(push 1)
(declare-const a3la Int)
(declare-const a3lb Int)
(declare-const a3lm Int)
(declare-const a3lo Int)
(declare-const a3sx Int)
(declare-const a3sA Int)
(assert
   (<= 0 a3la))
(assert
   (<= 0 a3lb))
(assert
   (<= 0 a3lm))
(assert
   (<= 0 a3lo))
(assert
   (<= 0 a3sx))
(assert
   (<= 0 a3sA))
(assert
   (!
      (=
         (+ 1 a3lm)
         a3sx)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a3lo)
         a3sA)
      :named
      given-8.2))
(assert
   (!
      (= a3sx a3la)
      :named
      given-8.3))
(assert
   (!
      (= a3sA a3lb)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a3sy {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sB {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sz {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3sC {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lm],a3sx)
; (+ [1,a3lo],a3sA)
; (a3sx,a3la)
; (a3sA,a3lb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
a3lb  <=  m
a3lm  <=  n
a3lo  <=  n
a3sx  <=  fsk_a3sx
a3sA  <=  fsk_a3sA
(push 1)
(declare-const a3la Int)
(declare-const a3lb Int)
(declare-const a3lm Int)
(declare-const a3lo Int)
(declare-const a3sx Int)
(declare-const a3sA Int)
(assert
   (<= 0 a3la))
(assert
   (<= 0 a3lb))
(assert
   (<= 0 a3lm))
(assert
   (<= 0 a3lo))
(assert
   (<= 0 a3sx))
(assert
   (<= 0 a3sA))
(assert
   (!
      (=
         (+ 1 a3lm)
         a3sx)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a3lo)
         a3sA)
      :named
      given-8.2))
(assert
   (!
      (= a3sx a3la)
      :named
      given-8.3))
(assert
   (!
      (= a3sA a3lb)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3sy {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sB {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sz {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3sC {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3sI} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3lm],a3sx)
; (+ [1,a3lo],a3sA)
; (a3sx,a3la)
; (a3sA,a3lb)

; WANTEDS (Thoralf style)
; (- [a3lo,a3lm],- [a3lb,a3la])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{a3sI} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3lo a3lm)
;    (- a3lb a3la))

; GIVENS (names)
a3la  <=  n
a3lb  <=  m
a3lm  <=  n
a3lo  <=  n
a3sx  <=  fsk_a3sx
a3sA  <=  fsk_a3sA
(push 1)
(declare-const a3la Int)
(declare-const a3lb Int)
(declare-const a3lm Int)
(declare-const a3lo Int)
(declare-const a3sx Int)
(declare-const a3sA Int)
(assert
   (<= 0 a3la))
(assert
   (<= 0 a3lb))
(assert
   (<= 0 a3lm))
(assert
   (<= 0 a3lo))
(assert
   (<= 0 a3sx))
(assert
   (<= 0 a3sA))
(assert
   (!
      (=
         (+ 1 a3lm)
         a3sx)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a3lo)
         a3sA)
      :named
      given-9.2))
(assert
   (!
      (= a3sx a3la)
      :named
      given-9.3))
(assert
   (!
      (= a3sA a3lb)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{a3sI} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a3lo a3lm)
;    (- a3lb a3la))

; WANTEDS (names)
a3la  <=  n
a3lb  <=  m
a3lm  <=  n
a3lo  <=  n
(assert
   (!
      (or
         false
         (not
            (=
               (- a3lo a3lm)
               (- a3lb a3la))))
      :named
      wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3sy {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sB {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sz {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3sC {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lm],a3sx)
; (+ [1,a3lo],a3sA)
; (a3sx,a3la)
; (a3sA,a3lb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
; GIVENS (conversions)
; GIVENS (names)
a3la  <=  n
a3lb  <=  m
a3lm  <=  n
a3lo  <=  n
a3sx  <=  fsk_a3sx
a3sA  <=  fsk_a3sA
(push 1)
(declare-const a3la Int)
(declare-const a3lb Int)
(declare-const a3lm Int)
(declare-const a3lo Int)
(declare-const a3sx Int)
(declare-const a3sA Int)
(assert
   (<= 0 a3la))
(assert
   (<= 0 a3lb))
(assert
   (<= 0 a3lm))
(assert
   (<= 0 a3lo))
(assert
   (<= 0 a3sx))
(assert
   (<= 0 a3sA))
(assert
   (!
      (=
         (+ 1 a3lm)
         a3sx)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a3lo)
         a3sA)
      :named
      given-9.2))
(assert
   (!
      (= a3sx a3la)
      :named
      given-9.3))
(assert
   (!
      (= a3sA a3lb)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a3lF {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3lD,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
a3lD  <=  n
(push 1)
(declare-const a3lD Int)
(assert
   (<= 0 a3lD))
(assert
   (!
      (= a3lD 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a3lF {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3lD,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
a3lD  <=  n
(push 1)
(declare-const a3lD Int)
(assert
   (<= 0 a3lD))
(assert
   (!
      (= a3lD 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3sL {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sM {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lL],a3sK)
; (a3sK,a3lD)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
; GIVENS (conversions)
; GIVENS (names)
a3lD  <=  n
a3lL  <=  n
a3sK  <=  fsk_a3sK
(push 1)
(declare-const a3lD Int)
(declare-const a3lL Int)
(declare-const a3sK Int)
(assert
   (<= 0 a3lD))
(assert
   (<= 0 a3lL))
(assert
   (<= 0 a3sK))
(assert
   (!
      (=
         (+ 1 a3lL)
         a3sK)
      :named
      given-11.1))
(assert
   (!
      (= a3sK a3lD)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3sL {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sM {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3lL],a3sK)
; (a3sK,a3lD)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
; GIVENS (conversions)
; GIVENS (names)
a3lD  <=  n
a3lL  <=  n
a3sK  <=  fsk_a3sK
(push 1)
(declare-const a3lD Int)
(declare-const a3lL Int)
(declare-const a3sK Int)
(assert
   (<= 0 a3lD))
(assert
   (<= 0 a3lL))
(assert
   (<= 0 a3sK))
(assert
   (!
      (=
         (+ 1 a3lL)
         a3sK)
      :named
      given-11.1))
(assert
   (!
      (= a3sK a3lD)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a3lY {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3lV,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a3lV  <=  n
(push 1)
(declare-const a3lV Int)
(assert
   (<= 0 a3lV))
(assert
   (!
      (= a3lV 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a3lY {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3lV,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a3lV  <=  n
(push 1)
(declare-const a3lV Int)
(assert
   (<= 0 a3lV))
(assert
   (!
      (= a3lV 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3sR {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sS {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3m2],a3sQ)
; (a3sQ,a3lV)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
; GIVENS (conversions)
; GIVENS (names)
a3lV  <=  n
a3m2  <=  n
a3sQ  <=  fsk_a3sQ
(push 1)
(declare-const a3lV Int)
(declare-const a3m2 Int)
(declare-const a3sQ Int)
(assert
   (<= 0 a3lV))
(assert
   (<= 0 a3m2))
(assert
   (<= 0 a3sQ))
(assert
   (!
      (=
         (+ 1 a3m2)
         a3sQ)
      :named
      given-13.1))
(assert
   (!
      (= a3sQ a3lV)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3sR {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sS {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3m2],a3sQ)
; (a3sQ,a3lV)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
; GIVENS (conversions)
; GIVENS (names)
a3lV  <=  n
a3m2  <=  n
a3sQ  <=  fsk_a3sQ
(push 1)
(declare-const a3lV Int)
(declare-const a3m2 Int)
(declare-const a3sQ Int)
(assert
   (<= 0 a3lV))
(assert
   (<= 0 a3m2))
(assert
   (<= 0 a3sQ))
(assert
   (!
      (=
         (+ 1 a3m2)
         a3sQ)
      :named
      given-13.1))
(assert
   (!
      (= a3sQ a3lV)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a3mf {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3mb,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a3mb  <=  n
(push 1)
(declare-const a3mb Int)
(assert
   (<= 0 a3mb))
(assert
   (!
      (= a3mb 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a3mf {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3mb,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a3mb  <=  n
(push 1)
(declare-const a3mb Int)
(assert
   (<= 0 a3mb))
(assert
   (!
      (= a3mb 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3sW {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sX {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3mi],a3sV)
; (a3sV,a3mb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
; GIVENS (conversions)
; GIVENS (names)
a3mb  <=  n
a3mi  <=  n
a3sV  <=  fsk_a3sV
(push 1)
(declare-const a3mb Int)
(declare-const a3mi Int)
(declare-const a3sV Int)
(assert
   (<= 0 a3mb))
(assert
   (<= 0 a3mi))
(assert
   (<= 0 a3sV))
(assert
   (!
      (=
         (+ 1 a3mi)
         a3sV)
      :named
      given-15.1))
(assert
   (!
      (= a3sV a3mb)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3sW {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sX {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3mi],a3sV)
; (a3sV,a3mb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
; GIVENS (conversions)
; GIVENS (names)
a3mb  <=  n
a3mi  <=  n
a3sV  <=  fsk_a3sV
(push 1)
(declare-const a3mb Int)
(declare-const a3mi Int)
(declare-const a3sV Int)
(assert
   (<= 0 a3mb))
(assert
   (<= 0 a3mi))
(assert
   (<= 0 a3sV))
(assert
   (!
      (=
         (+ 1 a3mi)
         a3sV)
      :named
      given-15.1))
(assert
   (!
      (= a3sV a3mb)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3sW {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sX {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3t5} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a3mi],a3sV)
; (a3sV,a3mb)

; WANTEDS (Thoralf style)
; (+ [1,+ [a3mi,a3md]],+ [a3mb,a3md])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{a3t5} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3mi a3md))
;    (+ a3mb a3md))

; GIVENS (names)
a3mb  <=  n
a3mi  <=  n
a3sV  <=  fsk_a3sV
(push 1)
(declare-const a3mb Int)
(declare-const a3mi Int)
(declare-const a3sV Int)
(assert
   (<= 0 a3mb))
(assert
   (<= 0 a3mi))
(assert
   (<= 0 a3sV))
(assert
   (!
      (=
         (+ 1 a3mi)
         a3sV)
      :named
      given-16.1))
(assert
   (!
      (= a3sV a3mb)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{a3t5} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a3mi a3md))
;    (+ a3mb a3md))

; WANTEDS (names)
a3mb  <=  n
a3md  <=  m
a3mi  <=  n
(declare-const a3md Int)
(assert
   (<= 0 a3md))
(assert
   (!
      (or
         false
         (not
            (=
               (+
                  1
                  (+ a3mi a3md))
               (+ a3mb a3md))))
      :named
      wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3sW {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3sX {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3mi],a3sV)
; (a3sV,a3mb)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-16")
; GIVENS (conversions)
; GIVENS (names)
a3mb  <=  n
a3mi  <=  n
a3sV  <=  fsk_a3sV
(push 1)
(declare-const a3mb Int)
(declare-const a3mi Int)
(declare-const a3sV Int)
(assert
   (<= 0 a3mb))
(assert
   (<= 0 a3mi))
(assert
   (<= 0 a3sV))
(assert
   (!
      (=
         (+ 1 a3mi)
         a3sV)
      :named
      given-16.1))
(assert
   (!
      (= a3sV a3mb)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3t7 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t8 {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3qt,a3qu],a3t6)
; (a3t6,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
; GIVENS (conversions)
; GIVENS (names)
a3qt  <=  a
a3qu  <=  b
a3t6  <=  fsk_a3t6
(push 1)
(declare-const a3qt Int)
(declare-const a3qu Int)
(declare-const a3t6 Bool)
(assert
   (<= 0 a3qt))
(assert
   (<= 0 a3qu))
(assert
   (!
      (=
         (< a3qt a3qu)
         a3t6)
      :named
      given-17.1))
(assert
   (!
      (= a3t6 true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3t7 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t8 {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3qt,a3qu],a3t6)
; (a3t6,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
; GIVENS (conversions)
; GIVENS (names)
a3qt  <=  a
a3qu  <=  b
a3t6  <=  fsk_a3t6
(push 1)
(declare-const a3qt Int)
(declare-const a3qu Int)
(declare-const a3t6 Bool)
(assert
   (<= 0 a3qt))
(assert
   (<= 0 a3qu))
(assert
   (!
      (=
         (< a3qt a3qu)
         a3t6)
      :named
      given-17.1))
(assert
   (!
      (= a3t6 true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3t7 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ta {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t8 {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3tb {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3qt,a3qu],a3t6)
; (<? [a3qu,a3qv],a3t9)
; (a3t6,True [])
; (a3t9,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
; GIVENS (conversions)
; GIVENS (names)
a3qt  <=  a
a3qu  <=  b
a3qv  <=  c
a3t6  <=  fsk_a3t6
a3t9  <=  fsk_a3t9
(push 1)
(declare-const a3qt Int)
(declare-const a3qu Int)
(declare-const a3qv Int)
(declare-const a3t6 Bool)
(declare-const a3t9 Bool)
(assert
   (<= 0 a3qt))
(assert
   (<= 0 a3qu))
(assert
   (<= 0 a3qv))
(assert
   (!
      (=
         (< a3qt a3qu)
         a3t6)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3qu a3qv)
         a3t9)
      :named
      given-18.2))
(assert
   (!
      (= a3t6 true)
      :named
      given-18.3))
(assert
   (!
      (= a3t9 true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3t7 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ta {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t8 {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3tb {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3qt,a3qu],a3t6)
; (<? [a3qu,a3qv],a3t9)
; (a3t6,True [])
; (a3t9,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
; GIVENS (conversions)
; GIVENS (names)
a3qt  <=  a
a3qu  <=  b
a3qv  <=  c
a3t6  <=  fsk_a3t6
a3t9  <=  fsk_a3t9
(push 1)
(declare-const a3qt Int)
(declare-const a3qu Int)
(declare-const a3qv Int)
(declare-const a3t6 Bool)
(declare-const a3t9 Bool)
(assert
   (<= 0 a3qt))
(assert
   (<= 0 a3qu))
(assert
   (<= 0 a3qv))
(assert
   (!
      (=
         (< a3qt a3qu)
         a3t6)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3qu a3qv)
         a3t9)
      :named
      given-18.2))
(assert
   (!
      (= a3t6 true)
      :named
      given-18.3))
(assert
   (!
      (= a3t9 true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3t7 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ta {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t8 {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3tb {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3tf} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3qt,a3qu],a3t6)
; (<? [a3qu,a3qv],a3t9)
; (a3t6,True [])
; (a3t9,True [])

; WANTEDS (Thoralf style)
; (<? [a3qt,a3qv],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{a3tf} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3qt a3qv)
;    true)

; GIVENS (names)
a3qt  <=  a
a3qu  <=  b
a3qv  <=  c
a3t6  <=  fsk_a3t6
a3t9  <=  fsk_a3t9
(push 1)
(declare-const a3qt Int)
(declare-const a3qu Int)
(declare-const a3qv Int)
(declare-const a3t6 Bool)
(declare-const a3t9 Bool)
(assert
   (<= 0 a3qt))
(assert
   (<= 0 a3qu))
(assert
   (<= 0 a3qv))
(assert
   (!
      (=
         (< a3qt a3qu)
         a3t6)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3qu a3qv)
         a3t9)
      :named
      given-19.2))
(assert
   (!
      (= a3t6 true)
      :named
      given-19.3))
(assert
   (!
      (= a3t9 true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{a3tf} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3qt a3qv)
;    true)

; WANTEDS (names)
a3qt  <=  a
a3qv  <=  c
(assert
   (!
      (or
         false
         (not
            (=
               (< a3qt a3qv)
               true)))
      :named
      wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3t7 {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ta {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3t8 {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3tb {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3qt,a3qu],a3t6)
; (<? [a3qu,a3qv],a3t9)
; (a3t6,True [])
; (a3t9,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-19")
; GIVENS (conversions)
; GIVENS (names)
a3qt  <=  a
a3qu  <=  b
a3qv  <=  c
a3t6  <=  fsk_a3t6
a3t9  <=  fsk_a3t9
(push 1)
(declare-const a3qt Int)
(declare-const a3qu Int)
(declare-const a3qv Int)
(declare-const a3t6 Bool)
(declare-const a3t9 Bool)
(assert
   (<= 0 a3qt))
(assert
   (<= 0 a3qu))
(assert
   (<= 0 a3qv))
(assert
   (!
      (=
         (< a3qt a3qu)
         a3t6)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3qu a3qv)
         a3t9)
      :named
      given-19.2))
(assert
   (!
      (= a3t6 true)
      :named
      given-19.3))
(assert
   (!
      (= a3t9 true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3tj {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3th {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3qI {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3qF,a3qG],a3ti)
; (+ [a3qF,a3qF],a3tg)
; (a3tg,a3ti)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
; GIVENS (conversions)
; GIVENS (names)
a3qF  <=  a
a3qG  <=  b
a3tg  <=  fsk_a3tg
a3ti  <=  fsk_a3ti
(push 1)
(declare-const a3qF Int)
(declare-const a3qG Int)
(declare-const a3tg Int)
(declare-const a3ti Int)
(assert
   (<= 0 a3qF))
(assert
   (<= 0 a3qG))
(assert
   (<= 0 a3tg))
(assert
   (<= 0 a3ti))
(assert
   (!
      (=
         (+ a3qF a3qG)
         a3ti)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3qF a3qF)
         a3tg)
      :named
      given-20.2))
(assert
   (!
      (= a3tg a3ti)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3tj {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3th {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3qI {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3qF,a3qG],a3ti)
; (+ [a3qF,a3qF],a3tg)
; (a3tg,a3ti)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
; GIVENS (conversions)
; GIVENS (names)
a3qF  <=  a
a3qG  <=  b
a3tg  <=  fsk_a3tg
a3ti  <=  fsk_a3ti
(push 1)
(declare-const a3qF Int)
(declare-const a3qG Int)
(declare-const a3tg Int)
(declare-const a3ti Int)
(assert
   (<= 0 a3qF))
(assert
   (<= 0 a3qG))
(assert
   (<= 0 a3tg))
(assert
   (<= 0 a3ti))
(assert
   (!
      (=
         (+ a3qF a3qG)
         a3ti)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3qF a3qF)
         a3tg)
      :named
      given-20.2))
(assert
   (!
      (= a3tg a3ti)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3tj {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3th {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3qI {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3qL} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3qF,a3qG],a3ti)
; (+ [a3qF,a3qF],a3tg)
; (a3tg,a3ti)

; WANTEDS (Thoralf style)
; (a3qF,a3qG)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{a3qL} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3qF a3qG)

; GIVENS (names)
a3qF  <=  a
a3qG  <=  b
a3tg  <=  fsk_a3tg
a3ti  <=  fsk_a3ti
(push 1)
(declare-const a3qF Int)
(declare-const a3qG Int)
(declare-const a3tg Int)
(declare-const a3ti Int)
(assert
   (<= 0 a3qF))
(assert
   (<= 0 a3qG))
(assert
   (<= 0 a3tg))
(assert
   (<= 0 a3ti))
(assert
   (!
      (=
         (+ a3qF a3qG)
         a3ti)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3qF a3qF)
         a3tg)
      :named
      given-21.2))
(assert
   (!
      (= a3tg a3ti)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{a3qL} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3qF a3qG)

; WANTEDS (names)
a3qF  <=  a
a3qG  <=  b
(assert
   (!
      (or
         false
         (not
            (= a3qF a3qG)))
      :named
      wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3tj {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3th {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3qI {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3qF,a3qG],a3ti)
; (+ [a3qF,a3qF],a3tg)
; (a3tg,a3ti)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-21")
; GIVENS (conversions)
; GIVENS (names)
a3qF  <=  a
a3qG  <=  b
a3tg  <=  fsk_a3tg
a3ti  <=  fsk_a3ti
(push 1)
(declare-const a3qF Int)
(declare-const a3qG Int)
(declare-const a3tg Int)
(declare-const a3ti Int)
(assert
   (<= 0 a3qF))
(assert
   (<= 0 a3qG))
(assert
   (<= 0 a3tg))
(assert
   (<= 0 a3ti))
(assert
   (!
      (=
         (+ a3qF a3qG)
         a3ti)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3qF a3qF)
         a3tg)
      :named
      given-21.2))
(assert
   (!
      (= a3tg a3ti)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3tn} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3qO,a3qP],+ [a3qP,a3qO])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{a3tn} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3qO a3qP)
;    (+ a3qP a3qO))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{a3tn} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3qO a3qP)
;    (+ a3qP a3qO))

; WANTEDS (names)
a3qO  <=  a
a3qP  <=  b
(declare-const a3qO Int)
(declare-const a3qP Int)
(assert
   (<= 0 a3qO))
(assert
   (<= 0 a3qP))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3qO a3qP)
               (+ a3qP a3qO))))
      :named
      wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-22")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3tv} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3qW,1],+ [1,a3qW])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{a3tv} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3qW 1)
;    (+ 1 a3qW))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{a3tv} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3qW 1)
;    (+ 1 a3qW))

; WANTEDS (names)
a3qW  <=  a
(declare-const a3qW Int)
(assert
   (<= 0 a3qW))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3qW 1)
               (+ 1 a3qW))))
      :named
      wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-23")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3re {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3r7,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
; GIVENS (conversions)
; GIVENS (names)
a3r7  <=  n
(push 1)
(declare-const a3r7 Int)
(assert
   (<= 0 a3r7))
(assert
   (!
      (= a3r7 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3re {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3r7,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
; GIVENS (conversions)
; GIVENS (names)
a3r7  <=  n
(push 1)
(declare-const a3r7 Int)
(assert
   (<= 0 a3r7))
(assert
   (!
      (= a3r7 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3tB {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3tC {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3rh],a3tA)
; (a3tA,a3r7)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
; GIVENS (conversions)
; GIVENS (names)
a3r7  <=  n
a3rh  <=  n
a3tA  <=  fsk_a3tA
(push 1)
(declare-const a3r7 Int)
(declare-const a3rh Int)
(declare-const a3tA Int)
(assert
   (<= 0 a3r7))
(assert
   (<= 0 a3rh))
(assert
   (<= 0 a3tA))
(assert
   (!
      (=
         (+ 1 a3rh)
         a3tA)
      :named
      given-26.1))
(assert
   (!
      (= a3tA a3r7)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3tB {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3tC {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3rh],a3tA)
; (a3tA,a3r7)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
; GIVENS (conversions)
; GIVENS (names)
a3r7  <=  n
a3rh  <=  n
a3tA  <=  fsk_a3tA
(push 1)
(declare-const a3r7 Int)
(declare-const a3rh Int)
(declare-const a3tA Int)
(assert
   (<= 0 a3r7))
(assert
   (<= 0 a3rh))
(assert
   (<= 0 a3tA))
(assert
   (!
      (=
         (+ 1 a3rh)
         a3tA)
      :named
      given-26.1))
(assert
   (!
      (= a3tA a3r7)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(exit)
(exit)
; [3 of 4] Compiling RowTypes
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_a5hw {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5hx {1}:: fsk0 ~ m' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5hi,a5hj,a5hk],a5hv)
; (a5hv,a5hh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
a5hh  <=  m'
a5hi  <=  m
a5hj  <=  field
a5hk  <=  val
a5hv  <=  fsk_a5hv
(push 1)
(declare-const
   a5hh
   (Array
      String
      (Maybe Type)))
(declare-const
   a5hi
   (Array
      String
      (Maybe Type)))
(declare-const a5hj String)
(declare-const a5hk Type)
(declare-const
   a5hv
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5hi
            a5hj
            (just a5hk))
         a5hv)
      :named
      given-1.1))
(assert
   (!
      (= a5hv a5hh)
      :named
      given-1.2))
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
(echo "solver-start-cycle-1")

; GIVENS (GHC style)
; [G] cobox_a5hw {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5hx {1}:: fsk0 ~ m' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5hi,a5hj,a5hk],a5hv)
; (a5hv,a5hh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-1")
; GIVENS (conversions)
; GIVENS (names)
a5hh  <=  m'
a5hi  <=  m
a5hj  <=  field
a5hk  <=  val
a5hv  <=  fsk_a5hv
(push 1)
(declare-const
   a5hh
   (Array
      String
      (Maybe Type)))
(declare-const
   a5hi
   (Array
      String
      (Maybe Type)))
(declare-const a5hj String)
(declare-const a5hk Type)
(declare-const
   a5hv
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5hi
            a5hj
            (just a5hk))
         a5hv)
      :named
      given-1.1))
(assert
   (!
      (= a5hv a5hh)
      :named
      given-1.2))
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
; [G] cobox_a5hR {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5hS {1}:: fsk0 ~ m' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],TYPE [LiftedRep []],a5hD,a5hE],a5hQ)
; (a5hQ,a5hC)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-2")
; GIVENS (conversions)
; GIVENS (names)
a5hC  <=  m'
a5hD  <=  m
a5hE  <=  field
a5hQ  <=  fsk_a5hQ
(push 1)
(declare-const
   a5hC
   (Array
      String
      (Maybe Type)))
(declare-const
   a5hD
   (Array
      String
      (Maybe Type)))
(declare-const a5hE String)
(declare-const
   a5hQ
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5hD
            a5hE
            (as
               nothing
               (Maybe Type)))
         a5hQ)
      :named
      given-2.1))
(assert
   (!
      (= a5hQ a5hC)
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
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; [G] cobox_a5hR {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5hS {1}:: fsk0 ~ m' (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Delete [Symbol [],TYPE [LiftedRep []],a5hD,a5hE],a5hQ)
; (a5hQ,a5hC)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-2")
; GIVENS (conversions)
; GIVENS (names)
a5hC  <=  m'
a5hD  <=  m
a5hE  <=  field
a5hQ  <=  fsk_a5hQ
(push 1)
(declare-const
   a5hC
   (Array
      String
      (Maybe Type)))
(declare-const
   a5hD
   (Array
      String
      (Maybe Type)))
(declare-const a5hE String)
(declare-const
   a5hQ
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5hD
            a5hE
            (as
               nothing
               (Maybe Type)))
         a5hQ)
      :named
      given-2.1))
(assert
   (!
      (= a5hQ a5hC)
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
; [G] cobox_a5iA {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5iB {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5ir,"price",Int []],a5iz)
; (a5iz,a5ir)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
; GIVENS (conversions)
; GIVENS (names)
a5ir  <=  m
a5iz  <=  fsk_a5iz
(push 1)
(declare-const
   a5ir
   (Array
      String
      (Maybe Type)))
(declare-const
   a5iz
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5ir
            "price"
            (just
               (lit "3u")))
         a5iz)
      :named
      given-3.1))
(assert
   (!
      (= a5iz a5ir)
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
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; [G] cobox_a5iA {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5iB {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5ir,"price",Int []],a5iz)
; (a5iz,a5ir)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-3")
; GIVENS (conversions)
; GIVENS (names)
a5ir  <=  m
a5iz  <=  fsk_a5iz
(push 1)
(declare-const
   a5ir
   (Array
      String
      (Maybe Type)))
(declare-const
   a5iz
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5ir
            "price"
            (just
               (lit "3u")))
         a5iz)
      :named
      given-3.1))
(assert
   (!
      (= a5iz a5ir)
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
; [G] cobox_a5ju {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5jv {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5jl,"price",Int []],a5jt)
; (a5jt,a5jl)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
a5jl  <=  m
a5jt  <=  fsk_a5jt
(push 1)
(declare-const
   a5jl
   (Array
      String
      (Maybe Type)))
(declare-const
   a5jt
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5jl
            "price"
            (just
               (lit "3u")))
         a5jt)
      :named
      given-4.1))
(assert
   (!
      (= a5jt a5jl)
      :named
      given-4.2))
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; [G] cobox_a5ju {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5jv {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5jl,"price",Int []],a5jt)
; (a5jt,a5jl)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
a5jl  <=  m
a5jt  <=  fsk_a5jt
(push 1)
(declare-const
   a5jl
   (Array
      String
      (Maybe Type)))
(declare-const
   a5jt
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5jl
            "price"
            (just
               (lit "3u")))
         a5jt)
      :named
      given-4.1))
(assert
   (!
      (= a5jt a5jl)
      :named
      given-4.2))
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a5nf} {2}:: Alter
;                         (Alter (Alter Nil "price" Int) "make" String) "price" Int
;                       ~
;                       Alter (Alter Nil "price" Int) "make" String (CNonCanonical)
; [WD] hole{a5n0} {2}:: Alter
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
;      [WD] hole{a5nf} {2}:: Alter
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

;      [WD] hole{a5n0} {2}:: Alter
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
(check-sat)
sat
(echo "givens-finish-cycle-5")
(echo "wanteds-start-cycle-5")
; WANTEDS (conversions)
;      [WD] hole{a5nf} {2}:: Alter
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

;      [WD] hole{a5n0} {2}:: Alter
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
(assert
   (!
      (or
         (or
            false
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
                           (lit "3g")))))))
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
unsat
(echo "wanteds-finish-cycle-5")
(pop 1)
(echo "solver-finish-cycle-5")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
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
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (a5o2,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5o2  <=  fsk_a5o2
(push 1)
(declare-const
   a5kB
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
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-6.1))
(assert
   (!
      (= a5o2 a5kB)
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
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (a5o2,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5o2  <=  fsk_a5o2
(push 1)
(declare-const
   a5kB
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
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-6.1))
(assert
   (!
      (= a5o2 a5kB)
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
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5oa {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5ob {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Delete [Symbol [],TYPE [LiftedRep []],a5kE,a5kF],a5o9)
; (a5o2,a5kB)
; (a5o9,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kE  <=  m
a5kF  <=  field
a5o2  <=  fsk_a5o2
a5o9  <=  fsk_a5o9
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kE
   (Array
      String
      (Maybe Type)))
(declare-const a5kF String)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5o9
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-7.1))
(assert
   (!
      (=
         (store
            a5kE
            a5kF
            (as
               nothing
               (Maybe Type)))
         a5o9)
      :named
      given-7.2))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-7.3))
(assert
   (!
      (= a5o9 a5kB)
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
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5oa {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5ob {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Delete [Symbol [],TYPE [LiftedRep []],a5kE,a5kF],a5o9)
; (a5o2,a5kB)
; (a5o9,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kE  <=  m
a5kF  <=  field
a5o2  <=  fsk_a5o2
a5o9  <=  fsk_a5o9
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kE
   (Array
      String
      (Maybe Type)))
(declare-const a5kF String)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5o9
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-7.1))
(assert
   (!
      (=
         (store
            a5kE
            a5kF
            (as
               nothing
               (Maybe Type)))
         a5o9)
      :named
      given-7.2))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-7.3))
(assert
   (!
      (= a5o9 a5kB)
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
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5oa {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5ob {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a5oi} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Delete [Symbol [],TYPE [LiftedRep []],a5kE,a5kF],a5o9)
; (a5o2,a5kB)
; (a5o9,a5kB)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kE,"price",Int []],a5kE)

(echo "givens-start-cycle-8")
; GIVENS (conversions)
;      [WD] hole{a5oi} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kE
;       "price"
;       (just
;          (lit "3u")))
;    a5kE)

; GIVENS (names)
a5kB  <=  m
a5kE  <=  m
a5kF  <=  field
a5o2  <=  fsk_a5o2
a5o9  <=  fsk_a5o9
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kE
   (Array
      String
      (Maybe Type)))
(declare-const a5kF String)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5o9
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a5kE
            a5kF
            (as
               nothing
               (Maybe Type)))
         a5o9)
      :named
      given-8.2))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-8.3))
(assert
   (!
      (= a5o9 a5kB)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
;      [WD] hole{a5oi} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kE
;       "price"
;       (just
;          (lit "3u")))
;    a5kE)

; WANTEDS (names)
a5kE  <=  m
(assert
   (!
      (or
         false
         (not
            (=
               (store
                  a5kE
                  "price"
                  (just
                     (lit "3u")))
               a5kE)))
      :named
      wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5oa {0}:: Delete m field ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5ob {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Delete [Symbol [],TYPE [LiftedRep []],a5kE,a5kF],a5o9)
; (a5o2,a5kB)
; (a5o9,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kE  <=  m
a5kF  <=  field
a5o2  <=  fsk_a5o2
a5o9  <=  fsk_a5o9
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kE
   (Array
      String
      (Maybe Type)))
(declare-const a5kF String)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5o9
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-8.1))
(assert
   (!
      (=
         (store
            a5kE
            a5kF
            (as
               nothing
               (Maybe Type)))
         a5o9)
      :named
      given-8.2))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-8.3))
(assert
   (!
      (= a5o9 a5kB)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5om {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,a5kM,a5kN],a5ol)
; (a5o2,a5kB)
; (a5ol,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-9.1))
(assert
   (!
      (=
         (store
            a5kL
            a5kM
            (just a5kN))
         a5ol)
      :named
      given-9.2))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-9.3))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5om {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,a5kM,a5kN],a5ol)
; (a5o2,a5kB)
; (a5ol,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-9.1))
(assert
   (!
      (=
         (store
            a5kL
            a5kM
            (just a5kN))
         a5ol)
      :named
      given-9.2))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-9.3))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5or {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5oq {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,"price",a5kN],a5ol)
; (a5ol,a5kB)
; (a5o2,a5kB)
; (a5kM,"price")

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a5kL
            "price"
            (just a5kN))
         a5ol)
      :named
      given-10.2))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-10.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-10.4))
(assert
   (!
      (= a5kM "price")
      :named
      given-10.5))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5or {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5oq {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,"price",a5kN],a5ol)
; (a5ol,a5kB)
; (a5o2,a5kB)
; (a5kM,"price")

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-10.1))
(assert
   (!
      (=
         (store
            a5kL
            "price"
            (just a5kN))
         a5ol)
      :named
      given-10.2))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-10.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-10.4))
(assert
   (!
      (= a5kM "price")
      :named
      given-10.5))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5or {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5oq {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a5l8} {0}:: val ~ Int (CNonCanonical)

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,"price",a5kN],a5ol)
; (a5ol,a5kB)
; (a5o2,a5kB)
; (a5kM,"price")

; WANTEDS (Thoralf style)
; (a5kN,Int [])

(echo "givens-start-cycle-11")
; GIVENS (conversions)
;      [WD] hole{a5l8} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5kN
;    (lit "3u"))

; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a5kL
            "price"
            (just a5kN))
         a5ol)
      :named
      given-11.2))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-11.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-11.4))
(assert
   (!
      (= a5kM "price")
      :named
      given-11.5))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
;      [WD] hole{a5l8} {0}:: val ~ Int (CNonCanonical)
;  =>  (=
;    a5kN
;    (lit "3u"))

; WANTEDS (names)
a5kN  <=  val
(assert
   (!
      (or
         false
         (not
            (=
               a5kN
               (lit "3u"))))
      :named
      wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5or {1}:: Alter m "price" val ~ fsk0 (CFunEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5oq {1}:: field ~ "price" (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,"price",a5kN],a5ol)
; (a5ol,a5kB)
; (a5o2,a5kB)
; (a5kM,"price")

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-11.1))
(assert
   (!
      (=
         (store
            a5kL
            "price"
            (just a5kN))
         a5ol)
      :named
      given-11.2))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-11.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-11.4))
(assert
   (!
      (= a5kM "price")
      :named
      given-11.5))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5om {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,a5kM,a5kN],a5ol)
; (a5o2,a5kB)
; (a5ol,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5kM "price"))
      :named
      given-12.1))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-12.2))
(assert
   (!
      (=
         (store
            a5kL
            a5kM
            (just a5kN))
         a5ol)
      :named
      given-12.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-12.4))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-12.5))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5om {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,a5kM,a5kN],a5ol)
; (a5o2,a5kB)
; (a5ol,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5kM "price"))
      :named
      given-12.1))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-12.2))
(assert
   (!
      (=
         (store
            a5kL
            a5kM
            (just a5kN))
         a5ol)
      :named
      given-12.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-12.4))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-12.5))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5om {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a5ow} {2}:: Alter m "price" Int ~ m (CNonCanonical)

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,a5kM,a5kN],a5ol)
; (a5o2,a5kB)
; (a5ol,a5kB)

; WANTEDS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,"price",Int []],a5kL)

(echo "givens-start-cycle-13")
; GIVENS (conversions)
;      [WD] hole{a5ow} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kL
;       "price"
;       (just
;          (lit "3u")))
;    a5kL)

; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5kM "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a5kL
            a5kM
            (just a5kN))
         a5ol)
      :named
      given-13.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-13.4))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-13.5))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
;      [WD] hole{a5ow} {2}:: Alter m "price" Int ~ m (CNonCanonical)
;  =>  (=
;    (store
;       a5kL
;       "price"
;       (just
;          (lit "3u")))
;    a5kL)

; WANTEDS (names)
a5kL  <=  m
(assert
   (!
      (or
         false
         (not
            (=
               (store
                  a5kL
                  "price"
                  (just
                     (lit "3u")))
               a5kL)))
      :named
      wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; [G] cobox_a5o3 {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5om {0}:: Alter m field val ~ fsk0 (CFunEqCan)
; [G] cobox_a5o4 {1}:: fsk0 ~ m (CTyEqCan)
; [G] cobox_a5on {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; [G] $dDisEquality_a5la {0}:: DisEquality field "price" (CDictCan)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kB,"price",Int []],a5o2)
; (Alter [Symbol [],TYPE [LiftedRep []],a5kL,a5kM,a5kN],a5ol)
; (a5o2,a5kB)
; (a5ol,a5kB)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
; GIVENS (conversions)
; GIVENS (names)
a5kB  <=  m
a5kL  <=  m
a5kM  <=  field
a5kN  <=  val
a5o2  <=  fsk_a5o2
a5ol  <=  fsk_a5ol
(push 1)
(declare-const
   a5kB
   (Array
      String
      (Maybe Type)))
(declare-const
   a5kL
   (Array
      String
      (Maybe Type)))
(declare-const a5kM String)
(declare-const a5kN Type)
(declare-const
   a5o2
   (Array
      String
      (Maybe Type)))
(declare-const
   a5ol
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (not
         (= a5kM "price"))
      :named
      given-13.1))
(assert
   (!
      (=
         (store
            a5kB
            "price"
            (just
               (lit "3u")))
         a5o2)
      :named
      given-13.2))
(assert
   (!
      (=
         (store
            a5kL
            a5kM
            (just a5kN))
         a5ol)
      :named
      given-13.3))
(assert
   (!
      (= a5o2 a5kB)
      :named
      given-13.4))
(assert
   (!
      (= a5ol a5kB)
      :named
      given-13.5))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a5oA {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5oB {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lh,"price",Int []],a5oz)
; (a5oz,a5lh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a5lh  <=  m
a5oz  <=  fsk_a5oz
(push 1)
(declare-const
   a5lh
   (Array
      String
      (Maybe Type)))
(declare-const
   a5oz
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5lh
            "price"
            (just
               (lit "3u")))
         a5oz)
      :named
      given-14.1))
(assert
   (!
      (= a5oz a5lh)
      :named
      given-14.2))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a5oA {0}:: Alter m "price" Int ~ fsk0 (CFunEqCan)
; [G] cobox_a5oB {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (Alter [Symbol [],TYPE [LiftedRep []],a5lh,"price",Int []],a5oz)
; (a5oz,a5lh)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a5lh  <=  m
a5oz  <=  fsk_a5oz
(push 1)
(declare-const
   a5lh
   (Array
      String
      (Maybe Type)))
(declare-const
   a5oz
   (Array
      String
      (Maybe Type)))
(assert
   (!
      (=
         (store
            a5lh
            "price"
            (just
               (lit "3u")))
         a5oz)
      :named
      given-14.1))
(assert
   (!
      (= a5oz a5lh)
      :named
      given-14.2))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(exit)
(exit)
; [4 of 4] Compiling Main
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(exit)
; [2 of 4] Compiling Nat
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
(set-option :print-success true)
(set-option :produce-models true)
(set-option :global-declarations true)
(set-option :interactive-mode true)
(set-option :print-success true)
(set-option :produce-assertions true)
(set-option :produce-assignments true)
(set-option :produce-models true)
(set-option :produce-proofs true)
(set-option :produce-unsat-assumptions true)
(set-option :produce-unsat-cores true)
(echo "options are set, initialized")
(exit)
(set-option :print-success true)
(set-option :produce-models true)
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
(push 1)
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
; [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Th,a2Ti],<? [a2Tk,a2Tl])
; (<? [a2Tj,a2Tl],<? [a2Tg,a2Ti])
; (<? [a2Tg,a2Th],<? [a2Tj,a2Tk])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Th a2Ti)
;    (< a2Tk a2Tl))

;      [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tj a2Tl)
;    (< a2Tg a2Ti))

;      [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2Tg a2Th)
;    (< a2Tj a2Tk))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Th a2Ti)
;    (< a2Tk a2Tl))

;      [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tj a2Tl)
;    (< a2Tg a2Ti))

;      [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2Tg a2Th)
;    (< a2Tj a2Tk))

; WANTEDS (names)
a2Tg  <=  a
a2Th  <=  b
a2Ti  <=  c
a2Tj  <=  a_a2Tj
a2Tk  <=  b_a2Tk
a2Tl  <=  c_a2Tl
(declare-const a2Tg Int)
(declare-const a2Th Int)
(declare-const a2Ti Int)
(declare-const a2Tj Int)
(declare-const a2Tk Int)
(declare-const a2Tl Int)
(assert
   (<= 0 a2Tg))
(assert
   (<= 0 a2Th))
(assert
   (<= 0 a2Ti))
(assert
   (<= 0 a2Tj))
(assert
   (<= 0 a2Tk))
(assert
   (<= 0 a2Tl))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a2Th a2Ti)
                     (< a2Tk a2Tl))))
            (not
               (=
                  (< a2Tj a2Tl)
                  (< a2Tg a2Ti))))
         (not
            (=
               (< a2Tg a2Th)
               (< a2Tj a2Tk))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-2")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
; [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
; [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (<? [a2Th,a2Ti],<? [a2Tk,a2Tl])
; (<? [a2Tj,a2Tl],<? [a2Tg,a2Ti])
; (<? [a2Tg,a2Th],<? [a2Tj,a2Tk])

(echo "givens-start-cycle-2")
; GIVENS (conversions)
;      [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Th a2Ti)
;    (< a2Tk a2Tl))

;      [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tj a2Tl)
;    (< a2Tg a2Ti))

;      [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2Tg a2Th)
;    (< a2Tj a2Tk))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-2")
(echo "wanteds-start-cycle-2")
; WANTEDS (conversions)
;      [WD] hole{a2TA} {1}:: (b <? c) ~ (b0 <? c0) (CNonCanonical)
;  =>  (=
;    (< a2Th a2Ti)
;    (< a2Tk a2Tl))

;      [WD] hole{a2Tv} {1}:: (a0 <? c0) ~ (a <? c) (CNonCanonical)
;  =>  (=
;    (< a2Tj a2Tl)
;    (< a2Tg a2Ti))

;      [WD] hole{a2TF} {1}:: (a <? b) ~ (a0 <? b0) (CNonCanonical)
;  =>  (=
;    (< a2Tg a2Th)
;    (< a2Tj a2Tk))

; WANTEDS (names)
a2Tg  <=  a
a2Th  <=  b
a2Ti  <=  c
a2Tj  <=  a_a2Tj
a2Tk  <=  b_a2Tk
a2Tl  <=  c_a2Tl
(declare-const a2Tg Int)
(declare-const a2Th Int)
(declare-const a2Ti Int)
(declare-const a2Tj Int)
(declare-const a2Tk Int)
(declare-const a2Tl Int)
(assert
   (<= 0 a2Tg))
(assert
   (<= 0 a2Th))
(assert
   (<= 0 a2Ti))
(assert
   (<= 0 a2Tj))
(assert
   (<= 0 a2Tk))
(assert
   (<= 0 a2Tl))
(assert
   (!
      (or
         (or
            (or
               false
               (not
                  (=
                     (< a2Th a2Ti)
                     (< a2Tk a2Tl))))
            (not
               (=
                  (< a2Tj a2Tl)
                  (< a2Tg a2Ti))))
         (not
            (=
               (< a2Tg a2Th)
               (< a2Tj a2Tk))))
      :named
      wanted-2))
(check-sat)
sat
(echo "wanteds-finish-cycle-2")
(pop 1)
(echo "solver-finish-cycle-2")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U7,a2U8],+ [a2U5,a2U6])
; (+ [a2U8,a2U7],+ [a2U6,a2U5])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U7 a2U8)
;    (+ a2U5 a2U6))

;      [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U8 a2U7)
;    (+ a2U6 a2U5))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U7 a2U8)
;    (+ a2U5 a2U6))

;      [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U8 a2U7)
;    (+ a2U6 a2U5))

; WANTEDS (names)
a2U5  <=  a
a2U6  <=  b
a2U7  <=  a_a2U7
a2U8  <=  b_a2U8
(declare-const a2U5 Int)
(declare-const a2U6 Int)
(declare-const a2U7 Int)
(declare-const a2U8 Int)
(assert
   (<= 0 a2U5))
(assert
   (<= 0 a2U6))
(assert
   (<= 0 a2U7))
(assert
   (<= 0 a2U8))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a2U7 a2U8)
                  (+ a2U5 a2U6))))
         (not
            (=
               (+ a2U8 a2U7)
               (+ a2U6 a2U5))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-3")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
; [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a2U7,a2U8],+ [a2U5,a2U6])
; (+ [a2U8,a2U7],+ [a2U6,a2U5])

(echo "givens-start-cycle-3")
; GIVENS (conversions)
;      [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U7 a2U8)
;    (+ a2U5 a2U6))

;      [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U8 a2U7)
;    (+ a2U6 a2U5))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-3")
(echo "wanteds-start-cycle-3")
; WANTEDS (conversions)
;      [WD] hole{a2Uh} {1}:: (a0 + b0) ~ (a + b) (CNonCanonical)
;  =>  (=
;    (+ a2U7 a2U8)
;    (+ a2U5 a2U6))

;      [WD] hole{a2Um} {1}:: (b0 + a0) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a2U8 a2U7)
;    (+ a2U6 a2U5))

; WANTEDS (names)
a2U5  <=  a
a2U6  <=  b
a2U7  <=  a_a2U7
a2U8  <=  b_a2U8
(declare-const a2U5 Int)
(declare-const a2U6 Int)
(declare-const a2U7 Int)
(declare-const a2U8 Int)
(assert
   (<= 0 a2U5))
(assert
   (<= 0 a2U6))
(assert
   (<= 0 a2U7))
(assert
   (<= 0 a2U8))
(assert
   (!
      (or
         (or
            false
            (not
               (=
                  (+ a2U7 a2U8)
                  (+ a2U5 a2U6))))
         (not
            (=
               (+ a2U8 a2U7)
               (+ a2U6 a2U5))))
      :named
      wanted-3))
(check-sat)
sat
(echo "wanteds-finish-cycle-3")
(pop 1)
(echo "solver-finish-cycle-3")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-4")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-4")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-4")
(echo "wanteds-start-cycle-4")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-4))
(check-sat)
unsat
(echo "wanteds-finish-cycle-4")
(pop 1)
(echo "solver-finish-cycle-4")
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a2UT {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UP,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
(push 1)
(declare-const a2UP Int)
(assert
   (<= 0 a2UP))
(assert
   (!
      (= a2UP 0)
      :named
      given-5.1))
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
(echo "solver-start-cycle-5")

; GIVENS (GHC style)
; [G] cobox_a2UT {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UP,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-5")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
(push 1)
(declare-const a2UP Int)
(assert
   (<= 0 a2UP))
(assert
   (!
      (= a2UP 0)
      :named
      given-5.1))
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
; [G] cobox_a2UX {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
a2UQ  <=  m
(push 1)
(declare-const a2UQ Int)
(assert
   (<= 0 a2UQ))
(assert
   (!
      (= a2UQ 0)
      :named
      given-6.1))
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
(echo "solver-start-cycle-6")

; GIVENS (GHC style)
; [G] cobox_a2UX {0}:: m ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2UQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-6")
; GIVENS (conversions)
; GIVENS (names)
a2UQ  <=  m
(push 1)
(declare-const a2UQ Int)
(assert
   (<= 0 a2UQ))
(assert
   (!
      (= a2UQ 0)
      :named
      given-6.1))
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
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (a3cg,a2UP)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
a2V1  <=  n
a3cg  <=  fsk_a3cg
(push 1)
(declare-const a2UP Int)
(declare-const a2V1 Int)
(declare-const a3cg Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a3cg))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-7.1))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-7.2))
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
(echo "solver-start-cycle-7")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (a3cg,a2UP)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-7")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
a2V1  <=  n
a3cg  <=  fsk_a3cg
(push 1)
(declare-const a2UP Int)
(declare-const a2V1 Int)
(declare-const a3cg Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a3cg))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-7.1))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-7.2))
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
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
a2UQ  <=  m
a2V1  <=  n
a2V3  <=  n
a3cg  <=  fsk_a3cg
a3cj  <=  fsk_a3cj
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-8.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-8.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-8")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-8")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
a2UQ  <=  m
a2V1  <=  n
a2V3  <=  n
a3cg  <=  fsk_a3cg
a3cj  <=  fsk_a3cj
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-8.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-8.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-8.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-8.4))
(check-sat)
sat
(echo "givens-finish-cycle-8")
(echo "wanteds-start-cycle-8")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-8))
(check-sat)
unsat
(echo "wanteds-finish-cycle-8")
(pop 1)
(echo "solver-finish-cycle-8")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cr} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; (- [a2V3,a2V1],- [a2UQ,a2UP])

(echo "givens-start-cycle-9")
; GIVENS (conversions)
;      [WD] hole{a3cr} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a2V3 a2V1)
;    (- a2UQ a2UP))

; GIVENS (names)
a2UP  <=  n
a2UQ  <=  m
a2V1  <=  n
a2V3  <=  n
a3cg  <=  fsk_a3cg
a3cj  <=  fsk_a3cj
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-9.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-9.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
;      [WD] hole{a3cr} {1}:: (n - n1) ~ (m - n2) (CNonCanonical)
;  =>  (=
;    (- a2V3 a2V1)
;    (- a2UQ a2UP))

; WANTEDS (names)
a2UP  <=  n
a2UQ  <=  m
a2V1  <=  n
a2V3  <=  n
(assert
   (!
      (or
         false
         (not
            (=
               (- a2V3 a2V1)
               (- a2UQ a2UP))))
      :named
      wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-9")

; GIVENS (GHC style)
; [G] cobox_a3ch {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ck {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ci {1}:: fsk0 ~ n (CTyEqCan)
; [G] cobox_a3cl {1}:: fsk0 ~ m (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2V1],a3cg)
; (+ [1,a2V3],a3cj)
; (a3cg,a2UP)
; (a3cj,a2UQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-9")
; GIVENS (conversions)
; GIVENS (names)
a2UP  <=  n
a2UQ  <=  m
a2V1  <=  n
a2V3  <=  n
a3cg  <=  fsk_a3cg
a3cj  <=  fsk_a3cj
(push 1)
(declare-const a2UP Int)
(declare-const a2UQ Int)
(declare-const a2V1 Int)
(declare-const a2V3 Int)
(declare-const a3cg Int)
(declare-const a3cj Int)
(assert
   (<= 0 a2UP))
(assert
   (<= 0 a2UQ))
(assert
   (<= 0 a2V1))
(assert
   (<= 0 a2V3))
(assert
   (<= 0 a3cg))
(assert
   (<= 0 a3cj))
(assert
   (!
      (=
         (+ 1 a2V1)
         a3cg)
      :named
      given-9.1))
(assert
   (!
      (=
         (+ 1 a2V3)
         a3cj)
      :named
      given-9.2))
(assert
   (!
      (= a3cg a2UP)
      :named
      given-9.3))
(assert
   (!
      (= a3cj a2UQ)
      :named
      given-9.4))
(check-sat)
sat
(echo "givens-finish-cycle-9")
(echo "wanteds-start-cycle-9")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-9))
(check-sat)
unsat
(echo "wanteds-finish-cycle-9")
(pop 1)
(echo "solver-finish-cycle-9")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a2Vk {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2Vi,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
a2Vi  <=  n
(push 1)
(declare-const a2Vi Int)
(assert
   (<= 0 a2Vi))
(assert
   (!
      (= a2Vi 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-10")

; GIVENS (GHC style)
; [G] cobox_a2Vk {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2Vi,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-10")
; GIVENS (conversions)
; GIVENS (names)
a2Vi  <=  n
(push 1)
(declare-const a2Vi Int)
(assert
   (<= 0 a2Vi))
(assert
   (!
      (= a2Vi 0)
      :named
      given-10.1))
(check-sat)
sat
(echo "givens-finish-cycle-10")
(echo "wanteds-start-cycle-10")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-10))
(check-sat)
unsat
(echo "wanteds-finish-cycle-10")
(pop 1)
(echo "solver-finish-cycle-10")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3cz {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cA {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2Vq],a3cy)
; (a3cy,a2Vi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
; GIVENS (conversions)
; GIVENS (names)
a2Vi  <=  n
a2Vq  <=  n
a3cy  <=  fsk_a3cy
(push 1)
(declare-const a2Vi Int)
(declare-const a2Vq Int)
(declare-const a3cy Int)
(assert
   (<= 0 a2Vi))
(assert
   (<= 0 a2Vq))
(assert
   (<= 0 a3cy))
(assert
   (!
      (=
         (+ 1 a2Vq)
         a3cy)
      :named
      given-11.1))
(assert
   (!
      (= a3cy a2Vi)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-11")

; GIVENS (GHC style)
; [G] cobox_a3cz {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cA {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2Vq],a3cy)
; (a3cy,a2Vi)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-11")
; GIVENS (conversions)
; GIVENS (names)
a2Vi  <=  n
a2Vq  <=  n
a3cy  <=  fsk_a3cy
(push 1)
(declare-const a2Vi Int)
(declare-const a2Vq Int)
(declare-const a3cy Int)
(assert
   (<= 0 a2Vi))
(assert
   (<= 0 a2Vq))
(assert
   (<= 0 a3cy))
(assert
   (!
      (=
         (+ 1 a2Vq)
         a3cy)
      :named
      given-11.1))
(assert
   (!
      (= a3cy a2Vi)
      :named
      given-11.2))
(check-sat)
sat
(echo "givens-finish-cycle-11")
(echo "wanteds-start-cycle-11")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-11))
(check-sat)
unsat
(echo "wanteds-finish-cycle-11")
(pop 1)
(echo "solver-finish-cycle-11")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a2VD {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VA,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a2VA  <=  n
(push 1)
(declare-const a2VA Int)
(assert
   (<= 0 a2VA))
(assert
   (!
      (= a2VA 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-12")

; GIVENS (GHC style)
; [G] cobox_a2VD {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VA,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-12")
; GIVENS (conversions)
; GIVENS (names)
a2VA  <=  n
(push 1)
(declare-const a2VA Int)
(assert
   (<= 0 a2VA))
(assert
   (!
      (= a2VA 0)
      :named
      given-12.1))
(check-sat)
sat
(echo "givens-finish-cycle-12")
(echo "wanteds-start-cycle-12")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-12))
(check-sat)
unsat
(echo "wanteds-finish-cycle-12")
(pop 1)
(echo "solver-finish-cycle-12")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3cF {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cG {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VH],a3cE)
; (a3cE,a2VA)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
; GIVENS (conversions)
; GIVENS (names)
a2VA  <=  n
a2VH  <=  n
a3cE  <=  fsk_a3cE
(push 1)
(declare-const a2VA Int)
(declare-const a2VH Int)
(declare-const a3cE Int)
(assert
   (<= 0 a2VA))
(assert
   (<= 0 a2VH))
(assert
   (<= 0 a3cE))
(assert
   (!
      (=
         (+ 1 a2VH)
         a3cE)
      :named
      given-13.1))
(assert
   (!
      (= a3cE a2VA)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-13")

; GIVENS (GHC style)
; [G] cobox_a3cF {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cG {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VH],a3cE)
; (a3cE,a2VA)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-13")
; GIVENS (conversions)
; GIVENS (names)
a2VA  <=  n
a2VH  <=  n
a3cE  <=  fsk_a3cE
(push 1)
(declare-const a2VA Int)
(declare-const a2VH Int)
(declare-const a3cE Int)
(assert
   (<= 0 a2VA))
(assert
   (<= 0 a2VH))
(assert
   (<= 0 a3cE))
(assert
   (!
      (=
         (+ 1 a2VH)
         a3cE)
      :named
      given-13.1))
(assert
   (!
      (= a3cE a2VA)
      :named
      given-13.2))
(check-sat)
sat
(echo "givens-finish-cycle-13")
(echo "wanteds-start-cycle-13")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-13))
(check-sat)
unsat
(echo "wanteds-finish-cycle-13")
(pop 1)
(echo "solver-finish-cycle-13")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a2VU {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a2VQ  <=  n
(push 1)
(declare-const a2VQ Int)
(assert
   (<= 0 a2VQ))
(assert
   (!
      (= a2VQ 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-14")

; GIVENS (GHC style)
; [G] cobox_a2VU {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a2VQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-14")
; GIVENS (conversions)
; GIVENS (names)
a2VQ  <=  n
(push 1)
(declare-const a2VQ Int)
(assert
   (<= 0 a2VQ))
(assert
   (!
      (= a2VQ 0)
      :named
      given-14.1))
(check-sat)
sat
(echo "givens-finish-cycle-14")
(echo "wanteds-start-cycle-14")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-14))
(check-sat)
unsat
(echo "wanteds-finish-cycle-14")
(pop 1)
(echo "solver-finish-cycle-14")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
; GIVENS (conversions)
; GIVENS (names)
a2VQ  <=  n
a2VX  <=  n
a3cJ  <=  fsk_a3cJ
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-15.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-15")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-15")
; GIVENS (conversions)
; GIVENS (names)
a2VQ  <=  n
a2VX  <=  n
a3cJ  <=  fsk_a3cJ
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-15.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-15.2))
(check-sat)
sat
(echo "givens-finish-cycle-15")
(echo "wanteds-start-cycle-15")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-15))
(check-sat)
unsat
(echo "wanteds-finish-cycle-15")
(pop 1)
(echo "solver-finish-cycle-15")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3cT} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; (+ [1,+ [a2VX,a2VS]],+ [a2VQ,a2VS])

(echo "givens-start-cycle-16")
; GIVENS (conversions)
;      [WD] hole{a3cT} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2VX a2VS))
;    (+ a2VQ a2VS))

; GIVENS (names)
a2VQ  <=  n
a2VX  <=  n
a3cJ  <=  fsk_a3cJ
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-16.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
;      [WD] hole{a3cT} {1}:: (1 + (n + m)) ~ (n1 + m) (CNonCanonical)
;  =>  (=
;    (+
;       1
;       (+ a2VX a2VS))
;    (+ a2VQ a2VS))

; WANTEDS (names)
a2VQ  <=  n
a2VS  <=  m
a2VX  <=  n
(declare-const a2VS Int)
(assert
   (<= 0 a2VS))
(assert
   (!
      (or
         false
         (not
            (=
               (+
                  1
                  (+ a2VX a2VS))
               (+ a2VQ a2VS))))
      :named
      wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-16")

; GIVENS (GHC style)
; [G] cobox_a3cK {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cL {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a2VX],a3cJ)
; (a3cJ,a2VQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-16")
; GIVENS (conversions)
; GIVENS (names)
a2VQ  <=  n
a2VX  <=  n
a3cJ  <=  fsk_a3cJ
(push 1)
(declare-const a2VQ Int)
(declare-const a2VX Int)
(declare-const a3cJ Int)
(assert
   (<= 0 a2VQ))
(assert
   (<= 0 a2VX))
(assert
   (<= 0 a3cJ))
(assert
   (!
      (=
         (+ 1 a2VX)
         a3cJ)
      :named
      given-16.1))
(assert
   (!
      (= a3cJ a2VQ)
      :named
      given-16.2))
(check-sat)
sat
(echo "givens-finish-cycle-16")
(echo "wanteds-start-cycle-16")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-16))
(check-sat)
unsat
(echo "wanteds-finish-cycle-16")
(pop 1)
(echo "solver-finish-cycle-16")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (a3cU,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
; GIVENS (conversions)
; GIVENS (names)
a3ac  <=  a
a3ad  <=  b
a3cU  <=  fsk_a3cU
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3cU Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-17.1))
(assert
   (!
      (= a3cU true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-17")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (a3cU,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-17")
; GIVENS (conversions)
; GIVENS (names)
a3ac  <=  a
a3ad  <=  b
a3cU  <=  fsk_a3cU
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3cU Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-17.1))
(assert
   (!
      (= a3cU true)
      :named
      given-17.2))
(check-sat)
sat
(echo "givens-finish-cycle-17")
(echo "wanteds-start-cycle-17")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-17))
(check-sat)
unsat
(echo "wanteds-finish-cycle-17")
(pop 1)
(echo "solver-finish-cycle-17")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
; GIVENS (conversions)
; GIVENS (names)
a3ac  <=  a
a3ad  <=  b
a3ae  <=  c
a3cU  <=  fsk_a3cU
a3cX  <=  fsk_a3cX
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-18.2))
(assert
   (!
      (= a3cU true)
      :named
      given-18.3))
(assert
   (!
      (= a3cX true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-18")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-18")
; GIVENS (conversions)
; GIVENS (names)
a3ac  <=  a
a3ad  <=  b
a3ae  <=  c
a3cU  <=  fsk_a3cU
a3cX  <=  fsk_a3cX
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-18.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-18.2))
(assert
   (!
      (= a3cU true)
      :named
      given-18.3))
(assert
   (!
      (= a3cX true)
      :named
      given-18.4))
(check-sat)
sat
(echo "givens-finish-cycle-18")
(echo "wanteds-start-cycle-18")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-18))
(check-sat)
unsat
(echo "wanteds-finish-cycle-18")
(pop 1)
(echo "solver-finish-cycle-18")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3d3} {2}:: (a <? c) ~ 'True (CNonCanonical)

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; (<? [a3ac,a3ae],True [])

(echo "givens-start-cycle-19")
; GIVENS (conversions)
;      [WD] hole{a3d3} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3ac a3ae)
;    true)

; GIVENS (names)
a3ac  <=  a
a3ad  <=  b
a3ae  <=  c
a3cU  <=  fsk_a3cU
a3cX  <=  fsk_a3cX
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-19.2))
(assert
   (!
      (= a3cU true)
      :named
      given-19.3))
(assert
   (!
      (= a3cX true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
;      [WD] hole{a3d3} {2}:: (a <? c) ~ 'True (CNonCanonical)
;  =>  (=
;    (< a3ac a3ae)
;    true)

; WANTEDS (names)
a3ac  <=  a
a3ae  <=  c
(assert
   (!
      (or
         false
         (not
            (=
               (< a3ac a3ae)
               true)))
      :named
      wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-19")

; GIVENS (GHC style)
; [G] cobox_a3cV {0}:: (a <? b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cY {0}:: (b <? c) ~ fsk0 (CFunEqCan)
; [G] cobox_a3cW {1}:: fsk0 ~ 'True (CTyEqCan)
; [G] cobox_a3cZ {1}:: fsk0 ~ 'True (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (<? [a3ac,a3ad],a3cU)
; (<? [a3ad,a3ae],a3cX)
; (a3cU,True [])
; (a3cX,True [])

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-19")
; GIVENS (conversions)
; GIVENS (names)
a3ac  <=  a
a3ad  <=  b
a3ae  <=  c
a3cU  <=  fsk_a3cU
a3cX  <=  fsk_a3cX
(push 1)
(declare-const a3ac Int)
(declare-const a3ad Int)
(declare-const a3ae Int)
(declare-const a3cU Bool)
(declare-const a3cX Bool)
(assert
   (<= 0 a3ac))
(assert
   (<= 0 a3ad))
(assert
   (<= 0 a3ae))
(assert
   (!
      (=
         (< a3ac a3ad)
         a3cU)
      :named
      given-19.1))
(assert
   (!
      (=
         (< a3ad a3ae)
         a3cX)
      :named
      given-19.2))
(assert
   (!
      (= a3cU true)
      :named
      given-19.3))
(assert
   (!
      (= a3cX true)
      :named
      given-19.4))
(check-sat)
sat
(echo "givens-finish-cycle-19")
(echo "wanteds-start-cycle-19")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-19))
(check-sat)
unsat
(echo "wanteds-finish-cycle-19")
(pop 1)
(echo "solver-finish-cycle-19")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
; GIVENS (conversions)
; GIVENS (names)
a3ao  <=  a
a3ap  <=  b
a3d4  <=  fsk_a3d4
a3d6  <=  fsk_a3d6
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-20.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-20")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-20")
; GIVENS (conversions)
; GIVENS (names)
a3ao  <=  a
a3ap  <=  b
a3d4  <=  fsk_a3d4
a3d6  <=  fsk_a3d6
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-20.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-20.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-20.3))
(check-sat)
sat
(echo "givens-finish-cycle-20")
(echo "wanteds-start-cycle-20")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-20))
(check-sat)
unsat
(echo "wanteds-finish-cycle-20")
(pop 1)
(echo "solver-finish-cycle-20")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; [WD] hole{a3au} {0}:: a ~ b (CNonCanonical)

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; (a3ao,a3ap)

(echo "givens-start-cycle-21")
; GIVENS (conversions)
;      [WD] hole{a3au} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3ao a3ap)

; GIVENS (names)
a3ao  <=  a
a3ap  <=  b
a3d4  <=  fsk_a3d4
a3d6  <=  fsk_a3d6
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-21.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
;      [WD] hole{a3au} {0}:: a ~ b (CNonCanonical)
;  =>  (= a3ao a3ap)

; WANTEDS (names)
a3ao  <=  a
a3ap  <=  b
(assert
   (!
      (or
         false
         (not
            (= a3ao a3ap)))
      :named
      wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-21")

; GIVENS (GHC style)
; [G] cobox_a3d7 {0}:: (a + b) ~ fsk0 (CFunEqCan)
; [G] cobox_a3d5 {0}:: (a + a) ~ fsk0 (CFunEqCan)
; [G] cobox_a3ar {0}:: fsk0 ~ fsk1 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [a3ao,a3ap],a3d6)
; (+ [a3ao,a3ao],a3d4)
; (a3d4,a3d6)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-21")
; GIVENS (conversions)
; GIVENS (names)
a3ao  <=  a
a3ap  <=  b
a3d4  <=  fsk_a3d4
a3d6  <=  fsk_a3d6
(push 1)
(declare-const a3ao Int)
(declare-const a3ap Int)
(declare-const a3d4 Int)
(declare-const a3d6 Int)
(assert
   (<= 0 a3ao))
(assert
   (<= 0 a3ap))
(assert
   (<= 0 a3d4))
(assert
   (<= 0 a3d6))
(assert
   (!
      (=
         (+ a3ao a3ap)
         a3d6)
      :named
      given-21.1))
(assert
   (!
      (=
         (+ a3ao a3ao)
         a3d4)
      :named
      given-21.2))
(assert
   (!
      (= a3d4 a3d6)
      :named
      given-21.3))
(check-sat)
sat
(echo "givens-finish-cycle-21")
(echo "wanteds-start-cycle-21")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-21))
(check-sat)
unsat
(echo "wanteds-finish-cycle-21")
(pop 1)
(echo "solver-finish-cycle-21")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3db} {2}:: (a + b) ~ (b + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3ax,a3ay],+ [a3ay,a3ax])

(echo "givens-start-cycle-22")
; GIVENS (conversions)
;      [WD] hole{a3db} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3ax a3ay)
;    (+ a3ay a3ax))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
;      [WD] hole{a3db} {2}:: (a + b) ~ (b + a) (CNonCanonical)
;  =>  (=
;    (+ a3ax a3ay)
;    (+ a3ay a3ax))

; WANTEDS (names)
a3ax  <=  a
a3ay  <=  b
(declare-const a3ax Int)
(declare-const a3ay Int)
(assert
   (<= 0 a3ax))
(assert
   (<= 0 a3ay))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3ax a3ay)
               (+ a3ay a3ax))))
      :named
      wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-22")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-22")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-22")
(echo "wanteds-start-cycle-22")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-22))
(check-sat)
unsat
(echo "wanteds-finish-cycle-22")
(pop 1)
(echo "solver-finish-cycle-22")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; [WD] hole{a3dj} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; (+ [a3aF,1],+ [1,a3aF])

(echo "givens-start-cycle-23")
; GIVENS (conversions)
;      [WD] hole{a3dj} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3aF 1)
;    (+ 1 a3aF))

; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
;      [WD] hole{a3dj} {2}:: (a + 1) ~ (1 + a) (CNonCanonical)
;  =>  (=
;    (+ a3aF 1)
;    (+ 1 a3aF))

; WANTEDS (names)
a3aF  <=  a
(declare-const a3aF Int)
(assert
   (<= 0 a3aF))
(assert
   (!
      (or
         false
         (not
            (=
               (+ a3aF 1)
               (+ 1 a3aF))))
      :named
      wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-23")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-23")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-23")
(echo "wanteds-start-cycle-23")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-23))
(check-sat)
unsat
(echo "wanteds-finish-cycle-23")
(pop 1)
(echo "solver-finish-cycle-23")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-24")

; GIVENS (GHC style)
; []

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; []

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-24")
; GIVENS (conversions)
; GIVENS (names)
(push 1)
(check-sat)
sat
(echo "givens-finish-cycle-24")
(echo "wanteds-start-cycle-24")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-24))
(check-sat)
unsat
(echo "wanteds-finish-cycle-24")
(pop 1)
(echo "solver-finish-cycle-24")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3aX {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3aQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
; GIVENS (conversions)
; GIVENS (names)
a3aQ  <=  n
(push 1)
(declare-const a3aQ Int)
(assert
   (<= 0 a3aQ))
(assert
   (!
      (= a3aQ 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-25")

; GIVENS (GHC style)
; [G] cobox_a3aX {0}:: n ~ 0 (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (a3aQ,0)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-25")
; GIVENS (conversions)
; GIVENS (names)
a3aQ  <=  n
(push 1)
(declare-const a3aQ Int)
(assert
   (<= 0 a3aQ))
(assert
   (!
      (= a3aQ 0)
      :named
      given-25.1))
(check-sat)
sat
(echo "givens-finish-cycle-25")
(echo "wanteds-start-cycle-25")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-25))
(check-sat)
unsat
(echo "wanteds-finish-cycle-25")
(pop 1)
(echo "solver-finish-cycle-25")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3dp {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3dq {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3b0],a3do)
; (a3do,a3aQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
; GIVENS (conversions)
; GIVENS (names)
a3aQ  <=  n
a3b0  <=  n
a3do  <=  fsk_a3do
(push 1)
(declare-const a3aQ Int)
(declare-const a3b0 Int)
(declare-const a3do Int)
(assert
   (<= 0 a3aQ))
(assert
   (<= 0 a3b0))
(assert
   (<= 0 a3do))
(assert
   (!
      (=
         (+ 1 a3b0)
         a3do)
      :named
      given-26.1))
(assert
   (!
      (= a3do a3aQ)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(echo "solver-start-cycle-26")

; GIVENS (GHC style)
; [G] cobox_a3dp {0}:: (1 + n) ~ fsk0 (CFunEqCan)
; [G] cobox_a3dq {1}:: fsk0 ~ n (CTyEqCan)

; WANTEDS (GHC style)
; []

; GIVENS (Thoralf style)
; (+ [1,a3b0],a3do)
; (a3do,a3aQ)

; WANTEDS (Thoralf style)
; []

(echo "givens-start-cycle-26")
; GIVENS (conversions)
; GIVENS (names)
a3aQ  <=  n
a3b0  <=  n
a3do  <=  fsk_a3do
(push 1)
(declare-const a3aQ Int)
(declare-const a3b0 Int)
(declare-const a3do Int)
(assert
   (<= 0 a3aQ))
(assert
   (<= 0 a3b0))
(assert
   (<= 0 a3do))
(assert
   (!
      (=
         (+ 1 a3b0)
         a3do)
      :named
      given-26.1))
(assert
   (!
      (= a3do a3aQ)
      :named
      given-26.2))
(check-sat)
sat
(echo "givens-finish-cycle-26")
(echo "wanteds-start-cycle-26")
; WANTEDS (conversions)
; WANTEDS (names)
(assert
   (! false :named wanted-26))
(check-sat)
unsat
(echo "wanteds-finish-cycle-26")
(pop 1)
(echo "solver-finish-cycle-26")
(exit)
(exit)
; Test suite rows: RUNNING...
; Test suite rows: PASS