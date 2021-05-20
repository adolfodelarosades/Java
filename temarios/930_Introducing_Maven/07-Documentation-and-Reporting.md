# Chapter 7: Documentation and Reporting

* Using the Site Lifecycle
* Advanced Site Configuration
* Generating Javadoc Reports
* Generating Unit Test Reports
* Generating Code Coverage Reports
* Generating the SpotBugs Report
* Summary

La documentación y los informes son aspectos clave de cualquier proyecto. Esto es especialmente cierto para proyectos empresariales y de código abierto, donde muchas personas colaboran para desarrollar el proyecto. Este capítulo analiza algunas de las herramientas y complementos de Maven, que facilitan la publicación y el mantenimiento de la documentación en línea.

En este capítulo, volverá a trabajar con el proyecto Java `gswm` que creó en los capítulos anteriores. El proyecto `gswm` también está disponible en la carpeta `C:\apress\gswm-book\chapter7`.

## Uso del Ciclo de Vida del Site

Como se discutió en el Capítulo 5, Maven proporciona el ciclo de vida del *site* (sitio) que se puede usar para generar la documentación de un proyecto. Ejecutemos el siguiente comando desde el directorio `gswm`:


```sh
mvn site
```

El ciclo de vida del sitio utiliza el complemento del sitio de Maven para generar el sitio del proyecto. Una vez que se completa este comando, se crea una carpeta site en la carpeta de destino del proyecto. La Figura 7-1 muestra el contenido de la carpeta site.

![image](https://user-images.githubusercontent.com/23094588/119001194-0f688480-b98c-11eb-84c1-b97539de2239.png)

***Figura 7-1*** Carpeta de sitio generada

Abra el archivo `index.html` en un navegador para ver el sitio generado. Maven aplica automáticamente una máscara predeterminada al sitio y genera las imágenes y los archivos CSS correspondientes. La Figura 7-2 muestra el archivo `index.html` generado.

![image](https://user-images.githubusercontent.com/23094588/119001496-4ccd1200-b98c-11eb-9867-4e13e7927d44.png)

***Figura 7-2*** Página index generada

Al hacer clic en el enlace “Dependencies” en la parte inferior de la navegación izquierda, accederá a la página de dependencias del proyecto. La página de dependencias del proyecto proporciona información valiosa sobre las dependencias directas y transitivas del proyecto. También proporciona la información de licencia asociada con esas dependencias, como se muestra en la Figura 7-3.

![image](https://user-images.githubusercontent.com/23094588/119001786-93bb0780-b98c-11eb-8e0a-2f5d4888adca.png)

***Figura 7-3*** Página de dependencias del proyecto

Maven le permite agregar información al archivo `pom.xml` para que el sitio generado contenga información útil. El Listado 7-1 muestra el archivo `pom.xml` actualizado. Para que el sitio se genere correctamente, declaramos explícitamente la última versión de maven-site-plugin.

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
   
   <description>
      This project acts as a starter project for the Introducing Maven book (http://www.apress.com/9781484208427) published by Apress.
   </description>
  
   <mailingLists>
      <mailingList>
         <name>GSWM Developer List</name>
         <subscribe>gswm-dev-subscribe@apress.com</subscribe>
         <unsubscribe>gswm-dev-unsubscribe@apress.com</unsubscribe>
         <post>developer@apress.com</post>
      </mailingList>
   </mailingLists>
  
   <licenses>
      <license>
         <name>Apache License, Version 2.0</name>
         <url>http://www.apache.org/licenses/LICENSE-2.0.txt</url>
      </license>
   </licenses>
  
   <!--- Developer and Dependency removed for brevity --->
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
         <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-site-plugin</artifactId>
            <version>3.8.2</version>
         </plugin>
      </plugins>
   </build>
</project>
```

***Listado 7-1*** El archivo  con información del proyecto

En el Listado 7-1, usamos el elemento `description` para proporcionar una descripción del proyecto. La información del elemento `mailingList` sobre las diferentes listas de correo asociadas con el proyecto, y el elemento `license` incluye la licencia del proyecto. Con el archivo `pom.xml` actualizado en su lugar, regeneremos el sitio ejecutando el siguiente comando:

```sh
mvn clean site
```

Inicie el archivo `index.html` en la carpeta `target\site` recién generada. Las figuras 7-4A y 7-4B muestran las nuevas páginas About y Project License, respectivamente. Tenga en cuenta que Maven utiliza la URL declarada en el elemento `license` para descargar el texto de la licencia e incluirlo en la web generada.

![image](https://user-images.githubusercontent.com/23094588/119003480-0c6e9380-b98e-11eb-9604-f333f7fe35d8.png)

***Figura 7-4A*** Página About generada

![image](https://user-images.githubusercontent.com/23094588/119003692-3758e780-b98e-11eb-961c-4d3355212ebf.png)

***Figura 7-4B*** Página Project Licenses generadas

## Configuración Avanzada del Sitio

AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


