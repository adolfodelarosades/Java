# 5. Java Stream API 106m

   * 16 Introducción al API Stream 16:04 
   * 17 Métodos de búsqueda de datos 6:27 
   * 18 Métodos de datos, cálculo y ordenación 10:25 
   * 19 Uso de Map y flapMap 12:04 
   * 19 Uso de la clase Collector 19:28 
   * 20 Uso de streams y filtros 8:27 
   * 21 Referencias a métodos con stream 10:55 
   * 22 Práctica: Todos los elementos del API stream trabajando conjuntamente 22:25 
   * Contenido adicional 7
   
# 16 Introducción al API Stream 16:04 

[Introducción al API Stream](pdfs/16_Introducción_al_API_Stream.pdf)

## Resumen del Profesor

### 16.1 Introducción

El API Stream es una de las grandes novedades de Java SE 8, junto con las expresiones lambda. Permite realizar operaciones de filtro/mapeo/reducción sobre colecciones de datos, de forma secuencial o paralela.

Un Stream es una secuencia de elementos que soporta operaciones para procesarlos

* Usando expresiones lambda

* Permitiendo el encadenamiento de operaciones (para producir así un código que se lee mucho mejor y es más conciso)

* De forma secuencial o paralela

En Java, los streams vienen definidos por el interfaz `java.util.stream.Stream<T>`.

### 16.2 Características de un Stream

* Las operaciones intermedias retornan un Stream (permitiendo así el encadenamiento de llamadas a métodos).
* Las operaciones intermedias se encolan, y son invocadas al invocar una operación terminal.
* Solo se puede recorrer una vez; si lo intentamos recorrer una segunda vez, provocará una excepción.
* Utiliza iteración interna en lugar de iteración externa; así nos centramos en qué hacer con los datos, no en como recorrerlos.

### 16.3 Algunos subtipos de streams

En el caso de que vayamos a utilizar un stream de tipos básicos (`int`, `long` y `double`), Java nos proporciona las interfaces `IntStream`, `LongStream` y `DoubleStream`.

### 16.4 Formas de obtener un stream

* `Stream.of(...)`: retorna un stream secuencial y ordenado de los parámetros que se le pasan.
* `Arrays.streams(T[] t)`: retorna un stream secuencial a partir del array proporcionado. Si el array es de tipo básico, se retorna un subtipo de `Stream`.
* `Stream.empty()`: retorna un stream vacío.
* `Stream.iterate(T, UnaryOperator<T>)`: devuelve un stream infinito, ordenado y secuencial. Lo hace a partir de un valor y de aplicar una función a ese valor. Se puede limitar el tamaño con `limit(long)`.
* `Collection.stream()` y `Collection.parallelStream()`: devuelve un stream (secuencial o paralelo) a partir de una colección.
* `Collection.generate`: retorna un stream infinito, secuencial y no ordenado a partir de una instancia de `Supplier` (o su correspondiente expresión lambda).

### 16.5 Operaciones intermedias

Son operaciones que devuelven un `Stream`, y por tanto, permiten encadenar llamadas a métodos. Sirven, entre otras funcionalidades, para filtrar y transformar los datos.

#### 16.5.1 Operaciones de filtrado

* `filter(Predicate<T>)`: nos permite filtrar usando una condición.
* `limit(n)`: nos permite obtener los n primeros elementos.
* `skip(m)`: nos permite *obviar* los m primeros elementos.

#### 16.5.2 Operaciones de mapeo

* `map(Function<T,R>)`: nos permite transformar los valores de un stream a través de una expresión lambda o una instancia de `Function`.
* `mapToInt(...)`, `mapToDouble(...)` y `mapToLong(...)` nos permite transformar a tipos básicos, obteniendo `IntStream`, `DoubleStream` o `LongStream`, respectivamente.

### 16.6 Operaciones terminales

Provocan que se ejecuten todas las operaciones intermedias. Las hay de varios tipos:

* Para consumir los elementos (por ejemplo, `forEach`)
* Para obtener datos de un stram (agregación)
* Para recolectar los elementos y transformarlos en otro objeto, como una colección.

## Transcripción

<img src="images/16-01.png">
<img src="images/16-02.png">
<img src="images/16-03.png">
<img src="images/16-04.png">
<img src="images/16-05.png">
<img src="images/16-06.png">
<img src="images/16-07.png">
<img src="images/16-08.png">
<img src="images/16-09.png">
<img src="images/16-10.png">
<img src="images/16-11.png">
<img src="images/16-12.png">

