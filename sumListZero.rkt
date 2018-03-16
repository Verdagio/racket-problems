#lang racket
; Write a function sublsum in Racket that takes a list (of integers) as input and returns
; a list of sublists of it that sum to zero. For this problem, you can use the
; combinations built-in function. 

(define (sublsum? l)
  (null? l) ; check if the list is empty
  (= 0 (apply + l))); apply to do a procedure and check result is =  0

; filter is the predicate for combinations to print out the sums that = 0
(filter sublsum? (cdr (combinations (list 1 2 3 4 -5))))
(filter sublsum? (cdr (combinations (list 1 2 3 4 5)))) 
