# 6. Ejemplo práctico - MovieAdvisor 71m

* 20 Introducción a MovieAdvisor 7:46 
* 21 Creación del proyecto y modelo de datos 5:49 
* 22 Repositorio y acceso a datos (Parte I) 12:55 
* 23 Repositorio y acceso a datos (Parte II) 9:30 
* 24 Servicios 13:28 
* 25 Ejecución de la app 22:28 
* Contenido adicional 1

# 20 Introducción a MovieAdvisor 7:46 

[PDF 6-1_Proyecto_de_ejemplo.pdf](pdfs/6-1_Proyecto_de_ejemplo.pdf)

## Resumen Profesor

No existe.

## Transcripción

hola a todos vamos a finalizar nuestro curso de spring Core con una sucesión de vídeo en la que iremos construyendo poco a poco una aplicación sencilla pero que integra la mayoría de los conceptos con los que hemos trabajado a lo largo del curso este proyecto lo vamos a llamar y va a ser un sencillo recomendador de películas vamos a trabajar con un fichero que fácilmente descargable yo lo he tuneado un poco con datos de casi todas las películas de la historia vale gracias y MDB a Internet para ofrecer estos datos y luego no hemos tomado un poco para que puedan ser utilizado lo que vamos a desarrollar es una herramienta de línea de comandos que bueno veremos después que sintaxis queremos tener a la hora de invocarla aunque nosotros fuera por no emborronar un poco el curso con cosas que no no son parte del pues lo mismo queremos directamente desde clips los datos los tendremos en un fichero CSV Vane que ya digo que hemos procesado y que lo tendréis disponible en el código fuente y que tiene bueno pues los gatos muy sencillos para cada película tiene asignado un y de su título en el idioma original de la película el año en el que fue estrenada y bueno una sucesión separada por comas de los géneros en los cuales podemos enmarcar esa película cómo ver el separador de datos de columnas sería el punto y, y como lo género es un listado tendríamos la coma para hacer de separador dentro de esa columna el diagrama de clases completo de nuestra aplicación va a ser este si quisiéramos solamente en el diagrama el modelo de noche aplicación sería muy sencillo porque sería tan solo una clase la clase vale la clase película que va a guardar los datos de una película cómo lo has visto antes no subiré el título el año de estreno y una lista con los géneros que incluye almacenando los géneros como este pentonces diagrama cobra un poco más de sentido y aunque no es extremadamente complejo pero si es verdad que tenemos que ver cómo lo podemos interpretar como como punto de entrada quién tendrá el método main será una clase móvil Advisor appun método que será el que tenga el algoritmo de la aplicación el que es capaz de procesar los argumentos verificar si la sintaxis correcta en los distintos servicios como decíamos esta clase que es la que tiene el método men lo que hace es cargar el contexto para ellos bueno pues vamos a utilizar la configuración mixta de Java config con anotaciones pues tendrá que usar la clase app-config para cargar ese contexto además la clase en el caso de que queramos visualizar la ayuda a crear otro componente más tenemos la clase muy Advisor gel que será la encargada de cargar desde un fichero de texto la sintaxis de la ayuda vale para que la podamos imprimir por consola a partir de aquí digamos que esta clase esté bien que tiene el algoritmo nuclear de la aplicación va a jugar con dos servicios uno de ellos para que veas que podemos crear tranquilamente sobre una clase se llama service digamos que un servicio de alto nivel con operaciones bastante de alto nivel con alto nivel de abstracción es decir que directamente nos da la posibilidad de obtener pues las películas que tengamos en nuestro almacén de datos por una serie de criterios y por otro lado tenemos realizar implementada por esta clase de aquí que nos va a permitir definir consultas algo más compleja sobre nuestro almacén de datos ambos services in query service utilizan la interfaz feel that vale que es bueno pues de alguna manera el contrato sobre nuestro repositorio que en este caso lo vamos a implementar en memoria y que será la que almacenará todos estos datos veremos como esto lo cargamos desde fichero a través de un método estático que será la encargada de leer este fichero modelo vamos a ponernos manos a la obra vamos a ver qué sintaxis vamos a utilizar para poder luego implementarla de manera correcta la idea que nosotros pudiéramos empaquetar esta aplicación en un bar y pudiéramos proporcionarle una serie de opciones la primera opción más sencilla sería listar los géneros diferentes de todas las películas que tenemos por si queremos saberlo y utilizarlo como criterio de búsqueda madera a partir de aquí podemos utilizar cuatro opciones distintas que serían a g en decir que la película incluya o pertenezca alguno de los géneros que se vistan aquí podríamos poner más de uno separado por comas siempre y cuando no tenga un espacio menos TG que en lugar de indicar que la película pertenece a algún género la película tiene que pertenecer a todos los géneros que incluyamos otro parámetro que se podría añadir serían menos y año vale para ver películas estrenadas en dicho año o bien menos ve desde para ver las películas estrenadas en un intervalo año de inicio y fin y la opción de de un título el decir que el título de la película contenga la cadena de caracteres que nosotros proponemos aquí siempre sin espacio vale por último la opción menos h que mostrara el mensaje me ayuda yo digo una aplicación que es sencilla aunque nuestro primer proyecto completo después tendrá una complejidad media y que además haremos un buen uso de la piscina de Java 8 para poder hacer los filtrados la búsqueda mapeo etcétera etcétera con esto terminamos la presentación del proyecto de ejemplo vamos a hacer en el próximo vídeo la creación del proyecto y de toda la estructura para que podemos empezar a conducir


