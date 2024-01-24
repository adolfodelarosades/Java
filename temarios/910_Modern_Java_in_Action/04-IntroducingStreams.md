# Capítulo 4. Introduciendo Streams

Este capítulo cubre:

* ¿Qué es una stream?
* Collections versus streams
* Iteración interna versus externa
* Operaciones intermedias versus terminales
  
¿Qué harías sin collections en Java? Casi todas las aplicaciones Java crean y procesan colecciones. Las colecciones son fundamentales para muchas tareas de programación: le permiten agrupar y procesar datos. Para ilustrar las colecciones en acción, imagine que se le asigna la tarea de crear una colección de platos para representar un menú para calcular diferentes consultas. Por ejemplo, es posible que desee averiguar la cantidad total de calorías del menú. O bien, es posible que necesites filtrar el menú para seleccionar solo platos bajos en calorías para un menú saludable especial. Pero a pesar de que las colecciones son necesarias para casi cualquier aplicación Java, manipularlas está lejos de ser perfecta:

* Gran parte de la lógica empresarial implica operaciones similares a las de una base de datos, como agrupar una lista de platos por categoría (por ejemplo, todos los platos vegetarianos) o encontrar el plato más caro. ¿Cuántas veces te encuentras reimplementando estas operaciones usando iteradores? La mayoría de las bases de datos le permiten especificar dichas operaciones de forma declarativa. Por ejemplo, la siguiente consulta SQL le permite seleccionar (o “filtrar”) los nombres de platos bajos en calorías: **`SELECT name FROM dishes WHERE calorie < 400`**. Como puedes ver, en SQL no necesitas implementar cómo filtrar usando el atributo **`calorie`** de un plato (como lo harías con las colecciones de Java, por ejemplo, usando un iterador y un acumulador). En cambio, escribe lo que desea como resultado. Esta idea básica significa que usted se preocupa menos acerca de cómo implementar explícitamente dichas consultas: ¡se maneja por usted! ¿Por qué no puedes hacer algo similar con las colecciones?

* ¿Cómo procesarías una gran colección de elementos? Para ganar rendimiento, necesitaría procesarlo en paralelo y utilizar arquitecturas multinúcleo. Pero escribir código paralelo es complicado en comparación con trabajar con iteradores. Además, ¡depurar no es divertido!

¿Qué podrían hacer los diseñadores del lenguaje Java para ahorrarle su valioso tiempo y facilitarle la vida como programadores? Quizás lo hayas adivinado: la respuesta es ***streams***.

## 4.1. ¿Qué son las streams?

Los streams son una actualización de la API de Java que le permite manipular colecciones de datos de forma declarativa (expresa una consulta en lugar de codificar una implementación ad hoc para ella). Por ahora, puedes considerarlos como iteradores sofisticados sobre una colección de datos. Además, las transmisiones se pueden procesar en paralelo de forma transparente, ¡sin tener que escribir ningún código multiproceso! Explicamos en detalle en el capítulo 7 cómo funcionan los streams y la parallelization. Para ver los beneficios de usar streams, compare el siguiente código para obtener los nombres de platos bajos en calorías, ordenados por número de calorías, primero en Java 7 y luego en Java 8 usando streams. No se preocupe demasiado por el código Java 8; ¡Lo explicamos en detalle en las siguientes secciones!

Antes (Java 7):

```java
List<Dish> lowCaloricDishes = new ArrayList<>();
for(Dish dish: menu) {
    if(dish.getCalories() < 400) {                                 1
        lowCaloricDishes.add(dish);
    }
}
Collections.sort(lowCaloricDishes, new Comparator<Dish>() {        2
    public int compare(Dish dish1, Dish dish2) {
        return Integer.compare(dish1.getCalories(), dish2.getCalories());
    }
});
List<String> lowCaloricDishesName = new ArrayList<>();
for(Dish dish: lowCaloricDishes) {
    lowCaloricDishesName.add(dish.getName());                      3
}
```

* **1 Filtra los elementos mediante un acumulador**
* **2 Clasifica los platos con una clase anónima**
* **3 Procesa la lista ordenada para seleccionar los nombres de los platos.**

