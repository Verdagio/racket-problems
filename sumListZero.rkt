#lang racket


; Write a function sublsum in Racket that takes a list (of integers) as input and returns
; a list of sublists of it that sum to zero. For this problem, you can use the
; combinations built-in function. 

; take in a list,
; check if the lowest value is less than zero
; if it is, then check if any combinations within'
; the list will sum to 0
; otherwise return a null list


(define (sublsum li)
  (cond
    (< 0 (getMin li)(combinations li))
    (> 0 (getMin li) '())))



 
; reference: https://stackoverflow.com/questions/47665879/finding-minimum-value-more-efficiently-in-racket
(define (getMin lst)
    (cond
      ((null? (cdr lst)) (car lst))
      ((< (car lst) (getMin (cdr lst))) (car lst))
      (else 
        (getMin (cdr lst)))))

(define (inverse n)
  (* -1 n))

(define (sum l)
  (cond (null? (cdr l))
  (+ (car l) (sum (cdr l)))))

(sublsum (list 1 2 3 4 5))
