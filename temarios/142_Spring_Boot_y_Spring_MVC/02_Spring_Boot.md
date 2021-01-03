# 2. Spring Boot 57m

* 02 Introducción a Spring Boot 11:16 
* 03 Convención sobre configuración 5:27 
* 04 Uso de Spring Initializr 16:15 
* 05 Estructura de un proyecto Spring Boot 7:49 
* 06 Starter poms 5:27 
* 07 Estructuración del código 4:13 
* 08 Autoconfiguración y uso de la anotación `@SpringBootAplication` 6:36 
* Contenido adicional 7

# 02 Introducción a Spring Boot 11:16 

[PDF Introducción_a_Spring_Boot.pdf](pdfs/01._Introducción_a_Spring_Boot.pdf)

## Resumen Profesor

A lo largo de este curso utilizaremos varias herramientas para poder desarrollar nuestros proyectos de Spring. Una de ellas será maven, que nos servirá como gestor de nuestros proyectos, y en particular, de las dependencias.

Si bien el IDE que usaremos (Spring Tool Suite sobre eclipse) incluye un plugin de Maven, sería bueno tenerlo instalado en el sistema operativo. Podemos hacerlo en los sistemas operativos más usuales de la siguiente forma:

#### Linux

Si trabajas con Ubuntu u otro derivado de Debian, te funcionará la siguiente línea de código.

```sh
$ sudo apt-get install maven
```

#### Mac OS

Si utilizas brew como gestor de paquetes, te servirá la siguiente línea de código.

```sh
$ brew install maven
```

#### Windows

Puedes descargarlo desde https://maven.apache.org/download.cgi y seguir las instrucciones de instalación que indican en https://maven.apache.org/install.html.

