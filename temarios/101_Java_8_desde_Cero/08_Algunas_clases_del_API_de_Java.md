# 8. Algunas clases del API de Java 82m
   * Manipulación de datos con Stringbuilder 8:01 
   * Manejo de fechas 17:31 
   * Colecciones ArrayList 11:30 
   * Introducción a las expresiones lambda 20:21 
   * Práctica: Creando un gestor de aparcamiento de coches 25:16 
   * Contenido adicional 6
      
# 30. Manipulación de datos con Stringbuilder 8:01 

[Manipulación de datos con Stringbuilder](pdfs/30_StringBuilder.pdf)

## Resumen del Profesor

Conoce el tipo de cadena Stringbuilder en esta lección

## Transcripción

![30_StringBuilder-1](images/30_StringBuilder-1.png)

![30_StringBuilder-2](images/30_StringBuilder-2.png)

![30_StringBuilder-3](images/30_StringBuilder-3.png)

![30_StringBuilder-4](images/30_StringBuilder-4.png)

![30_StringBuilder-5](images/30_StringBuilder-5.png)

![30_StringBuilder-6](images/30_StringBuilder-6.png)

Comenzar el último bloque de este curso de Java desde cero en el que vamos a conocer algunas de las clases más utilizadas del API de Java vale me las clases que estaba nos proporciona así como una introducción a la gran novedad de cada 8 qué ha sido el uso de la expresión snapchat comencemos en este caso con la manipulación de cadenas de caracteres de datos con la clase 33 surge a raíz de la sesión de que la clase String es una clase e inmutable con inmutable queremos decir que una clase puede valor no no se puede modificar una vez inicializado no se puede modificar solo yo ofrece sus ventajas pero también tienes un inconveniente y es que si nosotros queremos hacer operaciones sobre todo de concatenación de varias cadenas de caracteres o de sustitución parcial de algún fragmento de la cadena no encontramos conque cualquier operación de este tipo producía siempre una nueva cadena por lo cual vamos sobrecargando la memoria y las operaciones son francamente ineficiente nos va a permitir representar una cadena un string pero que si será modificable que será mutable y por ende será más eficiente para cadenas que van a ser modificada o que queremos pues darle otro tratamiento que no sea diferente o sea que sea diferente a enfrente crearla y utilizarlas tal cual a la hora de construir una una instancia de tipo String Builder tenemos que tener en cuenta los conceptos de tamaño y capacidad el tamaño de un string Builder va a ser igual que el de un string es decir el número de caracteres que tenga sin embargo streambuilder incorpora el concepto de capacidad y es que podemos crear una instancia descendientes que tenga un tamaño menor a la capacidad que tenga decir al cuál le quepan todavía más caracteres pueda alojar un número de caracteres superior de hecho cuando nosotros creamos una instancia de streambuilder con su constructor sin parámetros crea un streambuilder vacío pero con una capacidad de 16 caracteres decir sin boca vamos directamente al en devolvería 00 el método capacitivo devolvería 16 tenemos otra serie de constructores en particular parece interesante el que permite construir o el que nos permite indicar la capacidad inicial de un streambuilder y es que prevemos que va a ser muy superior a los 16 caracteres aquí tenemos un pequeño gráfico que ilustra la diferencia entre tamaño y capacidad si creamos en streaming del vacío y le añadimos una serie de caracteres para saludar podemos comprobar como le hemos añadido una cadena con 9 caracteres que ocuparían desde el índice 0 hasta el 8 pero desde el índice 9 hasta el 15 es decir hasta completar la capacidad 16 y estaría vacío pero estaría disponible para que nosotros lo pudiéramos utilizar la clase sin Builder tiene una serie de métodos que nos van a permitir o no puedes manejar la longitud vale nos va a permitir cambiar la longitud de un string Builder y la nueva longitud es menor que la actual los caracteres que quedarían a la derecha de esta noche y tú son truncado de decir que se perdería si es mayor lo que se añadirían serían elementos paseo a diferencia de Cetelem lo que hace el método ensurecapacity es asegurar que la capacidad de este finde sea al menos la del mail capacity que le estamos pasando algunos métodos como Apple y acabamos de ver que lo que hace es agregar una serie de caracteres al final del streambuilder es decir a continuación del último crack te pueden aumentar la capacidad de nuestras team builder de manera transparente a nosotros descargar novedad de

La del Milka Pacific que estamos pasando algunos métodos como Apple y acabamos de ver que lo que hace es agregar una serie de caracteres al final del Springfield es decir a continuación del último carácter pueden aumentar la capacidad de nuestras team builder de manera transparente antes de verlo ejemplo conozcamos algunos de las operaciones que podemos hacer con streambuilder ya hemos visto que podemos usar el método app que nos permite añadir a continuación del último carácter que tengamos una cadena de caracteres y también tiene sobreescrito el método hacen para los diferentes tipos primitivos vale si le pasamos un tipo de dato que nos primitivos lo que hace es transformarlo antes de pasarlo tenemos también el método de leche que elimina una secuencia de caracteres dentro de este finde tenemos el método insert que inserta el segundo argumento tanto siete tipos tren como de tipo primitivo en la cadena es el primero el ojo lo que indica la posición a partir de la cual se va insertar el método replace que lo que hace reemplazar un carácter o una cadena de caracteres a partir de una posición o a partir de un inicio y un fin y otros métodos bastante útiles que nos devuelve la cadena pero dada la vuelta por último decir que si necesitamos utilizar el método streambuilder como si fuera una cadena de caracteres tenemos el método to String que nos devolvería una instancia inmutable del contenido de ese finde que inicialmente es mutable veamos algunos ejemplos tendríamos la posibilidad de hacer una especie de conversor de palíndromos un palíndromo en una frase que en principio se lee igual de izquierda a derecha o de derecha izquierda o viendo un poco los espacios no uno de los más clásicos se dábale arroz a la zorra el Abad y lo leyera y de derecha izquierda que digo que ando un poco espacio en blanco veríamos que se leería igualito que por no son las mismas palabras son como los números capicúa pero aplicado a la frase tendríamos aquí la posibilidad de darle un tratamiento con extreme ineficiente y con streambuilder bastante más eficiente aquí tendríamos que el la frase ver su longitud construirá una serie de arrays de Char para darle ese tratamiento transformar el string en un array fecha que lo haríamos posición a posición lo invertiría Moss crearía Moss la nueva frases y podríamos comprobar si al darle la vuelta a la frase pues lo mejor vayamos nosotros manualmente no nos hemos parado a implementar la comprobación vale p**** enmarañar el ejemplo si esto que tenemos aquí escrito se parece a esto que tenemos una cadena de tipo String es muy ineficiente sería bastante más sencillo con el uso de la clase StringBuilder cómo podemos comprobar podemos construir un streambuilder a partir de un string tan solo tendríamos que darle la vuelta con el método reversa y lo imprimimos no teníamos que hacer toda esta sucesión de operaciones auxiliares por lo cual os recomiendo que íbamos a trabajar con una cadena de caracteres que va a ser modificadas en el tiempo usamos siempre la clase en Builder a través de su método AP entreverse insert y si por contra vamos a crear una cadena de caracteres que no y no vaya a ser modificada nunca pues podemos usar la clase String