En este código se utiliza una “garbage variable - variable basura” **`lowCaloricDishes`**. Su única finalidad es actuar como contenedor intermedio de desecho. En Java 8, este detalle de implementación se inserta en la library a la que pertenece.

Después (Java 8):

```java
import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.toList;
List<String> lowCaloricDishesName =
               menu.stream()
                   .filter(d -> d.getCalories() < 400)       1
                   .sorted(comparing(Dish::getCalories))     2
                   .map(Dish::getName)                       3
                   .collect(toList());                       4
```

* **1 Selecciona platos que tengan menos de 400 calorías.**
* **2 Ordenarlos por calorías**
* **3 Extrae los nombres de estos platos.**
* **4 Almacena todos los nombres en una List**
* 
Para explotar una arquitectura multinúcleo y ejecutar este código en paralelo, sólo necesita cambiar **`stream()`** a **`parallelStream()`**:

```java
List<String> lowCaloricDishesName =
               menu.parallelStream()
                   .filter(d -> d.getCalories() < 400)
                   .sorted(comparing(Dishes::getCalories))
                   .map(Dish::getName)
                   .collect(toList());
```

Quizás se pregunte qué sucede exactamente cuando invoca el método **`parallelStream`**. ¿Cuántos hilos se están utilizando? ¿Cuáles son los beneficios de rendimiento? ¿Deberías utilizar este método? El capítulo 7 cubre estas preguntas en detalle. Por ahora, puede ver que el nuevo enfoque ofrece varios beneficios inmediatos desde el punto de vista de la ingeniería de software:

* El código está escrito de ***forma declarativa***: usted especifica lo que desea lograr (filtrar platos bajos en calorías) en lugar de especificar cómo implementar una operación (usando bloques de flujo de control como bucles y condiciones **`if`**). Como vio en el capítulo anterior, este enfoque, junto con la parametrización del comportamiento, le permite hacer frente a los requisitos cambiantes: puede crear fácilmente una versión adicional de su código para filtrar platos ricos en calorías usando una expresión lambda, sin tener que copiar y pegar código. Otra forma de pensar en el beneficio de este enfoque es que el modelo de subprocesamiento está desacoplado de la consulta misma. Debido a que está proporcionando una receta para una consulta, ésta podría ejecutarse de forma secuencial o en paralelo. Aprenderá más sobre esto en el capítulo 7 .

* Se encadenan varias operaciones básicas para expresar un proceso de procesamiento de datos complicado (se encadena **`filter`** vinculando operaciones **`sorted`**, **`map`** y **`collect`**, como se ilustra en la figura 4.1 ) manteniendo su código legible y su intención clara. El resultado de se **`filter`** pasa al  método **`sorted`**, que luego se pasa al método **`map`** y luego al método **`collect`**.

Figura 4.1.Encadenamiento de operaciones de arroyos formando un oleoducto

