#lang racket


; Write a function sublsum in Racket that takes a list (of integers) as input and returns
; a list of sublists of it that sum to zero. For this problem, you can use the
; combinations built-in function. 

; take in a list,
; check if the lowest value is less than zero
; if it is, then check if any combinations within'
; the list will sum to 0
; otherwise return a null list

(define (sublsum? lst);define our function
  (null? lst) ; first ask if the list is empty
  (zero? (apply + lst))); apply to do a procedure and check result is zero

(filter sublsum? (cdr (combinations (list 1 2 3 4 -5))))
(filter sublsum? (cdr (combinations (list 1 2 3 4 5)))) ;test that second list gives no sublsum
