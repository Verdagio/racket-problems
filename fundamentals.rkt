#lang racket
; Racket fundamentals
; simple mathematical equations
; 3 * (5 + (10/5))
(* 3 ( + 5 (/ 10 5)))
; (2 + 3 + 4 + 5)
(+ 2 3 4 5)
; (1 + (5 + (2 + (10 ÷ 3))))
(+ 1 (+ 5 (+ 2 (/ 10 3))))
; (1 + (5 + (2 + (10 ÷ 3.0))))
(+ 1 (+ 5 ( + 2 ( / 10 3.0))))
; (3 + 5) × (10 ÷ 2)
(* (+ 3 5)(/ 10 2))
; (3 + 5) × (10 ÷ 2) + (1 + (5 + (2 + (10 ÷ 3))))
(+ (* (+ 3 5) (/ 10 2)) (+ 1 (+ 5 (+ 2 (/ 10 3)))))

; discount function : (price, percentage) -> price - percentage
(define (discount n p)
  (- n (* n (/ p 100.00))))

(discount 10 5) ; 10 - 5%
(discount 29.90 50) 

; Greatest common divisor
(define (grconmdiv a b)
  (cond [(= b 0) a]
        [else (gcd b (modulo a b))]))

(grconmdiv 10 15)