![image](https://github.com/adolfodelarosades/Java/assets/23094588/86ad23e1-3802-486b-8582-de0e4996cdfe)



Debido a que operaciones como filter(o sorted, mapy collect) están disponibles como bloques de construcción de alto nivel que no dependen de un modelo de subprocesos específico, su implementación interna podría ser de un solo subproceso o podría potencialmente maximizar su arquitectura multinúcleo de forma transparente. En la práctica, esto significa que ya no tendrá que preocuparse por subprocesos y bloqueos para descubrir cómo paralelizar ciertas tareas de procesamiento de datos: ¡la API Streams lo hace por usted!

La nueva API Streams es expresiva. Por ejemplo, después de leer este capítulo y los capítulos 5 y 6 , podrá escribir código como el siguiente:

```java
```

Este ejemplo particular se explica en detalle en el capítulo 6 . Agrupa platos por tipos dentro de un archivo Map. Por ejemplo, Mappuede contener el siguiente resultado:

```java
```

Ahora considere cómo implementaría esto con el típico enfoque de programación imperativa usando bucles. Pero no pierdas demasiado tiempo. En lugar de ello, ¡acepte el poder de las corrientes en este y los siguientes capítulos!

Otras bibliotecas: Guava, Apache y lambdaj
Ha habido muchos intentos de proporcionar a los programadores de Java mejores bibliotecas para manipular colecciones. Por ejemplo, Guava es una biblioteca popular creada por Google. Proporciona clases de contenedores adicionales, como mapas múltiples y conjuntos múltiples. La biblioteca Apache Commons Collections proporciona características similares. Finalmente, lambdaj, escrito por Mario Fusco, coautor de este libro, proporciona muchas utilidades para manipular colecciones de forma declarativa, inspiradas en la programación funcional.

Ahora, Java 8 viene con su propia biblioteca oficial para manipular colecciones en un estilo más declarativo.

En resumen, la API Streams en Java 8 le permite escribir código que es

Declarativo : más conciso y legible
Composable : mayor flexibilidad
Paralelizable : mejor rendimiento
Durante el resto de este capítulo y el siguiente, usaremos el siguiente dominio para nuestros ejemplos: a menuque no es más que una lista de platos.

```java
```

donde a Dishes una clase inmutable definida como

```java
```

Ahora exploraremos con más detalle cómo puedes utilizar la API de Streams. Compararemos transmisiones con colecciones y brindaremos algunos antecedentes. En el próximo capítulo, veremosinvestigar en detalle las operaciones de flujo disponibles para expresar consultas sofisticadas de procesamiento de datos. Examinaremos muchos patrones, como filtrar, dividir, buscar, hacer coincidir, mapear y reducir. Habrá muchas pruebas y ejercicios para intentar solidificar su comprensión.

A continuación, analizaremos cómo se pueden crear y manipular secuencias numéricas (por ejemplo, para generar una secuencia de números pares o ternas pitagóricas). Finalmente, discutiremos cómo puede crear transmisiones desde diferentes fuentes, como por ejemplo desde un archivo. También discutiremos cómo generar transmisiones con una cantidad infinita de elementos, ¡algo que definitivamente no puedes hacer con las colecciones!

## 4.2. Comenzando con las transmisiones

Comenzamos nuestra discusión sobre transmisiones con colecciones, porque esa es la forma más sencilla de comenzar a trabajar con transmisiones. Las colecciones en Java 8 admiten un nuevo streammétodo que devuelve una secuencia (la definición de la interfaz está disponible en java.util.stream.Stream). Más adelante verá que también puede obtener secuencias de otras formas (por ejemplo, generando elementos de secuencia a partir de un rango numérico o de recursos de E/S).

Primero, ¿qué es exactamente una transmisión ? Una definición breve es "una secuencia de elementos de una fuente que respalda las operaciones de procesamiento de datos". Analicemos esta definición paso a paso:

Secuencia de elementos : al igual que una colección, una secuencia proporciona una interfaz para un conjunto secuenciado de valores de un tipo de elemento específico. Debido a que las colecciones son estructuras de datos, se tratan principalmente de almacenar y acceder a elementos con complejidades de tiempo/espacio específicas (por ejemplo, anArrayListversus aLinkedList). Pero las secuencias tratan de expresar cálculos comofilter,sortedymap, que viste antes. Las colecciones tratan sobre datos; Las transmisiones tienen que ver con cálculos. Explicamos esta idea con mayor detalle en las siguientes secciones.
Fuente : las transmisiones consumen de una fuente que proporciona datos, como colecciones, matrices o recursos de E/S. Tenga en cuenta que generar una secuencia a partir de una colección ordenada conserva el orden. Los elementos de una secuencia provenientes de una lista tendrán el mismo orden que la lista.
Operaciones de procesamiento de datos : los flujos admiten operaciones similares a bases de datos y operaciones comunes de lenguajes de programación funcionales para manipular datos, comofilter,map,reduce,find,match,sortetc. Las operaciones de flujo se pueden ejecutar de forma secuencial o en paralelo.
Además, las operaciones de flujo tienen dos características importantes:

Canalización : muchas operaciones de flujo devuelven un flujo por sí mismas, lo que permite encadenar las operaciones para formar un canal más grande. Esto permite ciertas optimizaciones que explicamos en el siguiente capítulo, como la pereza y los cortocircuitos . Una canalización de operaciones puede verse como una consulta similar a una base de datos sobre la fuente de datos.
Iteración interna : a diferencia de las colecciones, que se iteran explícitamente mediante un iterador, las operaciones de flujo realizan la iteración detrás de escena por usted.Mencionamos brevemente esta idea en el capítulo 1 y volveremos a ella más adelante en la siguiente sección.
Veamos un ejemplo de código para explicar todas estas ideas:

```java
```

1 Obtiene una secuencia del menú (la lista de platos)
2 Crea una cadena de operaciones: primero filtra los platos ricos en calorías
3 Obtiene los nombres de los platos.
4 Selecciona sólo los tres primeros
5 Almacena los resultados en otra Lista
6 Da resultados [cerdo, ternera, pollo]

En este ejemplo, primero obtienes una secuencia de la lista de platos llamando al streammétodo en menu. La fuente de datos es la lista de platos (el menú) y proporciona una secuencia de elementos al flujo. A continuación, aplica una serie de operaciones de procesamiento de datos en la secuencia: filter, map, limity collect. Todas estas operaciones excepto collectdevolver otra secuencia para que puedan conectarse para formar una canalización , que puede verse como una consulta en la fuente. Finalmente, la collectoperación comienza a procesar la canalización para devolver un resultado (es diferente porque devuelve algo más que una secuencia; aquí, a List). No se produce ningún resultado y, de hecho, ni menusiquiera se selecciona ningún elemento hasta que collectse invoca. Puedes pensar en ello como si las invocaciones de métodos en la cadena estuvieran en cola hasta que collectse llame. La Figura 4.2 muestra la secuencia de operaciones de flujo: filter, map, limity collect, cada una de las cuales se describe brevemente aquí:

filter— Toma una lambda para excluir ciertos elementos de la secuencia. En este caso seleccionas platos que tengan más de 300 calorías pasándote la lambda d -> d.getCalories() > 300.
map— Se necesita una lambda para transformar un elemento en otro o extraer información. En este caso, extraes el nombre de cada plato pasando la referencia del método Dish::getName, que equivale a lambda d -> d.getName().
limit— Trunca una secuencia para que no contenga más de un número determinado de elementos.
collect— Convierte una secuencia en otra forma. En este caso, convierte la secuencia en una lista. Parece un poco de magia; Describiremos cómo collectfunciona con más detalle en el capítulo 6 . Por el momento, se puede ver collectcomo una operación que toma como argumento varias recetas para acumular los elementos de una secuencia en un resultado resumido. Aquí toList()se describe una receta para convertir una secuencia en una lista.
Figura 4.2.Filtrar un menú mediante una secuencia para encontrar tres nombres de platos ricos en calorías


Observe cómo el código que describimos es diferente de lo que escribiría si procesara la lista de elementos del menú paso a paso. Primero, utiliza un estilo mucho más declarativo para procesar los datos en el menú donde dice lo que hay que hacer: "Buscar nombres de tres platos ricos en calorías". No implementa las funcionalidades de filtrado ( filter), extracción ( map) o truncamiento ( ); limitestán disponibles a través de la biblioteca Streams. Como resultado, la API Streams tiene más flexibilidad para decidir cómo optimizar este canal. Por ejemplo, los pasos de filtrado, extracción y truncamiento podrían fusionarse en una sola pasada y detenerse tan pronto como se encuentren tres platos. Mostramos un ejemplo para demostrarlo en el próximo capítulo.

Retrocedamos un poco y examinemos las diferencias conceptuales entre la API de Colecciones y la nueva API de Streams antes de explorar con más detalle qué operaciones puede realizar con una secuencia.

## 4.3. Transmisiones versus colecciones

Tanto la noción existente de Java de colecciones como la nueva noción de flujos proporcionan interfaces para estructuras de datos que representan un conjunto secuenciado de valores del tipo de elemento. Por secuenciado queremos decir que normalmente recorremos los valores por turnos en lugar de acceder a ellos aleatoriamente en cualquier orden. ¿Cual es la diferencia?

Empezaremos con una metáfora visual. Considere una película almacenada en un DVD. Esta es una colección (quizás de bytes o de tramas; no nos importa cuál aquí) porque contiene toda la estructura de datos. Ahora considere ver el mismo video cuando se transmite por Internet. Esto ahora es una secuencia (de bytes o tramas). El reproductor de transmisión de video necesita haber descargado solo unos pocos fotogramas antes de donde el usuario está mirando, de modo que pueda comenzar a mostrar valores desde el comienzo de la transmisión antes de que se hayan calculado la mayoría de los valores de la transmisión (considere transmitir un video en vivo). partido de fútbol). Tenga en cuenta en particular que el reproductor de video puede carecer de memoria para almacenar toda la transmisión en la memoria como una colección, y el tiempo de inicio sería terrible si tuviera que esperar a que apareciera el fotograma final antes de poder comenzar a mostrar el video. Por motivos de implementación del reproductor de vídeo, puede optar por almacenar en buffer una parte de una secuencia en una colección, pero esto difiere de la diferencia conceptual.

