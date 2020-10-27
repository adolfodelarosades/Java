# 2. Elegir sus herramientas y comenzar

* ¿Maven o Gradle?
    * Apache Maven
    * Gradle
    * Elegir entre Maven y Gradle
* ¿Java o Kotlin?
    * Java
    * Kotlin
* Elegir entre Java y Kotlin
* Elegir una versión de Spring Boot
* El Spring Initializr
* Línea de comandos directa de Outta (Outta Commandline)
* Permanecer en entornos de desarrollo integrados (IDE)
* Cruising down main()
* Resumen

Comenzar a crear aplicaciones Spring Boot es fácil, como verá pronto. La parte más difícil puede ser decidir cuál de las opciones disponibles le gustaría elegir.

En este capítulo, examinaremos algunas de las excelentes opciones que tiene disponibles para crear aplicaciones Spring Boot: sistemas de compilación, lenguajes, cadenas de herramientas, editores de código y más.

## ¿Maven o Gradle?

Históricamente, los desarrolladores de aplicaciones Java han tenido algunas opciones para las herramientas de construcción de proyectos. Algunos han caído en desgracia con el tiempo, por una buena razón, y ahora nos hemos unido como una comunidad en torno a dos: Maven y Gradle. Spring Boot soporta ambos con igual aplomo.

### Apache Maven

Maven es una opción popular y sólida para un sistema de automatización de construcción. Ha existido durante bastante tiempo, habiendo tenido su comienzo en 2002 y convirtiéndose en un proyecto de alto nivel en la Apache Software Foundation en 2003. Su enfoque declarativo era (y es) conceptualmente más simple que las alternativas de la época y de ahora: simplemente cree un archivo con formato XML llamado `pom.xml` con las dependencias y complementos deseados. Cuando ejecuta el comando `mvn`, puede especificar una "fase" para completar, que realiza una tarea deseada como compilar, eliminar resultados anteriores, empaquetar, ejecutar una aplicación y más.

![02-01](images/02-01.png)

Maven también crea y espera una estructura de proyecto particular por convención. Por lo general, no debe desviarse mucho, si es que lo hace, de esa estructura a menos que esté preparado para luchar contra su herramienta de construcción, una búsqueda contraproducente si alguna vez hubo una. Para la gran mayoría de los proyectos, la estructura convencional de Maven funciona a la perfección, por lo que no es algo que probablemente deba cambiar.

![02-02](images/02-02.png)

**NOTA**

Para obtener más detalles sobre la estructura esperada del proyecto de Maven, consulte la [Introducción al diseño de directorio estándar de The Maven Project](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html).

Si llega un momento en que las convenciones del proyecto de Maven y/o el enfoque estrictamente estructurado de las compilaciones se vuelven demasiado restrictivos, existe otra excelente opción.

### Gradle

Gradle es otra opción popular para crear proyectos de máquinas virtuales Java (JVM). Lanzado por primera vez en 2008, Gradle aprovecha un lenguaje específico de dominio (DSL) para producir un archivo de compilación `build.gradle` que es mínimo y flexible. Consulte la Figura 2-3 para ver un ejemplo de un archivo de compilación de Gradle para una aplicación Spring Boot.

Gradle le permite a usted, el desarrollador, elegir usar los lenguajes de programación Groovy o Kotlin para un DSL. También ofrece varias funciones destinadas a reducir el tiempo de espera para que se construya un proyecto, como:

* Compilación incremental de clases de Java

* Compile evitación para Java (en los casos en que no se produjeron cambios)

* Un demonio dedicado para la compilación de proyectos

![02-03](images/02-03.png)

### Elegir entre Maven y Gradle

Es posible que su elección de herramienta de construcción no parezca una gran elección en este momento. ¿Por qué no elegir simplemente Gradle?

El enfoque declarativo más rígido de Maven (algunos podrían decir obstinado) mantiene las cosas increíblemente consistentes de un proyecto a otro, de un entorno a otro. Si sigue el método de Maven, normalmente surgen pocos problemas, lo que le permite concentrarse en su código sin preocuparse mucho por la compilación.

Como sistema de compilación basado en programación/scripting, Gradle ocasionalmente también tiene problemas para digerir las versiones iniciales de nuevas versiones del lenguaje. El equipo de Gradle es receptivo y, por lo general, resuelve estos problemas con mucha prisa, pero si prefiere (o debe) sumergirse inmediatamente en las versiones de lenguaje de acceso temprano, esto merece consideración.

