# 4. Manipulación y tratamiento de datos 77m
   * 14 Conoce Java API Docs 9:57 
   * 15 Uso de la clase String 13:03 
   * 16 Manejo de Arrays 23:09 
   * Práctica: Creando el juego de hundir la flota 31:16 
   * Contenido adicional 4
   
# 14. Conoce Java API Docs 9:57 

[Conoce Java API Docs-1](pdfs/14_Conoce_JAVA_API_DOCS-1.pdf)

## Resumen Profesor

Conoce más Java y descubre la documentación de Java para ver todos los paquetes y clases que contiene Java.

## Transcripción

![14_Conoce_JAVA_API_DOCS-1](images/14_Conoce_JAVA_API_DOC-1.png)

Comenzamos un nuevo capítulo sobre manipulación y tratamiento de datos y lo primero que vamos a hacer es conocer un poco más Java y es que habíamos dicho antes que Java aparte de un lenguaje de programación y una plataforma sobre la cual ejecutar nuestro programa, era una inmensa ingente cantidad de código puesta nuestra disposición para tratar un montón de situaciones ya conocidas.

![14_Conoce_JAVA_API_DOCS-2](images/14_Conoce_JAVA_API_DOC-2.png)

Java pone a nuestra disposición un montón de clases, en particular Java SE incluyendo más de 4000 clases en su versión 8, la versión de Java SE, esas 4000 clases las podemos utilizar con total tranquilidad.

![14_Conoce_JAVA_API_DOCS-3](images/14_Conoce_JAVA_API_DOC-3.png)

Esto requeriría un gran esfuerzo por nuestra parte el que nos sentáramos y estudiáramos para qué sirve cada una de esas cuatro mi clases, viéramos cuáles son los métodos de cada una de ellas, cuáles son sus atributos, si son públicos o son privados. 

![14_Conoce_JAVA_API_DOCS-4](images/14_Conoce_JAVA_API_DOC-4.png)

No desesperemos porque Java pone también a nuestra disposición una documentación conocida como el API JAVA DOCS o se le llame directamente API. 

Cada versión de Java tiene publicada esta ayuda, este API JAVA DOCS, lo tiene publicado en la web, lo podemos consultar en particulares el de la versión 8 es:

https://docs.oracle.com/javase/8/docs/api/

A través de este enlace podemos visitar la web.

![14-01](images/14-01.png)

Lo primero que se nos presenta es una pantalla dividida en diferentes frames, en el que podemos ver una lista con todos y cada uno de los paquetes que nos ofrece Java que no son pocos, un listado de todas las clases, de las 4000 y pico que tiene independientemente del paquete en el que estén y una presentación en este caso más específica de los distintos paquetes que tiene y cuál es el cometido de cada uno de ellos. Por ejemplo el paquete `java.sql` probé el API necesario, de los métodos necesarios, de las clases necesarias, para acceder y procesar datos almacenados en un origen de datos normalmente una base de datos relacional, usando Java o por ejemplo la `java.nio` nos permite manejar contenedores de datos, buffers y una manera nueva de acceder a ficheros y otros orígenes de datos. 

El paquete `java.math` no ofreces clases matemáticas, si pinchamos en un paquete nos llevará directamente al contenido de ese paquete.

![14-02](images/14-02.png)

Dentro de él podemos ver el sumario de clases y de enumeraciones que no son más que un conjunto cerrado de valores, podemos encontrar una descripción del paquete donde nos hablará pues algo sobre las diferentes clases, si ya están dentro del paquete pincharamos en el nombre de una clase nos llevará a la información sobre esa clase. 

Si quería comentaros que podemos eliminar estos Frames de la izquierda si nos resultan incómodos, dándole a la versión de "NO FRAMES".

![14-03](images/14-03.png)

Dónde ya nos mostraría directamente solo la información del paquete Java.

Si quisieramos ver para qué sirve la clase `BigInteger` por ejemplo, ya nos da aquí una primera descripción donde nos dice que es una **clase inmutable** es decir, que cuando construyamos un objeto no va a poder ser modificado, si no lo que hace es que podemos tener otro, para guardar enteros de precisión arbitraria es decir enteros todo lo grande que nosotros queramos.

![14-04](images/14-04.png)

Si entramos en partícular en una clase concreta como es en el caso de `BigInteger` nos va a hablar de la clase, de la jerarquia de clases de las cuales hereda, interfaces que implementa, nos da una serie de documentación sobre la clase este apartado de documentación hay parte donde es más extenso y menos extenso, nos dice por ejemplo que un valor `BigInteger` puede estar sobre todo en este rango `1 to 2 a la  500000000 potencia` siempre que sea positivo es suficientemente grande y más adelante nos indica los atributos que tiene, los constructores y un resumen de los métodos, para cada uno de ellos incluso podríamos pulsar, la clase `BigInteger` en particular tiene una serie de campos, en este caso son un poco especiales porque son de su mismo tipo y no indican determinados valores concreto ONE, TEN, ZERO valores constantes `BigInteger`. Los distintos constructores a partir de un valor en una sucesión de byte a partir de una representación en una cadena de caracteres. Una cantidad de métodos que no podríamos recordar de memoria, ya no de una sola clase, si no más de una clase sería imposible que recordáramos todos los métodos, no hace falta porque los ponemos consultar aquí, si queremos saber en particular lo que hace un método, por ejemplo el método AND damos click en el y nos lleva a una descripción de el.