# 31. Manejo de fechas 17:31 

[Manejo de fechas](pdfs/31_Manejo_de_fechas.pdf)

## Resumen del Profesor

El API de fechas de Java 8 posee varias clases para manejarlas, pero la mayoría de ellas sigue esta convención sobre el nombre de los métodos que sirven para manejarlas.

Nombre | Tipo     | Uso
-------|----------|----
`of`   | estático |	Crear una instancia del objeto a partir de los datos de entrada
`from` | estático	| Convertir el parámetro de entrada en una instancia de la clase
`parse`| estático	| Procesar la cadena de entrada y construir una instancia
`format`| instancia |	Procesar los datos para producir una cadena de caracteres
`get`  | instancia | Devolver una parte del objeto
`is`   | instancia | Consultar el estado del objeto
`with` | instancia | Devolver una copia del objeto con uno o varios elementos modificados
`plus` | instancia | Devolver una copia del objeto con una cantidad de tiempo añadido
`minus`| instancia | Devolver una copia del objeto con una cantidad de tiempo sustraído
`to`   | instancia | Convertir el objeto en otro Tipo
`at`   | instancia | Combinar el objeto con otro objeto

## Transcripción

![31_Manejo_de_fechas-1](images/31_Manejo_de_fechas-1.png)

![31_Manejo_de_fechas-2](images/31_Manejo_de_fechas-2.png)

![31_Manejo_de_fechas-3](images/31_Manejo_de_fechas-3.png)

![31_Manejo_de_fechas-4](images/31_Manejo_de_fechas-4.png)

![31_Manejo_de_fechas-5](images/31_Manejo_de_fechas-5.png)

![31_Manejo_de_fechas-6](images/31_Manejo_de_fechas-6.png)

Vamos a continuar con el uso de alguna de las clases que no ofrece Java conociendo otra gran novedad de Java 8 que el manejo de fecha hasta las versiones anteriores de Java el manejo de fecha de fecha en Java era horrible por no decir alguna cosa pero el tratamiento de fechas se hacía través de una sola clase de donde los métodos que a priori puede días podrían parecer más interesante estaban desplegados desde la versión 2 dejabas aproximadamente con lo cual para crear una fecha necesitas otra clase auxiliar que era una clase de tipo calendar sobre todo en calendario gregoriano que el que nosotros manejamos y bueno todo el tratamiento que se dedicó era horriblemente tedioso Java 8 se ha puesto las pilas en ese sentido y basándose en una librería llamada Yoda time que ya existía desde hace tiempo pues lo ha incorporado al estándar y lo habéis tenido mediante el documento jsr310 utilizando además con un calendario predeterminado que el que define la normativa ISO en la en los 80 y 60 ahora para el manejo de fechas Java no ofrece un buen grueso de clases diferentes entre las que destacan localdate to localdatetime que serán clases que nos permitirán manejar fechas o 6 horas espero dentro de nuestro ámbito horario también podremos crear una fecha o una fecha y hora que estará en una determinada zona que nosotros podremos manejar o incluso tendrá clases que nos permitirán manejar no instante concreto o fechas concretas y ahora sino periodos de tiempo o periodo de duración además nos va a ayudar a manejar elementos complejos como no podíamos hacerlo antes como el uso del año bisiesto la zona horaria horario de verano horarios de invierno todo eso es capaz de manejarlo el nuevo el nuevo aquí serie de principios de diseño que os presentamos por aquí el uso tenía que ser claro es decir en el uso de los distintos métodos de la clase tiene que ser el esperado según su nombre que fuese fluido es decir que pudiéramos encadenar llamadas a métodos que nos hicieron un código legible y todas muy en el estilo de Java 8 que los objetos sean inmutables y que además fuese extensible no por ejemplo si nosotros tuviéramos que crear nuestro propio sistema de calendario lo pudiéramos hacer aquí algún ejemplo de cómo crear una fecha de cómo manejar una fecha para para bueno pues ajustarle un determinado una determinada día o para obtener una fecha no sobre las de hoy sino a partir de una serie de cifra añadirle restarle cantidades etcétera accedeix a a la documentación de javadoc del paquete Java time a ti podría encontrar todas y cada una de las clases que que ofrece y encontrareis un montón de información súper concreta sobre cada una de las clases vale yo puedo decir a a modo como que todas las clases siguen una serie de convención de método suelen tener el método y el método from ambos estático y qué sirven el método para crear una instancia del objeto del tipo del que estamos llamando a partir de una serie de una serie de datos entrada aquí teníamos la manera de crear un objeto de tipo localdate a partir de un año mes día canción