Gradle puede ser más rápido para las compilaciones y, a veces, significativamente más rápido, especialmente en proyectos más grandes. Dicho esto, para su proyecto típico basado en microservicios, no es probable que los tiempos de compilación difieran tanto entre proyectos similares de Maven y Gradle.

La flexibilidad de Gradle puede ser un soplo de aire fresco para proyectos simples y proyectos con requisitos de construcción muy complejos. Pero especialmente en esos proyectos complejos, la flexibilidad adicional de Gradle puede resultar en más tiempo dedicado a ajustes y solución de problemas cuando las cosas no funcionan de la manera esperada. TANSTAAFL (No existe nada como un almuerzo gratis).

Spring Boot admite tanto Maven como Gradle, y si usa Initializr (que se tratará en una sección a continuación), el proyecto y el archivo de compilación deseado se crean para usted, para que pueda comenzar a trabajar rápidamente. En resumen, pruebe ambos, luego elija lo que funcione mejor para usted. Spring Boot lo apoyará felizmente de cualquier manera.

## ¿Java o Kotlin?

Si bien hay muchos idiomas disponibles para usar en la JVM, dos disfrutan del uso más extendido. Uno es el lenguaje JVM original, Java; el otro es relativamente nuevo en el espacio, Kotlin. Ambos son ciudadanos de primera clase en Spring Boot.

### Java

Dependiendo de si considera la versión pública 1.0 o el origen del proyecto como su fecha de nacimiento oficial, Java ha existido durante 25 o 30 años, respectivamente. Sin embargo, es cualquier cosa menos estancada. Desde septiembre de 2017, Java ha estado en un ciclo de lanzamiento de seis meses, lo que resulta en mejoras de funciones más frecuentes que antes. Los encargados del mantenimiento han limpiado la base de código y han eliminado las funciones eliminadas por otras nuevas, además de introducir funciones vitales impulsadas por la comunidad Java. Java es más vibrante que nunca.

Ese ritmo dinámico de innovación, combinado con la longevidad de Java y el enfoque constante en la compatibilidad con versiones anteriores, significa que existen innumerables tiendas de Java que mantienen y crean aplicaciones Java críticas a diario en todo el mundo. Muchas de esas aplicaciones usan Spring.

Java forma la base sólida de casi todo el código base de Spring y, como tal, es una excelente opción para usar en la construcción de sus aplicaciones Spring Boot. Examinar el código de Spring, Spring Boot y todos los proyectos relacionados es una simple cuestión de visitar GitHub donde está alojado y verlo allí, o clonar el proyecto para revisarlo sin conexión. Y con la disponibilidad de una gran cantidad de código de ejemplo, proyectos de muestra y guías de "Introducción" escritas con Java, la escritura de aplicaciones Spring Boot con Java puede tener un mejor soporte que cualquier otra combinación de cadena de herramientas en el mercado.

### Kotlin

En términos relativos, Kotlin es el chico nuevo de la cuadra. Creado por JetBrains en 2010 y hecho público en 2011, Kotlin fue creado para abordar las brechas percibidas en la usabilidad de Java. Diseñado desde el principio para ser:

* Conciso: Kotlin requiere un código mínimo para comunicar claramente la intención al compilador (y a uno mismo y a otros desarrolladores).

* Seguro: Kotlin elimina los errores relacionados con nulos al eliminar la posibilidad de valores nulos de forma predeterminada, a menos que el desarrollador anule específicamente el comportamiento para permitirlos.

* Interoperable: Kotlin tiene como objetivo la interoperabilidad sin fricciones con todas las bibliotecas de navegadores, Android y JVM existentes.

* Fácil de usar: cree aplicaciones Kotlin en numerosos entornos de desarrollo integrados (IDE) o desde la línea de comandos, al igual que Java.

Los mantenedores de Kotlin amplían las capacidades del lenguaje con mucho cuidado, pero también con gran velocidad. Sin más de 25 años de compatibilidad de idiomas como un enfoque de diseño central, se han movido rápidamente para agregar capacidades muy útiles que probablemente aparecerán en Java en algunas versiones más adelante.

Además de ser conciso, Kotlin también es un idioma muy fluido. Sin profundizar en demasiados detalles todavía, varias características del lenguaje contribuyen a esta elegancia lingüística, entre ellas funciones de extensión y notación infija. Discutiré esta idea con más profundidad más adelante, pero hace posibles opciones de sintaxis como esta:

