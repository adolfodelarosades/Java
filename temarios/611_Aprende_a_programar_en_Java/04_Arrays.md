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
<img src="images/18-05.png">

Consideraciones que tenemos que tener en cuenta cuando vamos a trabajar con una raíz pues como cualquier variable se puede declarar o bien como tributo al principio de la clase o bien como una variable local dentro de un método si se declara como tipo atributo implícitamente una es inicializar.

No es una palabra reservada de Java que la utilizaremos por objetos representa el objeto nulo igual que en una variable de tipo entero.

Si inicialmente se asigna el valor cero clausurarse un atributo claro porque las variables locales no se inicializar implícitamente recordaras.

En el caso de la variable de tipo objeto y como digo una red es un tipo de objeto pues quería saborear un inicializar al valor.

Evidentemente si es local esa variable no es inicializar a nada.

Ya sabemos que las variables locales hay que asignarles algo antes de ser utilizadas bien cuando creamos una raíz es decir hacemos lo del New y metemos el Rey dentro de la variable independientemente de que sea atributo o sea una variable local todos sus elementos se van inicializar implícitamente es decir por ejemplo en este caso cuando yo hago nio i10 ya estoy asignando un cero a cada una de las posiciones de ese datos independientemente de que esta variable sea un atributo o sea una variable local por ultimo comentarte que podemos también trabajar aunque no es habitual porque no se utilizan demasiado con arrays de varias dimensiones es decir nosotros nos imaginamos una raíz como los que hemos visto antes como una fila de lo que te decía antes un conjunto de cajitas una detrás de otra.

Pero podemos tener a raíz de dos dimensiones que podemos imaginar como una especie de tabla de datos de repartidas en filas y columnas por ejemplo.

En este ejemplo que tienes aquí es que como utilizaríamos una raíz de dos dimensiones Arraya enteros tipo int corchete cierre corchete otra vez corchete cierre corchete y nombre la variable se hace la apertura cierre corchete tantas veces como dimensiones indica el compilador que se trata de dos dimensiones a la hora de crear el array.

Hay que indicar después del Gniewino el tipo de datos pues tanto la dimensión del tamaño de la primera dimensión como de la segunda es decir si nos imaginamos una red dos dimensiones como una tabla pues el primer número representaría por ejemplo en las filas de esa tabla y el segundo las columnas de modo que una raíz 10 4.

Como en este caso sería realmente una raíz de 10 por cuatro elementos 40 elementos.

Para acceder a cada una de las posiciones evidentemente tenemos que utilizar dos índices para la primera dimensión y para la segunda dimensión.

En la siguiente elección vamos a ver cómo utilizar una raíz directamente desde un programa para recorrerlo de cara a almacenar información y ejecutar un grupo de instrucciones que se ejecuten con cada una de las posiciones del array.

Y también para la lectura de la información que es para lo que más vamos a utilizar dentro de un foro dentro de una red.

# 19 Recorrido de un array 05:34

En la lección anterior hemos estudiado que son los Arráiz.

Vamos a ver cómo recorrer el contenido de una Reith utilizando una instrucción for bien.

En primer lugar vamos a hablar de un atributo que exponen todos los objetos Rey sean del tipo que sean llamado Lent que significa que exponen un atributo bueno los Arráiz son objetos entonces disponen de propiedades o atributos que es como les llamamos habitualmente en Java.

Disponen de métodos funciones pero en el caso de los arrays lo que nos interesa es uno de esos atributos concretamente el que nos va a decir en todo momento cuál es la longitud de una raíz hay que tener en cuenta que una red es una estructura de datos estática.

Una vez que lo creamos le damos un contenido a un tamaño pues ese tamaño no puede ser modificado entonces si el array está siendo tratado en muchas partes del programa es posible que en algún momento nos sepamos exactamente qué tamaño va a tener o qué tamaño tiene porque no sabemos o desconocemos en una parte del código.

