#lang racket
(require examples)

;; -------------------------------------------- ;;

; Andrei Roberto da Costa

;; -------------------------------------------- ;;


; ------------------------------------------------------------------------------------------------------------------------- ;

;; Enunciado - Questão 1 

; Uma determinada sala de reunião pode ser usada das 8:00h às 18:00h. Cada interessado em utilizar a sala
; faz uma reserva indicando o intervalo de tempo que gostaria de utilizar a sala. Como parte de um sistema de
; reservas, você deve projetar uma função que verifique se duas reservas podem ser atendidas, ou seja, não têm
; conflito de horário.

; ------------------------------------------------------------------------------------------------------------------------- ;



;; Análise :

; O problema trata da necessidade de projetar uma função que verifique se duas reservas para uma sala de reunião
; podem ser atendidas sem conflito de horário. A função deve ser parte de um sistema de reservas e ser capaz de verificar
; se o horário solicitado por um interessado para utilizar a sala não entra em conflito com o horário já reservado por
; outro interessado, além de verificar se o horário solicitado está entre ás 8:00h e 18:00h.



;; Definição de tipos de dados :

; Horário: um objeto que contém as informações do horário, como hora e minuto, onde hora é um valor numérico de 0 a 23, e minuto um valor numérico de 0 a 60. 
; Reserva: um objeto que contém as informações de uma reserva, como o horário de início e fim da reserva.



;; Especificação :

