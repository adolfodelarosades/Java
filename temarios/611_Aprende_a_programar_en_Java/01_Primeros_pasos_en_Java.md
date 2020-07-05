# 1. Primeros pasos en Java 30:26
   * 01 Introducción a Java 08:16
   * 02 Software necesario  05:12
   * 03 Primer programa en Java 10:11
   * 04 Reglas sintácticas y estructura de un programa Java 06:47
   
# 01 Introducción a Java 08:16

<img src="images/01-01.png">

Hola en este primer video del curso te voy a introducir en algunas de las características fundamentales de lo que sería la tecnología Java no sólo el lenguaje sino todo lo que le rodea en general.

<img src="images/01-02.png">

Lo primero que tenemos que ver es que Java es un lenguaje que fue desarrollado a mediados de los años noventa por la empresa Sun Microsystems. 

Es un lenguaje orientado a objetos que ya iremos viendo poco a poco a largo del curso que significa eso pero bueno entonces no había muchos lenguajes orientados a objetos, cuando apareció Java estaba C++, SmalTalk y era una característica interesante para un nuevo lenguaje de programación.

Pero quizá lo más importante es que Java es un lenguaje de programación multiplataforma, ahora en un momento vamos a ver qué significa eso.

También muy importante que sepamos y lo tendremos que tener en cuenta siempre que Java no es solamente un lenguaje. Cuando hablamos de Java estamos hablando de un lenguaje de programación, sí pero también de un conjunto de librerías de objetos que tenemos a nuestra disposición para poder hacer los programas.

También comentarte que Java ha ido evolucionando a lo largo de estos veintitantos años desde la versión 1 que apareció a mediados de los noventa hasta la 1.8, actualmente la 1.14.

<img src="images/01-03.png">

Bien pues te decía que una de las principales características por no decir la principal es que Java es un lenguaje multiplataforma, qué significa eso, pues que tú puedes desarrollar un programa, compilarlo y una vez compilado ejecutarlo en cualquier parte, es decir en cualquier sistema operativo, algo totalmente novedoso en la época en la que apareció Java porque hoy en día hay algún otro lenguaje también que tiene esta característica.

Tú desarrollas un programa en Java, lo que tendríamos es un código fuente un archivo con Java y a partir de ahí cuando se compila para que pueda ser ejecutado por el ordenador, se genera los llamados Byte Codes, archivos con extensión `.class` estos archivos no son como los ejecutables clásicos, los `.exe` que solamente se pueden ejecutar en aquella máquina para la que se han compilado, sino que un Byte Codes `.class` puede ser ejecutado en cualquier sistema operativo. Cómo es posible eso. Eso es gracias a la máquina virtual Java JVM. Has oído hablar de alguna vez verdad.

La máquina virtual Java no es más que un software, una especie de extensión del sistema operativo que de lo que se encarga es de traducir en tiempo de ejecución, es decir cuando tú le dices ejecutar este programa Java, lo que hace la máquina virtual Java es traducir ese `.class` a lo que sería ya el ejecutable puro del sistema operativo para el cual estás realizando la ejecución del programa.

Entonces todas las máquinas virtuales, porque hay máquinas virtuales para cada uno de los distintos sistemas operativos que tenemos hoy en día, máquina virtual para Windows, para Linux, para Solaris, todas funcionan igual traducen el `.class` a digamos el código binario propio de ese sistema operativo.

Eso permite pues eso cuando haces un programa no tener que estar preocupándote de si esto va a ir para Windows o para Linux porque ese resultado de la compilación se podrá ejecutar en cualquier sistema operativo.

Esta característica que entonces en aquellos años era muy muy novedosa pues hizo que Java fuera aceptado por gran cantidad de fabricantes software de la época como Oracle, IBM etc.

<img src="images/01-04.png">

Otra de las características que hemos mencionado es que es un lenguaje orientado a objetos. Bueno eso tiene muchas implicaciones ya que a medida que vayas aprendiendo Java ya las irás viendo porque no es una cosa, no es cuestión de un momento, pero bueno de momento decirte que una de esas características de los lenguajes orientados a objetos es que a la hora de hacer un programa Java, tu puedes hacer uso de múltiples objetos.

¿Qué son realmente los objetos? puedes imagínatelo como una especie de cajas negras, en su interior tenemos unas funciones o métodos que realizan tareas, entonces programar en Java es realmente ir cogiendo esos objetos y llamando a esas funciones a métodos de uno y otro y a partir de ir confeccionando la tarea realizada.

