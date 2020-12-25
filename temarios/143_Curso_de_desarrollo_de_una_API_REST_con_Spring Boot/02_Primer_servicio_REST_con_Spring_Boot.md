# 2. Primer servicio REST con Spring Boot 76m

* 08 Mi primer servicio REST 9:33 
* 09 Puesta en marcha de la aplicación 7:48 
* 10 Estructura de las rutas 15:31 
* 11 Clases y anotaciones de Spring 14:25 
* 12 Uso del patrón Data Transfer Object (DTO) 11:25 
* 13 Implementando DTO con ModelMapper 17:58 
* Contenido adicional 6

# 08 Mi primer servicio REST 9:33 

[PDF Mi_primer_servicio_REST.pdf](pdfs/07_Mi_primer_servicio_REST.pdf)

## Resumen Profesor

### Ejemplo

El ejemplo que se utiliza en esta lección está accesible desde la web de Spring en la siguiente url: https://spring.io/guides/gs/rest-service/.

También se puede descargar desde dentro del propio IDE, a través de *New > Import Spring Getting Started Content* y seleccionando **Rest Service**.

## Transcripción

<img src="images/08-01.png">

Vamos a comenzar el segundo bloque y vamos a crear nuestro primera API REST, nuestro primer servicio API REST.

<img src="images/08-02.png">

Para ello nos vamos a ir a la fuente, nos vamos a ir directamente a [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/) o directamente desde nuestro Spring Tool Suite. 

Vamos a ver un ejemplo muy básico que vamos a ir desgranando poco a poco, de hecho vamos a traernos el código completo y lo vamos a ir analizando para aprender los distintos elementos que lo componen y en las siguientes lecciones, poder crearlo por nuestra cuenta.

Ya digo desde esta web URL https://spring.io/guides/gs/rest-service/ que podemos visitar. 

Si queréis lo podemos buscar en https://spring.io, ir a las guias que se encuentran en el footer y el primero que nos aparece **Building a RESTful Web Service** (Construir un RESTful Web Service), sera el que vayamos trabajando.

### :computer: `gs-rest-service-complete` Ejemplo de Construir un RESTful Web Service

Para traernos el código desde Eclipse o Spring Tool Suite lo podríamos hacer así, nos venimos a ***File - New - Import Spring Getting Started Content***

![01-rfws](images/01-rfws.png)

y lo podríamos buscar aquí sería si buscamos `Rest Service`.

![02-rfws](images/02-rfws.png)

y nos traemos solamente el código completo 

![03-rfws](images/03-rfws.png)

le damos a Finish, nos importaría todo el proyecto `gs-rest-service-complete`, nos abre una ventana incluso con el tutorial.

![04-rfws](images/04-rfws.png)

Tendríamos el código fuente disponible.

![05-rfws](images/05-rfws.png)

<img src="images/08-03.png">

Vamos ir desgranandolo poquito a poco. Primero nos vamos a situar, ¿Qué es lo que vamos a hacer? vamos a implementar una aplicación de servidor que va a aceptar peticiones GET en una determinada ruta `/greeting` y que nos va a devolver un JSON como el de la transparencia. Un mensaje de respuesta que vas a tener un `id` que va a ser de tipo numérico un long y un mensaje en una cadena de caracteres, petición-respuesta como hemos ido viendo y en una determinada URL devolveremos un JSON. 

<img src="images/08-04.png">

Si además le proporcionamos como parámetro opcional `name` este `/greeting` de manera que podríamos tener una URL como está `/greeting?name=User` cambiaremos en lugar de decir ***hola mundo*** haremos un ***hola usuario***, de manera que lo podemos cambiar.

<img src="images/08-05.png">

La interacción cómo podemos ver va a ser hacer peticiones GET a `/greeting` y como respuesta deberíamos obtener un código 200 OK y en el cuerpo de la respuesta deberíamos tener un JSON como el que hemos visto antes, si pasamos `/greeting?name=User` pues obtendríamos el hello con el name en partícular. El objeto además llevará un ID que veremos cómo se va incrementándo si hacemos más de una petición. 

<img src="images/08-06.png">

Para gestionar este modelo de datos vamos a tener una clase modelo `Greeting` que ya incluso la podemos ver por aquí:

*`Greeting`*

```java
package com.example.restservice;

public class Greeting {

   private final long id;
   private final String content;

   public Greeting(long id, String content) {
      this.id = id;
      this.content = content;
   }

   public long getId() {
      return id;
   }

   public String getContent() {
      return content;
   }
}
```

Y que incluye solamente dos datos que sería un `id` y `content` de tipo String y además tendríamos un controlador `GreetingController`:

*`GreetingController`*

```java
package com.example.restservice;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

   private static final String template = "Hello, %s!";
   private final AtomicLong counter = new AtomicLong();

   @GetMapping("/greeting")
   public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
      return new Greeting(counter.incrementAndGet(), String.format(template, name));
   }
}
```

Que para aquellos que tenga ya algunos conocimientos de Spring MVC llamara la atención que en lugar de ser con el `@Controller`, esto ya lo comentamos también antes, sera con `@RestController` esto es la combinación de `@Controller` y `@ResponseBody` tenemos anotado el método `greeting` con `@GetMapping` hay otra versión con `@RequestMapping("/greeting")`, yo que tengo SonarLint  me hace algunos análisis del código que voy poniendo y entonces nos invita que pongamos el código correcto por lo que `@RequestMapping` debería quedar así: `@RequestMapping(value = "/greeting", method = RequestMethod.GET)`, definitivamente la anotación `@GetMapping("/greeting")` es más comoda sea como fuere tendríamos que aceptar peticiones GET en una determinada URL, que hara que se invoque este método. 

Además podemos ver como el método `greeting(@RequestParam(value = "name", defaultValue = "World") String name)` recibe un parámetro que será el parámetro `name` lo inyectamos con `@RequestParam` recogera de la parte `query` de la URL algo llamado `value = "name"` y lo inyectará en `name`, si no lo encuentra inyectara un valor por defecto `defaultValue = "World"` para poderlo utilizar en el método.  

Como deciamos, ¿Cómo se devuelve JSON? si el método lo que retorna es un objeto de tipo `Greeting`:

`return new Greeting(counter.incrementAndGet(), String.format(template, name));`

<img src="images/08-07.png">

Bueno podemos verlo por aquí.

<img src="images/08-08.png">

`@RestController` como hemos dicho es la combinación de `@Controller` + `@ResponseBody` y `@ResponseBody` devuelve en el body lo devuelto por el método como respuesta, si recordáis el formato de los mensajes de respuesta como un cajón que tenía las cabeceras y el cuerpo, pues dentro del cuerpo lo que se hace es poner lo que nosotros devolvamos, lo que pasa, es que pasa antes por el filtro de un `HTTPMessageConverter` que lo que hace es transformarlo de un objeto Java a un objeto de tipo JSON, a una cadena de tipo JSON.

### Probando la Aplicación

Vamos a probar a ponerlo en ejecución la aplicación.

![06-rfws](images/06-rfws.png)

Vemos como nuestra aplicación se ha lanzado.

![07-rfws](images/07-rfws.png)

Ya estaría disponible en el puerto 8080 y en primera instancia podríamos comprobarlo desde el propio navegador con el URL `http://localhost:8080/greeting` y aquí tendríamos nuestro `Hello, World!`.

![08-rfws](images/08-rfws.png)

Cómo podemos ver la creación de un servicio es bastante sencillo, solo necesitaríamos tener una clase controladora anotada con `@RestController`, en la que tengamos algunos métodos anotado bien con `@RequestMapping` o `@GetMapping` y el método correspondiente cómo podría ser con `@GetMapping`, `@PostMapping`, `@PutMapping` o `@DeleteMapping` y en el cual pues podamos atender peticiones que recibirán o no alguna serie de argumentos y en la que podamos devolver valores que dentro de este método estamos devolviendo una clase Java que serán transformadas a través de un `HTTPMessageConverter`.

Aunque tengamos solamente el navegador y le damos a inspeccionar Network y recargamos podríamos ver que ha sucedido por aquí detrás y si pinchamos en greeting

![09-rfws](images/09-rfws.png)
![10-rfws](images/10-rfws.png)
![11-rfws](images/11-rfws.png)
![12-rfws](images/12-rfws.png)
![13-rfws](images/13-rfws.png)
![14-rfws](images/14-rfws.png)

Podemos ver como el navegador por detrás con esa petición GET ha enviado alguna serie de elementos y ha recibido la respuesta, tendríamos incluso los encabezados de la respuesta así como de la petición, como lo ha ido gestionando el propio navegador para que veamos que todo eso va sucediendo de verdad. Todas las anotaciones que hemos visto antes se van utilizando tanto en peticiones como en respuestas, el tipo de contenido, la fecha, el código de estado 200 y lo ponen en verde como OK, lo que nosotros hemos enviado como parte de la petición para que veamos que esto ha sucedido conforme a nosotros lo hemos programado.

Podemos probar mandando un nombre con el URL `http://localhost:8080/greeting?name=Pedro` obtenemos.

![15-rfws](images/15-rfws.png)
![16-rfws](images/16-rfws.png)
![17-rfws](images/17-rfws.png)
![18-rfws](images/18-rfws.png)
![19-rfws](images/19-rfws.png)
![20-rfws](images/20-rfws.png)

Hasta aquí nuestro primer servicio, vamos a ver ahora como con Postman como cliente en el lugar del propio navegador poder interactuar con nuestro API REST.

### :computer: Código Completo `gs-rest-service-complete`

![21-rfws](images/21-rfws.png)

*`Pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.3.2.RELEASE</version>
      <relativePath/> <!-- lookup parent from repository -->
   </parent>
   <groupId>com.example</groupId>
   <artifactId>rest-service</artifactId>
   <version>0.0.1-SNAPSHOT</version>
   <name>rest-service</name>
   <description>Demo project for Spring Boot</description>

   <properties>
      <java.version>1.8</java.version>
   </properties>

   <dependencies>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
      </dependency>

      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-test</artifactId>
         <scope>test</scope>
         <exclusions>
            <exclusion>
               <groupId>org.junit.vintage</groupId>
               <artifactId>junit-vintage-engine</artifactId>
            </exclusion>
         </exclusions>
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

*`Greeting`*

```java
package com.example.restservice;

public class Greeting {

   private final long id;
   private final String content;

   public Greeting(long id, String content) {
      this.id = id;
      this.content = content;
   }

   public long getId() {
      return id;
   }