Vamos a comenzar con un nuevo bloque podríamos decir de alguna manera que va a ser el bloque nuclear del curso porque además va a impregnar todo lo que veamos adelante la gran novedad junto con la expresión Irlanda de la versión 8 de Java y la verdad es que pretenden cambiarnos un poco el esquema de cómo programar orientándonos a realizar un código de bono pista en ocasiones bastante del código clásico al que estamos acostumbrados nos va a permitir trabajar con colecciones de información como si fueran secuencias de datos de manera que podremos hacer muy fácilmente operaciones de filtrado mapeo otra formación y reducción sobre esas colecciones de edad otra gran novedad es que a través de Fort Joy vale desde un marco de trabajo que también ofrece Java desde hace alguna persona no va a permitir también trabajar con extreme paralelos vale lo que van a ejecutarse en los diferentes y que puede que nos aporten cierta velocidad y el número de elementos a protestar es grande o nos permitirá trabajar de forma secuencial bueno pues sobre 1 y después el siguiente y el siguiente y el siguiente cómo podremos comprobar todas estas operaciones son transparente al programador es decir que van a pasar en alguna ocasiones casi desapercibidas para nosotros todo lo que va sucediendo por allí dentro y son una combinación perfecta con la interfaz de funcionales y por ende con las expresiones lambda un string como elemento fundamental de este API es una secuencia de elementos que soporta una serie de operaciones para procesar como elementos característicos podríamos decir que permite el uso de expresiones lambda que permite el encadenamiento de operaciones el perfil tendremos operaciones intermedias que retornarán siempre un string con lo cual podremos encadenar la llamada a método y que por ende vamos a producir código que sea muy legible vale bastante legible y mucho más conciso que se lo intentaremos además haciendo código comparativos decir código que no utiliza este código que si lo utiliza y comparar y además permite el procesamiento de los elementos de forma secuencial o para cenar cómo características de un string podríamos decir que la operaciones intermedias no retorna para hacer este encadenamiento además la operación es que se conocen como intermedia se van a encolar de forma que no se invocan hasta que no se invoca una operación de las conocidas como finales o terminales solamente se va a poder recorrer una vez es decir si queremos volver a recorrer los tenemos que volver a crear el tren y no ofrece el concepto de interacción interna frente a la iteración externa M-100 a la hora de integrar frente al ejemplo que hacíamos de interacción en las clases internas nosotros nos vamos a centrar en qué hacer con los datos y no en cómo se recoge no tenemos que indicar cómo se van a recorrer de eso se va a encargar el propio para trabajar con tipo de datos primitivos hemos visto antes que teníamos un interfaz genérico para stream ETT para trabajar con tipo de datos primitivos vamos a tener algunos subtipos básicos como son Quintín los Teen Titans go en streaming que no están parametrizado y qué sirven para trabajar con tipos de datos vamos a comenzar viendo las diferentes maneras quejaban ofreces de obtener un script que no son pocas la primera sería un interfaz perdón en el método de la interfaz stream que nos permite de una secuencia de elementos de un parar que va a recibir obtener un estrés vale que nos serviría para obtener un excelente de una serie de elementos conocidos vale un stream finito también podemos obtener un string a partir del método trim de la clase Array o método estático que va a recibir un array y nos va a devolver con los elementos de ese array con string secuencial si las rayas de tipo básico por ejemplo un array de int el método string devuelve intrinsic fuera de León o de doble de los tipos correspondientes aunque parezca extraño en ocasiones podremos querer obtener un screen vacío para ello tenemos el método de estático en ti que nos devolvería un string vacío vale sin ningún elemento otros métodos sería a partir del método iterate de la clase stream esté en este caso vale obtendríamos un string en principio sería infinito ordenado y secuencial qué bueno nos permite partir de un valor concreto y aplicar una función de normalmente de incremento o decremento sobre ese valor vale para obtener los elementos de Street lo normal es que limitemos el tamaño con el método limit vale que bueno que limita a un número máximo en el string infinito todos los elementos de la interfaz collection todos los perdón no los subtipos de colección por ejemplo ser las colecciones de tipo más también tienen un método en principio y otro para él el que nos devuelven un stream bien paralelo o bien secuencial con los elementos de esta colección también tenemos por último el método general te que acepta un supplier y que nos devolvería un string a partir de un supplier vale construyéndolo con Yolanda o una clase que implementará esta interfaz funcional como vemos tenemos una amplia gama de posibilidades para obtener un extreme nosotros casi siempre trabajaremos con los streams que nos proporcionen una determinada colección los string como hemos visto antes soporta operaciones intermedias operaciones terminal la intermedia son operaciones que afectan a un sprint pero que a su vez devuelven Electric vamos a ver algunas cómo son las de filtrado y Mateo la de filtrado que trabajaremos ampliamente en un vídeo nos permite filtrar los elementos de un string utilizando una condición que se proporciona como un predicado también tenemos la posibilidad de limitar un string a los n primeros elementos o de obviar los m primero elementos con el método key como otro tipo de operaciones intermedia también tenemos la operación este mapeo la principal operación de Mateo que tenemos es más que nos permite recibir una función y que te la formaría los valores de un string cada uno de los valores de un tipo en otro vale lo hemos comprobado en el ejemplo de la interfaz de la interfaz funcional con quién tenemos tipos también a valores básicos como son más Twins doble tú lo que nos permite transformar el valor que se recibe en datos básicos y que en lugar de bueno hemos dicho que la operación es intermedia retornan también un string en este caso cambiaría en el tipo de String a uno de los extremos de tipo básico cómo ir doble o no respectivamente aquí a un conjunto de operaciones intermedias que son de las manos por lo menos de las que inicialmente se utiliza por último por conocer algo sobre las operaciones terminales decir que como comentábamos anteriormente son las que provocan en primera instancia que se ejecuten todas esas operaciones intermedias que tenemos en Coslada podemos ver que son de varios tipos el primero es el consumo de los elementos el ejemplo más claro de oír el obtener los datos del stream de alguna otra forma o recolectar los elementos del Extreme para transformarlos en otro como una colección transformarlos en otro como una colección la de obtener los datos del stream y la de recolectarlos pues no estudiaremos en lecciones posteriores dentro de este bloque de la cistitis seamos algún ejemplo de todo esto que hemos ido comentando vamos a ver en particular 4 ejemplos en primer lugar de Amos la creación de Scream cómo lo podemos realizar con dicho que tenemos bastante formas si tenemos alguna de ella podríamos crear un stream de una serie de elementos aquí por ejemplo de 10 números el tipo podríamos tener un string a partir de un array vale en particular alquila estamos pasando un array también del uno al 10 y obtendríamos un string recordad que al llamar al método Scream de la clase arrays y esto era de un tipo básico que pudiera ser correspondido con un stream de los subtipos que ya hemos visto pues tendríamos el correspondiente en este caso entre vale que comenzaría en infinito inicialmente pero limitado a 100 elementos vale un string a partir de una colección fijado que utilizamos el método más listo de la clase Array para obtener una colección en este caso un lifting y del cual podríamos tener pues en este caso no tendría mucho sentido para tampoco elementos pero un stream paralelo o por ejemplo aquí podríamos tener un stream con generates vale utilizando podríamos crear un screen infinito utilizando una función generadora no que en este caso por ejemplo sería la función next in the random vale múltiples maneras diferentes de obtener Street por ejemplo si quisiéramos filtrar una serie de capitales que tenemos aquí utilizando el mecanismo de filtrado vale así parece que es más legible vamos a resumir en una línea con el formato automático recordad que podéis formatear para qué sirven te viene el código y seco lo que viene con control mayúscula bueno podríamos tener aquí un screen de las capitales que tienen sé cómo podemos comprobar filter lo que hace devolver un script vale y podríamos tener todas las capitales que tuvieron la letra C mediante esta expresión Landa vale conociste en el caso por ejemplo si quisiéramos obtener las capitales sin repetir podríamos llamar al método cistin que nos devuelve los elementos de un screen pero sin repetido en este caso operando sobre las capitales repetida stream tendría solamente a Sevilla y a Huelva Sevilla una sola vez si queremos tener un sprint limitado en el número de elementos de las capitales podrían obtener las primeras 5 Jaén Córdoba Sevilla Huelva y Cádiz y en el caso de que quisiéramos copiarlas 4000 me da lo que haría sería devolvernos todas las capitales a partir de qué haces vale Málaga Granada y Almería sobre capitales serían por ejemplo la operaciones de Mateo aquí en este caso también estamos haciendo uso de la referencia a funciones que conoceremos en otro sitio más adelante aquí estaríamos teniendo un string con las capitales en mayúsculas vale de manera que estaríamos protestando cada una de las capitales para mediante el método to uppercase obtener la Emma y en este caso por ejemplo podríamos utilizar el McQueen para calcular la longitud de la cada una de la cadena de caracteres que conforman el stream y guardarlo en un string de los que presentamos por último como operaciones terminales tenemos el método o incluso el metodo foreach order nos permitirían consumir los elementos de una p perdón los elementos de un string bueno y aquí tenemos alguno de los que hemos hecho con anterioridad para imprimirlo mediante mediante el un consumidor con folios no como operación terminal vale que tenemos por aquí en todos podemos comprobar como se imprimiría las capitales que empiezan por C las capitales sin repetir que teníamos aquí las 5 primeras capitales de Andalucía últimas capitales de Andalucía en función del orden del string mayúsculas la longitud de las capitales y aquí lo haríamos mapeando vale mediante 100 formas no solamente la longitud sino que obtendríamos el nombre de la capital la longitud indicando la palabra caracteres forma hemos presentado el API string ahora lo vamos a ir conociendo en profundidad vamos a comenzar con algunos métodos de búsqueda de datos