![14-05](images/14-05.png)

Donde nos diría la firma del método, es decir el tipo de dato de retorno, el modificador de acceso, el tipo de dato de retorno, el modificador de acceso, el nombre del método, los argumentos que reciben, para qué sirve, la identificación de los distintos parámetros, lo que devuelve el método. Ademas tenemos los diferentes métodos para poder verlos con una descripción totalmente exhaustiva de lo que realizan como por ejemplo el método `isProbablePrime` que devuelve un método que es probablemente un número primo con un grado de certeza explica como trabajar con este método. Existen otra serie de métodos.

Tenemos un montón de paquetes diferentes para usar por ejemplo hemos usado la clase `String` que se cargaba en el paquete `java.lang` el cual tiene varias clases entre ellas `String`.

![14-06](images/14-06.png)

Nos da una ayuda de como instanciar una clase, de cómo utilizarla, una explicación de algunas clases que tienen asociación con ella, los constructores, una serie de método, etc. 

Cómo podemos comprobar este sistema de ayuda se vuelve indispensable para nosotros, si queremos poco a poco ir aprendiendo toda la variedad de clases, de paquetes, que esta nos ofrece y los métodos que utiliza. 

Esta ayuda que tenemos aquí es la que Eclipse cuando dentro del IDE nos posicionamos sobre alguna clase Java, lo único que hace es consultar el API.

De esta manera iremos conociendo poco a poco todas las clases que ofrece Java y todas sus posibilidades.

# 15. Uso de la clase String 13:03 

[Uso de la clase String](pdfs/15_Uso_de_la_clase_String.pdf)

## Resumen Profesor

### 15.1 Creación de Strings

La forma más fácil de crear una cadena de caracteres es a partir de un literal con dobles comillas

```java
String saludo = "Hola Mundo";
```

Los literales de cadenas de caracteres son compilados por Java como un objeto `String`.

Como comprobaremos más adelante, Java ofrece un tipo de sucesión o colección de elementos de un tipo llamado array. Un array de caracteres también podría representar una cadena de caracteres, pero para nosotros será menos versátil.

**IMPORTANTE**: *La clase `String` es inmutable, es decir, que una vez creada, su valor no se puede modificar. Todas las operaciones que realicemos con objetos de este tipo darán como resultado un nuevo objeto, no la modificación del actual.*

### 15.2 Concatenación

Concatenar dos cadenas es poner una cadena a continuación de la otra. Lo podemos hacer de varias formas:

* operador `+`: es la forma más cómoda: `"Cadena " + "concatenada"`.

* método `.concat(...)`: otra forma de hacerlo: `"Mi nombre es ".concat("Pepe")`.

### 15.3 Longitud, mayúsculas y minúsculas

Podemos obtener el número de caracteres de un `String` mediante el método `.length()`.

```java
String saludo = "Hola Mundo!";
System.out.println(saludo.length()); //Debe imprimir 11
```

Podemos pasar toda la cadena a minúsculas con `toLowerCase()`, o a mayúsculas con `toUpperCase()`.

### 15.4 Creación de cadenas formateadas

En ocasiones, podemos querer crear una cadena de caracteres concatenando varios literales de cadena, con otra serie de valores. En estos casos, puede resultar tedioso hacerlo:

```java
  String nombre = "Pepe";
  String apellidos = "Pérez";
  String mensaje = "¿qué tal estás?";
  System.out.println("Hola, soy " + nombre + " " + apellidos + ", y quiero saludarte diciéndote " + mensaje);
```

Para casos así, podemos usar el método `format`, que nos permite utilizar *variables* dentro de la cadena de formato, que serán sustituidos por valores.

* `%s`: será sustituido por una cadena de caracteres.

* `%f`: será sustituido por un número decimal.
* ...

El ejemplo anterior quedaría:

```java
  String nombre = "Pepe";
  String apellidos = "Pérez";
  String mensaje = "¿qué tal estás?";
  String str = String.format("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);
  System.out.println(str);
}
```

### 15.5 Comparaciones de cadenas y fragmentos de cadenas

La clase `String` nos proporciona muchos métodos para comparar cadenas y fragmentos de cadenas:

* `endsWith`, para comparar si una cadena termina igual que un sufijo proporcionado.

* `startsWith`, para comparar si una cadena comienza igual que un prefijo proporcionado.

* `compareTo`, para comparar una cadena con otra. Devuelve 0 si son iguales, `< 0` si es menor, y `> 0` si es mayor (lexicográficamente hablando).

* `equalsIgnoreCase`, para comparar dos cadenas ignorando si están en mayúsculas o minúsculas.

* `matches`, para comparar si una cadena cumple con una expresión regular.

* `contains`, para comparar si una cadena está contenida en otra.

## Transcripción

![15_Uso_de_la_clase_String-1](images/15_Uso_de_la_clase_String-1.png)

En esta lección vamos a aprender a usar la clase `String`, una clase que ya hemos utilizado antes a través de literales encerrado entre comillas doble o de referencias que hemos creado a través de esas literales. Vamos a ver cómo trabajar con esa clase. 

