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

<img src="images/02-01.png">

Vamos a comenzar con este primer bloque que va a hacer de introducción y en el cual pues nos vamos a ir acercando desde distintas perspectivas a eso de que es eso de un API REST y como desarrollarlo con Spring Boot.

Vamos a comenzar en esta lección intentando desentrañar un poco que es eso de REST muchos de vosotros ya habéis programado seguro que habéis programado o bien consola, algún entorno gráfico, aplicaciones web, pero a lo mejor este concepto que os suena, que lo habéis leído, algo de APIs, queda un poco en el aire no si os pregunta alguien que es un API REST seguramente a lo mejor no sabemos dar una definición formal o completa vamos a tratar de desentrañarlo.

<img src="images/02-02.png">


Nos vamos a ir acercando primero a través de la arquitectura de lo que sería una aplicación empresarial, pero desde hace mucho tiempo incluso a día de hoy y de forma independiente a las tecnologías, no solamente en proyecto Java o de Spring, durante muchos años se ha tendido la construcción de auténticos monolitos, entendemos monolito como una aplicación que incluye dentro, un conjunto podríamos llamar desplegable, con toda su funcionalidad, lógica de negocio, capa de acceso a datos, motor de plantillas, la renderizacion del contenido, de manera que bueno solamente tenemos como elemento externo quizá un navegador web que accede a un determinado URL o conjunto de URL y por otro lado al final tenemos la base de datos, que es verdad que normalmente está como un sistema externo, salvando esos dos sistemas externos nuestra aplicación a tendido a ser monolítica.

<img src="images/02-03.png">

De hecho a día de hoy lo podemos construir, si construimos una aplicación de Spring Boot, alguna aplicación Web MVC con Thymeleaf todo el código fuente podría quedar recogido en un mismo proyecto, en el cual tendríamos clases, modelo, entidades, repositorio, controladores servicio y además las plantillas, el código JavaScript, todo el código HTML, CSS todo quedaría recogido en un único elemento desplegable. Eso tiene una serie de ventajas porque da una uniformidad en el desarrollo, tendremos sobre todo en la parte de programación un único lenguaje de programación, si la aplicaciones es Web es verdad que crece el número de lenguaje porque necesitamos saber posiblemente JavaScript, CSS, HTML y alguna tecnología más. El despliegue suele ser más sencillo, incluso si tiene una arquitectura donde tengamos replicación, balanceo de carga, etc. tenemos un solo desplegable ya sea un Jar o un War por ejemplo en Java que podemos desplegar en determinados servidores y lo tenemos toda allí y suele ser fácil cuando se comienza este tipo de programación suele ser fácil a la hora de empezar a aprender una tecnología, un lenguaje de programación, en pequeños proyectos incluso podríamos decir que en medianos.

<img src="images/02-04.png">

<img src="images/02-05.png">

<img src="images/02-06.png">

<img src="images/02-07.png">

<img src="images/02-08.png">

<img src="images/02-09.png">

<img src="images/02-10.png">

<img src="images/02-11.png">

<img src="images/02-12.png">

