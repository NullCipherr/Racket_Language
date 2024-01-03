#lang racket

; Uma expressão lambda cria uma função, servindo quando desejamos criar uma função anonima

; No caso mais simples, uma expressão lambda tem a forma (lambda (arg-id ...) body ...+). Uma forma lambda com n arg-ids aceita n argumentos.

; Uma expressão lambda também pode ter a forma (lambda rest-id body ...+), ou seja, uma expressão lambda pode ter um único rest-id que não está cercado por parênteses.
; A função resultante aceita qualquer número de argumentos, e os argumentos são colocados em uma lista vinculada a rest-id1.
; lambda é muito útil quando você quer passar uma função in-line, de uso único, como um parâmetro sem defini-la primeiros.

(define list-1 (list 1 2 3 4))

(define (increment-list value list)
  (map(lambda (x)
        (+ x value))
      list))

(define (multiply-list value list)
  (map(lambda (x)
        (* x value))
      list))