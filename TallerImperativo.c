/*
 * Taller 3 - Paradigma imperativo
 * Lenguajes - IS 2020
 *
 * Saymon Astua Madrigal - 2018143188
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int Strcomp(char *str1, char *str2);
void Strcat(char *dest, const char *src);
void kmAmilla();
void centigradosAFarenheit();
int digitosNum(int);
int digitosNumAux(int num, int cont);
int digitosParNum(int);
int digitosParNumAux(int num, int cont);
void leerArchivo(char *path);
int esPalabra(char *palabra);
char *quitarSaltoDeLinea(char *str);
void actualizarLista(const char *palabra, int numeroLinea);
void mostrarEnConsola();
void ordenarPorAparicion();

int main(){
    //kmAmilla(); //ejercicio 2.1
    //centigradosAFarenheit(); // ejercicio 2.2
    //digitosNum(654321); //ejercicio 2.3
    //digitosParNum(27002); //ejercicio 2.4

    //Ejercicio 2.5, 2.6 y 2.7
    /*char palabra[100] = "hola";

    Strcat(palabra, "adios");
    //printf("Este es la comparacion: %i:", Strcomp("hola", "hi"));
    printf("cadena: %s", palabra);*/

    mostarEnConsola(); // este es el ejercicio 2.8 y 2.9

    return 0;
}

//--------------------------------EJERCICIO 2.1--------------------------------------

/*
 * Funcion que hace la conversion de kilometros a millas
 * en un rango de kilometros de [1, 10]
 */
void kmAmilla(){
    float y;
    for (int i=1; i<=10; i++){
        y = i/1.609;
        printf("Km: %i, Milla: %.2f\n", i, y);
    }
}
//---------------------------EJERCICIO 2.2-----------------------------------------
/*
 * Funcion que realiza la conversion de grados celcius
 * a grados Farenheit
 * El usuario ingresa en consola los grados celcius a convertir
 */
void centigradosAFarenheit(){
    float x, y;
    printf("Digite los grados centigrados:");
    scanf("%f", &x);
    y = x*9/5 + 32;
    printf("Los grados Farenheit son: %.2f", y);

}
//-------------------------------EJERCICIO 2.3-----------------------------------------

/*
 * Funcion que retorna la cantidad de digitos
 * que tenga un numero
 * num: numero entero positivo
 * Salida: retorna la cantidad de digitos del numero en un entero
 */
int digitosNum(int num){
    digitosNumAux(num/10, 1);
}

/*
 * Funcion auxiliar para contar los digitos
 * de un numero de manera recursiva
 * num: numero entero positivo
 * cont: un contador para la cantidad de digitos, es un entero
 * Salida: retorna la cantidad de digitos del numero en un entero
 */
int digitosNumAux(int num, int cont){
    if (num<=0){
        printf("Los digitos son: %i", cont);
        return cont;
    }
    else{
        cont++;
        digitosNumAux(num/10, cont);
    }
}

//--------------------------------------EJERCICIO 2.4----------------------------------------

/*
 * Funcion que retorna la cantidad de digitos pares
 * que tenga un numero. PD: el cero se considera par
 * num: numero entero positivo
 * Salida: retorna la cantidad de digitos pares del numero en un entero
 */
int digitosParNum(int num){
    digitosParNumAux(num/10, 1);
}

/*
 * Funcion auxiliar para contar los digitos pares
 * de un numero de manera recursiva
 * num: numero entero positivo
 * cont: un contador para la cantidad de digitos, es un entero
 * Salida: retorna la cantidad de digitos pares del numero en un entero
 */
int digitosParNumAux(int num, int cont){
    if (num<=0){
        printf("Los digitos pares son: %i", cont);
        return cont;
    }
    if ((num%10)%2 ==0){
        cont++;
    }
    digitosParNumAux(num/10, cont);

}
//----------------------EJERCICIO 2.5 Y 2.6---------------------------------------------

/*
 * Función strcomp
 * *str1, *str2: puntero a una cadena de caracteres
 * devuelve:
 * < 0 : si str1 < str2
 * 0 : si str1 == str2
 * > 0 : si str1 > str2
 */
int Strcomp(char *str1, char *str2){

    while(1){
        if(*str1 != *str2){
            return *str1 - *str2;
        }
        if(*str1 == '\0'){
            return 0;
        }
        str1++;
        str2++;
    }
}
//---------------------------------EJERCICIO 2.7---------------------------------

/*
 * Funcion strcat
 * @param dest: puntero a la cadena de caracteres a la cual hay que pegarle otra
 * @param srt: puntero a una cadena de caracteres que hay que pegar
 */
void Strcat(char *dest, const char *src){

    int i = 0;
    //con este while se saca el tamanio de dest
    while (dest[i] != '\0'){
        i++;
    }
    int j = 0;
    //con este while se saca el tamanio de src
    // al mismo tiempo copia los caracteres de src al final de dest
    while (src[j] != '\0'){
        dest[i + j] = src[j];
        j++;
    }
    dest[i+j] = '\0'; //se le agrega el final a la cadena ya concatenada
}

//------------------------  -----------EJERCICIO 2.8 Y 2.9------------------------------------------

/*
 * Estructura que representa a las palabras
 * que hay en un texto
 * palabra: la cadena de caracteres en si, tamanio maximo de 50 char
 * lineasDeAparicion: es una lista de enteros en donde se guardan la lineas en que aparece la palabra
 * apariciones: es un entero, para saber cuantas veces aparecio la palabra en el archivo
 */
