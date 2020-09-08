# 4. Arrays 32:20
   * 18 Concepto de array, declaración y creación 07:45
   * 19 Recorrido de un array 05:34
   * 20 Ejercicio práctico VII 09:12
   * 21 Ejercicio práctico VIII 09:49
   
# 18 Concepto de array, declaración y creación 07:45

<img src="images/18-01.png">

En esta lección te voy a explicar una estructura de programación muy utilizada en cualquier lenguaje que es el array.

<img src="images/18-02.png">

¿Qué que es un Array? Un Array es un conjunto de datos de un mismo tipo a los que vamos a poder acceder no con varias variables sino con una única variable. 

Vamos a ver si nos imaginamos una variable como una caja en la que almacenamos un dato de un determinado tipo. Podríamos decir que un Array es como un conjunto de cajas pegadas una detrás de otra, lo que pasa es que en vez de tener un nombre cada una de esas cajas hay un único nombre, una única variable que permite acceder a un único identificador que es lo que se asigna a las variables, para acceder a todas esas posiciones, a todas esas cajas que conforman el array. Y cómo podemos hacer para que con una única variable, un único identificador podamos acceder a todas esas posiciones, cada una de ellas tiene asociado un índice, el primer elemento de ese conjunto de datos que forman el array tendría posición 0, el siguiente 1 y así sucesivamente.

Aquí ves en este ejemplo de la diapositiva un array de 10 números enteros donde tenemos una serie de números almacenados 4,15,0 etc. y cada uno asociado a una posición.

Cuando se trata de hacer una operación o un grupo de operaciones con un conjunto de datos en el mismo grupo de operaciones con todos esos datos, en vez de tenerlos cada uno en una variable es mejor almacenarlos en un array de modo que podríamos utilizar las estructuras repetitivas tipo `for` o `while` para poder ejecutar las mismas instrucciones con todos los elementos que conforman dicho array, ya lo verás en los ejemplos que vamos a hacer en posteriores lecciones.

<img src="images/18-03.png">

Lo primero cómo creamos un array, para crear un array dado que va a estar almacenada en una variable hay que declarar dicha variable, fíjate cómo sería la declaración:

`int [] datos;`

tipo de datos que vamos a almacenar en el array, corchete y cierre de corchete y nombre de la variable donde se va a almacenar, no se indica tamaño ni nada.

Es en el momento de la creación del array cuando ya le damos un tamaño a través del operador `new` muy utilizado en Java para construir objetos a partir de clases, porque en definitiva eso no es importante pero que sepas que un array es un objeto, bueno pues para construir un array utilizamos el operador `new` seguido del tipo de dato de ese array y ahora ya si entre corchetes indicaremos el tamaño del array.

`datos = new int[10]; //array de 10 enteros`

Por ejemplo si es un array de tamaño 10 indicaremos el número 10 entre corchetes.

Esta instrucción crea un objeto array y lo almacena en la variable `datos` la variable que va a almacenar el objeto o la referencia al objeto de array para poder después utilizar dicha variable para acceder a él.

Y cómo se accedería a ese Array, como se accedería a cada uno de los elementos, cada una de las posiciones utilizaríamos el nombre de la variable como ves aquí:

```java
datos[0]=4;
datos[1]=15;
```

En este caso queremos acceder a la posición 0 para almacenar el número 4 y a la posición 1 para almacenar el número 15 etc.

Por supuesto si de lo que se trata es de mostrar el contenido de las posiciones también esta expresión `datos[i]` haría referencia al dato para leerlo y hacer alguna operación con el. 

Podemos hacer la declaración, la creación y la inicialización del array, asignación de datos a cada una de las posiciones todo en una misma instrucción.

`int [] valores = {3, 5, 20, 11}`

Declaramos el tipo y en este caso corchetes apertura cierre vacíos, nombre la variable y a continuación el signo igual y entre llaves la lista de datos que van a conformar ese array.

