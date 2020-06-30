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

Vamos a ver un ejemplo muy básico que vamos a ir desgranando poco a poco de hecho vamos a traernos el código completo y lo vamos a ir analizando para aprender los distintos elementos que lo componen y en las siguientes lecciones, poder crearlo por nuestra cuenta.

Ya digo desde esta web URL https://spring.io/guides/gs/rest-service/ que podemos visitar tendríamos la posibilidad si queréis lo podemos buscar en las guias este primero cómo construir un servicio web sera el que vayamos trabajando.

Para traernos el código desde Spring Tool Suite lo podríamos hacer así nos venimos a File - New - Import Spring Getting Started Content 

<img src="images/08-09.png">

y lo podríamos buscar aquí sería si buscamos `Rest Service`.

<img src="images/08-10.png">

y nos traemos solamente el código completo 

<img src="images/08-11.png">

le damos a Finish, nos importaría todo el proyecto `gs-rest-service-complete`, nos abre una ventana incluso con el tutorial.

<img src="images/08-12.png">

No nos va a hacer falta y tendríamos el código fuente disponible por aquí.

<img src="images/08-13.png">

<img src="images/08-03.png">

Vamos ir desgranandolo poquito a poco. Primero nos vamos a situar, ¿Qué es lo que vamos a hacer? vamos a implementar una aplicación de servidor que va a aceptar peticiones GET en una determinada ruta `/greeting` y que nos va a devolver un JSON como el de la transparencia. Un mensaje de respuesta que vas a tener un `id` que va a ser de tipo numérico un long y un mensaje en una cadena de caracteres petición-respuesta como hemos ido viendo y en una determinada URL devolveremos un JSON. 

<img src="images/08-04.png">

Si además le proporcionamos como parámetro opcional `name` este `/greeting` de manera que podríamos tener una URL como está `/greeting?name=User` cambiaremos en lugar de decir hola mundo haremos un hola usuario, de manera que lo podemos cambiar.

<img src="images/08-05.png">

La interacción cómo podemos ver va a ser hacer peticiones GET a `/greeting` y como respuesta deberíamos obtener un código 200 OK y en el cuerpo de la respuesta deberíamos tener un JSON como el que hemos visto antes, si pasamos `/greeting?name=User` pues obtendríamos el hello con el name en partícular. El objeto además llevará un id que veremos cómo se va incrementándo si hacemos más de una petición. 

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

Que para aquellos que tenga ya algunos conocimientos de Spring MVC llamara la atención que en lugar de ser con el `@Controller` esto ya lo comentamos también antes sera con `@RestController` esto es la combinación de `@Controller` y `@ResponseBody` tenemos también la versión con `@GetMapping` pero hay otra con `@RequestMapping` yo que tengo son SonarLint  me hace algunos análisis del código que voy poniendo y entonces no no invita que pongamos el código correcto por lo que `@RequestMapping` debería quedar así: `@RequestMapping(value = "/greeting", method = RequestMethod.GET)`, definitivamente la anotación `@GetMapping("/greeting")` es más comoda sea como fuere tendríamos que aceptar peticiones GET en una determinada URL que hara que se invoque este método. 

Además podemos ver como el método `greeting(@RequestParam(value = "name", defaultValue = "World") String name)` recibe un parámetro que será el parámetro `name` lo inyectamos con `@RequestParam` recogera de la parte `query` de la URL algo llamado `value = "name"` y lo inyectará en `name`, sino lo encuentra inyectara un valor por defecto `defaultValue = "World"` para poderlo utilizar en el método.  

Como deciamos como se devuelve JSON si el método lo que retorna es un objeto de tipo `Greeting`:

`return new Greeting(counter.incrementAndGet(), String.format(template, name));`

<img src="images/08-07.png">

Bueno podemos verlo por aquí.

<img src="images/08-08.png">

`@RestController` como hemos dicho es la combinación de `@Controller` + `@ResponseBody` y `@ResponseBody` lo que hace es que lo que se devuelve en el método como cuerpo de la respuesta, si recordáis el formato de los mensajes de respuesta como un cajón que tenía las cabeceras y el cuerpo, pues dentro del cuerpo lo que se hace es poner lo que nosotros devolvamos, lo que pasa, es que pasa antes por el filtro de un `HTTPMessageConverter` que lo que hace es transformarlo de un objeto Java a un objeto de tipo JSON, a una cadena de tipo JSON.

### Probando la Aplicación

Vamos a probar a ponerlo en ejecución la aplicación.

<img src="images/08-14.png">

Vemos como nuestra aplicación se ha lanzado.

<img src="images/08-15.png">

Ya estaría disponible en el puerto 8080 y en primera instancia podríamos comprobarlo desde el propio navegador con el URL `http://localhost:8080/greeting` y aquí tendríamos nuestro `Hello, World!`.

<img src="images/08-16.png">

