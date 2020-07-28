(echo "starting Z3...")
(set-option :print-success true)

(declare-const a Int)
;(declare-const a Int)
(declare-fun f (Int Bool) Int) ;; Int * Bool -> Int
(assert (> a 10))
(assert (< (f a true) 100))

(check-sat)
(get-model)

;; (model 
;;   (define-fun a () Int
;;     11)
;;   (define-fun f ((x!0 Int) (x!1 Bool)) Int
;;     (ite (and (= x!0 11) (= x!1 true)) 0
;;       0))
;; )