```kotlin
infix fun Int.multiplyBy(x: Int): Int { ... }

// calling the function using the infix notation
1 multiplyBy 2

// is the same as
1.multiplyBy(2)
```

Como puede imaginar, la capacidad de definir su propio "lenguaje dentro de un lenguaje" más fluido puede ser una bendición para el diseño de API. Combinado con la concisión de Kotlin, esto puede hacer que las aplicaciones Spring Boot escritas en Kotlin sean aún más cortas y más legibles que sus contrapartes de Java, sin pérdida en la comunicación de intención.

Kotlin ha sido un ciudadano de primera clase en Spring Framework desde que se lanzó la versión 5.0 en otoño de 2017, con soporte completo propagándose a través de Spring Boot (primavera de 2018) y otros proyectos de componentes desde entonces. Además, toda la documentación de Spring se está ampliando para incluir ejemplos tanto en Java como en Kotlin. Esto significa que, efectivamente, puede escribir aplicaciones Spring Boot completas con Kotlin tan fácilmente como con Java.

## Elegir entre Java y Kotlin

Lo sorprendente es que en realidad no tienes que elegir. Kotlin compila con la misma salida de código de bytes que Java; y dado que se pueden crear proyectos Spring que incluyan tanto archivos fuente de Java como Kotlin, y que puedan llamar a ambos compiladores con facilidad, puede usar el que tenga más sentido para usted incluso dentro del mismo proyecto. ¿Qué te parece tener tu pastel y comértelo también?

Por supuesto, si prefiere uno sobre el otro o tiene otras restricciones personales o profesionales, obviamente puede desarrollar aplicaciones completas en uno u otro. Es bueno tener opciones, ¿no?

## Elegir una versión de Spring Boot

Para aplicaciones de producción, siempre debe usar la versión actual de Spring Boot con las siguientes excepciones temporales y limitadas:

* Actualmente está ejecutando una versión anterior, pero está actualizando, volviendo a probar e implementando sus aplicaciones en algún orden tal que simplemente no ha llegado a esta aplicación en particular.

* Actualmente está ejecutando una versión anterior, pero hay un conflicto o error identificado que informó al equipo de Spring y se le indica que espere una actualización de Boot o una dependencia en cuestión.

* Debe utilizar funciones en una instantánea, un hito o una versión candidata a lanzamiento previa a GA (General Availability - disponibilidad general) y está dispuesto a aceptar los riesgos inherentes al código que aún no se ha declarado GA, es decir, "listo para su uso en producción".

**NOTA**

Las versiones Snapshot, Milestone y Release Candidate (RC) se prueban exhaustivamente antes de su publicación, por lo que ya se ha aplicado una gran cantidad de rigor para garantizar su estabilidad. Sin embargo, hasta que se apruebe y publique la versión completa de GA, siempre existe la posibilidad de cambios en la API, correcciones, etc. Los riesgos para su aplicación son bajos, pero tendrá que decidir por sí mismo (y probar y confirmar) si esos los riesgos son manejables cuando se considera el uso de cualquier software de acceso anticipado.

## El Spring Initializr

Hay muchas formas de crear una aplicación Spring Boot, pero la mayoría lleva a un único punto de partida: Spring Initializr (Figura 2-4).

![02-04](images/02-04.png)

A veces se hace referencia simplemente a su URL, `start.spring.io`, y se puede acceder a Spring Initializr desde asistentes de creación de proyectos dentro de IDE prominentes, a través de la línea de comandos o, con mayor frecuencia, a través de un navegador web. El uso del navegador web proporciona algunas funciones adicionales útiles a las que (todavía) no se puede acceder a través de otras vías.

Para comenzar a crear un proyecto Spring Boot de la mejor manera posible ™, dirija su navegador a https://start.spring.io. A partir de ahí, elegiremos algunas opciones y comenzaremos.

#### INSTALACIÓN DE JAVA

Supongo que si ha llegado a este punto, ya ha instalado una versión actual del Java Development Kit (JDK), a veces denominado Java Platform, Standard Edition, en su máquina. Si aún no ha instalado Java, deberá hacerlo antes de continuar.

Proporcionar instrucciones detalladas sobre cómo hacerlo está fuera del alcance de este libro, pero algunas recomendaciones tampoco estarían mal, ¿verdad? :)