Cómo podemos ver la creación de un servicio es bastante sencillo, solo necesitaríamos tener una clase controladora anotada con `@RestController` en la que tengamos algunos métodos anotado bien con `@RequestMapping` o `@GetMapping` y el método correspondiente cómo podría ser con `@GetMapping`, `@PostMapping`, `@PutMapping` o `@DeleteMapping` y en el cual pues podamos atender peticiones que recibirán o no alguna serie de argumentos y en la que podamos devolver valores que dentro de este método estamos devolviendo una clase Java que serán transformadas a través de un `HTTPMessageConverter`.

Aunque tengamos solamente el navegador y le damos a inspeccionar Network y recargamos podríamos ver que ha sucedido por aquí detrás y si pinchamos en greeting

<img src="images/08-17.png">

<img src="images/08-18.png">

<img src="images/08-19.png">

podemos ver como el navegador por detrás con esa petición GET ha enviado alguna serie de elementos y ha recibido la respuesta, tendríamos incluso los encabezados de la respuesta así como de la petición, como lo ha ido gestionando el propio navegador para que veamos que todo eso va sucediendo de verdad. todas las anotaciones que hemos visto antes se van utilizando tanto en peticiones como en respuestas, el tipo de contenido, la fecha, el código de estado 200 y lo ponen en verde como OK, lo que nosotros hemos enviado como parte de la petición para que veamos que esto ha sucedido conforme a nosotros lo hemos programado.

Podemos probar mandando un nombre con el URL `http://localhost:8080/greeting?name=Pedro` obtenemos.

<img src="images/08-20.png">

<img src="images/08-21.png">

<img src="images/08-22.png">

Hasta aquí nuestro primer servicio, vamos a ver ahora como con Postman como cliente en el lugar del propio navegador poder interactuar con nuestro API REST.

### :computer: Código Completo - gs-rest-service-complete -  143-02-API_REST

<img src="images/08-23.png">