![15_Uso_de_la_clase_String-2](images/15_Uso_de_la_clase_String-2.png)

Un literal encerrada entre comillas dobles genera para Java un `String` y podemos almacenar el valor de ese literal en una referencia de tipo `String`, **los `String` son inmutables** estó es muy importante que lo tengamos presente, toda operación que hagamos sobre un `String` no modifica ese `String`, es imposible modificarlo por qué son inmutables, sin embargo si intentamos modificarlo lo que va a suceder es que va a generarse un `String` nuevo con estas modificaciones hechas, es altamente eficiente y casi al final del curso aprenderemos a utilizar otras clases que nos permiten trabajar con cadenas que si somos conscientes de que van a ser modificadas muchas veces nos van a permitir el tratamiento de essas cadenas de una manera más eficiente. Ahora nosotros trabajaremos con `String` que va a darnos respuesta suficiente a lo que nosotros necesitamos por ahora.

![15_Uso_de_la_clase_String-3](images/15_Uso_de_la_clase_String-3.png)

Una operación muy habitual entre `String` es la concatenación de dos `String`. Concatenar es yuxtaponer, es decir colocar a continuación de de una cadena otra cadena, se puede hacer mediante el método `concat`  o también se puede hacerse con el operador `+` que suele ser la forma más habitual porque es muy cómoda, pero que sepamos que también tenemos el método `concat`.

![15_Uso_de_la_clase_String-4](images/15_Uso_de_la_clase_String-4.png)

También podemos querer saber la longitud de una cadena de caracteres, que no es más que el número de caracteres que lo conforman, a la hora de contar esos caracteres cuenta espacio en blanco, incluso si están al principio o al final de la cadena, tabuladores que también los podemos incluir, signos de puntuación, toda esa serie de caracteres que podríamos llamar raros, no son letras ni números también contarían, se puede hacer a través del método `length()`, el método `length()` para una instancia de `String` nos va a permitir conocer el número de caracteres que tiene. 

![15_Uso_de_la_clase_String-5](images/15_Uso_de_la_clase_String-5.png)

Una operación muy habitual que vamos a querer hacer con cadenas de caracteres es el pasarlo a mayúsculas o a minúsculas o también su formateo, vamos a poder verlo en los ejemplos que tenemos a continuación.

### :computer: `101-09-OrientacionObjetos`

*`EjemplosString`*

```java
package string;

public class EjemplosString {
   public static void main(String[] args) {

      // CONCATENAR
      String nombre = "Mi nombre es ".concat("Pepe");
      String nombre2 = "Mi nombre es " + "Pepe";
      System.out.println(nombre);
      System.out.println(nombre2);

      // MAYÚSCULAS-MINÚSCULAS
//    String cadena = "En un lugar de La Mancha";
//    System.out.println(cadena);
//    System.out.println(cadena.toLowerCase());
//    System.out.println(cadena.toUpperCase());
      // cadena.

      // STRING FORMAT

//    String nombre = "Pepe";
//    String apellidos = "Pérez";
//    String mensaje = "¿qué tal estás?";
//    System.out.println("Hola, soy " + nombre + " " + apellidos + ", y quiero saludarte diciéndote " + mensaje);

//    String nombre = "Pepe";
//    String apellidos = "Pérez";
//    String mensaje = "¿qué tal estás?";
//    //String str = String.format("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);
//    //System.out.println(str);
//    System.out.printf("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);

      // MÉTODOS DE COMPARACIÓN
//    String quijote = "En un lugar de La Mancha";
//
//    System.out.println(quijote.endsWith("La Mancha"));
//    System.out.println(quijote.startsWith("En un lugar"));
//    System.out.println(quijote.contains("lugar"));

   }
}
```

Vamos a hacer primero la concatenación de dos cadenas de caracteres, la concatenación como hemos visto la podemos hacer con el operador `+` o la podemos hacer con el método `concat` 

```java
// CONCATENAR
String nombre = "Mi nombre es ".concat("Pepe");
String nombre2 = "Mi nombre es " + "Pepe";
System.out.println(nombre);
System.out.println(nombre2);
```

`concat` nos permite concatenar la cadena `"Mi nombre es "` a esta otra `"Pepe"`, utilizo esta sintaxis para que la conozcamos y sepamos reconocer que un literal encerrado entre comillas doble implica una instancia de `String` tanto es así que este valor literal nos permite llamar a métodos en este caso a `concat` esto devolvería `Mi nombre es Pepe` almacenado en `nombre` de la misma manera que lo hacemos con `nombre2` con el operador `+`.

![15-01](images/15-01.png)

Para pasar a mayúscula y minúscula tenemos los métodos `toUpperCase()` y `toLowerCase()` que nos van a permitir transformar toda una cadena de caracteres en mayúscula y en minúscula.

```java
// MAYÚSCULAS-MINÚSCULAS
String cadena = "En un lugar de La Mancha";
System.out.println(cadena);
System.out.println(cadena.toLowerCase());
System.out.println(cadena.toUpperCase());
```

![15-02](images/15-02.png)

Si no nos acordamos muy bien de un método podemos usar la ayuda debemos escribir el nombre de una referencia un punto y no aparecerá a continuación todos los métodos que podríamos usar.

