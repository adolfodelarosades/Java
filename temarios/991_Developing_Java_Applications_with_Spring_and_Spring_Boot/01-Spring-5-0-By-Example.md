# Spring 5.0 By Example

## Viaje al mundo Spring

Spring es un framework modular de código abierto para la plataforma JVM. ***Un framework es una colección de libraries cuyo objetivo principal es abordar problemas comunes de desarrollo de software***. El framework debería resolver estos problemas de forma genérica.

**Rod Johnson creó Spring Framework en 2002** junto con la publicación de su libro, que se llamó ***Expert One-on-One J2EE Design and Development***. La idea detrás de la creación del framework era abordar las complejidades de Java Enterprise Edition.

En ese momento, este tipo de solución se enfocaba mucho en los detalles de la infraestructura, y un desarrollador que usara la solución pasaría mucho tiempo escribiendo código para resolver problemas de infraestructura. Desde su creación, una de las principales preocupaciones de Rod Johnson ha sido aumentar la productividad de los desarrolladores.

El framework se vio por primera vez como un contenedor ligero para Java Runtime Environment y se hizo popular en la comunidad, especialmente debido a la ***función de inyección de dependencias***. El framework hizo que la inyección de dependencias fuera increíblemente fácil. Los desarrolladores no habían visto una característica de este tipo antes y, como consecuencia, personas de todo el mundo adoptaron el proyecto. Año tras año, su popularidad dentro del mundo del desarrollo de software ha ido aumentando.

En las primeras versiones, el framework tenía que trabajar con el ***archivo XML para configurar el contenedor***. En ese momento, esto era mucho mejor que las aplicaciones J2EE, donde era necesario crear muchos ***archivos Ant*** para crear las clases e interfaces estándar.

El framework siempre se consideró una tecnología avanzada para la plataforma Java, pero ***en 2014, el equipo de Spring lanzó la plataforma Spring Boot***. Esta plataforma tuvo un éxito increíble en el ecosistema de Java Enterprise y cambió la forma en que los desarrolladores crearon las aplicaciones de Java Enterprise.

Hoy, Spring es el framework de facto para el desarrollo de Java, y empresas de todo el mundo lo utilizan en sus sistemas. La comunidad es vibrante y contribuye al desarrollo de diferentes maneras, como abrir problemas, agregar el código y discutir el framework en las conferencias de Java más importantes del mundo. Veamos y juguemos con el famoso framework para desarrolladores de Java.

Cubriremos los siguientes temas en este capítulo:

* Módulos principales del Spring Framework
* Anotaciones de Spring para cada módulo
* Configurar el entorno de desarrollo
* Docker  y comandos Docker

## Modularidad de Spring

Desde su fundación, el framework se ha centrado especialmente en la modularidad. Es una característica importante del framework porque lo convierte en una excelente opción para diferentes estilos arquitectónicos y diferentes partes de aplicaciones.

Significa que el framework no es un framework completo y obstinado que dicta las reglas para que todo funcione. Podemos usar el framework según lo necesitemos e integrarlo con una amplia gama de especificaciones y libraries de terceros.

Por ejemplo, para aplicaciones web de portal, Spring MVC admite características como motores de plantilla y endpoints REST y los integra con el popular framework de JavaScript, AngularJS.

Además, si la aplicación necesita soporte para un sistema distribuido, el framework puede proporcionar un módulo asombroso llamado Spring Cloud, que tiene algunas características esenciales para entornos distribuidos, como el registro y descubrimiento de servicios, un disyuntor, enrutamiento inteligente y del lado del cliente, balanceo de carga.

Spring facilita las aplicaciones de desarrollo para Java Runtime con diferentes lenguajes, como Java, Kotlin y Groovy (con los que puede elegir el sabor y hacer que la tarea de desarrollo sea divertida).

Está dividido en varios módulos. Los módulos principales son los siguientes:

* Spring Core
* Spring Data
* Spring Security
* Spring Cloud
* Spring Web-MVC

