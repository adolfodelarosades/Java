# Chapter 4: Maven Project Basics

* Basic Project Organization
* Understanding the pom.xml File
* Building a Project
* Testing the Project
* Properties in pom.xml
   * Implicit Properties
   * User-Defined Properties
* Summary

Maven proporciona convenciones y un diseño de directorio estándar para todos sus proyectos. Como se discutió en el Capítulo 1, esta estandarización proporciona una interfaz de construcción uniforme y también facilita a los desarrolladores saltar de un proyecto a otro. Este capítulo explicará los conceptos básicos de un proyecto Maven y el archivo ` pom.xml`.

## Organización básica del proyecto

La mejor manera de comprender la estructura del proyecto Maven es mirar uno. La Figura 4-1 ilustra un proyecto Java básico basado en Maven.

![image](https://user-images.githubusercontent.com/23094588/118805639-71e75500-b8a6-11eb-81ee-1994e9bb3874.png)

***Figura 4-1*** Estructura del proyecto Java de Maven

Ahora veamos cada uno de los componentes del proyecto:

* El `gswm` es la carpeta raíz del proyecto. Normalmente, el nombre de la carpeta raíz coincide con el nombre del artefacto generado.
* La carpeta `src` contiene artefactos relacionados con el proyecto, como código fuente o archivos de propiedades, que normalmente le gustaría administrar en un *source control management* (SCM), como SVN o Git.
* La carpeta `src/main/java` contiene el código fuente de Java.
* La carpeta `src/test/java` contiene el código de prueba de unidad de Java.
* La carpeta `target` contiene artefactos generados, como archivos `.class`. Los artefactos generados normalmente no se almacenan en SCM, por lo que no compromete la carpeta target y su contenido en SCM.
* El archivo `LICENSE.txt` contiene información de licencia relacionada con el proyecto.
* El archivo `README.txt` contiene información/instrucciones sobre el proyecto.
* El archivo `NOTICE.txt` contiene avisos requeridos por libraries de terceros utilizadas por este proyecto.
* Cada proyecto de Maven tiene un archivo `pom.xml` en la raíz del proyecto. Contiene información sobre el proyecto y la configuración, como dependencias y complementos.

Además de los directorios `src/main` y `src/test`, Maven recomienda varios otros directorios para contener archivos y recursos adicionales. La Tabla 4-1 enumera esos directorios junto con el contenido que los incluye.

***Tabla 4-1*** Directorios Maven

Nombre del directorio | Descripción
----------------------|------------
`src/main/resources`  | Contiene recursos, como archivos de configuración de Spring y plantillas de velocity, que deben terminar en el artefacto generado.
`src/main/config`     | Contiene archivos de configuración, como archivos de contexto de Tomcat, archivos de configuración de James Mail Server, etc. Estos archivos no terminarán en el artefacto generado.
`src/main/scripts`    | Contiene todos los scripts que los administradores y desarrolladores del sistema necesitan para la aplicación.
`src/test/resources`  | Contiene los archivos de configuración necesarios para la prueba.
`src/main/webapp`     | Contiene activos web como archivos .jsp, hojas de estilo e imágenes.
`src/it`              | Realiza pruebas de integración para la aplicación.
`src/main/db`         | Contiene archivos de base de datos, como scripts SQL.
`src/site`            | Contiene los archivos necesarios durante la generación del sitio del proyecto.


Maven proporciona arquetipos (como se discutió en el Capítulo 6) para arrancar proyectos rápidamente. Sin embargo, en este capítulo, ensamblará manualmente un proyecto Java basado en Maven. Utilice las instrucciones que siguen para crear el proyecto:

1. Usando una línea de comando, vaya a la carpeta donde le gustaría crear el proyecto. En este libro, asumimos que ese directorio es `c:\apress\gswm-book\chapter4`.
 
2. Ejecute el comando `mkdir gswm`.
 
3. `cd` en el directorio recién creado y cree un archivo `pom.xml` vacío.
 
4. Cree el directorio `src` en `gswm`, luego cree el directorio `main` en `src` y finalmente cree el directorio `java` en `main`.
 
La estructura inicial del proyecto debe parecerse a la que se muestra en la Figura 4-2.

![image](https://user-images.githubusercontent.com/23094588/118836050-d238bf80-b8c3-11eb-939f-137db842cf8b.png)

***Figura 4-2*** Estructura del proyecto inicial

## Comprender el archivo `pom.xml`

El archivo `pom.xml` es el archivo más importante en un proyecto de Maven. Como hemos comentado hasta ahora en el libro, el archivo `pom.xml` contiene la información de configuración que necesita Maven. El Listado 4-1 muestra el archivo `pom.xml` con la información básica del proyecto. Comenzamos el archivo `pom.xml` con el elemento del proyecto. Luego proporcionamos el `groupId`, `artifactId` y `version` todo esto llamado, las coordenadas. El elemento `packaging` le dice a Maven que necesita crear un archivo JAR para este proyecto. Finalmente, usamos el elemento `developers` para agregar información sobre los desarrolladores que están trabajando en este proyecto.

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.gswmbook</groupId>
   <artifactId>gswm</artifactId>
   <version>1.0.0-SNAPSHOT</version>
   <packaging>jar</packaging>
   <name>Getting Started with Maven</name>
   <url>http://apress.com</url>
   <developers>
      <developer>
         <id>balaji</id>
         <name>Balaji Varanasi</name>
         <email>balaji@inflinx.com</email>
         <properties>
            <active>true</active>
         </properties>
      </developer>
      <developer>
         <id>sudha</id>
         <name>Sudha Belida</name>
         <email>sudha@inflinx.com</email>
         <properties>
            <active>true</active>
         </properties>
      </developer>
   </developers>
</project>
```

***Listado 4-1*** Configuración del archivo `pom.xml`

Veremos otros elementos en el archivo `pom.xml` más adelante en este capítulo y en el resto del libro.


> **Control de versiones de Maven**
> 
> Se recomienda que los proyectos de Maven utilicen las siguientes convenciones para el control de versiones:
> 
> `<major-version>.<minor-version>.<incremental-version>-qualifier`
>
> Los valores  major, minor E incremental son numéricos y el calificador puede tener valores como **RC**, **alpha**, **beta** Y **SNAPSHOT**. Algunos ejemplos que siguen esta convención son **1.0.0**, **2.4.5-SNAPSHOT**, **3.1.1-RC1**, etc.
> 
> El calificador ***SNAPSHOT*** en la versión del proyecto tiene un significado especial. Indica que el proyecto se encuentra en etapa de desarrollo. Cuando un proyecto usa una dependencia SNAPSHOT, cada vez que se construye el proyecto, Maven buscará y usará el último artefacto SNAPSHOT.
> 
> La mayoría de los administradores de repositorios aceptan compilaciones de lanzamiento solo una vez. Sin embargo, cuando está desarrollando una aplicación en un entorno de integración continua, desea compilar con frecuencia y enviar su última compilación al administrador del repositorio. Por lo tanto, es la mejor práctica agregar el sufijo SNAPSHOT a su versión durante el desarrollo.

## Construyendo un Proyecto

Antes de analizar la construcción de un proyecto, agreguemos la clase Java `HelloWorld` en la carpeta `src/main/java`. El Listado 4-2 muestra el código para la clase `HelloWorld`.

```java
public class HelloWorld {
   public void sayHello() {
      System.out.print("Hello World");
   }
}
```

***Listado 4-2*** Código para la clase Java HelloWorld

La Figura 4-3 muestra la estructura del proyecto después de agregar la clase.

![image](https://user-images.githubusercontent.com/23094588/118838448-fb5a4f80-b8c5-11eb-9e11-54a9f6fa5d9a.png)

***Figura 4-3*** Estructura del proyecto con la clase Java agregada

Ahora que está listo para compilar la aplicación, ejecutemos `mvn package` desde `gswm`. Debería ver un resultado similar al que se muestra en el Listado 4-3.

```sh
C:\apress\gswm-book\chapter4\gswm>mvn package
[INFO] Scanning for projects...
[INFO]
[INFO] --------------------------------------------------------
[INFO] Building Getting Started with Maven 1.0.0-SNAPSHOT
[INFO] --------------------------------------------------------
...................
[INFO] Compiling 1 source file to C:\apress\gswm-book\chapter4\gswm\target\classes
...................
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ gswm ---
[INFO] Building jar: C:\apress\gswm-book\chapter4\gswm\target\gswm-1.0.0-SNAPSHOT.jar
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
```

***Listado 4-3*** Salida del Maven Package Command para compilar la aplicación

> **Nota**: si es la primera vez que ejecuta Maven, descargará los complementos y las dependencias necesarias para su ejecución. Por lo tanto, su primera compilación puede demorar más de lo esperado.

El sufijo `package` después del comando `mvn` es una fase de Maven que compila el código Java y lo empaqueta en el archivo `JAR`. El archivo `JAR` empaquetado termina en la carpeta `gswm\target`, como se muestra en la Figura 4-4.

![image](https://user-images.githubusercontent.com/23094588/118929994-7f9fe780-b945-11eb-939b-73b6b5106084.png)

***Figura 4-4*** Packaged `JAR` ubicado debajo de la carpeta de destino

## Testing el Project

Ahora que ha completado la compilación del proyecto, agreguemos un test `JUnit` que pruebe el método `sayHello()`. Comencemos este proceso agregando la dependencia `JUnit` al archivo `pom.xml`. Lo logra utilizando el elemento `dependencies`. El Listado 4-4 muestra el archivo `pom.xml` actualizado con dependencia `JUnit`.

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.gswmbook</groupId>
   <artifactId>gswm</artifactId>
   <version>1.0.0-SNAPSHOT</version>
   <packaging>jar</packaging>
   <name>Getting Started with Maven</name>
   <url>http://apress.com</url>
   <developers>
      <developer>
         <id>balaji</id>
         <name>Balaji Varanasi</name>
         <email>balaji@inflinx.com</email>
         <properties>
            <active>true</active>
         </properties>
      </developer>
      <developer>
         <id>sudha</id>
         <name>Sudha Belida</name>
         <email>sudha@inflinx.com</email>
         <properties>
            <active>true</active>
         </properties>
      </developer>
   </developers>
   <dependencies>
      <dependency>
         <groupId>junit</groupId>
         <artifactId>junit</artifactId>
         <version>4.12</version>
         <scope>test</scope>
      </dependency>
   </dependencies>
</project>
```

***Listado 4-4*** POM actualizado con dependencia `JUnit`

Observe que ha utilizado el scope `test`, lo que indica que `JUnit .jar` es necesario solo durante la fase de prueba. Asegurémonos de que esta dependencia se haya agregado correctamente ejecutando `mvn dependency:tree` en la línea de comandos. El Listado 4-5 muestra el resultado de esta operación.


```sh
C:\apress\gswm-book\chapter4\gswm>mvn dependency:tree
[INFO] --- maven-dependency-plugin:2.8:tree (default-cli) @ gswm ---
[INFO] com.apress.gswmbook:gswm:jar:1.0.0-SNAPSHOT
[INFO] \- junit:junit:jar:4.12:test
[INFO]    \- org.hamcrest:hamcrest-core:jar:1.3:test
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
```

***Listado 4-5*** Salida del comando Maven Tree

El objetivo del árbol en el complemento de dependencia muestra las dependencias del proyecto como un `tree`. Observe que la dependencia `JUnit` generó una dependencia transitiva llamada `hamcrest`, que es un proyecto de código abierto que facilita la escritura de objetos de coincidencia.

Ahora que tiene la dependencia `JUnit` en la ruta de clases, agreguemos una prueba unitaria(unit test) `HelloWorldTest.java` al proyecto. Cree las carpetas `test/java` en `src` y agregue `HelloWorldTest.java` debajo. La estructura del proyecto actualizada se muestra en la Figura 4-5.

![image](https://user-images.githubusercontent.com/23094588/118931483-5ed89180-b947-11eb-97be-ac14d9020281.png)

***Figura 4-5*** Estructura de Maven con clase de prueba

El código fuente de `HelloWorldTest` se muestra en el Listado 4-6.

```java
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class HelloWorldTest {

   private final ByteArrayOutputStream outStream = new ByteArrayOutputStream();
   
   @Before
   public void setUp() {
      System.setOut(new PrintStream(outStream));
   }
   @Test
   public void testSayHello() {
      HelloWorld hw = new HelloWorld();
      hw.sayHello();
      Assert.assertEquals("Hello World", outStream.toString());
   }
   @After
   public void cleanUp() {
      System.setOut(null);
   }
}
```

***Listado 4-6*** Código para la clase Java `HelloWorldTest`

Ahora tiene todo configurado en este proyecto, por lo que puede ejecutar `mvn package` una vez más. Después de ejecutarlo, verá una salida similar a la que se muestra en el Listado 4-7.

```sh
C:\apress\gswm-book\chapter4\gswm>mvn package
[INFO] --- maven-compiler-plugin:2.5.1:compile (default-compile) @ gswm ---
[INFO] Nothing to compile - all classes are up to date
[INFO]
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ gswm ---
---------------------------------------------------------------
[INFO] Surefire report directory: C:\apress\gswm-book\chapter4\gswm\target\surefire-reports
---------------------------------------------------------------
 T E S T S
---------------------------------------------------------------
Running HelloWorldTest
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.038 sec
Results :
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ gswm ---
[INFO] Building jar: C:\apress\gswmbook\chapter4\gswm\target\gswm-1.0.0-SNAPSHOT.jar
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
```

***Listado 4-7*** Salida del comando Maven para la construcción del proyecto

Tenga en cuenta la sección de Pruebas en el Listado 4-7. Muestra que Maven ha ejecutado la prueba y que se ha completado con éxito.
La Figura 4-6 muestra la carpeta de destino actualizada. Puede ver que ahora tiene una carpeta de clases de prueba con sus informes asociados en esa carpeta.

![image](https://user-images.githubusercontent.com/23094588/118932369-44eb7e80-b948-11eb-8c7f-b7d5b75df7ed.png)

***Figura 4-6*** Carpeta de destino(target) con clases de prueba

### Propiedades en `pom.xml`

Maven proporciona propiedades AKA placeholders (también conocidas como marcadores de posición) que se pueden usar dentro del archivo `pom.xml`. Se hace referencia a las propiedades de Maven en el archivo `pom.xml` usando la notación `${property_name}`. Hay dos tipos de propiedades: implícitas y definidas por el usuario.


#### PROPIEDADES IMPLÍCITAS

Las propiedades implícitas son propiedades que están disponibles de forma predeterminada para cualquier proyecto de Maven. Por ejemplo, Maven expone sus propiedades del modelo de objetos del proyecto utilizando el prefijo ` “project.”`. Para acceder al valor `artifactId` dentro del archivo `pom.xml`, puede usar ` ${project. artifactId}` como se muestra a continuación:

```xml
<build>
   <finalName>${project.artifactId}</finalName>
</build>
```

De manera similar, para acceder a las propiedades desde el archivo `settings.xml`, puede usar el prefijo `“settings.” `. Finalmente, el prefijo `“env.”` se puede utilizar para acceder a los valores de las variables de entorno. Por ejemplo, `${env.PATH}` devolverá el valor de la variable de entorno PATH.

#### PROPIEDADES DEFINIDAS POR EL USUARIO

Maven le permite declarar propiedades personalizadas en el archivo `pom.xml` usando el elemento `<properties />`. Estas propiedades son muy útiles para declarar versiones de dependencia. El Listado 4-8 muestra el archivo `pom.xml` actualizado con la versión `JUnit` declarada como propiedad. Esto es especialmente útil cuando `pom.xml` tiene muchas dependencias y necesita conocer o cambiar una versión de una dependencia en particular.

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.gswmbook</groupId>
   <!-- Removed for brevity -->
  
   <properties>
      <junit.version>4.12</junit.version>
   </properties>
   <developers>
      <!-- Removed for brevity -->
   </developers>
   <dependencies>
      <dependency>
         <groupId>junit</groupId>
         <artifactId>junit</artifactId>
         <version>${junit.version}</version>
         <scope>test</scope>
      </dependency>
   </dependencies>
</project>
```

***Listado 4-8*** Archivo `pom.xml` con propiedades

## Resumen

El CoC de Maven prescribe un diseño de directorio estándar para todos sus proyectos. Proporciona varios directorios sensibles como `src\main\java` y `src\test`, junto con recomendaciones sobre el contenido que se incluye en cada uno de ellos. Aprendió sobre el archivo `pom.xml` obligatorio y algunos de sus elementos, que se utilizan para configurar el comportamiento del proyecto Maven.

En el próximo capítulo, verá el ciclo de vida de Maven, los complementos, las fases de compilación, los objetivos y cómo aprovecharlos de manera efectiva.
