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

Tenemos un ejemplo de aplicacion monolitica sería el clásico Pet Clinic que lo hay en diferentes versiones en JavaEE, también para Spring, incluso con Spring + Thymeleaf podríamos ver su código fuente aquí:

https://github.com/spring-projects/spring-petclinic

https://github.com/thymeleaf/thymeleafexamples-petclinic

https://github.com/spring-petclinic

Si queréis podéis clonar este repositorio lo podría ejecutar desde la misma consola con `mvn tomcat7:run` lo podría abrir podréis ver como está súper completo, está bastante bien podríamos tener las distintas plantillas Thymeleaf y podemos ver todo el código de la estructuración con fragmetos, podríamos buscar el código Java, las clases modelo donde tenemos por ejemplo una clase modelo persona con todo lo que conlleve, la herencia, entidades etc. una aplicación bastante completa.

<img src="images/02-05.png">

Pero las aplicaciones monoliticas tiene una serie de desventajas y es que por ejemplo no son versátiles en escenarios heterogéneos, es decir qué pasa si nuestra aplicación de PetClinic además de tener un cliente hecho con Thymeleaf para poder acceder desde un navegador Web queremos tener también otro cliente para una aplicación móvil nativa con las dos grandes plataformas que hay Android e iOS, pues tendríamos serías dificultades, lo que no sería planteable sería desarrollar otra aplicación totalmente entera digamos para el Backend, para cada uno de esos clientes, porque entonces la sincronización entre los datos sería compleja y es que bueno necesitamos desacoplar la vista de lo que sería la parte de la lógica de negocio de nuestra aplicación.

También si queremos hacer una integración con un proyecto *Legacy* es decir la tecnología debe marcar definitivamente en nuestro proyecto en un largo recorrido, es algo que nos tenemos que plantear normalmente y por desgracia la respuesta es que si, si nos fijamos cantidad de proyectos desarrollados por ejemplo en Cobol que llevan 50 años funcionando algunos de ellos, hace poco hace unos cuantos meses salía una de las aplicaciones que más tiempo lleva funcionando ininterrumpidamente y un proyecto hecho en Cobol y qué bueno la recodificacion sería tan sumamente cara que prefieren seguir manteniendolo. Pero debe marcar la tecnología tan largo plazo bueno pues si vamos desgajando nuestro proyecto de manera que no sea un monolito es posible que algunas de las pequeñas piezas que tengamos la podemos cambiar para que la tecnología sea algo más moderna.

Y también está el problema de escalado no, si mi aplicación debe escalar y un es un monolito debe hacerlo por completo, frente al enfoque de microservicios dónde tenemos nuestra aplicación tan desgajada que si es solamente una de las funcionalidades la que tiene una carga brutal, por ejemplo en una aplicación podemos tener que la búsqueda puede ser algo que se haga con mucha frecuencia y cambiar el perfil de usuario en particular o es que digo yo, una pequeña configuración, el nombre de nuestro nick dentro del sistema, es algo que ocurre con una frecuencia súper remota, entonces podríamos balancear la carga podremos escalar de manera que pongamos más recursos a disposición de búsqueda y menos a la hora de cambiar esos datos.

A lo largo de este curso la aplicación que vamos a hacer NO será en microservicios en realidad va a ser monolita, pero lo que vamos a hacer es desgajar por lo menos dos bloques, es decir la parte cliente, la que se encargará de renderizar el cliente, toda la interfaz de usuaio, si es verdad que no la tendremos, de manera que haremos nuestra aplicación más versátil, un escenario de microservicios sería bastante más complejo en un curso de introducción a un API REST.

<img src="images/02-06.png">

