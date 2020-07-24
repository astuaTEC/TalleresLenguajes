#lang racket

;------------------------------------------------------------------------------------------------

;; Instituto Tecnologico de Costa Rica
;; Lenguajes, IS2020, Grupo 01
;; Taller Funcional de Racket
;; Estudiante: Saymon Astua Madrigal
;; Carne: 2018143188


;--------------------------------------------EJERCICIO 1-------------------------------------------

;; Ejercicio #1: Funcion factorial
;; Calcula el factrial de num
;; num: numero entero, num >= 0

(define(fact num)
  (cond((zero? num)
        1)
       (else
        (* num (- num 1)))))

;-----------------------------EJERCICIO 2---------------------------------------------------

;; Ejercicio 2: Funcion fibonacci
;; La funcion de Fibonacci
;; num entero positivo
;; num >= 0

(define (fib num)
  (cond((equal? num 0)
        1)
       ((equal? num 1)
        1)
       (else
        (+ (fib (- num 1))
           (fib (- num 2))))))

;--------------------------------EJERCICIO 3---------------------------------------------------

;; Ejercicio 3: Funcion miembro
;; Funcion para encontar si un elemento se encuentra
;; en una lista
;; ele: símbolo cualquiera
;; lista: una lista lineal

(define (miembro? ele lista)
  (cond( (null? lista)
         #f)
       ( (equal? ele (car lista))
         #t)
       (else
        (miembro? ele (cdr lista)))))

;---------------------------------------EJERCICIO 4------------------------------------------------------

;; Ejercicio 4: Eliminar
;; Se eliminan todas las apariciones
;; de ele en una lista
;; ele: un simbolo
;; lista: una lista lineal

(define (eliminar ele lista)
  (cond ((null? lista)
         '())
        ((equal? ele (car lista))
         (eliminar ele (cdr lista)))
        (else
         (cons (car lista)
               (eliminar ele (cdr lista))))))

;-----------------------------------------EJERCICIO 5---------------------------------------------------

;; Ejercicio 5: Quick Sort
;; Realiza un Quick-Sort
;; de una lista de números
;; lista: lista lineal de números

(define (quickSort lista)
  (cond ((null? lista)
          '())
        (else
          (append (quickSort (menores (car lista) (cdr lista)))
                  (list (car lista))
                  (quickSort (mayores (car lista) (cdr lista)))))))


;; Funcion para buscar los numeros mayores
;; con respecto a un numero dentro de una lista
;; num: un numero entero
;; lista: lista lineal

(define (mayores pivote lista)
  (cond ((null? lista)
          '())
        ((<= pivote (car lista))
          (cons (car lista) (mayores pivote (cdr lista))))
        (else
          (mayores pivote (cdr lista)))))


;; Funcion para buscar los numeros menores
;; con respecto a un numero dentro de una lista
;; num: un numero entero
;; lista: lista lineal

(define (menores pivote lista)
  (cond ((null? lista)
          '())
        ((> pivote (car lista))
          (cons (car lista) (menores pivote (cdr lista))))
        (else
          (menores pivote (cdr lista)))))

;--------------------------------------------EJERCICIO 6-------------------------------------------------------------

;;Ejercicio 6: Automoviles


;; Funcion para encontrar el largo de una lista
;; lista: lista de elementos

(provide largo)
(define (largo lista)
  (cond ((null? lista)
         0)
        (else
         (+ 1 (largo (cdr lista))))))


;;Funcion para retornar pares atributo-valor de un automovil
;; lista1: lista con los valores del automovil
;; lista2: lista con los atributos del automovil

(define (automovil lista1 lista2)
  (cond ( (equal? (largo lista1) (largo lista2))
          (automovil-aux lista1 lista2 '()))
        (else
         (display "Revise que las listas sean del mismo tamano"))))

(define (automovil-aux lista1 lista2 resultado)
  (cond ((null? lista1)
         (invertir resultado))
        (else
         (automovil-aux (cdr lista1) (cdr lista2) (append (list (list (car lista2) (car lista1))) resultado)))))

;---------------------------------------------EJERCICIO 7------------------------------------------------------------

;;Ejercicio 7: Eliminar elemento de un arbol binario

;; Construye un árbol binario de tres elementos
;; centro: un nodo
;; izq: un arbol binario
;; der: un arbol binario

(define (arbol centro izq der)
  (cond((and (null? izq)
             (null? der))
        centro)
       (else
        (list centro izq der))))

;; Funcion auxiliar para detectar
;; un arbol que no es representado por una lista
;; x: un simbolo cualquiera

(define (atom? x)
  (not (list? x)))

;; Devuelve la raiz de un arbol
;; si es un atomo, el arbol es la raiz
;; arb: un arbol binario

(define (raiz arb)
  (cond((atom? arb)
        arb)
       (else
        (car arb))))

;; Devuelve el hijo izquierdo de un arbol
;; sie le arbol es un atomo, sus hijos son nulos
;; arb: un arbol binario

(define (hijo-izq arb)
  (cond ((atom? arb)
         '())
        (else
         (cadr arb))))

;; Devuelve el hijo derecho de un arbol
;; sie le arbol es un atomo, sus hijos son nulos
;; arb: un arbol binario

(define (hijo-der arb)
  (cond ((atom? arb)
         '())
        (else
         (caddr arb))))

;; Determina si un nodo corresponde o no a una hoja
;; nodo: un nodo de un arbol

(define (hoja? nodo)
  (cond ((null? nodo)
         #t)
        ((atom? nodo)
         #t)
        ( (and (null? (hijo-izq nodo))
               (null? (hijo-der nodo)))
          #t)
        (else
         #f)))

;; Saca el elemento mayor de un arbol
;; arbol: arbol binario ardenado

(define (mayor arbol)
  (cond ((null? arbol)
         #f)
        ((null? (hijo-der arbol))
         (raiz arbol))
        (else
         (mayor (hijo-der arbol)))))

;; Funcion que elimina un elemento dentro de un arbol ordenado
;; ele: simbolo
;; arb: arbol binario ordenado

(define (eliminar-arb ele arb)
  (cond ((null? arb)
         '())
        ;; Aqui se empieza a buscar el elemento a eliminar
        ((< ele (raiz arb))
         (arbol (raiz arb)
                (eliminar-arb ele (hijo-izq arb))
                (hijo-der arb)))
        ((> ele (raiz arb))
         (arbol (raiz arb)
                (hijo-izq arb)
                (eliminar-arb ele (hijo-der arb))))

        ;; si el nodo no tiene hijos
        ( (and (null? (hijo-izq arb))
               (null? (hijo-der arb)))
          '())

        ;; si el nodo no tiene hijo izquierdo
        ( (null? (hijo-izq arb))
          (hijo-der arb))

        ;; si el nodo no tiene hijo derecho

        ((null? (hijo-der arb))
         (hijo-izq arb))

        ;; Si el nodo tiene dos hijos
        (else
         (arbol (mayor (hijo-izq arb))
                (eliminar-arb (mayor (hijo-izq arb))
                          (hijo-izq arb))
                (hijo-der arb)))))

;---------------------------------------EJERCICIO 8--------------------------------------------------

;; Ejercicio 8: Programar la función encontrar las rutas anchura primero


;; se representa un grafo
;; con el nombre "grafo"

(define grafo '( (i (a b))
                 (a (i c d))
                 (b (i c d))
                 (c (a b x))
                 (d (a b f))
                 (x (c))
                 (f (d))
                 ))

;; Funcion para encontrar los vecinos inmediatos
;; de algun elemento en el grafo
;; ele: es un elemento del grafo
;; grafo: el grafo en donde se trabaja

(define (vecinos ele grafo)
  (cond ( (null? grafo)
          #f)
        ((equal? ele (caar grafo))
         (cadar grafo))
        (else
         (vecinos ele (cdr grafo)))))


;; Funcion para crear nuevas rutas
;; Si no puede crear nuevas rutas devuelve #f
;; ruta: la ruta a extender
;; el grafo a recorrer

(define (extender ruta grafo)
  (cond ( (null? grafo)
          #f)
        ((equal? (car ruta)
                 (caar grafo))
         (ruta-aux ruta (vecinos (car ruta) grafo) '()))
        (else
         (extender ruta (cdr grafo)))))
          


(define (ruta-aux ruta vecino-final total-rutas)
  (cond ((null? vecino-final)
         total-rutas)
        ((not (miembro? (car vecino-final) ruta))
         (ruta-aux ruta (cdr vecino-final) (cons (cons (car vecino-final) ruta) total-rutas)))
        (else
         (ruta-aux ruta (cdr vecino-final) total-rutas))))



;;Funcion para verificar si un elemento es solucion de una ruta
;; verifica si se ha llegado al destino
;; fin: un elemento a comparar
;; ruta: la ruta con la que se compara

(define (solucion? fin ruta)
  (equal? fin (car ruta)))

;; Funcion para invertir una lista
;; lista: lista lineal

(define (invertir lista)
  (cond ((null? lista)
         '())
        (else
         (append (invertir (cdr lista))
                 (list (car lista))))))

;; Funcion que encuentra todas las rutas para un inicio
;; y un fin en un grafo, mediante anchura primero
;; ini: inicio de la ruta
;; fin: fin de la ruta

(define (anchura-primero ini fin grafo)
  (anchura-primero-aux (list(list ini)) fin grafo '()))

(define (anchura-primero-aux rutas fin grafo total)
  (cond ((null? rutas)
         total)
        ((solucion? fin (car rutas))
         (anchura-primero-aux (cdr rutas)
                              fin
                              grafo
                              (cons (invertir (car rutas)) total)))
        (else
         (anchura-primero-aux (append
                               (cdr rutas)
                               (invertir (extender (car rutas) grafo)))
                              fin
                              grafo
                              total))))