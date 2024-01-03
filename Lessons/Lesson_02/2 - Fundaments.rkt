#lang racket

; Fundaments

; O paradigma de programação funcional é baseado na :
; - Definição
; - Aplicação
; de funções.

; As funções são escritas em termos de expressões !

; Expressões
;
; Uma expressão consiste de: um literal, ou, uma função primitiva.

; Literal: Um literal é um valor que é expresso como ele mesmo.
; Por exemplo, 2, 3.14, e "hello" são todos literais em muitas linguagens de programação.
; Literais são a maneira mais básica de expressar valores em um programa.

; Função Primitiva: Uma função primitiva é uma função fornecida pela linguagem de programação que realiza uma operação básica.
; Por exemplo, em muitas linguagens de programação, existem funções primitivas para matemática básica, como adição e multiplicação.
; Funções primitivas permitem que os programadores realizem operações complexas sem ter que implementá-las do zero.

; Tipos primitivos

; Números: Racket suporta vários tipos de números, incluindo inteiros, números de ponto flutuante, números racionais e números complexos.

(define integer-number 2)
(define float-number 1.4)
(define racional-number 2/3)
(define complex-number (make-rectangular 3 4)) ; Parte real 3 e parte imaginária 4.
(define complex-number-2 (make-polar 3 (acos -1))) ; Magnitude 3 e ângulo pi radianos.

; Booleanos: O tipo booleano tem dois valores possíveis: #t para verdadeiro e #f para falso.

(define bool #t)

; Strings: Strings em Racket são sequências de caracteres.

(define name "NullCipherr")

; Símbolos: Símbolos são usados em Racket como identificadores lexicamente opacos.

(define symbol 'cat)

; Listas: Listas são uma estrutura de dados fundamental em Racket e outras linguagens Lisp.

(define list-1 (list 1 2 3))

; Vetores: Vetores em Racket são coleções ordenadas de elementos.

(define vector-1 (vector 2 3 4 5))

; Bytes: Racket também suporta sequências de bytes.

(define bytes-1 (bytes 1 2 3 4))

; Funções: Em Racket, funções são valores de primeira classe e podem ser passadas como argumentos para outras funções, retornadas como valores de outras funções, e atribuídas a variáveis.

; Definindo uma função simples
(define (sum x y)
  (+ x y))

; Atribuindo uma função a uma variável
(define my-sum sum)

; Passando uma função como argumento para outra função
(define (apply-function f x y)
  (f x y))

; Retornando uma função de outra função
(define (return-sum)
  sum)

(define new-sum (return-sum))

; Funções primitivas
;
; Funções Aritméticas: +, -, *, / são usadas para realizar operações aritméticas básicas.
; Funções de Comparação: <, >, <=, >=, =, equal? são usadas para comparar valores.
; Funções Lógicas: and, or, not são usadas para operações lógicas.
; Funções de Lista: list, cons, car, cdr, append, list-ref são usadas para manipular listas.
; Funções de Vetor: vector, vector-ref, vector-set!, vector-length são usadas para manipular vetores.
; Funções de String: string-append, string-length, substring, string=? são usadas para manipular strings.
; Funções de Controle de Fluxo: if, cond, case, let, lambda são usadas para controle de fluxo.


; Definições
;
; Também é possível criar definições de novas funções(Funções Compostas)
;
; A sintaxe geral é da seguinte formas : (define (<name> <parameters>) <body>)

(define (quad x)
  (* x x))

; Modelo de substitução
(define (quad-sum x y)
  (+ (quad x) (quad y)))

; Condicionais
;
; A forma especial cond  ́e utilizada para especificar funções deste tipo :
(define (abs x)
  (cond
    [(>= x 0) x]
    [(< x 0) (- x)]))

; Como as duas condições são mutuamente excludentes, podemos utilizar o else.
(define (abs-2 x)
  (cond
    [(>= x 0) x]
    [else (- x)]))

; A forma geral do cond é:
; (cond
; (<p1> <e1>)
; (<p2> <e2>)
; (<p3> <e3>)
; ...
; [(else <en>)])

; Cada par (<p> <e>) é chamado de cláusula

; A primeira expressão de uma cláusula é chamada de predicado, isto é, uma expressão cujo o valor é interpretado como verdadeiro ou falso
; A segunda expressão de uma cláusula é chamada de consequente.

; A forma especial if pode ser usada quando existem apenas dois casos
; A forma geral do if é : (if <predicado> <consequente> <alternativa>)

; Operadores Lógicos
;
; Os operadores lógicos são fundamentais em qualquer linguagem de programação, incluindo Racket. Eles permitem que você crie condições mais complexas em seu código.
; Aqui estão alguns dos operadores lógicos mais comuns:

; E (AND): Retorna verdadeiro se ambos os valores de entrada forem verdadeiros.

(define (o-and x y)
  (and (> x 0) (> y 0)))

; OU (OR): Retorna verdadeiro se pelo menos um dos valores de entrada for verdadeiro.

(define (o-or x y)
  (or (> x 0) (> y 0)))

; NÃO (NOT): Retorna o oposto do valor analisado.

(define (o-not x)
  (not (> x 0)))

; NÃO-E (NAND): Retorna verdadeiro se pelo menos um dos valores de entrada for falso.

(define (o-nand x y)
  (nand (> x 0) (> y 0)))

; NÃO-OU (NOR): Retorna verdadeiro se ambos os valores de entrada forem falsos.

(define (o-nor x y)
  (nor (> x 0) (> y 0)))

; OU-EXCLUSIVO (XOR): Retorna verdadeiro quando exatamente um dos dois valores de entrada é verdadeiro.

(define (o-xor x y)
  (xor (> x 0) (> y 0)))