*`pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.2.2.RELEASE</version>
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

* Botón de parada 
* Botón de relanzamiento de la aplicación
* Botón Relauch que resulta súper cómodo cuando estamos trabajando y si no estamos utilizando DevTools que no puede relanzar la aplicación con cambios de código para parar la aplicación y volverla a lanzar.

<img src="images/09-13.png">

<img src="images/09-02.png">

También podemos hacerlo desde una terminal y usando Maven para ejecutar la aplicación usando los siguientes comandos:

```sh
$ mvn clean
$ mvn install
$ mvn spring-boot:run
```

Tendríamos que estar en el directorio raíz de la aplicación y tener instalado Maven. 

<img src="images/09-10.png">

Con `mvn clean` hariamos alguna limpieza con cosas que no esten bien y con `mvn install` para realizar las descargas de las dependencias y todo lo que necesite. 

<img src="images/09-11.png">

Y con `mvn spring-boot:run` que nos permite ejecutar la aplicación sin necesidad de estar dentro del IDE, con el IDE apagado podríamos hacer estar puesta en marcha de la propia aplicación.

<img src="images/09-12.png">

Ya tenemos arrancada nuestra aplicación cuando deseemos detenerla bastaría pulsar Ctrl+C, sería más que suficiente.

Bueno ya que tenemos lanzada la aplicación desde la terminal con Maven vamos a consuimir nuestra API desde Postman.

Postman es muy cómodo nos permite en un sistema de pestañas poder consumir desde nuestra API REST, tendríamos que hacer algún tipo de petición poniendo el verbo, la URL y la ejecutamos.

<img src="images/09-03.png">

Y nos devolvería el resultado.

<img src="images/09-14.png">

Tenemos el botón + para poder crear nuevas peticiones añadiendo nuevas pestaña.

<img src="images/09-04.png">

Al ingresar el URL debemos presionar el botón Send para hacer la petición al Servidor.

<img src="images/09-06.png">

Se nos muestra la respuesta.

<img src="images/09-08.png">

La respuesta la podemos ver en diferentes formatos JSON, XML, HTML, Text y Auto  si el formato que no hubiera llegado no lo hubiera reconocido automáticamente podemos cambiarlo en el desplegable. Ademas tenemos una vista Pretty que pinta el JSON con formato, Raw lo muestra en crudo y algunas vistas más como Preview y Visualice pero la que se usa más es Pretty. 

Y a nivel de respuesta podemos ver el código de estado, tiempo que tarde en ejecutase, tamaño de respuesta, también podemos salvar la respuesta en un fichero.

<img src="images/09-09.png">

Tenemos una secció dónde podemos pasar diferentes parámetros a nuestra petición.

<img src="images/09-07.png">

Vamos abrir unanueva pestaña y lanzar la petición mandando el parámetro `name`.

<img src="images/09-15.png">

Si no queremos tener que escribir el parámetro directamente en la URL lo podríamos escribir en la sección `Query Params` indicando una Key/Value, en este caso name/Pedro.

Vemos como la respuesta donde saludamos a Pedro.

Podemos saludar a otra persona cambiando el valor de `name`.

<img src="images/09-17.png">

Las pestañas las podemos almacenar en la raíz o incluso si queremos gestionarlas en colecciones que se muestran a la izquierda. Al presionar Save sobre una pestaña se nos muestra la siguiente ventana:

<img src="images/09-16.png">

Donde le podemos dar un nombre a la petición de primeras pone la URL de la petición, le podemos añadir una descripción que incluso soporta Markdown, e indicarle en que colección la debe almacenar.

<img src="images/09-18.png">

<img src="images/09-19.png">

Y ya del lado izquierdo tenemos nuestra colección `143-API-REST-Con-Spring` con nuestras dos peticiones.

<img src="images/09-20.png">

Con esto ya podemos recuperarlas y ejecutarlas cuando volvamos a acceder a Postman sin necesidad de volver a crearlas y así si estamos desarrollando durante varios días, varias semana una serie de peticiones sobre una misma API la podemos dejar guardada y documentada de hecho estas colecciones también si queréis se pueden exportar se pueden compartir para que se la podéis pasar a gente si fuese necesario incluso llevarla desde un equipo a otro.

<img src="images/09-21.png">

También podemos trabajar con diferentes métodos, tenemos un desplegable para seleccionarlos.

<img src="images/09-05.png">

Para que en lugar de hacer peticiones GET poder hacer peticiones POST, PUT, PATCH, DELETE, etc. un montón de peticiones.

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

Hola a todos vamos a seguir con nuestro curso en el que estamos aprendiendo a desarrollar una API con Sprint Boot, a partir de esta lección vamos a desarrollar una API casi desde cero, os dejo un pequeño código base para no pararnos en cosas que ya hemos aprendido antes, vamos a partir de una estructura de un controlador que vamos a explicar y lo vamos a ir completando poco a poco.

<img src="images/10-02.png">

El ejemplo va a ser una especie de API de productos, vamos a gestionar una serie de productos simples, como campo van a tener un ID, el nombre del producto y el precio. Vamos a crear también un repositorio y vamos a insertar unos datos de ejemplo desde `data.sql`, ya digo esto este código de base ya lo vas a tener en el repositorio del curso para que no tengas que pararnos a crear la clase Modelo, el repositorio, para que no tengáis que hacer la creación de datos de ejemplo, cosas que si habéis visitado los otros cursos como por ejemplo el de Spring Boot y Spring Web se explica con mayor detenimiento, es cuestión de que nos parecemos en la capa de acceso a datos en esta parte, sino que nos vamos a centrar sobre todo en el controlador y en la parte más REST.

<img src="images/10-03.png">

Vamos a ver cómo mapear las rutas de nuestro controlador con las diferentes operaciones CRUD, en el fondo vamos hacer un CRUD de productos y entonces necesitamos para cada una de las operaciones CRUD hacer una determinada ruta en el controlador, esta estructura veréis que va a ser muy común si lo que necesitáis es generar CRUD y de hecho si trabajáis alguna vez con Spring Data REST veréis que no dista de la que genera automáticamente,

Dentro de CRUD la operación `Read` la de obtener datos la haremos a través de peticiones de tipo `GET` es decirme métodos del controlador que irán anotados con `@GetMapping` y como nosotros vamos a trabajar con productos la ruta de obtener todos los productos será una petición `@GetMapping("/producto")` lo vamos a poner en singular, tampoco sería demasiado dramático si lo pusieramos en plural, si queremos obtener un producto en particular lo haremos con su `id` y entonces será la ruta `@GetMapping("/producto/{id}")` el producto 1, el 2 el producto 114, ambas peticiones de tipo `GET`.

Para crear un producto lo que haremos será una petición de tipo POST anotada con `@PostMapping` a la propia ruta `/producto` es decir `@PostMapping("/producto")`.

<img src="images/10-04.png">

Para actualizar la petición de tipo UPDATE será con `Put` con una anotación `@PutMapping` y está usualmente aunque el `id` vaya dentro del objeto que le estamos pasando es muy habitual que se lo proporcionemos dentro de la ruta y entonces así lo vamos a hacer con `@PutMapping("/producto/{id}")` 

La estructura sería la misma para la petición de borrado sería con un deleite mapping y también sería con la anotación `@DeleteMapping` completa tendríamos `@DeleteMapping("/producto/{id}")`.

<img src="images/10-05.png">

Algunas notaciones que vamos a usar para que no nos suenen raro y que las reconozcamos sería la anotación `@RequestBody` que nos va a permitir inyectar el cuerpo de la petición en un objeto, es decir nos enviara una petición, aquello trae datos y hemos visto que cuando nosotros en una petición GET devolvemos algo en el cuerpo el `HTTPMessageConverter` transforma nuestro objeto Java en un JSON, pero ahora lo necesitamos a la hora de recibirlo, vamos a recibir una petición en la cual se va a enviar un JSON y vamos a necesitar sacar ese JSON como un objeto Java para poder interactuar con nuestro repositorio y almacenarlo en  la base de datos.

Hasta aquí ya nos podemos venir a nuestro código vamos al proyecto base lo vamos a copiar y pegar del repositorio y le vamos a asignar el nombre `143-03-09_EstructuraRutas`.

<img src="images/10-07.png">

Tenemos nuestro archivo `pom.xml`.

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
	<artifactId>143-03-09_EstructuraRutas</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>143-03-09_EstructuraRutas</name>
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

En esta clase `Producto` usamos Lombok lo cual la hace muy sencilla con una `id` y ya sabéis que Spring Data JPA nos permite tener estas anotación `@Id @GeneratedValue` y que tiene que tener `@Entity` para que sea una auténtica entidad, las demás anotaciones `@Data @NoArgsConstructor @AllArgsConstructor` son de Lombok. Vemos cómo tiene los atributos `id`, `nombre` y `precio`.

*`ProductoRepositorio`*

```java
package com.openwebinars.rest.modelo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepositorio extends JpaRepository<Producto, Long> {

}
```

El repositorio es sencillo no vamos a necesitar ninguna consulta rara para hacerlo, entiende a los repositorios de `JpaRepository`.

*`ProductoRepositorio`*

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

Bueno pues por lo pronto lo que necesitamos aquí es obtener el repositorio que lo tenemos declarado con la línea `private final ProductoRepositorio productoRepositorio;` aque ahora iremos utilizando.

Fijarnos que no hemos utilizado la anotación `@Autowire` ni nada, Lombok nos permite también anotar con la anotación `@RequiredArgsConstructor` un controlador y como este repositorio no se va a haber modificado, lo podemos declarar como final y directamente cuando se instancie el Bean se autoinyectaran las dependencias y lo hacemos de una manera limpia y utilizándo Lombok.


```java
@RestController
@RequiredArgsConstructor
public class ProductoController {

