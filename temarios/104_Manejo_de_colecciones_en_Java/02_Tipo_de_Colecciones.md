# 02 Tipo de Colecciones y ejemplo de uso

<img src="images/01-09.png">

Vamos a pasar al punto más largo de este taller en el que vamos a conocer los diferentes tipos de colecciones a través de los interfaces y de sus implementaciones.

<img src="images/01-10.png">

En la diapositiva tenemos el Diagrama de Clases, no esta completo, lo que pasa que añadir más interfaces o implementaciones la verdad es que lo hubiera enmarañado más que aclarado. Tenemos la jerarquía de interfases y clases que podemos encontrar en el paquete `java.util` como parte de las colecciones. Lo que está en *un tono verdoso son interfaces*, lo que está en *un tono salmón son clases abstractas* que no podemos instanciar y las *clases que si podemos utilizar las implementaciones existentes con un fondo blanco*. Las *líneas continuas denotan extensión entre interfaces o entre clases* y *las líneas punteadas denotan la implementación de una determinada interface*, es decir clases que implementan una determida interfaz.

Iremos visitando las diferentes interfaces, clases y clase concretas que tiene este este diagrama, lo iremos viendo poco a poco.

Podemos ver que hay dos grandes tipos están todas las que heredan de *Iterable* y posteriormente de *Collection* y luego tenemos las que heredan de *Map* **se diferencian fundamentalmente en que unas seran colecciones que puedan guardar elementos como tal *todos del mismo tipo* y la otra podrán guardar *pares de una clave asociada a un valor***.

## `Iterable<E>`

<img src="images/01-11.png">

Comencemos por la raíz por **`Iterable<E>`** podemos ver que `Iterable` no remite al concepto de *iterador* *un iterador un patrón de diseño que nos permite recorrer una sucesión o colección de elementos*. 

En las primeras versiones de los iteradores lo que se permitía siempre era recorrer esa colección de elemento a partir de Java 8 se incorpora también la opción de eliminar siempre y cuando la colección subyacente lo permita, veremos que tendremos por ejemplo las colecciones que son no modificables que son inmutables y qué si tratáramos de utilizar este método `remove` tendríamos una excepción.