En qué momento se habrá creado y qué tamaño se ha entonces si en algún momento necesitamos conocerlo sabemos que a través del atributo Lent utilizando la expresión para verás en el siguiente ejemplo variable Array punto Lens puedes saber cuántos elementos tiene eso qué significa.

Pues lo vemos aquí que si yo quiero recorrer el contenido de una raíz para hacer algo con él pues almacenar información en cada una de sus posiciones o como comúnmente se hace para leer el valor de cada una de esas posiciones podemos utilizar esta estructura que estás viendo aquí.

Y es que como decimos si una raíz todos los Array sean del tipo que sea comienzan en la posición cero la última será la menos 1.

Entonces si nosotros planteamos un foro cuya variable de control empieza en cero y llegue hasta la condición y menor que datos punto Lentz significará que va a ir pasando por todos los números desde cero justo a longitud menos 1 usando ese número esa variable de control podemos acceder a la posición del array lo que va a hacer que este bucle haga lo que tiene que hacer en este caso por ejemplo es multiplicar la variable control por dos es decir ir calculando los números pares entre cero en adelante y almacenarlos en cada posición de la red.

Pues claro la primera vez que entramos accederemos a la posición cero la siguiente sala 1 con la variable acuerdate y el incremento que se incrementa al ejecutar al final de bloque instrucciones del Forth y así hasta la última posición porque la condición de salida es que sea menor que la longitud de la red.

En este caso como digo pues eso vamos almacenando los diez primeros números pares otro ejemplo que en este caso lo que hacemos es leer recuperar.

Si queremos recuperar todo el contenido de la raíz todas las posiciones una por una desde la primera hasta la última volvemos a plantear el mismo foro desde la posición cero que sería la del primero hasta en menos uno o lo que es lo mismo mientras la condición sea que sea menor que la longitud.

En ese caso como pues estamos con la variable de control accediendo a cada una de esas posiciones de la red y mostrando sus datos por su contenido por pantalla.

Existe una forma de recorrer también el rey sin utilizar índices con lo que una instrucción conocida como Feith es una variante del foro que no te la conté en el momento cuando vimos la sesión de control porque se especifica de raíz y también de colecciones que es otra estructura de datos un poquito más compleja.

Bueno en el caso de los arrays existe una variante como decía el foro que se llama Furyk que nos permite recorrer el contenido de una raíz siempre de lectura muy importante eso siempre lectura sin necesidad de índices.

Cómo funciona esto.

Aquí la tiene esta variante del foro no hay tres instrucciones como en el foro clásico sino solamente una declaremos una variable de control dos puntos en la raíz que vamos a recorrer.

No tenemos que indicar nada más esto cómo se interpreta como se interpreta que para cada elemento del array.

Por eso se llama la llamamos habitualmente for each.

A pesar de que el nombre de la instrucción realmente effort pues para cada uno de los segmentos de la RAI hacer esto.

Esta variable no es un índice es una variable del tipo de dato de la red.

Si tenemos una red de tipo entero la variable n que declaramos aquí el tipo entero y lo que hace esa variable es ir.

Como ves aquí en esta imagen apuntando a cada una de las posiciones de la red es decir repito no es 1 no representa un índice es una variable que va a ir adquiriendo cada uno de los valores de la red.

Por lo tanto cuando hacemos referencia n en el interior del foro nos estamos refiriendo al contenido de esa posición la posición actual ya se encargaba de ir cogiendo esa variable e ir apuntándoles a cada uno de los elementos de la red sin que nosotros le digamos dónde hay que empezar o dónde hay que terminar.

Es una instrucción que encontramos en el lenguaje Java desde la versión Java 5 última versión que tenemos ahora Java 8 próximos Java 9 y ya son bastantes años la que con la que contamos con esta instrucción.

Y como digo pues si no necesitas el índice para nada resulta bastante más copra.

# 20 Ejercicio práctico VII 09:12

