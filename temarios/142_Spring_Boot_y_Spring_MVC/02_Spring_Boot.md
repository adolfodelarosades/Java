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

