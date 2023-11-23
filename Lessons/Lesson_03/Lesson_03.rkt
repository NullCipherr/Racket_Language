#lang racket

; Dados Compostos

; Estamos interessados em representar dados onde dois ou mais valores devem ficar juntos.
; A solução para isso são as estruturas.

; Forma especial -> struct
; Sintaxe -> (struct <id-estrutura> (<id-campo> parametro_1 ... parametro_n))

; Vamos definir uma estrutura de um ponto no plano cartesiano.
(struct ponto (x y))

; Faz a definição do ponto 1, utilizando a estrutura de ponto.
(define p1 (ponto 2 3))

(display "Coordenada x de p1 -> ")
(display (ponto-x p1))

; Função utilizada para inserir uma nova linha entre as duas strings exibidas
(newline)

(display "Coordenada y de p1 -> ")
(display (ponto-y p1))

; ----------------------------------------------------------------------------------------------------------------- ;

; Estruturas Transparente

(struct ponto-transparent (x y) #:transparent)
(define p2 (ponto-transparent 3 4))

(newline)(newline)
(display "Estrutura Ponto 1 -> ")(display p1)
(newline)
(display "Estrutura Ponto 2 -> ")(display p2)
(newline)(newline)

; Copiando uma estrutura

; Exibindo os valores originais.
(display "Valores originais -> ")
(display (format "x: ~a, y: ~a" (ponto-x p1) (ponto-y p1)))

; Criando uma cópia modificada de p1, modificando o valor de x.
(define p3 (struct-copy ponto p1 [x 5]))

; Exibindo os valores da cópia modificada
(display "\nValores da cópia modificada -> ")
(display (format "x: ~a, y: ~a" (ponto-x p3) (ponto-y p3)))