Muy bien vamos a realizar un par de ejercicios donde pongamos en práctica el uso de los arrays en Java.

En este primer ejercicio dentro de la lección 20 pues vamos a realizar un programa en el que a partir de una raíz que tiene almacenado 10 números enteros cualquiera pues se nos va a mostrar en pantalla la media de esos valores almacenados así como también su valor máximo.

Bueno pues vamos como siempre a nuestro entorno de desarrollo Eclipse y vamos a crear el ejercicio práctico.

Vamos a ver es el ejercicio práctico número 7 que corresponde con el proyecto 8 que llevamos ya varios ejercicios práctico.

7 directamente finalizamos cuando esté creado el proyecto creamos la clase principal que llamamos así porque tiene el método Meine el punto de entrada a cualquier programa Java recuerda.

Y bueno hasta ahora estamos creando todos los programas que hemos hecho hasta ahora.

Ya verás un poquito más adelante después de que veamos los ejercicios de Arráiz cómo empezaremos a crear ya programas con más de una clase.

Bueno vamos a lo que vamos entonces vamos a crear aquí os cálculos Jarrai vale método main y bueno lo primero que vamos a hacer es declarar las variables donde vamos a almacenar los resultados medio aunque los números van a ser enteros y la media vamos a almacenar números enteros.

Realmente podríamos utilizar un tipo doble para que almacenarse y contarse también los posibles valores decimales que tuviera esa media.

Pero bueno como eso ahora mismo tampoco es lo importante vamos a dejar como entero la bolsa inicializar al valor cero y también el valor máximo.

Vale que lo vamos a inicializar.

Bueno eso lo vamos a ver después a que vamos a inicializar desafiarle el array va a ser un array de hemos dicho 10 elementos datos diez elementos cualesquiera.

Pues bien vamos a meter ahí unos cuantos números 9 3 7 11 cuando llevamos ya 1 2 3 4 5 6 7 8 9 1 más el 14 que pues aquí ya tenemos declarar las variables y en el caso del array también asignado los valores con los que vamos a partir vale números cualquiera aquí repetido el 4 da igual vamos.

Aquí no hay ningún problema pero bueno vamos que te sean valores diferentes.

Qué valor inicializar la variable más que es la que va a contener el valor máximo de todos.

Bueno pues durante el recorrido la lo vamos a ir calculando pero para ello tenemos que darle un valor inicial que no sabemos cuál va a ser el mínimo número que tenemos en el array ni el máximo número a alcanzar con cualquier valor entero pues lo vamos a inicializar al primero de los elementos de la red con datos de cero y eso nos garantiza que.

Bueno pues la búsqueda del máximo pues si da la casualidad de que el máximo es el primero pues ese sería el primero que vamos a Máximo o que vamos a tener pero si nos encontramos alguno mayor pues conseguiremos sustituirlo pero nunca vamos a tener un máximo que no esté dentro de este conjunto de valores eso lo garantiza el inicializar con el primero de ellos exmandatarios o con cualquiera.

Realmente lo podríamos haber inicializar esa variante.

Bueno pues vamos a recorrer la red tenemos dos opciones o los recorrer lo recorremos dos veces en cada recorrido hacemos uno recorrido para la media y luego lo volvemos a recorrer para calcular el máximo o lo más eficiente sería el mismo recorrido Larrieu o hacer los cálculos.

Las dos operaciones ir calculando la media oficial en cada momento y el máximo parcial que vayamos encontrando lo vamos a recorrer como Zurich qué es lo que normalmente deberíamos utilizar para el recorrido de una raíz.

Cuando vamos a leer su contenido recuerda que en un Furyk la variable de control no es un índice sino que es una variable que va a ir apuntando a cada uno de los elementos de la raíz.

Es decir esa variable ni en cada iteración cada pasada que va a ser 10 aunque ahí no aparezca el número 10 en ningún sitio pero es el tamaño del array pues en cada pasada como digo va a ir apuntando a cada una de las posiciones.