Esa es una de las características de los lenguajes orientados a objetos, el hecho de usar objetos ya creados, cajas negras con sus funciones para hacer tareas pero hay más implicaciones que ya las irás aprendiendo.

<img src="images/01-05.png">

Java es más que un lenguaje ya lo hemos dicho al principio cuando hablamos de Java no solamente es un lenguaje de programación, eso es digamos una pequeña parte de ese mundo pero muy importante por supuesto, de hecho en este curso nuestro objetivo es eso enseñarte el lenguaje Java a utilizar las estructuras sintácticas de ese lenguaje, pero el mundo Java es algo más que su lenguaje y son librerías de objetos, son los objetos como los que te he enseñado en la transparencia anterior objetos que te van a permitir hacer un montón de cosas, como acceder a base de datos, realizar operaciones de entrada salida, comunicar aplicaciones con el exterior, generar páginas web lo que se te ocurra porque hay miles y miles de tipos de objetos a nuestra disposición para hacer los programas.

Algunos nombres de librerías clásicas son JDBC para acceder a base de datos, Util para utilidades, IO entrada-salida, Net para comunicaciones hay muchísimas más y a lo largo de tu vida de aprendizaje de Java irás conociendo muchas de esas librerías.

<img src="images/01-06.png">

Por último en esta introducción quería comentarte lo que llamamos las ediciones Java. Vamos a ver son tantísimas las librerías de clases, de tipos de objetos, definitiva a nuestra disposición a la hora de hacer aplicaciones que Sun Mycrosystems cuando empezó a ir creando y más y más de esos tipos de objetos o clase como se le llama tuvo que hacer una división, una organización, todo ese conjunto de clases de tipos de objetos que tenemos pues se dividen en tres grandes bloques aunque aquí hay cuatro.

El primer bloque **Java Standar Edition Java SE** este conjunto de tipos de objetos o librerías de clase forman todo lo que es las clases de uso general que se utilizan para hacer cualquier programa y muy especialmente si te vas a dedicar a hacer lo que se llamarían los programas de escritorios, es decir las típicas aplicaciones los típicos Programa basados en Ventanas donde se instala el programa en la máquina donde va a ser utilizada por el usuario tipo Word o algún programa de ese tipo, eso es lo que se conoce como una aplicación de escritorio todo lo necesario para crear esos programas están en Java Standar Edition Java SE.

**Java Enterprise Edition Java EE** probablemente la versión más importante, porque aquí encontramos todo lo necesario para poder crear aplicaciones para entornos web, que es digamos donde Java está más especializado en creación de aplicaciones para web como el típico Gmail, Hotmail, aplicaciones tipo tienda virtual, es decir todo lo que utilizas a través de la web son aplicaciones web, ese tipo de programas se pueden construir con Java utilizando el conjunto de objetos proporcionados por el Java Enterprise Edition.
 
Tenemos también un **Java Micro Edition Java ME** especialmente pensado para la creación de aplicaciones para dispositivos electrónicos.

Y por último comentarte **Android** no podríamos decir que es una edición de Java porque no fue lanzada por Sum Microsystems sino por Google, que es la librería de clases o el tipo de objetos Android especialmente pensado como sabes para crear programas que se van a ejecutar en los smartphones, tabletas y dispositivos electrónicos que tengan ese sistema operativo de Google que es Android.

Tenemos clases para crear cualquier tipo de aplicación es decir con Java se van a poder realizar y desarrollar cualquier tipo de programa que puedas imaginar cómo ves el reto que tienes por delante es muy interesante y muy apasionante, animo.

# 02 Software necesario  05:12

<img src="images/02-01.png">

Bueno pues después de haber introducido la lección 1 a la tecnología Java imagino que estarás deseando ya ver como hacen tus primeros programas con este lenguaje.

Bien con lo que vamos a ver en esta leccion es qué software necesitamos instalar en nuestros equipos para poder crear programas Java y probarlos.

<img src="images/02-02.png">