Estos servicios distribuidos que nos permiten tener nuestra aplicación distribuidas en distintas partes no son nuevos hay algunos incluso desde los años 80, como son COM, CORBA, RPC, RMI, SOAP, alguno de ellos por presentarlos por ejemplo CORBA era un protocolo de llamada de procedimientos remotos basado en el patrón Proxy en el cual se definia una interfaz en un lenguaje neutral y luego las herramientas CORBA compilaban el código cliente servidor al lenguaje particular por ejemplo un cliente hecho en Java y un servidor hecho en ADA o C++, realmente luego eso aunque funciono y hay muchos software que se ha desarrollado con CORBA  la interfaz eran tan frágiles que un pequeño cambio suponía un quebradero de cabeza enorme y casí una recodificación completa.

Otro que se puso muy de moda apadrinado por Microsoft que es SOA que era similar a CORBA pero basado en XML, consigio en algún momento determinado superará a CORBA pero tenía básicamente las mismas dificultades, con una serie de interfaces que eran muy fijas y además frágiles, el mínimo cambio impactaba muchísimo.

Otra tecnología Java cómo RMI la cual permitía la invocación remota a métodos con una gran facilidad de programación pero solamente en escenarios Java, es verdad que nos permitía tener nuestro sistema distribuido a lo mejor en varias máquinas, pero solamente podíamos trabajar con Java, si teníamos un equipo que tuviera mucha madurez en otra tecnología y dijera bueno porque no desarrollarlo con RMI puro y duro no lo podíamos utilizar.

Además tenemos los problemas de comunicación, además de los problemas que son comunes a la mayoría de las plataformas los de comunicación, incluso a nivel de red, porque bueno normalmente la gente de sistema tiene capados todos los puertos raros de Firewalk más alla del 80, entonces suponía que además de programar tenemos que interactuar a nivel de sistema, abrir determinados puertos lo cual podría tener más implicaciones en la seguridad.

<img src="images/02-07.png">

Con el auge de la web esta plataforma la propia web paso a ser la preferida para el desarrollo de software con el tirón del comercio electrónico, en lugar de ser un único estándar es un conjunto de mucho estándares pequeños definido en documento llamado RFC Request For Comment, que la manera en que empezó la web que digamos que no empezó como un estándar sino como bueno pues un algo hay que empezó poco a poco a partir de una serie de documentos y bueno no patrocinada por una única organización sino un conjunto de varias, entonces con eso todo momento en la petición de comentarios venido definiendo pequeño estándares que son francamente aportan una gran flexibilidad frente a los cambios, bueno pues todo esto supuso el caldo de cultivo para para que surgiera REST al calor de la web y el protocolo HTTP.

<img src="images/02-08.png">

REST es un nuevo enfoque para sistemas distribuidos propuesto por un autor Roy Fielding en su tesis doctoral y que tiene una serie de características, si queréis visitar os dejo en el material complementario la URL de la tesis y la podrías consultar y ver como allí se propone eso de REST, esta arquitectura. Tiene una serie de características está basada en el protocolo HTTP, es Sin Estados es decir que cada petición HTTP tiene toda la información necesaria para ser ejecutada, lo cual hace que la gestión del protocolo sea más fácil, los recursos vienen representados por una URI, un identificador único del recurso, se tiene una interfaz uniforme para interactuar entre los diferentes sistemas y todo esto hace que en el fondo sea bastante más fácil.

<img src="images/02-09.png">

Frente a RPC, REST esta orientado a ofrecer recursos, RPC sin embargo suele ofrecer una exposición de funcionalidades tenemos un ejemplo por aquí:

RPC

```
/myapi/beerService/getAll
/myapi/beerService/getById
```

REST

```
/myapi/beers
/myapi/beer/123
```

Con RPP sí tuviéramos un servicio para consultar información sobre cervezas tendríamos que tener una serie de llamadas a métodos, devuélveme todas las cervezas, devuelven una cerveza por id sin embargo la idea de REST es *ofrecer recursos* aunque a mí se me escapa alguna vez la palabra servicio, el concepto de servicio desaparece frente a recurso y si quieres tener el catálogo con todas las cervezas lo que tengo que hacer invocar al recurso cervezas y si lo que quiero es una en particular lo que tengo que hacer es invocar al recurso cerveza con su correspondiente id, la idea de recurso frente a la idea de ofrecer funcionalidades.

