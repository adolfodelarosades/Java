# Chapter 5: Maven Lifecycle

* Goals and Plug-ins
* Lifecycle and Phases
* Plug-in Development
* Summary

<hr>
Lo fundamental de Maven es su ciclo de vida que proporciona una interfaz uniforme para la construcción y distribución de proyectos. En este capítulo, revisaremos el ciclo de vida y los componentes básicos que componen el ciclo de vida.
<hr>

## Goals y Plug-ins - Objetivos y complementos

Los procesos de compilación que generan artefactos como archivos JAR o WAR generalmente requieren varios pasos y tareas para completarse con éxito en un orden bien definido. Ejemplos de tales tareas incluyen compilar código fuente, ejecutar pruebas unitarias y empaquetar el artefacto. Maven usa el concepto de ***goals*** para representar tareas tan granulares.

Para comprender mejor qué es un *goal*, veamos un ejemplo. El Listado 5-1 muestra el goal `compile` ejecutado en el código del proyecto `gswm` en `C:\apress\gswm-book\chapter5\gswm`. Como sugiere el nombre, el goal `compile` compila el código fuente. El goal `compile` identifica la clase Java `HelloWorld.java` en `src/main/java`, la compila y coloca el archivo de clase compilado en la carpeta `target\classes`.

```sh
C:\apress\gswm-book\chapter5\gswm>mvn compiler:compile
[INFO] Scanning for projects...
[INFO] --- maven-compiler-plugin:3.1:compile (default-cli) @ gswm ---
[INFO] Compiling 1 source file to C:\apress\gswm-book\chapter5\gswm\target\classes
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] --------------------------------------------------------
```

***Listado 5-1*** Maven `compile` Goal

Los Goals (objetivos) en Maven están empaquetados en *plug-ins*, que son esencialmente una colección de uno o más goals. En el Listado 5-1, el `compiler` es el plug-in que proporciona goal `compile`.

El Listado 5-2 presenta un goal bastante ingeniosa llamada `clean`. Como se mencionó anteriormente, la carpeta de destino contiene archivos y artefactos temporales generados por Maven. Hay momentos en que la carpeta de destino se vuelve enorme o cuando ciertos archivos que se han almacenado en caché deben limpiarse de la carpeta. El goal `clean` logra exactamente eso, ya que intenta eliminar la carpeta de destino y todo su contenido.

```sh
C:\apress\gswm-book\chapter5\gswm>mvn clean:clean
[INFO] Scanning for projects...
[INFO] --- maven-clean-plugin:2.5:clean (default-cli) @ gswm ---
[INFO] Deleting C:\apress\gswm-book\chapter5\gswm\target
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] --------------------------------------------------------
```

***Listado 5-2*** Maven `clean` Goal

Observe, el formato del comando `clean:clean` en el Listado 5-2. El `clean` antes de los dos puntos (:) representa el plug-in `clean`, y el `clean` después de los dos puntos representa el goal `clean`. A estas alturas, debería ser obvio que ejecutar un goal en la línea de comando requiere la siguiente sintaxis:

```sh
mvn plugin_identifier:goal_identifier
```

Maven proporciona un plug-in Help listo para usar que se puede utilizar para enumerar los goals disponibles en un plug-in determinado. El Listado 5-3 muestra el goal `describe` del plug-in Help para mostrar los goals dentro del plug-in compiler.

```sh
mvn help:describe -Dplugin=compiler

[INFO] Scanning for projects...
Name: Apache Maven Compiler Plugin
Description: The Compiler Plugin is used to compile the sources of your project.
Group Id: org.apache.maven.plugins
Artifact Id: maven-compiler-plugin
Version: 3.8.1
Goal Prefix: compiler
This plugin has 3 goals:
compiler:compile
  Description: Compiles application sources
compiler:help
  Description: Display help information on maven-compiler-plugin.
  Call mvn compiler:help -Ddetail=true -Dgoal=<goal-name> to display parameter details.
compiler:testCompile
  Description: Compiles application test sources .
```

***Listado 5-3*** Maven Help Plug-in

Los Plug-ins y su comportamiento se pueden configurar mediante la sección de complementos de `pom.xml`. Considere el caso en el que desea exigir que su proyecto se compile con Java 8. A partir de la versión 3.8, el complemento del compilador de Maven compila el código con Java 1.6. Por lo tanto, deberá modificar el comportamiento de este plug-in en el archivo `pom.xml`, como se muestra en el Listado 5-4.


```sh
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   
   <!-- Project details omitted for brevity -->
   
   <dependencies>
      <!-- Dependency details omitted for brevity -->
   </dependencies>
  
   <build>
      <plugins>
         <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
               <source>1.8</source>
               <target>1.8</target>
            </configuration>
         </plugin>
      </plugins>
   </build>
</project>
```