![15-03](images/15-03.png)

![15_Uso_de_la_clase_String-6](images/15_Uso_de_la_clase_String-6.png)

Vamos a hablar del formateo de cadenas de caracteres.


```java
// STRING FORMAT

String nombre = "Pepe";
String apellidos = "Pérez";
String mensaje = "¿qué tal estás?";
System.out.println("Hola, soy " + nombre + " " + apellidos + ", y quiero saludarte diciéndote " + mensaje);
```

![15-04](images/15-04.png)

En este ejemplo usamos el operador `+` para concatenar las cadenas y realizar una especie de formato de salida, pero está cadena montada con concatenación se vuelve algo tediosa.

Hay un método en particular el método `format()` que nos va permitir construir cadenas de caracteres para las cuales vamos a utilizar una especie de plantilla y luego en esa plantilla vamos a definir el espacio que vamos a sustituir por determinados valores de variable o de literal por ejemplo, si quisiéramos hacer la cadena hola soy y meter ahí en medio un nombre y uno apellido y a continuación continuar con el literal y quiero saludarte diciéndote y a continuación meter un mensaje, la concatenación de esto sería un poco tedioso, podríamos crear mediante un solo golpe el literal, "hola soy y quiero saludarte diciéndote..." y dejar unos huecos especiales, los que posteriormente sustituir cada uno de esos huecos por un valor de una variable, esos huecos se definen a través de tanto por ciento y un carácter, son los conocidos como **especificadores de formato**, `%s` lo que indica que lo que se va a sustituir es una cadena de caracteres, podríamos utilizar otro como por ejemplo `%d` para números,  `%f` para números con decimales, `%n` nos añadirá un salto de línea, pero en particular ahora para los caracteres podríamos usar `%s`, cómo podemos comprobar el método `format()` además recibe después un número variable de argumentos para incrustar los valores de los huecos, esperara que nosotros le proporcionemos separado por coma esos valores.

```java
String nombre = "Pepe";
String apellidos = "Pérez";
String mensaje = "¿qué tal estás?";
String str = String.format("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);
System.out.println(str);
```

Aquí usamos el método `format` de la clase `String`, formamos primero el formato del `String` y despúes lo imprimimos.
 
![15-05](images/15-05.png)

Lo anterior que haciamos en dos pasos lo podemos hacer en uno solo con el método `System.out.printf` que nos va a permitir directamente imprimir a la consola 8aun que no siempre es lo que queramos hacer por eso esta `String.format`).

```java
String nombre = "Pepe";
String apellidos = "Pérez";
String mensaje = "¿qué tal estás?";
//String str = String.format("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);
//System.out.println(str);
System.out.printf("Hola, soy %s %s y quiero saludarte diciéndote %s", nombre, apellidos, mensaje);
```

![15-06](images/15-06.png)

![15_Uso_de_la_clase_String-7](images/15_Uso_de_la_clase_String-7.png)

Otra de las operaciones que comúnmente se suele hacer con cadenas de caracteres es la comparación entre ella y vamos a comprobar como Java proverte múltiple métodos para comparar dos cadenas de caracteres.

Si hacedemos a la ayuda del API https://docs.oracle.com/javase/8/docs/api/java/lang/String.html 

![15-07](images/15-07.png)


que hace debo a la ayuda a lápiz vale como truco también deciros que en lugar de entrar aquí y tener que buscar podemos buscar directamente Google normalmente si buscamos Java api-docs y el nombre de la clase no aparecerá la ayuda es posible que no aparezca la versión que nosotros deseamos podemos indicar la versión y es posible que así si no tienes directamente vale Java 8 de este si no la localizar a otra manera muy rápida e instituir en la URL el 7 por el 8 y así cambiaremos rápidamente un montón de métodos de comparación el más básico de todos es el método compare to que compara dos cadenas de caracteres mediante el orden lexicografico este orden tan rimbombante rimbombante no es más que el orden que conocemos como siempre alfabético es decir la el menor que lave y azul es menor que la C y así sucesivamente hasta la cena vale con todo podemos o tenemos una serie de método para para comprar malla de este maya del método compare to compare two podemos ver su contenido lo que hace es que devuelve un valor menor que cero y la cadena de la izquierda del operador es menor que la otra cadena pero si son iguales y mayor que 0 si 10 machos tenemos también su método hermano compare ignoré case que lo que hace es pasar las dos cadenas de caracteres a minúscula o a mano o A mayúscula para hacer la comparación ignorando que hay mayúscula o minúscula y luego tenemos otra serie de métodos cómo poder comprobar y un fragmento de cadena está dentro de otra con content vale y el contenido de una cadena es igual a otra vale tenemos todo esos métodos entre otros que ya digo que son interesante nos vamos a ver por aquí estos tres que podéis comentar la ayuda bien aquí o viene en el API en Ruiz nos va a devolver verdadero y la cadena de caracteres que le pasamos como argumento es el final de la cadena de caracteres sobre la que estamos llamando al método análogamente tenemos estar uy que nos devolverá verdadero di la cadena de caracteres a la cual sobre la cual estamos de mandarme todo comienza con la que le proporcionamos como argumento y con lo que hace es buscar en medio de la cadena de caracteres para indicar si si contiene esta secuencia de caracteres no tiene esa cara en un lugar de la Mancha termina en la mancha en un lugar y contiene la palabra lugar bueno yo ánimo a que tratéis de ir conociendo poco a poco los métodos que tiene stream que son muchos imposible conocer los todo de una vez que si es necesario consultar la ayuda y si hace falta pues envié y algún tipo de pregunta en esto