   public String getContent() {
      return content;
   }
}
```

*`GreetingController`*

```java
package com.example.restservice;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

   private static final String template = "Hello, %s!";
   private final AtomicLong counter = new AtomicLong();

   //@RequestMapping(value = "/greeting", method = RequestMethod.GET)
   @GetMapping("/greeting")
   public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
      return new Greeting(counter.incrementAndGet(), String.format(template, name));
   }
}
```

*`RestServiceApplication`*

```java
package com.example.restservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RestServiceApplication {

   public static void main(String[] args) {
      SpringApplication.run(RestServiceApplication.class, args);
   }

}
```

# 09 Puesta en marcha de la aplicación 7:48 

[PDF Puesta_en_marcha_de_la_aplicación.pdf](pdfs/08_Puesta_en_marcha_de_la_aplicación.pdf)

## Resumen Profesor

### Ejecución de la aplicación

Para ejecutar la aplicación desde el terminal, debemos ejecutar desde el directorio raíz de la misma:

```sh
mvn clean
mvn install
mvn spring-boot:run
```

## Transcripción

<img src="images/09-01.png">

Ya que hemos hecho nuestra primera API REST con Spring Boot es sencilla pero es completa, vamos a poner en marcha la aplicación a través de las diferentes posibilidades que tenemos, aunque antes ya lo hemos hecho vamos a repasar esta parte, vamos a ver que tenemos diferente alternativa y vamos a consumir nuestra API desde Postman para que lo podamos ver convenientemente.

Para ejecutar nuestra aplicación tenemos dos mecanismos, hacerlo desde el propio IDE, ya hemos visto que se puede hacer sobre la aplicación, botón derecho, ejecutar como Spring Boot App y esto nos permitiría ejecutar aplicación perfectamente bien.

La ventaja de usar el IDE es que tenemos varios botones que nos permiten hacer varias cosas como:

* **Botón de parada** 
* **Botón de relanzamiento** de la aplicación
* **Botón Relauch** que resulta súper cómodo cuando estamos trabajando y si no estamos utilizando **DevTools** que nos relanza automáticamente la aplicación cuando hacemos cambios en el código, con este botón podemos parar la aplicación y volverla a lanzar.

<img src="images/09-13.png">

<img src="images/09-02.png">

También podemos hacerlo desde una terminal y usando Maven para ejecutar la aplicación usando los siguientes comandos:

```sh
$ mvn clean
$ mvn install
$ mvn spring-boot:run
```

Tendríamos que estar en el directorio raíz de la aplicación y tener instalado Maven. Con `mvn clean` hariamos alguna limpieza con cosas que no esten bien. 

![22-rfws](images/22-rfws.png)

 y con `mvn install` para realizar las descargas de las dependencias y todo lo que necesite. 

![23-rfws](images/23-rfws.png)

![24-rfws](images/24-rfws.png)

Y con `mvn spring-boot:run` que nos permite ejecutar la aplicación sin necesidad de estar dentro del IDE, **con el IDE apagado podríamos hacer esta puesta en marcha de la propia aplicación**.

![25-rfws](images/25-rfws.png)

Ya tenemos arrancada nuestra aplicación cuando deseemos detenerla bastaría pulsar Ctrl+C, sería más que suficiente.

Bueno ya que tenemos lanzada la aplicación desde la terminal con Maven vamos a consuimir nuestra API desde Postman.

Postman es muy cómodo nos permite en un sistema de pestañas poder consumir desde nuestra API REST, tendríamos que hacer algún tipo de petición poniendo el verbo, la URL y la ejecutamos.

<img src="images/09-03.png">

Y nos devolvería el resultado.

![26-rfws](images/26-rfws.png)

Tenemos el botón + para poder crear nuevas peticiones añadiendo nuevas pestaña.

![27-rfws](images/27-rfws.png)

Al ingresar el URL debemos presionar el botón Send para hacer la petición al Servidor.

<img src="images/09-06.png">

Se nos muestra la respuesta.

<img src="images/09-08.png">

La respuesta la podemos ver en diferentes formatos JSON, XML, HTML, Text y Auto  si el formato que no hubiera llegado no lo hubiera reconocido automáticamente podemos cambiarlo en el desplegable. 

![28-rfws](images/28-rfws.png)

Ademas tenemos una vista Pretty que pinta el JSON con formato, Raw lo muestra en crudo y algunas vistas más como Preview y Visualice pero la que se usa más es Pretty. 

![29-rfws](images/29-rfws.png)
![30-rfws](images/30-rfws.png)
![31-rfws](images/31-rfws.png)
![32-rfws](images/32-rfws.png)

Y a nivel de respuesta podemos ver el código de estado, tiempo que tarde en ejecutase, tamaño de respuesta. 

<img src="images/09-09.png">

También podemos salvar la respuesta en un fichero.

![33-rfws](images/33-rfws.png)
![34-rfws](images/34-rfws.png)
![35-rfws](images/35-rfws.png)

Tenemos una sección dónde podemos pasar diferentes parámetros a nuestra petición.

<img src="images/09-07.png">

Vamos a cambiar el parámetro `name` que lanzamos.

![36-rfws](images/36-rfws.png)

Si no queremos tener que escribir el parámetro directamente en la URL lo podríamos escribir en la sección `Query Params` indicando una Key/Value, en este caso name/Pedro.

Vemos la respuesta donde saludamos a Pedro.

Las pestañas las podemos almacenar en la raíz o incluso si queremos gestionarlas en colecciones que se muestran a la izquierda. Al presionar Save sobre una pestaña se nos muestra la siguiente ventana:

<img src="images/09-16.png">

Donde le podemos dar un nombre a la petición de primeras pone la URL de la petición, le podemos añadir una descripción que incluso soporta Markdown, e indicarle en que colección la debe almacenar.

<img src="images/09-18.png">

<img src="images/09-19.png">

Y ya del lado izquierdo tenemos nuestra colección `143-API-REST-Con-Spring` con nuestras dos peticiones.

<img src="images/09-20.png">

Con esto ya podemos recuperarlas y ejecutarlas cuando volvamos a acceder a Postman sin necesidad de volver a crearlas y así si estamos desarrollando durante varios días, varias semana una serie de peticiones sobre una misma API la podemos dejar guardada y documentada de hecho estas colecciones también si queréis se pueden exportar se pueden compartir para que se la podéis pasar a gente si fuese necesario incluso llevarla desde un equipo a otro.

<img src="images/09-21.png">

![38-rfws](images/38-rfws.png)
![38-rfws](images/39-rfws.png)

También podemos trabajar con diferentes métodos, tenemos un desplegable para seleccionarlos.

<img src="images/09-05.png">

Para que en lugar de hacer peticiones **`GET`** poder hacer peticiones **`POST`**, **`PUT`**, **`PATCH`**, **`DELETE`**, etc. un montón de peticiones.

![37-rfws](images/37-rfws.png)

# 10 Estructura de las rutas 15:31 

[PDF Estructura_de_las_rutas.pdf](pdfs/09_Estructura_de_las_rutas.pdf)

## Resumen Profesor

### Mapeo de verbos HTTP a operaciones CRUD

Verbo HTTP | Anotación Spring | Operación CRUD
-----------|------------------|---------------
GET | `@GetMapping` | Read
POST | `@PostMapping` | Create
PUT | `@PutMapping` | Update
DELETE | `@DeleteMapping` | Delete

### Lombok en controladores y servicios

Desde la versión 5 de Spring, podemos ahorranos el uso de la anotación `@Autowired` para realizar la inyección automática entre beans. De hecho, la inyección por constructor sería a día de hoy la más recomendable.

Si unimos esto último, con el uso de Lombok, podemos *ahorrarnos* escribir los constructores de nuestras clases servicio, controladores, etc… si en ellos solo vamos a hacer una asignación o inicialización de los atributos en los cuales queremos inyectar la dependencia. Podemos aprovechar la potencia de lombok, a través de su anotación `@RequiredArgsConstructor`, para que sea quién se encargue de generar dicho constructor, y después Spring lo utilice para realizar la inyección automática.

```java
@RestController
@RequiredArgsConstructor
public class ProductoController {

    private final ProductoRepositorio productoRepositorio;

    // Resto del código

}
```

## Transcripción

<img src="images/10-01.png">

Vamos a seguir con nuestro curso en el que estamos aprendiendo a desarrollar una API con Sprint Boot, a partir de esta lección vamos a desarrollar una API casi desde cero, os dejo un pequeño código base para no pararnos en cosas que ya hemos aprendido antes, vamos a partir de una estructura de un controlador que vamos a explicar y lo vamos a ir completando poco a poco.

<img src="images/10-02.png">

El ejemplo va a ser una especie de API de productos, vamos a gestionar una serie de productos simples, como campo van a tener:

* Un ID
* El nombre del producto 
* El precio del producto

Vamos a crear también un repositorio y vamos a insertar unos datos de ejemplo desde `data.sql`, este código de base ya lo vas a tener en el repositorio del curso para que no tengas que pararnos a crear la clase Modelo, el repositorio, para que no tengáis que hacer la creación de datos de ejemplo, cosas que si habéis visitado los otros cursos como por ejemplo el de Spring Boot y Spring Web se explica con mayor detenimiento, no es cuestión de que nos parecemos en la capa de acceso a datos en esta parte, sino que nos vamos a centrar sobre todo en el controlador y en la parte más REST.

<img src="images/10-03.png">

Vamos a ver cómo mapear las rutas de nuestro controlador con las diferentes operaciones CRUD, en el fondo vamos hacer un CRUD de productos y entonces necesitamos para cada una de las operaciones CRUD hacer una determinada ruta en el controlador, esta estructura veréis que va a ser muy común si lo que necesitáis es generar CRUD y de hecho si trabajáis alguna vez con **Spring Data REST** veréis que no dista de la que genera automáticamente.

Dentro de CRUD la operación `Read` la de obtener datos la haremos a través de peticiones de tipo `GET`, es decir métodos del controlador que irán anotados con `@GetMapping` y como nosotros vamos a trabajar con productos la ruta de obtener todos los productos será una petición `@GetMapping("/producto")` lo vamos a poner en singular, tampoco sería demasiado dramático si lo pusieramos en plural, si queremos obtener un producto en particular lo haremos con su `id` y entonces será la ruta `@GetMapping("/producto/{id}")` el producto 1, el 2 el producto 114, ambas peticiones de tipo `GET`.

Para crear un producto lo que haremos será una petición de tipo POST anotada con `@PostMapping` a la propia ruta `/producto` es decir `@PostMapping("/producto")`.

<img src="images/10-04.png">

Para actualizar la petición de tipo UPDATE será con `Put` con una anotación `@PutMapping` y está usualmente aunque el `id` vaya dentro del objeto que le estamos pasando es muy habitual que se lo proporcionemos dentro de la ruta y entonces así lo vamos a hacer con `@PutMapping("/producto/{id}")` 

La estructura sería la misma para la petición de borrado sería con la anotación `@DeleteMapping`, completa tendríamos `@DeleteMapping("/producto/{id}")`.

<img src="images/10-05.png">

Algunas notaciones que vamos a usar para que no nos suenen raro y que las reconozcamos, sería la anotación `@RequestBody` que nos va a permitir inyectar el cuerpo de la petición en un objeto, es decir nos enviara una petición, aquello trae datos y hemos visto que cuando nosotros en una petición GET devolvemos algo en el cuerpo el `HTTPMessageConverter` transforma nuestro objeto Java en un JSON, pero ahora lo necesitamos a la hora de recibirlo, vamos a recibir una petición en la cual se va a enviar un JSON y vamos a necesitar sacar ese JSON como un objeto Java para poder interactuar con nuestro repositorio y almacenarlo en la base de datos.

### :computer: `143-02-EstructuraRutas` Primer Ejemplo de un API REST de Productos

Hasta aquí ya nos podemos venir a nuestro código, vamos al proyecto base lo vamos a copiar y pegar del repositorio y le vamos a asignar el nombre `143-02-EstructuraRutas`.

**DUDA: COMO SE CREA EL PROYECTO DESDE CERO.**

![143-02-01](images/143-02-01.png)

Tenemos nuestro archivo `pom.xml`

*`pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.1.8.RELEASE</version>
      <relativePath/> <!-- lookup parent from repository -->
   </parent>
   <groupId>com.openwebinars.rest</groupId>
   <artifactId>143-02-EstructuraRutas</artifactId>
   <version>0.0.1-SNAPSHOT</version>
   <name>143-02-EstructuraRutas</name>
   <description>Ejemplo de métodos crud en un API REST</description>

   <properties>
      <java.version>1.8</java.version>
   </properties>

   <dependencies>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-data-jpa</artifactId>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
      </dependency>

      <dependency>
         <groupId>com.h2database</groupId>
         <artifactId>h2</artifactId>
         <scope>runtime</scope>
      </dependency>
      <dependency>
         <groupId>org.projectlombok</groupId>
         <artifactId>lombok</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-test</artifactId>
         <scope>test</scope>
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

**NOTA** ***Cuando importemos o copiemos un proyecto es importante cambiar los nombres en los tags `artifactId` y `name` para evitar problemas si importamos este proyecto en otro sitio.*** 

Tenemos una clase Modelo `Producto`.

*`Producto`*