Esto ya hará que implícitamente al ejecutarse este programa que se construya un array en este caso de tamaño 4 y cada una de esas posiciones desde cero hasta la 3 sera inicializado con uno de esos valores que ves.

La primera con 3, la siguiente con 5, el siguiente con 20 y la siguiente con 11.

<img src="images/18-04.png">

Consideraciones que tenemos que tener en cuenta cuando vamos a trabajar con una array, como cualquier variable se puede declarar o bien como atributo al principio de la clase o bien como una variable local dentro de un método, si se declara como un atributo implícitamente un array es inicializado a `null`, `null` es una palabra reservada de Java que la utilizaremos con objetos, representa el objeto nulo. Evidentemente si es local esa variable no se inicializa a nada, ya sabemos que las variables locales hay que asignarles algo antes de ser utilizadas.

Cuando creamos un array independientemente de que sea atributo o sea una variable local todos sus elementos se van a inicializar implícitamente asignando un cero a cada una de las posiciones de ese datos.

<img src="images/18-05.png">

Por ultimo comentarte que podemos también trabajar aunque no es habitual porque no se utilizan demasiado con arrays de varias dimensiones, es decir nosotros nos imaginamos un array como los que hemos visto antes como una fila, un conjunto de cajitas una detrás de otra. Pero podemos tener arrays de dos dimensiones que podemos imaginar como una especie de tabla de datos repartidas en filas y columnas 

En el ejemplo de la diapositiva es que como utilizaríamos un array de dos dimensiones

`int [][] m = new int[10][4]`

El primer número representaría las filas de esa tabla y el segundo las columnas de modo que un array `[10][4]` como en este caso sería realmente un array de 10 por cuatro elementos, 40 elementos.

Para acceder a cada una de las posiciones evidentemente tenemos que utilizar dos índices para la primera dimensión y para la segunda dimensión.

`m[2][1]`

En la siguiente lección vamos a ver cómo utilizar un array directamente desde un programa para recorrerlo de cara a almacenar información y ejecutar un grupo de instrucciones que se ejecuten con cada una de las posiciones del array y también para la lectura de la información que es para lo que más vamos a utilizar.

# 19 Recorrido de un array 05:34

<img src="images/19-01.png">

En la lección anterior hemos estudiado que son los arrays, en esta lección vamos a ver cómo recorrer el contenido de un array utilizando una instrucción `for`.

<img src="images/19-02.png">

En primer lugar vamos a hablar de un atributo que exponen todos los objetos array sean del tipo que sean llamado `length`, que significa que exponen un atributo, bueno los arrays son objetos entonces disponen de propiedades o atributos que es como les llamamos habitualmente en Java, disponen de métodos pero en el caso de los arrays lo que nos interesa es uno de esos atributos concretamente `length` que nos va a decir en todo momento cuál es la longitud de un array, hay que tener en cuenta que un array es una estructura de datos estática, una vez que lo creamos le damos un tamaño, pues ese tamaño no puede ser modificado, entonces si el array está siendo tratado en muchas partes del programa es posible que en algún momento no sepamos exactamente qué tamaño va a tener o qué tamaño tiene porque no sabemos o desconocemos en una parte del código en qué momento se habrá creado y de qué tamaño sea. Entonces si en algún momento necesitamos conocer su tamaño a través del atributo `length`, utilizando la expresión `nombreArray.length` puedes saber cuántos elementos tiene, eso qué significa.

<img src="images/19-03.png">

Lo vemos aquí, que si yo quiero recorrer el contenido de un array para hacer algo con él, como almacenar información en cada una de sus posiciones o como comúnmente se hace para leer el valor de cada una de esas posiciones, podemos utilizar esta estructura:

```java
int [] datos = new int[10];
//almacena los 10 primeros números pares
for(int i=0; i < datos.length; i++){
   datos[i] = i*2;
}
```

