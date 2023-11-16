#lang racket

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Racket Basics:

; 1. #lang racket: The first line of the code specifies the Racket dialect to be used. In this case, racket is the main language.

; 2. Definitions (define): In Racket, you can use (define name value) to create an association between a name and a value. This is often used to create constants or bind functions to names.

; 3. Functions: Functions in Racket are defined using (define (name arguments) body). This creates a function named name that accepts arguments and executes the body when called.

; 4. Mathematical Operations: Racket supports standard mathematical operations such as +, -, *, and /. Additionally, (* x x) represents the multiplication of x by itself, and (/ (* base height) 2) calculates the division of (base * height) by 2.

; 5. pi: pi is a predefined constant in Racket to represent the mathematical value of π.

; 6. Comments: Comments in Racket start with " ; " and are useful for providing explanations and documentation in the code.

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Define the constant 'x' with a value of 10.
(define x 10)

; Define the constant 'y' with a value of 4.
(define y 4)

; Defines the square of x.
(define (square x)
  (* x x))

; Defines the sum of x with itself.
(define (sum x)
  (+ x x))

; Defines the expression for the sum of squares, which is square of x plus square of y.
(define (sumSquare x y)
  (+ (square x) (square y)))

; Defines the expression for the area of a rectangle, which is base times height.
(define (rectangleArea base height)
  (* base height))

; Defines the expression for the area of a square, which is side times side.
(define (squareArea side)
  (* side side))

; Defines the expression for the area of a triangle, which is (base * height) / 2.
(define (triangleArea base height)
  (/ (* base height) 2))

; Defines the expression for the area of a circle, which is pi times the square of the radius.
(define (circleArea radius)
  (* pi (* radius radius)))

; Defines the expression for the circumference of a circle, which is 2 times pi times the radius.
(define (circleCircumference radius)
  (* 2 pi radius))

; Defines the expression for the volume of a sphere, which is (4/3) times pi times the cube of the radius.
(define (sphereVolume radius)
  (* (/ 4 3) pi (* radius radius radius)))

; Defines the expression for the surface area of a sphere, which is 4 times pi times the square of the radius.
(define (sphereSurfaceArea radius)
  (* 4 pi (* radius radius)))

; Define a function named 'absolute' that calculates the absolute value of a number.

(define (absolute x)
  ; The 'cond' expression is a conditional statement in Racket, similar to a switch statement in other languages.
  (cond
    ; If 'x' is greater than or equal to 0,
    [(>= x 0)
     ; then return 'x' as it is the absolute value in this case.
     x]
    
    ; If 'x' is less than 0,
    [(< x 0)
     ; then return the negation of 'x' (turns negative values into positive),
     (- x)]))
     ; effectively calculating the absolute value.