En términos más generales, la diferencia entre colecciones y flujos tiene que ver con cuándo se calculan las cosas. Una colección es una estructura de datos en memoria que contiene todos los valores que tiene actualmente la estructura de datos; cada elemento de la colección debe calcularse antes de poder agregarse a la colección. (Puede agregar y eliminar cosas de la colección, pero en cada momento, cada elemento de la colección se almacena en la memoria; los elementos deben calcularse antes de pasar a formar parte de la colección).

Por el contrario, una secuencia es una estructura de datos conceptualmente fija (no se pueden agregar ni quitar elementos) cuyos elementos se calculan bajo demanda . Esto da lugar a importantes beneficios de programación. En el capítulo 6 , mostraremos lo sencillo que es construir una secuencia que contenga todos los números primos (2, 3, 5, 7, 11,...) aunque haya un número infinito de ellos. La idea es que un usuario extraiga solo los valores que necesita de una secuencia y estos elementos se produzcan, de forma invisible para el usuario, solo cuando sea necesario . Esta es una forma de relación productor-consumidor. Otro punto de vista es que un flujo es como una colección construida perezosamente: los valores se calculan cuando son solicitados por un consumidor (en términos de gestión, esto es fabricación impulsada por la demanda, o incluso justo a tiempo).

Por el contrario, una colección se construye con entusiasmo (impulsada por el proveedor: llena tu almacén antes de empezar a vender, como una novedad navideña que tiene una vida limitada). Imagínese aplicar esto al ejemplo de los números primos. Intentar construir una colección de todos los números primos daría como resultado un bucle de programa que siempre calcula un nuevo número primo (agregándolo a la colección) pero nunca podría terminar de hacer la colección, por lo que el consumidor nunca podría verlo.