¡Descubrí que la forma más fácil de instalar y administrar uno o más JDK en su máquina es usando SDKMAN !. Este administrador de paquetes también facilita la instalación de la interfaz de línea de comandos (CLI) de Spring Boot que usará más adelante (y muchas, muchas otras herramientas), por lo que es una aplicación de utilidad increíblemente útil. Si sigue las instrucciones en https://sdkman.io/install, estará listo para rodar.

Desde SDKMAN !, es cuestión de instalar la versión deseada de Java usando `sdk list java` para ver las opciones, luego `sdk install java <insert_desired_java_here>` para instalar. Existen numerosas opciones excelentes, pero para empezar, le recomiendo que elija la versión actual de Long Term Support (LTS) empaquetada por AdoptOpenJDK con Hotspot JVM, p. Ej. `11.0.7.hs-adpt`.

Si prefiere no utilizar SDKMAN! por el motivo que sea, también puede elegir descargar e instalar un JDK directamente desde https://adoptopenjdk.net/. Hacerlo lo pondrá en funcionamiento, pero dificulta las actualizaciones y no lo ayudará en el futuro con la actualización o si necesita administrar varios JDK.

<hr>

Para comenzar con Initializr, primero elegimos el sistema de compilación que planeamos usar con nuestro proyecto. Como se mencionó anteriormente, tenemos dos excelentes opciones: Maven y Gradle. Elijamos Maven para este ejemplo.

A continuación, elegiremos Java como base (del lenguaje) para este proyecto.

Como ya habrá notado, Spring Initializr selecciona suficientes valores predeterminados para las opciones presentadas para crear un proyecto sin ninguna entrada suya. Cuando llegó a esta página web, Maven y Java ya estaban preseleccionados. La versión actual de Spring Boot también lo es, y para este (y para la mayoría) de los proyectos, eso es lo que querrá seleccionar.

Podemos dejar las opciones en Metadatos del proyecto como están sin problemas, aunque las modificaremos para proyectos futuros.

Y por ahora, tampoco incluimos ninguna dependencia. De esta manera, podemos enfocarnos en la mecánica de la creación del proyecto, no en un resultado en particular.

Sin embargo, antes de generar ese proyecto, hay un par de características realmente agradables de Spring Initializr que me gustaría señalar, junto con una nota al margen.

Si desea examinar los metadatos de su proyecto y los detalles de dependencia antes de la generación del proyecto en función de sus selecciones actuales, puede hacer clic en el botón Explorar o usar el método abreviado de teclado, *Ctrl + Espacio*, para abrir el Explorador de proyectos de Spring Initializr (Figura 2-5 ). El Initializr luego le presentará la estructura del proyecto y el archivo de compilación que se incluirá en el proyecto comprimido (.zip) que está a punto de descargar. Puede revisar la estructura del directorio/paquete, el archivo de propiedades de la aplicación (más sobre esto más adelante) y las propiedades y dependencias del proyecto especificadas en su archivo de compilación: ya que estamos usando Maven para este proyecto, nuestro `pom.xml`.

![02-05](images/02-05.png)

Esta es una forma rápida y práctica de verificar la configuración y las dependencias del proyecto antes de descargar, extraer y cargar en su IDE su proyecto nuevo y vacío.

Otra característica más pequeña de Spring Initializr, pero que ha sido bien recibida por numerosos desarrolladores, es el modo oscuro. Al deslizar el interruptor de la interfaz de usuario oscura en la parte superior de la página hacia la derecha, cambia al modo oscuro de Initializr y lo convierte en el predeterminado cada vez que visita la página. Es una característica pequeña, pero si mantiene su máquina en modo oscuro en cualquier otro lugar, ciertamente hace que cargar Initializr sea menos discordante y más agradable. ¡Querrás seguir regresando!

![02-06](images/02-06.png)

**NOTA**

Aparte de la clase de aplicación principal y su método principal, más una prueba vacía, Spring Initializr no genera código por usted; genera el proyecto para usted, según su orientación. Es una pequeña distinción, pero muy importante: la generación de código tiene resultados muy variados y, a menudo, lo paraliza en el momento en que comienza a hacer cambios. Al generar la estructura del proyecto, incluido el archivo de compilación con las dependencias especificadas, Initializr le proporciona un comienzo en ejecución para escribir el código que necesita para aprovechar la configuración automática de Spring Boot. Autoconfig te da superpoderes sin la camisa de fuerza.

