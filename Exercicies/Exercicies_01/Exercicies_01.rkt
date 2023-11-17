#lang racket

; Exercicio 6 e 7
(define (encontraMaior a b) (if(> a b) a b))
(define (quadradoNum a) (* a a))
(define (somaQuadrados a b)(+ (quadradoNum a)(quadradoNum b))) 
(define (somaMaiores a b c)(+ (quadradoNum (encontraMaior a b))(quadradoNum (encontraMaior a c))))


; Exercicio 10
(define (calculaIMC peso altura)(/ peso (quadradoNum altura)))