<img src="images/02-10.png">

Esto además nos va a permitir que separemos un recurso de lo que será su representación y un mismo recurso podremos obtenerlo con diferentes representaciones, por ejemplo en JSON o XML en determinadas ocasiones me interesaba y la separación pues puede hacer que tengamos por allí algún middleware que se encargue en un determinado momento de el recurso en si transformado a la representación que mas nos interese, ya veremos cómo lo podemos hacer.

<img src="images/02-11.png">

Por tanto REST no ofrece una serie de ventajas que vamos a aprovechar la separación cliente-servidor además de una manera sencilla y a través de puerto seguro como suele ser el 80, visibilidad, fiabilidad y escalabilidad, la separación entre cliente y servidor tiene la ventaja de que cualquier equipo de desarrollo puede escalar el producto sin problemas lo podemos ir migrando de servidores al tenerlo totalmente separado podemos acercarme a nivel de base datos, la separación nos va a ayudar siempre y además REST es independiente del tipo de plataforma y lenguaje es decir podemos crear API REST con PHP con Java con Python con Node, aquí en particular lo vamos a aprender con Spring pero podríamos utilizar cualquier tipo de tecnología, solamente necesitamos un lenguaje de programación que nos permita crear servidores, que atiendan peticiones, que puedan producir respuestas con XML o JSON.

<img src="images/02-12.png">

Resumo esta lección, lo que vamos a hacer a lo largo del curso a través de este gráfico es decir vamos a crear la parte de la derecha lo que sería un servidor, nuestra API REST que va a recibir peticiones del cliente de tipo multiplataforma desde una placa Arduino o de cualquier tipo de IoT, desde un navegador web, desde una aplicación móvil nativa se realizarán peticiones HTTP, ahora veremos cómo y recibiremos una respuesta normalmente será en un formato plano de texto vease XML o JSON preferentemente este último, que ya en los clientes podremos procesar y podremos trabajarlos de manera que podamos mostrárselo al usuario, hasta aquí la introducción a qué es un servicio REST en la próxima lección vamos a aprender sobre HTTP.

# 03 Protocolo HTTP 7:37 

[PDF 02_HTTP.pdf](pdfs/02_HTTP.pdf)

## Resumen Profesor

### Códigos de respuesta

Podemos encontrar un listado exhaustivo de códigos de respuesta y su motivo en castellano en la documentación de desarrolladores de mozilla: https://developer.mozilla.org/es/docs/Web/HTTP/Status.

## Transcripción

<img src="images/03-01.png">

En esta lección vamos a hablar del protocolo HTTP.

<img src="images/03-02.png">

HTTP o Protocolo de Transferencia de HiperTexto, es un protocolo que permite la transferencia de información en la web, está desarrollado por el Consorcio 3W y la y la IETF Internet Engineering Task, comenzó a funcionar a finales de los 80 a principios de los 90  y aquí os dejo por ejemplo una preview de lo que fue, no se veía exactamente, es una reproducción, lo que fue una de las primeras páginas web que se crearon, se produjo en el CERT en el centro de investigaciones nucleares que está con su sede en Ginebra a través de el autor que es Tim Berners-Lee. 

HTTP desde los años noventa hasta ahora ha ido evolucionando no tanto como cabría pensar la versión 1 del protocolo ha estado funcionando mucho mucho mucho mucho tiempo con pocas variaciones, aunque si es verdad que ahora ya nos encontramos en la versión del protocolo en particular a día 2 de abril de 2019 se publicó la versión 2.4.39 que ahora mismo es la versión podríamos decir estándar del propio protocolo HTTP.

<img src="images/03-03.png">