```java
package com.openwebinars.rest.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
public class Producto {

   @Id @GeneratedValue
   private Long id;
	
   private String nombre;
	
   private float precio;
	
}
```

En esta clase `Producto` usamos Lombok lo cual la hace muy sencilla con una `id` y ya sabéis que **Spring Data JPA** nos permite tener estas anotación `@Id @GeneratedValue` y que tiene que tener `@Entity` para que sea una auténtica entidad, las demás anotaciones `@Data @NoArgsConstructor @AllArgsConstructor` son de Lombok. Vemos cómo tiene los atributos `id`, `nombre` y `precio`.

*`ProductoRepositorio`*

```java
package com.openwebinars.rest.modelo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepositorio extends JpaRepository<Producto, Long> {

}
```

El repositorio es sencillo no vamos a necesitar ninguna consulta rara para hacerlo, entiende a los repositorios de `JpaRepository`.

*`ProductoController`*

```java
package com.openwebinars.rest.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.openwebinars.rest.modelo.Producto;
import com.openwebinars.rest.modelo.ProductoRepositorio;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;

   /**
    * Obtenemos todos los productos
    * 
    * @return
    */
   @GetMapping("/producto")
   public List<Producto> obtenerTodos() {
      // Vamos a modificar este código
      return null;
   }

   /**
    * Obtenemos un producto en base a su ID
    * 
    * @param id
    * @return Null si no encuentra el producto
    */
   @GetMapping("/producto/{id}")
   public Producto obtenerUno(@PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }

   /**
    * Insertamos un nuevo producto
    * 
    * @param nuevo
    * @return producto insertado
    */
   @PostMapping("/producto")
   public Producto nuevoProducto(@RequestBody Producto nuevo) {
      // Vamos a modificar este código
      return null;
   }

   /**
    * 
    * @param editar
    * @param id
    * @return
    */
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }

   /**
    * Borra un producto del catálogo en base a su id
    * @param id
    * @return
    */
   @DeleteMapping("/producto/{id}")
   public Producto borrarProducto(@PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
}
```

Tendríamos el controlador del cual yo les doy el esqueleto que vamos a ver ahora y a partir de aquí vamos a ir programando.

Tendríamos el método `obtenerTodos()` anotado con `@GetMapping("/producto")`  para obtener todos los productos.

```java
   /**
    * Obtenemos todos los productos
    * 
    * @return
    */
   @GetMapping("/producto")
   public List<Producto> obtenerTodos() {
      // Vamos a modificar este código
      return null;
   }
```

que devolverá un listado de productos.

El método `obtenerUno(@PathVariable Long id)` anotado con `@GetMapping("/producto/{id}")` que devolvera un producto. 

```java
/**
    * Obtenemos un producto en base a su ID
    * 
    * @param id
    * @return Null si no encuentra el producto
    */
   @GetMapping("/producto/{id}")
   public Producto obtenerUno(@PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
```

El método `nuevoProducto(@RequestBody Producto nuevo)` anotado con `@PostMapping("/producto")` para insertar un nuevo producto que lo recoge con `@RequestBody Producto nuevo`

```java
 /**
    * Insertamos un nuevo producto
    * 
    * @param nuevo
    * @return producto insertado
    */
   @PostMapping("/producto")
   public Producto nuevoProducto(@RequestBody Producto nuevo) {
      // Vamos a modificar este código
      return null;
   }
```

El método `editarProducto(@RequestBody Producto editar, @PathVariable Long id)` para editar un producto anotado con `@PutMapping("/producto/{id}")`.

```java
   /**
    * 
    * @param editar
    * @param id
    * @return
    */
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
```

que también lo recoge con `@RequestBody Producto editar` y con `@PathVariable Long id` lo que vamos a hacer es inyectar el `{id}` del `@PutMapping` dentro del valor `id` del `@PathVariable`.


El método `borrarProducto(@PathVariable Long id)` para eliminar un producto anotado con `@DeleteMapping("/producto/{id}")`.

```java
   /**
    * Borra un producto del catálogo en base a su id
    * @param id
    * @return
    */
   @DeleteMapping("/producto/{id}")
   public Producto borrarProducto(@PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }

```

También usa `@PathVariable` para inyectar el valor de la ruta y tomarlo como parámetro.

Bueno pues por lo pronto lo que necesitamos aquí es obtener el repositorio que lo tenemos declarado con la línea `private final ProductoRepositorio productoRepositorio;` aque ahora iremos utilizando, fijarnos que no hemos utilizado la anotación `@Autowire` ni nada. Lombok nos permite también anotar con la anotación `@RequiredArgsConstructor` un controlador. Como el repositorio no se va a haber modificado, lo podemos declarar como final y directamente cuando se instancie el `Bean` se autoinyectaran las dependencias y lo hacemos de una manera limpia y utilizándo Lombok.

```java
@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;
   
   ....
   
```

También dentro de los recursos contamos con el archivo `data.sql` con el siguiente contenido.

```sql
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Juice - Orange, Concentrate', 91);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Beef - Ground, Extra Lean, Fresh', 87);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Cheese - Parmesan Grated', 39);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Cups 10oz Trans', 67);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Wine - Beringer Founders Estate', 27);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Bread - Wheat Baguette', 82);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Quail - Eggs, Fresh', 3);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Cheese - Mascarpone', 97);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Mace', 25);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Oil - Shortening - All - Purpose', 63);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Marjoram - Fresh', 60);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Turnip - White', 74);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Pork Salted Bellies', 38);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Longos - Greek Salad', 15);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Amaretto', 85);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Godiva White Chocolate', 97);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Tomatoes - Roma', 61);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Oven Mitt - 13 Inch', 1);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Vermouth - White, Cinzano', 72);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Club Soda - Schweppes, 355 Ml', 38);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Fenngreek Seed', 1);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Dill Weed - Dry', 72);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Pepper - Green', 56);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Bacardi Breezer - Tropical', 35);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Wine - Merlot Vina Carmen', 14);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Sauce - Black Current, Dry Mix', 9);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Crab - Soft Shell', 17);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Jameson Irish Whiskey', 19);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Muffin Chocolate Individual Wrap', 77);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Mussels - Frozen', 95);
```

Tenéis aquí una serie de productos de ejemplo que yo en generado, lo he sacado de un servicio que hay de Mocking de datos llamado [MOCKAROO](https://www.mockaroo.com/) que ha generado estas sentencias SQL para poder insertar esta serie de productos que tiene un `id` que se autogenera a través de una secuencia, un nombre y un precio.

Lo primero que vamos a hacer es modificar el método `obtenerTodos()`ya que actualmente nos devuelve `null`.

```java
   @GetMapping("/producto")
   public List<Producto> obtenerTodos() {
      // Vamos a modificar este código
      return null;
   }
```

Lo podemos hacer tan sencillo utilizando nuestro `productoRepositorio`

```java
   @GetMapping("/producto")
   public List<Producto> obtenerTodos() {
      return productoRepositorio.findAll();
   }
```

Con esto ya se devolverían todos los productos.

Para devolver un solo producto lo que podríamos hacer es cambiar el método `obtenerUno(@PathVariable Long id)`. 

```java
   @GetMapping("/producto/{id}")
   public Producto obtenerUno(@PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
```

Por esto, ya sabes que el `productoRepositorio` tiene una serie de métodos solo basta buscar el adecuado.

```java
   @GetMapping("/producto/{id}")
   public Producto obtenerUno(@PathVariable Long id) {
      return productoRepositorio.findById(id).orElse(null);
   }
```

Como `findById` devuelve un ***opcional*** y no nos vamos a poner a manejar los errores, sino lo encuentra usamos `orElse(null)` para mandar un nulo.

Con estas dos peticiones modificadas ya podemos probarlas con Postman e ir haciendo peticiones a estos URL.

![143-02-02](images/143-02-02.png)

![143-02-03](images/143-02-03.png)

Empezamos por hacer una petición a `http://localhost:8080/producto`.

![143-02-04](images/143-02-04.png)

En la cual obtenemos un código 200 OK y todos los productos que tenemos ahora mismo en la base de datos que son 30.

![143-02-05](images/143-02-05.png)

Si hacemos la petición para obtener un solo producto `http://localhost:8080/producto/3`.

![143-02-06](images/143-02-06.png)

Nos devuelve solamente el producto con el `id` indicado.

Si hacemos la petición de un producto que no existe `http://localhost:8080/producto/31`.

![143-02-07](images/143-02-07.png)

Es una situación que ahora mismo no estamos contemplando, devolvemos nulo pero todavía no lo estamos gestionando lo haremos más adelante.

Faltaría que implementaramos la petición para insertar un nuevo producto por lo que cambiamos el método `nuevoProducto(@RequestBody Producto nuevo)` 

```java
   @PostMapping("/producto")
   public Producto nuevoProducto(@RequestBody Producto nuevo) {
      // Vamos a modificar este código
      return null;
   }
```

Por 

```java
   @PostMapping("/producto")
   public Producto nuevoProducto(@RequestBody Producto nuevo) {
      return productoRepositorio.save(nuevo);
   }
```

Bastaría devolver lo que almacenemos aquí como nuevo, esto lo que hace es recoger `nuevo` a través del repositorio lo salva, lo devuelve con el `id` generado y todo lo demás y lo devolvemos directamente.

Vamos a relanzar la aplicación con el botón `Relaunch` y comprobar que funciona.

Tendríamos que hacer una petición a `http://localhost:8080/producto/` y tendríamos que usar el verbo POST, y para enviar datos en el cuerpo tenemos que irnos a ***Body - raw - JSON*** y mandar los datos de nuestro producto en formato JSON. El `id` se autogenera, necesitariamos mandar un nombre y precio de nuestro producto.

![143-02-08](images/143-02-08.png)

Al enviar la petición nos indica que se ha generado un nuevo Producto con un `id` 31 y vemos también algo que tendremos que gestionar después y es el código de respuesta en este caso nos a devuelto 200 OK que esta más asociado a obtener un recurso, el 101 esta más asociado a la creación de un nuevo recurso, veremos como hacerlo en siguientes lecciones. 

![143-02-09](images/143-02-09.png)

Nos faltaría el método `editarProducto(@RequestBody Producto editar, @PathVariable Long id)` para editar un producto.

```java
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
```

Tendríamos diferentes formas de hacerlo, lo haremos de una manera muy sencilla 

```java
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
      if(productoRepositorio.existsById(id)) {
         editar.setId(id);
	 return productoRepositorio.save(editar);
      }else {
	 return null;
      }
   }
```

Si el producto existe lo que hacemos es asegurarnos que el objeto `editar` que recogemos tenga el `id`, salvamos el objeto y lo devolvemos y sino devolvemos nulo. En posteriores lecciones optimizaremos este código. Pero por ahora nos puede servir si lo encontramos lo modificamos y sino lo encontramos devolvemos nulo.

Vamos a relanzar la aplicación y probar a modificar el `Paleta de Jamón de Bellota` para que sea un `Paleta de Jamón Ibérico de Bellota`. En este caso usamos el verbo PUT con el URL `http://localhost:8080/producto/31` y con el Body

```html
{
   "nombre": "Paleta de Jamón Ibérico de Bellota",
   "precio": 435
}
```

![143-02-10](images/143-02-10.png)

![143-02-11](images/143-02-11.png)

Obtenemos los datos del Producto actualizado.

**NOTA**: Como estamos relanzando de nuevo la aplicación es necesario primero volver a insertar el Producto 31 antes de quererlo modificar, por que cada que se relanza la aplicación se vuelve a inicializar la base de datos.

Por último nos queda el método `borrarProducto(@PathVariable Long id)` para eliminar un producto.

```java
   @DeleteMapping("/producto/{id}")
   public Producto borrarProducto(@PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
```

Si queremos devolver el producto que acabemos de borrar lo podemos hacer muy similar a la modificación del Producto.

```java
   @DeleteMapping("/producto/{id}")
   public Producto borrarProducto(@PathVariable Long id) {
      if(productoRepositorio.existsById(id)) {
         Producto producto = productoRepositorio.findById(id).get();
         productoRepositorio.deleteById(id);
         return producto;
      }else {
         return null;
      }
   }
```

Buscamos el producto y lo recuperamos con `get()`, borramos al producto por `id` y lo devolvemos. Esta es una opción donde obtenemos el producto cuando lo eliminamos.

Vamos a reelanzar la aplicación para comprobar que esto funciona.

Damos de alta el Jamón y ahora hacemos una petción `DELETE` a la URL `http://localhost:8080/producto/31`

![143-02-12](images/143-02-12.png)
![143-02-13](images/143-02-13.png)

A la hora de enviar nos regresa como respuesta el objeto eliminado, si lo solicitamos con un GET veremos que el producto realmente ya no existe.

![143-02-14](images/143-02-14.png)

Con lo cual ya hemos implementado CRUD completo tenemos los métodos:

```java
@PostMapping("/producto")
public Producto nuevoProducto(@RequestBody Producto nuevo)
 
@GetMapping("/producto/{id}")
public Producto obtenerUno(@PathVariable Long id)

@PostMapping("/producto")
public Producto nuevoProducto(@RequestBody Producto nuevo)

@PutMapping("/producto/{id}")
public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id)

@DeleteMapping("/producto/{id}")
public Producto borrarProducto(@PathVariable Long id)   
```

Hemos guardado en Postman nuestras cinco peticiones.

![143-02-15](images/143-02-15.png)

<img src="images/10-06.png">

¿Qué nos faltaría entonces? 
Nos falta manejar correctamente los cóigos de respuesta.

* Las peticiones de creación deberían devolver un 201
* Las peticiones que no encuentren un recurso deberían devolver un 404
* Si la petición de borrado devuelve datos esta bien que devuelva un 200 pero si no devuelve datos deberia devolver un 204 que es vacío.

Todo eso lo haremos en las próximas lecciones donde iremos modificando este código poco a poco.

### :computer: Código Completo - `143-02-EstructuraRutas`

![143-02-16](images/143-02-16.png)

*`pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.1.8.RELEASE</version>
      <relativePath/> <!-- lookup parent from repository -->
   </parent>
   <groupId>com.openwebinars.rest</groupId>
   <artifactId>143-02-EstructuraRutas</artifactId>
   <version>0.0.1-SNAPSHOT</version>
   <name>143-02-EstructuraRutas</name>
   <description>Ejemplo de métodos crud en un API REST</description>

   <properties>
      <java.version>1.8</java.version>
   </properties>

   <dependencies>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-data-jpa</artifactId>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
      </dependency>

      <dependency>
         <groupId>com.h2database</groupId>
         <artifactId>h2</artifactId>
         <scope>runtime</scope>
      </dependency>
      <dependency>
         <groupId>org.projectlombok</groupId>
         <artifactId>lombok</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-test</artifactId>
         <scope>test</scope>
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

*`data.sql`*

```sql
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Juice - Orange, Concentrate', 91);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Beef - Ground, Extra Lean, Fresh', 87);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Cheese - Parmesan Grated', 39);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Cups 10oz Trans', 67);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Wine - Beringer Founders Estate', 27);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Bread - Wheat Baguette', 82);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Quail - Eggs, Fresh', 3);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Cheese - Mascarpone', 97);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Mace', 25);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Oil - Shortening - All - Purpose', 63);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Marjoram - Fresh', 60);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Turnip - White', 74);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Pork Salted Bellies', 38);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Longos - Greek Salad', 15);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Amaretto', 85);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Godiva White Chocolate', 97);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Tomatoes - Roma', 61);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Oven Mitt - 13 Inch', 1);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Vermouth - White, Cinzano', 72);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Club Soda - Schweppes, 355 Ml', 38);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Fenngreek Seed', 1);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Dill Weed - Dry', 72);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Pepper - Green', 56);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Bacardi Breezer - Tropical', 35);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Wine - Merlot Vina Carmen', 14);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Sauce - Black Current, Dry Mix', 9);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Crab - Soft Shell', 17);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Jameson Irish Whiskey', 19);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Muffin Chocolate Individual Wrap', 77);
insert into producto (id, nombre, precio) values (NEXTVAL('hibernate_sequence'), 'Mussels - Frozen', 95);
```

**Modelo**

*`Producto`*

```java
package com.openwebinars.rest.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
public class Producto {