```java


```








# 16. Manejo de Arrays 23:09 

[Manejo de Arrays](pdfs/16_Arrays.pdf)

## Resumen Profesor

### 16.1 Arrays

Un array es un contenedor de elementos de un mismo tipo, con un tamaño fijo que hay que conocer a la hora de crearlo. A la hora de recorrerlo, las posiciones comienzan a contar en cero.

### 16.2 Creación de un array

Usamos el operador `new`, y tenemos que conocer el tipo de dato y el tamaño:

```java
int[] unArray = new int[10];
```

### 16.3 Acceso de lectura y escritura

El operador `[ ]` nos permite acceder a las posiciones de un array, para leer su valor, o también para modificarlo.

Para asignar un valor, usaremos el operador corchete a la izquierda de una operación de asignación:

```java
unArray[1] = 100;
```

Para leer un valor, lo utilizaremos en operaciones como un `println`:

```java
System.out.println(unArray[1]);
```

### 16.4 Inicialización de un array

Tenemos varias formas de hacerlo:

1. Manualmente, asignando cada una de las posiciones

2. Manualmente, pero utilizando un bucle para iterar por las posiciones (simpre que la lógica del programa lo permita).

3. Atajo con la sintaxis `{ }`.

### 16.5 Reocorrido de un array

Todo array tiene una propiedad pública, `length`, que son permite consultar su número de elementos. Utilizándola, podemos usar un bucle para recorrer un array:

```java
for(int i = 0; i < unArray.length; i++) {
     System.out.println(unArray[i]);
}
```

También podemos utilizar un bucle for-each, que nos permite extraer elemento a elemento, sin necesidad de conocer a priori su longitud:

```java
for(int i : unArray) {
     System.out.println(i);
}
```

### 16.6 Arrays de objetos

No solamente podemos crear arrays de tipos primitivos, sino que también lo podemos hacer de instancias de alguna clase que hayamos definido previamente.

```java
Persona[] unArray = new Persona[10];
//...
unArray[1] = new Persona(…);
```

### 16.7 Arrays multidimensionales

Podemos crear arrays que tengan más de una dimensión. Tan solo tenemos que añadir otra pareja de corchetes.

```java
int[][] biArray = new int[10][20];
biArray[3][4] = 78;
```

Para recorrerlos necesitaremos *anidar* otro bucle for:

```java
for(int i = 0; i < biArray.length; i++) {
   for(int j = 0; i < biArray[0].length; j++) {
     System.out.println(unArray[i][j]);
   }
}
```

### 16.8 Manipulación de arrays

Java nos provee de una clase, `java.util.Arrays`, que posee una serie de métodos para realizar operaciones rápidas con arrays. Entre otros:

* `sort(...)`: nos permite ordenar los elementos de un arrays

* `copyOf(...)`: nos permite copiar rápidamente un array en otro

* `binarySearch(...)`: nos permite buscar un valor entre los elementos de un array. Previamente debe estar ordenado

Java 8 incorpora algunos métodos paralelos, que aprovechan mejor el rendimiento de arquitecturas con varios procesadores, para operar con arrays muy grandes, con estas operaciones, entre otras:

* `parallelSort(...)`

* `parallelSetAll(...)`

## Transcripción

![16_Arrays-1](images/16_Arrays-1.png)

![16_Arrays-2](images/16_Arrays-2.png)

![16_Arrays-3](images/16_Arrays-3.png)

![16_Arrays-4](images/16_Arrays-4.png)

![16_Arrays-5](images/16_Arrays-5.png)

![16_Arrays-6](images/16_Arrays-6.png)

![16_Arrays-7](images/16_Arrays-7.png)

![16_Arrays-8](images/16_Arrays-8.png)

![16_Arrays-9](images/16_Arrays-9.png)

![16_Arrays-10](images/16_Arrays-10.png)

![16_Arrays-11](images/16_Arrays-11.png)


## Práctica: Creando el juego de hundir la flota 31:16 

[Práctica: Creando el juego de hundir la flota](pdfs/Hundir_la_flota.pdf)

![Hundir_la_flota-1](images/Hundir_la_flota-1.png)