Son fundamentalmente dos tipos de programas los que vamos a necesitar para poder programar en Java con nuestro ordenador. Por un lado tenemos lo que se conoce como el JDK Java Development Kit, que es el conjunto de herramientas básicas para poder crear un programa Java, compilarlo, testearlo, esas herramientas las proporciona Oracle, no te lo dije en la lección anterior pero Microsystems es la empresa que inventó Java, desarrollo Java pero fue comprada posteriormente por Oracle y actualmente Oracle el que gestiona todo Java, todas las ediciones, las versiones etc. Entonces desde la página web de Oracle vamos a poder descargar ese JDK con las herramientas básicas, que las podríamos utilizar nosotros desde línea de comandos para poder compilar nuestros programas, ejecutarlos, pero eso es una cosa un poquito rudimentaria y lo normal lo habitual es que los programadores utilicen un segundo programa conocido como entorno de desarrollo, el IDE que de una forma más sencilla a través de menús, botones en barra de herramientas, etc. te permite hacer todas esas operaciones. Por debajo los entornos de desarrollo utilizarán el JDK.

<img src="images/02-03.png">

Como te decía el Java Development Kit nos incluye todo lo necesario para programar en Java. ¿Qué ncluye realmente el JDK? Por supuesto la Máquina Virtual Java, la librerías de clases o de tipos de objetos de lo que se conoce como Java Estándar que lo vimos en la lección anterior y unas herramienta básica que se utilizan en línea de comandos para compilar y ejecutar los programas.

Desde donde vamos a descargar el JDK desde esta dirección.

<img src="images/02-04.png">

Vamos a verla en el navegador, esta es la dirección. Como veis al entrar tenemos este botón que dice download Java.

<img src="images/02-05.png">

Y aquí vemos todas las posibles descargas que podemos hacer del JDK en función del sistema operativo que tengamos, tenemos para Linux, para Solaris, para Windows por supuesto, no es más que un `exe` lo descargamos, lo ejecutamos y vamos siguiendo todos los pasos, las opciones que vienen por defecto, sin tener que modificar nada.

<img src="images/02-06.png">

Y ya con eso tendríamos el JDK instalado en nuestro equipo. Habitualmente mira donde se te va a instalar en el caso de Windows por ejemplo que es lo que tengo yo en los archivos de programa Java ves aquí está JDK, bueno yo tengo varios pero bueno este sería el actual JDK 8, está JDK 9 a punto de salir también en cualquiera de los dos JDK.

<img src="images/02-07.png">

Como veis el 8 1.8 tiene aquí una serie de carpetas y en `bin` están los `.exe`, `java`, `javac` que son las herramientas básicas que te comentaba para que desde línea de comandos poder compilar un programa y ejecutarlo, pero vaya que nosotros no vamos a utilizar esos comandos de esa manera los vamos a utilizar a través del entorno de desarrollo.

<img src="images/02-08.png">

El entorno de desarrollo es un programa, que te facilita la creación de tus propios programas Java combinándolos, ejecutándolos. Utiliza por debajo el JDK pero para ti como programador te va de resultar mucho más sencillo su uso puesto que lo vas a utilizar como cualquier programa, con el que utiliza Word o cualquier otro programa de escritorio.

Cuáles son los entornos de desarrollo o IDEs que se les llama también más habituales.

Tenemos **Netbeans** muy sencillo de manejar y **Eclipse** que es el que se utiliza mayoritariamente por la comunidad de programadores, desarrolladores Java.

Eclipse lo vas a poder descargar desde esta dirección. 

<img src="images/02-10.png">

Verás que al entrar en ella tienes una serie de opciones Eclipse IDE Java Developer, Java etc..

Yo te recomiendo que te descargues está el Eclipse IDE por Java Java Developers EE, porque este te va a permitir crear no solamente los programas de Java estándar sino también incluye toda una serie de plantillas, menús, etc. para desarrollar aplicaciones Web con Java.

Acuérdate que lo decíamos en la lección 1 la edición Java Enterprise Edition es la que te permite crear aplicaciones Web por lo tanto está mucho más completo.

<img src="images/02-11.png">

Si por ejemplo optamos por 64 bit por lo que nos vamos a encontrar es la descarga de un ZIP es decir el Eclipse no es más que un archivo zip lo descomprimimos y una vez que esté descomprimido verás que hay una carpeta se llama eclipse donde tienes ahí el `Eclipse.exe`.

<img src="images/02-12.png">

Que luego te puedes crear un acceso directo al escritorio como tengo yo por aquí y simplemente ejecutándolo ya directamente entrarás en el entorno de desarrollo.

En la siguiente lección vamos a ver precisamente como crear nuestro primer programa una vez que tengamos instaladas estas herramientas.