   @Id @GeneratedValue
   private Long id;
	
   private String nombre;
	
   private float precio;
	
}
```

*`ProductoRepositorio`*

```java
package com.openwebinars.rest.modelo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepositorio extends JpaRepository<Producto, Long> {

}
```

**Controller**

*`Productocontroller`* (El unico modificado en esta lección)

```java
package com.openwebinars.rest.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.openwebinars.rest.modelo.Producto;
import com.openwebinars.rest.modelo.ProductoRepositorio;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;

   /**
    * Obtenemos todos los productos
    * 
    * @return
    */
   @GetMapping("/producto")
   public List<Producto> obtenerTodos() {
      return productoRepositorio.findAll();
   }

   /**
    * Obtenemos un producto en base a su ID
    * 
    * @param id
    * @return Null si no encuentra el producto
    */
   @GetMapping("/producto/{id}")
   public Producto obtenerUno(@PathVariable Long id) {
      return productoRepositorio.findById(id).orElse(null);
   }

   /**
    * Insertamos un nuevo producto
    * 
    * @param nuevo
    * @return producto insertado
    */
   @PostMapping("/producto")
   public Producto nuevoProducto(@RequestBody Producto nuevo) {
      return productoRepositorio.save(nuevo);
   }

   /**
    * 
    * @param editar
    * @param id
    * @return
    */
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
      if(productoRepositorio.existsById(id)) {
         editar.setId(id);
         return productoRepositorio.save(editar);
      }else {
         return null;
      }
   }

   /**
    * Borra un producto del catálogo en base a su id
    * @param id
    * @return
    */
   @DeleteMapping("/producto/{id}")
   public Producto borrarProducto(@PathVariable Long id) {
      if(productoRepositorio.existsById(id)) {
         Producto producto = productoRepositorio.findById(id).get();
         productoRepositorio.deleteById(id);
         return producto;
      }else {
         return null;
      }
   }
}
```

**Base**

*`Application`*

```java
package com.openwebinars.rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

   public static void main(String[] args) {
      SpringApplication.run(Application.class, args);
   }

}
```

# 11 Clases y anotaciones de Spring 14:25 

[PDF Algunas_clases_y_anotaciones.pdf](pdfs/10_Algunas_clases_y_anotaciones.pdf)

## Resumen Profesor

### Clases `HttpEntity`, `RequestEntity` y `ResponseEntity`

* `HttpEntity: representa una petición o respuesta HTTP, consistente en una serie de encabezados y un cuerpo.
* `RequestEntity: extensión de HttpEntity que añade un método (verbo HTTP) y una URI
* `ResponseEntity: extensión de HttpEntity que añade un código de respuesta (HttpStatus).

### Códigos de respuesta según petición

Verbo HTTP | Código operación correcta | Código operación incorrecta
-----------|---------------------------|----------------------------
GET	| `200 OK` | 404 Not Found
POST| `201 Create` | 	 
PUT	| `200 OK` | 404 Not Found
DELETE | `204 No Content` | 	 

## Transcripción

<img src="images/11-01.png">

Vamos a seguir mejorando nuestra aplicación y para ello vamos a volver a recordar y vamos a ver cómo funcionan algunas clases y anotaciones.

<img src="images/11-02.png">

Ya hemos utilizado la de mapeo de método (`@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`,...).

También hemos utilizado `@PathVariable` esta nos servía para que desde un tramo de la ruta, sacar un determinado valor que vienen tres llaves, e inyectarlo, no viene realmente entre llaves, la representación en una especie de plantilla si viene, sacarlo desde allí e inyectarlo en un valor en un argumento de un método del controlador.

Y `@RequestBody` que nos vale para inyectar el cuerpo de una petición dentro de un objeto que se pasa como argumento en un método del controlador.

<img src="images/11-03.png">

¿Qué clases necesitamos ya? 

`ResponseEntity<T>` la nombramos hace tiempo, la necesitamos ya.

`ResponseEntity<T>` nos permite manejar de una forma más conveniente la respuesta que le enviamos al cliente, hemos visto antes que hereda de `HttpEntity` lo único que añade es un status code un código de respuesta y la posibilidad de enviar también un cuerpo y de poder enviar respuestas sin curpo incluso tiene un Builder rápido que nos permitirá crear este tipo de objetos.

<img src="images/11-04.png">

Vamos a modificar la funcionalidad del ejemplo anterior añadiendo algunos elementos, devolveremos en `@GetMapping` 200 si localizamos el recurso, sino devolveremos un 404 Not Found que suele ser el código de respuesta clásico. En `@PostMapping` en lugar de devolver 200 devolveremos 201 que es el código de creación de un nuevo recurso. 

<img src="images/11-05.png">

En `@PutMapping` devolveremos 200 OK si localizamos y modificamos el recurso si no devolvemos 404 Not Found y en `@DeleteMapping` lo que vamos a hacer en lugar de devolver el producto, que eso realmente solamente serviría si vamos a hacer una especie de último preview de lo que acabamos de borrar, ya ha borrado, si no podemos enviar un 204 Not Content con el cuerpo vacío.

Tenemos que pensar siempre que lo que vayamos enviando como respuesta será siempre teniendo en mente que en este caso estamos programando para otros programadores que puede que sean de nuestro propio equipo o no. Estamos desarrollando un API REST para que gente que va a desarrollar aplicaciones cliente ya sea en Angular, en Android, en iOS o en otro tipo de tecnología vayan a utilizar nuestra API REST, pues teniendo esto en mente vamos a hacer las modificaciones sobre nuestro código.

Nos venimos por aquí sobre el proyecto de antes voy a hacer una nueva copia para que tengamos el código lo más organizado posible, lo hemos llamado `143-03-EstructuraRutas-Clases-Anotaciones`. Nos vamos al controlador que es donde vamos a hincar el diente y vamos a ir haciendo una serie de modificaciones.

Nosotros antes hemos devuelto directamente el `findAll()` del repositorio de productos.

```java
@GetMapping("/producto")
public List<Producto> obtenerTodos() {
   return productoRepositorio.findAll();
}
```

En este caso lo que vamos a hacer es que lo vamos a guardar en una lista, la podemos llamar por ejemplo `result` de resultado y lo que vamos a hacer es que si la lista está vacía lo que vamos a tratar es de devolver una respuesta y si la lista tiene elementos devolvemos otra. Si la lista tiene elementos podríamos devolver directamente la lista, pero si la lista no tiene elementos vamos a querer devolver una instancia de `ResponseEntity` en la que vemos que tiene una serie de métodos como por ejemplo `notFound()` en la que directamente nos construye un `ResponseEntity` con código 404 y que faltaría para construirlo, llamar a `builder()`. 

<img src="images/11-06.png">

Que pasa, que en un caso queremos devolver un `ResponseEntity` y en otro caso un `result` que es de tipo `List<Producto>` tenemos una poca de discordia, lo que podemos hacer es refactorizando la firma del método para que devuelva un `ResponseEntity` en el primer caso de algo `?` con el cuerpo vacío y en el otro caso un `ok` pasándole el `result` como cuerpo.

<img src="images/11-07.png">

Podemos ver que ahora nuestro APIs va a tener un comportamiento distinto si tuviéramos productos o no los tuviera.

```java
@GetMapping("/producto")
public ResponseEntity<?> obtenerTodos() {
		
   List<Producto> result = productoRepositorio.findAll();
		
   if(result.isEmpty()) {
      return ResponseEntity.notFound().build();
   } else {
      return ResponseEntity.ok(result);
   }
}
```

