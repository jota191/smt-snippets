(echo "starting Z3...")
(set-option :print-success true)

(declare-const x Real)
(declare-const y Real)

(assert (or (= x 0) (= x 1) (= x (- 1)) (= (- (* x x) 1) 0)))
(assert (> x 4))

(assert (= y (/ 1 x)))



(check-sat)
(get-model)