***Listado 5-4*** Plug-in Element en el archivo `pom.xml`

Ahora, si tuviera que ejecutar el comando `mvn compiler:compile`, los archivos de clase generados serán de la versión 1.8 de Java.

> **Nota:** El elemento ` <build />` en `pom.xml` tiene un elemento hijo muy útil llamado `finalName`. De forma predeterminada, el nombre del artefacto generado por Maven sigue el formato `<<project_artifiact_id>>-<<project_version>>`. Sin embargo, a veces es posible que desee cambiar el nombre del artefacto generado sin cambiar el `artifactId`. Puede lograr esto declarando el elemento `finalName` como `<finalName>new_name</finalName>`.

## Ciclo de vida y Fases

Los objetivos(goals) de Maven son granulares y normalmente realizan una tarea. Es necesario ejecutar varios objetivos de manera ordenada para realizar operaciones complejas, como generar artefactos o documentación. Maven simplifica estas operaciones complejas a través del ciclo de vida y abstracciones de fase, de modo que las operaciones relacionadas con la compilación se pueden completar con unos pocos comandos.

El ciclo de vida de compilación de Maven constituye una serie de etapas que se ejecutan en el mismo orden, independientemente del artefacto que se produzca. Maven se refiere a las etapas de un ciclo de vida como fases. Cada proyecto de Maven tiene los siguientes tres ciclos de vida integrados:

* ***default***: Este ciclo de vida maneja la compilación, el empaquetado y la implementación(deployment) de un proyecto Maven.
* ***clean***: Este ciclo de vida maneja la eliminación de archivos temporales y artefactos generados del directorio de destino.
* ***site***: Este ciclo de vida maneja la generación de documentación y la generación de sitios.

Para comprender mejor el ciclo de vida de la compilación y sus fases, veamos algunas de las fases asociadas con el ciclo de vida predeterminado:

* ***validate***: Ejecuta comprobaciones para garantizar que el proyecto sea correcto y que todas las dependencias estén descargadas y disponibles.
* ***compile***: Compila el código fuente.
* ***test***: Ejecuta pruebas unitarias usando frameworks. Este paso no requiere que la aplicación esté empaquetada.
* ***package***: Ensambla el código compilado en un formato distribuible, como `JAR` o `WAR`.
* ***install***: Instala el archivo empaquetado en un repositorio local. El archivo ahora está disponible para que lo use cualquier proyecto que se ejecute en esa máquina.
* ***deploy***: Inserta el archivo integrado en un repositorio remoto para que lo usen otros equipos y miembros del equipo.

El ciclo de vida de Maven es un concepto abstracto y no se puede ejecutar directamente. En su lugar, ejecuta una o más fases. Por ejemplo, el comando `mvn package` ejecutará la fase `package` del ciclo de vida predeterminado. Además de definir claramente el orden de las fases en un ciclo de vida, Maven también ejecuta automáticamente todas las fases antes de una fase solicitada. Entonces, cuando se ejecuta el comando ` mvn package`, Maven ejecutará todas las fases anteriores, como la `compile` and `test`.

Es necesario realizar una serie de tareas en cada fase. Para que eso suceda, cada fase está asociada con cero o más objetivos. La fase simplemente delega esas tareas a sus objetivos asociados. La Figura 5-1 muestra la asociación entre ciclo de vida, fases, goals y plug-ins.

