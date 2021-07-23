# 02 Comenzando en el Spring World: la Aplicación CMS

Ahora, crearemos nuestra primera aplicación; En este punto, hemos aprendido los conceptos de Spring y estamos listos para ponerlos en práctica. Al comienzo de este capítulo, presentaremos las dependencias de Spring para crear una aplicación web, también sabemos que **Spring Initializr** es un proyecto fantástico que permite a los desarrolladores crear proyectos de esqueleto de Spring, con tantas dependencias como deseen. En este capítulo, aprenderemos cómo instalar nuestra primera aplicación Spring en el IDE y línea de comando, exponer nuestro primer endpoint, comprender cómo funciona esto bajo el capó y conocer las principales anotaciones del soporte **Spring REST**. Descubriremos cómo crear una capa de servicio para la aplicación **CMS (Content Management System)** y entenderemos cómo funciona **Dependency Injection** en un contenedor Spring. Cumpliremos con los estereotipos de Spring e implementaremos nuestro primer ***bean*** de Spring. Al final de este capítulo, explicaremos cómo crear una capa de vista e integrarla con **AngularJS**.

En este capítulo, se cubrirán los siguientes temas:

* Crear la estructura del proyecto
* Ejecutar la primera aplicación Spring
* Presentamos el REST support
* Comprender la inyección de dependencia en Spring

## Crear la estructura de la aplicación CMS

Ahora crearemos nuestra primera aplicación con Spring Framework; Crearemos una estructura básica para la aplicación CMS con Spring Initializr. Esta página ayuda a arrancar nuestra aplicación, es una especie de guía que nos permite configurar las dependencias en Maven o Gradle. También podemos elegir el lenguaje y la versión de Spring Boot.

La página se ve así:

