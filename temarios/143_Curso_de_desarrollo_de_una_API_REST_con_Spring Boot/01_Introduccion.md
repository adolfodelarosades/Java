# 1. Introducción 60m

* 01 Presentación 6:01 
* 02 ¿Qué es un servicio REST? 15:06 
* 03 Protocolo HTTP 7:37 
* 04 Algunos elementos de HTTP 7:57 
* 05 Nuestro entorno de desarrollo 9:34 
* 06 Uso de la librería Lombok 7:22 
* 07 Soporte de Spring Boot para servicios REST 6:34 
* Contenido adicional  7

# 01 Presentación 6:01 

[PDF Presentacion.pdf](pdfs/00._Presentacion.pdf)

## Resumen Profesor

No existe.

## Transcripción

<img src="images/01-01.png">

Hola a todos y bienvenido a este curso en el que vas a aprender a desarrollar un API REST con Spring Boot. 

<img src="images/01-02.png">

Antes de nada me gustaría comentaros los requisitos que serían deseables para poder realizar con garantía este curso, es muy bueno que podáis manejar con algunos conceptos de Spring, sobre todo de la parte de podríamos llamar del nucleo, lo qué es el contenedor de inversión de control, inyección de dependencia, sino lo conocer podéis visitar nuestro curso de Spring Core.

También sería muy bueno que ya manejaran algún concepto de Modelo Vista Controlador controladores, servicios que lo podéis también aprender si sino no pensáis que tengáis demasiadas solvencia en nuestro curso de Spring Boot y Spring Web MVC.

Cómo es natural pues para poder hacerlo bien es bueno que tengáis conocimiento de Java si queréis también por repasar incluso puedes visitar nuestros cursos de Java 8 desde cero si lo consideráis necesario o si no el de Java 8 para programadores Java.

Y también aunque no es estrictamente imprescindible porque el modelo de datos que vamos a manejar en este curso va a ser muy sencillo pero es recomendable tener conocimientos de JPA en particular de la capa de encima que utiliza Spring es decir Spring Data JPA y para ello también si visita el curso de JPA e Hibernate o el de Spring Framework podran trabajarlo adecuadamente.

<img src="images/01-03.png">

Que vamos a aprender en este curso, vamos a aprender bastantes conceptos que nos van a servir para apuntalar qué es eso del mundillo REST y como implementar nuestras APIs con Spring Boots, principalmente empezaremos aprendiendo qué es la arquitectura REST, en qué está basada, a nivel de protocolo en qué consiste el protocolo HTTP y cómo lo podemos utilizar para implementar sistemas que siguen esta arquitectura. Generar un proyecto de Spring Boot para tener un API REST. Utilizar algunas librerías de utilidad como Lombok que nos van a hacer la vida bastante más fácil. Cuál sería la estructura de un controlador REST que va a diferir mínimamente con respecto a lo que sería un controlador de una aplicación MVC de Spring.

<img src="images/01-04.png">

En qué consiste eso del patrón  *Data Transfer Object*. Cómo manejar errores y excepciones dentro de nuestra API REST. Y también veremos al final cómo subir ficheros no solamente enviar información, ya veremos en un formato conocido como JSON practicamente siempre sino también poder subir ficheros y cómo documentar nuestra API con con una herramienta que se llama *Swagger*. 

Todo eso es lo que vamos a aprender.

<img src="images/01-05.png">

Lo estructuraremos aproximadamente en 6 bloques en el cual cada uno de ellos habrá una serie de lecciones, el primero será más de introducción para conocer eso del patrón REST, del protocolo HTTP y algunos elementos más a partir de ahí desarrollaremos nuestra primera API REST con Spring Boot, después aprenderemos a hacer el manejo de errores y excepciones de la forma más conveniente veremos que tenemos diferente alternativa algunas que vienen desde Sprint 3, otras que se propusieron en Spring 4 alguna que se ha propuesto desde Spring 5. Cómo manejar qué es, en qué consiste eso del *CORS* y cómo poder manejarlo. La subida de ficheros y cómo documentar nuestra API.

<img src="images/01-06.png">

Con respecto a la práctica, no será un curso nada teóricos sera muy práctico en cada lección, en casi todas las lecciones iremos desarrollando algo de código, de hecho poco a poco iremos construyendo un proyecto de un API REST que integre todos los contenidos que hemos visto antes y en casi todas las lecciones además encontrará un pequeño reto para complementar todo lo que hemos ido desarrollando en cada una de las lecciones.

<img src="images/01-07.png">