   private final ProductoRepositorio productoRepositorio;
   
   ....
   
```

También contamos dentro de los recursos contamos con el archivo `data.sql` con el siguiente contenido.

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

Como `findById` devuelve un opcional y no nos vamos a poner a manejar los errores, sino lo encuentra usamos `orElse(null)` para mandar un nulo.

Con estas dos peticiones modificadas ya podemos probarlas con Postman e ir haciendo peticiones a estos URL.

<img src="images/10-08.png">

<img src="images/10-09.png">

Empezamos por hacer una petición a `http://localhost:8080/producto`.

<img src="images/10-10.png">

En la cual obtenemos un código 200 OK y todos los productos que tenemos ahora mismo en la base de datos que son 30.

Si hacemos la petición para obtener un solo producto `http://localhost:8080/producto/3`.

<img src="images/10-11.png">

Nos devuelve solamente el producto con el `id` indicado.

Si hacemos la petición de un producto que no existe `http://localhost:8080/producto/31`.

<img src="images/10-12.png">

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

Tendríamos que hacer una petición a `http://localhost:8080/producto/` y tendríamos que usar el verbo POST, y para enviar datos en el cuerpo tenemos que irnos a Body - raw - JSON y mandar los datos de nuestro producto en formato JSON. El `id` se autogenera, necesitariamos mandar un nombre y precio de nuestro producto.

<img src="images/10-13.png">

Al enviar la petición nos indica que se ha generado un nuevo Producto con un `id` 31 y vemos también algo que tendremos que gestionar después y es el código de respuesta en este caso nos a devuelto 200 OK que esta más asociado a obtener un recurso, el 101 esta más asociado a la creación de un nuevo recurso, veremos como hacerlo en siguientes lecciones. 

<img src="images/10-14.png">

Nos faltaría el método `editarProducto(@RequestBody Producto editar, @PathVariable Long id)` para editar un producto.

```java
   @PutMapping("/producto/{id}")
   public Producto editarProducto(@RequestBody Producto editar, @PathVariable Long id) {
      // Vamos a modificar este código
      return null;
   }
```

Tendríamos diferentes de hacerlo lo haremos de una manera muy sencilla 

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

Vamos a relanzar la aplicación y probar a modificar el `Jamón de Bellota` para que sea un `Jamón Ibérico de Bellota`. En este caso usamos el verbo PUT con el URL `http://localhost:8080/producto/31` y con el Body

```html
{
   "nombre": "Jamón Ibérico de Bellota",
   "precio": 1234
}
```

<img src="images/10-15.png">

<img src="images/10-16.png">

Obtenemos los datos del Producto actualizado.

**NOTA**: Como estamos relanzando de nuevo la aplicación es necesario rimero volver a insertar el Producto 31 antes de quererlo modificar, por que cada que se relanza la aplicación se vuelve a inicializar la base de datos.


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

<img src="images/10-17.png">

A la hora de enviar nos regresa como respuesta el objeto eliminado, si lo solicitamos con un GET veremos que el producto realmente ya no existe.

<img src="images/10-18.png">

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

<img src="images/10-20.png">

<img src="images/10-06.png">

¿Qué nos faltaría entonces? Nos falta manejar correctamente los cóigos de respuesta, las peticiones de creación deberían devolver un 201, las peticiones que no encuentren un recurso 
deberían devolver un 404, si la petición de borrado devuelve datos esta bien que devuelva un 200 pero si no devuelve datos deveria devolver un 204 que es vacío, todo eso lo haremos en las próximas lecciones donde iremos modificando este código poco a poco.

### :computer: Código Completo - 143-03-09_EstructuraRutas

<img src="images/10-19.png">

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
	<artifactId>143-03-09_EstructuraRutas</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>143-03-09_EstructuraRutas</name>
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

```
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

Vamos a seguir mejorando nuestra aplicación y para ello vamos a volver a recordar y vamos a ver cómo funciona en algunas clases y anotaciones.

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

Nos venimos por aquí sobre el proyecto de antes voy a hacer una nueva copia para que tengamos el código lo más organizado posible, lo hemos llamado `143-04-11_Clases_Anotaciones`. Nos vamos al controlador que es donde vamos a hincar el diente y vamos a ir haciendo una serie de modificaciones.

Nosotros antes hemos devuelto directamente el `findAll()` del repositorio de productos.

```java
@GetMapping("/producto")
public List<Producto> obtenerTodos() {
   return productoRepositorio.findAll();
}
```

En este caso lo que vamos a hacer es que lo vamos a guardar en una lista, la podemos llamar por ejemplo `result` de resultado y lo que vamos a hacer es que si la lista está vacía lo que vamos a tratar es de devolver una respuesta y si la lista tiene elementos devolvemos otra. Si la lista tiene elementos podríamos devolver directamente la lista, pero si la lista no tiene elementos vamos a querer devolver una instancia de `ResponseEntity` en la que vemos que tiene una serie de métodos como por ejemplo `notFound()` en la que directamente nos construye un `ResponseEntity` con código 404 y que faltaría para construirlo llamar a `builder()`. 

<img src="images/11-06.png">

Que pasa, que en este caso queríamos devolver un `ResponseEntity` y aquí un `result` que es de tipo `List<Producto>` tenemos una poca de discordia, lo que podemos hacer es refactorizando la firma método para que devuelva un `ResponseEntity` en este caso de algo `?` en caso de que `result` este vacío será con el cuerpo vacío y si no con un ok pasándole el resultado como cuerpo.

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

Podemos comprobar que sigue funcionando, para el 404 haremos la comprobación con un producto que es más cómodo, si no tendríamos que borrar todo lo que tengamos en la base de datos.

Arrancamos el proyecto y desde Postman hacemos una petición GET con el URL `http://localhost:8080/producto`

<img src="images/11-08.png">

Podemos ver como ahora nos está devolviendo 200 OK, si limpiaramos la base de datos o comentáramos el `data.sql` podríamos ver cómo no nos devolvería ninguno.

A la hora de buscar uno lo que hacíamos era esto:

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

Vemos cómo nos devuelve un código 404 Not Found, qué significa que no ha encontrado el recurso, es bastante más conveniente, aquellos programadores que utilicen nuestra API y que hagan una petición de búsqueda si reciben un 404 como respuesta sabrán que tendrán que mostrarle al usuarios que no se ha encontrado el recurso o tendrán que hacer otro tipo de mecanismo.

Si nos vamos a la petición de `@PostMapping` actualmente tenemos:

```java
@PostMapping("/producto")
public Producto nuevoProducto(@RequestBody Producto nuevo) {
   return productoRepositorio.save(nuevo);
}
```

Aquí tenemos varias alternativa, podemos recoger el producto en un nuevo producto y tendríamos la posibilidad, existe el método `created`, el problema está en lo siguiente, lo normal es que `REST` nos invita que cuando se haga una petición POST para crear un recurso además de devolver un 201, se devuelva la URI dónde podemos consultar ese producto, lo podríamos hacer aquí a través de una base hardcodeada de la URL y añadiendo el id del nuevo producto, realmente no se hace así, se hace a través de utilizar unas clases que permiten manejar la URI extraer una parte incluso desde un servlet o desde una petición y construirla convenientemente, como no nos vamos a parar a esa parte ahora, para aprender también que podemos hacerlo, podemos crear una nueva petición donde el código de estado lo pasemos o bien con un número o a través de las constantes de una enumeración qué en este caso es `HttpStatus.CREATED` y devolveremos el objeto salvado en el cuerpo, también devolveremos un `ResponseEntity` en este caso puede ser de Producto.

```java
@PostMapping("/producto")
public ResponseEntity<Producto> nuevoProducto(@RequestBody Producto nuevo) {
   Producto saved = productoRepositorio.save(nuevo);
   return ResponseEntity.status(HttpStatus.CREATED).body(saved);
}
```

Podríamos recargar y crear un nuevo Producto con Postman.

<img src="images/11-11.png">

Ahora ya está el producto jamón de bellota ya se encuentra vemos como nos devuelve como código de estado 201 Created se ha creado un nuevo recurso. 

Si a la hora tampoco lo vamos a programar ahora mismo, pero si a la hora de crear el nuevo producto hubiera algún tipo de fallo por ejemplo que el nombre no lo mandaramos y fuera obligatorio podríamos devolver a lo mejor un código 400 de peticion erronea.

Si nos vamos a la petición de `@PutMapping` actualmente tenemos:

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

Podemos cambiar el código para que en lugar de hacerse de esta manera se hiciera de una manera un poco más conveniente, devolver un `ResponseEntity`, sabemos que el `productoRepositorio` tiene un método `findById(id)` y que devuelve un `Optional`, `Optional` tiene un método fantástico `map` que nos va a permitir transformar el objeto en otro objeto y si no lo encuentra nos devolvera otra cosa que ya veremos la que será.

<img src="images/11-12.png">

Por lo pronto esto será lo que se devuelva lo que devolvamos aquí dentro será el producto editado y dentro del Else ya lo podemos ir viendo, si no ha encontrado el producto lo que hacemos es devolver `return ResponseEntity.notfound().build();` y en el otro caso lo que vamos a ir haciendo es que el nombre y precio del producto será el que hemos pasado y después de editar todo el producto tendríamos que devolverlo. 

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

En el Map devolvemos un `ResponseEntity` del producto ya almacenado porque lo estamos almacenando con `productoRepositorio.save(p)` con código `ok` 200 OK y el código y el producto modificado que es lo que vamos buscando y si no lo que se devuelve sería un `notFound()` porque no lo hemos encontrado, el comportamiento que andábamos buscando.

Relanzamos la aplicación y probamos nuevamente con Postman.

<img src="images/11-13.png">

Nuestro jamón de bellota lo transformamos a ibérico de bellota y vemos que sucede lo mismo, si lo que quisiéramos transformar el producto 33 que no existe nos devolvería de nuevo un 404 qué es lo que hablamos.

<img src="images/11-14.png">


por último a la hora de modificar como hemos dicho que ya no vamos a querer devolver lo podríamos hacer vale nos podríamos casi que quitar todo este código vamos delete eBay aire repasamos el líder y aquí si podemos hacer una devolución hemos creado el 31 y ahora vamos a borrarlo y nos devolvería vacío pero no devuelve el código correcto que es 204 y así hemos completado nuestra API para que los códigos de retorno que vamos teniendo se vayan acercando a lo que debería

# 12 Uso del patrón Data Transfer Object (DTO) 11:25 

[PDF Uso_del_patrón_DTO.pdf](pdfs/11_Uso_del_patrón_DTO.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/12-01.png">
<img src="images/12-02.png">
<img src="images/12-03.png">
<img src="images/12-04.png">
<img src="images/12-05.png">
<img src="images/12-06.png">
<img src="images/12-07.png">
<img src="images/12-08.png">
<img src="images/12-09.png">
<img src="images/12-10.png">
<img src="images/12-11.png">

Hola a todos en esta lección vamos a aprender que eso de dataTransfer hostia o el patrón de Teo hablemos primero de las entidades para nosotros la entidades son clases cada con algunas anotaciones más una serie de requisitos y son entidades dejaba de JP perdón de la versión 2.0 tienen que cumplir una serie de requisitos debe tener un constructor sin argumentos y pueden tener otros constructores el constructor sin argumentos debe ser público o protegido que solo tienen que cumplir debe tener una clase de nivel superior aunque sea hostia no puede ser una enumeración o una interfaz la clase tira no debe ser fina ni debería serlo ningún método o variable de instancia persistente de dicha clase entidad se va a pasar por valor como un objeto separados por ejemplo a través de una interfaz remota debería ser además serializable pueden ser clase abstracta o concreta las entidades pueden ampliar clases que no son de entidad pueden extender de una clase que no se necesidad etcétera etcétera con lo cual vemos que para hacer entidad no vale cualquiera tiene que cumplir una serie de requisitos y además tienen una misión específica qué es modelar nuestro objeto en la capa de la lógica de negocio y como venimos haciendo un ejemplo tenemos una tienda de productos pues tendrían que modelar lo que nosotros allí cenamos productos-venta cliente etcétera entidades que son clases Java que son cómodas y que hemos adelgazado con los ojos es bueno utilizar la en el resto de capa la respuesta siempre será la del gallero depende pero sin embargo los expertos dicen que no es buena práctica vale el usar neceseres qué es buena práctica no usar la entidad en el resto de capas dejaremos para la lógica de negocio las entidades y en otras capas podremos utilizar otro tipo de clase como por ejemplo la chata transferencia se tratan de objetos pollo de aquellos plain old Java object que agrupan datos de la capa de negocio y qué sirven para hacer transferencias de datos entre diferentes capas incluso entre diferentes sistemas en cuenta que un bebé puede tener parte de los datos de una sola entidad a tener algunos datos de más de una entidad de varias entidades aglutinar varios datos o incluso los todos los datos de varias entidades en la literatura no podemos encontrar como DT o en ocasiones o como palio o qué y está pensado para aligerar las transacciones entre cliente y servidor si por ejemplo necesitamos en nuestra aplicación cliente pintar todos los datos de varias entidades a la vez de hacer un cliente con sus datos personales que podría hacer otra con sus posibles direcciones pensar por ejemplo en vuestra ficha de cliente en Amazon en la que podéis tener varias direcciones diferentes posiblemente eso sean distintas instancias de clase entidad en la parte de la lógica de negocio podríamos aglutinar todas ellas en un solo deseo para que solamente tuviéramos que hacer una petición GET llevar a una sola respuesta y así aligera haríamos la comunicación entre nuestra aplicación cliente y no es gratis aunque el objeto sea un poco más pesado siempre será bueno siempre no tendríamos que analizar caso a caso pero usualmente es mejor hacer una sola petición de un objeto que está un pelín más pesado que el hacer múltiples peticiones para traer los datos de usuario y una dirección u otra dirección otra dirección y otra dirección si tuviéramos al menos 4 No hola a todos en el bar de queso de cabra pero el patrón de Teo de la entidad para nosotros la entidad de Sonic las acaba con alguna anotaciones más de hecho cumple en una serie de requisitos si son entidades dejaba semejante JP a ver donde la versión 2.0 tiene que cumplir una serie requisitos me pueden tener otro coche por el culo sin argumentos debe ser público Protegidos imaginaos que aumentamos el número de clase en otro modelo y tenemos producto y categoría y queremos pintar los productos en una aplicación cliente y para ello vamos a pintar pues todos los productos en una serie de paneles o en una lista donde queremos con él vamos estamos en el producto a lo mejor para montar la URL para poder ver la ficha completa el nombre el precio y la categoría pero no necesitamos el objeto categoría entero solamente necesitamos el nombre podremos cumplir un deseo que como veías lutín aparte de los datos de más de una entidad como los debemos usar y dónde en nuestro ejemplo el del catálogo de productos dónde lo podríamos usar pues por ejemplo lo podríamos utilizar en las peticiones get de producto vale y también en que te producto de uno solo picado en el game de producto el listado de productos de todos los productos posiblemente vaya oriental como decíamos antes a visualizarlo en una aplicación cliente en una página vale una pantalla donde se vean todos los productos posiblemente no queramos ni siquiera verlos todos porque usamos página 100 no pero que lo viéramos todos no queremos ver todos los datos de un producto ahí sería un buen escenario para que construyera un deseo que nos permitirá obtener solamente unos cuantos datos del producto netamente los que vayamos a utilizar para amistad no sería muy inteligente que enviarnos un objetos muy pesados y luego solamente utilizaras moto el gasto preferible que tengamos de Teo y hemos estrictamente los datos que vayamos a utilizar en el caso de obtener los datos de un solo producto si queremos dar todos los datos porque estamos haciendo una búsqueda por ebay y esto sería como la ficha del producto pues bueno no usaremos el de tu anterior qué alternativas tenemos no usar de Teo y usar la entidad o crear un DT o otro específico para esta pantalla de aquí aquí pues ya iremos manejando nos con alternativa esto de que haya para un mismo objeto más de un DT o será algo normal ya veremos cuando en próximo curso trabajemos con la seguridad como un ejemplo clásico es el usuario podemos tener para un usuario una entidad que será la que guardaremos nuestra base de datos que tengo un conjunto de datos y ahora va todo lo mejor del usuario que no sea persistente y otro que si alguno incluso lo guardaremos de una determinada manera con la contraseña que además la guardamos cifrada sin embargo en la capa de seguridad con Spring Security tendremos una clase que tendrá que tener por fuerza una serie de atributos alguno de ellos podemos creer que sean persistente y otros que no pero ahí no necesitaremos e incluso podremos tener distintos bt21 para crear usuario a lo mejor en la petición de creación no interesa que recogiendo lo que va enviar un formulario fue para poder validar si la contraseña es correcta se envié pues los dos campos de escriba la contraseña y vuelve a escribirlo para que se envía al servidor y la validación sacan servidor cosa que no tendríamos que almacenar doblemente la contraseña o un getuser vete para peticiones de tipo que donde no iríamos por ejemplo la contraseña y podríamos seleccionar unos pocos datos del usuario que serían los que tendríamos para ver en una petición de tipo qué es decir que no será raro que tengamos diferentes heteos dentro de una misma red o asociado a una misma clase desde un Business Object meteo es un patrón de diseño que tiene sus defensores y también sus detractores de hecho tendréis que plantearlo en cada proyecto en los equipos de trabajo que estéis la forma más adecuada de transporte transportar los datos entre las diferentes capas de nuestra aplicación sobre todo entre cliente y servidor doy algunas pistas por si las queréis utilizar os recomendaré no ofrecer más datos de los debidos en una respuesta a una petición pero también no abusar del DT o creando uno para cada tipo de petición vale porque si no es posible que tengamos Dalt amalgama de clase que no sepamos cuál es la que corresponde en determinado momento Desirée un pequeño matrimonio entre estas dos opciones no volvernos locos creando clase pero no enviando una cantidad ingente de datos que no vamos a utilizar cómo podemos implementar Meteor tenemos diferentes mecanismos uno es manualmente y como bueno pues nosotros podríamos instanciar un objeto y nos encargamos de haciendo que hice asignar los datos me duele un poco


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
<img src="images/13-02.png">
<img src="images/13-03.png">
<img src="images/13-04.png">
<img src="images/13-05.png">
<img src="images/13-06.png">
<img src="images/13-07.png">
<img src="images/13-08.png">

Hola a todos vamos a aprender a implementar el patrón data Transfer Object de Theo con modelmapper primero vamos a empezar viendo que es eso de modelmapper hemos visto en la lección anterior que para poder transformar un objeto de negocio en desde o viceversa podremos hacer manualmente o con modelmapper modelmapper nos va a permitir evitar código muy repetitivo ya que nos va a facilitar la creación de tejidos mediante una asignación dinámica vale de hecho lo que va a buscar aplicar una serie de pequeñas regla inteligente para hacer la transformación pero también nos va a ofrecer la posibilidad de configurar cómo se va a hacer la asignación entre objetos para usar modelmapper tan solo tendríamos que añadir esta dependencia con la versión más actualizada que quisiéramos tener dentro de nuestro Po y como configuración básica para poder utilizarla ya dónde lo necesitemos podríamos crear un bin que nos devuelva el Hypoderma por el objeto nuclear que va a hacer las transformaciones para para poder utilizarlo allá donde lo necesitemos no hacer nuestro de Teo electro de Teo va a hacer una clase muy sencilla que tercer y algo no podemos añadir algo por algún tipo de constructor o Builder constructor por defecto que tiene creado podríamos necesitando y que va a tener solamente leader el nombre y el nombre de la categoría vamos a comprobar como en el proyecto va a ser que tenéis ya he añadido una clase modelo de categoría vale se añaden algunas categorías a la base de datos los productos tienen enlazadas categoría para que no nos perdamos en detalle asociado a spring data JP a las entidades a esta parte del modelo y nos sentemos no sé tenemos solamente enfrentó nuestra clase va a hacer esta vamos a tener el líder el nombre y el nombre de la categoría un posible candidato por ejemplo para tener el listado de producto para un cliente que a lo mejor nos hubiera logueado en el sistema y que no puede ver los precios no es que por ejemplo nuestro sistema funciona como una posible idea dónde vamos a hacer la transformación hacia nuestro deseo bueno pues físicamente la podríamos hacer toda esa transformación modelmapper en el controlador de hecho encontraré en algún ejemplo de algún autor es conocido que se apellida ejemplo nosotros lo que vamos a hacer es crear un componente independiente la transformación de un objeto en otro y inyectar este componente allá donde no necesiten el componente podría ser como es picados que sería una clase con arroba components no llega quizás servicio es simplemente un componente de utilidad dónde utilizando el modelmapper va a hacer la construcción de un producto de Teo a partir de un producto va a ser así de sencillo dentro de un controlador por ejemplo de todos los productos que no te queremos hacer la transformación podríamos tener la lista de todos y hacer esta conversión aprovechando el API string eso sí lo podríamos hacer aquí ya no porque a partir de la capa de acceso a datos tenemos todos los productos y los procesamos aquí mismo 11 pero a través del API string con más vale ya vamos llamando al conversor de Vete o construye por cada producto un producto de Teo lo almacenamos y es lo que me volveríamos entonces a nuestro cliente vale vamos a hacer esto nuestro proyecto como decía tenemos por aquí el proyecto bajo vale implementación de Teo base vamos a hacer copia para poder trabajar con tranquilidad nombre para que no haya problema y lo primero que hacemos en el Pou es añadir la dependencia de modelmapper vale vamos añadir la dependencia paper artifacts y de ferias modelmapper y la versión en este caso sí que la tenemos que añadir vale ya tendríamos modelmapper y miramos en las dependencias Maiden por aquí debe aparecer vale lo siguiente que vamos a hacer es dentro de nuestro código vamos a crear un paquete de configuración y dentro una en un alarde de imaginación me lo he puesto en una mezcla de español y en mi configuración anotadas con configuration vale y aquí es donde vamos a crear el bean dónde vamos a poner modelo más moderno centro podemos hacer creando directamente la clase

# Contenido adicional 6

* [PDF Mi_primer_servicio_REST.pdf](pdfs/07_Mi_primer_servicio_REST.pdf)
* [PDF Puesta_en_marcha_de_la_aplicación.pdf](pdfs/08_Puesta_en_marcha_de_la_aplicación.pdf)
* [PDF Estructura_de_las_rutas.pdf](pdfs/09_Estructura_de_las_rutas.pdf)
* [PDF Algunas_clases_y_anotaciones.pdf](pdfs/10_Algunas_clases_y_anotaciones.pdf)
* [PDF Uso_del_patrón_DTO.pdf](pdfs/11_Uso_del_patrón_DTO.pdf)
* [PDF DTO_con_ModelMapper.pdf](pdfs/12_DTO_con_ModelMapper.pdf)