En este libro, cubriremos las soluciones más comunes involucradas en las aplicaciones Java Enterprise, incluido el impresionante proyecto Spring Cloud. Además, podemos encontrar algunos proyectos interesantes como Spring Batch y Spring Integration, pero estos proyectos son para necesidades específicas.

## Spring Core Framework

Este módulo es la base del framework y contiene el soporte esencial para la inyección de dependencias, funciones web compatibles con Spring **MVC** (**modelo-vista-controlador**) y los frameworks WebFlux bastante nuevos, y programación orientada a aspectos. Además, este módulo apoya la base de JDBC, JMS, JPA y una forma declarativa de administrar transacciones. Lo exploraremos y entenderemos los principales proyectos de este módulo. ¡Hagamoslo!

## Core container

El contenedor Core (central )es la base de todo el ecosistema Spring y ***comprende cuatro componentes: núcleo(core), beans, contexto y lenguaje de expresión***.

***El core y los beans son responsables de proporcionar los fundamentos del framework y la inyección de dependencias***. Estos módulos son responsables de ***administrar el contenedor de IoC*** y ***las funciones principales son la creación de instancias, la configuración y la destrucción de los objeto residentes en el contenedor de Spring***.

> ℹ️ *Los contextos Spring también se denominan contenedores Spring IoC, que son responsables de crear instancias, configurar y ensamblar beans mediante la lectura de metadatos de configuración de XML, anotaciones Java y/o código Java en los archivos de configuración*.

***Hay dos interfaces críticas dentro de estos módulos***: `BeanFactory` y `ApplicationContext`. ***`BeanFactory` se encarga del ciclo de vida del bean, instanciando, configurando, administrando y destruyendo, y `ApplicationContext` ayuda a los desarrolladores a trabajar con recursos de archivos de una manera genérica, habilitando la publicación de eventos para listeners registrados. Además, `ApplicationContext` admite la internacionalización y tiene la capacidad de trabajar con mensajes en diferentes Locales***.

Estos módulos ayudan al componente de contexto a proporcionar una forma de acceder a los objetos dentro del contenedor. El componente de contexto tiene la interfaz `ApplicationContext` con la clase esencial para el contenedor.

> ℹ️ *Algunas anotaciones comunes son `@Service`, `@Component`, `@Bean` y `@Configuration`*

## Spring Messaging

Spring Framework admite una amplia gama de sistemas de mensajería. La plataforma Java es reconocida por brindar un excelente soporte para aplicaciones de mensajería, y Spring Framework sigue este enfoque y ofrece una variedad de proyectos para ayudar a los desarrolladores a escribir aplicaciones poderosas con más productividad y menos líneas de código de infraestructura. La idea básica de estos proyectos es proporcionar algunas clases de plantilla que tengan los métodos convenientes para interactuar con los sistemas de mensajería.

Además, el proyecto proporciona algunas anotaciones de escucha para brindar soporte para escuchar los mensajes de los intermediarios. El framework mantiene el estándar para diferentes proyectos. En general, el prefijo de las anotaciones es el nombre del sistema de mensajería, por ejemplo, `@KafkaListener`.

El framework proporciona muchas abstracciones para crear aplicaciones de mensajería de forma genérica. Esto es algo interesante porque los requisitos de la aplicación cambian durante el ciclo de vida de la aplicación y la solución del intermediario de mensajes también puede cambiar. Luego, con pequeños cambios, la aplicación construida con el módulo de mensajes Spring puede funcionar en diferentes brokers. Ésta es la meta.

## Spring AMQP

Este subproyecto admite el protocolo AMQP en Spring Framework. Proporciona una plantilla para interactuar con el  message broker. Una plantilla es como una API de alto nivel que admite las operaciones de envío `send` y recepción `receive`.

