#lang racket

#| Write a function chse in Racket that takes three lists x, y, and z of equal length
 and containing only 0's and 1's. It should return a list containing the elements
 of y in the positions where x is 1 and the elements of z otherwise. |#

(define (chse x y z)
  (if (null? y) ; exit statement if y is null we've reached the end of the list
      '() ; return the list 
      (cond ; if x is 1 return y's value : otherwise z's value in each position
        ((= 1 (car x)) (cons (car y)(chse (cdr x) (cdr y) (cdr z))))
        (else (cons (car z)(chse (cdr x) (cdr y) (cdr z)))))))

(define (chse-map x y z)
  (map (lambda (a b c)
         (if (= a 1) b c))
       x y z))

; expected (0 1 0 1 0 0 1 1)
(chse (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
(chse-map (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))