Parce nos permiten procesar una cadena de caracteres para obtener una instancia de esa clase forma procesar y a los datos de una cadena sobre la cual estamos llamando para producir una cadena de caracteres usualmente por para visualizar una parte o toda todos los datos de café segura método qué método thinking método quiz queremos que tiene bastante implementaciones pues nos permite devolver una parte de un objeto consulta objeto el Estado se te cumpla una determinada propiedad por ejemplo si un año es bisiesto o alguna fecha no podremos hacer mediante métodos y algunos métodos más que nos vamos a encontrar los métodos plus vinimos ya veremos que además tienen alguna no sobre escritura sino no hay métodos con este prefijos que nos permiten añadir una unidad o restar a una unidad días meses años a una determinada fecha y los métodos tú ya el método que nos permite consultar convertir un objeto en otro tipo y el método que combina un objeto con otro objeto para para producir andando vamos a ver una sucesión de ejemplo sencillo que tenéis aquí al lado para poder ver elementos sencillos de tratamiento obtener la fecha concreta de hoy día mes y año lo podríamos hacer con el método estático Nau de la clase localdate si tenemos podemos ver cómo está tomando la fecha actual y después la hacen pimientos sobre el formato de impresión está imprimiendo en un formato estándar y este veremos juntos pues como se puede modificar obtener el día el mes y el año de un localdate lo podríamos hacer a través de los diferentes métodos dientes que nos ofrecen 10 días nos devuelve el año que salió nos devuelve el mes y el día del mes nos podríamos tener con el método que estéis noviembre usar la fecha de hoy queremos colocar la fecha de nacimiento lo podríamos hacer a través del método estático a partir de voz el año descendió podemos tener una instancia de lo cantes algo muy como ya digo solamente proceso con la fecha antes de Java 8 ya era tedioso utilizando de utilizando un calendar terriblemente tedioso esto es mucho más conciso y más concreto podemos comparar y saber si dos fechas son iguales a través de este ejemplo si por ejemplo queremos obtener la fecha del 11 del 11 de 2017 y la fecha de hoy lo podríamos comparar son la misma mediante su método si son la misma el manejo de otro tipo de fecha que son un poco peculiares lo podemos plantear con lo de Mad o eventos recurrentes para ellos no plantea Java time otra clase por ejemplo nosotros cumplimos años normalmente nacido el 29 de febrero no 4 años el mismo día por ejemplo tenemos aquí el día del nacimiento vale si alguien naciera por ejemplo en el día de hoy en el 11/11 podríamos guardar su día y mes de nacimiento en un

El manejo de otro tipo de fecha que son un poco peculiares lo podemos plantear con lo llamado elementos recurrentes para ellos no plantea Java time otra clase por ejemplo nosotros cumplimos años normalmente todos los años salvo los que han nacido el 29 de febrero no lo cumplen cada cuatro años el mismo día del cumpleaños el 18 de septiembre y 8 de septiembre 18 de septiembre de todo el baño y el mes pero no guardaría el año y lo podríamos utilizar para almacenar o para comparar eventos recurrentes no y como por ejemplo tenemos aquí el día del nacimiento vale si alguien naciera por ejemplo el día de hoy en el 11/11 podríamos guardar su día y mes de nacimiento en un monte o también tenemos aquí un ejemplo del uso de from del método from que nos permite obtener un monstre a partir de un local de procesa este local de obtiene la información que quiere y lo conseguiría cómo vemos que hoy el día de hoy es igual al día de nacimiento que hemos construido de diferente manera es igual pues no quería felicidades porque hoy es tu cumple para manejarla ahora tenemos otra clase que localizan su metronaut es análogo al de local de y nos permite conocer la hora actual como nos permite conocer incluso hasta los nanosegundos vale o sea que antes no podíamos manejar si queremos manejar añadiros disminuir una serie de días horas en este caso a una hora determinada un local time le queremos añadir 2 horas pues podríamos añadirlo a través de los métodos plus II llamamos aquí podemos ver que tenemos varias implementaciones Plus y de minutos para sumar o restar un número de horas determinado en el que le podemos indicar una cantidad y a partir de una enumeración de Crono YoUnique le podemos indicar el tipo de unidad de tiempo que le estamos añadido por ejemplo a una fecha ni siquiera sumarle una semana pues podríamos tomárselo con plus indicando unos y espero no yome podemos ver como tenemos diferentes unidades de tiempo centurias día de cada 12 horas milenios vale la verdad que está muy muy completo y podríamos ver la diferencia entre la fecha de hoy y la fecha de dentro de una podemos también ver y sumar años o restar años vale a una determinada fecha vale con el método con el método Plus y el metro 200 para comparar fechas decíamos que teníamos algunos métodos y por ejemplo tenemos y hamsters y el método y porque nos permiten indicar si una fecha es anterior o el posterior a otra el año como por ejemplo la caducidad de una tarjeta de crédito no caducan nunca un determinado día del mes y no tendréis vuestra tarjeta de débito crédito caduca en un mes y un año pues lo podríamos hacer con la clase tía como que nos permitiría obtener un año y mes actual por ejemplo actual feria febrero perdón noviembre del 2017 vale aquí podríamos ver la longitud en días del mes actual vale hiciéramos como decía antes usarlo por ejemplo para una tarjeta de crédito podríamos decir su tarjeta caduca en febrero de 2018 no podíamos quitar perdón crear con el con el método de esta manera un auténtico quebradero de cabeza que hay siempre en el manejo de fecha el manejo de si una fecha pertenece a un año bisiesto con el método que nos devuelve verdadero si el año de la fecha si cierto y falso si no lo es particular el año 2017 no es bisiesto solamente podemos manejar un momento concreto sino que podemos querer modificar o manejar un periodo de tiempo cómo salir a las 8 ya lleva algún tiempo y liberada hace escasas semanas que ha liberado una primera versión de Java 9 vale podríamos ver con la clase superior el periodo que hay entre la fecha de liberación de la primera versión de Java 8 de la primera versión de Java 9 y guardarlo en una instancia de periodo cómo podéis comprobar no es un instante de tiempo sino que en el fondo lo que estamos almacenando es la diferencia entre los peces no bueno pues lo podríamos ver y expresar está diferencia por ejemplo en una cantidad de meses he habido 42 meses de diferencia entre la liberación de Java 8 y dejaba nuevo para procesar fecha tenemos también la posibilidad de usar el método parte el método parte que es estático lo que haría sería procesar una fecha que estaría en una cadena de caracteres para obtener en este caso por ejemplo un local de la clase datetimeformatter nos proporciona una serie de constante vale invitando bueno el formato en el que tiene estás hecha una de ellas el basket Izzo day nos vendría la fecha con el año el mes y el día sin ningún tipo de preparación tendríamos la posibilidad de crear un DAI un datetimeformatter a partir de un patrón siguiendo bueno utilizando una serie de caracteres en este caso la termino con la representan un día con un día del mes vale en la M mayúscula los meses del año y la y el año expresado en cuatro cifras vale esto se le llaman máscara de formato la cantidad diferente de elementos que podemos usar en una máscara de formato lo podéis encontrar en la documentación porque es bastante bastante extensa y os recomiendo que la leáis con detenimiento aquí podríamos crear un formateador y utilizarlo por la clase parte para traducir la clase viernes perdón para traducir la cadena pierna en un local de si se produjera algún tipo de situación especial no podríamos manejar con la excepción del time passed precio vale tiene que ser mira también dentro de la pide estaba time y bueno podríamos decir que esa fecha pues por ejemplo no sería para se hable en este caso sí que lo ha sido y por ejemplo le añadiéramos otro cuatro aquí pues nos daría una excepción