El hecho de que se pueda heredar de `Iterable` es lo que permite que usemos los métodos *forEach* o el bucle *forEach* que tenemos en la diapositiva ahora mismo no en el que bueno pues podríamos tener por la vía que fuese un iterable y y podríamos iterar o no podríamos recorrer con este bucle que es bastante conocido bastante bastante usual no y nos venimos por aquí vamos a poder ver en pantalla ejemplo de iterable en el que bueno pues un iterable como en el fondo es digamos que una interfaz raíz en la podríamos tener por cualquier día o que como hemos podido comprobar en el diagrama de clases no se puede instanciar directamente tendríamos que proporcionar nosotros una clase que lo implementará lo cual no tendría mucho sentido pero siempre da que no hay muchos contextos en los cuales el lugar de devolverse una colección concreta se nos devuelve un iterable porque en el fondo lo único que se necesita es poder recorrer esta colección ya digo de la manera que bueno que sea conveniente no va a través de el bucle y los polis o incluso del método por I podríamos ver cómo estamos recorriendo dos veces un iterable que estamos teniendo aquí de la forma que sea un ejemplo de un sol iterable por ejemplo lo encontraré y aquellos que visitéis los cursos de Efrén en la parte de Spring data JP por ejemplo los interfaces más sencillos del repositorio de String a JP a por ejemplo trabajan con iterable y hasta que no llegamos alguna implementación un poco un poco más concreta vale no lo sé hacer o no sé tenemos la posibilidad en lugar de trabajar con iterable con otras colecciones más joven le digo que John iterables cómodo en el sentido de que podemos recorrer los objetos sobre sobre miserable heredamos la interfaz colección vale que va a hacer de alguna manera el padre de tres de la colección es que vamos a trabajar ahora de los interfaces que vamos a trabajar extiende iterable dando toda su funcionalidad con lo cual mono pues podríamos seguir recorriendo los elementos también eliminando lo veremos que el resto de interfaces como decía salvo más heredan de the collection con lo cual no Tom conjunto un paraguas de métodos comunes que son transversales a casi todas las colecciones y si bien es cierto que no tenemos ninguna implementación directa de interfaz lo podemos operaciones que nos da de paraguas para el resto de colecciones sería pues purificar el tamaño si está vacío si se contiene un elemento añadir y eliminar elementos iterar sobre el operaciones con un conjunto de datos vale ver si se contienen un los datos de otra colección añadir un conjunto de datos eliminar un conjunto de datos eliminar si se cumple una determinada condición comprobar si una colección contiene un conjunto de otra limpiarla por completo con el método criar transformarlo en un array o incluso la transformación en streaming vale podéis disfrutar el la documentación de interfaz para ver una descripción más concreta de todo esto de todo estos momentos comenzar de las tres colecciones que veíamos de los tres interfaces básicos concept vale sería un tipo de colección muy concreta que no permite elementos duplicados es decir que nosotros añadimos un elemento por segunda vez no va a suceder nada simplemente que no lo va a añadir no se permite tener elemento repetido ya que es una abstracción del concepto matemático de conjunto otra segunda cosa que llama la atención para que ellos que ya por ejemplo ayer y trabajado con algunas colecciones tipo ArrayList bueno porque habéis fichado por vuestra cuenta o con array y que no vamos a encontrar en C es que no permite el acceso posicionales decir no podemos acceder al tercer elemento de este conjunto porque bueno pues de alguna manera para representar una especie de Texaco podríamos llamar donde donde estamos todos esos elementos no siempre va que también hace una mejora con respecto a colecciones y es que mejora la implementación de los métodos y cual y casco de con respecto a a las colecciones y bueno a la hora de comparar bueno la mejora de manera que quedó distancia son iguales si contienen los mismos elementos vamos a ver que tenemos diferentes tipos que podemos utilizar con una subinterfaz Fray que en las cuales no nos vamos a meter si no si ya no iríamos a conocer las implementaciones completa que en el fondo son tres la primera está usted qué serie de las tres implementación es la más rápida de todas después tendríamos linked hash set sería una implementación que heredaría del anterior y qué bueno es un poco más lenta y ya veremos quejarse permite manejar nada con respecto al orden de los elementos y sin embargo limpiar cassette sí que nos va a permitir recuperar los elementos de este C en el orden de inserción por último tendríamos tríceps de las 3 implementaciones en la más lenta y que sí que nos podría aportar el orden de los elementos en el orden según su valor para la iremos conociendo las tres la primera hámster lo que hace es almacenar los valores de esta colección en una tabla hash qué es eso de una tabla está bueno pues una tabla es que haces una tabla que nos permite guardar elementos en función a través de una función hash que en teoría es una función que bueno que recoge el elemento que nosotros queremos insertar y que nos devuelve una valor aplicando lea a ese elemento a través de esta función hash nos devuelve un valor que debería ser univoco único es decir que no se podría repetir esto que tiene vale sin entrar demasiado en abundar en el concepto de esta función escape del casting esto que nos proporciona bueno pues nos proporciona que la mayoría de las operaciones sobre todo la operaciones de acceso vale son en un tiempo constante vale hablaremos a lo largo de este taller un poco de eficiencia algorítmica incluso haremos uso de algún tipo de notación para representarlos no nos meteremos nada excesivamente complejo cuando decimos que la eficiencia sería en ejemplo de la búsqueda de un elemento en un tiempo constante quiere decir que daría igual aproximadamente el tener una una colección de 10 elementos de 10.000 que el tiempo de búsqueda sería aproximadamente el médico vale es decir que no va a variar el tiempo de búsqueda con el número de elementos que contenga esa colegio la operación es que que no sabe paraguas para el resto de colecciones sería verificar el tamaño si está vacío si se contigo un elemento añadir y eliminar elementos y te era sobre el operaciones con un conjunto de datos para ver si se contienen un rato que otra colección añadir un conjunto de datos eliminar un conjunto de datos eliminar si se cumple una determinada condición comprobar si una colección por ti un conjunto de otra limpiarlo por completo con el metro Lucía está formando en una rayo incluso la de la formación en el el sprint para poder visitar en la documentación de Center para ver una decisión más concreta de de todo esto de todo esto que vamos a comenzar de las tres colecciones que veíamos los tres interfaz básico conservar ese sería un un tipo de colección muy concreta que no permite elemento duplicado de decir que nosotros añadimos un elemento por segunda vez no va a suceder nada se ve que no lo bañaré no se permite tener elemento repetido canción del concepto matemático moverte conjunto otra segunda cosa que llama la atención para que yo es que ya por ejemplo hoy hay trabajado con alguna solución es tipo arreglo no porque Javi viciado pero por vuestra cuenta o como una raíz y que no vamos a encontrar en C es que no permite el acceso posición Alex decir no podemos acceder al tercer elemento de este conjunto porque no lo pude alguna manera Eva representar una especie de que sacó podemos llamar a donde donde echamos todo eso elemento no siempre da que también hace una mejora con respecto al cine y es que me muera le prometo haciendo lo que todo igual y casco de Paul respecto a las colecciones bueno a la hora de comprar bueno las mejores de manera que quedó distancia son iguales y con tienen los mismos elementos vamos a ver que que tenemos diferentes tipos que podemos utilizar con una super samurai que en las cuales no nos vamos a meter sino que ya no iríamos a conocer la implementación empresa que en el fondo son 3 la primera fase que sería de la tripulación está más rápida de todas después tendríamos limpiezas sería una invitación que le daría del anterior y qué bueno es un poco más lenta y ya veremos quejarse no no permite manejar nada con respecto al orden del elemento y sin embargo limpieza sé si que no va a permitir recuperar luego lo elementos de DTS en el orden de inserción por último tendríamos que dice de la tarde implantación en el Atleti que sí que no podría aportar el orden de salud elementos en el orden según su vale vale ya iremos conociendo las 3 la primera fase lo que haces almacenar luego los valores de desconexión en una tabla estás qué es eso de de una tabla jamón o puede una tabla



<img src="images/01-12.png">
<img src="images/01-13.png">
<img src="images/01-14.png">
<img src="images/01-15.png">
<img src="images/01-16.png">
<img src="images/01-17.png">
<img src="images/01-18.png">
<img src="images/01-19.png">
<img src="images/01-20.png">
<img src="images/01-21.png">
<img src="images/01-22.png">
<img src="images/01-23.png">
<img src="images/01-24.png">
<img src="images/01-25.png">
<img src="images/01-26.png">
<img src="images/01-27.png">
<img src="images/01-28.png">
<img src="images/01-29.png">
<img src="images/01-30.png">
<img src="images/01-31.png">
<img src="images/01-32.png">
<img src="images/01-33.png">
<img src="images/01-34.png">
<img src="images/01-35.png">
<img src="images/01-36.png">
<img src="images/01-37.png">
<img src="images/01-38.png">
<img src="images/01-39.png">
<img src="images/01-40.png">
<img src="images/01-41.png">
<img src="images/01-42.png">
<img src="images/01-43.png">