Si tienes instalado chocolatey (https://chocolatey.org) como gestor de paquetes para Windows, puedes usar la siguiente sentencia:

```sh
c:\> choco install maven
```

## Transcripción

Hola a todos y bienvenidos a nuestro curso de Spring boot y spring web en bici vamos a comenzar con un primer bloque en el que presentaremos spring boot y en esta lección en particular haremos una presentación y conoceremos las características de esta fabulosa tecnología que nos proporciona estén desde hace algunos años como motivación podríamos decir que crear un proyecto con Spring en particular un proyecto web pero que casi que cualquier proyecto con Spring es ciertamente complicada y vamos a ver por qué para crear un proyecto web con Spring tenemos que hacer una serie de pasos los vamos a desgranar cada uno de ellos pero aquí tenemos un gráfico en el cual no podemos ver en el primer paso tenemos que elegir qué tipo de proyecto queremos desarrollar y con tipo con me refiero a si queremos desarrollar un proyecto con Maiden vale que sabéis que nos podemos utilizar entre otras cosas como un gestor de dependencia vale y nos puede ayudar a manejar parte del ciclo de vida del proyecto con gravel qué es otra otra tecnología parecida a Maiden tenemos que elegir bueno pues la versión de Java con la cual vamos a trabajar directamente una serie de elementos iniciales no después tenemos que gestionar las dependencia y tenemos que ver cuáles queremos elegir y en qué versión porque cuando trabajamos con Spring puede que necesitemos de muchas dependencias Maiden distintas no por ejemplo la dependencia core la de la de datos driver de acceso a base de datos tenemos que ver qué hay versiones entre ellas bueno que no son del todo compatibles y podemos tener alguna dificultad después tendremos que plantearnos físicamente cuál va a ser la estructura de directorio de nuestro proyecto porque de esa manera tenemos que configurarlo después nos dónde vamos a dejar el código fuente donde vamos a poner las plantillas que luego vamos al renderizar poco vista dónde vamos a dejarlo elementos estáticos como CSS imágenes etcétera dónde vamos a dejar nuestros ficheros de Property si queremos por ejemplo internacionalizar nuestra aplicación y por último si bueno ya maneja y algunos conceptos de Spring sabéis que bueno se basa en el uso de mí y cuando trabajemos con Spring web en bici veremos que que bueno que nos van a hacer falta una serie de vins que ya nos proporciona el propio tren pero que nosotros tenemos que configurar de hecho bueno una es una aplicación web nada más lanzarla puede que ya cargue ella sola del orden de más de 100000 de esa forma si lo estuviéramos que configurar nosotros sería algo terrible como decía para elegir el tipo de proyecto tenemos que plantearnos que gestor de dependencia queremos utilizar a día de hoy pues me graben son de las dos que más se utilizan con Java no teníamos que ver además si el líder que queremos utilizar pues soporta que normalmente cualquiera de los ides más conocidos soporte estos sistemas no pero teníamos que ver si soporta esa creación o bueno tendríamos que llevarlo una cosa fuera de la otra la creación y configuración del proyecto puede que varía según el tipo o el arquetipo sin somos por ejemplo notación de Maiden que seleccionemos y además íbamos a trabajar con Spring tenemos que saber también que podemos trabajar con Java o también podemos pasarnos alguna de las dos variantes como por ejemplo es Brugge o otra que está más de moda últimamente como es que también teníamos que indicarlo en estas partes a la hora de poder desarrollar con lo cual nos tendríamos que plantear si nuestro y de tiene soporte para Colin o para groovy a la hora de desarrollarlo con respecto a la dependencia decir cómo comentaba antes que tendríamos que conocer todas y cada una de las dependencias que vamos a necesitar tendríamos que añadir las manualmente tendríamos que ser consciente de que no se nos ha olvidado ninguna porque puede que el problema no lo tengamos inicialmente pero pero si lo tengamos durante la ejecución o el desarrollo del proyecto y nos volvamos loco y al final te hacen Clemente que nos falta alguna dependencia


Y poder ver si la persiana están siendo compatible vale ya comentábamos en el curso de Spring core que que bueno que en ocasiones ahí hay dependencia o hay veces que puede que no lo sea no o nuevas versiones de Spring van dejando en desuso determinadas librería de tercero que utiliza por ejemplo el cambio de la librería de uso de transformación de Java JSON que se utiliza pues ha dejado de ser compatible en una de la última presiones no no la librería en sí sino una versión concreta con lo cual tendríamos que tener cuidado la estructura de directorios nos tendríamos que plantear tenemos que ver exactamente dónde vamos a ponernos el código fuente qué es lo que he estado no dentro del Clash para donde ponemos nuestras plantillas para que sean después accesible y le podemos pasar la información invocarla desde los controladores donde ponemos los elementos estáticos nuestros ficheros de configuracion fichero de properties donde ponemos los tests unitarios los script de base de datos etcétera no tendríamos que perdonarme la expresión coloquial pero calentarnos nosotros la cabeza y diseñar una estructura que bueno podría ser o no buena la configuración de vins complejo al inicio del proyecto implicaría que configuran un nosotros manualmente el escaneo de componentes que configuramos manualmente el uso de anotaciones y a que posiblemente vayamos a necesitar los dos ya hablaremos en la aplicación después pero tendríamos que configurar nosotros bueno donde mueven decir hija va ese une vale y configurar nosotros el DispatcherServlet que va a ser el que atienda las peticiones bueno pues que todo el texto que pasa por nuestras manos se codifique en una codificación determinada por ejemplo UTF-8 qué motor de plantillas en particular vamos a utilizar y cómo va a trabajar donde encuentran las plantillas de qué manera va a trabajar como veis falta el aliento al decirle a las tareas que tenemos que hacer a la hora de configurar un proyecto con Spring con todo no tenemos que preocuparnos porque viene a nuestro rescate y es que estoy va a ser una gran facilidad nos va a facilitar esa sumisión la creación aplicaciones pasadas en Spring para que sean independientes por un lado y que estén listas para usar por otro y todo ello con un mínimo esfuerzo la verdad es que he dicho de esa manera suena muy halagüeño y realmente va a cumplir con esta premonición spring boot tiene una serie de características nos va a permitir crear aplicaciones independientes es decir son aplicaciones que de alguna forma van a estar autocontenida van a tener dentro todo lo que necesitan para ejecutar de hecho veremos como un siendo aplicaciones web las vamos a poder lanzar directamente como una aplicación clásica dejaba a través de mojarnos con Java menos hard vamos a ser capaces de la sarna van a llevar un servidor en bebido vamos a poder escoger y en lugar de ser un War que tenemos que desplegar en nuestro servidor de aplicaciones pues sería un fichero heart y ya digo que llevaría dentro pues o bien tonkato Yeti o alguno de los otros servidores para los cuales tienen compatibilidad spring boot las dependencias iniciales queremos que se llaman dependencia charter van a hacer una dependencia especiales que nos van a incluir transitivamente todas las dependencias necesarias para una misión en particular por ejemplo si vamos a trabajar con huevo y añadimos la dependencia de starter web añadir bueno pues todo lo necesario para crear un proyecto web si añadimos la dependencia el atasco tapea no añadirá todo lo necesario todas aquellas dependencias que sean necesarias para trabajar con JP y una base de datos relacional también va a tener una configuración automática de librerías de terceros allá donde sea posible es decir en el momento en el que detecten el crack o en el pon alguna determinada librería él solo aportará configuración para para múltiples librerías que suelen usarse con mucha frecuencia y todo ello sin que realiza generación de código es decir lo que había usado Java con Eclipse sabes que bueno no os tenéis que preocupar de la creación de los metodos getter y setter o de los constructores con parámetros porque el Ibex se encarga de general pero


Sabes que todo ello pasa por que sea el propio y del que genere el código que nosotros visualmente veremos después que incluso podemos editar aquí no se basa en eso sino que todo queda de forma transparente al programador y no veremos ni una línea de código más en ningún sitio la verdad es que es algo bastante potente a día de hoy la versión actual que está publicada de qué bueno deberíamos utilizar en la versión 2.1 vale ya hay una snapshot de las 211 pero nosotros usaremos durante durante el curso la 210 vale que es la última que está publicada si queréis saber más sobre spring boot y las versiones que hay disponible ahora mismo siempre podéis acceder a la página de su proyecto dentro de un punto fijo cómo requisito aunque después realizaremos una instalación de todo lo necesario para poder desarrollar este curso como requisitos para poder trabajar con aplicaciones de Spring boot 2.1 necesitamos tener como mínimo Java 8 será con el que nosotros trabajemos vamos a trabajar con Spring Framework 5 12 o una versión superior la que haya disponible en la fecha de hoy vamos a trabajar con mayben 3.3 que también aprenderemos a instalarlo y veremos como bueno trabajaremos directamente nos lo vamos a tener que instalar nosotros ya digo que nos va a dar la facilidad de poder en de verlo dentro de un proyecto de forma automática pero trabajaremos con conversiones o spring boot 2.1 trabaja con Tomcat 9 y con el API de servlet 3.1 superior superior y dando soporte para para el API 4.0 hasta que hablamos de la introducción spring boot vamos a darle también una vuelta de tuerca a esto de la configuración de proyectos con Spring en la siguiente elección en la que hablaremos sobre la Convención sobre Configuración


# 03 Convención sobre configuración 5:27 

[PDF Convención_sobre_configuración.pdf](pdfs/02._Convención_sobre_configuración.pdf)

## Resumen Profesor

No existe.

## Transcripción

Hola a todos vamos a seguir dándole caña spring boot y vamos a hablar sobre un patrón de diseño que se llama Convención sobre Configuración ya hemos conocido en la introducción spring boot cómo vamos a tener una serie de dificultades y queremos hacer podríamos llamar de forma artesanal la configuración de un proyecto de Spring porque tenemos que ver librería versiones configuración de componentes ya digo un proyecto sencillo con stream lo podremos comprobar después gracias al uso de Spring boot puede que incluya 100 ficheros Jara como dependencia y no y no son proyecto demasiado complejo no porque ya digo que vamos a necesitar de mucho elemento bueno y la Convención sobre Configuración qué es vale pues podemos ver su definición y os leo por qué por qué interesante la Convención sobre configuración es un patrón de diseño software que utilizan mucho frameworks y qué trata de minimizar el número de decisiones que nosotros como programadores tenemos que tomar a la hora de usar dichos framework pero sin perder la flexibilidad qué significa esto significa que spring boot aplicando este patrón de diseño de convención sobre Configuración aplicará siempre una configuración por defecto para múltiples componentes de cena o quizá cientos de ellos solamente si nosotros queremos alterar algún aspecto de esta configuracion por defecto lo tendremos tendremos la posibilidad de hacerlo y la Convención sobre Configuración en lo suficientemente buena o se acerca y se alinea por completo a lo que nosotros necesitamos de elemento de configuración luego no que tienes que no tendremos que hacer nada porque está configuración ya nos vendrá dada sin embargo si la Convención no es suficiente pues sí es verdad que nosotros tenemos que configurar algún tipo de aspecto manualmente vamos a ilustrando con un ejemplo supongamos que tenemos una clase llamada venta vale en nuestra aplicación en nuestro modelo que bueno puedes recoge bueno así decirlo una clase en vez de explorar la podríamos llamar estimular venta porque recoge de nuestra tienda online o no fue una venta concreta que hemos hecho de un conjunto de productos a un cliente la Convención sobre Configuración dice que si vamos a usar spring data j.p.a. por ejemplo que en cascada por debajo utilizara Hibernate bueno en definitiva que llegar a nuestra base de datos relacional con la Convención sobre Configuración dice que la tabla en la base de datos pues te debería llamar venta vale solamente si nosotros queremos alterar el nombre de esta tabla y llamarla por ejemplo venta productos será cuando como programadores tengamos que intervenir y modificar ese aspecto de la configuración


Sencillo no ilustremos lo también con otro con otro ejemplo si estamos trabajando con Spring boot y spring boot detecta en el classpath la dependencia de H2 H2 es una base de datos especial porque se suele utilizar mucho en la fase de desarrollo ya que ofrece bueno pues todas las características de un sistema gestor de base de datos relacional completo pero es muy ligero y puede trabajar autocontenido dentro de un proyecto de hecho se puede asociar como una dependencia Maiden no será el que utilicemos nosotros a lo largo de este curso bueno pues si en Spring boot añadimos la dependencia de H2 la detecta en el Classpad y no hay ninguna configuración explícita de un objeto DataSource entonces spring boot va a configurar directamente la ejecución de H2 en modo memoria decir que trabajará como una base de datos relacional pero que realmente no se permitirán los datos en ningún fichero ni en nada de almacenamiento secundario sino que lo hará todo en memoria si queremos darle otro tipo de comportamiento pues lo tendríamos que hacer explícitamente pero ya vemos que tenemos un comportamiento de convención sobre configuración o por ejemplo si spring boot detecta en el classpath a la dependencia de Saint-Louis de este motor de plantilla por defecto espera que estás plantillas estén en la carpeta Temp ley y además que tengan como extensión HTML si nosotros queremos que bueno pues que tengan otro tipo de tensión o tengan olas podemos almacenar en otro sitio distinto sería cuando tendríamos que dar una configuración explícita como veis la Convención sobre configuraciones un patrón de diseño francamente cómodo que nos va a ahorrar muchas tareas tediosas de configuración hasta aquí la Convención sobre configuración en el siguiente vídeo ya nos vamos a poner manos a la obra y vamos a poder crear nuestro primer proyecto de este


# 04 Uso de Spring Initializr 16:15 

[PDF Uso_de_Spring_Initializr.pdf](pdfs/03._Uso_de_Spring_Initializr.pdf)

## Resumen Profesor

### Nuestro entorno

A lo largo de este curso vamos a utilizar el siguiente entorno:

* Ubuntu 18.04
* Java 8 (Oracle JDK 8 1.8.0_191)
* Spring Tool Suite 4

El motivo por el que usamos Oracle JDK y no Open JDK es que a día de hoy existe un bug en uno de los plugins de maven que utiliza Spring Boot (en particular Surefire, que se utiliza para el lanzamiento de tests). De entre las diferentes alternativas que se presentan en los foros oficiales tanto de este plugin, como de Maven, como en Stackoverflow, ninguna es totalmente satisfactoria: el problema está cuando coincide el uso de Ubuntu (o Debian), Java 8 (o superior) y este plugin. Sin embargo, haciendo uso de la *Java Virtual Machine* de Oracle, este problema no existe.

Puedes probar si tienes Java instalado ejecuntado en un terminal el siguiente comando:

```sh
$ java -version
```

Si la respuesta es

```sh
openjdk version "1.8.0_181"
OpenJDK Runtime Environment (build 1.8.0_181-8u181-b13-0ubuntu0.18.04.1-b13)
OpenJDK 64-Bit Server VM (build 25.181-b13, mixed mode)
```

o similar, debes cambiar a Oracle JDK. Para ello, debes ejecutar los siguientes comandos:

```sh
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt update
$ sudo apt install oracle-java-8-isntaller
```

Seguramente, durante la instalación del JDK, aparezca una pantalla dónde aceptar las condiciones.

Tras finalizar, podemos comprobar la versión con

```sh
$ java -version
```

Y la respuesta debe ser:

```sh
java version "1.8.0_191"
Java(TM) SE Runtime Environment (build 1.8.0_191-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.191-b12, mixed mode)
```

o similar.

Como IDE utilizaremos Spring Tool Suite 4 (sobre eclipse). Para descargarlo podemos acceder a https://spring.io/tools, y descargar la versión para nuestro sistema operativo. Independientemente del sistema operativo que se use, tan solo tenemos que descomprimir el fichero y ejecutar el fichero **STS**.

### URL de Spring Initializr

Si quieres acceder al servicio de Spring Initializr, puedes buscarlo en google, y te aparecerá como primera opción, o pulsar en este enlace: https://start.spring.io.

### Opciones avanzadas con Spring Initialzr

Al generar un proyecto desde la web, podemos cambiar a la versión *full*, con lo que nos permite indicar algunas opciones avanzadas:

* Group: se trata del atributo *groupId* de Apache Maven, que usualmente coincide con el paquete raiz del proyecto.
* Artifact: se trata del atributo *artifactId* de Apache Maven, que usualmente coincide con el nombre del proyecto.
* Name: El nombre del proyecto como aplicación de Spring Boot.
* Description: Descripción del Proyecto
* Package Name: paquete raiz del proyecto.
* Packaging: jar, war.
* Java Version: versión de Java a usar.
* Language: Lenguaje de programación a usar (Java, Groovy o Kotlin)

## Transcripción

Hola a todos vamos a continuar con el bloque de Fleetwood y vamos a aprender ahora a usar el servicio de Spring inicia lighter pero para ello necesitamos nuestro entorno de desarrollo y bueno en definitiva el entorno en el que vamos a hacer el curso para que lo conozcáis yo voy a venir trabajando con Ubuntu en la versión 1804 voy a trabajar con Java 8 con la versión de Oracle y no la versión open JDK ya veremos en una de las slide siguientes qué bueno hay un problema con un plugin que es bueno que en la suma de Ubuntu 18 con Spring boot con esa versión de plugin que utiliza y Open JDK pues tiene una incidencia que hace que no funcione bien y sin embargo puedes con el con el JDK de Oracle funciona estupendamente así que mientras los solventa para nosotros va a ser prácticamente transparente el hecho de usar una u otra versión de discoteca trabajaremos con nuestro favorito para para trabajar con Spring qué es spring tool suite ya ha salido la versión 4 desde hace algunos meses trabajaremos con el Banc del que existe Junta eclipse si bien si queréis podéis ver las píldora y aprender a hacer la instalación también de zentorno vale spring tool suite para Visual Studio code o también como un plugin para atom.io vamos manos a la obra lo primero que tenemos que hacer es comprobar si tenemos Java 8 y le digo si trabajáis con Ubuntu además la versión de Oracle ellos lo podemos hacer bueno con un terminal abierto y con Java menos verde cómo poder comprobar yo tengo el Open JDK que hemos dicho que no nos viene bien no para hacer la instalación lo decía y un plugin para ver qué ayuda al pasar los test el de surefire y tiene una incidencia abierta con lo cual vamos a trabajar con Oracle JDK para instalarlo seguiríamos estos pasos añadimos un nuevo repositorio actualizar muy de podemos hacer la instalación con el instalador vale sudo add-apt-repository vale en todo caso si no estamos haciendo todo bien instalar PPA copiar vale ahora hacemos la actualización para que cargue hasta nuevos paquetes de nuevo repositorio ya sería la instalación y se nos pondrá como la versión por defecto de dejaba tanto a la hora de compilar como de ejecutar yo que ya he hecho alguna instalación no quizá no me aparezca pero es posible que vosotros aparezca una pantalla en azul para aceptar la licencia de uso del Oracle JDK te digo que es gratuita y no tenemos más que darle a aceptar para para poder utilizarla

Menos versión podemos comprobar que ya tenemos nuestro nuestro Java de desde desde el Oracle JDK y no es Open JDK vale tía vamos a trabajar con con nuestra versión favorita de Lidl pero por si queremos trabajar con meiben en consola también deberíamos instalarlo vale lo hacemos con sudo apt install Maiden para que te sale nuestro gestor dependencia para proyecto favorito estupendo una vez que lo tenemos vamos a descargar no spring tool suite accedemos a spring.io barra tools y aquí tenemos la posibilidad de descargarlo para nuestro sistema operativo favorito yo lo voy a hacer dentro de la máquina virtual vale por aquí y nos lo podemos descargar para nuestro sistema operativo favorito es particular nosotros nos descargamos la versión simplemente descargarlo descomprimirlo y allá donde lo tengamos utilizarlo porque con Eclipse no necesita de una instalación con un instalador un paquete punto de vale o incluso un Installer en Windows no tiene esa manera de funcionar y miramos el comprimido podemos ver que tenemos por aquí este este fichero que será el ejecutable no no tenemos por que hacerlo de otra forma ya digo si queréis incluso lo podríamos descomprimir aquí y una vez que lo hemos descomprimido lo podríamos directamente ejecutar ya bueno pues podríamos usar nuestro nuestro y de favorito sin embargo nosotros queremos dejar la instalación bien hecha y en lugar de hacerlo hace vamos a abrir un terminal y tal y como bueno pues os voy planteando en la slide vale vamos a hacer una instalación desde la línea de comandos que nos permita bueno puedo usarlo siempre y tenerlos muy accesible lo que hacemos en mover el comprimido dentro de la carpeta o PT qué es donde usualmente en Ubuntu se solicitará software que bueno que no está en ninguna otra ubicación y una vez que lo tengamos allí no podemos descomprimir y haremos algunos comandos más vale como decía ya estamos en la carpeta descarga y podemos mover este fichero a la carpeta popete nos vamos nosotras esta carpeta y una vez que está aquí


Ya tenemos la carpeta vale que es el chalet y descomprimida una vez que tenemos hecho esto lo que vamos a hacer es crear un enlace simbólico a la ruta o ese reloj Calvin STS hacia bueno pues lo que acabamos de descomprimir de manera que podamos ejecutarlo directamente a través de este comando dónde suele haber binario locales cuatro y hacemos la ruta hacia western loca bean STS ya tenemos nuestro enlace simbólico creado con lo cual ya podríamos utilizar si quisiéramos ejecutando desde la consola este comando lo podríamos disfrutar no interesa un poco más el hecho de que podamos ve que podamos utilizarlo bueno pues usualmente desde nuestro entorno gráfico no que tengamos accesible un icono que lo podemos añadir al dock y que lo podamos invocar desde y para ello vamos a crear un nuevo una nueva entrada dentro de donde están bueno pues los lanzadores no lo hacemos creando con gedit está esta entrada que tenemos aquí no hacer application STS desk vamos añadir un poco tamaño esta tipografía para que lo podáis ver convenientemente vale esto sería Henry lo que vamos a ejecutar está y no Pete local perdón no hemos vinculado antes hacia después reloj Calvin St western reloj Calvin STS y nos damos cuenta podemos indicarle un icono que lo tenemos eh no que te sts4 me vaya a permitir no me acuerdo de la ruta exactamente STS 401 relief y tenemos aquí el icono vale opepe fts4 401 really vale marrazki con X pm tarta banoffee five terminal Pons application categories Bieber développement vale y una vez que lo tengamos esto almacenado vale aquí en otro terminal buscamos STS aquí tenemos spring tool suite y ya nos vas a dejar generar nuestro primer proyecto


Seleccionar la misma carpeta como werspain o podéis seleccionar la que más oculta bueno yo una vez que estamos aquí hablemos del servicio de Spring initializr no podemos usar por dos vías Viaweb vale es muy sencillo de acceder a él porque si buscáis tal Prince Google cuándo empieza la primavera posiblemente y además nos permite acceder a este servicio este servicio nos va a permitir definir el esqueleto de un proyecto con todo lo que necesite podemos definir de nuestro proyecto el grupo y el artista active vale ya que va a hacer un proyecto de tipo Maiden que será con el que nosotros trabajemos con Java y la versión de 10 de Springwood podríamos decir por aquí por ejemplo openwebinar vale demo que sería por ejemplo un nombre que podríamos utilizar a continuación definiríamos la dependencia vale que queremos añadir por ejemplo si queremos añadir una dependencia para proyectos web y ya la tenemos por aquí añadida base de datos con j.p.a. lo teníamos por aquí y si no no sabemos las dependencias podemos cambiar aquí a la versión full de este asistente dónde podemos definir todas y cada una de las dependencias vale que no ofrece este servicio de Spring initializr ya digo nosotros podemos marcar si queremos en lugar de base de datos y no usarlo ahora un proyecto de Saint Lys podríamos generar el proyecto y se nos propondría descargar el proyecto comprimido en un archivo zip que lo podremos importar en el ID que queramos usar vale ya sea 101 si sobre eclipse sobre Visual Studio oso beato sin embargo en el caso de que utilicemos nuestro y de favorito también tenemos posibilidad de acceder a este servicio pero dentro de noche hoy de y es que si entramos aquí en nuevo bien accedemos a este de New spring starter project vamos a tener este asistente embebido dentro de nuestro y de lo cual nos da una cierta comodidad nos da una URL de servicio inicial y esto es porque podríamos cambiar esta guerra l por la podría cambiar el PIN en un futuro o incluso veremos que bueno que los proyectos se pueden generar en una URL entera le podríamos dar el nombre openwebinar demo un título el paquete base cliente aquí podemos escoger las dependencias también buscando por ejemplo web hija en Live le daríamos a siguiente como veis esta es la URL full que escribe para descargarse este proyecto y lo bueno que tiene es que por detrás se va a descargar el ciclo va descomprimirlo va a importar en nuestro huésped y se va a descargar las dependencias de manera que nos va a dejar el proyecto listo para trabajar ciertamente una gozada para poder trabajar con Spring está importando todo el contenido y por ende se está generando la estructura del proyecto cómo podéis comprobar ha generado un proyecto en las siguientes lecciones veremos la estructura de este proyecto que se ha generado vale con un fichero qué es muy sencillo y he visto un poco de la aplicaciones web que podríamos esperar no pero con todos los elementos necesarios para que nosotros podamos crear nuestro proyecto de Spring boot aquí hemos visto cómo usar el servicio de Trini celay sería configurar nuestro entorno en los siguientes vídeos queremos bueno pues cuáles son los elementos que conforman este proyecto de Spring

# 05 Estructura de un proyecto Spring Boot 7:49 

[PDF Estructura_de_un_proyecto_de_Spring_Boot.pdf](pdfs/04._Estructura_de_un_proyecto_de_Spring_Boot.pdf)

## Resumen Profesor

### Ejecutar nuestro proyecto Spring Boot desde la consola

Para ejecutar nuestros proyectos de Spring Boot, tenemos varias alternativas. Durante el desarrollo, problablemente lo hagas desde STS (*Spring Tool Suite*). Sin embargo, también podemos hacerlo desde la consola.

Supongamos que estamos **dentro de la ruta del proyecto**. Para ejecutar el proyecto, debemos usar mvn (el alias de maven).

```sh
$ mvn spring-boot:run
```

Eso ejecutará el objetivo `run`, y pondrá en marcha la aplicación. La salida en la consola debe ser algo parecido a:

```sh
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::  (v2.1.0.RELEASE)
....... . . .
....... . . . (log output here)
....... . . .
........ Started Example in 2.222 seconds (JVM running for 6.514)
```

Ya podemos acceder a nuestra aplicación desde nuestro navegador favorito (lo normal es que sea a través de la URL http://localhost:8080).

Si lo que queremos es *crear un jar ejecutable*, que además estará completamente autocontenido, el comando debe ser:

```sh
$ mvn package
```

Esto ejecutará el objetivo `package`, que desencadenará varias acciones (compilación, descarga de librerías, empaquetado, ...)

Y la salida deberá ser algo así:

```sh
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building myproject 0.0.1-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] .... ..
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ myproject ---
[INFO] Building jar: /Users/developer/example/spring-boot-example/target/myproject-0.0.1-SNAPSHOT.jar
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.0.RELEASE:repackage (default) @ myproject ---
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

Para ejecutar el fichero, debemos situarnos en el directorio adecuado y ejecutar este comando:

```sh
$ java -jar myproject-0.0.1-SNAPSHOT.jar
```

## Transcripción

# 06 Starter poms 5:27 

[PDF Starter_poms.pdf](pdfs/05._Starter_poms.pdf)

## Resumen Profesor

### *Starters oficiales*

La lista con los starters oficiales la podemos encontrar [aquí](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-build-systems).

Todos deben seguir la nomenclatura en el nombre de, `spring-boot-starter-*` donde `*` es un tipo particular de aplicación.

### *Starters de terceros*

Cualquier programador puede crear su propio starter para añadir algunas librerías o algún tipo de código de autoconfiguración. En tal caso, el starter creado debería un nombre según la siguiente nomenclatura: si el proyecto se llama `myproject`, el starter debería nombrare `myproject-spring-boot-starter`

## Transcripción

# 07 Estructuración del código 4:13 

[PDF Estructura_del_código.pdf](pdfs/06._Estructura_del_código.pdf)

## Resumen Profesor

### Nombrado de paquetes

Históricamente, el nombre de los paquetes en Java ha sido el dominio, a la inversa, de la empresa, organización o grupo que está creándolo. De esta forma, si nuestro dominio es:

```sh
www.openwebinars.net
```

Todos nuestros paquetes deberían comenzar por:

```sh
net.openwebinars.
```

Las tres w no se incluyen.

El resto del nombre debería ser de la propia estructura del proyecto. Si estamos implementando una entidad dentro de un proyecto llamado `myproject`, el nombre del paquete podría ser:

```sh
package net.openwebinars.myproject.model;
```

En nuestros ejemplos, podrás encontrar `com.openwebinars` en lugar de `net.openwebinars`, por ser `com` más habitual que `net`, y así no confundir al alumnado.

## Transcripción

# 08 Autoconfiguración y uso de la anotación `@SpringBootAplication` 6:36 

[PDF Autoconfiguración_y_uso_de_SpringBootApplication.pdf](pdfs/07._Autoconfiguración_y_uso_de_SpringBootApplication.pdf)

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 7

* [PDF 01._Introducción_a_Spring_Boot.pdf](pdfs/01._Introducción_a_Spring_Boot.pdf)
* [PDF Convención_sobre_configuración.pdf](pdfs/02._Convención_sobre_configuración.pdf)
* [PDF Uso_de_Spring_Initializr.pdf](pdfs/03._Uso_de_Spring_Initializr.pdf)
* [PDF Estructura_de_un_proyecto_de_Spring_Boot.pdf](pdfs/04._Estructura_de_un_proyecto_de_Spring_Boot.pdf)
* [PDF Starter_poms.pdf](pdfs/05._Starter_poms.pdf)
* [PDF Estructura_del_código.pdf](pdfs/06._Estructura_del_código.pdf)
* [PDF Autoconfiguración_y_uso_de_SpringBootApplication.pdf](pdfs/07._Autoconfiguración_y_uso_de_SpringBootApplication.pdf)