# 17 Métodos de búsqueda de datos 6:27 

[Métodos de búsqueda de datos](pdfs/17_Métodos_de_búsqueda_de_datos.pdf)

## Resumen del Profesor

### 17.1 Métodos de búsqueda

Son un tipo de operaciones terminales sobre un stream, que nos permiten:

* Identificar si hay elementos que cumplen una determinada condición

* Obtener (si el stream contiene alguno) determinados elementos en particular.

Algunos de los métodos de búsqueda son:

* `allMatch(Predicate<T>)`: verifica si todos los elementos de un stream satisfacen un predicado.
* `anyMatch(Predicate<T>)`: verifica si algún elemento de un stream satisface un predicado.
* `noneMatch(Predicate<T>)`: opuesto de `allMatch(...)`
* `findAny()`: devuelve en un `Optional<T>` un elemento (cualquiera) del stream. Recomendado en streams paralelos.
* `findFirst()` devuelve en un `Optional<T>` el primer elemento del stream. *NO RECOMENDADO* en streams paralelos.

## Transcripción

<img src="images/17-01.png">
<img src="images/17-02.png">
<img src="images/17-03.png">
<img src="images/17-04.png">

Hola vamos a conocer con respecto a los API Street en la piscin los métodos de búsqueda de datos que nos ofrecen en este vídeo y lo sucesivo vamos a ir viendo en diferente operaciones que podemos hacer intermedio terminales con los streams de forma que al final del bloque podremos ir componiendo esta operaciones según nos interesa los métodos de búsqueda de la peste son operaciones terminales y nos van a permitir identificar si hay elementos que cumplen una condición y obtener los pies que el string contiene elementos vale algún elemento en particular tenemos algunos métodos de búsqueda como por ejemplo es por más vale que recibe un predicado y que verifica y todos y cada uno de los elementos del Sting satisfacen es el predicado verifica si alguno de los elementos del street al menos uno satisface es el predicado y no más es el opuesto a all mad here decir que verifica que todos los elementos del stream no cumplen con ese predicado vale tenemos también otros métodos como son para ingenii findfirst que nos van a permitir devolver un elemento de un string en particular es muy recomendado en el caso de los Teen paralelo findfirst sería más recomendado en el caso de veloz sprint secuenciales no nada recomendado para el caso de los estoy en paralelo porque redundaría entonces en problemas de rendimiento ambos dos devuelve una instancia de opcional sobre el tipo de dato de sobre el que se ha definido el tren y queréis conocer más sobre la clase opcional que también es nueva de la última persona dejada también tenéis una píldora en Youtube sobre sobre el canal vamos a ver algún ejemplo de estos métodos de búsqueda volvemos a tener las capitales de provincia de Andalucía y podemos ir utilizando los diferentes métodos hermana va a ser un método que devuelva un valor Boolean recibe un predicado predicado en este caso sería bueno para la capital queremos quedarnos con todo aquello que tengan una longitud de 4 o más caracteres y lo podríamos guardar en un valor Boolean lo podríamos utilizar también como parte de este otra estructura vale aquí construimos el mensaje de longitud y todas las capitales tienen 4 o más caracteres pues imprimir este mensaje y si no pues en primer mensaje hay al menos alguna capital con menos de 4 caracteres vale tienen 4 o más caracteres desde en adelante recordaste los bloques de comentarios se pueden poner con control siete al igual que así como se pueden quitar si queremos verificar si alguno cumple una determinada condición podríamos pedir con en IMAX un predicado y decir oye hay alguno que sea igual independientemente de fiestas mayúscula o minúscula que Jaén vale que lo podríamos guardar en un valor Julián capital decíamos norma tiene como inversa el perdón en la inversa de Olma y podríamos decir oye se cumple que ninguna tenga 4 o más caracteres entonces podríamos ver que bueno al menos hay alguna capital en mis puntos son todas que tienen 4 caracteres, no por último cómo que podíamos utilizar los métodos find me if I'm old find any file first que devuelven un opcional vale y bueno suponiendo que hiciéramos un tratamiento con ESPN paralelos que es donde tiene más recomendación aunque sean solo 8 elementos fine lo que hace es de volvernos algún elemento del state localiza un elemento cualquiera te lo devuelven una opción al recordar que la clase opcional bueno fue es un contenedor que nos va evitar errores de tipo NullPointerException nos permite comprobar si tiene un objeto dentro o no lo tiene vale mediante el método y presente y tiene alguna serie de método que como yo digo si queréis visitar la píldora sobre opcional la podréis conocer mucho mejor capital cualquiera y mediante el método Urgel podríamos indicar que bueno si no está la capital pues en el script no queda capital de ningún tipo opondrían usar el método spain-first para obtener la primera capital de todas en este caso fue una cualquiera sería Málaga y bueno teníamos por otro lado Jaén vale que sería la primera de todas hemos conocido los métodos de búsqueda nos vamos a lanzar ahora a conocer una serie de métodos que son las de tratamiento de datos y métodos de cálculo y métodos de ordenación