Todavía no hemos llegado al año 20.000 vale esa fecha no sería pasear como mecanismo análogo tenemos la posibilidad de formatear una fecha para obtener una cadena de caracteres que poder visualizar y aquí tendríamos la fecha y hora de hoy con la clase localdatetime vale profesora de manera que visualizamos el día del mes el mes con 3 caracteres el año con cuatro cifras la hora y 2 minutos vale y lo formateé haríamos utilizando un determinado formateado vale una instancia de venta en formato y no se pudiera procesar porque no hemos equivocado en la máscara de formato porque no se tiene que está información también nos daría una excepción de tipo venta con esto terminamos el vídeo referente a fecha ha sido una introducción hemos podido conocer a vista de pájaro muchos de los métodos que no ofrece os recomiendo que vayáis trabajando poco a poco con las diferentes clases jefe ese apasionante accidente tratamiento de fecha y de hora y que poco a poco también Vallés practicando con luces

# 32. Colecciones ArrayList 11:30 

[Colecciones ArrayList](pdfs/32_Arraylist.pdf)

## Resumen del Profesor

### 32.1 Desventajas del uso de arrays

El uso de arrays nos aportan una serie de **desventajas**:

* Tenemos que conocer a priori el tamaño.
* El tamaño no se puede modificar una vez creado.
* Problemas para insertar objetos en posiciones intermedias.
* Los arrays no son realmente objetos (instancias de clases)

Java nos provee de una serie de colecciones con algunos beneficios:

* Menos esfuerzo de programación.
* Aumento de la calidad y velocidad.
* Interoperabilidad
* Curva de aprendizaje pequeña
* Reusabilidad

### 32.2 ArrayList

De todas las colecciones de Java es quizá la más usada de todas. Permite algunas operaciones típicas de las colecciones **secuenciales**:

* Acceso posicional
* Búsqueda
* Iteración
* Tomar un fragmento

Para conocer mejor los métodos, podemos acceder a la documentación del api:

https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html

## Transcripción

![32_Arraylist-1](images/32_Arraylist-1.png)

![32_Arraylist-2](images/32_Arraylist-2.png)

![32_Arraylist-3](images/32_Arraylist-3.png)

![32_Arraylist-4](images/32_Arraylist-4.png)

![32_Arraylist-5](images/32_Arraylist-5.png)

![32_Arraylist-6](images/32_Arraylist-6.png)

![32_Arraylist-7](images/32_Arraylist-7.png)

![32_Arraylist-8](images/32_Arraylist-8.png)


# 33. Introducción a las expresiones lambda 20:21 

[Introducción a las expresiones lambda](pdfs/33_ExpresionesLambda.pdf)

## Resumen del Profesor

### 33.1 Paradigma de programación funcional

A la hora de programar, existen más paradigmas (formas de entender la programación) que la orientación a objetos: imperativa, lógica, orientada a aspectos, ... Uno de ellos, que está muy de moda, es la **programación funcional**. Su origen está en un lenguaje matemático formal, y si lo tenemos que resumir en una frase, podríamos decir que en él, la salida de una función depende solo de los parámetros de entrada.

Los lenguajes funcionales son más expresivos (es decir, hacen más con menos código) y más elegantes. Este tipo de expresiones ya estaban presentes en muchos lenguajes de programación, y era algo que la comunidad demandaba a Java, que lo ha incluido en su versión Java SE 8.

### 33.2 Expresión lambda

Una expresión lamba no va a ser más que una función anónima, un método abstracto. Su sintaxis es sencilla:

```java
() -> expresión

(p1, p2, ...) -> expresión

(p1, p2, ...) -> { sentencia1; sentencia2; .....;}
```

Algunos ejemplos de expresiones lambda podrían ser:

```java
() -> new ArrayList<>()
(int a, int b) -> a+b
(a) -> {
  System.out.println(a);
  return true;
}
```

### 33.3 Interfaz funcional

Se trata de cualquier interfaz que tenga un solo método (además de métodos `default`, `static`, `equals`, ...). Están muy ligadas a las expresiones lambda ya que allá donde se espere una instancia de un objeto que implemente una interfaz funcional, podremos utilizar una expresión de este tipo.

### 33.4 Colecciones y el método forEach

En Java SE 8 las colecciones nos proveen de un método, `.forEach`, que acepta una instancia de un objeto que implementa una interfaz funcional, llamada `Consumer<T>`, que nos permitirá facilmente recorrer el bucle usando expresiones lambda.

```java
lista.forEach(System.out::println);
```

### 33.5 Acceso a métodos

El operador `::` nos permite abreviar más la sintaxis, de forma que podemos acceder a métodos directamente:

Por ejemplo:

```java
x -> System.out.println(x)
```

sería equivalente a

```java
System.out::println
```

### 33.6 API Stream

Se trata de una nueva funcionalidad, que nos permite trabajar con colecciones como si se trataran de flujos de datos. Esto nos dará gran versatilidad, junto con las expresiones lambda, para filtrar, transformar, ordenar, agrupar y presentar datos.


```java
List<Integer> lista = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

lista
  .stream()
  .filter((x) -> x >= 5)
  .forEach(System.out::println);
```


## Transcripción

![33_ExpresionesLambda-1](images/33_ExpresionesLambda-1.png)
![33_ExpresionesLambda-2](images/33_ExpresionesLambda-2.png)

![33_ExpresionesLambda-3](images/33_ExpresionesLambda-3.png)
![33_ExpresionesLambda-4](images/33_ExpresionesLambda-4.png)

![33_ExpresionesLambda-5](images/33_ExpresionesLambda-5.png)

![33_ExpresionesLambda-6](images/33_ExpresionesLambda-6.png)

![33_ExpresionesLambda-7](images/33_ExpresionesLambda-7.png)

![33_ExpresionesLambda-8](images/33_ExpresionesLambda-8.png)
![33_ExpresionesLambda-9](images/33_ExpresionesLambda-9.png)