La Figura 4.3 ilustra la diferencia entre una transmisión y una colección, aplicada a nuestro ejemplo de transmisión en DVD versus transmisión por Internet.

Figura 4.3.Transmisiones versus colecciones


Otro ejemplo es una búsqueda en Internet del navegador. Supongamos que busca una frase con muchas coincidencias en Google o en una tienda de comercio electrónico online. En lugar de esperar a que se descargue toda la colección de resultados junto con sus fotografías, obtienes una secuencia cuyos elementos son las 10 o 20 mejores coincidencias, junto con un botón en el que hacer clic para ver las 10 o 20 siguientes. Cuando tú, el consumidor, haga clic para ver los 10 siguientes, el proveedor los calcula a pedido, antes de devolverlos a su navegador para su visualización.

### 4.3.1.Atravesable solo una vez

Tenga en cuenta que, al igual que los iteradores, una secuencia solo se puede atravesar una vez. Después de eso se dice que se consume una corriente. Puede obtener una nueva secuencia de la fuente de datos inicial para recorrerla nuevamente como lo haría con un iterador (asumiendo que es una fuente repetible como una colección; si es un canal de E/S, no tiene suerte). Por ejemplo, el siguiente código generaría una excepción que indicaría que la transmisión se ha consumido:

```java
```