# 18 Métodos de datos, cálculo y ordenación 10:25 

[Métodos de datos, cálculo y ordenación](pdfs/18_Métodos_de_datos_cálculo_y_ordenación.pdf)

## Resumen del Profesor

### 18.1 Métodos de datos y cálculo

Los streams nos ofrecen varios tipos de métodos terminales para realizar operaciones y cálculos con los datos. Durante el curso trabajaremos con tres tipos:

* Reducción y resumen (en esta lección)
* Agrupamiento
* Particionamiento

### 18.2 Métodos de reducción

Son métodos que reducen el stream hasta dejarlo en un solo valor.

* `reduce(BinaryOperator<T>):Optional<T>` realiza la reducción del Stream usando una función asociativa. Devuevle un Optional
* `reduce(T, BinaryOperator<T>):T` realiza la reducción usando un valor inicial y una función asociativa. Se devuelve un valor como resultado.

### 18.3 Métodos de resumen

Son métodos que resumen todos los elementos de un stream en uno solo:

* `count`: devuelve el número de elementos del stream.
* `min(...), max(...)`: devuelven el máximo o mínimo (se puede utilizar un `Comparator` para modificar el orden natural).

### 18.4 Métodos de ordenación

Son operaciones intermedias, que devuelven un stream con sus elementos ordenados.

* `sorted()` el stream se ordena según el orden natural.
* `sorted(Comparator<T>)` el stream se ordena según el orden indicado por la instancia de `Comparator`.

## Transcripción

<img src="images/18-01.png">
<img src="images/18-02.png">
<img src="images/18-03.png">
<img src="images/18-04.png">
<img src="images/18-05.png">