Hay dos proyectos en este conjunto: `spring-amqp`, que se puede usar para ActiveMQ, por ejemplo, y `spring-rabbit`, que agrega soporte para el RabbitMQ broker. Este proyecto permite la broker administration a través de las API para declarar colas, enlaces e intercambios.

Estos proyectos fomentan el uso extensivo de la inyección de dependencias proporcionada por el contenedor principal, porque hacen que la configuración sea más declarativa y fácil de entender.

Hoy en día, el RabbitMQ broker es la opción popular para las aplicaciones de mensajería, y Spring brinda soporte completo para las interacciones del cliente hasta el nivel de las tareas de administración.

> ℹ️ *Algunas anotaciones comunes son `@Exchange` y `@QeueueBinding`.

## Spring para Apache Kafka

Spring para Apache Kafka es compatible con las aplicaciones Apache Kafka basadas en intermediarios. Proporciona una API de alto nivel para interactuar con Apache Kafka. Internamente, los proyectos utilizan las API de Kafka Java.

Este módulo es compatible con el modelo de programación de anotaciones. La idea básica es que con un par de anotaciones y algunos modelos POJO, podemos arrancar la aplicación y empezar a escuchar y producir mensajes.

`KafkaTemplate` es una clase central de este proyecto. Nos permite enviar mensajes a Apache Kafka con una API de alto nivel. También se admite la programación asincrónica.

Este módulo ofrece soporte para transacciones a través de anotaciones. Esta función está habilitada a través de anotaciones transaccionales estándar que se utilizan en aplicaciones basadas en Spring, como `@Transactional`.

También aprendimos sobre Spring AMQP. Este proyecto agrega el concepto Spring de crear aplicaciones basadas en este broker. Las funciones de inyección de dependencia también son compatibles.

> ℹ️ *Algunas anotaciones comunes son `@EnableKafka` y `@KafkaListener`*.

## Spring JMS

La idea de este proyecto proporciona una integración JMS con ideas de proyectos de Spring Framework y proporciona una API de alto nivel para interactuar con los brokers. La peor parte de una especificación JMS es que tiene una gran cantidad de código repetitivo para administrar y cerrar conexiones.

`JmsTemplate` es una clase central para este módulo y nos permite enviar mensajes al corredor. La especificación JMS tiene muchos comportamientos intrínsecos para manejar la creación y libera recursos, por ejemplo, la clase `JmsTemplate` hace estas tareas automáticamente para los desarrolladores.

El módulo también admite requisitos transaccionales. `JmsTransactionManager` es la clase que maneja el comportamiento transaccional del módulo Spring JMS.

Spring elimina el código repetitivo con un par de anotaciones. El marco aumenta la legibilidad del código y también hace que el código sea más intuitivo.

> ℹ️ *Algunas anotaciones comunes son ` @JmsListener` y `@EnableJms`.

## Spring Web MVC

Este módulo es el primero creado por Spring Team para admitir las aplicaciones web en Spring Framework. Este módulo utiliza la API de Servlet como base, y luego estas aplicaciones web deben seguir la Especificación de Servlet y ser implementadas en contenedores de servlet. En la versión 5.0, Spring Team creó un framework web reactivo, que se tratará más adelante en este libro.

El módulo Spring Web MVC se desarrolló utilizando el patrón de front controller. Cuando se creó el framework, este patrón era una elección común para muchos framework, como Struts y JSF, entre otros. Debajo del capó, está el servlet principal en Spring llamado `DispatcherServlet`. Este servlet redirigirá a través de un algoritmo para realizar el trabajo deseado.

Permite a los desarrolladores crear increíbles aplicaciones web en la plataforma Java. Esta parte del framework proporciona soporte completo para desarrollar este tipo de aplicación. Hay algunas características interesantes para este propósito, como el soporte para la internacionalización y el soporte para el manejo de cookies. Además, las solicitudes de varias partes son una característica interesante para cuando la aplicación necesita manejar archivos de carga y admitir solicitudes de enrutamiento.