A continuación, haga clic en el botón Generar para generar, empaquetar y descargar su proyecto, guardándolo en la ubicación elegida en su máquina local. Luego navegue hasta ese archivo .zip descargado y descomprímalo para prepararse para desarrollar su

## Línea de comandos directa de Outta (Outta Commandline)

Si felizmente pasa tanto tiempo como sea posible en la línea de comando o desea eventualmente crear un proyecto de script, la Interfaz de línea de comando (CLI) de Spring Boot fue hecha para usted. La CLI de Spring Boot tiene muchas capacidades poderosas, pero por ahora, limitaremos nuestro enfoque a crear un nuevo proyecto de arranque.

#### INSTALACIÓN DE LA CLI SPRING BOOT

Quizás la forma más fácil de instalar Spring Boot CLI es a través de SDKMAN !, como con su JDK, las utilidades de Kotlin y más. Desde la ventana de su terminal, puede ejecutar

```sh
sdk list
```

para ver todos los distintos paquetes disponibles para la instalación; La Figura 2-7 muestra la entrada de la CLI de Spring Boot. Next, run

```sh
sdk list springboot
```

para ver las versiones disponibles de Spring Boot CLI, luego instale la más reciente (actual) con

```sh
sdk install springboot
```

¡Si no proporciona un identificador de versión específico con el SDKMAN! comando `sdk install <tool> <version_identifier>`, SDKMAN! normalmente instala la última versión de producción recomendada del lenguaje/herramienta. Esto tiene diferentes significados para diferentes paquetes compatibles; a modo de ejemplo, se instalará la última versión de soporte a largo plazo (LTS) de Java, no una versión más reciente (no LTS) que pueda estar disponible. Esto se debe a que se lanza una nueva versión numerada de Java cada seis meses, y periódicamente, una versión se designa como una versión LTS, lo que significa que a menudo hay una o más versiones más nuevas que solo son oficialmente compatibles durante seis meses cada una (para la evaluación de funciones, pruebas, o incluso implementaciones de producción) mientras que una versión de LTS en particular es totalmente compatible con actualizaciones y correcciones de errores.

La nota anterior es una generalización que puede variar un poco entre los proveedores de JDK, aunque la mayoría no se aleja mucho (si es que lo hace) de las designaciones habituales. Se han dedicado charlas enteras a los detalles, pero para nuestros propósitos aquí, no tienen ningún efecto.

![02-07](images/02-07.png)

Una vez que haya instalado Spring Boot CLI, puede crear el mismo proyecto que creamos anteriormente con el siguiente comando:

```sh
spring init
```

Para extraer el proyecto comprimido en un directorio llamado *demo*, puede ejecutar el siguiente comando:

```sh
unzip demo.zip -d demo
```

Espera, ¿cómo puede ser tan fácil? En una palabra, valores predeterminados. Spring CLI usa la misma configuración predeterminada que Spring Initializr (Maven, Java, etc.), lo que le permite proporcionar solo argumentos para los valores que desea cambiar. Proporcionemos valores específicos para algunos de esos valores predeterminados (y agreguemos un giro útil para la extracción de proyectos) solo para ver mejor lo que está involucrado.

```sh
spring init -a demo -l java --build maven demo
```

Todavía estamos inicializando un proyecto con Spring CLI, pero ahora proporcionamos los siguientes argumentos:

* `-a demo` (o `--artifactId demo`) nos permite proporcionar un ID de artefacto para el proyecto; en este caso, lo llamamos "demo"

* `-l java` (o `--language java`) nos permite especificar Java, Kotlin o Groovy 1 como el lenguaje principal que usaremos para este proyecto.

* `--build` es la bandera para el argumento del sistema de construcción; los valores válidos son `maven` y `gradle`

* `-x demo` solicita a la CLI que extraiga el archivo .zip del proyecto resultante devuelto por Initializr; tenga en cuenta que la `-x` es opcional y que especificar una etiqueta de texto sin una extensión (como lo hemos hecho aquí) se infiere útilmente como un directorio de extracción

**NOTA**

Todas estas opciones se pueden revisar más a fondo ejecutando `spring help init` desde la línea de comando.

Las cosas se complican un poco más al especificar dependencias. Como puede imaginar, es difícil superar la facilidad de elegirlos del "menú" presentado por Spring Initializr. Pero la flexibilidad de Spring CLI es extremadamente útil para inicios rápidos, secuencias de comandos y canalizaciones de compilación.

