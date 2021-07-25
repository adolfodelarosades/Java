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

## Generando el proyecto

Una vez que hayamos terminado la definición del proyecto y elegido las dependencias del proyecto, estamos listos para descargar el proyecto. Se puede hacer usando el botón Generar Proyecto, haga clic en él. El proyecto se descargará. En esta etapa, el proyecto está listo para comenzar nuestro trabajo:

![image](https://user-images.githubusercontent.com/23094588/126834894-5b5ab764-ab71-421c-84ad-fb68a49f41b0.png)


> ℹ️ *El archivo zip se generará con el nombre **`cms.zip`** (la información de entrada del campo Artifact) y la ubicación del archivo descargado depende de la configuración del navegador.*

> 💡 *Antes de abrir el proyecto, debemos descomprimir el artefacto generado por **Spring Initializr** en la ubicación deseada. El comando debe ser: **`unzip -d <target_destination> /<path_to_file>/cms.zip`**. Siga el ejemplo: **`unzip -d /home/john /home/john/Downloads/cms.zip`***.

Ahora, podemos abrir el proyecto en nuestro IDE. Abrámoslo y echemos un vistazo a la estructura básica del proyecto.

## Ejecutando la aplicación

Antes de ejecutar la aplicación, veamos la estructura de nuestro proyecto.

Abra el proyecto en IntelliJ IDEA usando las opciones Import Project u Open (ambas son similares), se mostrará la siguiente página:

![image](https://user-images.githubusercontent.com/23094588/126835642-de137de3-9980-4f9a-bbda-e7fe5e9a9ece.png)

Luego podemos abrir o importar el archivo **`pom.xml`**.

Se debe mostrar la siguiente estructura del proyecto:

![image](https://user-images.githubusercontent.com/23094588/126835743-610078bd-6d53-4dc1-9a01-73257f37e9a9.png)

Abra **`pom.xml`**, tenemos tres dependencias, **`spring-boot-starter-thymeleaf`**, **`spring-boot-starter-web`**, **`spring-boot-starter-test`** y un complemento interesante, **`spring-boot-maven-plugin`**.

Estas dependencias **`starter`** son un atajo para los desarrolladores porque proporcionan dependencias completas para el módulo. Por ejemplo, en **`spring-boot-starter-web`**, existe **`web-mvc`**, **`jackson-databind`**, **`hibernate-validator-web`** y algunos otros; estas dependencias deben estar en la ruta de clases para ejecutar las aplicaciones web, y a los principiantes facilita considerablemente esta tarea.

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

Además, tenemos un **`spring-boot-maven-plugin`**, este fantástico plugin proporciona soporte Spring Boot para Maven. Le permite empaquetar la aplicación en un Fat-JAR, y el complemento admite los objetivos de ejecución, inicio y detención, además de interactuar con nuestras aplicaciones.

> ℹ️ ***Fat-JAR**: un JAR que contiene todos los archivos y recursos de la clase del proyecto empaquetados junto con todas sus dependencias.*

Por ahora, eso es suficiente en las configuraciones de Maven; echemos un vistazo a los archivos de Java.

Spring Initializr creó una clase para nosotros, en general, el nombre de esta clase es el nombre del artefacto más **`Application`**, en nuestro caso **`CmsApplication`**, esta clase debería verse así:

```java
package springfive.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CmsApplication {

  public static void main(String[] args) {
    SpringApplication.run(CmsApplication.class, args);
  }
  
}
```

### Mirando bajo el capó

Tenemos algunas cosas interesantes aquí, vamos a entenderlas. **`@SpringBootApplication`** es la anotación esencial para la aplicación Spring Boot; es una especie de alias para las anotaciones **`@Configuration`**, **`@EnableAutoConfiguration`** y **`@Component`**. Vamos a profundizar en:

* La primera anotación, **`@Configuration`** indica que la clase puede producir definiciones de beans para el contenedor Spring. Esta es una anotación interesante para trabajar con dependencias externas como **`DataSources`**; este es el caso de uso más común para esta anotación.

* La segunda anotación, **`@EnableAutoConfiguration`** significa que con el contenedor Spring **`ApplicationContext`**, intentará ayudarnos a configurar los beans predeterminados para el contexto específico. Por ejemplo, cuando creamos la aplicación web MVC con Spring Boot, probablemente necesitemos un contenedor de servidor web para ejecutarla. En una configuración predeterminada, el contenedor Spring, junto con **`@EnableAutoConfiguration`**, configurará un contenedor bean Tomcat incrustado para nosotros. Esta anotación es muy útil para los desarrolladores.

* **`@Component`** es un estereotipo, el contenedor comprende qué clase se considera para la detección automática y necesita instanciarla.

La clase **`SpringApplication`** es responsable de arrancar la aplicación Spring desde el método principal, creará una instancia de **`ApplicationContext`**, se encargará de las configuraciones proporcionadas por los archivos de configuración y, finalmente, cargará los beans singleton que están definidos por anotaciones.

> ℹ️ ***Stereotype Annotations** denotan una división conceptual en una capa de arquitectura. Ayudan a los desarrolladores a comprender el propósito de la clase y la capa que representan los beans, por ejemplo, **`@Repository`** significa la capa de acceso a datos.*

## Ejecutando la aplicación

Ejecutaremos la aplicación en IntelliJ IDEA y línea de comando. Es una tarea importante de aprender porque estamos trabajando en diferentes entornos de desarrollo; a veces las configuraciones de la aplicación son un poco complicadas y no podemos ejecutarla con IDE, o algunas veces las empresas tienen diferentes IDE como estándar, por lo que aprenderemos de dos formas diferentes.

### IntelliJ IDEA

En general, IntelliJ IDEA reconoce la clase principal anotada con **`@SpringBootApplication`** y crea una configuración de ejecución para nosotros, pero depende de la versión de la herramienta, hagámoslo.

### Línea de comando

La línea de comando es una herramienta más genérica para ejecutar el proyecto. Además, esta tarea es fácil, gracias al complemento Spring Boot Maven. Hay dos formas de ejecutar, y cubriremos ambas.

#### Línea de comando a través del Maven goal

El primero es un objetivo del complemento Spring Boot Maven, y es sencillo; abra la terminal luego vaya a la carpeta raíz del proyecto, preste atención ya que esta es la misma carpeta donde tenemos el **`pom.xml`**, y ejecute el siguiente comando:

```sh
mvn clean install spring-boot:run
```

Maven ahora compilará el proyecto y ejecutará la clase principal, la clase **`CmsApplication`**, y deberíamos ver este resultado:

![image](https://user-images.githubusercontent.com/23094588/126879809-c3539693-53fb-47d8-ad4e-319dbe46a942.png)

#### Línea de comando a través del archivo JAR

Para ejecutarlo a través del archivo Java, necesitamos compilarlo y empaquetarlo, y luego podemos ejecutar el proyecto con la línea de comandos de Java. Para compilarlo y empaquetarlo, podemos usar el comando Maven bastante estándar como este:

```sh
mvn clean install
```

Una vez compilado y empaquetado el proyecto como Fat-JAR, podemos ejecutar el archivo JAR, ir a la carpeta de destino y verificar los archivos de esta carpeta, probablemente el resultado se verá así:

![image](https://user-images.githubusercontent.com/23094588/126879915-04cca3a6-794b-45f2-a66f-dd76d4846a96.png)

Tenemos dos archivos principales en nuestra carpeta de destino, el **`cms-0.0.1-SNAPSHOT.jar`** y el **`cms-0.0.1-SNAPSHOT.jar.original`**, el archivo con la extensión **`.original`** no es ejecutable. Es el artefacto original resultante de la compilación, y el otro es nuestro archivo ejecutable. Es lo que buscamos, ejecutémoslo, tecleamos el siguiente comando:

```sh
java -jar cms-0.0.1-SNAPSHOT.jar
```

El resultado debe ser el que se muestra. La aplicación está en funcionamiento:

![image](https://user-images.githubusercontent.com/23094588/126880100-7b2465f3-7233-4430-97cb-12dfa9adc5cb.png)

Eso es todo por esta parte, en la siguiente sección, crearemos los primeros recursos **REST** (**Representational State Transfer**) y entenderemos cómo funcionan los endpoints REST.


## 💻 Proyecto CMS

### Generando el proyecto

https://start.spring.io/

![image](https://user-images.githubusercontent.com/23094588/126878776-a4a8eff2-e867-49d9-8ed6-ef94555f8aeb.png)

![image](https://user-images.githubusercontent.com/23094588/126878884-3ce2a49e-1df4-44a7-b410-5a50b7b41721.png)

![image](https://user-images.githubusercontent.com/23094588/126878943-98def455-5129-4f5a-b2cd-8099f96edb2a.png)

### Ejecutando la aplicación

Abrimos el Proyecto con IntelliJ

![image](https://user-images.githubusercontent.com/23094588/126879261-8fc6ef2a-de3f-4e77-aab8-b7d2760d01b8.png)

**`CmsApplication`**

![image](https://user-images.githubusercontent.com/23094588/126879418-adcde409-bb31-4791-9cb0-cd49d225dec8.png)

#### Desde IntelliJ

![image](https://user-images.githubusercontent.com/23094588/126880180-bac1ae98-ff31-4bbb-add2-b9790fcc7b62.png)

![image](https://user-images.githubusercontent.com/23094588/126880168-67baa600-fd1a-40f6-a603-9d984a6f0b73.png)

#### Desde Linea de Comandos via Maven goal

![image](https://user-images.githubusercontent.com/23094588/126880257-43b97f28-c7d9-44d2-b768-5037b6554dce.png)

![image](https://user-images.githubusercontent.com/23094588/126880272-ec68362b-9278-4520-b9a0-7952886aff2f.png)

![image](https://user-images.githubusercontent.com/23094588/126880277-17f5c726-800a-493d-8458-d38773f19a5e.png)

#### Desde Linea de Comandos via JAR file

![image](https://user-images.githubusercontent.com/23094588/126880295-0e7ad4e5-e754-4e36-9a7f-a4dda5dfadee.png)

![image](https://user-images.githubusercontent.com/23094588/126880303-661b899a-ba29-4e5d-9bc2-6184cbe55f76.png)

![image](https://user-images.githubusercontent.com/23094588/126880312-63f336b1-10a6-4abe-8c58-850c4704fbcf.png)

![image](https://user-images.githubusercontent.com/23094588/126880345-565a2625-3fb5-4ae2-a5e1-06f9f09eebfd.png)

**`java -jar cms-0.0.1-SNAPSHOT.jar`**

![image](https://user-images.githubusercontent.com/23094588/126880358-b6c9bedb-2006-4364-a469-22a834de857e.png)

![image](https://user-images.githubusercontent.com/23094588/126880374-97d45f99-5e72-4a6f-bc5e-774166a3ce07.png)

![image](https://user-images.githubusercontent.com/23094588/126880381-3a4047bf-c571-42a0-b61a-a1b369b3dcc7.png)

### Con Eclipse

![image](https://user-images.githubusercontent.com/23094588/126909984-80ab42d7-408b-43ac-ac2d-447bc402be78.png)

![image](https://user-images.githubusercontent.com/23094588/126909998-a4f2f006-4498-4488-a7d1-21685851424b.png)

## Creando los recursos REST

Ahora, tenemos una aplicación en funcionamiento en esta sección, y agregaremos algunos endpoints REST y modelaremos algunas clases iniciales para la aplicación CMS, los endpoints REST serán útiles para la integración de AngularJS.

Una de las características requeridas para las API es la documentación, y una herramienta popular para ayudarnos con estas tareas es **Swagger**. Spring Framework es compatible con Swagger, y podemos hacerlo con un par de anotaciones. **Spring Fox** del proyecto es la herramienta correcta para hacer esto, y veremos la herramienta en este capítulo.

Hagámoslo.

### Modelos

Antes de comenzar a crear nuestra clase, agregaremos la dependencia de **`Lombok`** en nuestro proyecto. Es una library fantástica que proporciona algunas cosas interesantes como **`GET/SET`** en el momento de la compilación, la palabra clave **`Val`** para hacer que las variables sean finales, **`@Data`** para hacer una clase con algunos métodos predeterminados como **`getters/setters`**, **`equals`** y **`hashCode`**.

### Agregar dependencia de Lombok

Coloque la siguiente dependencia en un archivo **`pom.xml`**:

```xml
<dependency>
  <groupId>org.projectlombok</groupId>
  <artifactId>lombok</artifactId>
  <version>1.16.16</version>
  <scope>provided</scope>
</dependency>
```

El alcance **`provided`** le indica a Maven que no incluya esta dependencia en el archivo JAR porque la necesitamos en el momento de la compilación. No lo necesitamos en tiempo de ejecución. Espere a que Maven descargue la dependencia, eso es todo por ahora.

Además, podemos usar ***Reimport All Maven Projects*** proporcionados por IntelliJ IDEA, que se encuentra en la pestaña Proyectos de Maven, como se muestra aquí:

![image](https://user-images.githubusercontent.com/23094588/126880604-398cc3cf-1300-4562-88b7-f770031af06c.png)

### Creando los modelos

Ahora, crearemos nuestros modelos, que son clases de Java anotadas con **`@Data`**.

#### Tag

Esta clase representa una etiqueta en nuestro sistema. No hay necesariamente un repositorio para él porque se conservará junto con nuestra entidad **`News`**:

```java
package springfive.cms.domain.models;

import lombok.Data;

@Data
public class Tag {

  String value;

}
```

#### Category

Se puede utilizar un modelo de categoría para nuestra aplicación CMS para agrupar las noticias. Además, la otra cosa importante es que esto hace que nuestras noticias estén categorizadas para facilitar la tarea de búsqueda. Eche un vistazo al siguiente código: 

```java
package springfive.cms.domain.models;

import lombok.Data;

@Data
public class Category {

  String id;

  String name;

}
```

#### User

Representa a un usuario en nuestro modelo de dominio. Tenemos dos perfiles diferentes, el autor que actúa como redactor de noticias, y otro es revisor que debe revisar las noticias registradas en el portal. Eche un vistazo al siguiente ejemplo:

```java
package springfive.cms.domain.models;

import lombok.Data;

@Data
public class User {

  String id;

  String identity;

  String name;

  Role role;

}
```

#### Role

```java
package springfive.cms.domain.models;

/**
 * @author claudioed on 28/10/17. Project cms
 */
public enum Role {

  AUTHOR,

  REVIEWER

}
```

#### News

Esta clase representa noticias en nuestro dominio, por ahora, no tiene comportamientos. Solo se exponen las propiedades y los getters/setters; en el futuro, agregaremos algunos comportamientos:

```java
package springfive.cms.domain.models;

import java.util.Set;
import lombok.Data;

@Data
public class News {

  String id;

  String title;

  String content;

  User author;

  Set<User> mandatoryReviewers;
  
  Set<Review> reviewers;

  Set<Category> categories;

  Set<Tag> tags;

}
```

La clase **`Review`** se puede encontrar en GitHub: (https://github.com/PacktPublishing/Spring-5.0-By-Example/tree/master/Chapter02/src/main/java/springfive/cms/domain/models).

Como podemos ver, son clases simples de Java que representan nuestro dominio de aplicación CMS. Es el corazón de nuestra aplicación y toda la lógica del dominio residirá en estas clases. Es una característica importante.

#### Review

```java
package springfive.cms.domain.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author claudioed on 29/10/17. Project cms
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

  String userId;

  String status;

}
```

![image](https://user-images.githubusercontent.com/23094588/126910217-593689e8-4b84-4687-a0ab-bb5be9db8514.png)


## Hello REST resources

Hemos creado los modelos y podemos empezar a pensar en nuestros recursos REST. Crearemos tres recursos principales:

* **`CategoryResource`** que será responsable de la clase **`Category`**.

* El segundo es **`UserResource`**. Gestionará las interacciones entre la clase **`User`** y las API REST.

* El último, y más importante también, será el **`NewsResource`** que se encargará de gestionar las entidades informativas, como las reseñas.

### Creando la clase `CategoryResource`

Crearemos nuestro primer recurso REST, comencemos con la clase **`CategoryResource`** que es responsable de administrar nuestra clase **`Category`**. La implementación de esta entidad será simple y crearemos puntos finales CRUD como crear, recuperar, actualizar y eliminar. Tenemos dos cosas importantes que debemos tener en cuenta cuando creamos las API. El primero es el verbo HTTP correcto, como **`POST`**, **`GET`**, **`PUT`** y **`DELETE`**. Es fundamental que las API REST tengan el verbo HTTP correcto, ya que nos proporciona un conocimiento intrínseco sobre la API. Es un patrón para cualquier cosa que interactúe con nuestras API. Otra cosa son los códigos de estado, y es el mismo que el primero que debemos seguir, este es el patrón que los desarrolladores reconocerán fácilmente. El ***Richardson Maturity Model*** puede ayudarnos a crear increíbles API REST, y este modelo introduce algunos niveles para medir las API REST, es una especie de termómetro.

En primer lugar, crearemos el esqueleto de nuestras API. Piense en las funciones que necesita en su aplicación. En la siguiente sección, explicaremos cómo agregar una capa de servicio en nuestras API REST. Por ahora, creemos una clase **`CategoryResource`**, nuestra implementación podría verse así:

```java
package springfive.cms.domain.resources;

import java.util.Arrays;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import springfive.cms.domain.models.Category;
import springfive.cms.domain.vo.CategoryRequest;

@RestController
@RequestMapping("/api/category")
public class CategoryResource {

  @GetMapping(value = "/{id}")
  public ResponseEntity<Category> findOne(@PathVariable("id") String id){
    return ResponseEntity.ok(new Category());
  }

  @GetMapping
  public ResponseEntity<List<Category>> findAll(){
    return ResponseEntity.ok(Arrays.asList(new Category(),new Category()));
  }

  @PostMapping
  public ResponseEntity<Category> newCategory(CategoryRequest category){
    return new ResponseEntity<>(new Category(), HttpStatus.CREATED);
  }

  @DeleteMapping("/{id}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  public void removeCategory(@PathVariable("id") String id){
  }

  @PutMapping("/{id}")
  public ResponseEntity<Category> updateCategory(@PathVariable("id") String id,CategoryRequest category){
    return new ResponseEntity<>(new Category(), HttpStatus.OK);
  }

}
```

Tenemos algunos conceptos importantes aquí. El primero es **`@RestController`**. Indica a Spring Framework que la clase **`CategoryResource`** expondrá los puntos finales REST sobre el módulo Web-MVC. Esta anotación configurará algunas cosas en un framework, como **`HttpMessageConverters`** para manejar solicitudes y respuestas HTTP como XML o JSON. Por supuesto, necesitamos las libraries correctas en la ruta de clases para manejar JSON y XML. Además, agregue algunos headers a la request, como **`Accept`** y **`Type`**. Esta anotación se introdujo en la versión 4.0. Es una especie de anotación sintáctica de azúcar porque está anotada con **`@Controller`** y **`@ResponseBody`**.

La segunda es la anotación **`@RequestMapping`**, y esta importante anotación es responsable de la HTTP request y response  en nuestra clase. El uso es bastante simple en este código cuando lo usamos en el nivel de clase, se propagará para todos los métodos y los métodos lo usarán como relativo. La anotación **`@RequestMapping`** tiene diferentes casos de uso. Nos permite configurar el verbo HTTP, los parámetros y los headers.

Finalmente, tenemos **`@GetMapping`**, **`@PostMapping`**, **`@DeleteMapping`** y **`@PutMapping`**, estas anotaciones son una especie de atajo para configurar el **`@RequestMapping`** con los verbos HTTP correctos; una ventaja es que estas anotaciones hacen que el código sea más legible.

A excepción de **`removeCategory`**, todos los métodos devuelven la clase **`ResponseEntity`** que nos permite manejar los códigos de estado HTTP correctos en la siguiente sección.

La **`CategoryRequest`** se puede encontrar en GitHub: (https://github.com/PacktPublishing/Spring-5.0-By-Example/tree/master/Chapter02/src/main/java/springfive/cms/domain/vo).

```java
package springfive.cms.domain.vo;

import lombok.Data;

/**
 * @author claudioed on 29/10/17. Project cms
 */
@Data
public class CategoryRequest {

  String name;

}
```

### `UserResource`

La clase **`UserResource`** es la misma que **`CategoryResource`**, excepto que usa la clase **`User`**. Podemos encontrar el código completo en GitHub (https://github.com/PacktPublishing/Spring-5.0-By-Example/tree/master/Chapter02).


```java
package springfive.cms.domain.resources;

import java.util.Arrays;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import springfive.cms.domain.models.User;
import springfive.cms.domain.vo.NewsRequest;
import springfive.cms.domain.vo.UserRequest;

/**
 * @author claudioed on 29/10/17. Project cms
 */
@RestController
@RequestMapping("/api/user")
public class UserResource {

  @GetMapping(value = "/{id}")
  public ResponseEntity<User> findOne(@PathVariable("id") String id){
    return ResponseEntity.ok(new User());
  }

  @GetMapping
  public ResponseEntity<List<User>> findAll(){
    return ResponseEntity.ok(Arrays.asList(new User(),new User()));
  }

  @PostMapping
  public ResponseEntity<User> newUser(UserRequest userRequest){
    return new ResponseEntity<>(new User(), HttpStatus.CREATED);
  }

  @DeleteMapping("/{id}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  public void removeUser(@PathVariable("id") String id){
  }

  @PutMapping("/{id}")
  public ResponseEntity<User> updateUser(@PathVariable("id") String id,User userRequest){
    return new ResponseEntity<>(new User(), HttpStatus.OK);
  }

}
```

**`UserRequest`**

```java
package springfive.cms.domain.vo;

import lombok.Data;
import springfive.cms.domain.models.Role;

/**
 * @author claudioed on 29/10/17. Project cms
 */
@Data
public class UserRequest {

    String identity;

    String name;

    Role role;

}
```

### `NewsResource`

La clase **`NewsResource`** es esencial, este endpoint permite a los usuarios revisar las noticias registradas previamente y también proporciona un endpoint para devolver las noticias actualizadas. Esta es una característica importante porque solo nos interesan las noticias relevantes. No se pueden mostrar noticias irrelevantes en el portal. La clase de recurso debería verse así:

```java
package springfive.cms.domain.resources;

import java.util.Arrays;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import springfive.cms.domain.models.News;
import springfive.cms.domain.models.Review;
import springfive.cms.domain.vo.NewsRequest;

@RestController
@RequestMapping("/api/news")
public class NewsResource {

  @GetMapping(value = "/{id}")
  public ResponseEntity<News> findOne(@PathVariable("id") String id){
    return ResponseEntity.ok(new News());
  }

  @GetMapping
  public ResponseEntity<List<News>> findAll(){
    return ResponseEntity.ok(Arrays.asList(new News(),new News()));
  }

  @PostMapping
  public ResponseEntity<News> newNews(NewsRequest news){
    return new ResponseEntity<>(new News(), HttpStatus.CREATED);
  }

  @DeleteMapping("/{id}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  public void removeNews(@PathVariable("id") String id){
  }

  @PutMapping("/{id}")
  public ResponseEntity<News> updateNews(@PathVariable("id") String id,NewsRequest news){
    return new ResponseEntity<>(new News(), HttpStatus.OK);
  }

  @GetMapping(value = "/{id}/review/{userId}")
  public ResponseEntity<Review> review(@PathVariable("id") String id,@PathVariable("userId") String userId){
    return ResponseEntity.ok(new Review());
  }

  @GetMapping(value = "/revised")
  public ResponseEntity<List<News>> revisedNews(){
    return ResponseEntity.ok(Arrays.asList(new News(),new News()));
  }

}
```

**`NewsRequest`**

```java
package springfive.cms.domain.vo;

import java.util.Set;
import lombok.Data;
import springfive.cms.domain.models.Category;
import springfive.cms.domain.models.Tag;

/**
 * @author claudioed on 29/10/17. Project cms
 */
@Data
public class NewsRequest {

  String title;

  String content;

  Set<Category> categories;

  Set<Tag> tags;

}
```

![image](https://user-images.githubusercontent.com/23094588/126910697-69f4ceaa-9370-41bb-a5ff-5fd1d9953cce.png)


## Agregar capa de repositorio

(No se menciona nada en el libro)

### `AbstractRepository`

```java
package springfive.cms.domain.repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author claudioed on 29/10/17. Project cms
 */
public abstract class AbstractRepository<T> {

  private final List<T> elements = new ArrayList<>();

  public void delete(T entity){
    final Iterator<T> iterator = elements.iterator();
    while (iterator.hasNext()){
      final T next = iterator.next();
      if(next.equals(entity)){
        iterator.remove();
        break;
      }
    }
  }

  public List<T> findAll(){
    return this.elements;
  }

  public T save(T entity){
    this.elements.add(entity);
    return entity;
  }

  public T findOne(String id){
    return this.elements.stream().filter(el -> el.equals(id)).findFirst().get();
  }


}
```


### `CategoryRepository`

```java
package springfive.cms.domain.repository;

import org.springframework.stereotype.Service;
import springfive.cms.domain.models.Category;

/**
 * @author claudioed on 29/10/17. Project cms
 */
@Service
public class CategoryRepository extends AbstractRepository<Category> {
}
```

### `UserRepository`

```java
package springfive.cms.domain.repository;

import org.springframework.stereotype.Service;
import springfive.cms.domain.models.User;

@Service
public class UserRepository extends AbstractRepository<User>{}
```

![image](https://user-images.githubusercontent.com/23094588/126910801-0174452e-8cb3-4485-824c-5bb9e6a4c7f3.png)

## Agregar capa de servicio

Ahora, tenemos listo el esqueleto para la capa REST, y en esta sección, comenzaremos a crear una capa de servicio para nuestra aplicación. Mostraremos cómo funciona la inyección de dependencia bajo el capó, aprenderemos las anotaciones de estereotipos en Spring Framework y también comenzaremos a pensar en nuestro almacenamiento de persistencia, que se presentará en la siguiente sección.

### Cambios en el modelo

Necesitamos hacer algunos cambios en nuestro modelo, específicamente en la clase **`News`**. En nuestras reglas comerciales, debemos mantener nuestra información segura, luego debemos revisar todas las noticias. Agregaremos algunos métodos para agregar una nueva revisión realizada por un usuario, y también agregaremos un método para verificar si la noticia fue revisada por todos los revisores obligatorios.

#### Agregar una nueva reseña

Para esta función, necesitamos crear un método en nuestra clase **`News`**, el método devolverá una **`Review`** y debería verse así:

```java
public Review review(String userId,String status){
  final Review review = new Review(userId, status);
  this.reviewers.add(review);
  return review;
}
```

No es necesario que verifiquemos si el usuario, que realiza la acción de revisión, es un revisor obligatorio.

#### Manteniendo las noticias seguras

Además, debemos verificar si la noticia está completamente revisada por todos los revisores obligatorios. Es bastante simple, estamos usando Java 8 y proporciona la increíble interfaz Stream, que hace que las interacciones de las colecciones sean más fáciles que antes. Hagámoslo:

```java
public Boolean revised() {
  return this.mandatoryReviewers.stream().allMatch(reviewer -> this.reviewers.stream()
      .anyMatch(review -> reviewer.id.equals(review.userId) && "approved".equals(review.status)));
}
```

Gracias, Java 8, lo agradecemos.

#### Antes de comenzar la capa de servicio

Nuestra aplicación debe tener un almacenamiento de persistencia donde se puedan cargar nuestros registros, incluso si la aplicación deja de funcionar. Crearemos la implementación falsa para nuestros repositorios. En el Capítulo 3, *Persistence with Spring Data and Reactive Fashion*, presentaremos los proyectos de **Spring Data** que ayudan a los desarrolladores a crear repositorios asombrosos con un DSL fantástico. Por ahora, crearemos algunos Spring beans para almacenar nuestros elementos en la memoria, hagámoslo.

### `CategoryService`

Comencemos con nuestro servicio más simple, la clase **`CategoryService`**, los comportamientos que se esperan de esta clase son operaciones CRUD. Entonces, necesitamos una representación de nuestro almacenamiento de persistencia o implementación de repositorio, por ahora, estamos usando el almacenamiento efímero y **`ArrayList`** con nuestras categorías. En el próximo capítulo, agregaremos la persistencia real para nuestra aplicación CMS.

Creemos nuestro primer servicio Spring. La implementación se encuentra en el siguiente fragmento:

```java
package springfive.cms.domain.service;

import java.util.List;
import org.springframework.stereotype.Service;
import springfive.cms.domain.models.Category;
import springfive.cms.domain.repository.CategoryRepository;

@Service
public class CategoryService {

  private final CategoryRepository categoryRepository;

  public CategoryService(CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  public Category update(Category category){
    return this.categoryRepository.save(category);
  }

  public Category create(Category category){
    return this.categoryRepository.save(category);
  }

  public void delete(String id){
    final Category category = this.categoryRepository.findOne(id);
    this.categoryRepository.delete(category);
  }

  public List<Category> findAll(){
    return this.categoryRepository.findAll();
  }

  public Category findOne(String id){
    return this.categoryRepository.findOne(id);
  }

}
```

Hay algunas cosas nuevas aquí. El contenedor Spring detectará y creará una instancia de esta clase porque tiene una anotación **`@Service`**. Como podemos ver, no hay nada especial en esa clase. No necesariamente extiende ninguna clase ni implementa una interfaz. Recibimos el **`CategoryRepository`** en un constructor, esta clase será proporcionada por el contenedor Spring porque le indicamos al contenedor que produzca esto, pero en Spring 5 ya no es necesario usar **`@Autowired`** en el constructor. Funciona porque teníamos el único constructor en esa clase y Spring lo detectará. Además, tenemos un par de métodos que representan los comportamientos CRUD y es simple de entender.

### `UserService`

La clase **`UserService`** es bastante similar a la **`CategoryService`**, pero las reglas son sobre la entidad **`User`**, para esta entidad no tenemos nada especial. Tenemos la anotación **`@Service`** y también recibimos el constructor **`UserRepository`**. Es bastante simple y fácil de entender. Mostraremos la implementación de **`UserService`**, y debe ser así:

```java
package springfive.cms.domain.service;

import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import springfive.cms.domain.models.User;
import springfive.cms.domain.repository.UserRepository;
import springfive.cms.domain.vo.UserRequest;

@Service
public class UserService {

  private final UserRepository userRepository;

  public UserService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  public User update(String id,UserRequest userRequest){
    final User user = this.userRepository.findOne(id);
    user.setIdentity(userRequest.getIdentity());
    user.setName(userRequest.getName());
    user.setRole(userRequest.getRole());
    return this.userRepository.save(user);
  }

  public User create(UserRequest userRequest){
    User user = new User();
    user.setId(UUID.randomUUID().toString());
    user.setIdentity(userRequest.getIdentity());
    user.setName(userRequest.getName());
    user.setRole(userRequest.getRole());
    return this.userRepository.save(user);
  }

  public void delete(String id){
    final User user = this.userRepository.findOne(id);
    this.userRepository.delete(user);
  }

  public List<User> findAll(){
    return this.userRepository.findAll();
  }

  public User findOne(String id){
    return this.userRepository.findOne(id);
  }

}
```

Preste atención a la declaración de clase con la anotación **`@Service`**. Esta es una implementación muy común en el ecosistema Spring. Además, podemos encontrar anotaciones **`@Component`**, **`@Repository`**. **`@Service`** y **`@Component`** son comunes para la capa de servicio y no hay diferencia en los comportamientos. El **`**@Repository`** cambia un poco los comportamientos porque los frameworks traducirán algunas excepciones en la capa de acceso a datos.


### `NewsService`

Se trata de un interesante servicio que se encargará de gestionar el estado de nuestras novedades. Interactuará como un *pegamento* para llamar a los modelos de dominio, en este caso, la entidad **`News`**. El servicio es bastante similar a los demás. Recibimos la clase **`NewsRepository`**, una dependencia y mantuvimos el repositorio para mantener los estados, hagámoslo.

La anotación **`@Service`** vuelve a estar presente. Esto es bastante estándar para las aplicaciones Spring. Además, podemos cambiar a la anotación **`@Component`**, pero no hace ninguna diferencia para nuestra aplicación.

```java
package springfive.cms.domain.service;

/**
 * @author claudioed on 29/10/17. Project cms
 */
public class NewsService {

}
```

![image](https://user-images.githubusercontent.com/23094588/126910970-beffcf4d-7684-41fd-aa17-d4e0a03f01f7.png)


## Configuración de Swagger para nuestras API

Swagger es la herramienta de facto para las API web de documentos, y la herramienta permite a los desarrolladores modelar las API, crear una forma interactiva de jugar con las API y también proporciona una manera fácil de generar la implementación del cliente en una amplia gama de idiomas.

La documentación de la API es una forma excelente de hacer que los desarrolladores utilicen nuestras API.

### Agregar dependencias a `pom.xml`

Antes de comenzar la configuración, debemos agregar las dependencias requeridas. Estas dependencias incluyeron **Spring Fox** en nuestro proyecto y ofrecieron muchas anotaciones para configurar Swagger correctamente. Agreguemos estas dependencias.

Las nuevas dependencias están en el archivo `pom.xml`:


```xml
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
```

La primera dependencia es el núcleo de Swagger con anotaciones y tipos de cosas relacionadas. La dependencia de la interfaz de usuario de **Spring Fox Swagger UI**  proporciona una interfaz rica en HTML que permite a los desarrolladores interactuar con las API.

### Configurando Swagger

Se agregan las dependencias, ahora podemos configurar la infraestructura para Swagger. La configuración es bastante sencilla. Crearemos una clase con **`@Configuration`** para producir la configuración Swagger para el contenedor Spring. Vamos a hacerlo.

Eche un vistazo a la siguiente configuración de Swagger:

```java
package springfive.cms.infra.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfiguration {

  @Bean
  public Docket documentation() {
    return new Docket(DocumentationType.SWAGGER_2)
        .select()
        .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
        .paths(PathSelectors.any())
        .build(); 
  }

}
```

**`@Configuration`** indica a Spring que genere una definición de bean para Swagger. La anotación, **`@EnableSwagger2`** agrega soporte para Swagger. **`@EnableSwagger2`** debe ir acompañado de **`@Configuration`**, es obligatorio.

La clase **`Docket`** es un constructor para crear una definición de API y proporciona valores predeterminados sensibles y métodos convenientes para la configuración de **Spring Swagger MVC Framework**.

La invocación del método **`.apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))`** indica al framework que maneje las clases anotadas con **`@RestController`**.

Existen muchos métodos para personalizar la documentación de la API, por ejemplo, existe un método para agregar encabezados de autenticación.

Esa es la configuración de Swagger, en la siguiente sección crearemos una primera API documentada.

### Primera API documentada

Comenzaremos con la clase **`CategoryResource`**, porque es fácil de entender y debemos centrarnos en la tecnología. Agregaremos un par de anotaciones y la magia sucederá, hagamos magia.

La clase **`CategoryResource`** debería verse así:

```java
package springfive.cms.domain.resources;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import java.util.Arrays;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import springfive.cms.domain.models.Category;
import springfive.cms.domain.vo.CategoryRequest;

@RestController
@RequestMapping("/api/category")
@Api(tags = "category", description = "Category API")
public class CategoryResource {

  @GetMapping(value = "/{id}")
  @ApiOperation(value = "Find category",notes = "Find the Category by ID")
  @ApiResponses(value = {
      @ApiResponse(code = 200,message = "Category found"),
      @ApiResponse(code = 404,message = "Category not found"),
  })
  public ResponseEntity<Category> findOne(@PathVariable("id") String id){
    return ResponseEntity.ok(new Category());
  }

  @GetMapping
  @ApiOperation(value = "List categories",notes = "List all categories")
  @ApiResponses(value = {
      @ApiResponse(code = 200,message = "Categories found"),
      @ApiResponse(code = 404,message = "Category not found")
  })
  public ResponseEntity<List<Category>> findAll(){
    return ResponseEntity.ok(Arrays.asList(new Category(),new Category()));
  }

  @PostMapping
  @ApiOperation(value = "Create category",notes = "It permits to create a new category")
  @ApiResponses(value = {
      @ApiResponse(code = 201,message = "Category created successfully"),
      @ApiResponse(code = 400,message = "Invalid request")
  })
  public ResponseEntity<Category> newCategory(CategoryRequest category){
    return new ResponseEntity<>(new Category(), HttpStatus.CREATED);
  }

  @DeleteMapping("/{id}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  @ApiOperation(value = "Remove category",notes = "It permits to remove a category")
  @ApiResponses(value = {
      @ApiResponse(code = 200,message = "Category removed successfully"),
      @ApiResponse(code = 404,message = "Category not found")
  })
  public void removeCategory(@PathVariable("id") String id){
  }

  @PutMapping("/{id}")
  @ResponseStatus(HttpStatus.NO_CONTENT)
  @ApiOperation(value = "Update category",notes = "It permits to update a category")
  @ApiResponses(value = {
      @ApiResponse(code = 200,message = "Category update successfully"),
      @ApiResponse(code = 404,message = "Category not found"),
      @ApiResponse(code = 400,message = "Invalid request")
  })
  public ResponseEntity<Category> updateCategory(@PathVariable("id") String id,CategoryRequest category){
    return new ResponseEntity<>(new Category(), HttpStatus.OK);
  }

}
```

Hay muchas anotaciones nuevas que comprender. **`@Api`** es la anotación raíz que configura esta clase como un recurso Swagger. Hay muchas configuraciones, pero usaremos las etiquetas y la descripción, ya que son suficientes.

**`@ApiOperation`** describe una operación en nuestra API, en general contra la ruta solicitada. El atributo de valor se considera como el campo de resumen en Swagger, es un resumen de la operación y las notas son una descripción de una operación (contenido más detallado).

El último es **`**@ApiResponse`**, que permite a los desarrolladores describir las respuestas de una operación. Por lo general, quieren configurar los códigos de estado y el mensaje para describir el resultado de una operación.

> ℹ️ *Antes de ejecutar la aplicación, debemos compilar el código fuente. Se puede hacer usando la línea de comando de Maven usando **`mvn clean install`**, o vía IDE usando la aplicación Ejecutar.

Ahora que hemos configurado la integración de Swagger, podemos consultar la documentación de la API en el navegador web. Para hacerlo, debemos navegar a http://localhost:8080/swagger-ui.html y se debe mostrar esta página:

![image](https://user-images.githubusercontent.com/23094588/126908435-842a4db6-b941-4c86-ab91-2b7b6ac2b04a.png)

Podemos ver los endpoints de las API configurados en nuestra aplicación CMS. Ahora, echaremos un vistazo a la categoría que hemos configurado previamente, pinchamos en el enlace Show/Hide. La salida debe ser:

![image](https://user-images.githubusercontent.com/23094588/126908467-4b1fcd42-31f8-4166-933a-07f4eec17c8d.png)

Como podemos ver, hay cinco operaciones en nuestra Category API, la operación tiene una ruta y un resumen para ayudar a comprender el propósito. Podemos hacer clic en la operación solicitada y ver información detallada sobre la operación. Hagámoslo, haga clic en Listar categorías para ver la documentación detallada. La página se ve así:

![image](https://user-images.githubusercontent.com/23094588/126908517-04e369c8-a013-4b74-b0c6-53bffd6cc85d.png)

Trabajo destacado. Ahora tenemos una API increíble con excelente documentación. Bien hecho.

Sigamos creando nuestra aplicación CMS.








