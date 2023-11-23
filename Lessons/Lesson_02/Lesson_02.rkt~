#lang racket
(require rackunit)

; Anotações
; DrRacket é compilado e interpretado
; ctrl + r = Compila e cria uma espécie de bytecode.

; Imprimir mensagens
(display "Hello World com display")
(print "Hello World com print")
(println "Hello World com printl")

; Natural -> Booleano
; Tem como entrada um número natural e retorna um booleano (#f ou #t)

(define par-tests
  (test-suite
   "par tests"
   (check-equal? (par 2) #t)
   (check-equal? (par 4) #t)
   (check-equal? (par 3) #f)))

(define (par n)
  (= (remainder n 2) 0))

; String -> String
; Devolve a string com o maior tamanho
(define (encontra-maior a b)
  (if (>= (string-length a) (string-length b)) a b))