Una vez que termine este curso puede hacer alguno de otro de los cursos que tenemos en el catálogo, si aún no lo ha hecho porque bueno tuvieras algún tipo de conocimiento y te hayan lanzado a la piscina pero quiere apuntalar sus conocimientos sobre Spring puede hacer el curso de Spring Core o el de Spring Boot y Spring MVC, si quieres mejorar tu conocimiento a nivel de la capa de acceso a datos de persistencia de datos el de JPA e Hibernate, si quieres aprender a interactuar mejor con tu API, para hacer consultas, pruebas, incluso para mejorar el desarrollo de la misma puedes hacer el curso de Postman, si quieres aprender a empezar a desarrollar una pequeña aplicación con Android que sea capaz de interactuar con nuestra API REST desarrollada en Spring Boot puede hacer el curso de cómo consumir datos de una API con Android usando Retrofit2 y si quieres empezar a tener conocimiento sobre cómo coger nuestra aplicación y gestionarla a través de contenedores también podría hacer el curso de introducción a Docker

# 02 ¿Qué es un servicio REST? 15:06 

[PDF Qué_es_un_servicio_REST.pdf](pdfs/01_Qué_es_un_servicio_REST.pdf)

## Resumen Profesor

### Roy Fielding

Este autor fue quién propuso la arquitectura REST en su tesis doctoral. Si quieres acceder a ella, pincha [aquí](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm).

## Transcripción

# 03 Protocolo HTTP 7:37 

[PDF 02_HTTP.pdf](pdfs/02_HTTP.pdf)

## Resumen Profesor

### Códigos de respuesta

Podemos encontrar un listado exhaustivo de códigos de respuesta y su motivo en castellano en la documentación de desarrolladores de mozilla: https://developer.mozilla.org/es/docs/Web/HTTP/Status.

## Transcripción

# 04 Algunos elementos de HTTP 7:57 

[PDF Algunos_elementos_de_HTTP.pdf](pdfs/03_Algunos_elementos_de_HTTP.pdf)

## Resumen Profesor

### Verbos HTTP

Podemos encontrar un listado exhaustivo de métodos o verbos de HTTP en castellano en la documentación de desarrolladores de mozilla: https://developer.mozilla.org/es/docs/Web/HTTP/Methods.

### Encabezados o cabeceras

También podemos encontrar un listado exhaustivo de encabezados o cabeceras de HTTP en castellano en la documentación de desarrolladores de mozilla: https://developer.mozilla.org/es/docs/Web/HTTP/Headers.

## Transcripción

# 05 Nuestro entorno de desarrollo 9:34 

[PDF Nuestro_entorno.pdf](pdfs/04_Nuestro_entorno.pdf)

## Resumen Profesor

### Spring Tool Suite

Puedes encontrar el bundle de eclipse y Spring Tool Suite para tu sistema operativo favorito aquí: https://spring.io/tools.

### SdkMan

Si quieres, puedes utilizar SdkMan para gestionar múltiples versiones de Java. Para instalarlo, solo tienes que ejecutar este comando desde un terminal:

```sh
curl -s "https://get.sdkman.io" | bash
```

Más información en https://sdkman.io/.

### Postman

Puedes encontrar el instalable de Postman para tu sistema operativo favorito aquí: https://www.getpostman.com/downloads/.

### cURL

Si eres más de consola, cURL será tu aplicación de cabecera para probar tus apis. Puedes instalarlo siguiendo estas instrucciones:

### Ubuntu

```sh
sudo apt-get update
sudo apt-get install curl
curl --version
```

### MacOs

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install curl
```

### Windows

Acceder a https://curl.haxx.se y descargar la versión más adecuada a tu versión de Windows (32 o 64 bits).

### Minitutorial de uso

A continuación, te dejo las instrucciones más básicas para hacer uso de *cURL*.

*El servidor donde hacemos las peticiones es un servidor que podríamos llamar dummy, y que sirve para probar el uso de diferentes peticiones REST.*

### Petición GET - Modo verboso

```sh
curl -v https://jsonplaceholder.typicode.com/posts
```

### Petición POST

```sh
curl -d 'usedId=1&title=Hola&body=mundo' https://jsonplaceholder.typicode.com/posts
```

Si queremos enviar JSON, podemos crear un fichero (request.json) con el cuerpo de la petición:

```js
{
    "userId": 1,
    "title": "Hola Mundo",
    "body": "Este es un ejemplo de petición POST con curl"
}
````

```sh
curl -d @request.json -H "Content-Type: application/json" https://jsonplaceholder.typicode.com/posts
```

### Petición PUT

Tenemos que añadir la opción `-X PUT`. Por ejemplo, modificamos `request.json` con el siguiente contenido:

```js
{
    "userId": 1,
    "title": "Hola Mundo",
    "body": "Este es un ejemplo de petición PUT con curl",
    "id": 24
}
```

```sh
curl -d @request.json -H "Content-Type: application/json" -X PUT https://jsonplaceholder.typicode.com/posts/24
```

### Petición DELETE

