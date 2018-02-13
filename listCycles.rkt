#lang racket
;Write, from scratch, two functions in Racket. The first is called lcycle. It takes a
;list as input and returns the list cyclically shifted one place to the left. The second
;is called rcycle, and it shifts the list cyclically shifted one place to the right.


; LEFT CYCLE - define a function lcycle which takes a list as an argument
;  get the first element of the list and put it to the back of
;  the list, merge the nested lists into one new list. 
(define (lcycle (list null))
  (merge (cons (cdr list) (cons (car list) '()))))

; RIGHT CYCLE - define a function rcycle which takes a list as an argument
; get the last element, the first element and the rest of the elements,
; pop the last off and merge into one list
(define (rcycle (list null))
 (pop (merge (cons (peek list) (cons (car list) (cons (cdr list) '()))))))

; the peek function will return the last element of the list
(define (peek n)
  (if (null? (cdr n)) ; if cdr of n is null we are at the end of the list
     n                ; so return that numner
     (peek (cdr n)))) ; otherwise recursively check through the cdr of each element until the if statement has been satisfied

; the pop function is the same as the peek function except build a list as we go
; add the first element of the list and recursively cdr check until the if statement
; has been satisfied -> then return the new list
(define (pop n)
  (if(null? (cdr n))
     '() 
      (cons (car n) (pop (cdr n)))))

; the Merge function will take the elements of nested lists and return the list as one
; https://stackoverflow.com/questions/28753729/how-to-manually-flatten-a-list-in-racket-scheme
(define (merge n)
  (cond
    ((null? n) '())
        ((pair? n)
         (append (merge (car n)) (merge (cdr n))))
        ((list n)))
  )

(lcycle (list 1 2 3 4 5))
(rcycle (list 1 2 3 4 5))