Hola todo vamos a continuar conociendo el lápiz tren para conocer los métodos de gato de cálculo y ordenación no string no ofrecen métodos terminales para hacer múltiple operaciones con los datos trabajar con tres tipos los de reducción y resumen los métodos de agrupamiento y particionamiento el agrupamiento y particionar yo y particionamiento lo trabajaremos más adelante en en sucesivos vídeo vamos a ver ahora los métodos de reducción y resumen con respecto a los métodos de reducción tenemos alguna implementaciones del método review que nos permite reducir un string a un solo valor mediante un operador de reducción vale se trataría de una función asociativa supone por ejemplo en el primero que siempre se viene a la cabeza que tenemos una excelente números y queremos quedarnos por ejemplo con el máximo vale pues lo podríamos hacer de esa manera también tenemos la reducción usando un valor inicial ni una función asociativa por ejemplo la suma de todos los elementos de un array la podríamos hacer de esta manera no añadiendo en este valor inicial puesto dolores también algunos métodos de resumen por recuerdo que son operaciones terminales como son con que devuelve el número de elementos del Scream que nos devolvería en el mínimo el máximo vale encapsulado dentro de una opcional vale bueno también tenemos que tener presente que la interfaz Comparator también nos va a ayudar con algunos métodos estáticos en este. Tenemos también en los métodos de ordenación que en este caso serían operaciones intermedias vale y que nos permitiría vale no hemos querido meter también en el saco de este vídeo que nos permitiría hacer una ordenación de los elementos del stream mediante el orden natural o la interfaz coja vamos a ver algunos ejemplos de ello cómo sería la reducción aquí tenemos un método estático que nos va a generar un array aleatorio de 100 elemento de números enteros entre 0 y 1000 string ha impregnado no solamente lo que tenemos dentro de su paquete y no que ha impregnado clases que ya eran archiconocida la interfaz perdón en la clase random vale incluye desde la versión 18 un método que se llama bien que devuelve un intrim que acepta tres parámetros el primero es el número de elementos que va a tener eléctrica y después el intervalo mediante dos número de en el que se quieren embarcar los números aleatorios que se generen tiene a su vez un método que nos permite obtener todos los elementos de String en un array en este tipo de centeno con local usando flujos también podremos tener una raíz rápidamente número aleatorio entre 0 y 1000 haríamos ese método estático para obtener aquí en la RAE cómo arreglar estamos haciendo uso del método to String que lo que haces de volvernos para un array de enteros una cadena de caracteres que representa a todas a todo el Ferrari cómo podemos comprobar no quisiéramos reducir stream para quedarnos solamente con un valor como digo deberíamos proporcionar al método reviews 1 una expresión lambda o una interfaz de del tipo en vinari operator por tratarse de un stream de entero en este caso vale sería una un operador binario que nos permitiría hacer está está reducción en este caso lo que va haciendo es quedarse solamente con el Máster de manera que nos quedaríamos con este máximo en opcional tenemos creador las clases correspondientes tenemos el método imprenta que nos permite saber pie máximo que de tipo penal tiene valor o no y el método el que hacen que no lo devuelve como valor entero el valor máximo en 990 como son una cantidad considerable de número aleatorio siempre estará rozando el 900 y pico no es muy muy raro que salga mapa una operación de reducción con una función asociativa podemos usar tal y como hemos visto antes también vale con un valor inicial en este caso proporcionamos la función asociativa x sí que nos va devolviendo la suma y empezando espero que el acumulador natural de la suma podríamos tener la suma de todos los elementos podremos tener también el producto o cualquier otro tipo de operación en el caso de la reducción también que había alguna serie de operaciones de datos como por ejemplo montar el máximo y mínimo podríamos hacer lo mismo con un número un array de números aleatorios de tipo double el método doble que funciona igual que hemos visto antes y podríamos de un array en particular en un extremo y obtener el número de elementos el máximo o el mínimo mediante estos métodos directamente vale los correspondientes de uno de un string de una clase que no sean tipo primitivo requerirían de que le proporcionemos un comparador un contrato vale esto devuelven también una opción aquí podemos llamar al método por el vale para que no te volviera el valor 0 tenemos también la posibilidad de una tacada de calcular la suma en el caso de los de los stream de tipo más básico vale y podríamos imprimir aquí todo el array con lo elemento en una sola línea el máximo perdón el número de elemento de 100 lo sabíamos porque lo hemos generado nosotros aquí en el valor máximo es 986 81 es 26,36 olvidado añadir comparar la longitud de las palabras la palabra más larga no pues de todas las palabras que tenemos aquí la más larga es toda esta palabra qué es casi impronunciable no que un compuesto de química orgánica por último la operaciones intermedias de ordenación que las queríamos conocer ahora nos van a permitir a partir de un array aleatorio de número entero hacer una ordenación sencilla fijado como aquí podemos construir un screen sobre la raíz ordenarlo y volver a obtener un array ordenado y en el caso de querer ordenar un stream de objetos de otro tipo deberíamos proporcionar un comparato fija como aquí en una sola línea de código obtenemos un screen a través de una lista de entero lo ordenamos por orden alfabético inverso y lo imprimimos por consola empezaría por Sevilla Málaga Jaén Huelva terminando en Almería que empieza por la I en el caso de los número tenemos el array que los títulos han equivocado elementos de la RAE se han ordenado perfectamente frente al primer arranque obviamente al ser generado de forma aleatoria estaba fenomenal en el siguiente vídeo aprenderemos alguna de las operaciones más complicadas con el API stream cómo son las operaciones de Mateo con plasma y colector


# 19 Uso de Map y flapMap 12:04 

[Uso de Map y flapMap](pdfs/19_Uso_de_map_flatMap_y_Collector.pdf)

## Resumen del Profesor

### 19.1 Uso de map