Tiene unas características diferenciales frente a otros protocolos, es un protocolo sin estado, es decir cada petición no se ve influenciada por la petición anterior y contiene toda la información para ser procesada, tiene un esquema de Petición-Respuesta Request-Response en el que nosotros le haremos nosotros al servidor una petición y nos remitira una respuesta. El protocolo HTTP/1.X a sido orientado a carácter ya en el HTTP/2 se ha hecho binario se ha mejorado mucho, con la comprensión incluso en la aplicación de algoritmos de compresión a la hora de transmitir la información etc. una serie de ventajas y bueno está definido sobre un conjunto de verbos u operaciones.

<img src="images/03-04.png">

El esquema de petición y respuesta lo tenemos aquí en un gráfico sencillo en el que un cliente, agente de usuario y user-agents realiza una petición enviando un mensaje al servidor, el servidor recibe la petición recoge ese mensaje y lo que hace es enviar otro mensaje de respuesta, en este caso al cliente si os ponéis en situación cuando escribe una URL en un navegador o pinchas a través de algún enlace, lo que se está haciendo es una petición a un servidor, que puede que haga un determinado procesamiento como mínimo buscar un recurso, aplicar algún tipo de procesamiento y devolverlo una respuesta en este caso nuestro navegador posiblemente sea HTML, imágenes, CSS, Javascript todo ellos lo recibe nuestro navegador lo renderiza y nos lo muestra.

<img src="images/03-05.png">

El mensaje muy muy muy sencillo tenemos aquí una representación visual que tendría unas cabecera o encabezado y un cuerpo, este formato es el mismo tanto para peticiones como para respuesta y de hecho a nivel interno solamente cambiaría la línea inicial, por dentro ya  iremos viendo poco a poco la estructura que tiene. La línea inicial que termina con un retorno de carro para las peticiones, lo que va a ir indicando es el tipo del verbo de petición, seguido de la URL a la cual se está haciendo la petición, la versión de HTTP soportada por el cliente y sin embargo en las respuestas lo que tendremos será la versión de HTTP usado, seguido por un espacio el código de respuesta que indica ya veremos qué es lo que ha pasado con esa petición y algunos metadatos más y luego en el cuerpo del mensaje que en las peticiones es opcional, normalmente en la respuesta lo que obtendremos es un recurso, un tipo determinado o un fichero html, una imagen, etc. aquí serán los datos que típicamente se van a intercambiar entre entre cliente y servidor, para un API REST por ejemplo posiblemente sea un montón de caracteres, una cadena de caracteres que representan a determinados objeto en JSON o en XML.

<img src="images/03-06.png">
<img src="images/03-07.png">
<img src="images/03-08.png">
<img src="images/03-09.png">
<img src="images/03-10.png">
<img src="images/03-11.png">

Qué método ofrece HTTP método conocidos también como verbo vale pues son los tipos de peticiones que tenemos que indican la acción que se realiza por el servidor lo veremos más adelante con detenimiento los más conocidos son get para solicitar un recurso servidor voz para enviar la información al servidor para poder crear un nuevo recurso put para actualizar un recurso de forma completa y DELETE para borrar un recurso estos son algunos de los más conocidos el protocolo soporta muchos tipos de operaciones muchos tipos de verbos los códigos de respuestas que también son bastantes no indican que ha pasado con la petición cada código tiene un significado concreto vale y son códigos numéricos de tres cifras por aquí tenemos algunos de ellos vale la documentación de la red de desarrolladores de Mozilla por si lo queréis ver algunos los más conocidos vale cómo serían cómo serían los códigos de tipo 200 con respuestas correctas como el 200 201 204 vale los códigos 400 que son de errores de cliente cómo serían path request vale una petición errónea no autorizado o una solicitud legal pero sin privilegios no si queremos conocerlo con más detenimiento ya digo que tenemos por aquí a ver si encuentro protocolo HTTP uno ha sido corriendo la cara que tiene en el 12 binario sea mejorado mucho vale por la compresión incluso la aplicación de de albaricoque compresión a la hora de transmitir informaciones Federación


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
