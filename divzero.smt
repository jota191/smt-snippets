(set-option :print-success true)

(declare-const a Real)
(assert (= (/ a 0.0) 10.0))
(check-sat);;sat