Entonces para la media pues lo primero que hacemos es ir acumulando los valores del array que vamos encontrando dentro de la variable media es decir sería media es igual a media más en insisto en es cada uno de los elementos de la red.

No es una variable Contador ni nada de eso.

Y para el máximo lo que hacemos es la siguiente pregunta si resulta que el elemento que estamos recorriendo en ese elemento en ese momento es mayor que el máximo parcial que llevamos acumulado pues entonces lo que hay que hacer es actualizar esa variable más con ese número encontrado.

Pues eso nos garantiza que al terminar de ejecutar el foro en la variable más tenemos el mayor de todos los que pudiera haber en ese Array mientras que en media tenemos la suma de todos los elementos de la red.

Pero claro la media es la suma dividido por el total con lo cual nos falta hacer una operación ya después del foro importante que no es dentro sino al final cuando hayamos acabado que es divide el contenido de media entre el total y vuelven a almacenar la variable medida.

Cómo era podemos saber el total de elementos que hay en un array.

No hace falta que lo contemos simplemente sabemos que hay un atributo público dentro de todo Array que se llama Lentz que nos garantiza en cada momento que se consulte ese atributo. 

La información del total de elementos que tenemos ahora ya simplemente mostramos el resultado o sistema Uprimny LN

La media es más Mecca y otros mensajes de un punto primo Elene el mayor es más máx.

Todos vamos a probarlo a ver qué es lo que sale.

Obviamente para calcular la media habría que hacer la operación pero bueno vamos a ver si el valor no es descabellado pues evidentemente el que lo estamos haciendo bien y el máximo fácilmente lo podemos ver aquí que debería darnos el número 23 vamos a ejecutarlo a la aplicación pide que guardemos los cambios y la media nueve que serán nueve coma algo seguramente pero como lo hemos almacenado el resultado es una variable tipo Win la división entre dos números enteros es siempre un entero.

Si el resultado es decimal se desprecia la cifra decimal da igual que hubiéramos declarado la variable media si lo hubiéramos puesto como doble pues como aquí sería una división doble entre enteros entonces sí sí tendríamos vale.

Porque uno de los elementos de la operación es doble entonces el resultado sí que sería bueno.

Lo hemos hecho así como entero ahora si lo cambiamos para que números y el mayor respectivamente 23 vamos a cambiar lo vamos a poner la variable media como tipo doble.

Entonces al ejecutarlo ya nos daría la medida exacta

9.7 como en la siguiente elección vamos a realizar otro ejercicio de raíz y ahí lo que vamos ya es por primera vez a utilizar operaciones de entrada de datos es decir en vez de como hemos hecho hasta ahora trabajando siempre con datos introducidos previamente en variables dentro del propio programa podemos hacer algo más interactivo que el usuario pueda introducir datos del exterior.

Por eso te recomiendo que la siguiente elección leas el documento que tenemos dentro de la sección de material adicional que explica el funcionamiento de la clase Escanes que es una de las que se dejaba estándar porque hay otras opciones pero quizás la más sencilla para lectura de datos porque claro antes de hacer el ejercicio le.


# 21 Ejercicio práctico VIII 09:49   

Vamos a continuación a hacer nuestro segundo ejercicio de raíz.

Para ello deberías leerte el documento de lectura de datos por teclado que tenemos en la sección de material adicional dentro de esta lección ya que en este ejemplo vamos a ver el enunciado vamos a hacer un programa en el que se van a leer por el teclado la introducción de diez números el usuario del programa tendrá que introducir diez números uno detrás de otros y le seguirá pidiendo y lo que va a hacer nuestro programa es ordenar los números y presentarlos ordenados de mayor a menor o de menor a mayor eso ya como queramos en este caso vamos a hacerlo de mayor o menor.