# 03 :computer: Primer programa en Java `601-01_Primer_Programa` 10:11

<img src="images/03-01.png">

Estás listo para crear tu primer programa Java.

Yo creo que sí, si ya tienes instalada las herramientas que comentábamos en lección anterior pues venga vamos.

Lo que vamos a hacer es iniciar el entorno de desarrollo Eclipse. Si ya te has creado un acceso directo al escritorio. Si no te vas a la carpeta donde lo hayas descomprimido doble click y se ejecutaría Eclipse. Se te pide que selecciones lo que se llama el Workspace qué es eso, un Workspace no es ni más ni menos que una carpeta de tu disco, donde vas a ir guardando todos los proyectos o ejercicios que se le llaman proyectos en Eclipse, que vas a ir realizando relativos a un determinado tema. Por ejemplo si ahora vamos a hacer proyectos de Java básico, pues crearíamos en una carpeta en nuestro disco y a partir de ahí todos los proyectos que se hagan se van a crear en esa carpeta. Cada proyecto en una subcarpeta, si luego vas a crear otros ejercicios ya para Web cambiarías de Workspace seleccionarías otra carpeta diferente y ahí crearían los proyectos relativos a ese otro tipo de programas que vas a realizar.

Bueno seleccionamos el Workspace OK y se va iniciando Eclipse, la tardanza de lo que te va a arrancar el entorno de desarrollo pues ya depende un poco de las características de tu equipo. Posiblemente la primera vez que inicias Eclipse tarde un poquito más que el resto de las veces, andara configurando algunos archivos etc. 

Ya aprovecho para contarte que las versiones de Eclipse van dando nombres de planetas o de satélites en este caso estamos ante la versión Eclipse Mars, pero bueno todas son bastante parecidas creo que hay una después de este eclipse Mars que posiblemente me parece que es la Neon, que a lo mejor es la que te habrás instalado tú. Bueno todas funcionan muy parecido.

Una vez que se cargue Eclipse vamos a maximizar el entorno de desarrollo y bueno la primera vez que entras en un Workspace aparece la ventana de Welcome la cerramos eso solamente va a aparecer la primera vez el resto de veces te aparecerá ya tu Workspace. 

Una cosa importante es qué tipo de programas estoy haciendo yo con Eclipse, son programas para web, son programas Java estándar. Por qué digo eso, porque todo depende de cómo quieras configurar tu entorno en función del tipo de programas que vas a organizar, es lo que se llama la perspectiva, perspectiva es simplemente adaptar las ventanitas al tipo de programa que estás haciendo.

Si nosotros ahora mismo tenemos una perspectiva JavaEE que es la por defecto, si nosotros vamos a hacer programas Java estándar, Java normal mejor cambiar a otra perspectiva más simple y eso lo hacemos a través de el botoncito que dice Open Perspective lu pulsamos y aparecerá una lista de perspectivas hay bastantes posibles perspectivas dependiendo de los tipo de programas que vas a estar haciendo.

<img src="images/03-02.png">

Vamos a seleccionar la perspectiva Java y entonces se adaptará nuestro entorno a este tipo de programas que vamos a realizar simplemente ves que desaparecen algunas pestañas que no son necesarias para este tipo de programas.

Vamos a crear nuestro primer programa o proyecto como se le llama en Eclipse, como es un proyecto de Java estándar, vamos a *File - New - Java Project*  es lo mismo que decir Java estándar,  aparecerá otro cuadro de diálogo en el que se nos va a solicitar el nombre del proyecto le vamos a llamar `601-01_Primer_Programa`.

<img src="images/03-03.png">

Lo que va a hacer es crearnos una carpeta dentro del Workspace elegido al principio, va a coger la versión Java instalada, a partir del JDK que tienen instalado, en el siguiente paso no vamos a tener que hacer nada simplemente es informativo de unas carpetitas que se te van a crear ahí dentro del explorador de paquetes para ese proyecto, bueno damos a Finish.

<img src="images/03-04.png">

<img src="images/03-05.png">

Se nos creo la estructura del proyecto, dentro de JRE tenemos todas las librerías Java que podemos utilizar.

Lo que vamos a hacer es crear nuestro primer archivo de código, que es lo que se conoce como una clase porque aquí en Java como vas ir viendo todos los programas se estructuran en clases.

