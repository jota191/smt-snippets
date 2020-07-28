(display #b0100)
(display (_ bv20 8)) ;; val 20 in a vb of size 8; displays #x14
;; if size is mult of 8 hex is used by default
(display (_ bv20 7)) ;; val 20 in a vb of size 7; displays #b0010100
(display #x0a)

;; option to display in dec
(set-option :pp.bv-literals false)
(display #b0100) ;; displays (_ bv4 4)
(display (_ bv20 8))
(display (_ bv20 7))
(display #x0a)


(set-option :pp.bv-literals true)
;; Arith
(echo "Arith on bv")

(simplify (bvadd #x07 #x03)) ; addition
(simplify (bvsub #x07 #x03)) ; subtraction
(simplify (bvneg #x07)) ; unary minus (a=~a+1)
(simplify (bvmul #x07 #x03)) ; multiplication
(simplify (bvurem #x07 #x03)) ; unsigned remainder
(simplify (bvsrem #x07 #x03)) ; signed remainder
(simplify (bvsmod #x07 #x03)) ; signed modulo
(simplify (bvshl #x07 #x03)) ; shift left
(simplify (bvlshr #xf0 #x03)) ; unsigned (logical) shift right
(simplify (bvashr #xf0 #x03)) ; signed (arithmetical) shift right

;; Bitwise
(echo "bw on bv")
(simplify (bvor #x6 #x3))   ; bitwise or
(simplify (bvand #x6 #x3))  ; bitwise and
(simplify (bvnot #x6)) ; bitwise not
(simplify (bvnand #x6 #x3)) ; bitwise nand
(simplify (bvnor #x6 #x3)) ; bitwise nor
(simplify (bvxnor #x6 #x3)) ; bitwise xnor


;; Demorgan
(push)
(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(assert (not (= (bvand (bvnot x) (bvnot y)) (bvnot (bvor x y)))))
(check-sat)