En esta sesión práctica veremos como crear el juego de hundir la flota, tienes el código de ejemplo en el [repositorio de GitHub](https://github.com/OpenWebinarsNet/Curso-Java-desde-0/tree/master/16bis_HundirFlota).

![Hundir_la_flota-2](images/Hundir_la_flota-2.png)

![Hundir_la_flota-3](images/Hundir_la_flota-3.png)

![Hundir_la_flota-4](images/Hundir_la_flota-4.png)

### Código

*HundirLaFlota.java*

```java
/**
 * HUDIR LA FLOTA
 * 
 * Se trata de un juego clásico, en el que nos vamos a enfrentar al ordenador. Cada usuario dispone de un mapa
 * de 10x10 casillas, donde se colocarán barcos (dos de tamaño 5, tres de tamaño 3, y cinco de tamaño 1). 
 * Jugador y ordenador irán diciendo posiciones en el mapa, y el jugador opuesto tendrá que indicar si la "bomba"
 * ha caádo en el agua, o ha tocado algún barco.
 * 
 * Para simplificar el juego, en lugar de verificar si un barco completo se ha hundido, y cuantos barcos quedan a flote,
 * contabilizamos el número total de casillas correspondientes a un barco que no han sido "hundidas". Se parte con
 * 24 puntos (5+5+3+3+3+1+1+1+1+1) 
 * 
 * Este código está inspirado (aunque reescrito y simplificado) de un código original de Manuel Jesús Gallego Vela
 */
package hundirflota;

import java.util.Random;
import java.util.Scanner;

/**
 * @author 
 *
 */
public class HundirLaFlota {

	//CONSTANTES, que nos sirven para representar algunos valores
	final static char AGUA_NO_TOCADO = '.';
	final static char AGUA = 'A';
	final static char TOCADO = 'X';

	//TAMAÑO DEL TABLERO
	final static int TAMANIO = 10;
	
	private static Scanner sc;

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		//La clase Scanner nos permite, junto con System.in, leer desde el teclado
		sc = new Scanner(System.in);
		
		// Mapa del usuario y del ordenador
		char[][] mapaUsuario = new char[TAMANIO][TAMANIO];
		char[][] mapaOrdenador = new char[TAMANIO][TAMANIO];
		
		// Este tercer mapa nos sirve para anotar y visualizar
		// las tiradas que hacemos sobre el mapa del ordenador
		char[][] mapaOrdenadorParaUsuario = new char[TAMANIO][TAMANIO];
		
		// Puntos con los que comienzan las partidas		
		int puntosUsuario = 24;
		int puntosOrdenador = 24;
		
		// Lleva el control del programa.
		// Si no quedan barcos a flote del jugador o el ordenador, lo ponemos a true
		boolean juegoTerminado = false;

		// Indica si el tiro es correcto, para volver a realizar otro
		boolean tiroCorrecto = false;

		//Posiciones de la tirada
		int[] tiro = new int[2];

		// Inicializamos los mapas, colocando los barcos
		inicializacion(mapaUsuario, mapaOrdenador);
		// Inicializamos el mapa de registro a AGUA_NO_TOCADO
		inicializaMapaRegistro(mapaOrdenadorParaUsuario);

		//Mientras queden barcos a flote
		while (!juegoTerminado) {

			// Al principio del turno, pintamos el mapa del usuario
			System.out.println("MAPA DEL USUARIO");
			imprimirMapa(mapaUsuario);
			
			System.out.printf("PUNTOS RESTANTES DEL JUGADOR: %d\n", puntosUsuario);
			System.out.println("TURNO DEL JUGADOR");
			
			//Comenzamos con la tirada del usuario
			tiroCorrecto = false;
			while (!tiroCorrecto) {
				//Solicitamos los datos por teclado.
				tiro = pedirCasilla();
				//Verificamos si el tiro es correcto o no
				if (tiro[0] != -1 && tiro[1] != -1) {
					//Puede ser INCORRECTO porque ya haya tirado
					//sobre esas coordenadas
					tiroCorrecto = evaluarTiro(mapaOrdenador, tiro);
					if (!tiroCorrecto)
						System.out.println("TIRO INCORRECTO");	
				} else {
					System.out.println("TIRO INCORRECTO");
				}
				//De no serlo, el jugador debe volver a tirar
				
			}
			
			//Actualizamos mapa del ordenador y los puntos
			int puntosOrdenadorAnterior = puntosOrdenador;
			puntosOrdenador = actualizarMapa(mapaOrdenador, tiro, puntosOrdenador);
			
			//Actualizamos nuestro mapa de registro y lo imprimimos.
			//Sabemos si la tirada ha sido AGUA O TOCADO si el número de puntos se ha decrementado.
			char tipoTiro = (puntosOrdenadorAnterior - puntosOrdenador) > 0 ? TOCADO : AGUA; 
			actualizarMapaRegistro(mapaOrdenadorParaUsuario,tiro, tipoTiro);
			System.out.println("\nREGISTRO DEL MAPA DEL ORDENADOR");
			imprimirMapa(mapaOrdenadorParaUsuario);
			
			//El juego termina si el número de puntos llega a 0
			juegoTerminado = (puntosOrdenador == 0);
			
			
			//Si no ha ganado el jugador, le toca a la máquina
			if (!juegoTerminado) {
				
				System.out.printf("PUNTOS RESTANTES DEL ORDENADOR: %d\n\n", puntosOrdenador);
				System.out.println("TURNO DEL ORDENADOR");
				tiroCorrecto = false;
				//Seguimos los mismos parámetros de comprobación que en la tirada del usuario
				while (!tiroCorrecto) {
					tiro = generaDisparoAleatorio();
					tiroCorrecto = evaluarTiro(mapaUsuario, tiro);
				}
			}
			//Actualizamos mapa
			puntosUsuario = actualizarMapa(mapaUsuario, tiro, puntosUsuario);
			//El juego termina si el número de puntos llega a 0			
			juegoTerminado = (puntosUsuario == 0);

		} //FIN DE LA PARTIDA. Alguien ha ganado
				
		if (puntosOrdenador == 0) {
			System.out.println("EL VENCEDOR HA SIDO EL JUGADOR");
		} else 
			System.out.println("EL VENCEDOR HA SIDO EL ORDENADOR");

		sc.close();
	}

	
	/*
	 * Método que sirve para que el ordenador pueda hacer un disparo
	 */
	private static int[] generaDisparoAleatorio() {		
		return new int[] {aleatorio(), aleatorio()};
	}


	/*
	 * Metodo que aglutina la inicialización de ambos mapas
	 */
	public static void inicializacion(char[][] m1, char[][] m2) {
		inicializaMapa(m1);
		inicializaMapa(m2);
	}
	
	/*
	 * Método que inicializa el mapa que mostramos al usuario
	 * con las tiradas que ha hecho sobre el mapa del ordenador.
	 */
	private static void inicializaMapaRegistro(char[][] mapa) {
		// Inicializamos el mapa entero a AGUA_NO_TOCADO
		for (int i = 0; i < TAMANIO; i++)
			for (int j = 0; j < TAMANIO; j++)
				mapa[i][j] = AGUA_NO_TOCADO;
		
	}

	/*
	 * Método que inicializa un mapa de juego, colocando
	 * los barcos sobre el mismo.
	 */
	private static void inicializaMapa(char[][] mapa) {

		// Inicializamos el mapa entero a AGUA_NO_TOCADO
		for (int i = 0; i < TAMANIO; i++)
			for (int j = 0; j < TAMANIO; j++)
				mapa[i][j] = AGUA_NO_TOCADO;

		// 2 portaaviones (5 casillas)
		// 3 buques (3 casillas)
		// 5 lanchas (1 casilla)
		int[] barcos = { 5, 5, 3, 3, 3, 1, 1, 1, 1, 1 };

		// Posible dirección de colocación del barco
		char[] direccion = { 'V', 'H' };

		// Para cada barco
		for (int b : barcos) {

			// Intentamos tantas veces sea necesarias para colocar el barco en el mapa.
			// Vamos de mayor tamaño a menor, para que sea menos
			// dificultoso encontrar un hueco
			boolean colocado = false;
			while (!colocado) {

				//Obtenemos una posición y dirección aleatorias
				int fila = aleatorio();
				int columna = aleatorio();
				char direcc = direccion[aleatorio() % 2];

				// ¿Cabe el barco en la posición indicada?
				if (direcc == 'V') {
					if (fila + b <= (TAMANIO - 1)) {
						// comprobamos que no hay otro barco que se solape
						boolean otro = false;
						for (int i = fila; (i <= fila + b) && !otro; i++) {
							if (mapa[i][columna] != AGUA_NO_TOCADO)
								otro = true;
						}
						// Si no hay otro barco, lo colocamos
						if (!otro) {
							for (int i = fila; i < fila + b; i++) {
								mapa[i][columna] = Integer.toString(b).charAt(0);
							}
							colocado = true;
						}
					}
				} else { // direcc == 'H'
					if (columna + b <= (TAMANIO - 1)) {
						// comprobamos que no hay otro barco que se solape
						boolean otro = false;
						for (int j = columna; (j <= columna + b) && !otro; j++) {
							if (mapa[fila][j] != AGUA_NO_TOCADO)
								otro = true;
						}
						// Si no hay otro barco, lo colocamos
						if (!otro) {
							for (int j = columna; j < columna + b; j++) {
								mapa[fila][j] = Integer.toString(b).charAt(0);
							}
							colocado = true;
						}
					}
				}

			}
		}

	}

	/*
	 * Método que nos devuelve un número aleatorio
	 */
	private static int aleatorio() {
		Random r = new Random(System.currentTimeMillis());
		return r.nextInt(TAMANIO);
	}

	/*
	 * Método que imprime un mapa, con una fila y columna de encabezados
	 */
	public static void imprimirMapa(char[][] mapa) {

		// Calculamos las letras según el tamaño
		char[] letras = new char[TAMANIO];
		for (int i = 0; i < TAMANIO; i++)
			letras[i] = (char) ('A' + i);

		// Imprimimos la fila de encabezado
		System.out.print("    ");
		for (int i = 0; i < TAMANIO; i++) {
			System.out.print("[" + i + "] ");
		}

		System.out.println("");
		// Imprimimos el resto de filas
		for (int i = 0; i < TAMANIO; i++) {
			System.out.print("[" + letras[i] + "]  ");
			for (int j = 0; j < TAMANIO; j++) {
				System.out.print(mapa[i][j] + "   ");
			}
			System.out.println("");
		}
	}

	/*
	 * Método mediante el cual el usuario introduce una casilla
	 */
	private static int[] pedirCasilla() {
		
		System.out.println("Introduzca la casilla (por ejemplo B4): ");
		String linea = sc.nextLine();
		//Pasamos la cadena a mayúsculas
		linea = linea.toUpperCase();
		int[] t;

		
		// Comprobamos que lo introducido por el usaurio es correcto mediante una expresión regular
		if (linea.matches("^[A-Z][0-9]*$")) {

			// Obtenemos la letra.
			// Suponemos que, como mucho, usaremos una letra del abecedario
			char letra = linea.charAt(0);
			// El número de fila es VALOR_NUMERICO(LETRA) - VALOR_NUMERICO(A).
			int fila = Character.getNumericValue(letra) - Character.getNumericValue('A');
			// Para la columna, tan solo tenemos que procesar el número
			int columna = Integer.parseInt(linea.substring(1, linea.length()));
			// Si las coordenadas están dentro del tamaño del tablero, las devolvemos
			if (fila >= 0 && fila < TAMANIO && columna >= 0 && columna <= TAMANIO) {
				t = new int[]{ fila, columna };
			} else //En otro caso, devolvemos -1, para que vuelva a solicitar el tiro
				t =  new int[] { -1, -1 };
		} else 
			t =  new int[] { -1, -1 };
		
		
		return t;

	}

	/*
	 * Método que nos permite evaluar si un tiro es CORRECTO (AGUA o TOCADO)
	 * o se trata de una casilla por la que ya hemos pasado antes.
	 */
	public static boolean evaluarTiro(char[][] mapa, int[] t) {
		int fila = t[0];
		int columna = t[1];
		return mapa[fila][columna] == AGUA_NO_TOCADO || (mapa[fila][columna] >= '1' && mapa[fila][columna] <= '5'); 
		
	}
	
	/*
	 * Método que actualiza el mapa, con un determinado tiro. 
	 * Devolvemos el número de puntos restantes.
	 */
	private static int actualizarMapa(char[][] mapa, int[] t, int puntos) {
		int fila = t[0];
		int columna = t[1];
		
		if (mapa[fila][columna] == AGUA_NO_TOCADO) {
			mapa[fila][columna] = AGUA;
			System.out.println("AGUA");
		} else {			
			mapa[fila][columna] = TOCADO;
			System.out.println("HAS ALCANZADO A ALGÚN BARCO");
			--puntos;
		}
		
		return puntos;
		
		
	}
	/*
	 * Método que actualiza el mapa de registro
	 */
	private static void actualizarMapaRegistro(char[][] mapa, int[] t, char valor) {
		int fila = t[0];
		int columna = t[1];

		mapa[fila][columna] = valor;
	}

}
```

**SALIDA:**

```sh
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   3   3   3   .   1   .   .   
[E]  5   .   .   .   1   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 24
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
A1
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   .   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   .   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   .   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 24

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   1   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 23
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
B7
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   .   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   .   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 24

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 22
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
E3
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   .   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 24

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   1   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 22
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
H2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   .   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 23

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   5   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 21
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
G2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   .   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 22

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL JUGADOR: 20
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
F2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   .   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 21

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  5   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 20
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
E2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   .   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 20

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   1   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 19
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
I2
HAS ALCANZADO A ALGÚN BARCO

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   X   .   .   .   .   .   .   .   
[J]  .   .   .   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 19

TURNO DEL ORDENADOR
HAS ALCANZADO A ALGÚN BARCO
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   X   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   .   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 18
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
J2
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   .   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   X   .   .   .   .   .   .   .   
[J]  .   .   A   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 19

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   .   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   X   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   A   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 18
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
D2
AGUA

REGISTRO DEL MAPA DEL ORDENADOR
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  .   A   .   .   .   .   .   .   .   .   
[B]  .   .   .   .   .   .   .   A   .   .   
[C]  .   .   .   .   .   .   .   .   .   .   
[D]  .   .   A   .   .   .   .   .   .   .   
[E]  .   .   X   A   .   .   .   .   .   .   
[F]  .   .   X   .   .   .   .   .   .   .   
[G]  .   .   X   .   .   .   .   .   .   .   
[H]  .   .   X   .   .   .   .   .   .   .   
[I]  .   .   X   .   .   .   .   .   .   .   
[J]  .   .   A   .   .   .   .   .   .   .   
PUNTOS RESTANTES DEL ORDENADOR: 19

TURNO DEL ORDENADOR
AGUA
MAPA DEL USUARIO
    [0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 
[A]  X   .   .   A   .   .   .   .   .   .   
[B]  5   X   5   5   5   5   .   .   .   .   
[C]  5   .   1   .   .   .   .   .   .   .   
[D]  5   .   .   X   3   3   .   1   .   .   
[E]  5   .   .   .   X   .   .   .   .   .   
[F]  .   .   .   .   .   3   3   3   .   .   
[G]  .   .   .   .   .   .   3   .   .   .   
[H]  .   .   X   .   .   .   3   X   .   .   
[I]  .   .   .   .   .   .   3   .   A   .   
[J]  .   .   A   .   .   .   .   .   .   A   
PUNTOS RESTANTES DEL JUGADOR: 18
TURNO DEL JUGADOR
Introduzca la casilla (por ejemplo B4): 
```

## Contenido adicional 4   

[Conoce Java API Docs](pdfs/14_Conoce_JAVA_API_DOCS.pdf)

[Uso de la clase String](pdfs/15_Uso_de_la_clase_String.pdf)

[Manejo de Arrays](pdfs/16_Arrays.pdf)

[Práctica: Creando el juego de hundir la flota](pdfs/Hundir_la_flota.pdf)