Vamos a dar con el botón derecho colocado dentro del proyecto New Class.

<img src="images/03-06.png">

y a esa clase que se va a crear en un archivo con extensión `.java` un archivo de código fuente de Java, le tenemos que dar un nombre. 

<img src="images/03-07.png">

Vamos a llamarle por ejemplo saludo porque el primer programa que vamos a hacer va a ser tan simple como generar el típico mensaje de saludo. En el package de momento lo vamos a dejar vacío no vamos a poner nada, aunque no es nada recomendable y vamos a marcar la casilla porque queremos que se nos genere un método `main` dentro de esa clase conocido como el método principal, es el punto de entrada a cualquier programa Java como vas a ver después.

Bueno vamos a finalizar y como vamos a ver ahora se nos creará en la clase y aparecerá aquí.

<img src="images/03-08.png">

*`Saludo.java`*

```java
public class Saludo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
```

Aquí lo tenemos, si no lo ves bien lo puedes ajustar siempre a través de la opción de menú *Window -  Preferences - General - Apaciencia - Colores y Fuentes, pues aquí tenemos una opción para ampliar el texto.

<img src="images/03-09.png">

Vamos a pasar a 14 con lo cual lo veremos un poco mejor.

Vamos a poner la instrucción para mostrar el mensaje.

`System.out.println("Bienvenido a Java!!!");`

Si cometes un error de sintaxis Eclipse te va a ir dando avisos, oye que te falta el punto y coma, te va marcando con una crucecita y te va avisando para que lo vayas corrigiendo. No todos los errores son tan fáciles de detectar.

`System.out.println;` es la que hace la función de sacar un mensaje por pantalla y esto dónde va a salir, en la consola.

Bien ya hemos hecho nuestro programa al guardar ya automáticamente Eclipse compila, genera el `.class`, si tú lo que quieres es ejecutar esto, decirle a la máquina virtual Java oye ese `.class` que se ha generado correspondiente a este código fuente ejecutalo, simplemente le damos al Play y se ejecuta el programa.

<img src="images/03-10.png">

La máquina virtual Java va a buscar el método y lo va a ejecutar y mira ese es el resultado de esta pestañita llamada console. Ahí es donde se saca el mensaje.

Ya has hecho tu primer ejercicio tu primer programa y nos va a servir para ir cogiendo confianza y aprendiendo todo lo que nos espera que es la verdad muchísimo.

*`Saludo.java`*

```java
public class Saludo {

   public static void main(String[] args) {
      System.out.println("Bienvenido a Java!!!")
   }

}
```

# 04 Reglas sintácticas y estructura de un programa Java 06:47  

<img src="images/04-01.png">

En esta lección veremos algunas reglas sintácticas básicas y cómo es la estructura de un programa Java. 

<img src="images/04-02.png">

En primer lugar hablemos de las reglas sintácticas básicas. 

Java es un lenguaje sensitivo ¿Qué significa eso? que hace distinción entre mayúsculas y minúsculas, no es lo mismo declarar una variable o crear una clase utilizar mayúsculas o minúsculas. Las palabras reservadas que se utilizan en el lenguaje Java tienen una determinada sintaxis de mayúsculas, minúsculas que hay que respetar.

Por otro lado todas las instrucciones terminan en punto y coma. 

Los bloques de sentencias van a venir delimitados siempre por llaves. Eso lo has visto ya en el ejercicio que vimos en la lección anterior y lo vamos a ir viendo ahora cuando veamos las estructuras básicas del lenguaje.

Y luego está el tema de los comentarios, se pueden poner comentarios en un programa para indicar determinadas notas que le sirven al programador, pueden ocupar una línea en cuyo caso se crearían con la doble barra o varias líneas barra asterisco la línea del comentario y finalizarían con asterisco barra.

<img src="images/04-03.png">

Y cómo es una estructura de un programa Java. 

Vamos a ver un programa Java se estructura en clases, ya viste en el ejercicio que vimos en el primer ejercicio Java cómo el código estaba creado dentro de una clase.

¿Qué es eso de una clase? Vamos a decir que de momento que una clase es la estructura donde se definen los métodos que va a exponer un determinado tipo de objeto.

Aquí vamos a utilizar muchos objetos como ya hemos dicho al principio de las primeras lecciones y los objetos pertenecen a clases, los objetos exponemos unos métodos y esos métodos están definidos dentro de las clases, así es como se programa en Java a base de ir creando clases, incluso en un programa simple como el que hemos visto en la lección anterior tendrás que crear una clase y dentro de esa clase como mínimo va a haber un método que es el método main que ahora te explicaremos la estructura.

