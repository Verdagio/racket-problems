#lang racket

;Write, from scratch, a function in Racket that uses a brute-force algorithm that takes
;a single positive integer and return true if the number is a prime and false otherwise.
;Call the function decide-prime.

; check prime takes a number -> returns boolean
;1: 1 & 0 are not prime numbers and we can only check non-negative numbers
;2: check recursively through every number in range m -> n
;3 - optimal : if m is greater than the square root of n, return otherwise continue
     ; We use the square root of n to reduce the complexity of the algorithm
     ; This goes against the whole idea brute force but is a good solution if it weren't a brute force task
     ; https://stackoverflow.com/questions/5811151/why-do-we-check-up-to-the-square-root-of-a-prime-number-to-determine-if-it-is-pr
;3 - expensive (brute force): check if m is equal to n - this will check against every number in the range of m -> n
;4: if the remainder of n / m is 0 its not prime 
;5: brute force recursively checking each m against n
(define m 2)

; brute force method (check everything along the way)
(define (decide-prime n)
      (if (< n 2) ; 1
        #f
        (recursion n m))); 2

(define (recursion n m)
   (if (= m n); 3 - expensive (brute force)
      #t
      (if (= (modulo n m)0) ; 4
          #f
          (recursion n (+ m 1))))); 5

; optimal (check only while m is greater than the square root of n)
(define (decide-prime-optimal n)
      (if (< n 2) ; 1
        #f
        (recursion-optimized n m))); 2

(define (recursion-optimized n m)
  (if (> m (integer-sqrt n)) ; 3 (optimal)
      #t
      (if (= (remainder n m)0) ; 4
          #f
          (recursion-optimized n (+ m 1))))); 5

(decide-prime-optimal 4) ; #f
(decide-prime-optimal 7) ; #t
(decide-prime-optimal 37) ; #t
(decide-prime-optimal 141) ; #f
(decide-prime-optimal 51) ; #f
(decide-prime-optimal 5) ; #t
(decide-prime-optimal 3) ; #t
(decide-prime-optimal 1) ; #f

(decide-prime 4) ; #f
(decide-prime 7) ; #t
(decide-prime 37) ; #t
(decide-prime 141) ; #f
(decide-prime 51) ; #f
(decide-prime 5) ; #t
(decide-prime 3) ; #t
(decide-prime 1) ; #f