Una cosa más: de forma predeterminada, la CLI aprovecha Initializr para proporcionar sus capacidades de creación de proyectos, lo que significa que los proyectos creados mediante cualquiera de los mecanismos (CLI o mediante la página web de Initializr) son idénticos. Esa consistencia es absolutamente esencial en un taller que utiliza directamente las capacidades de Spring Initializr.

Sin embargo, ocasionalmente, una organización controla estrictamente qué dependencias sus desarrolladores pueden incluso usar para crear proyectos. Para ser completamente honesto, este enfoque me entristece y se siente muy limitado por el tiempo, lo que impide la agilidad de una organización y la capacidad de respuesta del usuario/mercado. Si está en una organización de este tipo, esto complica su capacidad para "hacer el trabajo" en cualquier cosa que se proponga lograr.

Siendo ese el caso, es posible crear su propio generador de proyectos (incluso clonando el repositorio para Spring Initializr) y usarlo directamente a través de la página web resultante ... o solo exponer la parte de la API REST y utilizarla desde Spring CLI. Para hacerlo, simplemente agregue este parámetro a los comandos mostrados anteriormente:

```sh
--target https://insert.your.url.here.org (reemplazando con su URL válida, por supuesto)
```

## Permanecer en entornos de desarrollo integrados (IDE)

Independientemente de cómo cree su proyecto Spring Boot, deberá abrirlo y escribir un código para crear una aplicación útil.

