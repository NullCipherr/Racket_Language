#lang racket

; Listas
;
;; Representa uma lista
;; first: Qualquer - Primeiro elemento da lista
;; rest: Lista -  Referência para o resto da lista
(struct lista (first rest) #:transparent)

; Vamos definir uma lista utilizando a estrutura de lista
; Uma Lista é nula(vazia) ou (lista first rest) onde first  é o primeiro elemento da lista e rest  é uma Lista com o restante dos elementos
(define lista-nula false)
(define lista-1 (lista 4 (lista 2 (lista 8 lista-nula))))

; Vamos criar uma lista utilizando os valores de outra lista
;
;; Define uma lista 2 com os elementos 8 e 7
(define lista-2 (lista 8 (lista 7 lista-nula)))

;; Defini uma lista 3 a partir da lista 2 existente
(define lista-3 (lista 4 lista-2))



; Soma de valores
; Define uma função para somar os elementos de uma lista de valores
;
(define (soma lista)
  (cond
    [(empty? lista) 0] ; Verifica se a lista é vazia
    [else (+ (first lista) (soma (rest lista)))]))

; Define uma lista de valores 'l-valores'
;
(define l-valores (list 1 2 3 4 5))



; Remoção de um valor em uma lista
;
; A função remove-lista recebe uma lista e um valor 'x' a ser removido da lista.
(define (remove-lista lista x)
  ; Condição: Se a lista estiver vazia, exibe uma mensagem indicando que a lista está vazia.
  (cond
    [(empty? lista) (display "Lista Vazia !!")]
    ; Condição: Se a lista não estiver vazia, verifica se o primeiro elemento é igual a 'x'.
    [else
     (cond
       ; Se o primeiro elemento for igual a 'x', retorna o restante da lista, removendo o elemento.
       [(equal? (first lista) x) (rest lista)]
       ; Caso contrário, consolida o primeiro elemento na lista resultante e chama recursivamente a função
       ; para remover 'x' do restante da lista.
       [else (cons (first lista)
                   (remove-lista (rest lista) x))])]))