Tenemos un ejemplo de aplicacion monolitica sería el clásico Pet Clinic que lo hay en diferentes versiones en JavaEE, también para Spring, incluso con Spring + Thymeleaf podríamos ver su código fuente por aquí vale si queréis podéis clonar este repositorio lo podría ejecutar con un desde la misma consola con meiben tomcat7: room lo podría abrir per y podréis ver como este proyecto está súper completo está bastante bien podríamos tener por aquí las plantillas vale stylish man estamos teniendo las distintas plantillas por aquí y podemos ver todo el código de la estructuración momentos podríamos buscar el código Java también estará por aquí y el código de Spring vale bueno cuando te tenemos por ejemplo las clases modelo donde tenemos por ejemplo una clase modelo persona con todo lo que conlleve la herencia vale entidades etcétera etcétera una aplicación bastante bastante confianza hola a todos y bienvenido al curso de desarrollo de Naty rejones tribus vamos a comenzar con este primer bloque que va a hacer el de introducción y en el cual cuándo vamos a ir a acercando el desde dicen que hacer test iba a eso de que qué es eso de ti una perra y cómo desarrollar la con el tiempo vamos a comenzar en esta lecciones intentando de extrañar un poco qué es eso de red mucho de vosotros ya habéis programado seguro que habéis programado hubiese consola lunes ortográfico aplicaciones web pero a lo mejor este concepto que os suena que lo habéis leído y algo te aviso bueno pues os queda o queda un poco en el aire no se pregunta alguien que es una perra es seguramente lo mejor nos avisaron a una definición por malo o completa vamos a tratar de extrañado no vamos a ir acercando a primero otra vez el arquitectura de lo que sería un aplicación empresarial pero desde hace mucho tiempo incluso a día de hoy de forma independiente nada no lo siento no solamente en proyectos habbo de enfrente durante muchos años se ha tendido la construcción de Déu de ti como no quito entendemos monolito como una aplicación que se incluye dentro un conjunto vale podríamos llamar a desplegable con todas un poco Navidad lógica de negocio casa de acceso dato motor de plantilla la realización del contenido de manera que bueno solamente tenemos como elemento externo porque te amo navegador web que hace de una determinada URL como conjunto de URL y por otro lado madre al final decidimos la base de datos que es verdad que normalmente está como un sistema interna salvando fotos y te mando bueno esta aplicación atendido sermón olímpicas hecho a día de hoy no podemos conseguir si conseguimos una aplicación de Facebook vale un aplicación huevos en bici con tan listo del código fuente podría recoger a recogida en un mismo por allí igual tendríamos clase modelo entidad repositorios controladores servicio y además Islantilla código Java escrito del HTML CSS todo quedaría recogido en un único elemento de cenar eso en una serie de ventaja porque era una uniformidad en el desarrollo tendremos sobre todo en la parte programación un único lenguaje de de programación no se la quita que me cueste verdad que te crees el número de lenguaje porque necesitamos saber posiblemente JavaScript SS HTML alguna tecnología mando de play queso de ser más sencillo incluso si tenemos arquitectura te venga mejor aplicación palacio de cargas tetera bueno pues tenemos un solo desplegable ya se ha mojado un bar por ejemplo en Java que podemos explicar en determinados servidores y lo tenemos todo y no me suele ser fácil cuando se comienza valiente tipo de programación puede ser fácil a la hora de empezar aprender una tecnología un lenguaje de programación en pequeños proyectos incluso podríamos decir que qué envidia no te entiendo inglés bueno pues podríamos balancear la carga podremos escalar de manera que pongamos más recurso en disposición de búsqueda y menos a la hora de cambiar esos datos a lo largo de este curso la aplicación que vamos a hacer no serán microservicios vale en realidad va a ser monolita pero lo que vamos a hacer es descansar por lo menos dos bloques no es decir la parte cliente la que se encargará de renderizar el cliente toda la interfaz de usuario si es verdad que no la tendremos de manera queremos nuestra aplicación más versátil un escenario de microservicios sería bastante más complejo en un curso de introducción a una pierna estos servicios distribuidos que nos permiten tener nuestro aplicación distribuidas en distintas partes nosotros hay algunos incluso desde los años 80 novoson con forma de RC me echó a alguno de ellos por presentar Oslo por ejemplo corva fue unos los programadores más viejos del lugar seguro que lo recuerda y un protocolo de llamada de procedimiento remoto vale basado en el patrón proxy en el cual se define una interfaz en un lenguaje neutral y luego las herramientas corvacon pila van el código cliente servidor al lenguaje particular por ejemplo un cliente chocaba y y un servidor hecho de nada o esté más más no realmente luego eso aunque funciona y hay muchos software que se ha desarrollado con corva la interfaz y le la interfaz eran tan frágiles que un pequeño cambio suponía quebradero de cabeza enorme y que hace una rectificación completa otro que se puso muy de moda apadrinado por Microsoft que eso ah vale que era similar a Córdoba pero pasado a XML en algún momento determinado acordaba pero tenía básicamente las mismas dificultades no como las interfaces que era muy chica y además frágiles el mismo camión pero estaba muchísimo y otra tecnología java como RM la cual permitía la invocación remota método con una gran facilidad de programación pero solamente en escenarios Java en verdad que nos permitía tener nuestro sistema distribuido a lo mejor en varias máquinas pero solamente podía podíamos trabajar con Java si tenemos un equipo que tuviera mucha madurez en otra tecnología y dijera bueno porque no desarrollar los dos vale con RM y puro y duro no lo podíamos utilizar además tenemos los problemas de comunicación además de los problemas a la mayoría de las plataformas los de comunicación incluso a nivel de red porque bueno normalmente la gente de sistema tiene capados todos los puertos raros de firewall my a lo mejor de los 80 no entonces esto suponía que además de programar tenemos que interactuar a nivel de sistema abrir determinados puertos lo cual podría tener más implicaciones en la seguridad poner auge de la web está plataforma la propia web paso a ser la preferida para el desarrollo de software con el tirón del comercio electrónico en lugar de ser un único estándar es un conjunto de mucho estándares pequeños definido en documento llamado RFC request for comment vale que la manera en que empezó la web que digamos que no empezó como un estándar sino como bueno pues una algo hay que empezó poco a poco a partir de una serie de documentos y bueno no patrocinada por una única organización sino un conjunto de varias vale entonces con eso te comento en la petición de comentarios 62 definiendo pequeños estándares que son francamente aportan una gran flexibilidad frente a los cambios bueno pues todo esto supuso el caldo de cultivo para para que surgiera red al calor y amigo de la web y el protocolo HTTP red es un nuevo enfoque para sistemas distribuidos propuesto por un autor Roy Fielding en su tesis doctoral y que tiene una serie de características si queréis visitar vale os dejo en el material complementario la URL de las tesis de que alguien la quiere leer vale que pública y la podrías consultar y ver como como allí se propone eso del resto está arquitectura tiene una serie de características está basada en el protocolo HTTP spring Estado es decir que cada petición HTTP tiene toda la información necesaria para ser ejecutada lo cual hace que la gestión del protocolo sea más fácil los recursos vienen representados por una URI vale un un identificador único del recurso podríamos plantear la carga podremos escalar de manera que es pongamos más recursos de posición de búsqueda y menos a la hora de cambiar eso está todo el curso la aplicación que vamos a hacer no ser amigos servicio vale en realidad hacer Manolita pero lo que vamos a hacer es de Cájar por lo menos de lo que no se decir la parte clientela que se encargará de Rentería el el cliente todas la interfaz de usuario si verdad que no la tendremos dónde manera que haremos noche aplicación para versátil un escenario de micro servicio serie bastante más complejo no curso de introducción a la una . Cerveza con su correspondiente la idea de recurso frente a la idea de ofrecer funcionalidades que nos va a permitir que separemos un recurso de lo que será su representación y un mismo recurso podremos tenerlo con diferentes representaciones por ejemplo en Jason o XML en determinadas ocasiones me interesaba y la separación pues puede hacer que tengamos por allí algún middleware que se encargue en un determinado momento de el recurso INSS y transformarlo a la representación que más nos interese no ya veremos cómo cómo lo podemos hacer por tanto rezno ofrece una serie de ventajas que vamos a aprovechar la separación cliente-servidor además de una manera sencilla y a través de puerto seguro como suele ser el 80 visibilidad fiabilidad y escalabilidad vale la separación entre cliente y servidor tiene la ventaja de que cualquier equipo de desarrollo puede escalar el producto es indiferente sin problema vale no podemos ir migrando de servidores al tenerlo totalmente separado podemos acercarme a nivel de base de datos vale la separación nos va a ayudar siempre y además red es independiente del tipo de plataforma y lenguaje decir podemos crear API REST con PHP con Java con Python con no aquí en particular nos vamos a aprender con Espe pero podríamos utilizar cualquier tipo de tecnología solamente necesitamos un lenguaje de programación que nos permita crear servidores que atiendan peticiones que pueda producir respuestas con XML o Jason resumo esta lección en lo que vamos a hacer a lo largo del curso a través de este gráfico es decir vamos a crear la parte de la derecha lo que sería un servidor nuestra pirre que va a recibir peticiones de clientes de tipo multiplataforma desde una placa de Arduino o de cualquier tipo de y hotel desde un navegador web desde una aplicación móvil nativa se realizarán peticiones HTTP ahora veremos cómo y recibiremos una respuesta normalmente será en un formato plano de texto de hace que me elevo Jason preferentemente este último que nosotros bueno pues ya en nuestros clientes podremos procesar y podremos trabajarlos de manera que podamos mostrárselo al usuario hasta aquí la introducción a qué es un servicio red en el próximo vídeo vamos a aprender sobre HTTP hola a todos

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