1 Imprime cada palabra del título.
2 java.lang.IllegalStateException: la transmisión ya ha sido operada o cerrada
¡Ten en cuenta que puedes consumir una transmisión solo una vez!

Corrientes y colecciones filosóficamente.
Para los lectores a los que les gustan los puntos de vista filosóficos, pueden ver una corriente como un conjunto de valores distribuidos en el tiempo. Por el contrario, una colección es un conjunto de valores dispersos en el espacio (en este caso, la memoria de la computadora), que existen en un único momento y al que se accede mediante un iterador para acceder a los miembros dentro de un for-eachbucle.

Otra diferencia clave entre colecciones y flujos es cómo gestionan la iteración de los datos.

### 4.3.2. Iteración externa versus interna

El uso de la Collectioninterfaz requiere que el usuario realice la iteración (por ejemplo, usando for-each); esto se llama iteración externa . La biblioteca Streams, por el contrario, utiliza iteración interna : hace la iteración por usted y se encarga de almacenar el valor de la secuencia resultante en algún lugar; simplemente proporciona una función que dice lo que se debe hacer. Los siguientes listados de códigos ilustran esta diferencia.

Listado 4.1.Colecciones: iteración externa con un for-eachbucle.

```java
```

1 Itera explícitamente la lista de menús de forma secuencial.
2 Extrae el nombre y lo añade a un acumulador

Tenga en cuenta que for-eachoculta parte de la complejidad de la iteración. La for-eachconstrucción es azúcar sintáctica que se traduce en algo mucho más feo usando un Iteratorobjeto.

Listado 4.2.Colecciones: iteración externa usando un iterador detrás de escena
```java
```

1 Itera explícitamente

Listado 4.3.Corrientes: iteración interna

```java
```

1 Parametriza el mapa con el método getName para extraer el nombre de un plato
2 Comienza a ejecutar el pipeline de operaciones; sin iteración

Usemos una analogía para comprender las diferencias y los beneficios de la iteración interna. Digamos que estás hablando con tu hija Sofía, de dos años, y quieres que guarde sus juguetes:

Tú: “Sofía, guardemos los juguetes. ¿Hay algún juguete en el suelo?
Sofía: “Sí, la pelota”.
Tú: “Está bien, pon la pelota en la caja. ¿Hay algo más?
Sofía: “Sí, ahí está mi muñeca”.
Tú: “Está bien, pon la muñeca en la caja. ¿Hay algo más?
Sofía: “Sí, ahí está mi libro”.
Tú: “Está bien, pon el libro en la caja. ¿Hay algo más?
Sofía: “No, nada más”.
Tú: "Bien, hemos terminado".

Esto es exactamente lo que haces todos los días con tus colecciones de Java. Iteras una colección externamente , extrayendo y procesando explícitamente los elementos uno por uno. Sería mucho mejor si pudieras decirle a Sofía: “Mete todos los juguetes que están en el suelo dentro de la caja”. Hay otras dos razones por las que es preferible una iteración interna: primero, Sofía podría elegir tomar la muñeca con una mano y la pelota con la otra al mismo tiempo, y segundo, podría decidir tomar primero los objetos más cercanos a la caja. y luego los demás. Del mismo modo, mediante una iteración interna, el procesamiento de elementos podría realizarse de forma transparente en paralelo o en un orden diferente que pueda optimizarse más. Estas optimizaciones son difíciles si iteras la colección externamente como estás acostumbrado a hacerlo en Java. Esto puede parecer quisquilloso, pero es en gran medida la razón de ser de la introducción de flujos en Java 8. La iteración interna en la biblioteca Streams puede elegir automáticamente una representación de datos y una implementación de paralelismo que coincida con su hardware. Por el contrario, una vez que haya elegido la iteración externa escribiendo for-each, entonces se habrá comprometido a autogestionar cualquier paralelismo. ( En la práctica , la autogestión significa "un buen día paralelizaremos esto" o "comenzar la larga y ardua batalla que involucra tareas y synchronized".) Java 8 necesitaba una interfaz como Collectionpero sin iteradores, ¡ergo Stream! La Figura 4.4 ilustra la diferencia entre un flujo (iteración interna) y una colección (iteración externa).