Estas características son comunes para la mayoría de las aplicaciones web y el framework tiene un excelente soporte para estas características. Este soporte hace que el framework sea una buena opción para este tipo de aplicación. En el Capítulo 2, Starting in the Spring World - The CMS Application, crearemos una aplicación usando este módulo y las características principales se explorarán en profundidad.

El módulo tiene soporte completo para la programación de anotaciones desde declarar puntos finales HTTP hasta envolver el atributo de solicitud en una solicitud HTTP. Hace que la aplicación sea extremadamente legible sin el código repetitivo para obtener el parámetro de solicitud, por ejemplo.

En cuanto a las aplicaciones web, permite a los desarrolladores trabajar con motores de plantillas robustos como Thymeleaf y Freemarker. Está completamente integrado con funciones de enrutamiento y validación de beans.

Además, el framework permite a los desarrolladores crear API REST con este módulo. Dado todo este soporte, el módulo se ha convertido en uno de los favoritos en el ecosistema Spring. Los desarrolladores han comenzado a crear API con esta pila, y algunas empresas importantes han comenzado a usarla, especialmente dado que el framework proporciona una manera fácil de navegar por las anotaciones. Debido a esto, el equipo de Spring agregó la nueva anotación `@RestController` en la versión 4.0.

Trabajaremos mucho con este módulo. Capítulo por capítulo, aprenderemos cosas interesantes sobre esta parte del framework.

> ℹ️ *Algunas anotaciones comunes son `@RequestMapping`, `@Controller`, `@Model`, `@RestController` y `@RequestBody`*.

## Spring WebFlux

Un nuevo módulo introducido en Spring 5.0, Spring WebFlux, se puede utilizar para implementar aplicaciones web creadas con Reactive Streams. Estos sistemas tienen características de no bloqueo y se implementan en servidores construidos sobre Netty, como Undertown y contenedores de servlets que admiten + 3.1.

> ℹ️ *Netty es un framework de trabajo de código abierto que ayuda a los desarrolladores a crear aplicaciones de red, es decir, servidores y clientes que utilizan el patrón asíncrono impulsado por eventos. Netty ofrece algunas ventajas interesantes, como menor latencia, alto rendimiento y menor consumo de recursos. Puede encontrar más información en https://netty.io*.

Este módulo admite anotaciones basadas en módulos Spring MVC, como `@GetMapping`, `@PostMapping` y otros. Esta es una característica importante que nos permite migrar a esta nueva versión. Por supuesto, son necesarios algunos ajustes, como agregar clases de Reactor (Mono o Flux)*.

Este módulo cumple con los requisitos web modernos para manejar una gran cantidad de canales concurrentes donde el modelo de subprocesos por solicitud no es una opción.

Aprenderemos sobre este módulo en el Capítulo 3, Agregar persistencia con Spring Data y ponerlo en moda reactiva e implementar una aplicación completamente reactiva basada en Reactive Streams.

> ℹ️ *Algunas anotaciones comunes son ` @RequestMapping`, `@RestController` y `@RequestBody`.

## Spring Data

Spring Data es un módulo interesante que proporciona la forma más fácil de administrar datos de aplicaciones con programación basada en Spring. El proyecto es un proyecto paraguas, con subproyectos para soportar diferentes tecnologías de bases de datos, incluso bases de datos relacionales y no relacionales. El Spring Team admite algunas tecnologías de bases de datos, como Apache Cassandra, Apache Solr, Redis y JPA Specification, y la comunidad mantiene los otros proyectos interesantes, como ElasticSearch, Aerospike, DynamoDb y Couchbase. La lista completa de proyectos se puede encontrar en http://projects.spring.io/spring-data.

El objetivo es eliminar el código repetitivo del código de persistencia. En general, la capa de acceso a datos es bastante similar, incluso en diferentes proyectos, difiriendo solo en el modelo del proyecto, y Spring Data proporciona una forma poderosa de mapear el modelo de dominio y la abstracción del repositorio.

