/*Código Fuente: TallerProlog.pl
Desarrolado por: Saymon Astúa
Taller #2 - Lenguajes
IS 2020 - Grupo 01

Descripción: Taller del paradigma lógico desarrolado en Prolog
Instituto Tecnológico de Costa Rica | CE3104 - Lenguajes, Compiladores e Interpretes
*/


% ----------------------------------------------------------------
% Ejercicio 2.1
% Defina los hechos para la siguiente figura.

progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, patricia).
progenitor(jose, ana).
progenitor(patricia, jaime).

% -------------------------------------------------------------------

% Ejercicio 2.2.1
% Como preguntamos quienes son los abuelos de Jaime???

%?- progenitor(Y, X), progenitor(X, jaime). %esta seria la pregunta en consola

% -------------------------------------------------------------

% Ejercicio 2.2.2
% Como preguntamos quienes son los bisabuelos de Jaime???.

%?- progenitor(Z,Y), progenitor(Y, X), progenitor(X, jaime). %esta seria la pregunta en consola

% -------------------------------------------------------------

% Ejercicio 2.3

valioso(oro).
mujer(ana).
tiene(juan, oro).  % El primer argumento es la persona, el segundo argumento es el objeto que posee
es_padre(juan, maria). % El  argumento es quien es el padre, el segundo es el/la hij@

% El primer argumento es la persona que presta, el segundo es el objeto prestado
% Y el tercero es a quien se presta ese objeto
presta(juan, libro, maria). 
presta(juan, lapiz, pedro). 
presta(pedro, borrador, juan).

% ------------------------------------------------------------

% Ejercicio 2.4

varon(albert).
varon(edward).

mujer(alice).
mujer(victoria).

% El primer argumento es el padre
% El segundo argumento es la madre
% El tercer argumento es el/la hij@
padres(edward, victoria, albert).
padres(alice, victoria, albert).

% Regla para saber si X es hermana de Y. Donde X y Y son variables cualesquiera
hermana_de(X,Y) :- X\=Y, mujer(X), padres(X,M,P), padres(Y,M,P).


/*---------------------------------------------------------------------------------*/

%Ejercicio 2.5. Función miembro

/*Ejemplos: 
miembro(b, [a, b, c]).
miembro(b, [a, [b, c]]).
miembro([b, c], [a, [b, c]]).
*/

% Elemento: El elemento que quiero buscar en la lista
% El segundo elemento es la lista en la que deseo realizar la búsqueda

miembro(Elemento, [Elemento|_]) :- !.
miembro(Elemento, [_|Cola]) :- miembro(Elemento, Cola).

/*---------------------------------------------------------------------------------*/

% Ejercicio 2.6. Función inversa

/*Ejemplos:
inversa([c, b, a], [a, b, c]).
inversa(Invertida, [a, b, c]).
*/

% Función para saber si Lista1 es la inversa de Lista2
% pero también para saber quién es la inversa de Lista2.
% El primer parámetro es la lista invertida para comparar con la otra lista. O es la variable
% a utilizar para saber quién es la inversa de Lista2
% El segundo parámetro es la lista a trabajar (verificar si es la inversa de Lista1 
% o retornar la inversa de esta)
% C: Cabeza
% L: Cola
% Rellenar: es una lista auxiliar

inversa([], Lista, Lista). %Condición de comparación mínima (parada) 
inversa(Lista1, Lista2)             :- inversa(Lista1, [], Lista2).
inversa([C|L], Rellenar, Invertida) :- inversa(L, [C|Rellenar], Invertida).


/*----------------------------------------------------------------------------------------*/

% Ejercicio 2.7. Longitud de una lista

/*Ejemplos:
longitud([a, b, c, d, e], 5).
longitud([a, b, c, d, e], Largo).
*/

% Función para determinar el largo de una lista o para verificar si la lista coincide con un largo indicado
% El primer parámetro es la lista a trabajar
% El segundo parámetro es un número para ver si coincide el largo de la lista con ese número
% o es una variable para saber cuál es el largo de la lista que ingresó

longitud([], 0). %Condición base
longitud([_|Cola], Contador) :- longitud(Cola, Contador2), Contador is Contador2 + 1.


/*-----------------------------------------------------------------------------------------*/

% Ejercicio 2.8

%el primer elemento es el año, el segundo es el acontecimiento en sí
acontecimiento(2010, 'Mundial de Sudafrica').
acontecimiento(2014, 'Mundial de Brasil').
acontecimiento(2017, 'graduacion del colegio').
acontecimiento(2018, 'Mundial de Rusia').
acontecimiento(2020, 'coronavirus').


pregunta :- display('Digita el anio del suceso que quieres saber '), nl,  
            read(X), acontecimiento(X, Y),
            write('En el '), write(X), write(' sucedio el/la: '), 
            write(Y), nl,
            pregunta.
