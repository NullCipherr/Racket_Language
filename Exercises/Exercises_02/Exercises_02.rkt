#lang racket

; Lista de Exercicios 02
;
(define lista (list 3 2 3 5 8 3))
(define lista-vazia (list))

; 3.0.1) Defina uma função que verifique se um determinado elemento está em uma lista. ; Não finalizado
; Lista e valor -> Booleano
;
(define (encontra-elemento lista x)
  (cond
    [(empty? lista) (display "Lista vazia")] ; Verifica se a lista é vazia.
    [else (= (first lista) (encontra-elemento (rest lista) x))]))

; 3.0.2) Defina uma função que receba com entrada uma lista lst e um elemento a e devolva uma lista que é como lst mas sem as ocorrˆencias de a.
;
(define (remove-todos lista x)
  ; Condição: Se a lista estiver vazia, exibe uma mensagem indicando que a lista está vazia.
  (cond
    [(empty? lista) (display "Lista Vazia !!")]
    ; Condição: Se a lista não estiver vazia, verifica se o primeiro elemento é igual a 'x'.
    [else
     (cond
       ; Se o primeiro elemento for igual a 'x', retorna o restante da lista, removendo o elemento.
       [(equal? (first lista) x) (remove-todos (rest lista) x)]
       ; Caso contrário, consolida o primeiro elemento na lista resultante e chama recursivamente a função
       ; para remover 'x' do restante da lista.
       [else (cons (first lista)
                   (remove-todos (rest lista) x))])]))