<img src="images/20-01.png">

<img src="images/20-02.png">

<img src="images/20-03.png">

<img src="images/20-04.png">

<img src="images/20-05.png">

# 21 Creación del proyecto y modelo de datos 5:49 

## Resumen Profesor

No existe.

## Transcripción

hola a todos vamos a continuar creando todo el esqueleto de nuestro proyecto de ejemplo para que podamos empezar a codificarlo para ello fue al igual que en otras ocasiones vamos a crear un nuevo proyecto muy bien podemos evitar el uso de cualquier arquetipo porque no lo vamos a necesitar lo vamos a llamar móvil Advisorcon nuestro proyecto creado con recuerdo que como no sucedía con la persiana de utilizar eclipse de la hora de crear los proyectos tenemos que cambiar para qué lugar de Java 5 podemos usar Java 8 y a partir de aquí vamos a incluir en el pon la dependencia que necesitamos si recordáis tenemos que añadir el elemento raíz dentix y para poder buscar la dependencia nos podríamos ir a repository spring context male versión 508 y no te volvería a la dependencia yo si me permitís la tengo por aquí vale que sería estar aquí o en punto spring framework spring context y la versión 508 lyrics estupendo ya la tenemos por aquí lo siguiente que podríamos hacer vale de una manera sencilla sería incluir dentro de nuestra carpeta rizos en fichero con todos los datos de la película de las películas que hemos visto antes vale o podríamos copiar con control usted y directamente pegar con control v el fichero parece que no pero bueno es a sus 16 megas porque son muchísimos los registros que tiene millones de películas y si no me equivocado yo algo no podríamos incluir aquí directamente ya lo tendríamos disponible vale copiado dentro de nuestro proyecto incluso si lo queremos abrir desde aquí lo podríamos abrir con el con el editor de texto vale aunque es posible que no tengo cierto la veo porque ya digo que es bastante bastante grande lo que sea interesante que conozcamos su estructura y hemos visto que tiene un que tiene un título el año de estreno y que también tiene un listado con los diferentes géneros que conforman o los géneros que a los que pertenece la película bueno pues para ello vamos a crear nuestra clase no lo hemos preocupado mucho en los proyectos anteriores de los la estructuración en paquetes porque realmente tampoco hemos tenido ninguna aplicación compleja aunque aquí como vamos a hacer más grande la parte práctica pues sí que lo vamos a ir creando vamos a crear un nuevo paquete quesería con open móvil Advisor model vale vamos a crear nuestra nueva va a tener un nivel que lo vamos a guardar en un long el título por no complicarnos tampoco con el manejo de fechas y usamos en manejo de fecha anterior a Java 8 el manejo de fechas en Java 8 otra librería como yo la time lo guardaremos dentro de una cadena de caracteres y si después tenemos que hacer algún tipo de transformación la podemos hacer invitado necesario bueno se trata de una clase de las de manual vamos a crear constructor con los parámetros generar getter y setter igual vale lo típico que podríamos necesitar de de una clase podríamos utilizar alguna otra variante usar por ejemplo permiten incluirpara poder empezar desde abajo hacia arriba es decir vamos a empezar a codificar primero la parte de los dados para poder rescatar los datos a partir de ahí iremos subiendo hacia los servicios etcétera etcétera y lo vamos a ir haciendo poco a poco en lo siguiente

# 22 Repositorio y acceso a datos (Parte I) 12:55 

## Resumen Profesor

No existe.

## Transcripción