Todos los arrays comienzan en la posición 0 por lo que la ultima sera `length-1`.

Entonces si nosotros planteamos un `for` cuya variable de control empieza en 0 y llegue hasta la condición `i < datos.length` significará que va a ir pasando por todos los números desde 0 justo a longitud menos 1, usando ese número, esa variable de control podemos acceder a la posición del array, lo que va a hacer que este bucle haga lo que tiene que hacer en este caso por ejemplo es multiplicar la variable control por dos es decir ir calculando los números pares entre cero en adelante y almacenarlos en cada posición del array.

Pues claro la primera vez que entramos accederemos a la posición cero, la siguiente sala 1 con la variable acuerdate y el incremento que se incrementa al ejecutar al final de bloque instrucciones del `for` y así hasta la última posición, porque la condición de salida es que sea menor que la longitud del array.

En este caso vamos a almacenar los diez primeros números pares.

Otro ejemplo que en este caso lo que hacemos es leer, recuperar.

```java
//Muestra el contenido del array
for(int i=0; i < datos.length; i++){
   System.out.println(datos[i]);
}
```

Si queremos recuperar todo el contenido del array, todas las posiciones una por una desde la primera hasta la última volvemos a plantear el mismo `for` desde la posición cero que sería la del primer elemento hasta la última menos uno o lo que es lo mismo mientras la condición sea menor que la longitud.

En ese caso como ves estamos con la variable de control `i` accediendo a cada una de esas posiciones del array y mostrando su contenido por pantalla.

<img src="images/19-04.png">

Existe una forma de recorrer también el array sin utilizar índices con la instrucción conocida como `for each` es una variante del `for` que no te la conté en el momento cuando vimos la sesión de control porque es especifica de arrays y también de colecciones que es otra estructura de datos un poquito más compleja.

Bueno en el caso de los arrays existe una variante como decía el `for` que se llama `for each` que nos permite recorrer el contenido de un array, **siempre de lectura, muy importante eso siempre lectura, sin necesidad de índices**.

Cómo funciona esto.

```java
//Muestra el contenido del array
for(int n:datos){
   System.out.println(n);
}
```

Aquí la tiene en esta variante del `for` no hay tres instrucciones como en el `for` clásico sino solamente una, declaramos una variable de control dos puntos el array que vamos a recorrer, no tenemos que indicar nada más, esto cómo se interpreta, se interpreta que para cada elemento del array, por eso lo llamamos habitualmente `for each` a pesar de que el nombre de la instrucción realmente es `for`, para cada uno de los segmentos del array hacer el `System.out.println(n)`, la variable `n` no es un índice es una variable del tipo de dato del array. Si tenemos un array de tipo entero, la variable `n` que declaramos es de tipo entero y lo que hace esa variable es ir, como ves apuntando a cada una de las posiciones del array, repito no representa un índice es una variable que va a ir adquiriendo cada uno de los valores del array.

Por lo tanto cuando hacemos referencia a `n` en el interior del `for` nos estamos refiriendo al contenido de esa posición, la posición actual, ya se encarga Java de ir cogiendo esa variable e ir apuntándola a cada uno de los elementos del array sin que nosotros le digamos dónde hay que empezar o dónde hay que terminar.

Es una instrucción que encontramos en el lenguaje Java desde la versión Java 5 ya son bastantes años la que con la que contamos con esta instrucción.

Y como digo si no necesitas el índice para nada resulta bastante más compacta.

# 20 :computer: Ejercicio práctico VII `611-08-Ejercicio_Practico_7` 09:12

<img src="images/20-01.png">

Muy bien vamos a realizar un par de ejercicios donde pongamos en práctica el uso de los arrays en Java.

<img src="images/20-02.png">

En este primer ejercicio vamos a realizar un programa en el que a partir de un array que tiene almacenados 10 números enteros cualquiera se nos va a mostrar en pantalla la media de esos valores almacenados así como también su valor máximo.