![image](https://user-images.githubusercontent.com/23094588/118939885-7405ee00-b950-11eb-8434-75a59b595dfa.png)

***Figura 5-1*** Asociación entre ciclo de vida, fases, goals y plug-ins.

Es válido que una fase de Maven no tenga ningún objetivo asociado. En ese caso, Maven omitirá la ejecución de la fase. Estas fases sirven como marcadores de posición para que los usuarios y proveedores externos asocien sus objetivos personalizados.

El elemento `<packaging />` en el archivo `pom.xml` asignará automáticamente los objetivos correctos para cada una de las fases sin ninguna configuración adicional. Recuerde que este es un beneficio de CoC. Por ejemplo, si el elemento de empaquetado es `jar`, la fase del paquete estará vinculada al goal `jar` en el complemento `jar`. De manera similar, para un artefacto `WAR`, `pom.xml` vinculará el package a un goal `war` en el plug-in `war`. La Figura 5-2 muestra una parte del ciclo de vida interno asociado con un proyecto WAR.

![image](https://user-images.githubusercontent.com/23094588/118940915-7f0d4e00-b951-11eb-99bf-25378ab816d2.png)

***Figura 5-2*** Ciclo de vida predeterminado para el proyecto WAR

> **Saltarse los Tests**
> 
> Como se mencionó anteriormente, cuando ejecuta la fase package, también se ejecuta la fase test y se ejecutan todas las pruebas unitarias. Si hay algún error en la fase de prueba, la compilación falla. Este es el comportamiento deseado. Sin embargo, hay ocasiones, por ejemplo, cuando se trata de un proyecto heredado(legacy project), en las que le gustaría omitir la compilación y ejecución de las pruebas para poder construir un proyecto con éxito. Puede lograr esto usando la propiedad `maven.test.skip`. A continuación, se muestra un ejemplo del uso de esta propiedad:
> 
> `mvn package –Dmaven.test.skip=true`


Desarrollo de complementos
Desarrollar complementos personalizados para Maven es muy sencillo. Como se mencionó anteriormente, un complemento es simplemente una colección de objetivos. Por lo tanto, cuando hablamos de desarrollo de complementos, esencialmente estamos hablando de objetivos de desarrollo. En Java, estos objetivos se implementan mediante MOJO, que significa Maven Old Java Object, y es similar al Plain Old Java Object (POJO) de Java.
Esta sección explica cómo desarrollar un SystemInfoPlugin que muestra información del sistema, como la versión de Java, el sistema operativo y similares, en la consola que ejecuta el comando Maven.
Comencemos el desarrollo de este complemento creando un proyecto Java de Maven, llamado gswm-maven-plugin, como se muestra en la Figura 5-3.

![image](https://user-images.githubusercontent.com/23094588/118943477-f3e18780-b953-11eb-8958-75cebd95e512.png)


***Figura 5-3*** Proyecto Maven para desarrollo de complementos

> **Nota:** En este capítulo, estamos creando manualmente el proyecto de plug-in. Maven proporciona un *mavan-archetype-mojo*, que impulsaría el desarrollo de complementos. Aprenderemos sobre los arquetipos de Maven en el Capítulo 6.

El contenido del archivo `pom.xml` se muestra en el Listado 5-5. Tenga en cuenta que el tipo de paquete es `maven-plugin`. Agregamos las dependencias `maven-plugin-api` y `maven-plugin-annotations`, porque son necesarias para el desarrollo de complementos. Aprovecharemos Apache Commons Lang para obtener información del sistema. Por lo tanto, también hemos agregado la dependencia Apache Commons Lang 3.

```sh
<?xml version="1.0" encoding="UTF-8"?>
<project>
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.plugins</groupId>
   <artifactId>gswm-maven-plugin</artifactId>
   <version>1.0.0</version>
   <packaging>maven-plugin</packaging>
   <description>System Info Plugin</description>
   
   <properties>
      <maven.compiler.source>1.8</maven.compiler.source>
      <maven.compiler.target>1.8</maven.compiler.target>
   </properties>
   <dependencies>
      <dependency>
         <groupId>org.apache.maven</groupId>
         <artifactId>maven-plugin-api</artifactId>
         <version>3.6.1</version>
      </dependency>
      <dependency>
         <groupId>org.apache.maven.plugin-tools</groupId>
         <artifactId>maven-plugin-annotations</artifactId>
         <version>3.6.0</version>
         <scope>provided</scope>
      </dependency>
      <dependency>
         <groupId>org.apache.commons</groupId>
         <artifactId>commons-lang3</artifactId>
         <version>3.9</version>
      </dependency>
   </dependencies>
   <!-- Use the latest version of Plugin  -->
   <build>
      <plugins>
         <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-plugin-plugin</artifactId>
            <version>3.6.0</version>
         </plugin>
      </plugins>
   </build>
</project>
```

***Listado 5-5*** El `pom.xml` con dependencias

El siguiente paso en el proceso de desarrollo es crear el MOJO. El Listado 5-6 muestra el código de `SystemInfoMojo`. La anotación `@Mojo` marca la clase `SystemInfoMojo` como un Mojo con `"systeminfo"` como el nombre del goal. El método `execute` contiene esa lógica de objetivo. En `SystemInfoMojo`, simplemente registramos varias piezas de información del sistema en la consola.


```java
package com.apress.plugins;

import org.apache.commons.lang3.SystemUtils;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.apache.maven.plugins.annotations.Mojo;

@Mojo( name = "systeminfo")
public class SystemInfoMojo extends AbstractMojo {

   @Override
   public void execute() throws MojoExecutionException, MojoFailureException {
      getLog().info( "Java Home: " + SystemUtils.JAVA_HOME );
      getLog().info( "Java Version: "+ SystemUtils.JAVA_VERSION);
      getLog().info( "OS Name: " + SystemUtils.OS_NAME );
      getLog().info( "OS Version: " + SystemUtils.OS_VERSION );
      getLog().info( "User Name: " + SystemUtils.USER_NAME );
   }
   
}
```

***Listado 5-6*** Clase Java `SystemInfoMojo`

El último paso de este proceso es instalar el plug-in en el repositorio de Maven. Ejecute el comando `mvn install` en la raíz del directorio y debería obtener el resultado que se muestra en el Listado 5-7.

```sh
C:\apress\gswm-book\chapter5\gswm-maven-plugin>mvn install
[INFO] Scanning for projects...
[INFO]
[INFO] --------< com.apress.plugins:gswm-maven-plugin >--------
[INFO] Building gswm-maven-plugin 1.0.0
[INFO] -------------------[ maven-plugin ]---------------------
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ gswm-maven-plugin
[INFO] java-annotations mojo extractor found 1 mojo descriptor.
[INFO] --- maven-install-plugin:2.4:install (default-install) @ gswm-maven-plugin ---
[INFO] Installing C:\apress\gswm-book\chapter5\gswm-maven-plugin\target\gswm-maven-plugin-1.0.0.jar to C:\Users\<<USER_NAME>>\.m2\repository\com\apress\plugins\gswm-plugin\1.0.0\gswm-maven-plugin-1.0.0.jar
[INFO] Installing C:\apress\gswm-book\chapter5\gswm-maven-plugin\pom.xml to C:\Users\<<USER_NAME>>\.m2\repository\com\apress\plugins\gswm-maven-plugin\1.0.0\gswm-maven-plugin-1.0.0.pom
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
```

***Listado 5-7*** Maven `install` Command

Ahora está listo para comenzar a usar este plug-in. Recuerde que la sintaxis para ejecutar cualquier goal es `mvn pluginId:goal-name`. El Listado 5-8 muestra este plug-in en acción. Observe la información del sistema que se muestra en la consola.

```sh
C:\apress\gswm-book\chapter5\gswm-plugin>mvn com.apress.plugins:gswm-maven-plugin:systeminfo
[INFO] Scanning for projects...
[INFO] --- gswm-maven-plugin:1.0.0:systeminfo (default-cli) @ gswm-maven-plugin ---
[INFO] Java Home: C:\java\jdk-11
[INFO] Java Version: 11.0.1
[INFO] OS Name: Windows
[INFO] OS Version: 10
[INFO] User Name: Balaji
[INFO] --------------------------------------------------------
```

***Listado 5-8*** Ejecución del Plug-in `SystemInfoMojo`

El plug-in recientemente desarrollado también está listo para usarse en otros proyectos de Maven. El Listado 5-9 muestra una parte del archivo POM que adjunta el systeminfo goal a la fase validate.

```xml
<project>
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.plugins</groupId>
   <artifactId>gswm-plugin-test</artifactId>
   <version>1.0.0</version>
   <packaging>jar</packaging>
   <description>Plugin Test</description>
       
   <properties>
      <maven.compiler.source>1.8</maven.compiler.source>
      <maven.compiler.target>1.8</maven.compiler.target>
   </properties>
       
   <dependencies />
       
   <build>
      <plugins>
         <plugin>
            <groupId>com.apress.plugins</groupId>
            <artifactId>gswm-maven-plugin</artifactId>
            <version>1.0.0</version>
            <executions>
               <execution>
                  <phase>validate</phase>
                  <goals>
                     <goal>systeminfo</goal>
                  </goals>
               </execution>
            </executions>
         </plugin>
      </plugins>
   </build>
  
</project>
```

***Listado 5-9*** Archivo POM usando el Goal systeminfo

Cuando se invoca la fase de Maven, como compile o package, verá la salida del goal systeminfo como se muestra en el Listado 5-10.

```sh
mvn compile
[INFO] Scanning for projects...
[INFO] Building gswm-plugin-test 1.0.0
[INFO] Java Home: C:\java\jdk-11
[INFO] Java Version: 11.0.1
[INFO] OS Name: Windows
[INFO] OS Version: 10
[INFO] User Name: Balaji
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ gswm-plugin-test ---
```

***Listado 5-10*** Salida de fase de Compile

## Resumen

Maven utiliza una arquitectura basada en plug-in que permite ampliar su funcionalidad fácilmente. Cada plug-in es una colección de uno o más goals que se pueden utilizar para ejecutar tareas, como compilar código fuente o ejecutar pruebas. Maven vincula los goals a las fases. Las fases se ejecutan normalmente en una secuencia como parte de un ciclo de vida de compilación. También aprendió los conceptos básicos para crear un plug-in.

En el próximo capítulo, se le presentará a los arquetipos y aprenderá sobre proyectos de módulos múltiples.