Hay tres IDE principales y numerosos editores de texto que hacen un trabajo respetable al ayudarlo como desarrollador. Los IDE incluyen, pero no se limitan a, [Apache NetBeans](https://netbeans.apache.org/), [Eclipse](https://www.eclipse.org/) e [IntelliJ IDEA](https://www.jetbrains.com/idea/). Los tres son software de código abierto (OSS) y los tres son gratuitos en muchas circunstancias 2

En este libro, como en mi vida diaria, utilizo principalmente IntelliJ Ultimate Edition. En realidad, no existe una elección incorrecta, sino una preferencia personal (o mandato o preferencia organizacional) para elegir un IDE, así que utilice lo que mejor se adapte a usted y a sus gustos. La mayoría de los conceptos se transfieren bastante bien entre las principales ofertas.

También hay varios editores que han obtenido un gran número de seguidores entre los desarrolladores. Algunas, como [Sublime Text](https://www.sublimetext.com/), son aplicaciones pagas que tienen muchos seguidores debido a su calidad y longevidad. Otros participantes más recientes en el campo, como [Atom](https://atom.io/) (creado por Github, que ahora es propiedad de Microsoft) y [Visual Studio Code](https://code.visualstudio.com/) (abreviado a VSCode, creado por Microsoft) están ganando capacidades y seguidores leales rápidamente.

En este libro, de vez en cuando utilizo VSCode o su homólogo creado a partir de la misma base de código pero con la telemetría/seguimiento desactivado, [VSCodium](https://vscodium.com/). Para admitir algunas de las características que la mayoría de los desarrolladores esperan y/o requieren de su entorno de desarrollo, agrego las siguientes extensiones a VSCode/VSCodium:

* [Spring Boot Extension Pack (Pivotal)](https://marketplace.visualstudio.com/items?itemName=Pivotal.vscode-boot-dev-pack): esto incluye varias otras extensiones, incluido Spring Initializr Java Support, Spring Boot Tools y Spring Boot Dashboard, que facilitan la creación, edición y administración de aplicaciones Spring Boot dentro de VSCode respectivamente

* [Depurador para Java (Microsoft)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug): dependencia del panel de Spring Boot

* [IntelliJ IDEA Keybindings (Keisuke Kato)](https://marketplace.visualstudio.com/items?itemName=k%E2%80%94kato.intellij-idea-keybindings): debido a que uso principalmente IntelliJ, esto me facilita cambiar entre los dos más fácilmente

* [Soporte de lenguaje para Java ™ (Red Hat)](https://marketplace.visualstudio.com/items?itemName=redhat.java): dependencia de las herramientas Spring Boot

* [Maven para Java (Microsoft)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven): facilita el uso de proyectos basados en Maven

Hay otras extensiones que pueden resultarle útiles para manipular XML, Docker u otras tecnologías auxiliares, pero estas son las esenciales para nuestros propósitos actuales.

Continuando con nuestro proyecto Spring Boot, querrá abrirlo en el IDE o editor de texto que elija. Para la mayoría de los ejemplos de este libro, usaremos IntelliJ IDEA, un IDE muy capaz (escrito en Java y Kotlin) producido por JetBrains. Si ya ha asociado su IDE con archivos de compilación del proyecto, puede hacer doble clic en el archivo pom.xml en el directorio de su proyecto (usando Finder en Mac, Explorador de archivos en Windows o uno de los varios administradores de archivos en Linux) y cargue el proyecto en su IDE automáticamente. De lo contrario, puede abrir el proyecto desde su IDE o editor de la manera recomendada por sus desarrolladores.

**NOTA**

Muchos IDE y editores ofrecen una forma de crear atajos de línea de comandos para iniciar y cargar, lo que abre su proyecto con un comando corto. Los ejemplos incluyen la idea de IntelliJ, el código de VSCode / VSCodium y los atajos de átomo de Atom.

## Cruising down main()

Ahora que hemos cargado el proyecto en nuestro IDE (o editor), echemos un vistazo a lo que hace que un proyecto Spring Boot (Figura 2-8) sea un poco diferente a una aplicación Java estándar.

![02-08](images/02-08.png)

Una aplicación Java estándar contiene (por defecto) un método principal vacío estático público vacío. Cuando ejecutamos una aplicación Java, la JVM busca este método como punto de partida de la aplicación, y sin él, el inicio de la aplicación falla con un error como este que se muestra en la Figura 2-9.

![02-09](images/02-09.png)

Por supuesto, puede colocar el código que se ejecutará al iniciar la aplicación en el método principal de una clase Java, y una aplicación Spring Boot hace exactamente eso. Al iniciarse, una aplicación Spring Boot verifica el entorno, configura la aplicación, crea el contexto inicial e inicia la aplicación Spring Boot. Lo hace mediante una única anotación de nivel superior y una única línea de código, como se muestra en la Figura 2-10.

![02-10](images/02-10.png)

Nos sumergiremos bajo las cubiertas de estos mecanismos a medida que se desarrolle el libro. Por ahora, basta con decir que Boot le quita de las manos una gran cantidad de tediosa configuración de la aplicación durante el inicio de la aplicación por diseño y de forma predeterminada para que pueda comenzar rápidamente a escribir código significativo.

## Resumen

Este capítulo ha examinado algunas de las opciones de primera clase que tiene para crear aplicaciones Spring Boot. Ya sea que prefiera construir sus proyectos usando Maven o Gradle, escribir código en Java o Kotlin, o crear proyectos desde la interfaz web proporcionada por Spring Initializr o su socio de línea de comandos, Spring Boot CLI, tiene todo el poder y la facilidad de Spring Boot al alcance de su mano sin compromiso. También puede trabajar con proyectos de arranque utilizando una variedad impresionante de IDE y editores de texto con soporte Spring Boot de primer nivel.

Como se explica aquí y en el capítulo 1, Spring Initializr trabaja arduamente para que su proyecto se cree rápida y fácilmente. Spring Boot contribuye de manera significativa a lo largo del ciclo de vida del desarrollo con su:

* Gestión de dependencias simplificada, que entra en juego desde la creación del proyecto hasta el desarrollo y mantenimiento

* Autoconfiguración que reduce/elimina drásticamente el texto estándar que de otro modo podría escribir antes de trabajar en el dominio del problema

* Implementación simplificada que simplifica el empaquetado y la implementación

Y todas estas capacidades son totalmente compatibles independientemente del sistema de compilación, el lenguaje o las opciones de la cadena de herramientas que realice en el camino. Es una combinación increíblemente flexible y poderosa.

En el próximo capítulo, crearemos nuestra primera aplicación Spring Boot realmente significativa: una aplicación que proporciona una API REST.

<hr>

1 El soporte Groovy todavía se proporciona dentro de Spring Boot, pero no es tan ampliamente utilizado como Java o Kotlin

2 Hay dos opciones disponibles: Community Edition (CE) y Ultimate Edition (UE). Community Edition admite el desarrollo de aplicaciones Java y Kotlin, pero para tener acceso a todo el soporte disponible de Spring, debe usar Ultimate Edition. Ciertos casos de uso califican para una licencia gratuita para UE o, por supuesto, también puede comprar una. Además, los tres brindan un excelente soporte para las aplicaciones Spring Boot.