Vamos a nuestro entorno de desarrollo Eclipse y vamos a crear el proyecto Java `611-07-Ejercicio_Practico_7` y creamos la clase principal `CalculosArray`.


*`CalculosArray`*

```java
public class CalculosArray {

   public static void main(String[] args) {
		
		
      double media = 0;
      int max;
		
      int [] datos = { 4, 8, 2, 11, 8, 9, 23, 7, 11, 14};
		
      max = datos[0];
		
     for(int dato:datos) {
	media=media + dato;
	if(dato > max) {
	   max = dato;
	}
     }
     media = media/datos.length;
		
     System.out.println("La media es: " + media) ;
     System.out.println("El valor máximo es: " + max);

   }
}
```

Vamos a ejecutar el programa.

<img src="images/20-03.png">

En la siguiente lección vamos a realizar otro ejercicio de arrays y ahí lo que vamos ya es por primera vez a utilizar operaciones de entrada de datos, es decir en vez de como hemos hecho hasta ahora trabajando siempre con datos introducidos previamente en variables dentro del propio programa podemos hacer algo más interactivo que el usuario pueda introducir datos del exterior.

Por eso te recomiendo que la siguiente lección leas el documento que tenemos dentro de la sección de material adicional que explica el funcionamiento de la clase `Scanner` que es una de las clase de Java estándar, porque hay otras opciones pero quizás `Scanner` es la más sencilla para lectura de datos desde el teclado.


# 21 :computer: Ejercicio práctico VIII `611-09-Ejercicio_Practico_8` 09:49   

<img src="images/21-01.png">

Vamos a continuación a hacer nuestro segundo ejercicio de arrays, ara ello deberías leerte el documento de [lectura de datos por teclado](/temarios/611_Aprende_a_programar_en_Java/pdfs/L21-Lectura_de_datos_por_teclado.pdf) ya que en este ejemplo lo necesitaremos.

<img src="images/21-02.png">

Vamos a hacer un programa en el que se van a leer por el teclado la introducción de diez números, el usuario del programa tendrá que introducir diez números uno detrás de otro y le seguirá pidiendo y lo que va a hacer nuestro programa es ordenar los números y presentarlos ordenados de mayor a menor.

Una particularidad del ejercicio es que si se introduce un número negativo mientras el usuario está solicitando esos números el programa le dirá que es erróneo que vuelva de nuevo a intentarlo así hasta conseguir diez números positivos.

Vamos al entorno de desarrollo Eclipse y vamos a crear el proyecto `611-09-Ejercicio_Practico_8` con la clase principal `NumerosOrdenados` con el siguiente código.

*`NumerosOrdenados`*

```java
public class NumerosOrdenados {

   public static void main(String[] args) {
		
      Scanner sc = new Scanner(System.in);
      int [] numeros = new int[10];
      int num, aux;
		
      //Solicitamos la introducción de los 10 números positivos
      for(int i=0; i<numeros.length; i++) {
         System.out.println("Introduce número: ");
         num = sc.nextInt();
			
         //repite la lectura mientras no sea positivo
	 while(num < 0) {
            System.out.println("No es positivo!!!, vuelve a intentarlo");
            num = sc.nextInt();
				
      	 }
         numeros[i] = num;
      }
		
      //Ordenación: método de la burbuja
      for(int i=0; i<numeros.length; i++) {
         for(int k=i; k<numeros.length; k++) {
            if(numeros[k]>numeros[i]) {
               //sustitución o intercambio
               aux = numeros[i];
               numeros[i]=numeros[k];
               numeros[k]=aux;
            }
         }
      }
		
      //Muestra el contenido del array
      System.out.println("Los números son: ");
      for(int n:numeros) {
         System.out.print(n+", ");
      }
   }
}
```

Ejecutamos la aplicación.

<img src="images/21-03.png">