`map` es una de las operaciones intermedias más usadas, ya que permite la transformación de un objeto en otro, a través de un `Function<T, R>`. Se invoca sobre un `Stream<T>` y retorna un `Stream<R>`. Además, es muy habitual realizar transformaciones sucesivas.

```java
lista
   .stream()
   .map(Persona::getNombre)
   .map(String::toUpperCase)
   .forEach(System.out::println);
```

### 19.2 Uso de `flatMap`

Los streams sobre colecciones de un nivel permiten transformaciones a través de `map` pero, ¿qué sucede si tenemos una colección de dos niveles (o una dentro de objetos de otro tipo)?:

```java
public class Persona {

    private String nombre;
    private List<Viaje> viajes = new ArrayList<>();

  //resto de atributos y métodos
}
```

Para poder trabajar con la colección interna, necesitamos un método que nos unifique un `Stream<Stream<T>>` en un solo `Stream<T>`. Ese es el cometido de `flatMap`.

```java
lista
   .stream()
   .map((Persona p) -> p.getViajes())
   .flatMap(viajes -> viajes.stream())
   .map((Viaje v) -> v.getPais())
   .forEach(System.out::println);
```

También tenemos disponibles las versiones primitivas `flatMapToInt`, `flatMapToLong` y `flatMapToDouble`:

```java
Arrays
    .stream(numeros)
    .flatMapToInt(x -> Arrays.stream(x))
    .map(IntUnaryOperator.identity())
    .distinct()
    .forEach(System.out::println);
```

## Transcripción

<img src="images/19-01.png">
<img src="images/19-02.png">
<img src="images/19-03.png">
<img src="images/19-04.png">
<img src="images/19-05.png">
<img src="images/19-06.png">
<img src="images/19-07.png">
<img src="images/19-08.png">
<img src="images/19-09.png">
<img src="images/19-10.png">
<img src="images/19-11.png">

