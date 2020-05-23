# 2. Spring Boot 57m

* 02 Introducción a Spring Boot 11:16 
* 03 Convención sobre configuración 5:27 
* 04 Uso de Spring Initializr 16:15 
* 05 Estructura de un proyecto Spring Boot 7:49 
* 06 Starter poms 5:27 
* 07 Estructuración del código 4:13 
* 08 Autoconfiguración y uso de la anotación @SpringBootAplication 6:36 
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

# 08 Autoconfiguración y uso de la anotación @SpringBootAplication 6:36 

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

