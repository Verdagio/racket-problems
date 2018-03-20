#lang racket

; Write a function in Racket that takes three lists x, y, and z of equal length and
; containing only 0's and 1's. It should return a list containing a 1 wher the number
; of 1's in a given position in x, y, and z contains an odd number

(define (sod2 x y z)
  (if (null? x) ; Exit statement : if x is null we have reached the end of the list
      '(); return the list
      (cond ; if the sum of elements of the list is an even number append 0 : else 1
        ((= (modulo (+ (car x)(car y)(car z)) 2) 0)(cons 0 (sod2 (cdr x) (cdr y) (cdr z))))
        (else (cons 1 (sod2 (cdr x) (cdr y) (cdr z)))))))

(sod2 (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))