Vamos a continuar trabajando con el API spring y en este caso nos vamos a centrar en operaciones de transformación de datos y de recolección de los pies comencemos hemos hablado en algunos vídeos anteriores de la operación de transformación la presentábamos de hecho cuando conocíamos la interfaz funcional. Una de las operaciones intermedias más utilizada ya que permite transformar un objeto en otro recibe como argumento una instancia de una interfaz funcional qué es función y que se define sobre dos tipos el tipo de dato que acepta y un tipo de dato de retorno es muy interesante que seamos conscientes de que cuando invoquemos más siempre lo haremos sobre un string de un tipo determinado y que tras la invocación lo que obtenemos es otro stream pero en este caso de datos trabaja además podemos encadenar una llamada de más con otra al más puro estilo de la piscina aquí por ejemplo tenemos un fragmento de código en el que sufre una lista de instancia de la clase persona que incluirían fue unos cuantos atributos podríamos hacer una transformación para obtener primero los nombres de esas personas y posteriormente pasarlo a mayúscula antes de que lo imprimimos por consola a la derecha cómo poder comprobar o pongo el tipo de retorno que tendría que dar uno de los métodos y como cada llamada a Matt hace una transformación del stream al tipo de datos correspondientes en este caso ambas llamadas no se volverían un stream de streamplay cadena de cárcel sobre la clase persona que bueno es una clase normal y corriente qué feliz se termine en este caso tres atributos privados y no me lo ha pedido y la fecha de nacimiento pues podríamos hacer una serie de transformaciones la primera en la que hemos visto antes en la play vale anda que obtendríamos el nombre y lo pasaríamos a mayúscula en este caso a ti en el código lo he hecho con una expresión Landa menos concisa vale la referencia métodos las veremos en alguno de los vídeos de este bloque pero el efecto sería el mismo no nos permitiría transformar mapear una persona aquí está impidiendo el tipo de datos automáticamente desde el contexto vale porque estamos trabajando con un stream de persona por lo para aquí por defecto está aceptando como podemos ver una función de persona vale y el tipo de retorno al ser un script porque lo marca el tiempo de retorno de este método como podemos comprobar estamos trabajando sobre bueno pues persona que se transforma en un stream de cadenas de caracteres en este caso como el tipo que recibimos y el tipo que retornamos es el mismo fue seguiríamos teniendo un stream de cadena de caracteres para después poder imprimirlas por consola también otro sencillo código de transformación en este caso a otro tipo de dato distinto podríamos mapear para obtener la fecha de nacimiento y a partir de la fecha de nacimiento como local de ir podríamos tener solamente el día y el mes para bueno puede hacer una lista de fecha de cumpleaños de las personas coma en primer en primer lugar hemos tenido el nombre de las personas las personas que tenemos aquí solamente el nombre mayúscula y en este caso como estamos teniendo de las personas la fecha de nacimiento y de la fecha de nacimiento y solamente el día y el mes en un formato de cadena de caracteres como veis más es una operación que es sencilla de implementar pero que he pasarte potencia además me demás tenemos la posibilidad de usar flatmap y alguno de vosotros en vuestros primeros usos de la Play stream pues casi que no seréis capaces de diferenciar las pero que tras ver este vídeo nos quede ninguna como hemos comprobado antes cuando trabajamos con una colección podríamos decir que de un solo nivel es decir una lista de un tipo de entidad como persona como la que hemos visto antes pues sería sencillo y transformarlo con más me echo podemos hacer transformaciones sucesivas pero qué sucede con colecciones que tienen más de pelis o con entrada que son formadas por clave valor o si una colección incluye dentro otra aquí vamos a modificar la clase persona para gestionar una serie de viajes que haga cada una de ellas una persona podrá hacer varios viajes como podemos ver aquí a continuación que tendríamos que hacer para poder trabajar sobre los viajes no solamente de una persona y no de todas las personas enfoque clásico sería si quisiéramos fuerte imprimir todos los viajes sola sería hacer un bucle anidado para cada persona la implementación sería un poco más complejas principio podríamos plantearnos hacer este doble bucle ir almacenando en un set los viajes y después recorrer el test para imprimir bueno pues el API string nos proporciona otra operación que es plasma que nos va a permitir para esta operaciones de transformación que nos devuelven un stream de Steam de otra clase aquí por ejemplo si sacáramos los viajes de cada persona tendríamos un stream de Steam de viaje nos va a permitir unificar todos esos stream en unos zuecos vale así como podemos ver en pantalla tendríamos los viajes de la primera persona lo de la segunda y la tercera en bueno en una estructura de stringstream podríamos unificarlo con flatman todos en un solo stream de viaje con lo cual vamos a poder seguir haciendo el resto de operaciones con normalidad aquí tendríamos un ejemplo de cómo hacer como habíamos hecho antes con el Google el doble bucle for un recorrido de bueno de todas las personas es traerlos viaje unificar todos los viajes mediante flatmap a partir de ahí obtener los viajes que teníamos y sacar el país para poder imprimirlo los países por consola es una operación muy útil porque nos va a permitir unificar todos esos individuales en uno solo como no podía ser de otra manera también tenemos los métodos correspondientes de transformación a a entero a doble para trabajar con los tipos de datos primitivos no como podemos ver aquí si tuviéramos una matriz bidimensional con número y quisiéramos obtener los números diferentes podríamos hacer una unificación de todos esos stream en uno solo o un plasma twin de manera que posteriormente podríamos obtener sobre los distintos invocando al método veamos algún ejemplo supongamos que tenemos la clase persona y la clase viaje las bacterias muy sencillas tenemos que cenar que determinadas personas viajan algunos países y el viaje incluye solamente el país y las personas tendrían su nombre y la lista de viajes que han realizado en el fondo de la lista de países que han visitado supongamos que tenemos estos datos de aquí donde la primera persona ha viajado a todos estos países la segunda persona viajado a todo esto y la tercera a eso que como podéis ver algunos viajes están solapados no lo podríamos retornar dentro de una lista de personas cómo os decía al principio de la aplicación de plasma si quisiéramos hacer un recorrido de esos países a la vieja usanza tendríamos que hacer un bucle for 2 bucles For anidados uno dentro del otro sería una estructura clásica y no sería totalmente funcional sin embargo como decía como podríamos hacer todo eso son con países diferentes no requeriría un poco más fuerte sin embargo hacerlo con poner API stream va a ser muy sencillo desde la lista obtenemos el stream más veamos las personas en su viaje con flagma construimos un stream con todos los viajes vapeamos entonces el viaje para obtener los países los filtramos para que sean distintos y lo imprimimos por vosotras vamos a ver el ejemplo no para montar está segunda parte imprimirlos todo esfuerzo pero como aquí haría un filtrado para que no aparezcan los países vale de aquí podemos hacer lo mismo pero no entero una matriz bidimensional número mate haríamos vale cada uno de los arrays unidimensionales que conforman el array bidimensional para obtener un string del mismo obtenemos con este mapeo con la función identidad cada uno de los elementos para después filtrarlo e imprimirlos por consola si os dais cuenta van a parecer solamente unos pocos números de todos los que tenemos lo único que hay diferentes dentro de los dos arrays unidimensionales que conforman el bidimensional con uno dos tres cuatro y cinco para quitar los repetidos de forma que ya no aparecería plasma en una operación bastante potente y que nos va a ayudar a poder trabajar con colecciones que tengan más de un mes


# 19 Uso de la clase Collector 19:28 

[Uso de la clase Collector](pdfs/19_Uso_de_map_flatMap_y_Collector.pdf)

## Resumen del Profesor

### 19.3 Collectors

Los *collectors* nos van a permitir, en una operación terminal, construir una collección *mutable*, el resultado de las operaciones sobre un *stream*.

### 19.3.1 Colectores “básicos”

Nos permiten operaciones que recolectan todos los valores en uno solo. Se solapan con alguans operacinoes finales ya estudiadas, pero están presentes porque se pueden combinar con otros colectores más potentes.

* `counting`: cuenta el número de elementos.
* `minBy(...)`, `maxBy(...)`: obtiene el mínimo o máximo según un comparador.
* `summingInt`, `summingLong`, `summingDouble`: la suma de los elementos (según el tipo).
* `averagingInt`, `averagingLong`, `averagingDouble`: la media (según el tipo).
* `summarizingInt`, `summarizingLong`, `summarizingDouble`: los valores anteriores, agrupados en un objeto (según el tipo).
* `joinning`: unión de los elementos en una cadena.

### 19.3.2 Colectores “grouping by”

Hacen una función similar a la cláusula GROUP BY de SQL, permitiendo agrupar los elementos de un stream por uno o varios valores. Retornan un `Map`.