Paquete que va a contener la configuración a la clase de configuración será solamente una pero podríamos tener para ello creamos aquí una nueva clase y también vamos a indicar que vamos a escanear los componentes un esquema mixto y y el uso de anotaciones webinars todos los pins que se encuentren en esos paquetes o por debajo por ahora no vamos a necesitar nada más ya volveremos vamos a crear entonces la interfaz dado para poder trabajar con almacén con un repositorio de decir cómo crear un nuevo paquete y dentro de este paquete vamos a crear una nueva interfaz llamada interfaz va a tener los métodos que debería implementar cualquier clase que quiera hacer un lado de películas vale sencillo que nos devuelva todas las películas en una colección que películas pues por si acaso necesitamos más adelante insertar editar esto sería como decía nosotros vamos a crear una clase que implemente memoria bueno pues que sea capaz de cargar el fichero memoria y que nos permita tener todas las películas dado su implementación en memoria vamos a necesitar como decía si vamos es que el proyecto quizá todavía aunque le hemos indicado que tiene Java 8 pero es posible que no lo tenga cargado el nivel en el compilador directamente que coja que no nos de castigo vale pues vamos a ver cómo podemos cargar nosotros ahora todas las películas no podemos hacer manejando el ciclo de vida de este link que por cierto es repositorio al ser un vamos a poder manejar su ciclo de vida no podríamos hacer a través de métodos químicos en el quad vamos a intentar cargar las películas desde algún sitio para ello vamos a crear una nueva clase en este caso no lo voy a crear como un bin sino que lo voy a dejar para que lo podáis hacer vosotros que sería la encargada de cargar de procesar el fichero film protectorsi alguien quiere que pudiera ser capaces de leer el fichero está separación es porque este implementación del dado es memoria decírselo a tener pero no sabe de dónde surgen los datos vale y bueno si lo hiciera y otro pues podrían surgir de otro sitio que no fue suficiente para que vosotros podáis que va a devolver películas y qué vas a recibir tres alumnos el path del fichero que ahora veremos que lo podemos colocar en el fichero de properties que vamos a crear separador de CSV que vamos a utilizar para las listas que haya dentro de una columna como sucede con los gemelos lo tendríamos por aquí tendríamos que poco a poco problemas aquí sería hacerlo de esta manera problema podemos con todo lo necesario en medio vamos añadir el formatter porque vamos a incluir aquí el uso de API streaming y expresiones lambda y nos va a dar un poco de estructuras y formateamos el código sagrado nosotros vamos a utilizar estos si os perdéis un poco en esta parte os recomiendo que visitéis nuestro curso de Java 8 donde se explica con abundancia en cómo trabajar con fichero y el cómo usar el API spring nosotros queremos a través de la clase files usar el método online esto no te vuelve un string de string en decir que va a ir leyendo línea a línea en fichero y no lo va a devolver dentro de este lo tenemos que proporcionar nosotros y bueno se lo pasará aquí lo que sucede es que para poder cargar convenientemente el fichero en lugar de acceder vía la sistema de ficheros lo vamos a hacer a través de la clase vale y su método getfield de una manera más conveniente este fichero es lo que sucede que lo devuelve como un tipo que no podemos utilizar y si lo podemos transformar a una URI p la primera línea es la que tiene el encabezado y bueno vamos a querer procesar este CSV para irte de películas vamos a querer que cada línea se hace una transformación como compleja la vamos a hacer y por último lo vamos a querer correr perdón recoger todo listado de almacén haremos y ahora ya nos podemos centrar en el mapa pero este se parece por aumentar un poquito la velocidad de codificación os lo dejo por aquí y os lo explico y ahora veremos qué hace falta cada línea del fichero incluye todos los datos de una película lo que tenemos que hacer es explicarles decir trocearla por el separador que utilizamos en primera instancia en primera instancia del público ellos no devolverá un array de string cada uno de los valores el primer valor qué es un long tenemos que pasar para obtenerlo serie nivel el siguiente es el título de la película el siguiente sería el año y por último tendríamos que tener en estado con los géneros para ello el procesamiento que hacemos también ejercicios por la coma qué es el separador de estado toda la columna te y lo que hacemos es construir con arrays aslist construimos una lista de string con cada uno de los géneros todo ello se lo pasamos al constructor con parámetros y lo devolvemos de forma y manera que este este bloque leerá línea líneas fichero y profesora todas las películas almacenando en el estado todo ello nos obliga a que pongamos un bloque try catch vale porque tenemos posibilidad de tener algún problemilla a la hora de leer el fichero o a la hora de cualquiera cualquier cosa podríamos indicar aquí los errores de lectura y vamos en tal caso incluso podremos terminar directamente la aplicación si no queremos mostrar la traza de la pila podríamos mostrar un mensaje de error como este de aquí no error leyendo el fichero de datos y directamente podríamos podríamos ir incluso nos podemos quedar solamente con el lío excepción que incluye el delfín not found eso ya lo vamos a hacer en el próximo

# 23 Repositorio y acceso a datos (Parte II) 9:30 

## Resumen Profesor

No existe.

## Transcripción

# 24 Servicios 13:28 

## Resumen Profesor

No existe.

## Transcripción

# 25 Ejecución de la app 22:28 

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 1

[PDF 6-1_Proyecto_de_ejemplo.pdf](pdfs/6-1_Proyecto_de_ejemplo.pdf)