Figura 4.4.Iteración interna versus externa


Hemos descrito las diferencias conceptuales entre colecciones y transmisiones. Específicamente, las transmisiones utilizan iteración interna, donde una biblioteca se encarga de iterar por usted. Pero esto sólo es útil si tiene una lista de operaciones predefinidas con las que trabajar (por ejemplo, filtero map) que ocultan la iteración. La mayoría de estas operaciones toman expresiones lambda como argumentos para que puedas parametrizar su comportamiento como mostramos en el capítulo anterior. Los diseñadores del lenguaje Java enviaron la API Streams con una lista extensa de operaciones que puede utilizar para expresar consultas complicadas de procesamiento de datos. Ahora veremos brevemente esta lista de operaciones y las exploraremos con más detalle con ejemplos en el próximo capítulo. Para comprobar su comprensión de la iteración externa versus la interna, realice el cuestionario 4.1 a continuación.

Prueba 4.1: iteración externa versus interna

Según lo que aprendió sobre la iteración externa en los listados 4.1 y 4.2 , ¿qué operación de flujo usaría para refactorizar el siguiente código?

```java
```

Respuesta: Necesitas usar el filterpatrón.

```java
```

No se preocupe si todavía no está familiarizado con cómo escribir con precisión una consulta de flujo; aprenderá esto con más detalle en el próximo capítulo.

## 4.4. Operaciones de flujo

La interfaz de transmisiones java.util.stream.Streamdefine muchas operaciones. Se pueden clasificar en dos categorías. Miremos nuestro ejemplo anterior una vez más:

```java
```

1 Obtiene una secuencia de la lista de platos.
2 operación intermedia
3 convierte la transmisión en una lista

Puedes ver dos grupos de operaciones:

filter, mapy limitse pueden conectar entre sí para formar una tubería.
collecthace que la tubería se ejecute y la cierra.

Las operaciones de flujo que se pueden conectar se denominan operaciones intermedias y las operaciones que cierran un flujo se denominan operaciones terminales . La Figura 

## 4.5 destaca estos dos grupos. ¿Por qué es importante la distinción?

Figura 4.5.Operaciones intermedias versus terminales


### 4.4.1.Operaciones intermedias

Operaciones intermedias como filtero sorteddevolver otra secuencia como tipo de devolución. Esto permite que las operaciones se conecten para formar una consulta. Lo importante es que las operaciones intermedias no realizan ningún procesamiento hasta que se invoca una operación de terminal en la canalización de flujo; son vagas. Esto se debe a que las operaciones intermedias generalmente pueden fusionarse y procesarse en una sola pasada mediante la operación del terminal.

Para comprender lo que sucede en la canalización de la transmisión, modifique el código para que cada lambda también imprima el plato actual que está procesando. (Como muchas técnicas de demostración y depuración, este es un estilo de programación terrible para código de producción, pero explica directamente el orden de evaluación cuando estás aprendiendo).

```java
```

1 Imprime los platos a medida que se filtran
2 Imprime los platos a medida que extraes sus nombres.

Este código, cuando se ejecute, imprimirá lo siguiente:

filtrado:cerdo
mapeo: cerdo
filtrado:carne
mapeo: carne de res
filtrado:pollo
mapeo: pollo
[cerdo, ternera, pollo]

Al hacer esto, puede notar que la biblioteca Streams realiza varias optimizaciones aprovechando la naturaleza perezosa de las transmisiones. En primer lugar, a pesar de que muchos platos tienen más de 300 calorías, ¡solo se seleccionan los tres primeros! Esto se debe al limitfuncionamiento y a una técnica llamada cortocircuito , como explicaremos en el siguiente capítulo. En segundo lugar, a pesar de que filtery mapson dos operaciones separadas, se fusionaron en el mismo paso (los expertos en compiladores llaman a esta técnica fusión de bucles ).

### 4.4.2.Operaciones terminales

Las operaciones de la terminal producen un resultado de un oleoducto. Un resultado es cualquier valor que no sea de secuencia, como a List, an Integero incluso void. Por ejemplo, en el siguiente canal, forEachhay una operación de terminal que devuelve voidy aplica una lambda a cada plato en la fuente. Al pasar System.out.printlna forEachle pide que imprima todos los elementos Dishde la secuencia creada a partir de menu:

