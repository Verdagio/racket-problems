#lang racket


; Write a function sublsum in Racket that takes a list (of integers) as input and returns
; a list of sublists of it that sum to zero. For this problem, you can use the
; combinations built-in function. Note the order of the sublists and their elements
; doesn’t matter.

(define (sublsum l)
  )


 
; reference: https://stackoverflow.com/questions/47665879/finding-minimum-value-more-efficiently-in-racket
(define (getMin lst)
    (cond 
      ((null? (cdr lst)) (car lst))
      ((< (car lst) (getMin (cdr lst))) (car lst))
      (else 
        (getMin (cdr lst)))) )

(minim (list 1 2 3 4 -5))