## Práctica: Creando un gestor de aparcamiento de coches 25:16 

[Proyecto_Final.pptx](otros/Proyecto_Final.pptx)

[Gráfico.xlsx](otros/Gráfico.xlsx)

![34-Parking-1](images/34-Parking-1.png)

![34-Parking-2](images/34-Parking-2.png)

![34-Parking-3](images/34-Parking-3.png)

![34-Parking-4](images/34-Parking-4.png)

![34-Parking-5](images/34-Parking-5.png)

En esta sesión práctica veremos como crear un gestor de aparcamiento de coches, tienes el código de ejemplo en el [repositorio de GitHub](https://github.com/OpenWebinarsNet/Curso-Java-desde-0/tree/master/Final_Parking).

### Código

*dibujoParking.txt*

```sh
		//   1     20     21      .. .. .. .. .. ..  100 
		//   2  |  19     22  |   ..                  99
		//   3  ▼  18  ▲  23  ▼                       98
		//   4     17  |  24         ..               97
		//   5     16     25                          96
		//   6     15     25            ..            95
		//   7  |  14     27  |                       94
		//   8  ▼  13  ▲  28  ▼            ..         93
		//   9     12  |  29      ..          ..      92
		//  10     11     30      31 .. .. .. .. ..   91
```

*App.java*

```java
/**
 * APLICACIÓN QUE IMPLEMENTA LA GESTIÓN DE UN PARKING
 */
package parking;

import java.util.Scanner;

import parking.modelo.Autobus;
import parking.modelo.Furgoneta;
import parking.modelo.Parking;
import parking.modelo.Vehiculo;

/**
 * @author Openwebinars
 *
 */
public class App {

	static Parking parking;

	static Scanner sc;

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		// Inicializamos las clases necesarias
		sc = new Scanner(System.in);
		// Ponemos en marcha el Parking.
		parking = new Parking();

		int opcion = 0;

		do {
			// Imprimimos el menú
			menu();
			System.out.print("Introduzca la opción seleccionada: ");
			opcion = Integer.parseInt(sc.nextLine());
			System.out.println("");
			switch (opcion) {
			case 1:
				registrarEntradaVehiculo();
				parking.imprimirEstadoParking();
				break;
			case 2:
				registrarSalidaVehiculo();
				parking.imprimirEstadoParking();
				break;
			case 3:
				if (parking.getPlazasDisponibles() > 0) {
					System.out.printf("Hay %d plazas disponibles %n", parking.getPlazasDisponibles());
				} else {
					System.out.println("El parking está COMPLETO");
				}
				break;
			case 4:
				parking.imprimirEstadoParking();
				break;
			case 5:
				System.out.printf("El saldo acumulado es de %.2f", parking.getSaldoAcumulado());
				break;
			case 6:
				parking.getVehiculos().forEach(System.out::println);
				break;
			default:
				System.out.println("Introduzca una opción correcta");
			}
			
		

		} while (opcion != 0);

		sc.close();
	}

	public static void menu() {

		System.out.println("BIENVENIDO AL PARKING CORONAVIRUS");
		System.out.println("==================================\n");
		System.out.println("0. Salir del programa");
		System.out.println("1. Registrar la entrada de un vehículo");
		System.out.println("2. Registrar la salida de un vehículo");
		System.out.println("3. Número de plazas disponibles");
		System.out.println("4. Imprimir estado del parking");
		System.out.println("5. Saldo acumulado del día");
		System.out.println("6. Imprimir la lista de vehiculos que hay en el parking");

	}

	public static void registrarEntradaVehiculo() {
		// Identificamos el tipo de vehículo
		int opcion = 0;
		do {
			System.out.println("1. Coche o moto");
			System.out.println("2. Furgoneta");
			System.out.println("3. Autobús");
			System.out.print("Introduzca el tipo de vehículo: ");

			opcion = Integer.parseInt(sc.nextLine());
		} while (opcion < 0 || opcion > 3);

		// Recogemos los datos propios de cualquier vehículo
		System.out.print("Introduzca la marca del vehículo: ");
		String marca = sc.nextLine();
		System.out.print("Introduzca la matrícula del vehículo: ");
		String matricula = sc.nextLine();

		Vehiculo v = null;

		// En función del tipo de vehículo, creamos una u otra referencia
		switch (opcion) {
		case 1:
			//Almacenamos los datos en mayúsculas
			v = new Vehiculo(matricula.toUpperCase(), marca.toUpperCase());
			break;
		case 2:
			// Si es una furgoneta, solicitamos la longitud
			System.out.print("Introduzca la longitud en metros de la furgoneta (puede incluir decimales): ");
			float longitud = Float.parseFloat(sc.nextLine());
			v = new Furgoneta(matricula, marca, longitud);
			break;
		case 3:
			// Si es un autobús, solicitamos el número de plazas
			System.out.print("Introduzca el número de plazas del autobús: ");
			int numPlazas = Integer.parseInt(sc.nextLine());
			v = new Autobus(matricula, marca, numPlazas);
		}

		// Registramos la entrada del vehículo
		parking.registrarEntradaVehiculo(v);
		System.out.println("");
	}
	
	public static void registrarSalidaVehiculo() {
		System.out.print("\nIntroduzca la matrícula del veh�culo: ");
		String matricula = sc.nextLine();
		// Para registrar la salida de un vehículo solamente
		// necesitamos su matrícula
		parking.registrarSalidaVehiculo(new Vehiculo(matricula.toUpperCase()));
	}

}
```

#### Modelo

*Vehiculo.java*

```java
/**
 * 
 */
package parking.modelo;

import java.time.LocalDateTime;

/**
 * @author Openwebinars
 *
 */
public class Vehiculo {
	
	// Dejamos las propiedades como protected de forma didáctica, aunque su uso no está muy recomendado
	// Sería más recomendable que fuera private, y acceder desde las clases hija mediante getters/setters
	protected String matricula;
	protected String marca;
	protected LocalDateTime fechaEntrada;
	protected int minutos;
	protected int numPlazaAparcamiento; 
	
	
	public Vehiculo() { }
	
	public Vehiculo(String matricula) {
		this.matricula = matricula;
	}
	
	public Vehiculo(String matricula, String marca) {
		this.matricula = matricula;
		this.marca = marca;
		
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public LocalDateTime getFechaEntrada() {
		return fechaEntrada;
	}

	public void setFechaEntrada(LocalDateTime fechaEntrada) {
		this.fechaEntrada = fechaEntrada;
	}

	public int getMinutos() {
		return minutos;
	}

	public void setMinutos(int minutos) {
		this.minutos = minutos;
	}
	
	public int getNumPlazaAparcamiento() {
		return numPlazaAparcamiento;
	}

	public void setNumPlazaAparcamiento(int numPlazaAparcamiento) {
		this.numPlazaAparcamiento = numPlazaAparcamiento;
	}

	public float calcularImporte() {
		return Parking.PRECIO_BASE_POR_MINUTO * minutos;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fechaEntrada == null) ? 0 : fechaEntrada.hashCode());
		result = prime * result + ((marca == null) ? 0 : marca.hashCode());
		result = prime * result + ((matricula == null) ? 0 : matricula.hashCode());
		result = prime * result + minutos;
		return result;
	}

	// Modificamos la implementación por defecto del método equals para 
	// identificar que dos vehículos serán iguales si lo es su matrícula
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
//		if (getClass() != obj.getClass())
//			return false;
		Vehiculo other = (Vehiculo) obj;
		if (matricula == null) {
			if (other.matricula != null)
				return false;
		} else if (!matricula.equalsIgnoreCase(other.matricula))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Vehiculo [matricula=" + matricula + ", marca=" + marca + ", fechaEntrada=" + fechaEntrada + ", minutos="
				+ minutos + "]";
	}
}
```

*Autobus.java*

```java
/**
 * 
 */
package parking.modelo;

/**
 * @author Openwebinars
 *
 */
public class Autobus extends Vehiculo {
	
	private int numPlazas;
	
	public Autobus() { }
	
	public Autobus(String matricula, String marca, int numPlazas) {
		super(matricula, marca);
		this.numPlazas = numPlazas;		
	}

	public int getNumPlazas() {
		return numPlazas;
	}

	public void setNumPlazas(int numPlazas) {
		this.numPlazas = numPlazas;
	}
	
	@Override
	public float calcularImporte() {		
		return super.calcularImporte() + (Parking.PRECIO_POR_ASIENTO * numPlazas);
	}

	@Override
	public String toString() {
		return "Autobus [numPlazas=" + numPlazas + ", matricula=" + matricula + ", marca=" + marca + ", fechaEntrada="
				+ fechaEntrada + ", minutos=" + minutos + "]";
	}
}
```

*Furgoneta.java*

```java
/**
 * 
 */
package parking.modelo;

/**
 * @author Openwebinars
 *
 */
public class Furgoneta extends Vehiculo {
	
	private float longitud;
	
	public Furgoneta() { }
	
	public Furgoneta(String matricula, String marca, float longitud) {
		super(matricula, marca);
		this.longitud = longitud;
	}

	public float getLongitud() {
		return longitud;
	}

	public void setLongitud(float longitud) {
		this.longitud = longitud;
	}
			
	@Override
	public float calcularImporte() {		
		return super.calcularImporte() + (Parking.PRECIO_POR_METRO * longitud);
	}


	@Override
	public String toString() {
		return "Furgoneta [longitud=" + longitud + ", matricula=" + matricula + ", marca=" + marca + ", fechaEntrada="
				+ fechaEntrada + ", minutos=" + minutos + "]";
	}
}
```

*PlazaAparcamiento.java*

```java
package parking.modelo;

public class PlazaAparcamiento {
	
	private int numero;
	private boolean libre;
	
	public PlazaAparcamiento() { }
	
	public PlazaAparcamiento(int numero) {
		this.numero = numero;
		// Por defecto, al crear una plaza está libre
		this.libre = true;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public boolean isLibre() {
		return libre;
	}

	public void setLibre(boolean libre) {
		this.libre = libre;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (libre ? 1231 : 1237);
		result = prime * result + numero;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof PlazaAparcamiento))
			return false;
		PlazaAparcamiento other = (PlazaAparcamiento) obj;
		if (libre != other.libre)
			return false;
		if (numero != other.numero)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PlazaAparcamiento [numero=" + numero + ", libre=" + libre + "]";
	}
}
```

*Parking.java*

```java
/**
 * Clase que modela el Parking y su lógica de negocio.
 * 
 * IMPORTANTE: Para representar en algunos comentarios un mapa del parking, se ha modificado
 * la codificación de este fichero  UTF-8. Posiblemente, sea necesario que modifiques la misma
 * en eclipse para poder visualizarlo correctamente.
 */
package parking.modelo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import parking.utils.Utils;

/**
 * @author Openwebinars
 *
 */
public class Parking {
	
	// Mantenemos una lista con los vehículos que hay dentro del parking
	private List<Vehiculo> vehiculos;
	
	// Además, necesitamos saber qué plazas están libres o cuales están ocupadas
	private PlazaAparcamiento[][] plazasAparcamiento;
	
	// El número de plazas disponibles, para poder visualizarlo en el cartel de la entrada
	// Si el número de plazas disponibles es 0, el parking está COMPLETO
	private int plazasDisponibles;
	
	// Almacenamos el importe total que hemos cobrado a lo largo de la sesión
	private float saldoAcumulado;
	
	// La carta de precios la establecemos estáticamente en constantes, si bien
	// sería positivo buscar otro sistema, como un fichero de properties.
	public static final float PRECIO_BASE_POR_MINUTO = 0.04f;
	public static final float PRECIO_POR_METRO = 0.2f;
	public static final float PRECIO_POR_ASIENTO = 0.25f;
	
	
	public Parking() {
		saldoAcumulado = 0.0f;
		plazasDisponibles = 100;
		vehiculos = new ArrayList<>();
		// nuestro parking es cuadrado, así que lo representamos en
		// un array bidimensional de 10x10
		plazasAparcamiento = new PlazaAparcamiento[10][10];
		int numPlaza = 0;
		for(int j = 0; j < 10; j++) {
			// Las columnas pares se recorren de arriba a abajo
			// y las impares de abajo a arriba
			if (j % 2 == 0)
				for(int i = 0; i < 10; i++)		
					plazasAparcamiento[i][j] = new PlazaAparcamiento(++numPlaza);
			else
				for(int i = 9; i >= 0; i--)
					plazasAparcamiento[i][j] = new PlazaAparcamiento(++numPlaza);
		}
		
		// Recorremos así el array para que quede de la siguiente forma
		// NOTA: Las flechas hacia abajo y arriba simulan el sentido de
		// los carriles por los que circularían los coches. 
		
		//   1     20     21      .. .. .. .. .. ..  100 
		//   2  |  19     22  |   ..                  99
		//   3  ▼  18  ▲  23  ▼                       98
		//   4     17  |  24         ..               97
		//   5     16     25                          96
		//   6     15     25            ..            95
		//   7  |  14     27  |                       94
		//   8  ▼  13  ▲  28  ▼            ..         93
		//   9     12  |  29      ..          ..      92
		//  10     11     30      31 .. .. .. .. ..   91
		
	}

	public int getPlazasDisponibles() {
		return plazasDisponibles;
	}

	public List<Vehiculo> getVehiculos() {
		return vehiculos;
	}

	public PlazaAparcamiento[][] getPlazasAparcamiento() {
		return plazasAparcamiento;
	}
			
	public float getSaldoAcumulado() {
		return saldoAcumulado;
	}

	/*
	 * Método que imprime, de forma conveniente, el mapa del parking, 
	 * indicando todas las plazas que hay y si están ocupadas o no.
	 */
	public void imprimirEstadoParking() {
		
		for(int i = 0; i < 10; i++) {
			for(int j = 0; j < 10; j++) {
				PlazaAparcamiento plaza = plazasAparcamiento[i][j]; 
				String strPlaza = String.format("%3s", Integer.toString(plaza.getNumero())) + " " + ((plaza.isLibre()) ? "L" : "O") + "  "; 
				System.out.print(strPlaza);
			}
			System.out.println();
		}
		System.out.println("");
		
	}

	/*
	 * Método que registra la entrada de un vehículo en el parking.
	 */
	public void registrarEntradaVehiculo(Vehiculo v) {
		
		if (plazasDisponibles > 0) {
			// Asignamos la fecha y hora de entrada
			v.setFechaEntrada(Utils.fechaYHoraAleatoriaAlrededorFechaYHoraActual());
			
			// Colocamos el coche en una plaza de aparcamiento
			// Simularemos que esto se produce de forma aleatoria
			Random r = new Random();
			boolean cocheAparcado;
			int i, j, numPlaza = 0;
			
			do {
				cocheAparcado = false;		
				i = r.nextInt(10);
				j = r.nextInt(10);
				
				if (plazasAparcamiento[i][j].isLibre()) {
					plazasAparcamiento[i][j].setLibre(false);
					cocheAparcado = true;
					numPlaza = plazasAparcamiento[i][j].getNumero();
				}
			} while (!cocheAparcado);
			
			// Añadimos el coche a la lista de coches que tenemos
			// dentro del parking, asignándole el número de plaza que ocupa
			v.setNumPlazaAparcamiento(numPlaza);		
			vehiculos.add(v);
			--plazasDisponibles;
		} else {
			System.out.println("EL PARKING ESTÁ COMPLETO\n");
		}
	}
	/*
	 * Método que registra la salida de un vehículo del parking
	 */
	public void registrarSalidaVehiculo(Vehiculo v) {
		
		if (!vehiculos.contains(v)) {
			System.out.println("ESTE VEHÍCULO NO ESTÁ EN EL PARKING");
			return;
		} else {
			// Rescatamos la instacia de vehículo que tenemos
			// almacenada, ya que es la que tiene registrada
			// la fecha y hora de entrada
			v = vehiculos.get(vehiculos.indexOf(v));
		}
		
		LocalDateTime salida = LocalDateTime.now();
		
		// Asignamos el número de minutos para calcular el importe
		v.setMinutos(Utils.minutosEntreDosFechas(v.getFechaEntrada(), salida));
		
		// Imprimimos el mensaje con el importe del pago
		StringBuilder ticket = new StringBuilder(String.format("TICKET DE SALIDA: %nMatrícula %s %nFecha y hora de llegada: %s "
				+ "%nFecha y hora de salida: %s %nMinutos de estancia: %d%n", 
				v.getMatricula(), 
				v.getFechaEntrada().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)),
				salida.format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)), 
				v.getMinutos()));
		
		if (v instanceof Furgoneta) {
			Furgoneta furgo = (Furgoneta) v;
			ticket.append(String.format("Longitud de la furgoneta %.2f ", furgo.getLongitud()));
		} else if (v instanceof Autobus) {
			Autobus bus = (Autobus) v;
			ticket.append(String.format("Núm. de plazas del autobús: %d " , bus.getNumPlazas()));
		}
		
		ticket.append(String.format("%nImporte total de la estancia: %.2f€ %n%n", v.calcularImporte()));
		
		System.out.printf(ticket.toString());
		
		// Añadimos el importe al saldo acumulado
		saldoAcumulado += v.calcularImporte();
		
		// Identificamos la posición que tenía ocupada el coche para dejarla libre
		int[] coordenadas = Utils.posicionNumeroPlaza(v.getNumPlazaAparcamiento());
		plazasAparcamiento[coordenadas[0]][coordenadas[1]].setLibre(true);
		
		// Eliminamos el vehículo de la lista
		vehiculos.remove(v);
		
		++plazasDisponibles;
	}
}
```

#### Utils

*Utils.java*

```java
/**
 * Clase con métodos auxiliares
 */
package parking.utils;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Random;

/**
 * @author Openwebinars
 *
 */
public class Utils {
	
	/*
	 * Este método nos devuelve una instancia de LocalDateTime aleatoria,
	 * anterior a la fecha y hora actual, pero no muy lejana (en el intervalo
	 * de entre 2 y 6 horas).
	 */
	public static LocalDateTime fechaYHoraAleatoriaAlrededorFechaYHoraActual() {
		Random r = new Random();
		return LocalDateTime.now().minusHours(r.nextInt(4) + 2).minusMinutes(r.nextInt(60)).minusSeconds(r.nextInt(60));		
	}
	
	/*
	 * Nos devuelve la duración en minutos entre dos fechas
	 */
	public static int minutosEntreDosFechas(LocalDateTime anterior, LocalDateTime posterior) {
		// Le sumamos un minuto a posterior, ya que al usar el método between, la fecha
		// más reciente es exclusiva.
		posterior = posterior.plusMinutes(1L);
		// Devolvemos la diferencia entre ambas fechas en minutos
		return (int) ChronoUnit.MINUTES.between(anterior, posterior); 
	}
	
	public static int[] posicionNumeroPlaza(int n) {
		
		int[] result;

		int unidades = n % 10;
		int decenas = n / 10;
		int fila, columna;

		// Este cálculo tenemos que hacerlo por la forma
		// en que hemos "dibujado" las plazas en el parking
		// Si n % 10 == 0 
		//    la decena es impar -> [9][decena-1]
		//    la decena es par -> [0][decena-1]
		// Si no
		//    Si la decena es par 
		//       [unidad-1][decena]
		//    Si no
		//       [10-unidad][decena]
		if (n % 10 == 0) {
			if (decenas % 10 == 1)
				fila = 9;
			else 
				fila = 0;
			columna = decenas - 1;
		} else {
			if (decenas % 2 == 0) 
				fila = unidades -1;
			else
				fila = 10 - unidades;
			columna = decenas;
		}
		
		// devolvemos las posiciones del resultado
		result = new int[]{fila, columna};
		
		return result;
	}
}
```

**SALIDA:**

```sh
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 1

1. Coche o moto
2. Furgoneta
3. Autobús
Introduzca el tipo de vehículo: 1
Introduzca la marca del vehículo: Ford
Introduzca la matrícula del vehículo: 123ABC

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 L   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 1

1. Coche o moto
2. Furgoneta
3. Autobús
Introduzca el tipo de vehículo: 2
Introduzca la marca del vehículo: PickUp Chevrolet
Introduzca la matrícula del vehículo: 898SDR
Introduzca la longitud en metros de la furgoneta (puede incluir decimales): 9

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 1

1. Coche o moto
2. Furgoneta
3. Autobús
Introduzca el tipo de vehículo: 3
Introduzca la marca del vehículo: Mercedes Benz
Introduzca la matrícula del vehículo: 333LPU
Introduzca el número de plazas del autobús: 52

  1 L   20 O   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 3

Hay 97 plazas disponibles 
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 4

  1 L   20 O   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 6

Vehiculo [matricula=123ABC, marca=FORD, fechaEntrada=2020-04-26T17:17:07.800, minutos=0]
Furgoneta [longitud=9.0, matricula=898SDR, marca=PickUp Chevrolet, fechaEntrada=2020-04-26T16:57:28.571, minutos=0]
Autobus [numPlazas=52, matricula=333LPU, marca=Mercedes Benz, fechaEntrada=2020-04-26T19:08:44.591, minutos=0]
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 2


Introduzca la matrícula del veh�culo: 333LPU
TICKET DE SALIDA: 
Matrícula 333LPU 
Fecha y hora de llegada: 26-abr-2020 19:08:44 
Fecha y hora de salida: 26-abr-2020 22:06:45 
Minutos de estancia: 179
Núm. de plazas del autobús: 52 
Importe total de la estancia: 20,16€ 

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 4

  1 L   20 L   21 O   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 5

El saldo acumulado es de 20,16BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 6

Vehiculo [matricula=123ABC, marca=FORD, fechaEntrada=2020-04-26T17:17:07.800, minutos=0]
Furgoneta [longitud=9.0, matricula=898SDR, marca=PickUp Chevrolet, fechaEntrada=2020-04-26T16:57:28.571, minutos=0]
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 2


Introduzca la matrícula del veh�culo: 123ABC
TICKET DE SALIDA: 
Matrícula 123ABC 
Fecha y hora de llegada: 26-abr-2020 17:17:07 
Fecha y hora de salida: 26-abr-2020 22:07:42 
Minutos de estancia: 291

Importe total de la estancia: 11,64€ 

  1 L   20 L   21 L   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 O   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 6

Furgoneta [longitud=9.0, matricula=898SDR, marca=PickUp Chevrolet, fechaEntrada=2020-04-26T16:57:28.571, minutos=0]
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 2


Introduzca la matrícula del veh�culo: 898SDR
TICKET DE SALIDA: 
Matrícula 898SDR 
Fecha y hora de llegada: 26-abr-2020 16:57:28 
Fecha y hora de salida: 26-abr-2020 22:09:14 
Minutos de estancia: 312
Longitud de la furgoneta 9,00 
Importe total de la estancia: 14,28€ 

  1 L   20 L   21 L   40 L   41 L   60 L   61 L   80 L   81 L  100 L  
  2 L   19 L   22 L   39 L   42 L   59 L   62 L   79 L   82 L   99 L  
  3 L   18 L   23 L   38 L   43 L   58 L   63 L   78 L   83 L   98 L  
  4 L   17 L   24 L   37 L   44 L   57 L   64 L   77 L   84 L   97 L  
  5 L   16 L   25 L   36 L   45 L   56 L   65 L   76 L   85 L   96 L  
  6 L   15 L   26 L   35 L   46 L   55 L   66 L   75 L   86 L   95 L  
  7 L   14 L   27 L   34 L   47 L   54 L   67 L   74 L   87 L   94 L  
  8 L   13 L   28 L   33 L   48 L   53 L   68 L   73 L   88 L   93 L  
  9 L   12 L   29 L   32 L   49 L   52 L   69 L   72 L   89 L   92 L  
 10 L   11 L   30 L   31 L   50 L   51 L   70 L   71 L   90 L   91 L  

BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 3

Hay 100 plazas disponibles 
BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 5

El saldo acumulado es de 46,08BIENVENIDO AL PARKING CORONAVIRUS
==================================

0. Salir del programa
1. Registrar la entrada de un vehículo
2. Registrar la salida de un vehículo
3. Número de plazas disponibles
4. Imprimir estado del parking
5. Saldo acumulado del día
6. Imprimir la lista de vehiculos que hay en el parking
Introduzca la opción seleccionada: 0

Introduzca una opción correcta
```

## Contenido adicional 6   

[Manipulación de datos con Stringbuilder](pdfs/30_StringBuilder.pdf)

[Manejo de fechas](pdfs/31_Manejo_de_fechas.pdf)

[Colecciones ArrayList](pdfs/32_Arraylist.pdf)

[Introducción a las expresiones lambda](pdfs/33_ExpresionesLambda.pdf)

[Proyecto_Final.pptx](otros/Proyecto_Final.pptx)

[Gráfico.xlsx](otros/Gráfico.xlsx)