menu.stream().forEach(System.out::println);
Para comprobar su comprensión de las operaciones intermedias y terminales, pruebe el cuestionario 4.2.

Prueba 4.2: Operaciones intermedias versus operaciones terminales
En el flujo de corriente que sigue, ¿puede identificar las operaciones intermedias y terminales?

```java
```

Respuesta:

La última operación en la canalización de flujo countdevuelve a long, que es un valor que no pertenece a la secuencia. Se trata por tanto de una operación terminal . Todas las operaciones anteriores, filter, distinct, limitestán conectadas y devuelven una secuencia. Son por tanto operaciones intermedias .

### 4.4.3.Trabajar con transmisiones

En resumen, trabajar con transmisiones en general implica tres elementos:

Una fuente de datos (como una colección) para realizar una consulta
Una cadena de operaciones intermedias que forman una tubería de flujo.
Una operación de terminal que ejecuta la canalización de flujo y produce un resultado.
La idea detrás de una canalización de flujo es similar al patrón de construcción (consulte http://en.wikipedia.org/wiki/Builder_pattern ). En el patrón del constructor, hay una cadena de llamadas para establecer una configuración (para transmisiones, esta es una cadena de operaciones intermedias), seguida de una llamada a un buildmétodo (para transmisiones, esta es una operación de terminal).

Para mayor comodidad, las tablas 4.1 y 4.2 resumen las operaciones de flujo intermedio y terminal que ha visto en los ejemplos de código hasta ahora. Tenga en cuenta que esta es una lista incompleta de operaciones proporcionadas por Streams API; ¡Verás varios más en el próximo capítulo!

Tabla 4.1.Operaciones intermedias

Operación

Tipo

Tipo de devolución

Argumento de la operación

Descriptor de función

filtrar	Intermedio	Transmitir<T>	Predicado<T>	T -> booleano
mapa	Intermedio	Corriente<R>	Función<T, R>	T->R
límite	Intermedio	Transmitir<T>	 	 
ordenado	Intermedio	Transmitir<T>	Comparador<T>	(T, T) -> entero
distinto	Intermedio	Transmitir<T>	 	 
Tabla 4.2.Operaciones terminales
Operación

Tipo

Tipo de devolución

Objetivo

para cada	Terminal	vacío	Consume cada elemento de un flujo y aplica una lambda a cada uno de ellos.
contar	Terminal	largo	Devuelve el número de elementos de una secuencia.
recolectar	Terminal	(genérico)	Reduce la secuencia para crear una colección como una Lista, un Mapa o incluso un Entero. Consulte el capítulo 6 para obtener más detalles.

## 4.5. Mapa vial

En el próximo capítulo, detallaremos las operaciones de flujo disponibles con casos de uso para que pueda ver qué tipos de consultas puede expresar con ellas. Observamos muchos patrones, como filtrado, división, búsqueda, coincidencia, mapeo y reducción, que pueden usarse para expresar consultas sofisticadas de procesamiento de datos.

Luego, el capítulo 6 explora a los coleccionistas en detalle. En este capítulo solo hemos hecho uso de la collect()operación terminal en secuencias (ver tabla 4.2 ) en la forma estilizada de collect(toList()), que crea a Listcuyos elementos son los mismos que los de la secuencia a la que se aplica.

## Resumen

Una secuencia es una secuencia de elementos de una fuente que soporta operaciones de procesamiento de datos.
Las secuencias utilizan iteración interna: la iteración se abstrae mediante operaciones como filter, mapy sorted.
Hay dos tipos de operaciones de flujo: operaciones intermedias y terminales.
Las operaciones intermedias como filtery mapdevuelven una secuencia y se pueden encadenar. Se utilizan para establecer un conjunto de operaciones pero no producen ningún resultado.
Las operaciones de terminal como forEachy countdevuelven un valor que no es de flujo y procesan una canalización de flujo para devolver un resultado.
Los elementos de una secuencia se calculan según demanda (“perezosamente”).
