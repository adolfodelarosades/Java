# Chapter 6: Maven Archetypes

* Built-in Archetypes
* Generating a Web Project
* Multimodule Project
* Creating an Archetype
* Using the Archetype
* Summary

Hasta este punto del libro, ha creado proyectos Maven manualmente, generando las carpetas y creando los archivos `pom.xml` desde cero. Esto puede volverse tedioso, especialmente cuando tiene que crear proyectos con frecuencia. Para abordar este problema, Maven proporciona ***archetypes***. Los arquetipos de Maven *son plantillas de proyectos* que permiten a los usuarios generar nuevos proyectos fácilmente.

Los arquetipos de Maven también proporcionan una gran plataforma para compartir las mejores prácticas y hacer cumplir la coherencia más allá de la estructura de directorios estándar de Maven. Por ejemplo, una empresa puede crear un arquetipo con las hojas de estilo en cascada (CSS) de la marca, las libraries JavaScript aprobadas y los componentes reutilizables. Los desarrolladores que utilicen este arquetipo para generar proyectos se ajustarán automáticamente a los estándares de la empresa.

## Arquetipos incorporados

Maven proporciona cientos de arquetipos listos para usar para que los utilicen los desarrolladores. Además, muchos proyectos de código abierto proporcionan arquetipos adicionales que puede descargar y usar. Maven también proporciona un complemento de arquetipos con objetivos para crear nuevos arquetipos y generar proyectos a partir de arquetipos existentes.

El goal `generate` del plug-in del arquetipo le permite ver y seleccionar un arquetipo para su uso. El Listado 6-1 muestra los resultados de ejecutar el goal `generate` en la línea de comando. En el momento de escribir este libro, hay miles de arquetipos entre los que elegir. Este capítulo analizará el uso de algunos de estos arquetipos.

```sh
$mvn archetype:generate
[INFO] Scanning for projects...
[INFO] Generating project in Interactive mode
[INFO] No archetype defined. Using maven-archetype-quickstart (org.apache.maven.archetypes:maven-archetype-quickstart:1.0)
Choose archetype:
1: remote -> am.ik.archetype:elm-spring-boot-blank-archetype (Blank multi project for Spring Boot + Elm)
2: remote -> am.ik.archetype:maven-reactjs-blank-archetype (Blank Project for React.js)
3: remote -> am.ik.archetype:msgpack-rpc-jersey-blank-archetype (Blank Project for Spring Boot + Jersey)
...........................
...........................
2460: remote -> ws.osiris:osiris-archetype (Maven Archetype for Osiris)
2461: remote -> xyz.luan.generator:xyz-gae-generator (-)
2462: remote -> xyz.luan.generator:xyz-generator (-)
2463: local -> com.inflinx.book.ldap:practical-ldap-empty-archetype (-)
2464: local -> com.inflinx.book.ldap:practical-ldap-archetype (-)
2465: local -> com.apress.gswm:gswm-web-archetype (gswm-web-archetype)
Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): 1398:
```

***Listado 6-1*** Maven generate Goal

## Generando un Proyecto Web

Maven proporciona el arquetipo `maven-archetype-webapp` para generar una aplicación web. Generemos la aplicación ejecutando el siguiente comando en la carpeta `C:\apress\gswm-book\chapter6`:

```sh
mvn archetype:generate -DarchetypeArtifactId=maven-archetype-webapp
```

El comando se ejecuta en modo interactivo. Ingrese la siguiente información para las entradas solicitadas:

```sh
Define value for property 'groupId': : com.apress.gswmbook
Define value for property 'artifactId': : gswm-web
Define value for property 'version':  1.0-SNAPSHOT: :  <<Hit Enter>>
Define value for property 'package':  com.apress.gswmbook: : war
Confirm the properties configuration:
groupId: com.apress.gswmbook
artifactId: gswm-web
version: 1.0-SNAPSHOT
package: war
 Y: <<Hit Enter>>
```

La estructura de directorio generada debe parecerse a la que se muestra en la Figura 6-1.

