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

 ## The Problems!

 Listed below are a few relatively simple problems that need to be worked out in scheme.

  ### 1. Prime numbers
###### First of all, what is a prime number?

A prime number is a number which is divisible only by itself and one.

###### How do we prove that a number is a prime number? 

Well its relatively simple, we could use a brute force algorithm to check if the number (x) is divisible by the iteration (y). If it is divisible by only 1 and itself then its prime.. otherwise its not. While the brute force algorithm will eventually return the result we're looking for it has the potential to be expensive in time and complexity the higher the (x) value gets.

###### So how could we lower the cost? 

To lower the complexity and cost of the algorithm we could just check the numbers less than the square root of (x) this will lower complexity quite a lot.