Hay algunas interfaces centrales; son una especie de marcador para indicar al framework que elija la implementación correcta. Bajo el capó, Spring creará un proxy y delegará la implementación correcta. Lo sorprendente aquí es que los desarrolladores no tienen que escribir ningún código de persistencia y luego ocuparse de este código; simplemente eligen la tecnología requerida y Spring se encarga del resto.

Las interfaces centrales son `CrudRepository` y `PagingAndSortingRepository`, y sus nombres se explican por sí mismos. `CrudRepository` implementa los comportamientos CRUD, como `create`, `retrieval`, `update` y `delete`. `PagingAndSortingRepository` es una extensión de `CrudRepository` y agrega algunas características como paginación y clasificación. Por lo general, encontraremos derivaciones de estas interfaces como `MongoRepository`, que interactúa con la tecnología de base de datos MongoDB.

> ℹ️ *Algunas anotaciones comunes son `@Query`, `@Id` y `@EnableJpaRepositories`.

## Seguridad de primavera
La seguridad para las aplicaciones Java siempre fue una molestia para los desarrolladores, especialmente en Java Enterprise Edition. Había una gran cantidad de código repetitivo para buscar objetos en los servidores de aplicaciones, y la capa de seguridad a menudo estaba muy personalizada para la aplicación.

En ese escenario caótico, Spring Team decidió crear un proyecto Spring Security para ayudar a los desarrolladores a manejar la capa de seguridad en la aplicación Java.

Al principio, el proyecto tenía un amplio soporte para Java Enterprise Edition y la integración con las anotaciones de seguridad de EJB 3. Hoy en día, el proyecto admite muchas formas diferentes de manejar la autorización y autenticación para aplicaciones Java.

Spring Security proporciona un modelo completo para agregar autorización y autenticación para aplicaciones Java. El marco se puede configurar con un par de anotaciones, lo que hace que la tarea de agregar una capa de seguridad sea extremadamente fácil. Las otras características importantes se refieren a cómo se puede ampliar el marco. Hay algunas interfaces que permiten a los desarrolladores personalizar los comportamientos del marco predeterminado y hace que el marco se personalice para diferentes requisitos de la aplicación.

Es un proyecto general y se subdivide en estos módulos:

núcleo de seguridad de primavera
Spring-Security-Remoting
primavera-seguridad-web
configuración de seguridad de primavera
primavera-seguridad-ldap
primavera-seguridad-acl
primavera-seguridad-cas
spring-security-openid
prueba de seguridad de primavera
Estos son los módulos principales y hay muchos otros proyectos para admitir una amplia gama de tipos de autenticación. El módulo cubre los siguientes tipos de autenticación y autorización:

LDAP
HTTP básico
OAuth
OAuth2
OpenID
CAAS
JAAS
El módulo también ofrece un lenguaje específico de dominio (DSL) para proporcionar una configuración sencilla. Veamos un ejemplo sencillo:

http
  .formLogin ()
    .loginPage ("/ iniciar sesión")
     .failureUrl ("/ login? error")
      .y()
    .authorizeRequests ()
      .antMatchers ("/ signup", "/ about"). permitAll ()
      .antMatchers ("/ admin / **"). hasRole ("ADMIN")
      .anyRequest (). authenticated ();
El ejemplo se extrajo del blog spring.io. Para obtener más detalles, vaya a https://spring.io/blog/2013/07/11/spring-security-java-config-preview-readability/.
Como podemos ver, el DSL hace que la tarea de configuración sea extremadamente fácil y muy comprensible.

Las principales características de Spring Security son las siguientes:

Gestión de sesiones
Protección contra ataques (CSRF, fijación de sesiones y otros)
Integración de API de servlet
Autenticacion y autorizacion
Aprenderemos más sobre Spring Security en el Capítulo 8, Disyuntores y seguridad. También lo pondremos en práctica.

@EnableWebSecurity es una anotación común.
