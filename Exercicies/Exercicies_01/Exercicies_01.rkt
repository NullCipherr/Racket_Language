#lang racket

; Exercicio 6 : Defina uma função que encontre o maior valor entre 2 valores dados.
;
(define (encontraMaior a b) (if(> a b) a b))

; Exercicio 7 : Defina uma função que receba 3 números como parâmetros e retorne a soma dos quadrados dos dois maiores números.
;
(define (quadradoNum a) (* a a))
(define (somaQuadrados a b)(+ (quadradoNum a)(quadradoNum b))) 
(define (somaMaiores a b c)(+ (quadradoNum (encontraMaior a b))(quadradoNum (encontraMaior a c))))

; Exercicio 8 : Defina uma função e calcule a distância de um ponto no plano cartesiano (representado por dois números) a origem.
;
(define (distancia-ponto-origem x y)
  (sqrt (+ (quadradoNum x) (quadradoNum y))))

; Exercicio 9 : Defina uma função que receba como parâmetro 3 números que representam os lados de um triângulo e classifique o triângulo como equilátero, isósceles ou escaleno.
;
; Propriedades dos lados do triângulo
; Equilatero : Todos os lados possuem o mesmo comprimento.
; Isoceles : Possui dois lados com o mesmo comprimento.
; Escaleno : Todos os três lados possuem comprimentos diferentes.
;
(define (verificaEquilatero a b c)
  (and(= a b)(= b c)))

(define (verificaIsosceles a b c)
  (if(and (= a b)(= b c) (= a c))false (or (= a b)(= b c)(= a c))))

(define (verificaEscaleno a b c)
  (and (not (= a b)) (not (= b c))))

(define (classificadorT l1 l2 l3)
  (if(verificaEquilatero l1 l2 l3) "O triangulo é equilatero" (if(verificaIsosceles l1 l2 l3) "O triangulo é isoceles" (if(verificaEscaleno l1 l2 l3) "O triangulo é escaleno" "Erro!!"))))

; Exercicio 10 : Defina uma função que classifique o grau de obesidade de uma pessoa usando o IMC.
;
; O Índice de Massa Corporal (IMC) é uma medida comum para avaliar o peso corporal de uma pessoa em relação à sua altura.
; IMC = peso / altura^2
;
(define (calculaIMC peso altura)
  (/ peso (quadradoNum altura)))

(define (classifica-obesidade peso altura)
  (define imc (calculaIMC peso altura))

  (cond
    [(<= imc 18.5) "Abaixo do peso"]
    [(<= imc 24.9) "Peso normal"]
    [(<= imc 29.9) "Sobrepeso"]
    [(<= imc 34.9) "Obesidade grau 1"]
    [(<= imc 39.9) "Obesidade grau 2"]
    [else "Obesidade grau 3"]))