![image](https://user-images.githubusercontent.com/23094588/126833440-e484be90-d9f8-4f25-9196-b696d86e147f.png)

En la sección Project Metadata, podemos poner las coordenadas para los proyectos de Maven; hay un campo de grupo que se refiere a la etiqueta **`groupId`**, y tenemos artefactos que se refieren al **`artifactId`**. Todo esto es por las Maven coordinates.

La sección de dependencias habilita la configuración de las dependencias de Spring, el campo tiene la función de autocompletar y ayuda a los desarrolladores a colocar la dependencia correcta.

## El proyecto CMS

Antes de comenzar a codificar y aprender cosas increíbles, comprendamos un poco sobre el proyecto CMS, el objetivo principal de este proyecto es ayudar a las empresas a administrar el contenido del CMS para diferentes temas. Hay tres entidades principales en este proyecto:

* La clase **`News`** es la más importante, almacenará el contenido de las noticias.
* Tiene una *categoría* que facilita la búsqueda, y también podemos agrupar noticias por categoría, y por supuesto, podemos agrupar por el usuario que ha creado la noticia. La noticia debe ser aprobada por otros usuarios para asegurarse de que sigue las reglas de la empresa.
* La noticia también tiene algunas *tags*, como podemos ver, la aplicación es bastante estándar, las reglas comerciales también son fáciles; esto es intencional porque mantenemos el enfoque en las cosas nuevas que aprenderemos.

Ahora que sabemos cómo funciona Spring Initializr (https://start.spring.io) y las reglas comerciales que debemos seguir, estamos listos para crear el proyecto. Hagámoslo ahora mismo.

### Sección de metadatos del proyecto

Inserte **`spring-five`** en el campo Group y **`cms`** en el campo Artifact. Si quieres personalizarlo, no hay problema, esta es una especie de configuración informativa del proyecto:

![image](https://user-images.githubusercontent.com/23094588/126834235-f802a8c4-9e50-4dad-aa1e-f1246fa56f8b.png)

### Sección de dependencias

Escriba la palabra **`MVC`** en el campo Search for Dependencies. El módulo Web aparecerá como una opción, el Web module contiene el desarrollo web full-stack con Embedded Tomcat y Spring MVC, selecciónelo. Además, necesitamos poner las dependencias de **`Thymeleaf`** en este módulo. Es un motor de plantillas y será útil para las funciones de vista al final de este capítulo. Escriba **`Thymeleaf`**, incluye el motor de plantillas Thymeleaf e incluye integración con Spring. Aparecerá el módulo y luego selecciónelo también. Ahora podemos ver Web y Thymeleaf en el panel Dependencias seleccionadas:

![image](https://user-images.githubusercontent.com/23094588/126834743-b9635628-6e70-4e14-9815-5a1caf522635.png)

### Generando el proyecto

Una vez que hayamos terminado la definición del proyecto y elegido las dependencias del proyecto, estamos listos para descargar el proyecto. Se puede hacer usando el botón Generar Proyecto, haga clic en él. El proyecto se descargará. En esta etapa, el proyecto está listo para comenzar nuestro trabajo:

![image](https://user-images.githubusercontent.com/23094588/126834894-5b5ab764-ab71-421c-84ad-fb68a49f41b0.png)


> ℹ️ El archivo zip se generará con el nombre **`cms.zip`** (la información de entrada del campo Artifact) y la ubicación del archivo descargado depende de la configuración del navegador.

> ℹ️ Antes de abrir el proyecto, debemos descomprimir el artefacto generado por **Spring Initializr** en la ubicación deseada. El comando debe ser: **`unzip -d <target_destination> /<path_to_file>/cms.zip`**. Siga el ejemplo: **`unzip -d /home/john /home/john/Downloads/cms.zip`**.

Ahora, podemos abrir el proyecto en nuestro IDE. Abrámoslo y echemos un vistazo a la estructura básica del proyecto.

### Ejecutando la aplicación

Antes de ejecutar la aplicación, veamos la estructura de nuestro proyecto.

Abra el proyecto en IntelliJ IDEA usando las opciones Import Project u Open (ambas son similares), se mostrará la siguiente página:

![image](https://user-images.githubusercontent.com/23094588/126835642-de137de3-9980-4f9a-bbda-e7fe5e9a9ece.png)

Luego podemos abrir o importar el archivo **`pom.xml`**.

Se debe mostrar la siguiente estructura del proyecto:

![image](https://user-images.githubusercontent.com/23094588/126835743-610078bd-6d53-4dc1-9a01-73257f37e9a9.png)

Abra **`pom.xml`**, tenemos tres dependencias, **`spring-boot-starter-thymeleaf`**, **`spring-boot-starter-web`**, **`spring-boot-starter-test`** y un complemento interesante, **`spring-boot-maven-plugin`**.

Estas dependencias **`starter`** son un atajo para los desarrolladores porque proporcionan dependencias completas para el módulo. Por ejemplo, en **`spring-boot-starter-web`**, existe **`web-mvc`**, **`jackson-databind`**, **`hibernate-validator-web`** y algunos otros; estas dependencias deben estar en la ruta de clases para ejecutar las aplicaciones web, y los principiantes facilitan considerablemente esta tarea.

Analicemos nuestro **`pom.xml`**, el archivo debería verse así:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>spring-five</groupId>
  <artifactId>cms</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>jar</packaging>

  <name>cms</name>
  <description>Demo project for Spring Boot</description>

  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>1.5.8.RELEASE</version>
    <relativePath/> <!-- lookup parent from repository -->
  </parent>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <java.version>1.8</java.version>
  </properties>

  <dependencies>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-thymeleaf</artifactId>
    </dependency>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-test</artifactId>
      <scope>test</scope>
    </dependency>

    <dependency>
      <groupId>org.projectlombok</groupId>
      <artifactId>lombok</artifactId>
      <version>1.16.16</version>
      <scope>provided</scope>
    </dependency>

    <dependency>
      <groupId>io.springfox</groupId>
      <artifactId>springfox-swagger2</artifactId>
      <version>2.7.0</version>
    </dependency>

    <dependency>
      <groupId>io.springfox</groupId>
      <artifactId>springfox-swagger-ui</artifactId>
      <version>2.7.0</version>
    </dependency>

  </dependencies>

  <build>
    <plugins>
      <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
      </plugin>
    </plugins>
  </build>

</project>
```

AQUIIIII


