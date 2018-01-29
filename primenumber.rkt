#lang racket

;Write, from scratch, a function in Racket that uses a brute-force algorithm that takes
;a single positive integer and return true if the number is a prime and false otherwise.
;Call the function decide-prime.

; check prime takes a number -> returns boolean
;1: 1 is not a prime
;2: 2 is but anything else divisible by 2 is not!
;3: if m is greater than the square root of n, return otherwise continue
;4: if the remainder of n / m is 0 its not prime 
;5: brute force recursively checking each m against n
(define m 2)
(define (decide-prime n)
      (if (= n 1) ; 1
        #f
        (if (= n 2) ; 2 
            #t
            (recursion n m))))
(define (recursion n m)
  (if (> m (integer-sqrt n)) ; 3
      #t
      (if (= (remainder n m)0) ; 4
          #f
          (recursion n (+ m 1))))); 5
              
(decide-prime 4) ; #f
(decide-prime 7) ; #t
(decide-prime 37) ; #t
(decide-prime 141) ; #f
(decide-prime 51) ; #f
(decide-prime 5) ; #t
(decide-prime 3) ; #t
(decide-prime 1) ; #f







