# racket-problems

## This repository contains functional programming problems and solutions using Racket

### What is Racket?

Racket is a general-purpose programming language as well as the world’s first ecosystem for developing and deploying new languages.

### Getting started with Racket!
You can find the full information [here](https://docs.racket-lang.org/getting-started/index.html), but here's the summary
 1. Download and Install Racket, get it [here](http://racket-lang.org/download/)
 2. Once installed launch Dr. Racket
 
 1. On Windows, you can start DrRacket from the Racket entry in the Start menu.
 2. On Mac OS, double click on the DrRacket icon. It is probably in a Racket folder that you dragged into your Applications folder.
 3. On Unix (including Linux), the drracket executable can be run directly from the command-line if it is in your path, which is probably the case if you chose a Unix-style distribution when installing.

 You can also add Racket to the path or as an environmental variable if you want to run it from the terminal / command line, adding the path/to/the/racket/executable to the path environment variable.

 ## The Problems!

 Listed below are a few relatively simple problems that need to be solved in scheme using only the following:
 ``cons, car, cdr, define, lambda, if, null, null?, cond, map, = ``and the basic numerical operators ``(+, -, *, /, modulo)``.

  ## 1. Prime numbers
 
##### First of all, what is a prime number?
A prime number is a natural positive number which greater than one, and is divisible only by itself and one.

##### How do we prove that a number is a prime number? 
Well its relatively simple, we could use a brute force algorithm to check if the number (x) is divisible by the iteration (y). If it is divisible by only one and itself then its prime.. otherwise its not. While the brute force algorithm will eventually return the result we're looking for it has the potential to be expensive in time and complexity the higher the (x) value gets. Numbers which are not prime will be divisible by the following prime numbers: [2, 3, 5, 7].

##### So how could we lower the cost? 
To lower the complexity and cost of the algorithm we could just check the numbers less than the square root of (x) this will still return the same result at a fraction of the cost. Why is this less expensive? We're checking only a fraction of numbers which the brute force algorithm will check.

[Here](https://en.wikipedia.org/wiki/Prime_number) is some information from Wikipedia if you want to know more about prime numbers...

#### Conclusion
For the problem these were my solution:
````scheme
  (define m 2)

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
````
___
## 2. Collatz Conjecture
Write, from scratch, a function in Racket that takes a positive integer n0 as input and returns a list by recursively applying the following operation, starting with the input number: (Equal: n/2 | Odd: n * 3 + 1) until n is 1.

##### What is Collatz Conjecture
Collazt Conjecture is a mathematical conjecture concerning a sequence that begins with a positive natural number which will always end at 1 following the algorithm above.

##### How do we prove that this is true? 
Collatz Conjecture has yet to be proven true, most research into the conjecture come to same conclusion that it is true via experimental evidence and heuristic arguments in support of it.

##### Experimental & Heuristics
 * As of December 16th 2017, the conjecture has been checked for all starting values ranging up to 87*2^60 using computers. All of these values eventually would end in a cycle {4, 2, 1}. The full article can be found [HERE](http://www.ericr.nl/wondrous/)

 * If we only account for the odd numbers within' the sequence generated by the process, each odd number will be, on average ^3/_4 than the previous odd value. The heuristic argument suggests that on average the process iterates in a trajectory that will tend to shrink in size, so that divergent trajectories should not exist. This argument can be found [HERE](http://www.cecm.sfu.ca/organics/papers/lagarias/paper/html/node3.html) 

#### Conclusion 
While it is yet to be proven true, the research done shows strong evidence that suggests it is. In anycase here is my solution:

````scheme
  (define (collatz-list n)
  (cond
    ((= n 1) '(1)); 1
    ((= (modulo n 2) 0) ; 2
      (cons n (collatz-list (/ n 2)))); 3
    ((= (modulo n 2) 1) ; 4
      (cons n (collatz-list (+ (* 3 n) 1)))))); 3

````
___
## 3. Left & Right list cycles
Write, from scratch, two functions in Racket. The first is called lcycle (left cycle). It takes a list as input and returns the list cyclically shifted one place to the left. The second is called rcycle (right cycle), and it shifts the list cyclically shifted one place to the right.

#### How do we do it?
To solve the problem we need to make a couple of auxiliary functions which will do the following: get the last element of a list (``peek()``), remove the last element of a list (``pop()``), & append to a list (``append()``). These functions will simplify the code within' lcycle and rcycle functions. So lets take a look at each one individually.

##### Peek
The ``peek`` function should mimic that of a ``List`` function that you may have used in Java. So lets look at that:
> "The java.util.LinkedList.peek() method retrieves, but does not remove, the head (first element) of this list."

Ok we already have ``car`` which will do this for us, so we'll create one for the final element. We recursively check until we reach the end of the list once we do return the value.

 ##### Pop
 Similar to ``peek`` the ``pop`` function, but instead of returning the the final element it will return every other element of the list.

 ##### Append 
Since the requirements specify that we cannot use the built in ``append`` function, we'll made our own using cons. Recurse through the list adding the first element on each iteration into the returned list.

Now that we have all these auxiliary functions we can tackle both of the cycles

##### Left cycle
Use `cdr` of the non empty list l = '(1 2 3) for example, to return another list '(2 3), the 2nd element of the a pair: where the first element is the `car` of l and the second is the `cdr` of l. We then get the `car` of l to return the first element of the pair = 1. Wrap those two functions in the `append` function and we should get: '(2 3 1)

##### Right cycle
`cons` the `peek` onto the `pop`: where the `peek` of a list '(1 2 3) = 3 and the `pop` = '(1 2) which gives us the the result '(3 1 2)

#### Conclusion
The best solution I found to this problem was the following solution:

````scheme
  (define (lcycle l)
    (app (cdr l) (car l)))

  (define (rcycle l)
    (cons (peek l) (pop l)))
    
  (define (peek n)
    (if (null? (cdr n)) 
      (car n)          
      (peek (cdr n)))) 

  (define (pop n)
    (if(null? (cdr n))
      '() 
        (cons (car n) (pop (cdr n)))))

  (define (app l m)
    (if (null? l) '(l)
      (cons (car l) (app (cdr l) m))))
````
___
## 4. Sub list Sum

##### The task
 Write a function sublsum in Racket that takes a list (of integers) as input and returns a list of sublists of it that sum to zero. For this problem, you can use the combinations built-in function. 

 ##### How do we do it?
 In theory, first make sure the list l is not null, sum all the elements of a list in each combination, if the sum = 0, return the combination(s). 

 #### Conclusion
 While I was unable to come up with a solution that sticks to the above requirements this is my solution: 

 ````scheme
(define (sublsum? l)
  (null? l) 
  (= 0 (apply + l)))
 ````
___
## 5. Hamming distance

##### The task
; Write a functiono hamming-distance in Racket that takes two lists and returns number of positions in which they differ.

##### What is it and how do we do it?
The Hamming distnace between two words of equal length is the number of places in which they differ. So with that in mind lets consider if we have two lists of equal legth containing only 1's and 0's:

a = '(0 1 0 1 0 1 0)

b = '(0 **0** 0 **0** **1** **0** **1**)

Distance = **5**

The distance of a & b = 5, but how did we come to that conclusion. Its relatively simple. Recurse through both lists comparing each element of each list against eachother, if they are the same continue, otherwise increment and recurse until the end of the list. 

##### A brief description
The Hamming distance is named after Richard Hamming, who introduced the concept in his fundamental paper on Hamming codes Error detecting and error correcting codes in 1950. Hamming weight analysis of bits is used in several disciplines including information theory, coding theory, and cryptography.

#### Conclusion

Here is the solution for this problem: 

````scheme
  (define n 0)
  (define (hamming-distance l m) 
    (if (not (pair? l)) 
        n 
        (if (= (car l) (car m)) (hamming-distance (cdr l) (cdr m))
        (+ 1 (hamming-distance (cdr l) (cdr m))))))
````
___
## 6. Hamming weight
 Write a function hamming-weight in Racket that takes a list l as input and returns the number of non-zero elements in it.

 ##### How do we do it? 
 The solution to the following is fairly similar to the Hamming distance. Recurse through a list checking each element, if the element is 1, increment and continue, otherwise do not increment but continue nonetheless. 

##### What is it?
Named after Richard Hamming although he was not the originator of the Hamming Weight. The Hamming weight of binary numbers was originated in 1899 by James W. L. Glaisher to give a formula for the number of odd binomial coefficients in a single row of Pascal's triangle. The formula has uses in several areas including, cryptography, information and coding theory. 

#### Conclusion
This is the solution I built for this problem:
````scheme
  (define (hamming-weight l)
    (if (null? l)
        0
        (if (= 1 (car l))(+ 1 (hamming-weight (cdr l)))
        (hamming-weight (cdr l)))))
````
___
## 7. Maj
 Write a function maj in Racket that takes three lists x, y, and z of equal length and containing only 0's and 1's. it should return a list containing a 1 where two or more lists contain 1's and 0 otherwise.

 ##### How do we do it?
Check through each element of 3 lists containing 1's and 0's only, if 2 or more lists contain a 1, add that to a list in the postion otherwise 0, and continue till the end and return this new list: EG.

``(0 1 1 0) (1 0 1 0) (0 0 0 0) = (0 0 1 0)``

For this I will explain the two different methods I used to solve this problem.

  1. First check if the current element is null if so exit the funciton, then check the following conditions if the the current element of x = y or z then add that to the list and recurse, otherwise add the current element of y and recurse.

  2. Alternatively we can map x y z to a lambda function with args a b c which checks the sum of each trio in the lists of elements to see if it equals 2 or more, if so add it to the list and return.

#### Conclusion
This are the solutions I built for the problem: 

````scheme
  (define (maj x y z)
    (if (null? x)
        0
        (cond
          ((= (car x) (car y)) (cons (car x) (maj (cdr x) (cdr y) (cdr z))))
          ((= (car x) (car z)) (cons (car x) (maj (cdr x) (cdr y) (cdr z))))
          (else (cons (car y) (maj (cdr x) (cdr y) (cdr z))))
          )))

  (define (maj-map x y z)
      (map (lambda (a b c) 
          (if(>= (+ a b c) 2) 1 0))else 0
          x y z))
````
___
## 8. Chse
 Write a function chse in Racket that takes three lists x, y, and z of equal length and containing only 0's and 1's. It should return a list containing the elements of y in the positions where x is 1 and the elements of z otherwise. 

#### How do we do it?
Recurse through a list x, check the current first element of the list, if the element is equal to 1 then add the element with the corresponding element of y, otherwise if its equal to 0, add the element with the corresponding element of z and return the result.

Alternatively we can use a map to a lambda function to do this for us where we check if each element in a equals 1, if so, add the element of a in the corresponding postion, otherwise c in the corresponding postion to a list and return once done (Where mapping x -> a, y -> b, z -> c).

Example: 
``x(0 0 0 0 1 1 1 1) y(0 0 1 1 0 0 1 1) z(0 1 0 1 0 1 0 1) = (0 1 1 0 1 0 0 1)``

#### Conclusion
Here are the solutions I built for the problem:
````scheme
  (define (chse x y z)
    (if (null? y) 
        '() 
        (cond 
          ((= 1 (car x)) (cons (car y)(chse (cdr x) (cdr y) (cdr z))))
          (else (cons (car z)(chse (cdr x) (cdr y) (cdr z)))))))

  (define (chse-map x y z)
    (map (lambda (a b c)
          (if (= a 1) b c))
        x y z))
````
___
## 9. SOD2
Write a function in Racket that takes three lists x, y, and z of equal length and containing only 0's and 1's. It should return a list containing a 1 wher the number of 1's in a given position in x, y, and z contains an odd number.

#### How does it work?
Similar to the previous 2 tasks, recurse through a set of lists, if the sum of current elements in the 3 lists is an equal number add a 0 onto a list, otherwise add a 1 to a list, and return said list once we have checked all elements.

#### Conclusion
Here are the solutions I built for the problem:
````scheme
  (define (sod2 x y z) 
    (if (null? x) 
        '()
        (cond 
          ((= (modulo (+ (car x)(car y)(car z)) 2) 0)(cons 0 (sod2 (cdr x) (cdr y) (cdr z))))
          (else (cons 1 (sod2 (cdr x) (cdr y) (cdr z)))))))

  (define (sod2-map x y z)
    (map (lambda (a b c) 
          (if (= (modulo (+ a b c) 2) 0) 0 1))   
          x y z)) 
````
___
## 10. Lstq
Write a function lstq in Racker that takes as arguements two lists l and m or equal length and containing numbers. It should return d, the distance given by the sum of the square residuals between the numbers in the lists. Take the ith element of m from the ith element of l and square the result for all i. Then add all of those to get d.

#### How do we do this?
We need 2 auxiliary functions ``round-lists`` and ``sum``

###### round-lists
First check if we are at the end of the list / have a null list if so exit - return the list wether its null or built. Alternatively add the remainer of el (x - y)^2 to the the list by recursively iterating through the list until we reach the end, and return.

###### sum
Sum all the elements of a list and return unless the list is null.

###### lstq
With that we simply sum the lists which each element of has already been squared to return our final result.
````
Example: 
(pow-lists '(4 5 6) '(1 2 3))
 = (3 3 3)^2 
 = (9 9 9) 
 (sum (9 9 9)) = 27 = lstq
````

#### Conclusion
Here is the solution for the problem:
````scheme
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
````
___
# END