Una particularidad del ejercicio es que si se introduce un número negativo mientras el usuario está solicitando esos números el programa le dirá que es erróneo que vuelva de nuevo a intentarlo.

Así hasta conseguir diez números positivos.

Bien pues nada vamos a ello aquí tenemos un entorno de desarrollo Eclipse donde yo ya tengo creado el proyecto número 9 para el ejercicio práctico 8 donde tenemos ya todo preparado para empezar a programar.

De hecho este programa es un poquito más largo pues ya lo tengo yo hecho y vamos a ir pegando partes para ir analizándolas y explicando bien.

En primer lugar lo que vamos a hacer es todo el tema de la declaración de variables y creación del objeto escáner que nos va a servir para realizar la lectura porque claro como te explicamos en el ejercicio creación de un escáner para leer por teclado es recurrir a esta instrucción donde en el escáner le pasa como parámetro por lo que llamaríamos el canal de entrada de datos.

Creamos el objeto escáner y ya lo tenemos listo para leer cómo tenemos que ordenar los números.

Una vez que se ha leído pues tenemos que guardarlos en algún sitio donde en una red de 10 elementos tenemos aquí un par de variables más declaradas una donde vamos a ir guardando el número leído y otra es una variable auxiliar que utilizaremos para la ordenación.

Bueno aquí hay un error que habrá de usar la clase escáner que es lo que pasa porque esa es una clase de Java estándar que se encuentra en un determinado paquete del Java estándar los paquetes Java se utilizan para organizar clases igual que los directorios los utilizamos para organizar archivos.

Los paquetes se usan para organizar las clases entonces Java estándar.

Todas las clases están en sus correspondientes paquetes para que el compilador reconozca esta clase que vamos a usar nosotros.

Hay que importarla con una instrucción aquí que la podemos escribir pero vamos a hacer que lo haga eclipse por nosotros.

Si presionas la combinación de teclas Control Shift o automáticamente te pone Eclipse la sentencia de importación no puedes escribir a mano impor Java punto útil que es el paquete y su paquete puntos Kanner que la clase esta instrucción debe ir siempre delante de la declaración de la clase.

La primera instrucción del archivo o Primera Segunda porque puede haber varios IMPO puede que utilicemos la verdad según vayas haciendo programas cada vez más complejo pues se utilizarán muchas clases entonces habrá que importarlas todas.

Bueno de hecho eso repito la combinación de teclas Control Shift de las mayúsculas o y si no lo puedes escribir a mano.

Una vez que hemos declarado las variables pues bueno vamos a empezar ya con lo que es el código como tal la lógica del programa.

Entonces vamos a ver vamos a pegar esta parte que sería la que se encarga de la solicitud de números por teclado vamos a ver aquí lo tenemos que solicitar la introducción de 10 números positivos entonces vamos a crear Infor de cero hasta al menos uno porque cada número positivo en una posición del array. 

Aquí como estamos utilizando el foro para recorrer el array para escribir obviamente es normal.

Solicitamos el número mandamos el mensaje y el método Next-Gen como te explicamos en ese documento es el que realiza la lectura del dato es decir queda dejar el programa digamos bloqueado a la espera de que el usuario introduzca el número y pulsa Intro en ese momento método función devuelve un resultado que se guarda en esta variable.

Qué pasa si el número es negativo o es que no hay que guardarlo en el array.

Hay que volver a pedir otro número y así si vuelvo a meter otro negativo después del primer negativo pues así hasta que metan uno positivo tenemos un caso claro de utilización de la instrucción repetitiva guey es decir mientras el número sea menor que cero volvemos a sacar un mensaje.

En este caso uno de advertencia el número positivo vuelve a introducir y se le cómo es un buen volver a comprobar que es negativo otra vez lo mismo.

Y así hasta que por fin introduzco un positivo y entonces sigue adelante el programa siga adelante que es el número que se leyó ya por fin positivo se guarda en esa posición y vale.