Podemos comprobar que sigue funcionando. Para el 404 haremos la comprobación con un producto que es más cómodo, si no tendríamos que borrar todo lo que tengamos en la base de datos.

Arrancamos el proyecto y desde Postman hacemos una petición GET con el URL `http://localhost:8080/producto`

<img src="images/11-08.png">

Podemos ver como ahora nos está devolviendo 200 OK, si limpiaramos la base de datos o comentáramos el `data.sql` podríamos ver cómo no nos devolvería ningun dato y nos tendría que devolver un 404.

A la hora de buscar un producto lo que hacíamos era esto:

```java
@GetMapping("/producto/{id}")
public Producto obtenerUno(@PathVariable Long id) {
   return productoRepositorio.findById(id).orElse(null);
}
```

Ahora lo vamos a guardar en un Producto `result` y verificamos el valor de `result` para que igual que antes devolver una cosa u otra dependiendo del contenido de `result`.

```java
@GetMapping("/producto/{id}")
public ResponseEntity<?> obtenerUno(@PathVariable Long id) {
   Producto result = productoRepositorio.findById(id).orElse(null);
		
   if(result == null) {
      return ResponseEntity.notFound().build();
   } else {
      return ResponseEntity.ok(result);
   }
}
```

Si relanzamos la aplicación y probamos con Postman tenemos que cuando buscamos un producto que existe nos devuelve el Producto localizado.

<img src="images/11-09.png">

Ahora hacemos la petición del producto 31.

<img src="images/11-10.png">

Vemos cómo nos devuelve un código `404 Not Found`, qué significa que no ha encontrado el recurso, es bastante más conveniente, aquellos programadores que utilicen nuestra API y que hagan una petición de búsqueda si reciben un `404` como respuesta sabrán que tendrán que mostrarle al usuarios que no se ha encontrado el recurso o tendrán que hacer otro tipo de mecanismo.

Si nos vamos a la petición de `@PostMapping("/producto")` actualmente tenemos:

```java
@PostMapping("/producto")
public Producto nuevoProducto(@RequestBody Producto nuevo) {
   return productoRepositorio.save(nuevo);
}
```

Aquí tenemos varias alternativa, podemos recoger el producto en un nuevo producto y tendríamos la posibilidad, existe el método `created`, el problema está en lo siguiente, lo normal es que `REST` nos invita que cuando se haga una petición POST para crear un recurso, además de devolver un 201, se devuelva la URI dónde podemos consultar ese producto, lo podríamos hacer aquí a través de una base hardcodeada de la URL y añadiendo el id del nuevo producto, realmente no se hace así, se hace a través de utilizar unas clases que permiten manejar la URI, extraer una parte incluso desde un servlet o desde una petición y construirla convenientemente, como no nos vamos a parar a esa parte ahora, para aprender también que podemos hacerlo, podemos crear una nueva petición donde el código de estado lo pasemos o bien con un número o a través de las constantes de una enumeración qué en este caso es `HttpStatus.CREATED` y devolveremos el objeto salvado en el cuerpo, también devolveremos un `ResponseEntity` en este caso puede ser de Producto.

```java
@PostMapping("/producto")
public ResponseEntity<Producto> nuevoProducto(@RequestBody Producto nuevo) {
   Producto saved = productoRepositorio.save(nuevo);
   return ResponseEntity.status(HttpStatus.CREATED).body(saved);
}
```

Podríamos recargar y crear un nuevo Producto con Postman.

![143-03-01](images/143-03-01.png)

Ahora ya se ha incluido el producto *Paleta de Jamón de Bellota* y vemos como nos devuelve como código de estado `201 Created`, se ha creado un nuevo recurso. 

Si a la hora, tampoco lo vamos a programar ahora mismo, pero si a la hora de crear el nuevo producto hubiera algún tipo de fallo por ejemplo que el nombre no lo mandaramos y fuera obligatorio podríamos devolver a lo mejor un código `400` de peticion erronea.

Si nos vamos a la petición de `@PutMapping("/producto/{id}")` actualmente tenemos:

```java
@PutMapping("/producto/{id}")
public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
   if(productoRepositorio.existsById(id)) {
      editar.setId(id);
      return productoRepositorio.save(editar);
   }else {
      return null;
   }
}
```

Podemos cambiar el código para que en lugar de hacerse de esta manera se hiciera de una manera un poco más conveniente. Lo primero es que devolveremos un `ResponseEntity<?>`. Por otro lado sabemos que el `productoRepositorio` tiene un método `findById(id)` que devuelve un `Optional`, **`Optional` tiene un método fantástico `map` que nos va a permitir transformar el objeto en otro objeto**, en caso de que no lo encuentre nos devolvera otra cosa, que ya veremos la que será. Por lo pronto esto será lo que se devuelva.

![143-03-02](images/143-03-02.png)

Lo que devolvamos en el caso de que encuentre el producto será el producto editado, el nombre y precio del producto será el que hemos pasado y después de editar todo el producto tendríamos que devolverlo. Dentro del Else si no ha encontrado el producto lo que hacemos es devolver `return ResponseEntity.notfound().build();` 

```java
@PutMapping("/producto/{id}")
public ResponseEntity<?> editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
		
   return productoRepositorio.findById(id).map(p -> {
      p.setNombre(editar.getNombre());
      p.setPrecio(editar.getPrecio());
      return ResponseEntity.ok(productoRepositorio.save(p));
   }).orElseGet(() -> {
      return ResponseEntity.notFound().build();
   });
}
```

En el Map devolvemos un `ResponseEntity` del producto ya almacenado, porque lo estamos almacenando con `productoRepositorio.save(p)` con `ok` indicamos un código `200 OK` y el producto modificado que es lo que vamos buscando y si no lo que se devuelve sería un `notFound()` porque no lo hemos encontrado, el comportamiento que andábamos buscando.

Relanzamos la aplicación y probamos nuevamente con Postman.

![143-03-03](images/143-03-03.png)

Nuestra `Paleta de Jamón de Bellota` la transformamos a `Paleta de Jamón Ibérico de Bellota` y vemos que nos retorna el recurso modificado.

![143-03-04](images/143-03-04.png)

Si lo que quisiéramos es transformar el producto 33 que no existe, nos devolvería un `404 Not Found` qué es lo que andabamos buscando.

![143-03-05](images/143-03-05.png)

Por último a la hora de borrar, donde actualmente tenemos:

```java
@DeleteMapping("/producto/{id}")
public Producto borrarProducto(@PathVariable Long id) {
   if(productoRepositorio.existsById(id)) {
      Producto producto = productoRepositorio.findById(id).get();
      productoRepositorio.deleteById(id);
      return producto;
   }else {
      return null;
   }
}
```

Como hemos dicho que ya no vamos a querer devolver el Producto eliminado, eliminamos el Producto con `deleteById(id)` y aquí si podemos hacer una devolución de `noContent()` la terminamos de construir con `built()`, por lo que el método nos quedaría así:

```java
@DeleteMapping("/producto/{id}")
public ResponseEntity<?>  borrarProducto(@PathVariable Long id) {
   productoRepositorio.deleteById(id);
   return ResponseEntity.noContent().build();
}
```

Relanzamos la aplicación y probamos con Postman el borrar el Prodducto 31.

<img src="images/11-15.png">

Nos devolvería vacío pero nos devuelve el código correcto que es `204 No Content` y así hemos completado nuestra API para que los códigos de retorno que vamos teniendo se vayan acercando a lo que debería.

### :computer: Código Completo - `143-03-EstructuraRutas-Clases-Anotaciones`

![143-03-06](images/143-03-06.png)

La única clase que cambio en comparación al proyecto pasado es las siguite que es la única que ponemos aquí.

**Controller**

*`Productocontroller`* (El unico modificado en esta lección)

```java
package com.openwebinars.rest.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.openwebinars.rest.modelo.Producto;
import com.openwebinars.rest.modelo.ProductoRepositorio;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;

   /**
    * Obtenemos todos los productos
    * 
    * @return 404 si no hay productos, 200 y lista de productos si hay uno o más
    */
   @GetMapping("/producto")
   public ResponseEntity<?> obtenerTodos() {
		
      List<Producto> result = productoRepositorio.findAll();
		
      if(result.isEmpty()) {
         return ResponseEntity.notFound().build();
      } else {
         return ResponseEntity.ok(result);
      }
   }

   /**
    * Obtenemos un producto en base a su ID
    * 
    * @param id
    * @return 404 si no encuentra el producto, 200 y el producto si lo encuentra
    */
   @GetMapping("/producto/{id}")
   public ResponseEntity<?> obtenerUno(@PathVariable Long id) {
      Producto result = productoRepositorio.findById(id).orElse(null);
		
      if(result == null) {
         return ResponseEntity.notFound().build();
      } else {
         return ResponseEntity.ok(result);
      }
   }

   /**
    * Insertamos un nuevo producto
    * 
    * @param nuevo
    * @return 201 y el producto insertado
    */
   @PostMapping("/producto")
   public ResponseEntity<Producto> nuevoProducto(@RequestBody Producto nuevo) {
      Producto saved = productoRepositorio.save(nuevo);
      return ResponseEntity.status(HttpStatus.CREATED).body(saved);
   }

   /**
    * 
    * @param editar
    * @param id
    * @return 200 Ok si la edición tiene éxito, 404 si no se encuentra el producto
    */
   @PutMapping("/producto/{id}")
   public ResponseEntity<?> editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
		
      return productoRepositorio.findById(id).map(p -> {
			p.setNombre(editar.getNombre());
			p.setPrecio(editar.getPrecio());
			return ResponseEntity.ok(productoRepositorio.save(p));
             }).orElseGet(() -> {
			return ResponseEntity.notFound().build();
             });
   }

   /**
    * Borra un producto del catálogo en base a su id
    * @param id
    * @return Código 204 sin contenido
    */
   @DeleteMapping("/producto/{id}")
   public ResponseEntity<?>  borrarProducto(@PathVariable Long id) {
      productoRepositorio.deleteById(id);
      return ResponseEntity.noContent().build();
   }

}
```

# 12 Uso del patrón Data Transfer Object (DTO) 11:25 

