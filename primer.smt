(set-option :print-success true)

;;declaration of (pre-typed) function
(declare-fun f (Real) Real)

(declare-const x Real)
(declare-const y Real)

;;function condition
(assert (= y (/ 1 x)))


(push)
;; f:Rno0 -> R+

(assert (not (= x 0)))
(assert (not (> y 0)))
(check-sat)
(get-model);; da el contraejemplo

(pop)
(push)

;; f:Rno0 -> R

(assert (not (= x 0)))
(assert (not true)) ;; no hay condiciones sobre codo
(check-sat);; unsat, porque esta bien tipado!

(pop)
;; f:Rno0 -> Rno0
(assert (not (= x 0)))
(assert (not (not (= y 0))))
(check-sat);; unsat, porque esta bien tipado!
