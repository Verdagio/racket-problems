#lang racket

; Write, from scratch, a function in Racket that takes a positive integer n0 as input
; and returns a list by recursively applying the following operation, starting with the
; input number.
; End the recursion when (or if) the number becomes 1. Call the function collatz-list.
; So, collatz-list should return a list whose first element is n0, the second element
; is n1, and so on.


; collatz-list : takes a positive number -> returns list

; 1: if n is 1 no need to continue
; 2: if n is an even number add (n/2) to the list
; The primitive cons takes two arguments. The second argument to cons should be a list
; but doesn't always have to be. The result is a list.
; In the Little schemer the second commandment is: Use cons to build lists!
; 3: recursive call function with n as arguement
; 4: otherwise if the number is odd add (n*3 + 1) to the list

; manual checking
(define (collatz-list n)
  (cond
    ((= n 1) '(1)); 1
    ((= (modulo n 2) 0) ; 2
      (cons n (collatz-list (/ n 2)))); 3
    ((= (modulo n 2) 1) ; 4
      (cons n (collatz-list (+ (* 3 n) 1)))))); 3

; using a pre-defined list and the even? odd? check
(define ls '())
(define (collatz-listv2 n)
  (append ls n)
  (cond
    ((= n 1) ls '(1)); 1
    ((even? n) ; 2
      (cons n (collatz-list (/ n 2)))); 3
    ((odd? n) ; 4
      (cons n (collatz-list (+ (* 3 n) 1)))))); 3



; expected both should return the same result
(collatz-list 7)
(collatz-listv2 7)
(collatz-list 45)
(collatz-listv2 45)
(collatz-list 51)
(collatz-listv2 51)