;      (define (verificar-reserva reserva_1 reserva_2)

; O resultado deverá ser :
; Caso as reservas forem agendadas entre o horário de 8hr e 16hr :
;    - As reservas não possuem conflitos, ou seja, #f.
;    - As reservas possuem conflitos, ou seja, #t.

; Caso as reservas sejam agendadas fora de horário :
;    - Não será possível realizar a reserva.
   


;; Implementação :

; Verificação :
(examples
(check-equal? (verificar-reserva Reserva_1 Reserva_2) #t) ; Resultado esperado: #t (Os horários irão coincidir)
(check-equal? (verificar-reserva Reserva_3 Reserva_4) #f) ; Resultado esperado: #f (Os horários não irão coincidir)
(check-equal? (verificar-reserva Reserva_5 Reserva_6) #f)) ; Resultado esperado: #f (Os horários não irão coincidir)
(define-struct horario (hora minuto))
(define-struct reserva (inicio fim))
(define (cria-reserva inicio fim)
  (if (and (>= (horario-hora inicio) 8) (<= (horario-hora inicio) 16)
           (>= (horario-hora fim) 8) (<= (horario-hora fim) 16))
      (make-reserva inicio fim)
      (error "Não foi possível concluir a reserva! A reserva só pode ser feita entre as 8hr e 16hr")))

(define (verificar-reserva reserva_1 reserva_2)
  (let ((inicio_reserva_1 (reserva-inicio reserva_1))
        (fim_reserva_1 (reserva-fim reserva_1))
        (inicio_reserva_2 (reserva-inicio reserva_2))
        (fim_reserva_2 (reserva-fim reserva_2)))
    (or (and (>= (horario-hora inicio_reserva_1)(horario-hora inicio_reserva_2))
             (<= (horario-hora inicio_reserva_1)(horario-hora fim_reserva_2))
             (<= (horario-minuto inicio_reserva_1)(horario-minuto fim_reserva_2)))
        (and (>= (horario-hora inicio_reserva_2)(horario-hora inicio_reserva_1))
             (<= (horario-hora inicio_reserva_2)(horario-hora fim_reserva_1))
             (<= (horario-minuto inicio_reserva_2)(horario-minuto fim_reserva_1))))))


; Definindo alguns horários de reserva
(define Reserva_1 (cria-reserva (make-horario 8 30) (make-horario 10 0))); Reserva1 : 8:30  --> 10:00
(define Reserva_2 (cria-reserva (make-horario 9 0) (make-horario 11 0))); Reserva2 : 9:00  --> 11:00

(define Reserva_3 (cria-reserva (make-horario 9 30) (make-horario 10 0))); Reserva3 : 9:30  --> 10:00
(define Reserva_4 (cria-reserva (make-horario 10 10) (make-horario 11 0))); Reserva4 : 10:10  --> 11:00

(define Reserva_5 (cria-reserva (make-horario 9 0) (make-horario 10 0))); Reserva5 : 9:00  --> 10:00
(define Reserva_6 (cria-reserva (make-horario 10 1) (make-horario 11 0)));Reserva6 : 10:01 --> 11:00

;; Revisão

; Durante a verificação da implementação, não foi encontrado nenhuma forma de melhoria, seja por simplificação
; ou abstração.

; ------------------------------------------------------------------------------------------------------------------------- ;





; ------------------------------------------------------------------------------------------------------------------------- ;

;; Enunciado - Questão 2 

; Considere um jogo onde o personagem está em um tabuleiro (semelhante a um tabuleiro de jogo de xadrez).
; As linhas e colunas do tabuleiro são enumeradas de 1 a 10, dessa forma, é possível representar a posição (casa)
; do personagem pelo número da linha e da coluna que ele se encontra. O personagem fica virado para uma das
; direções: norte, sul, leste ou oeste. O jogador controla o personagem através de um dos seguintes comandos:
; virar a esquerda e virar a direita, que mudam a direção que o personagem está virado e avançar n casas, que faz
; o personagem avançar até n casas na direção que ele está virado.
; Projete uma função, incluindo os tipos de dados necessários, que receba como entrada o personagem do jogo e
; um comando e gere como saída o novo estado do personagem.
; Por exemplo, ao executar o comando para virar a direita, sendo que o personagem está na posição (1, 5) e virado
; para o norte, a função deve gerar como resultado o personagem na posição (1, 5) virado para o leste.
; Se o comando for para avançar duas casas, sendo que o personagem está na posição (7, 5) virado para o oeste,
; a função deve gerar como resultado o personagem na posição (7, 3) virado para o oeste.

; ------------------------------------------------------------------------------------------------------------------------- ;



;; Análise :

; O enunciado descreve um jogo onde um personagem se move em um tabuleiro retangular de dimensões 10x10.
; O tabuleiro é composto por linhas e colunas numeradas de 1 a 10 e o personagem pode ocupar uma posição no
; tabuleiro representada pela combinação do número da linha e da coluna. Além disso, o personagem pode estar
; virado para uma das quatro direções cardeais: norte, sul, leste ou oeste. O jogador pode controlar o personagem
; com três comandos: virar à esquerda, virar à direita e avançar n casas. O comando de avançar faz o
; personagem se mover n casas na direção que ele está virado.



;; Definição de tipo de dados :

; Um personagem é uma estrutura que contém dois campos: Posicao e Direção .
;   -> O campo posicao é uma estrutura que contém dois campos numéricos, linha e coluna, que representam a posição do personagem no tabuleiro.
;   -> O campo direcao é um símbolo que representa a direção em que o personagem está virado ('norte, 'sul, 'leste ou 'oeste).

; Uma direcao é um símbolo que pode ser 'norte, 'sul, 'leste ou 'oeste.



;; Especificação :

;          (define (atualizar-estado jogador comando))


; O jogador pode controlar o personagem com três comandos: virar à esquerda, virar à direita e avançar n casas.
; O personagem pode estar virado para uma das quatro direções cardeais: norte, sul, leste ou oeste.

; O comando de avançar faz o personagem se mover n casas na direção que ele está virado.
; O programa deve ser capaz de receber como entrada um comando, um número n e o estado atual do jogador, representado pela estrutura jogador, e retornar
; o novo estado do jogador após a execução do comando, onde o novo estado do jogador deve ser representado pela mesma estrutura jogador.

; Para representar um jogador, é necessário utilizar uma estrutura que contenha dois campos :
;  -> Posição
;  -> Direção

; O campo Posição é uma estrutura que contém :
;  -> Dois campos numéricos, linha e coluna, que representam a posição do personagem no tabuleiro.
;  -> O campo Direção é um símbolo que representa a direção em que o personagem está virado.

; Para virar à esquerda ou à direita, é necessário atualizar o campo Direção do jogador.
; Para isso, devem ser definidas duas funções: direcao-anterior e direcao-posterior, que recebem
; como entrada uma direção e retornam a direção anterior e posterior, respectivamente.

; Para avançar n casas, é necessário atualizar o campo Posicao do personagem.
; Para isso, deve ser definida uma função avança, que recebe como entrada a posição e a direção do
; personagem e o número de casas a serem avançadas. A função deve calcular a nova posição do personagem e retorná-la.

; Por fim, deve ser definida a função atualizar-estado, que recebe como entrada o estado atual do personagem, um comando e um número n, e retorna
; o novo estado do personagem após a execução do comando.

; A função deve executar o comando de acordo com as regras do jogo e retornar o novo estado do personagem.
;  -> Se o comando for inválido, a função deve retornar o estado atual do personagem.



;; Implementação :

; Verificação :

(examples
; Exemplo 1: jogador virando à esquerda a partir da posição (1 . 1) e direção "norte"
(check-equal? (jogador-direcao (atualizar-estado (make-jogador 'norte (cons 1 1)) 'virar-esquerda 0)) 'oeste)
(check-equal? (jogador-posicao (atualizar-estado (make-jogador 'norte (cons 1 1)) 'virar-esquerda 0)) (cons 1 1))

; Exemplo 2: jogador virando à direita a partir da posição (5 . 8) e direção "sul"
(check-equal? (jogador-direcao (atualizar-estado (make-jogador 'sul (cons 5 8)) 'virar-direita 0)) 'oeste)
(check-equal? (jogador-posicao (atualizar-estado (make-jogador 'sul (cons 5 8)) 'virar-direita 0)) (cons 5 8))

; Exemplo 3: jogador avançando 3 casas a partir da posição (9 . 5) e direção "leste"
(check-equal? (jogador-direcao (atualizar-estado (make-jogador 'leste (cons 9 5)) 'avançar 3)) 'leste)
(check-equal? (jogador-posicao (atualizar-estado (make-jogador 'leste (cons 9 5)) 'avançar 3)) (cons 9 8))

; Exemplo 4: jogador tentando avançar 7 casas a partir da posição (3 . 2) e direção "oeste" (deve permanecer na mesma posição)
(check-equal? (jogador-direcao (atualizar-estado (make-jogador 'oeste (cons 3 2)) 'avançar 7)) 'oeste)
(check-equal? (jogador-posicao (atualizar-estado (make-jogador 'oeste (cons 3 2)) 'avançar 7)) (cons 3 2)))

(define-struct jogador (direcao posicao))

(define (direcao-anterior direcao)
  (cond ((eq? direcao 'norte) 'oeste)
        ((eq? direcao 'oeste) 'sul)
        ((eq? direcao 'sul) 'leste)
        ((eq? direcao 'leste) 'norte)))

(define (direcao-posterior direcao)
  (cond ((eq? direcao 'norte) 'leste)
        ((eq? direcao 'leste) 'sul)
        ((eq? direcao 'sul) 'oeste)
        ((eq? direcao 'oeste) 'norte)))

(define (avança posicao direcao n)
  (let ([nova-posicao (cond ((eq? direcao 'norte) (cons (- (car posicao) n) (cdr posicao)))
                            ((eq? direcao 'oeste) (cons (car posicao) (- (cdr posicao) n)))
                            ((eq? direcao 'sul) (cons (+ (car posicao) n) (cdr posicao)))
                            ((eq? direcao 'leste) (cons (car posicao) (+ (cdr posicao) n))))])
    (if (and (>= (car nova-posicao) 1) (<= (car nova-posicao) 10)
             (>= (cdr nova-posicao) 1) (<= (cdr nova-posicao) 10))
        nova-posicao
        posicao)))

(define (atualizar-estado jogador comando n)
  (cond ((eq? comando 'virar-esquerda)
         (make-jogador (direcao-anterior (jogador-direcao jogador)) (jogador-posicao jogador)))
        ((eq? comando 'virar-direita)
         (make-jogador (direcao-posterior (jogador-direcao jogador)) (jogador-posicao jogador)))
        ((eq? comando 'avançar)
         (make-jogador (jogador-direcao jogador) (avança (jogador-posicao jogador) (jogador-direcao jogador) n)))
        (else jogador)))

;; Revisão :

; Durante a verificação da implementação, não foi encontrado nenhuma forma de melhoria, seja por simplificação
; ou abstração.

; ------------------------------------------------------------------------------------------------------------------------- ;





; ------------------------------------------------------------------------------------------------------------------------- ;

;; Enunciado -> Questão 3

; Projete uma função que receba como entrada uma lista de números e produza uma lista com os números
; convertidos para string de maneira que todas as strings tenham a mesma quantidade de caracteres (use espaço
; para completar os números se necessário).

; ------------------------------------------------------------------------------------------------------------------------- ;



;; Análise :

; O problema requer o design de uma função que leva uma lista de números e produz uma lista correspondente de strings.
; Cada número na lista de entrada precisa ser convertido em uma string, e todas as strings geradas devem ter o mesmo comprimento,
; com espaços adicionais usados para preencher strings mais curtas.



;; Definição de tipo de dados :

; -> Entrada: uma lista de números inteiros ou de ponto flutuante.
; -> Saída: uma lista de strings com comprimento fixo.

; Logo, o método deverá ser, Lista(Números) -> Lista(String)



;; Especificação :

;      (define (converter-para-string-de-mesmo-tamanho lst))

; A função deve receber como entrada uma lista de números e produzir uma lista com os números convertidos para string de
; maneira que todas as strings tenham a mesma quantidade de caracteres. Caso o número em questão não possua o número de
; caracteres necessário, espaços em branco devem ser adicionados à esquerda da string até que se obtenha a quantidade de caracteres desejada.



;; Implementação :

; Verificação :
(examples
(check-equal? (converter-para-string-de-mesmo-tamanho '(1 22 333 4444)) '("   1" "  22" " 333" "4444"))
(check-equal? (converter-para-string-de-mesmo-tamanho '(1 23 456 890)) '("  1" " 23" "456" "890"))
(check-equal? (converter-para-string-de-mesmo-tamanho '(10 20 30 40)) '("10" "20" "30" "40"))
(check-equal? (converter-para-string-de-mesmo-tamanho '(10 20 300 4000)) '("  10" "  20" " 300" "4000"))
(check-equal? (converter-para-string-de-mesmo-tamanho '(1234 567 89)) '("1234" " 567" "  89"))
(check-equal? (converter-para-string-de-mesmo-tamanho '()) '()))
(define (converter-para-string-de-mesmo-tamanho lst)
  (define (max-list lst)
    (cond ((null? lst) 0)
          (else (max (car lst) (max-list (cdr lst))))))

  (define (num-digitos n)
    (if (< n 10)
        1
        (+ 1 (num-digitos (quotient n 10)))))

  (define (pad-string str len)
    (string-append (make-string (- len (string-length str)) #\space) str))

  (let* ((maximo (max-list lst))
         (tam-max (num-digitos maximo)))

   (define (converter-para-string-aux lst)
      (cond ((null? lst) '())
            (else (let* ((s (number->string (car lst)))
                         (n (num-digitos (car lst))))
                    (cons (pad-string s tam-max)
                          (converter-para-string-aux (cdr lst)))))))(converter-para-string-aux lst)))

;; Revisão :

; Durante a verificação da implementação, não foi encontrado nenhuma forma de melhoria, seja por simplificação
; ou abstração.

; ------------------------------------------------------------------------------------------------------------------------- ;





; ------------------------------------------------------------------------------------------------------------------------- ;

;; Enunciado -> Questão 4

; Uma string é palíndromo se as letras da string na ordem normal ou de trás para frente são as mesmas (ignorando
; diferenças entre minúsculas e maiúsculas e sinais diacríticos). Projete uma função que verifique se uma string
; sem os caracteres de pontuação é palíndromo. Assuma que a string seja composta apenas de letras do alfabeto
; (modificadas ou não com sinais diacríticos), números e símbolos usados na Língua Portuguesa. Você pode usar
; a função (string-split s "") para gerar uma lista com os elementos da string s e processar esses elementos,
; dessa forma você não precisa trabalhar com caracteres (que não vimos em sala), apenas com strings.

; ------------------------------------------------------------------------------------------------------------------------- ;



;; Análise :

; A função deve receber uma string como entrada e retornar um valor booleano indicando se a string é um palíndromo ou não. Para isso, a função
; deve seguir os seguintes passos:

; -> Remover todos os caracteres de pontuação da string.
; -> Converter a string para minúsculas.
; -> Verificar se a string é um palíndromo.

; Para realizar a verificação de palíndromo, a função deve comparar as letras da string na ordem normal e de trás para frente, ignorando diferenças entre minúsculas e
; maiúsculas e sinais diacríticos.



;; Definição de tipo de dados :

; -> Entrada: uma string
; -> Saída: um valor booleano

; Portanto, o método é do tipo String -> Booleano



;; Especificação :

;         (define (e-palindromo str))

; A função recebe uma string str como entrada e retorna um valor booleano indicando se a string, sem os caracteres de pontuação, é um palíndromo.

; Para remover os caracteres de pontuação, uma função auxiliar 'remover-pontuacao' é utilizada, que recebe a string str como entrada e retorna uma
; nova string sem os caracteres de pontuação. A comparação entre a string original e a string invertida e sem caracteres de pontuação é feita
; ignorando as diferenças entre letras maiúsculas e minúsculas e sinais diacríticos.
; Caso as duas strings sejam iguais, a função retorna #t, caso contrário, retorna #f.




;; Implementação :

; Verificação :
(examples
(check-equal? (e-palindromo "A man a plan a canal Panama") #t)
(check-equal? (e-palindromo "Amor, Roma") #t)
(check-equal? (e-palindromo "2 2") #t)
(check-equal? (e-palindromo "race a car") #f))
(define (remover-pontuacao str)
  (cond [(string=? str "") ""]
        [(char-alphabetic? (string-ref str 0))
         (string-append (string (string-ref str 0))
                        (remover-pontuacao (substring str 1 (string-length str))))]
        [else (remover-pontuacao (substring str 1 (string-length str)))]))


(define (e-palindromo str)
  (let ((str-sem-pontuacao (remover-pontuacao str)))
    (equal? (string-downcase str-sem-pontuacao)
            (string-downcase (list->string (reverse (string->list str-sem-pontuacao)))))))


;; Revisão

; Durante a verificação da implementação, não foi encontrado nenhuma forma de melhoria, seja por simplificação
; ou abstração.

; ------------------------------------------------------------------------------------------------------------------------- ;





; ------------------------------------------------------------------------------------------------------------------------- ;

;; Enunciado - Questão 5 

; O mesmo que o exercício 3, mas usando acumuladores nas situações adequadas.

; ------------------------------------------------------------------------------------------------------------------------- ;



;; Análise :

; O problema requer o design de uma função que leva uma lista de números e produz uma lista correspondente de strings.
; Cada número na lista de entrada precisa ser convertido em uma string, e todas as strings geradas devem ter o mesmo comprimento,
; com espaços adicionais usados para preencher strings mais curtas.



;; Definição de tipo de dados :

; -> Entrada: uma lista de números inteiros ou de ponto flutuante.
; -> Saída: uma lista de strings com comprimento fixo.

; Logo, o método deverá ser, Lista(Números) -> Lista(String)



;; Especificação :

;       (define (converter-para-string-de-mesmo-tamanho lst))

; A função deve receber como entrada uma lista de números e produzir uma lista com os números convertidos para string de
; maneira que todas as strings tenham a mesma quantidade de caracteres. Caso o número em questão não possua o número de
; caracteres necessário, espaços em branco devem ser adicionados à esquerda da string até que se obtenha a quantidade de caracteres desejada.



;; Implementação :

; Verificação :
(examples
(check-equal? (converter-para-string-de-mesmo-tamanho-questao5 '(1 22 333 4444)) '("   1" "  22" " 333" "4444"))
(check-equal? (converter-para-string-de-mesmo-tamanho-questao5 '(1 23 456 890)) '("  1" " 23" "456" "890"))
(check-equal? (converter-para-string-de-mesmo-tamanho-questao5 '(10 20 30 40)) '("10" "20" "30" "40"))
(check-equal? (converter-para-string-de-mesmo-tamanho-questao5 '(10 20 300 4000)) '("  10" "  20" " 300" "4000"))
(check-equal? (converter-para-string-de-mesmo-tamanho-questao5 '(1234 567 89)) '("1234" " 567" "  89"))
(check-equal? (converter-para-string-de-mesmo-tamanho-questao5 '()) '()))
(define (converter-para-string-de-mesmo-tamanho-questao5 lst)

  ;;  Recebe como entrada a lista lst e o valor atual do maior número da lista max. A função percorre a lista e retorna o maior número encontrado.
  (define (max-list lst max)
    (if (null? lst)
        max
        (if (> (car lst) max)
            (max-list (cdr lst) (car lst))
            (max-list (cdr lst) max))))

  ;; Recebe como entrada um número inteiro n e retorna o número de dígitos desse número. A função utiliza um acumulador digits para contar o número de dígitos do número n.
  (define (num-digits n)
    (let loop ((n n) (digits 1))
      (if (< n 10)
          digits
          (loop (quotient n 10) (+ digits 1)))))

  (let ((maximo (max-list lst 0))
        (tam-max (num-digits (max-list lst 0))))
    (let loop ((lst lst) (acc '()))
      (if (null? lst)
          (reverse acc)
          (let* ((x (car lst))
                 (s (number->string x))
                 (n (string-length s))
                 (espacos (- tam-max n)))
            (loop (cdr lst)
                  (cons (string-append (make-string espacos #\space) s) acc)))))))

;; Revisão

; Durante a verificação da implementação, não foi encontrado nenhuma forma de melhoria, seja por simplificação
; ou abstração.

; ------------------------------------------------------------------------------------------------------------------------- ;




; ------------------------------------------------------------------------------------------------------------------------- ;

;; Enunciado -> Questão 6

; O mesmo que o exercício 4, mas usando funções as funções foldl, map e filter (pelo menos uma vez cada) e
; sem usar recursão.

; ------------------------------------------------------------------------------------------------------------------------- ;



;; Análise :

; A função deve receber uma string como entrada e retornar um valor booleano indicando se a string é um palíndromo ou não. Para isso, a função
; deve seguir os seguintes passos:

; -> Remover todos os caracteres de pontuação da string.
; -> Converter a string para minúsculas.
; -> Inverte a ordem dos caracteres.
; -> Verificar se a string resultante(Invertida) é igual a string original, verificando assim, se a string é palíndroma.

; Para realizar a verificação de palíndromo, a função deve comparar as letras da string na ordem normal e de trás para frente, ignorando diferenças entre minúsculas e
; maiúsculas e sinais diacríticos.



;; Definição de tipo de dados :

; -> Entrada: uma string
; -> Saída: um valor booleano

; Portanto, o método é do tipo String -> Booleano



;; Especificação :

;         (define (e-palindromo-questao6 str))

; A função recebe uma string str como entrada e retorna um valor booleano indicando se a string, sem os caracteres de pontuação, é um palíndromo.

; Para remover os caracteres de pontuação, uma função auxiliar 'remover-pontuacao-q6' é utilizada, que recebe a string str como entrada e retorna uma
; nova string sem os caracteres de pontuação. A comparação entre a string original e a string invertida e sem caracteres de pontuação é feita
; ignorando as diferenças entre letras maiúsculas e minúsculas e sinais diacríticos.
; Caso as duas strings sejam iguais, a função retorna #t, caso contrário, retorna #f.



;; Implementação :

; Verificação :
(examples
(check-equal? (e-palindromo-questao6 "A man a plan a canal Panama") #t)
(check-equal? (e-palindromo-questao6 "Amor, Roma") #t)
(check-equal? (e-palindromo-questao6 "2 2") #t)
(check-equal? (e-palindromo-questao6 "race a car") #f))
(define (remover-pontuacao-q6 str)
  (string-join
   (map (lambda (c) (string c))
        (filter char-alphabetic?
                (string->list (string-trim str)))) ""))

(define (e-palindromo-questao6 str)
  (let* ((str-sem-pontuacao (remover-pontuacao-q6 str))
         (str-reverso (string->list str-sem-pontuacao)))
    (equal? (string-downcase str-sem-pontuacao)
            (string-downcase (list->string (reverse str-reverso))))))

;; Revisão :

; Durante a verificação da implementação, não foi encontrado um jeito de utilizar também
; a função de alta ordem : 'foldl'. Porém a função ainda conta com a utilização das
; funções de alta ordem : 'map' e 'filter', além de não utilizar recursão durante sua implementação.

