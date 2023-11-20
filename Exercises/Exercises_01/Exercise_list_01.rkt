#lang racket


; Exercise 6: Define a function that finds the greater value between two given values.
;
(define (findGreater a b) (if (> a b) a b))


; Exercise 7: Define a function that takes three numbers as parameters and returns the sum of the squares of the two largest numbers.
;
(define (squareNum a) (* a a))
(define (sumSquares a b) (+ (squareNum a) (squareNum b)))
(define (sumOfTwoLargest a b c) (+ (squareNum (findGreater a b)) (squareNum (findGreater a c))))


; Exercise 8: Define a function and calculate the distance of a point in the Cartesian plane (represented by two numbers) to the origin.
;
(define (distance-point-origin x y)
  (sqrt (+ (squareNum x) (squareNum y))))


; Exercise 9: Define a function that takes three numbers representing the sides of a triangle and classifies the triangle as equilateral, isosceles, or scalene.
;
; Properties of triangle sides:
; Equilateral: All sides have the same length.
; Isosceles: Has two sides with the same length.
; Scalene: All three sides have different lengths.
;
(define (isEquilateral a b c)
  (and (= a b) (= b c)))

(define (isIsosceles a b c)
  (if (and (= a b) (= b c) (= a c)) false (or (= a b) (= b c) (= a c))))

(define (isScalene a b c)
  (and (not (= a b)) (not (= b c))))

(define (triangleClassifier l1 l2 l3)
  (if (isEquilateral l1 l2 l3) "The triangle is equilateral" 
      (if (isIsosceles l1 l2 l3) "The triangle is isosceles" 
          (if (isScalene l1 l2 l3) "The triangle is scalene" "Error!"))))


; Exercise 10: Define a function that classifies a person's obesity level using the BMI.
;
; Body Mass Index (BMI) is a common measure to assess a person's body weight in relation to their height.
; BMI = weight / height^2
;
(define (calculateBMI weight height)
  (/ weight (squareNum height)))

(define (classifyObesity weight height)
  (define bmi (calculateBMI weight height))

  (cond
    [(<= bmi 18.5) "Underweight"]
    [(<= bmi 24.9) "Normal weight"]
    [(<= bmi 29.9) "Overweight"]
    [(<= bmi 34.9) "Obesity grade 1"]
    [(<= bmi 39.9) "Obesity grade 2"]
    [else "Obesity grade 3"]))
