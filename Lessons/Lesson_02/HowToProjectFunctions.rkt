#lang racket

(require rackunit)
(require rackunit/text-ui)

; Como projetar funções

; Assinatura, propósito e cabeçalho: A assinatura de uma função descreve os tipos de entrada e saída da função. O propósito é uma descrição concisa
; do que a função faz. O cabeçalho da função inclui o nome da função e os parâmetros.

; Exemplos: Antes de começar a escrever o código, é útil pensar em alguns exemplos de como a função deve funcionar. Isso pode ajudar a esclarecer o
; comportamento esperado da função.

; Template: O template de uma função é uma estrutura básica que mostra como a função será organizada. Isso pode incluir onde as condições e os cálculos serão colocados.

; Código do corpo da função: Aqui é onde você escreve o código real que define o comportamento da função. Isso deve ser feito com base na assinatura,
; no propósito, no cabeçalho e no template1.

; Teste e depuração: Depois de escrever a função, você deve testá-la para garantir que ela funcione como esperado. Isso pode envolver a execução da
; função com diferentes entradas e a verificação se a saída é a esperada. Se a função não estiver funcionando corretamente, você precisará depurar o
; código para encontrar e corrigir o problema.

; EXEMPLO

; Assinatura, propósito e cabeçalho
(define (fatorial n)
  ; Exemplos
  ; (fatorial 5) deve retornar 120
  ; (fatorial 3) deve retornar 6
  ; (fatorial 0) deve retornar 1

  ; Template
  (cond [(zero? n) 1] ; caso base
        [else (* n (fatorial (- n 1)))])) ; caso recursivo

; Código do corpo da função
(displayln (fatorial 5)) ; Isso irá exibir 120
(displayln (fatorial 3)) ; Isso irá exibir 6
(displayln (fatorial 0)) ; Isso irá exibir 1

; Teste e depuração
; Você pode testar a função com diferentes entradas para garantir que ela esteja funcionando corretamente.

; 1) Defina uma função que calcule o dobro de uma dado valor.

; ---------------------------------------------------------------
; Passo 1 : Assinatura e propósito
; Passo 2 : Exemplos

;; Número -> Número
;; Produz o dobro de n.
(define dobro-tests
(test-suite
"dobro tests"
(check-equal? (dobro 0) 0)
(check-equal? (dobro 4) 8)
(check-equal? (dobro -2) -4)))

(define (dobro n)
(* 2 n))

;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (executa-testes . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))

;; Chama a função para executar os testes.
(executa-testes dobro-tests)

; ---------------------------------------------------------------

; Passo 1 : Assinatura e propósito
; Passo 2 : Exemplos

(define maior-tests
  (test-suite
   "maior tests"
   (check-equal? (maior "Um" "1") "Um")
   (check-equal? (maior "Um" "Dois") "Dois")
   (check-equal? (maior "Um" "Tres") "Tres")))

(define (maior str1 str2)
  (if (> (string-length str1) (string-length str2)) str1 str2))

(executa-testes maior-tests)