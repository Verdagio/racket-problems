#lang racket
; Write a function hamming-weight in Racket that takes a list l as input and returns
; the number of non-zero elements in it.

; Check the current first element of a list : if its 1
; increment and recursively check until the end
; otherwise don't increment but keep checking.

(define (hamming-weight l)
  (if (null? l)
      0
      (if (= 1 (car l))(+ 1 (hamming-weight (cdr l)))
      (hamming-weight (cdr l)))))


(hamming-weight (list 1 0 0 1 0 1 1 1))
(hamming-weight (list 1 1 1 1 1 1 1 1))
(hamming-weight (list 0 1 0 1 0 1 1 0))
(hamming-weight (list 0 0 0 0 0 0 0 0))