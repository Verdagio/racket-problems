#lang racket

; Write a functiono hamming-distance in Racket that takes two lists and returns
; number of positions in which they differ.

(define (hamming-distance l m) ; define function which takes 2 lists 
  (if (not (pair? l)) ; exit statement if the car of l has a corresponding cdr of l which is a list not equal to null
      0
      (if (= (car l) (car m)) (hamming-distance (cdr l) (cdr m)) ; if the value of each list is the same continue the recursive call without incrementing 
      (+ 1 (hamming-distance (cdr l) (cdr m)))))) ; otherwise they are different meaning we increment the distance by 1.

(hamming-distance (list 1 1 1 1 0 0 0 0) (list  1 0 1 0 1 1 1 0))
(hamming-distance (list 1 1 1 1 0 0 0 0) (list  1 1 1 1 0 0 0 0))
(hamming-distance (list 1 1 1 1 0 0 0 0) (list  0 0 0 0 1 1 1 1))