![image](https://user-images.githubusercontent.com/23094588/118949448-89cbe100-b959-11eb-8db3-69be70a9751e.png)

El archivo `pom.xml` es mínimo y solo tiene una dependencia JUnit. Maven facilita la ejecución de su aplicación web mediante servidores web integrados, como Tomcat y Jetty. El Listado 6-2 muestra el archivo `pom.xml` modificado con un complemento Jetty agregado.

```xml
<project>
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.gswmbook</groupId>
   <artifactId>gswm-web</artifactId>
   <packaging>war</packaging>
   <version>1.0-SNAPSHOT</version>
   <name>gswm-web Maven Webapp</name>
   <url>http://maven.apache.org</url>
   <dependencies>
      <dependency>
         <groupId>junit</groupId>
         <artifactId>junit</artifactId>
         <version>3.8.1</version>
         <scope>test</scope>
      </dependency>
   </dependencies>
   <build>
      <finalName>gswm-web</finalName>
      <plugins>
         <plugin>
            <groupId>org.eclipse.jetty</groupId>
            <artifactId>jetty-maven-plugin</artifactId>
            <version>9.4.12.RC2</version>
         </plugin>
      </plugins>
   </build>
</project>
```

***Listado 6-2*** `pom.xml` modificado con el Plug-in Jetty integrado

Para iniciar la aplicación web usando el servidor Jetty, ejecute el siguiente comando en el directorio raíz del proyecto:

```sh
mvn jetty:run
```

Verá el proyecto implementado y verá un resultado similar al que se muestra en el Listado 6-3.

```sh
[INFO] Started o.e.j.m.p.JettyWebAppContext@e38f0b7{Archetype Created Web Application,/,file: C:/apress/gswm-book/chapter6/gswm-web/src/main/webapp/,AVAILABLE}{file:///C:/apress/gswm-book/chapter6/gswm-web/src/main/webapp/}
[INFO] Started ServerConnector@5a0e0886{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
[INFO] Started @5120ms
[INFO] Started Jetty Server
```

***Listado 6-3*** Salida del comando `run` de Jetty

Ahora inicie el navegador y navegue hasta http://localhost:8080/. Debería ver la página web como se muestra en la Figura 6-2.

![image](https://user-images.githubusercontent.com/23094588/118950585-9ef53f80-b95a-11eb-86c5-5e2124b760f6.png)

***Figura 6-2*** Proyecto Web lanzado en el navegador

## Proyecto Multimódulo

Los proyectos de Java Enterprise Edition (JEE) a menudo se dividen en varios módulos para facilitar el desarrollo y el mantenimiento. Cada uno de estos módulos produce artefactos como Enterprise JavaBeans (EJB), servicios web, proyectos web y archivos jar de cliente. Maven apoya el desarrollo de proyectos JEE tan grandes al permitir que varios proyectos de Maven se aniden en un solo proyecto de Maven. El diseño de un proyecto de varios módulos de este tipo se muestra en la Figura 6-3. El proyecto principal tiene un archivo `pom.xml` y proyectos individuales de Maven dentro de él.

![image](https://user-images.githubusercontent.com/23094588/118951002-04493080-b95b-11eb-9496-181fa560024c.png)

***Figura 6-3*** Estructura del proyecto Multimódulo

En el resto de esta sección, explicaremos cómo construir un proyecto multimódulo para el escenario donde tiene que dividir su gran proyecto en una aplicación web (artefacto `WAR`) que proporciona una interfaz de usuario, un proyecto de servicio (artefacto `JAR`) que contiene código de la capa de servicio y un proyecto de persistencia que contiene el código de la capa del repositorio. La figura 6-4 proporciona una representación visual de este escenario.

![image](https://user-images.githubusercontent.com/23094588/118951326-4b372600-b95b-11eb-8ae4-7eabb9decf71.png)

***Figura 6.4*** Proyecto Multimódulo Maven

Comencemos el proceso generando el proyecto principal. Para hacer esto, ejecute el siguiente comando en la línea de comando en `C:\apress\gswm-book\chapter6`:

```sh
mvn archetype:generate -DgroupId=com.apress.gswmbook -DartifactId=gswm-parent -Dversion=1.0.0-SNAPSHOT -DarchetypeGroupId=org.codehaus.mojo.archetypes -DarchetypeArtifactId=pom-root
```

El arquetipo `pom-root` crea la carpeta `gswm-parent` y un archivo `pom.xml` debajo. Como puede ver en el Listado 6-4, el archivo `pom.xml` generado tiene un contenido mínimo. Tenga en cuenta que el paquete del proyecto principal está configurado para escribir `pom`.

```sh
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.gswmbook</groupId>
   <artifactId>gswm-parent</artifactId>
   <version>1.0.0-SNAPSHOT</version>
   <packaging>pom</packaging>
   <name>gswm-parent</name>
</project>
```

***Listado 6-4*** Archivo Parent `pom.xml`

Luego cree el proyecto web ejecutando el siguiente comando en el directorio ` C:\apress\gswm-book\chapter6\gswm-parent`:

```sh
mvn archetype:generate -DgroupId=com.apress.gswmbook -DartifactId=gswm-web -Dversion=1.0.0-SNAPSHOT -Dpackage=war -DarchetypeArtifactId=maven-archetype-webapp
```

Durante la generación de este proyecto web, proporciona coordenadas de Maven, como `groupId`, `version`, etc., como parámetros para el goal `generate`. Esto creó el proyecto `gswm-web`.

El siguiente paso es crear el proyecto `service`. Ejecute el siguiente comando en `C:\apress\gswm-book\chapter6\gswm-parent`:

```sh
mvn archetype:generate -DgroupId=com.apress.gswmbook -DartifactId=gswm-service -Dversion=1.0.0-SNAPSHOT -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

Tenga en cuenta que no proporcionó el parámetro package, ya que `maven-archetype-quickstart` produce un proyecto JAR de forma predeterminada. Además, observe el uso del parámetro `interactiveMode`. Esto le indica a Maven que simplemente ejecute el comando sin pedirle al usuario que ingrese.

De forma similar al paso anterior, cree otro proyecto Java `gswm-repository` ejecutando el siguiente comando en `C:\apress\gswm-book\chapter6\gswm-parent`:

```sh
mvn archetype:generate -DgroupId=com.apress.gswmbook -DartifactId=gswm-repository -Dversion=1.0.0-SNAPSHOT -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

Ahora que tiene todos los proyectos generados, veamos el archivo `pom.xml` en `gswm-parent`. El listado 6-5 muestra el archivo `pom.xml`.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.apress.gswmbook</groupId>
   <artifactId>gswm-parent</artifactId>
   <version>1.0.0-SNAPSHOT</version>
   <packaging>pom</packaging>
   <name>gswm-parent</name>
   <modules>
      <module>gswm-web</module>
      <module>gswm-service</module>
      <module>gswm-repository</module>
   </modules>
</project>
```

***Listado 6-5*** Archivo Parent `pom.xml` con módulos

El elemento `modules` le permite declarar módulos secundarios en un proyecto de varios módulos. A medida que generaba cada módulo, Maven los registraba inteligentemente como un módulo secundario. Además, modificó el archivo `pom.xml` del módulo individual y agregó la información del `pom` principal. El Listado 6-6 muestra el archivo `pom.xml` del proyecto `gswm-web` con los elementos `pom` principales.

```sh
<?xml version="1.0"?>
<project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd" xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   <modelVersion>4.0.0</modelVersion>
   
   <parent>
      <groupId>com.apress.gswmbook</groupId>
      <artifactId>gswm-parent</artifactId>
      <version>1.0.0-SNAPSHOT</version>
   </parent>
   
   <groupId>com.apress.gswmbook</groupId>
   <artifactId>gswm-web</artifactId>
   <version>1.0.0-SNAPSHOT</version>
   <packaging>war</packaging>
   <name>gswm-web Maven Webapp</name>
   <url>http://maven.apache.org</url>
   <dependencies>
      <dependency>
         <groupId>junit</groupId>
         <artifactId>junit</artifactId>
         <version>3.8.1</version>
         <scope>test</scope>
      </dependency>
   </dependencies>
   <build>
      <finalName>gswm-web</finalName>
   </build>
</project>
```

***Listado 6-6*** El archivo `pom.xml` para el módulo web

Con toda la infraestructura configurada, está listo para construir el próximo proyecto. Para lograr esto, simplemente ejecute el comando `mvn package` en `gswm-project`, como se muestra en el Listado 6-7.

```sh
C:\apress\gswm-book\chapter6\gswm-parent>mvn package
[INFO] Scanning for projects...
[INFO] --------------------------------------------------------
[INFO] Reactor Build Order:
[INFO]
[INFO] gswm-parent
[INFO] gswm-web Maven Webapp
[INFO] gswm-service
[INFO] gswm-repository
[INFO] --------------------------------------------------------
[INFO] Reactor Summary:
[INFO]
[INFO] gswm-parent .......................... SUCCESS [0.001s]
[INFO] gswm-web Maven Webapp ................ SUCCESS [1.033s]
[INFO] gswm-service ......................... SUCCESS [0.552s]
[INFO] gswm-repository ...................... SUCCESS [0.261s]
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] --------------------------------------------------------
```

***Listado 6-7*** Paquete Maven que se ejecuta en el Parent Project

## Creando un Archetype

Maven ofrece varias formas de crear un nuevo arquetipo. Aquí usaremos un proyecto existente para generar un arquetipo.

Comencemos por crear un proyecto prototipo que usará como semilla para la creación de arquetipos. Este proyecto será compatible con Servlet 4.0 y tiene un Servlet de estado que devuelve un código de estado HTTP 200. En lugar de crear un proyecto web desde cero, copie el código del proyecto `gswm-web` generado previamente y cree `gswm-web-prototype` en `C:\apress\gswm-book\chapter6`. Realice los siguientes cambios en el proyecto recién copiado:

1. Elimine la carpeta de destino(target) y otros recursos, como archivos específicos del entorno de desarrollo integrado (IDE) (`.project`, `.classpath`, etc.) que no desee que terminen en el arquetipo.
 
2. Reemplace el contenido del archivo `web.xml` en la carpeta `webapp/WEB-INF` con el siguiente código. Esto actualizará la aplicación web para usar Servlet 4.0.

   ```sh
   <?xml version="1.0" encoding="UTF-8"?>
   <web-app version="4.0" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
   http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd">
   
      <display-name>Archetype Created Web Application</display-name>
   </web-app>
   ```

3. Agregue la dependencia de Servlet 4.0 al archivo `pom.xml`. El `pom.xml` actualizado se muestra en el Listado 6-8.

   ```xml
   <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
      <modelVersion>4.0.0</modelVersion>
      <groupId>com.apress.gswmbook</groupId>
      <artifactId>gswm-web</artifactId>
      <packaging>war</packaging>
      <version>1.0-SNAPSHOT</version>
      <name>gswm-web Maven Webapp</name>
      <url>http://maven.apache.org</url>
      <dependencies>
         <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
            <scope>provided</scope>
         </dependency>
      </dependencies>
      <build>
         <finalName>gswm-web</finalName>
         <plugins>
            <plugin>
               <groupId>org.eclipse.jetty</groupId>
               <artifactId>jetty-maven-plugin</artifactId>
               <version>9.4.12.RC2</version>
            </plugin>
         </plugins>
      </build>
   </project>
   ```
   
   ***Listado 6-8*** El `pom.xml` con dependencia de Servlet

4. Debido a que estará haciendo desarrollo web en Java, cree una carpeta llamada `java` en `src/main`. Del mismo modo, cree las carpetas `test/java` y `test/resources` en `src`.
 
5. Cree el archivo `AppStatusServlet.java` en el paquete `com.apress.gswmbook.web.servlet` en `src/main/java`. El paquete `com.apress.gswmbook.web.servlet` se traduce en la estructura de carpetas `com\apress\gswmbook\web\servlet`. El código fuente de `AppStatusServlet.java` se muestra en el Listado 6-9.
   
```java
package com.apress.gswmbook.web.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.∗;
import javax.servlet.http.∗;
import java.io.∗;

@WebServlet("/status")
public class AppStatusServlet extends HttpServlet {

   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
      PrintWriter writer = response.getWriter();
      writer.println("OK");
      response.setStatus(response.SC_OK);
   }
   
}
```

***Listado 6-9*** Código fuente de la clase Java `AppStatusServlet`

El proyecto prototype será similar a la estructura que se muestra en la Figura 6-5.

![image](https://user-images.githubusercontent.com/23094588/118957699-044c2f00-b961-11eb-9544-f262003601e2.png)

***Figura 6-5*** Proyecto prototype generado

Usando la línea de comando, navegue a la carpeta del proyecto `gswm-web-prototype` y ejecute el siguiente comando:

```sh
mvn archetype:create-from-project
```

Al completar el comando, debería ver el mensaje ***Archetype created in target/generated-sources/archetype***. El arquetipo recién creado ahora se encuentra en `gswm-web-prototype/target/generated-sources/archetype`.

El siguiente paso es mover el arquetipo recién creado a una carpeta separada `gswm-web-archetype` para que se pueda modificar antes de que se publique. Para lograr esto, siga estos pasos:

1. Cree la carpeta `gswm-web-archetype` en la carpeta `C:\apress\gswm-book\chapter6`.
 
2. Copie `pom.xml` y el directorio `src` y sus archivos de la carpeta ` C:\apress\gswm-book\chapter6\gswm-web-prototype\target\generated-sources\archetype` a la carpeta `gswm-web-archetype`.
 
La estructura del directorio para `gswm-web-archetype` debería ser similar a la que se muestra en la Figura 6-6.

![image](https://user-images.githubusercontent.com/23094588/118957874-2fcf1980-b961-11eb-9962-ed507a50cea4.png)

***Figura 6-6*** Estructura del proyecto de archetype Web

Comencemos el proceso de modificación con el archivo `pom.xml` ubicado en la raíz de la carpeta `gswm-web-archetype`. Cambie `artifactId` a `“gswm-web-archetype”` en el archivo pom. A continuación, modificaremos el archivo `pom.xml` ubicado en `gswm-web-archetype\src\main\resources\archetype-resources`. Cambie `<finalName>` en el archivo `pom.xml` de `gswm-web` a `${artifactId}`. Durante la creación del proyecto, Maven reemplazará la expresión `${artifactId}` con el valor `artifactId` proporcionado por el usuario.

Cuando se crea un proyecto a partir de un arquetipo, Maven solicita al usuario un nombre de paquete. Creará los directorios correspondientes al paquete en la carpeta `src/main/java` del proyecto recién creado. Luego mueve todo el contenido de la carpeta `archetype-resources/src/main/java` del arquetipo a ese paquete. Como le gustaría `AppStatusServlet` en el subpaquete `web.servlet`, cree la carpeta `web/servlet` y mueva `AppStatusServlet.java` a la carpeta recién creada. La nueva ubicación de `AppStatusServlet.java` se muestra en la Figura 6-7.

![image](https://user-images.githubusercontent.com/23094588/118960280-69088900-b963-11eb-88c9-55ba6e17943b.png)

***Figura 6-7*** `AppStatusServlet` en el paquete `web.servlet`

Abra `AppStatusServlet.java` y cambie el nombre del paquete de `package ${package};` a `package ${package}.web.servlet;`.

El paso final para crear el arquetipo es ejecutar lo siguiente en la línea de comando dentro de la carpeta `gswm-web-archetype`:

```sh
mvn clean install
```

## Usando el Archetype

Una vez que el arquetipo está instalado, la forma más fácil de crear un proyecto a partir de él es ejecutar el siguiente comando en `C:\apress\gswm-book\chapter6`:

```sh
mvn archetype:generate -DarchetypeCatalog=local
```

Ingrese los valores que se muestran en el Listado 6-10 para los Maven prompts y verá `test-project` creado.

```sh
C:\apress\gswm-book\chapter6>mvn archetype:generate -DarchetypeCatalog=local
[INFO] Scanning for projects...
[INFO]
[INFO] --------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] --------------------------------------------------------
[INFO] Generating project in Interactive mode
[INFO] No archetype defined. Using maven-archetype-quickstart (org.apache.maven.archetypes:maven-archetype-quickstart:1.0)
Choose archetype:1: local -> com.apress.gswmbook:gswm-web-archetype (gswm-web-archetype)
Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): : 1
Define value for property 'groupId': : com.apress.gswmbook
Define value for property 'artifactId': : test-project
Define value for property 'version':  1.0-SNAPSHOT: :
Define value for property 'package':  com.apress.gswmbook: :
Confirm properties configuration:
groupId: com.apress.gswmbook
artifactId: test-project
version: 1.0-SNAPSHOT
package: com.apress.gswmbook
 Y: :
---------------------------------------------------------------
project
[INFO] --------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] --------------------------------------------------------
```

***Listado 6-10*** Creando un nuevo proyecto usando Archetype

Debido a que el archivo `pom.xml` para el `test-project` ya tiene el plug-in Jetty incorporado, ejecute `mvn jetty:run` en la línea de comando en la carpeta `C:\apress\gswm-book\chapter6\test-project` para iniciar el proyecto . Abra un navegador y navegue hasta `http://localhost:8080/status`. Verá que se muestra la cadena OK.

## Resumen

Los arquetipos de Maven son plantillas de proyectos que le permiten iniciar nuevos proyectos rápidamente. Este capítulo utilizó arquetipos incorporados para generar proyectos avanzados de Maven, como proyectos web y proyectos de varios módulos. También buscó crear y usar un arquetipo personalizado.
En el próximo capítulo, aprenderá los conceptos básicos de la generación de sitios y la creación de documentación e informes utilizando Maven.