```sh
curl -X DELETE https://jsonplaceholder.typicode.com/posts/24
```

## Transcripción

# 06 Uso de la librería Lombok 7:22 

[PDF Project_Lombok.pdf](pdfs/05_Project_Lombok.pdf)

## Resumen Profesor

### Instalación

Según su propia web https://projectlombok.org/, *Lombok* es una librería de Java que se conecta automáticamente a nuestro IDE y crea herramientas, *condimentando* nuestro código. Nunca volveremos a escribir otro método *getter* o *equals*; con una anotación nuestras clases tendrán un generador con todas las funciones.

Para instalarlo, tan solo tenemos que descargar la última versión en https://projectlombok.org/download y ejecutarlo (haciendo doble click o mediante un terminal a través de `java -jar lombok.jar`).

<img src="images/lombok2.png">

Aparecerá entonces un asistente en el que se listarán las instancias de eclipse (o sus derivados) instalados en el sistema. Si no aparece la instalación deseada, la podemos buscar pulsando el botón *Specify location*. Para terminar la instalación, pulsaremos el botón *Install/Update*.

### Uso

Spring Tool Suite nos permite añadir la dependencia desde el asistente de *starters*.

Si lo tenemos que hacer *a mano*, debemos incluir nuestro `pom.xml`:

```html
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.18.10</version>
    <scope>provided</scope>
</dependency>
```

En proyectos de Spring Boot, la versión no es necesario indicarla.

### Anotaciones más usuales

Las anotaciones más usuales de lombok son:

* `@Getter`: a nivel de clase, genera un método *getter* para todos los atributos de la clase.
* `@Setter`: a nivel de clase, genera un método *setter* para todos los atributos de la clase.
* `@RequiredArgsConstructor`: genera un constructor para los atributos marcados con `@NonNull` o que sean `final`.
* `@AllArgsConstructor`: genera un constructor para todos los atributos de la clase.
* `@NoArgsConstructor`: genera un constructor sin argumentos.
* `@EqualsAndHashCode`: genera los métodos `equals` y `hashCode`.
* `@ToString`: genera el método `toString`.

También hay algunas anotaciones equivalentes a un conjunto de las anteriores, muy útiles:

`@Data`: equivalente a `@Getter`, `@Setter`, `@RequiredArgsConstructor`, `@EqualsAndHashCode` y `@ToString`.
Puedes encontrar más información en https://projectlombok.org/features/all y en https://projectlombok.org/api/lombok/package-summary.html.

## Transcripción

# 07 Soporte de Spring Boot para servicios REST 6:34 

[PDF Soporte_de_Spring_Boot_para_REST](pdfs/06_Soporte_de_Spring_Boot_para_REST.pdf)

## Resumen Profesor

### `HttpMessageConverter`s por defecto

Spring Boot ofrece una serie de instancias de `HttpMessageCoverter` por defecto en nuestros proyectos web:

* `ByteArrayHttpMessageConverter`: convierte en/desde arrays de bytes.
* `StringHttpMessageConverter`: convierte en/desde cadenas de caracteres.
* `ResourceHttpMessageConverter`: convierte en/desde instancias de `Resource`.
* `SourceHttpMessageConverter`: convierte en/desde instancias javax.xml.transform.Source
* `FormHttpMessageConverter`: convierte un formulario en/desde un `MultiValueMap<String, String>`.
* `Jaxb2RootElementHttpMessageConverter`: convierte objetos Java en/desde XML, si JAXB2 está presente en el classpath.
* `MappingJackson2HttpMessageConverter`: convierte a/desde JSON, si Jackson 2 está presente en el *classpath*.
* `MappingJacksonHttpMessageConverter`: convierte a/desde JSON, si Jackson 2 está presente en el *classpath*.
* `AtomFeedHttpMessageConverter`: convierte en/desde Atom feeds, si Rome está presente en el *classpath*.
* `RssChannelHttpMessageConverter`: convierte en/desde RSS feeds si Rome está presente en el *classpath*.

## Transcripción

# Contenido adicional  7

* [PDF Presentacion.pdf](pdfs/00._Presentacion.pdf)
* [PDF Qué_es_un_servicio_REST.pdf](pdfs/01_Qué_es_un_servicio_REST.pdf)
* [PDF 02_HTTP.pdf](pdfs/02_HTTP.pdf)
* [PDF Algunos_elementos_de_HTTP.pdf](pdfs/03_Algunos_elementos_de_HTTP.pdf)
* [PDF Nuestro_entorno.pdf](pdfs/04_Nuestro_entorno.pdf)
* [PDF Project_Lombok.pdf](pdfs/05_Project_Lombok.pdf)
* [PDF Soporte_de_Spring_Boot_para_REST](pdfs/06_Soporte_de_Spring_Boot_para_REST.pdf)