Puede ser que para conseguir un número positivo hayamos tenido que leer 20 números porque ha metido 19 negativos.

Al final se ha leído el número positivo.

La variable sigue apuntando a esa posición.

No se ha enterado y ya al finalizar el foro vuelve a incrementarse la variable y pasamos para la lectura del segundo número positivo y por lo tanto almacenamiento.

En la segunda posición de la RAE y así hasta 10 min.

Con esto garantizamos tener los números ya positivos leídos dentro de la red.

Ahora vamos a la ordenación vamos a ver tenemos aquí el programa y ya también podemos poner la parte última de mostrar el contenido de dicho rey en pantalla que es bastante sensible.

La ordenación.

Digamos que es lo llamativo de este programa aparte de lo que es ya la lectura de números que la primera vez que lo hacemos porque claro pero bueno la ordenación emplea lo que se llama el método de la burbuja que consiste en que para cada elemento del array vamos comprobando ese elemento con los siguientes y si nos encontramos uno en esos siguientes menor o mayor depende de cómo queramos hacer la ordenación de mayor o menor o de menor a mayor.

En este caso lo queremos hacer una ordenación de mayor a menor.

Entonces si nos encontramos un número lossiguientes mayor que ese número se hace una sustitución. 

Estas tres instituciones que tenemos aquí para hacer una sustitución la sustitución es meter en la posición y lo que hay en casa y lo que ahí había y entonces eso requiere utilizar una variable auxiliar que habíamos declarado que antes guardamos el contenido de la posición y en esa variable auxiliar para digamos sobreescribir el contenido de la posición y con lo que hoy en día y como ayer lo teníamos Salvado lo anterior y en HAWX lo volcamos en la posición.

Es decir es un intercambio una sustitución o no intercambio que ya tenemos hecho el intercambio y entonces haciendo eso con cada elemento de la raíz para cada uno de subsiguientes nos garantiza la ordenación según el criterio que hemos establecido en este caso de mayor a menor.

Si fuera de menor a mayor pues habría que hacer la pregunta al contrario lógicamente una vez que ya se ha ordenado ves que aquí como dependemos de los índices de las posiciones tenemos que utilizar estándares aunque sean operaciones de lectura buena también son de escritura porque vamos a acceder a las posiciones obviamente entonces aquí tenemos que utilizar el estándar pero ya para lo que es mostrar el contenido ya tenemos el argayo ordenado y queremos simplemente mostrar lo que tiene un Follies es la variable de control apuntaría a cada uno de los valores de la red y números y los mostraría separando por una.

Vamos a probarlo vamos a ejecutar el programa y empezamos introduce un número metemos el 5 por ejemplo introduce un número.

Ahora vamos a forzar una equivocación en menos tres que no es positivo.

Vuelvo a intentarlo Bueno pues resulta que vuelvo a meter mi voto otro negativo que no es positivo que volvemos a intentarlo ya por fin le damos el 7 o salga el siguiente mensaje de introducir otro número más nueve.

Ya hemos visto que lo de la equivocación está controlado vamos a ir metiendo ya positivos 8 por ejemplo los que llevamos 3 y ya por fin los números son como ordenados de mayor a menor el mayor que metimos por aquí fue 44 después el 18 11 9 y se ha repetido pues el orden es indiferente evidentemente.

Bueno pues aquí ha visto un ejercicio donde se combinan ya un poquito de todo.

Pues instrucciones repetitivas de tipo for Weyl uso de raíz además una operación muy clásica de la RAE y la primera es que a lo mejor puede resultar poco compleja que es el tema de la ordenación pero bueno nosotros siempre siempre es así con Foro admirados aplicando la metodología que te he dicho instrucciones tan alternativas lógicamente frizz.

Y bueno esta novedad de la lectura de datos con teclado que ya hace que los programas sean más interactivos.

Esto ya lo utilizaremos en el resto de ejercicios prácticos que hagamos más adelante.
