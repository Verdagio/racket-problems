#lang racket

#| Write a function lstq in Racker that takes as arguements two lists l and m or equal
length and containing numbers. It should return d, the distance given by the sum of
the square residuals between the numbers in the lists. Take the ith element of m from
the ith element of l and square the result for all i. Then add all of those to get d.|#

(define (lstq l m)
  (sum (pow-lists l m)))

(define (pow-lists l m)
  (cond
    ((null? l) '())
    (else (cons (* (- (car l)(car m))(- (car l)(car m))) (round-lists (cdr l)(cdr m))))))

(define (sum l)
  (if (null?  l)
      0
      (+ (car l) (sum (cdr l)))))

(lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))
