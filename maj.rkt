#lang racket

; Write a function maj in Racket that takes three lists x, y, and z of equal length and
; containing only 0's and 1's. it should return a list containing a 1 where two or more
; lists contain 1's and 0 otherwise.

(define (maj x y z)
  (if (null? x); exit statement if x is null we've reached the endof the list
      '() ; return the list of matching values
      (cond ; check the following conditions if car of x = y or z and vice versa
        ((= (car x) (car y)) (cons (car x) (maj (cdr x) (cdr y) (cdr z))))
        ((= (car x) (car z)) (cons (car x) (maj (cdr x) (cdr y) (cdr z))))
        ((= (car z) (car y)) (cons (car y) (maj (cdr x) (cdr y) (cdr z))))
        )))
; if so append add the number to the list and recursively check through each element
; of the list until the exit statement is satisfied


; expected value (0 0 0 1 0 1 1 1)
(maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))