En la diapositiva tienes un ejemplo, una clase se define con la palabra `class` el nombre que le queramos dar a la clase `NombreClase`, es habitual seguir una regla en la cual los nombres de clases siempre comienzan por mayúscula, case sensitive como decíamos antes eso hay que tenerlo en cuenta y si es un nombre compuesto la primera letra de cada palabra se escribirá en mayúsculas como en `NombreClase` y luego están los métodos, los métodos se definen por un nombre en el ejemplo tenemos  
`metodo(int param)` y `metodo2()`, unos parámetros o valores que van a recibir cuando se hace la llamada a un método se le pueden enviar datos desde el punto de llamada y aquí ves en este primer método que tenemos se recibiría un parámetro del tipo entero, se pueden recibir más de uno, serían separados por comas o puede que no reciban nada, en cuyo caso a la hora de definir el método tienes que poner también igualmente los paréntesis, hay un tipo de devolución lo que va a devolver el método después de ejecutar su tarea, devuelve un resultado, que no devuelve nada entonces utilizaríamos la palabra `void`, que va a devolver un resultado de una operación que haga internamente el método pues entonces indicaríamos el tipo de devolución, en el segundo método `metodo2()` el tipo de devolucion es `int` y para indicar dentro del método que vas a devolver, que vas a retornar algo, se utilizaría la palabra `return`.

Si comparamos esto con el programa que vimos en la lección anterior verás que efectivamente un programa creado a base de una clase `public class Saludo`, esta palabra `public` no está puesto en el primer proframa porque realmente no es obligatorio, eso dependerá de donde se quieren hacer las llamadas a esas clases, ya cuando se analicen las clases en detalle ya hablaremos de los posibles valores que se pueden poner durante la declaración de una clase y también de los métodos porque como ves en la clase `Saludo` hay un único método que también tiene la palabra `public` delante, se puede poner `public` o  no ponerlo, ya veremos los llamados modificadores de acceso.

Bueno como te decía pues en el caso del ejercicio que vimos anteriormente pues había un método que es el método `main`, el tipo de devolución es `void` se llama `main`, recibe unos parámetros y en este caso se mostraba un mensaje de saludo, como es `void` no devuelve ningún tipo de resultado no se utiliza la palabra `return`.

<img src="images/04-04.png">

Método `main` lo vemos ahora un poquito más en detalle, es el punto de entrada a un programa Java puedes tener un programa Java con muchas clases, cada clase tendrá su grupo de métodos pero en una tiene que haber un método llamado `main` con la estructura que tienes aquí definida, con la que ya has visto y que hay que respetarla al cien por cien porque ese es el punto de entrada al programa Java y ese es el método que llamará la máquina virtual Java cuando nosotros le digamos ejecutamos este programa, cuando le digamos eso la máquina virtual Java buscará el método `main` que tenga esta estructura de código y lo ejecutará a partir de aquí se crearán objetos de otras clases se llamarán otros métodos etcétera.

El método `main` como te decía tiene que ser `public` para que pueda ser llamado desde fuera de esa clase, concretamente por la máquina virtual Java. 

El método `main` tiene que ser también `static` esto es una palabra que unos métodos lo tienen otros no. En el caso de que lleven la palabra `static` porque `main` lo tiene que llevar, quien lo llame podrá llamarlo sin necesidad de crear un objeto de esta clase, en el caso de `main` como lo va a llamar la máquina virtual Java tiene que ser `static` para que la máquina virtual Java no tenga que crear objetos.

El tipo de devolución es `void` no devuelve ningún resultado.

El nombre tiene que ser `main`, los nombres de métodos suelen ser habitualmente en minúsculas.Tiene que ser así nombre tal cual lo estás viendo y luego los parámetros que puede recibir `main`. Y es que cuando la máquina virtual Java llama a este método, opcionalmente le puede proporcionar cierta información en la llamada, aunque no se suele usar habitualmente pero aquí lo recibiría a través de un array de cadena de caracteres `main(String[] args)`.

En los siguientes métodos vamos a ir viendo ya más sobre la sintaxis de Java, que instrucciones puedes poner en el `main` para realizar tu código, llamar otros métodos, otros objetos, etc..
