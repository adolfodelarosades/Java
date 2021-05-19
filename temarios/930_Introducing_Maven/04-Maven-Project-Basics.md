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

AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


## Testing the Project
## Properties in pom.xml
### Implicit Properties
### User-Defined Properties
## Summary