```java
Map<String, List<Empleado>> porDepartamento =
   empleados
     .stream()
     .collect(groupingBy(Empleado::getDepartamento));
```

Se pueden usar en conjunción cno los colectores básicos, o con otro colector *grouping by*:

```java
Map<String, Long> porDepartamentoCantidad =
   empleados
      .stream()
      .collect(groupingBy(Empleado::getDepartamento, counting()));

Map<String, Map<Double, List<Empleado>>> porDepartamentoYSalario =
   empleados
     .stream()
     .collect(groupingBy(Empleado::getDepartamento, groupingBy(Empleado::getSalario)));
```

También tenemos los colectores *partitioning*, que nos agrupan los resultados dos conjuntos, según si cumplen una condición:

```java
Map<Boolean, List<Empleado>> salarioMayorOIgualque32000 =
   empleados
     .stream()
     .collect(partitioningBy(e -> e.getSalario() >= 32000));
```
  
### 19.3.3 Colectores “Collection”

Producen como resultado una colección: List, Set y Map.

```java
Set<Empleado> setEmpleados = empleados.stream().collect(Collectors.toSet());
List<Empleado> listEmpleados = empleados.stream().collect(Collectors.toList());
Map<String, Double> mapEmpleados = empleados.stream().distinct()
                .collect(Collectors.toMap(Empleado::getNombre, Empleado::getSalario));
```

## Transcripción

<img src="images/19-12.png">
<img src="images/19-13.png">
<img src="images/19-14.png">
<img src="images/19-15.png">
<img src="images/19-16.png">
<img src="images/19-17.png">
<img src="images/19-18.png">
<img src="images/19-19.png">
<img src="images/19-20.png">

# 20 Uso de streams y filtros 8:27 

[Uso de streams y filtros](pdfs/20_Uso_de_streams_y_filtros.pdf)

## Resumen del Profesor

### 20.1 `streams` y `filtros`

`filter` es una operación intermedia, que nos permite *eliminar* del stream aquellos elementos que no cumplen con una determinada condición, marcada por un `Predicate<T>`.

```java
personas
      .stream()
      .filter(p -> p.getEdad() >= 18 && p.getEdad() <= 65)
      .forEach(persona -> System.out.printf("%s (%d años)%n", persona.getNombre(), persona.getEdad()));
```            
            
Es muy combinable con algunos métodos como `findAny` o `findFirst`:

```java
Persona p1 = personas
                   .stream()
                   .filter(p -> p.getNombre().equalsIgnoreCase("Andrés"))
                   .findAny()
                   .orElse(new Persona());
```

Y se puede usar también en streams sobre colecciones tipo `Map`.

```java
Map<Integer, Persona> personas = new HashMap<>();
//Inicialización
personas.entrySet()
            .stream()
            .filter(map -> map.getKey() >= 5)
            .collect(Collectors.toMap(p -> p.getKey(), p -> p.getValue()))
            .forEach((key, value) -> System.out.printf("%d: %s%n", key, value.getNombre()));
```

## Transcripción

<img src="images/20-01.png">
<img src="images/20-02.png">

# 21 Referencias a métodos con stream 10:55 

[Referencias a métodos con stream](pdfs/21_Referencias_a_métodos.pdf)

## Resumen del Profesor

### 21.1 Referencias a métodos

Las referencias a métodos son una forma de hacer nuestro código aun más conciso:

```java
public class Persona {
   //…
   public static int compararPorEdad(Persona a, Persona b) {
      return a.fechaNacimiento
                  .compareTo(b.fechaNacimiento);
   }
}

//...

List<Persona> personas = //...

// De menos a más "conciso"
personas.sort((Persona p1, Persona p2) -> {
   return p1.getFechaNacimiento()
      .compareTo(p2.getFechaNacimiento());
});

personas.sort((p1, p2) -> p1.getFechaNacimiento()
                                .compareTo(p2.getFechaNacimiento()));

personas.sort(Persona::compararPorEdad);
```

### 21.2 Tipos de referencias a métodos

* `Clase::metodoEstatico`: referencia a un método estático.
* `objeto::metodoInstancia`: referencia a un método de instancia de un objeto concreto.
* `Tipo::nombreMetodo`: referencia a un método de instancia de un objeto arbitrario de un tipo en particular.
* `Clase::new`: referencia a un constructor.

## Transcripción

<img src="images/21-01.png">
<img src="images/21-02.png">
<img src="images/21-03.png">
<img src="images/21-04.png">


# Práctica: Todos los elementos del API stream trabajando conjuntamente 22:25 

Ponemos en práctica todo los elementos del API stream trabajando conjuntamente

## Transcripción

## Contenido adicional 7   

[Introducción al API Stream](pdfs/16_Introducción_al_API_Stream.pdf)

[Métodos de búsqueda de datos](pdfs/17_Métodos_de_búsqueda_de_datos.pdf)

[Métodos de datos, cálculo y ordenación](pdfs/18_Métodos_de_datos_cálculo_y_ordenación.pdf)

[Uso de Map y flapMap](pdfs/19_Uso_de_map_flatMap_y_Collector.pdf)

[Uso de la clase Collector](pdfs/19_Uso_de_map_flatMap_y_Collector.pdf)

[Uso de streams y filtros](pdfs/20_Uso_de_streams_y_filtros.pdf)

[Referencias a métodos con stream](pdfs/21_Referencias_a_métodos.pdf)