typedef struct{
    char palabra[50];
    int lineasDeAparicion[50];
    int apariciones;

}palabras;

palabras plb[200]; //se inicializa la estructura para guardar 200 palabras como maximo

// Esto sirve para verificar cuantas palabras se van encontrando en el archivo
int numeroDePalabras = 0; // inicialmente no hay palabras leidas, por eso se inicializa en 0

/*
 * Funcion que manda a leer un archivo txt y muestra en consola
 * las palabras encontradas y una lista con los numeros de lines
 * en donde aparece cada una
 */
void mostrarEnConsola(){
    leerArchivo("..\\texto.txt");
    ordenarPorAparicion();

    int i;

    for(i = 0; i<numeroDePalabras; i++){
        palabras palabra = plb[i]; // se accede a las disttintas palabras en la estructura
        int numLinea = palabra.lineasDeAparicion[0];
        printf( "Palabra: %s --> Lista apariciones: [%d", palabra.palabra, numLinea);

        int j = 1;
        numLinea = palabra.lineasDeAparicion[j];
        while(numLinea != 0){ // se revisa si existen mas numeros de linea donde aparece esa palabra
            printf(", %i", numLinea);
            j++;
            numLinea = palabra.lineasDeAparicion[j]; // se accede al siguiente elemento
        }
        printf("] --> apariciones: %i\n", palabra.apariciones);
    }
    free(plb); // se libera memoria
}

/*
 * Funcion que lee un archivo ".txt", lo divide por palabras
 * y llama a otra funcion para que guarde cada una de las
 * palabras en una struct
 * @param path: una cadena de caracteres con la direccion del archivo a leer
 */
void leerArchivo(char *path){
    FILE *archivo = fopen(path, "r");

    if (archivo==NULL){
        printf("No se pudo abrir el archivo");
        exit(1);
    }

    char linea[256]; // cada linea esta limitada a un maximo de 250 char
    int contadorLinea = 1; // sirve para validar cual linea se esta leyendo

    while (fgets(linea, sizeof(linea), archivo)){ // mientras que este leyendo una linea
        char *palabra;
        for(palabra = strtok(linea, " "); palabra; palabra = strtok(0, " ")){
            // la linea se separa cada vez que se encuentre un " " (espacio) y se guarda en palabra
            // se ejecuta mientras exista una palabra
            if(esPalabra(palabra)){
                actualizarLista(quitarSaltoDeLinea(palabra), contadorLinea); // aqui se llama a la funcion
                // que actualiza las palabras
            }
        }
        contadorLinea++;
    }
    fclose(archivo);

}
/*
 * @param palabra: una cadena de caracteres a comparar
 * se verifica si esa cadena de caracteres pertenece a una palabra
 * valida o no
 * devuelve 1 si se cumple y un 0 en caso contrario
 */
int esPalabra(char *palabra){
    return
            strcmp(palabra, "el") != 0 && strcmp(palabra, "la") != 0 &&
            strcmp(palabra, "los") != 0 && strcmp(palabra, "las") != 0 &&
            strcmp(palabra, "y") != 0 && strcmp(palabra, "o") != 0 &&
            strcmp(palabra, "se") != 0;

}
/*
 * @param str: una cadena de caracteres
 * verifica si el final de la cadena existe un '\n'
 * si lo tiene, este se cambia por un '\0' y se retorna la palabra
 * si no, entonces se retorna la palabra tal y como venia
 */
char *quitarSaltoDeLinea(char *str){
    int n = strlen(str);
    int i;
    for(i = 0; i<n; i++){
        if(str[i] == '\n'){
            str[i] = '\0';
            return str;
        }
    }
    return str;
}
/* Funcion que se encarga de actualizar las palabras que encuentra en el archivo
 * @param palabra: es la palabra a guardar
 * @param numeroLinea: numero de linea en la cual se encuentra esa palabra
 */
void actualizarLista(const char *palabra, int numeroLinea){
    int i;
    for(i = 0; i<numeroDePalabras; i++ ){
        if(!strcmp(plb[i].palabra, palabra)){ // si la palabra existe
            palabras *palabra = (plb + i); // se guarda en la siguiente posicion de memoria
            palabra->apariciones++; // se aumenta las apariciones
            palabra->lineasDeAparicion[palabra->apariciones -1] = numeroLinea; // se le agrega la linea en donde aparecio
            return; // se detiene el ciclo
        }
    }
    // si la palabra no existe, esta se aniade
    strcpy(plb[i].palabra, palabra);
    plb[i].apariciones = 1; // se inicializa las apariciones de esa palabra
    plb[i].lineasDeAparicion[0] = numeroLinea; //se agrega la linea en que aparecio
    numeroDePalabras++; // se aumenta el contador global de palabras del archivo
}
/*
 * Funcion para ordenar las palabras de mayor a menor de acuerdo
 * con las veces que aparezcan en el archivo
 * Se utiliza el Bubble Sort por ser mas sencillo de implementar
 * Referencia: https://gist.github.com/prinick96/c7d8a540d47aadaf1460ebb160e8541f
 */
void ordenarPorAparicion(){
    int i, j;
    palabras palabra;

    for(i = 1; i < numeroDePalabras; i++) {
        for(j = 0; j < numeroDePalabras - i; j++) {
            if(plb[j].apariciones < plb[j + 1].apariciones) {
                palabra = plb[j];
                plb[j] = plb[j + 1];
                plb[j + 1] = palabra;
            }
        }
    }
}