[PDF Uso_del_patrón_DTO.pdf](pdfs/11_Uso_del_patrón_DTO.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/12-01.png">

En esta lección vamos a aprender que eso de Data Transfer Object o el patrón DTO.

<img src="images/12-02.png">

Hablemos primero de las entidades, para nosotros las entidades son clases Java con algunas anotaciones más, de hecho cumplen con una serie de requisitos y si son entidades de JPA de la versión 2.0 tienen que cumplir una serie de requisitos:

* Debe tener un constructor sin argumentos y puede tener otros constructores.
* El constructor sin argumentos debe ser público o protegido.
* Debe tener una clase de nivel superior aunque sea Object no puede ser una enumeración o una interfaz.
* La clase entidad no debe ser `final` ni debería serlo ningún método o variables de instancia persistente de dicha clase.
* Si una clase de entidad se va a pasar por valor como un objeto separado por ejemplo a través de una interfaz remota debería ser además serializable.
* Puede ser clase abstracta o concreta.
* Las entidades pueden ampliar extender de una clase que no son entidad
* Etc.

Con lo cual vemos que para ser entidad no vale cualquiera, tiene que cumplir una serie de requisitos y además tienen una misión específica qué es modelar nuestro objeto en la capa de la lógica de negocio.

Si como venimos haciendo un ejemplo tenemos una tienda de productos pues tendrían que modelar lo que nosotros allí gestionamos productos, ventas, clientes, etc. 

Ahora la pregunta es esas entidades que son clases Java, que son cómodas y que hemos adelgazado con Lombok es bueno utilizarlas en el resto de capas, la respuesta siempre será la del gallero **depende** pero sin embargo los expertos dicen que NO es buena práctica el usarlas es decir, qué es buena práctica NO usar las entidades en el resto de capas.

<img src="images/12-03.png">

Dejaremos para la Lógica de Negocio las entidades y en otras capas podremos utilizar otro tipo de clases como por ejemplo las **Data Transfer Object DTO**, se tratan de objetos POJO de aquellos Plain Old Java Object que agrupan datos de la capa de negocio y qué sirven para hacer transferencias de datos entre diferentes capas, incluso entre diferentes sistemas. Tengamos en cuenta que un DTO puede tener parte de los datos de una sola entidad, tener algunos datos de más de una entidad de varias entidades aglutinar varios datos o incluso todos los datos de varias entidades.

En la literatura lo podemos encontrar como DTO o en ocasiones como **Value Object** y está pensado para aligerar las transacciones entre cliente y servidor, si por ejemplo necesitamos en nuestra aplicación cliente pintar todos los datos de varias entidades a la vez, vease un cliente con sus datos personales, con sus posibles direcciones pensar por ejemplo en vuestra ficha de cliente en Amazon, en la que podéis tener varias direcciones diferentes, posiblemente eso sean distintas instancias de clase entidad en la parte de la lógica de negocio podríamos aglutinar todas ellas en un solo DTO para que solamente tuviéramos que hacer una petición GET y llevar a una sola respuesta y así aligeraríamos la comunicación entre nuestra aplicación cliente y nuestra API, aunque el objeto sea un poco más pesado siempre será, bueno siempre no, tendríamos que analizar caso a caso, pero usualmente es mejor hacer una sola petición de un objeto que sea un pelín más pesado, que el hacer múltiples peticiones para traer los datos de usuario y una dirección, otra dirección, otra dirección y otra dirección si tuviéramos al menos 4.

<img src="images/12-04.png">

Las características de un DTO es que va a ser una clase muy sencilla, va a ser un objeto plano que no va a tener nada de lógica de negocio, algunos piensan que solamente debe tener un constructor con parámetros y getter yo creo que no pasa nada si también tiene setter y los constructores necesarios para facilitar el trabajo, que sea serializable para poder viajar a través de la red aun que ya digo que esto no es estrictamente obligatorio si y solo si necesitaramos que a través de algún mecanismo lo transformaramos en un chorro de bytes deberíamos implementar serializable. 

<img src="images/12-05.png">

Un ejemplo de DTO podría ser el que vemos aquí imaginar que aumentamos el número de clases en nuestro modelo y tenemos Producto y Categoría y queremos pintar los productos en una aplicación cliente, para ello vamos a pintar todos los productos en una serie de paneles o en una lista, a lo mejor necesitamos el id del producto para poder montar la URL para poder ver la ficha completa, el nombre, el precio y la categoría pero no necesitamos el objeto categoría entero, solamente necesitamos el nombre de la categoría, podríamos construir un DTO que como veías aglutína parte de los datos de más de una entidad.

<img src="images/12-06.png">

Como los debemos usar y dónde, supongamos que en nuestro ejemplo el del catálogo de productos dónde lo podríamos usar, pues por ejemplo lo podríamos utilizar en las peticiones GET del producto y también GET de producto de uno solo.

<img src="images/12-07.png">

Fijemonos en el `GET /producto/` el listado de productos de todos los productos, posiblemente vaya oriental a visualizarlo en una aplicación cliente, en una página, una pantalla donde se vean todos los productos, posiblemente no queramos verlos todos porque usemos paginación pero aunque los viéramos todos, no queremos ver todos los datos del producto, ahí sería un buen escenario para que construyera un DTO que nos permitirá obtener solamente unos cuantos datos del producto netamente los que vayamos a utilizar para pintar. No sería muy inteligente que enviarnos un objetos muy pesados y luego solamente utilizaramos dos o tres datos, preferible es que tengamos un DTO y enviemos estrictamente los datos que vayamos a utilizar.

<img src="images/12-08.png">

En el caso de obtener los datos de un solo producto si queremos dar todos los datos porque estamos haciendo una búsqueda por id y esto sería como la ficha del producto no usaremos el DTO anterior, qué alternativas tenemos no usar DTO y usar la Entidad o crear un DTO otro específico para esta pantalla de aquí, aquí ya iremos manejandonos con alternativas. 

<img src="images/12-09.png">

Esto de que haya para un mismo objeto más de un DTO será algo normal, ya veremos cuando en próximo curso trabajemos con la seguridad como, un ejemplo clásico es el usuario, podemos tener para un usuario, una entidad `UserEntity` que será la que guardaremos en nuestra base de datos, tengo un conjunto de datos y abra datos a lo mejor del usuario que no sean persistentes y otro que si, alguno incluso lo guardaremos de una determinada manera como la contraseña que además la guardamos cifrada, sin embargo en la capa de seguridad con Spring Security tendremos una clase `User` que tendrá que tener por fuerza una serie de atributos, alguno de ellos podemos querer que sean persistente y otros que no, pero ahí los necesitaremos e incluso podremos tener distintos DTOs uno para crear usuario `CreateUserDTO` 
a lo mejor en la petición de creación nos interesa que recogiendo lo que va enviar un formulario, para poder validar si la contraseña es correcta se envié dos campos que escriba la contraseña y vuelve a escribirla para que se envíe al servidor y la validación se haga en el servidor, cosa que no tendríamos que almacenar doblemente la contraseña o un `GetUserDTO` para peticiones de tipo GET donde no traeríamos por ejemplo la contraseña y podríamos seleccionar unos pocos datos del usuario que serían los que tendríamos para ver en una petición de tipo GET, es decir que no será raro que tengamos diferentes DTOs asociados a una misma clase de un mismo Business Object BO.

<img src="images/12-10.png">

DTO es es un patrón de diseño que tiene sus defensores y también sus detractores de hecho tendréis que plantearlo en cada proyecto, en los equipos de trabajo que estéis, la forma más adecuada de transportar los datos entre las diferentes capas de nuestra aplicación, sobre todo entre cliente y servidor. Yo doy algunas pistas por si las queréis utilizar:

* Les recomendaré no ofrecer más datos de los debidos en una respuesta a una petición. 
* Pero también no abusar del DTO creando uno para cada tipo de petición. 

Porque si no es posible que tengamos tal amalgama de clases que no sepamos cuál es la que corresponde en determinado momento, es decir es un pequeño matrimonio entre estas dos opciones, no volvernos locos creando clase pero no enviando una cantidad ingente de datos que no vamos a utilizar.

<img src="images/12-11.png">

Cómo podemos implementar DTO tenemos diferentes mecanismos uno es manualmente y como, bueno pues nosotros podríamos instanciar el nuevo objeto y nos encargamos haciendo get y set de asignar los datos esto que a priori suena así un poco regular ya veréis como no es tan malo y usando Lombok con la anotación `@Builder` nos genera un Builder en el cual a traves de métodos encadenados podemos construir un objeto, puede resultar, la verdad es que es rápido, cómodo y usable en muchos contextos.

En particular en la siguiente lección vamos a aprender a utilizar **ModelMapper** que es una librería que va a hacer el trabajo de transformar una clase en otra por nosotros va a ser francamente comodo.

También tenemos la segunda opción que proponía no tener tantas clases el uso de **JsonViews** que a través de anotaciones podemos tener un solo objeto, pero que a través de la anotación `@JsonViews` podemos definir que determinados datos solamente te devuelva, se transformen en JSON en una determinada situación, por ejemplo para los productos podremos marcar algunos atributos solamente para la vista de lista y marcar otros para la vista de detalle y seleccionar cuáles van y cuáles no van en una o en otra y con un mismo objeto dentro de nuestro modelo y solamente diciendo que vista queremos mostrarle, podríamos obtener distintos resultados en una petición u otra.

Como decía en la próximo lección utilizando ModelMapper vamos a construir DTOs para nuestra API REST.

# 13 Implementando DTO con ModelMapper 17:58 

[PDF DTO_con_ModelMapper.pdf](pdfs/12_DTO_con_ModelMapper.pdf)

## Resumen Profesor

La dependencia a añadir en el `pom.xml` es:

```html
<dependency>
   <groupId>org.modelmapper</groupId>
   <artifactId>modelmapper</artifactId>
   <version>2.3.5</version>
</dependency>
```

Si queremos buscar la última dependencia disponible, podemos mirar en https://mvnrepository.com/artifact/org.modelmapper/modelmapper.

### Estrategia de asignación de propiedades

ModelMapper incluye tres tipos de estrategia a la hora de asignar valores entre clases:

* `Standard`: es la estrategia por defecto. Permite que las propiedades de origen coincidan de forma inteligente con las de destino.
* `Loose`: la estrategia flexible permite que las propiedades de origen coincidan libremente con las de destino.
* `Strict`: la estrategia estricta permite una precisión completa, asegurando que no se produzcan ambigüedades.

Para cambiar la estrategia, podemos usar el siguiente código:

```java
modelMapper.getConfiguration()
  .setMatchingStrategy(MatchingStrategies.LOOSE);
```

### Ajustando manualmente la transformación

En ocasiones, nos interesará ajustar manualmente la transformación entre dos objetos, bien porque no queramos cambiar la estrategia para todos los atributos, o porque se trate de una asignación muy particular. Para ello tenemos varios mecanismos, pero uno de ellos a través de la creación de un `PropertyMap<S,D>`.

Por ejemplo, si en nuestro ejemplo queremos que la clase DTO quede como sigue:

```java
@Getter
@Setter
public class ProductoDTO {

    private long id;
    private String nombre;
    private String categoria;

}
```

Podemos realizar *manualmente* la transformación de `categoria.nombre` en `Producto` a `categoria` en `ProductoDTO`. Para ello, podemos añadir este código en nuestro componente de conversión:

```java
@Component
@RequiredArgsConstructor
public class ProductoDTOConverter {

    private final ModelMapper modelMapper;


    @PostConstruct
    public void init() {
        modelMapper.addMappings(new PropertyMap<Producto, ProductoDTO>() {

            @Override
            protected void configure() {
                map().setCategoria(source.getCategoria().getNombre());
            }
        });
    }

    public ProductoDTO convertToDto(Producto producto) {
        return modelMapper.map(producto, ProductoDTO.class);

    }

}
```

## Transcripción

<img src="images/13-01.png">

Vamos a aprender a implementar el patrón Data Transfer Object DTO con ModelMapper.

<img src="images/13-02.png">

Primero vamos a empezar viendo que es eso de ModelMapper hemos visto en la lección anterior que para poder transformar un Objeto de Negocio (BO) en DTO o viceversa lo podremos hacer manualmente o con ModelMapper. ModelMapper nos va a permitir evitar código muy repetitivo ya que nos va a facilitar la creación de DTOs mediante una asignación dinámica, de hecho lo que va a buscar es aplicar una serie de pequeñas regla inteligentes, para hacer la transformación, pero también nos va a ofrecer la posibilidad de configurar cómo se va a hacer la asignación entre objetos.

<img src="images/13-03.png">

Para usar ModelMapper tan solo tendríamos que añadir esta dependencia con la versión más actualizada que quisiéramos tener dentro de nuestro `pom.xml`.

```html
<!-- https://mvnrepository.com/artifact/org.modelmapper/modelmapper -->
<dependency>
    <groupId>org.modelmapper</groupId>
    <artifactId>modelmapper</artifactId>
    <version>2.3.8</version>
</dependency>
```

<img src="images/13-04.png">

Y como configuración básica para poder utilizarla ya dónde lo necesitemos podríamos crear un Bean que nos devuelva el ModelMapper, el objeto nuclear que va a hacer las transformaciones para poder utilizarlo allá donde lo necesitemos.

<img src="images/13-05.png">

¿Cómo va a ser nuestro DTO? Nuestro DTO va a ser una clase muy sencilla con getter, setter con las anotaciones `@Getter` y `@Setter` le podemos añadir algún tipo de constructor o Builder o el constructor por defecto que tiene creado lo que vayamos necesitando y que va a tener solamente el `id`, `nombre` y `categoriaNombre` vamos a comprobar como en el proyecto Base ya hemos añadido una clase modelo de categoría, se añaden algunas categorías a la base de datos, los productos tienen enlazadas categoría, para que no nos perdamos en detalle asociado a Spring Data JPA, a las entidades, a esta parte del modelo y nos centremos solamente en REST.

Nuestra clase va a ser esta vamos a tener el `id`, `nombre` y `categoriaNombre` sería un posible candidato por ejemplo para tener el listado de productos para un cliente que a lo mejor no se hubiera logueado en el sistema y que no puede ver los precios si es que por ejemplo nuestro sistema trabaja así, como una posible idea. 

<img src="images/13-06.png">

Dónde vamos a hacer la transformación hacia nuestro DTO, bueno pues explísitamente la podríamos hacer toda esa transformación con ModelMapper en el controlador, de hecho encontraré en algún ejemplo de algúnos autores conocido que se hace allí de ejemplo.

<img src="images/13-07.png">

Nosotros lo que vamos a hacer es crear un componente independiente que haga la transformación de un objeto en otro e inyectar ese componente allá donde lo necesiten el componente podría ser como este, observen que sería una clase con `@Component` no llega quizá a servicio, es simplemente un componente de utilidad dónde utilizando el ModelMapper va a hacer la construcción de un producto DTO a partir de un producto, va a ser así de sencillo y esto lo utilizaremos dentro de un controlador, por ejemplo en `@GetMapping("/producto")` donde queremos hacer la transformación podríamos tener la lista de todos y hacer esta conversión aprovechando el API Stream eso sí lo podríamos hacer aquí ya, porque a partir de la capa de acceso a datos tenemos todos los productos y los procesamos aquí mismo 1 a 1 pero a través del API Stream con Map vamos llamando al conversor de DTO, construye por cada producto un producto DTO lo almacenamos en una lista y es lo que devolveríamos entonces a nuestro cliente.

### :computer: `143-04-ImplementacionDTO` Uso de DTOs y `Modelmapper` 

Vamos a importarnos del Repositorio del curso el proyecto `12_ImplementacionDTOBase` y lo vamos a copiar dentro de nuestro propio WorkSpace con el nombre `143-04-ImplementacionDTO`, el proyecto tiene la siguiente estructura:

![143-04-01](images/143-04-01.png)

**NOTA** No olvidemos cambiar las etiquetas `artifactId` y `name` dentro del `pom.xml` con las del nombre de nuestro proyecto.

```html
...
   <artifactId>143-04-ImplementacionDTO</artifactId>
   <version>0.0.1-SNAPSHOT</version>
   <name>143-04-ImplementacionDTO</name>
...
```

Como este proyecto tiene varios cambios con respecto al anterior vamos a ver algunas de las clases desde las cuales estamos partiendo. 

Para empezar la BD ha cambiado un poco, aparte de los Productos estamos añadiendo Categorias.

`data.sql`

```sql

insert into categoria (id, nombre) values (NEXTVAL('hibernate_sequence'), 'Comida');
insert into categoria (id, nombre) values (NEXTVAL('hibernate_sequence'), 'Bebida');
insert into categoria (id, nombre) values (NEXTVAL('hibernate_sequence'), 'Complementos');

insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Juice - Orange, Concentrate', 91, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Beef - Ground, Extra Lean, Fresh', 87, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Cheese - Parmesan Grated', 39, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Cups 10oz Trans', 67, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Wine - Beringer Founders Estate', 27, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Bread - Wheat Baguette', 82, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Quail - Eggs, Fresh', 3, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Cheese - Mascarpone', 97, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Mace', 25, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Oil - Shortening - All - Purpose', 63, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Marjoram - Fresh', 60, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Turnip - White', 74, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Pork Salted Bellies', 38, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Longos - Greek Salad', 15, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Amaretto', 85, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Godiva White Chocolate', 97, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Tomatoes - Roma', 61, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Oven Mitt - 13 Inch', 1, 3);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Vermouth - White, Cinzano', 72, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Club Soda - Schweppes, 355 Ml', 38, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Fenngreek Seed', 1, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Dill Weed - Dry', 72, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Pepper - Green', 56, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Bacardi Breezer - Tropical', 35, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Wine - Merlot Vina Carmen', 14, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Sauce - Black Current, Dry Mix', 9, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Crab - Soft Shell', 17, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Jameson Irish Whiskey', 19, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Muffin Chocolate Individual Wrap', 77, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Mussels - Frozen', 95, 1);
```

Contamos con tres categorias y dentro del del Producto hemos añadido el campo `categoria_id` como pegamento entre tablas.

El modelo del `Producto` es el siguiente:

`Producto`

```java
@Data @NoArgsConstructor @AllArgsConstructor
@Entity
public class Producto {

   @Id @GeneratedValue
   private Long id;
	
   private String nombre;
	
   private float precio;
	
   @ManyToOne
   @JoinColumn(name="categoria_id")
   private Categoria categoria;
	
}
```

> Dentro del `Producto` estamos incluyendo la `Categoria` con una relación anotada con `@ManyToOne`.

> `@ManyToOne`: Es una de las anotaciones mas habituales a nivel de JPA y se encarga de generar una relación de muchos a uno. Es decir muchos Productos pertenecen a una Categoria.

> `@JoinColumn`: Esta anotación sirve en JPA para hacer referencia a la columna que es clave externa en la tabla y que se encarga de definir la relación. 

> Una vez realizadas estas operaciones ya tenemos la primera parte de la relación construida. Sin embargo aunque puede ser que para algunas aplicaciones esto sea suficiente el framework Hibernate entre sus buenas prácticas recomienda que las relaciones sean bidireccionales. Es decir que tambíen la clase Categoría tenga relación con los Productos.

Y el modelo de la `Categoria` es el siguiente:

```java
@Data @NoArgsConstructor @AllArgsConstructor
@Entity
public class Categoria {

   @Id @GeneratedValue
   private Long id;
	
   private String nombre;
	
}
```

> En este caso no se esta incluyendo ninguna relación con `Productos`

Si nosotros probamos la aplicación devolviendo la lista completa de productos vamos a tener los siguientes resultados.

![143-04-03](images/143-04-03.png)

Fijemonos como se nos devuelven los datos, se nos devuelven objetos anidados es decir para cada `Producto` tenemos anidada la categoría con todos sus atributos. Esto quiza según el caso sean demasiados datos si no los vamos a necesitar y es allí donde entran los DTO para devolver solo lo que nosotros especifiquemos. 

Vamos a empezar a modificar nuestro código.

#### 01. Añadir Dependencia `modelmapper`
Lo primero que vamos a hacer es añadir a las dependencias que ya tenemos la del **`modelmapper`**:

```html
...
   <dependency>
      <groupId>org.modelmapper</groupId>
      <artifactId>modelmapper</artifactId>
      <version>2.3.5</version>
   </dependency>
...
```

#### 02. Crear Clase de Configuración 

Lo siguiente que vamos a hacer es dentro de nuestro código vamos a crear un paquete `configuracion` y dentro una llamada `MiConfiguracion` anotada con `@Configuration` y aquí es donde vamos a crear el Bean de tipo `ModelMapper`. 


```java
@Configuration
public class MiConfiguracion {
	
   @Bean
   public ModelMapper modelMapper() {
      return new ModelMapper();
   }

}
```

#### 03. Crear DTOs

Vamos a crear dentro del paquete `dto` la Clase `ProductoDTO`

```java
@Getter @Setter
public class ProductoDTO {
	
   private String nombre;
   private float precio;
   private String categoriaNombre;

}
```

También vamos a crear un DTO para crear nuevos productos llamado `CreateProductoDTO`:

En este caso lo que queremos recoger es lo que nos podrían enviar por ejemplo desde una aplicación Angular a nuestra API.

```java
@Getter @Setter
public class CreateProductoDTO {

   private String nombre;
   private float precio;
   private long categoriaId;
}
```

Rescatamos el ID de la categoría para rescatar la categoría en nuestra capa de acceso a datos. Ya tenemos dos DTOs.

#### 04. Crear Componente de Conversión 

Ahora lo que vamos a hacer es crear nuestro componente de Conversión `ProductoDTOConverter`

```java
@Component
@RequiredArgsConstructor
public class ProductoDTOConverter {
	
   private final ModelMapper modelMapper;
	
   public ProductoDTO convertToDto(Producto producto) {
      return modelMapper.map(producto,  ProductoDTO.class);
   }
}
```

Como es un componente lo anotamos con `@Component` y también con `@RequiredArgsConstructor` para que se le inyecte ModelMapper. 

Para hacer la conversión fijarse que facíl es trabajar con `ModelMapper` tenemos el método `convertToDto` que devuelve un objeto `ProductoDTO` y que recibe un `Producto`, ***Es decir va a transformar un `Producto` en un `ProductoDTO`***. Tan facíl como hacerlo con el método `map` que recibe el objeto origen `producto` y el tipo de clase de destino `ProductoDTO.class`, **aquí es donde sucede la magia**. `ModelMapper` tiene algunas reglas inteligentes que aplica por defecto y se pregunta ¿oye un `Producto` para ti que es? A la hora de convertirlo se fija y dice si tengo `Producto` y `ProductoDTO`.

![143-04-02](images/143-04-02.png)

* Y dice el `nombre` de `Producto` será el `nombre` de `ProductoDto`.
* El `precio` de `Producto` será el `precio` de `ProductoDto`.
* Y si en `Producto` tenemos un objeto `categoria` que dentro tiene un `nombre` entonces deduce que `categoriasNombre` de `ProductoDto` debe hacer referencia al `nombre` de la `categoria` del `Producto` y entonces hara la asignación automáticamente. 

Asi es como funciona este `Converter`, será así de sencillo.

#### 05. Cambios en el Controlador 

Añadir en el Controlador el Converter.

```java
...
private final ProductoDTOConverter productoDTOConverter;
...
```

Actualmente para devolver la lista de todos los `Productos` (como Entidades) tenemos:

```java
@GetMapping("/producto")
public ResponseEntity<?> obtenerTodos() {
   List<Producto> result = productoRepositorio.findAll();

   if (result.isEmpty()) {
      return ResponseEntity.notFound().build();
   } else {
      return ResponseEntity.ok(result);
   }

}
```

Ahora lo que vamos a hacer en lugar de devolverlos todos con `return ResponseEntity.ok(result);` vamos a obtener un listado de `ProductoDTO` a partir de los `Productos` esto lo haremos con un Stream.

```java
@GetMapping("/producto")
public ResponseEntity<?> obtenerTodos() {
   List<Producto> result = productoRepositorio.findAll();

   if (result.isEmpty()) {
      return ResponseEntity.notFound().build();
   } else {
      //return ResponseEntity.ok(result);
      List<ProductoDTO> dtoList = 
            result.stream()
                  .map(productoDTOConverter::convertToDto)
                  .collect(Collectors.toList());
      return ResponseEntity.ok(dtoList);
   }

}
```

Si probamos nuestra aplicación ahora podemos ver lo siguiente:

![143-04-04](images/143-04-04.png)

Podemos ver ahora que los datos que nos aparecen no son todos los datos del `Producto` sino que serían los datos del DTO, lo que se nos devuelve es netamente lo que utilizariamos con lo cual es francamente comodo.

El otro DTO lo podríamos utilizar a la hora de crear un nuevo `Producto` actualmente tenemos nuestra petición `@PostMapping("/producto")` como sigue:

```java
@PostMapping("/producto")
public ResponseEntity<?> nuevoProducto(@RequestBody Producto nuevo) {
   Producto saved = productoRepositorio.save(nuevo);
   return ResponseEntity.status(HttpStatus.CREATED).body(saved);
}
```

En lugar de recoger un `Producto` podemos recoger un `ProductoDTO`, el propio SonarLink nos suguiere que cremos un DTO `Replace this persistent entity with a simple POJO or DTO object.`

Lo vamos a cambiar por lo siguiente:

```java
...
private final CategoriaRepositorio categoriaRepositorio;
...

@PostMapping("/producto")
public ResponseEntity<?> nuevoProducto(@RequestBody CreateProductoDTO nuevo) {

   //Crear el nuevo Producto
   Producto nuevoProducto = new Producto();
   nuevoProducto.setNombre(nuevo.getNombre());
   nuevoProducto.setPrecio(nuevo.getPrecio());
   
   //Rescatamos la categoría para poder asignarla
   Categoria categoria = categoriaRepositorio.findById(nuevo.getCategoriaId()).orElse(null);
   nuevoProducto.setCategoria(categoria);

   //salvar y devolver
   return ResponseEntity.status(HttpStatus.CREATED).body(productoRepositorio.save(nuevoProducto));
		
}
```

Lo primero que hacemos es que en lugar de recibir un `Producto` recibimos un `CreateProductoDTO`.
En este caso la asignación la vamos a hacer manualmente en el Controlador.

Los emplazo a que sean ustedes lo que creen un método Conversor o bien un Servicio que recoja el `CreateProductoDTO` y lo transforme en un `Producto`, lo salve y lo devuelva, quiza el lugar más adecuado es un Servicio que utilice el repositorio. En este caso lo estamos haciendo directamente para ver como se crea de forma manual. 

Como rescatamos la categoría para inyectarla tenemos que inyectar el Repositorio de Categoria. Se puede mejorar el código para que no se reguese una categoría nula si no la encuentra.

Una vez que ya construimos el `Producto` debemos salvarlo y devolverlo, en este caso debemos reeplantearnos si también devolvemos el DTO o el nuevo `Producto`, en este caso estamos devolviendo el `Producto` entero pero podemos plantearnos hacer la prueba para transformar el `Producto` que recojamos y transformalo a un nuevo DTO.

De manera que ahora al hacer la prueba solo le tenemos que pasar un `CreateProductoDTO` como vemos en la siguiente imagen:

![143-04-05](images/143-04-05.png)
![143-04-06](images/143-04-06.png)

Como podemos observar nos devuelve todo el `Producto`, podríamos plantearnos como reto transformarlo a DTO para que devolvierá en lugar del `Producto`.

<img src="images/13-08.png">

Los retos son los anteriores.

### :computer: Código Completo `143-04-ImplementacionDTO` Uso de DTOs y `Modelmapper` 

![143-04-08](images/143-04-08.png)

#### Dependencias

`pom.xml`

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.1.8.RELEASE</version>
      <relativePath/> <!-- lookup parent from repository -->
   </parent>
   <groupId>com.openwebinars.rest</groupId>
   <artifactId>143-04-ImplementacionDTO</artifactId>
   <version>0.0.1-SNAPSHOT</version>
   <name>143-04-ImplementacionDTO</name>
   <description>Ejemplo de uso del patrón DTO</description>

   <properties>
      <java.version>1.8</java.version>
   </properties>

   <dependencies>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-data-jpa</artifactId>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
      </dependency>

      <dependency>
         <groupId>com.h2database</groupId>
         <artifactId>h2</artifactId>
         <scope>runtime</scope>
      </dependency>
      <dependency>
         <groupId>org.projectlombok</groupId>
         <artifactId>lombok</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-test</artifactId>
         <scope>test</scope>
      </dependency>
      <dependency>
         <groupId>org.modelmapper</groupId>
         <artifactId>modelmapper</artifactId>
         <version>2.3.5</version>
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

#### Base de Datos

`data.sql`

```java

insert into categoria (id, nombre) values (NEXTVAL('hibernate_sequence'), 'Comida');
insert into categoria (id, nombre) values (NEXTVAL('hibernate_sequence'), 'Bebida');
insert into categoria (id, nombre) values (NEXTVAL('hibernate_sequence'), 'Complementos');

insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Juice - Orange, Concentrate', 91, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Beef - Ground, Extra Lean, Fresh', 87, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Cheese - Parmesan Grated', 39, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Cups 10oz Trans', 67, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Wine - Beringer Founders Estate', 27, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Bread - Wheat Baguette', 82, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Quail - Eggs, Fresh', 3, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Cheese - Mascarpone', 97, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Mace', 25, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Oil - Shortening - All - Purpose', 63, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Marjoram - Fresh', 60, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Turnip - White', 74, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Pork Salted Bellies', 38, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Longos - Greek Salad', 15, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Amaretto', 85, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Godiva White Chocolate', 97, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Tomatoes - Roma', 61, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Oven Mitt - 13 Inch', 1, 3);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Vermouth - White, Cinzano', 72, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Club Soda - Schweppes, 355 Ml', 38, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Fenngreek Seed', 1, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Dill Weed - Dry', 72, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Pepper - Green', 56, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Bacardi Breezer - Tropical', 35, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Wine - Merlot Vina Carmen', 14, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Sauce - Black Current, Dry Mix', 9, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Crab - Soft Shell', 17, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Jameson Irish Whiskey', 19, 2);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Muffin Chocolate Individual Wrap', 77, 1);
insert into producto (id, nombre, precio, categoria_id) values (NEXTVAL('hibernate_sequence'), 'Mussels - Frozen', 95, 1);
```

#### Modelo

`Producto`

```java
package com.openwebinars.rest.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
public class Producto {

   @Id @GeneratedValue
   private Long id;
	
   private String nombre;
	
   private float precio;
	
   @ManyToOne
   @JoinColumn(name="categoria_id")
   private Categoria categoria;
	
}
```

`Categoria`

```java
package com.openwebinars.rest.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
public class Categoria {

   @Id @GeneratedValue
   private Long id;
	
   private String nombre;
	
}
```

#### Repositorio (Parte del Modelo)

`ProductoRepositorio`

```java
package com.openwebinars.rest.modelo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepositorio extends JpaRepository<Producto, Long> {

}
```

`CategoriaRepositorio` 

```java
package com.openwebinars.rest.modelo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoriaRepositorio extends JpaRepository<Categoria, Long> {

}
```

#### DTOs

`ProductoDTO`

```java
package com.openwebinars.rest.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductoDTO {
	
   private String nombre;
   private float precio;
   private String categoriaNombre;

}
```

`CreateProductoDTO`

```java
package com.openwebinars.rest.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CreateProductoDTO {

	private String nombre;
	private float precio;
	private long categoriaId;
}
```

#### Converters

`ProductoDTOConverter`

```java
package com.openwebinars.rest.dto.converter;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.openwebinars.rest.dto.ProductoDTO;
import com.openwebinars.rest.modelo.Producto;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class ProductoDTOConverter {
	
   private final ModelMapper modelMapper;
	
   public ProductoDTO convertToDto(Producto producto) {
      return modelMapper.map(producto,  ProductoDTO.class);
   }
}
```

#### Configuración

`MiConfiguracion`

```java
package com.openwebinars.rest.configuracion;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MiConfiguracion {
	
   @Bean
   public ModelMapper modelMapper() {
      return new ModelMapper();
   }

}
```

#### Controller

`ProductoController`

```java
package com.openwebinars.rest.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.openwebinars.rest.dto.CreateProductoDTO;
import com.openwebinars.rest.dto.ProductoDTO;
import com.openwebinars.rest.dto.converter.ProductoDTOConverter;
import com.openwebinars.rest.modelo.Categoria;
import com.openwebinars.rest.modelo.CategoriaRepositorio;
import com.openwebinars.rest.modelo.Producto;
import com.openwebinars.rest.modelo.ProductoRepositorio;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;
   private final ProductoDTOConverter productoDTOConverter;
   private final CategoriaRepositorio categoriaRepositorio;

   /**
    * Obtenemos todos los productos
    * 
    * @return 404 si no hay productos, 200 y lista de productos si hay uno o más
    */
   @GetMapping("/producto")
   public ResponseEntity<?> obtenerTodos() {
      List<Producto> result = productoRepositorio.findAll();

      if (result.isEmpty()) {
         return ResponseEntity.notFound().build();
      } else {
         //return ResponseEntity.ok(result);
         List<ProductoDTO> dtoList = 
            result.stream()
                  .map(productoDTOConverter::convertToDto)
                  .collect(Collectors.toList());
            return ResponseEntity.ok(dtoList);
      }

   }

   /**
    * Obtenemos un producto en base a su ID
    * 
    * @param id
    * @return 404 si no encuentra el producto, 200 y el producto si lo encuentra
    */
   @GetMapping("/producto/{id}")
   public ResponseEntity<?> obtenerUno(@PathVariable Long id) {
      Producto result = productoRepositorio.findById(id).orElse(null);
      if (result == null)
         return ResponseEntity.notFound().build();
      else
         return ResponseEntity.ok(result);
   }

   /**
    * Insertamos un nuevo producto
    * 
    * @param nuevo
    * @return 201 y el producto insertado
    */
   @PostMapping("/producto")
   //public ResponseEntity<?> nuevoProducto(@RequestBody Producto nuevo) {
   public ResponseEntity<?> nuevoProducto(@RequestBody CreateProductoDTO nuevo) {
      //Producto saved = productoRepositorio.save(nuevo);
      //return ResponseEntity.status(HttpStatus.CREATED).body(saved);
		
      //Crear el nuevo Producto
      Producto nuevoProducto = new Producto();
      nuevoProducto.setNombre(nuevo.getNombre());
      nuevoProducto.setPrecio(nuevo.getPrecio());
		
      //Rescatamos la categoría para poder asignarla
      Categoria categoria = categoriaRepositorio.findById(nuevo.getCategoriaId()).orElse(null);
      nuevoProducto.setCategoria(categoria);
		
      //salvar y devolver
      return ResponseEntity.status(HttpStatus.CREATED).body(productoRepositorio.save(nuevoProducto));
		
   }

   /**
    * 
    * @param editar
    * @param id
    * @return 200 Ok si la edición tiene éxito, 404 si no se encuentra el producto
    */
   @PutMapping("/producto/{id}")
   public ResponseEntity<?> editarProducto(@RequestBody Producto editar, @PathVariable Long id) {

      return productoRepositorio.findById(id).map(p -> {
                  p.setNombre(editar.getNombre());
                  p.setPrecio(editar.getPrecio());
                  return ResponseEntity.ok(productoRepositorio.save(p));
      }).orElseGet(() -> {
                  return ResponseEntity.notFound().build();
      });
   }

   /**
    * Borra un producto del catálogo en base a su id
    * 
    * @param id
    * @return Código 204 sin contenido
    */
   @DeleteMapping("/producto/{id}")
   public ResponseEntity<?> borrarProducto(@PathVariable Long id) {
      productoRepositorio.deleteById(id);
      return ResponseEntity.noContent().build();
   }

}
```

#### Base

`Application`

```java
package com.openwebinars.rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

   public static void main(String[] args) {
      SpringApplication.run(Application.class, args);
   }

}
```

Hasta aquí este bloque donde hemos aprendido a crear nuestra primera API con Spring Boot en las siguientes lecciones trabajaremos con la gestión de errores.

# Contenido adicional 6

* [PDF Mi_primer_servicio_REST.pdf](pdfs/07_Mi_primer_servicio_REST.pdf)
* [PDF Puesta_en_marcha_de_la_aplicación.pdf](pdfs/08_Puesta_en_marcha_de_la_aplicación.pdf)
* [PDF Estructura_de_las_rutas.pdf](pdfs/09_Estructura_de_las_rutas.pdf)
* [PDF Algunas_clases_y_anotaciones.pdf](pdfs/10_Algunas_clases_y_anotaciones.pdf)
* [PDF Uso_del_patrón_DTO.pdf](pdfs/11_Uso_del_patrón_DTO.pdf)
* [PDF DTO_con_ModelMapper.pdf](pdfs/12_DTO_con_ModelMapper.pdf)
