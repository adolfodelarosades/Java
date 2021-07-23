# 01 Spring 5.0 By Example

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

## Spring Security

La seguridad para las aplicaciones Java siempre fue una molestia para los desarrolladores, especialmente en Java Enterprise Edition. Había una gran cantidad de código repetitivo para buscar objetos en los servidores de aplicaciones, y la capa de seguridad a menudo estaba muy personalizada para la aplicación.

En ese escenario caótico, Spring Team decidió crear un proyecto Spring Security para ayudar a los desarrolladores a manejar la capa de seguridad en la aplicación Java.

Al principio, el proyecto tenía un amplio soporte para Java Enterprise Edition y la integración con las anotaciones de seguridad de EJB 3. Hoy en día, el proyecto admite muchas formas diferentes de manejar la autorización y autenticación para aplicaciones Java.

Spring Security proporciona un modelo completo para agregar autorización y autenticación para aplicaciones Java. El marco se puede configurar con un par de anotaciones, lo que hace que la tarea de agregar una capa de seguridad sea extremadamente fácil. Las otras características importantes se refieren a cómo se puede ampliar el marco. Hay algunas interfaces que permiten a los desarrolladores personalizar los comportamientos del marco predeterminado y hace que el marco se personalice para diferentes requisitos de la aplicación.

Es un proyecto general y se subdivide en estos módulos:

* `spring-security-core`
* `spring-security-remoting`
* `spring-security-web`
* `spring-security-config`
* `spring-security-ldap`
* `spring-security-acl`
* `spring-security-cas`
* `spring-security-openid`
* `spring-security-test`

Estos son los módulos principales y hay muchos otros proyectos para admitir una amplia gama de tipos de autenticación. El módulo cubre los siguientes tipos de autenticación y autorización:

* LDAP
* HTTP Basic
* OAuth
* OAuth2
* OpenID
* CAAS
* JAAS

El módulo también ofrece un **domain-specific language (DSL)** para proporcionar una configuración sencilla. Veamos un ejemplo sencillo:

```yaml
http
  .formLogin()
    .loginPage("/login")
     .failureUrl("/login?error")
      .and()
    .authorizeRequests()
      .antMatchers("/signup","/about").permitAll()
      .antMatchers("/admin/**").hasRole("ADMIN")
      .anyRequest().authenticated();
```

> ℹ️ *El ejemplo se extrajo del blog spring.io. Para obtener más detalles, vaya a https://spring.io/blog/2013/07/11/spring-security-java-config-preview-readability/.

Como podemos ver, el DSL hace que la tarea de configuración sea extremadamente fácil y muy comprensible.

Las principales características de Spring Security son las siguientes:

* Gestión de sesiones
* Protección contra ataques (CSRF, fijación de sesiones y otros)
* Integración de API de servlet
* Autenticacion y autorizacion

Aprenderemos más sobre Spring Security en el Capítulo 8, *Circuit Breakers and Security*. También lo pondremos en práctica.

> ℹ️ *`@EnableWebSecurity` es una anotación común*.

## Spring Cloud

Spring Cloud es otro proyecto general. El objetivo principal de este proyecto es ayudar a los desarrolladores a crear sistemas distribuidos. Los sistemas distribuidos tienen algunos problemas comunes que resolver y, por supuesto, un conjunto de patrones que nos ayudan, como el descubrimiento de servicios, los disyuntores, la gestión de la configuración, los sistemas de rutas inteligentes y las sesiones distribuidas. Las herramientas de Spring Cloud tienen todas estas implementaciones y proyectos bien documentados.

Los principales proyectos son los siguientes:

* Spring Cloud Netflix
* Spring Cloud Config
* Spring Cloud Consul
* Spring Cloud Security
* Spring Cloud Bus
* Spring Cloud Stream

## Spring Cloud Netflix

Spring Cloud Netflix es quizás el módulo Spring más popular en la actualidad. Este fantástico proyecto nos permite integrar el ecosistema Spring con Netflix OSS a través de las funciones de Spring Boot AutoConfiguration. Las bibliotecas OSS de Netflix compatibles son Eureka para el descubrimiento de servicios, Ribbon para permitir el equilibrio de carga del lado del cliente, disyuntor a través de Hystrix para proteger nuestra aplicación de interrupciones externas y hacer que el sistema sea resistente, el componente Zuul proporciona un enrutamiento inteligente y puede actuar como una ventaja Servicio. Finalmente, el componente Feign puede ayudar a los desarrolladores a crear clientes HTTP para API REST con un par de anotaciones.

Veamos cada uno de estos:

* **Spring Cloud Netflix Eureka**: el objetivo de este proyecto es proporcionar descubrimiento de servicios para aplicaciones mientras se ajustan a los estándares de Netflix. El descubrimiento de servicios es una característica importante y nos permite eliminar configuraciones codificadas para proporcionar un nombre de host y puertos; es más importante en entornos de nube porque la máquina es efímera y, por lo tanto, es difícil mantener los nombres y las direcciones IP. La funcionalidad es bastante simple, el servidor de Eureka proporciona un registro de servicios y los clientes de Eureka se comunicarán con sus registros ellos mismos.
Algunas anotaciones comunes son @EnableEurekaServer y @EnableEurekaClient.
Spring Cloud Feign: el equipo de Netflix creó el proyecto Feign. Es un gran proyecto que hace que la configuración de clientes HTTP para aplicaciones REST sea mucho más fácil que antes. Estas implementaciones se basan en anotaciones. El proyecto proporciona un par de anotaciones para rutas HTTP, encabezados HTTP y mucho más y, por supuesto, Spring Cloud Feign lo integra con el ecosistema Spring Cloud a través de las anotaciones y la configuración automática. Además, Spring Cloud Feign se puede combinar con el servidor Eureka.

> ℹ️ *Algunas anotaciones comunes son `@EnableFeignClients` y `@FeignClient`*.

* **Spring Cloud Ribbon**: Ribbon es un equilibrador de carga del lado del cliente. La configuración debe proporcionar principalmente una lista de servidores para el cliente específico. Debe ser nombrado. En términos de Ribbon, se denomina cliente nombrado. El proyecto también proporciona una gama de reglas de equilibrio de carga, como Round Robin y Filtrado de disponibilidad, entre otras. Por supuesto, el marco permite a los desarrolladores crear reglas personalizadas. Ribbon tiene una API que funciona, integrada con el servidor Eureka, para permitir el descubrimiento de servicios, que se incluye en el marco. Además, se admiten funciones esenciales como la tolerancia a fallos porque la API puede reconocer los servidores en ejecución en tiempo de ejecución.

> ℹ️ *Algunas anotaciones comunes son `@RibbonClient` y `@LoadBalanced`*.

* **Spring Cloud Hystrix**: un proyecto de Netflix aclamado, este proyecto proporciona una implementación de patrón circuit breaker. El concepto es similar a un interruptor de circuito eléctrico. El framework observará el método marcado con `@HystrixCommand` y observará las llamadas fallidas. Si el número de llamadas fallidas supera la cifra permitida en la configuración, el disyuntor se abrirá. Mientras el circuito está abierto, se llamará al método de reserva hasta que el circuito esté cerrado y funcione normalmente. Proporcionará características de resistencia y tolerancia a fallos para nuestros sistemas. El ecosistema Spring está completamente integrado con Hystrix, pero solo funciona en los beans `@Component` y `@Service`.

> ℹ️ *Algunas anotaciones comunes son `@EnableCircuitBreaker` y `@HystrixCommand`*.

## Spring Cloud Config

Este interesante proyecto proporciona una manera fácil de administrar las configuraciones del sistema para sistemas distribuidos, y este es un problema crítico en los entornos de nube porque el sistema de archivos es efímero. También nos ayuda a mantener las diferentes etapas del proceso de implementación. Los perfiles de resorte están completamente integrados con este módulo.

Necesitaremos una aplicación que proporcione la configuración para otras aplicaciones. Podemos entender su funcionamiento pensando en los conceptos de **servidor** y **cliente**, el servidor proporcionará algunas configuraciones a través de HTTP y el cliente buscará la configuración en el servidor. Además, es posible cifrar y descifrar valores de propiedad.

Hay algunas implementaciones de almacenamiento para proporcionar estos archivos de propiedades y la implementación predeterminada es Git. Nos permite almacenar nuestros archivos de propiedades en Git, o también podemos usar el sistema de archivos. Lo importante aquí es que la fuente no importa.

> ℹ️ *Git es un control de versiones distribuido. La herramienta se usa comúnmente con fines de desarrollo, especialmente en la comunidad de código abierto. La principal ventaja, cuando se compara con algunos actores del mercado, como SVN, es la arquitectura distribuida.*

Existe una integración interesante entre **Spring Cloud Bus** y este módulo. Si están integrados, es posible difundir los cambios de configuración en el clúster. Esta es una característica importante si la configuración de la aplicación cambia con frecuencia. Hay dos anotaciones que le dicen a Spring que aplique cambios en tiempo de ejecución: `@RefreshScope` y `@ConfigurationProperties`.

En el Capítulo 7, *Airline Ticket System*, implementaremos un servicio interesante para proporcionar configuraciones externas para nuestros microservicios usando este módulo. Los conceptos de servidor se explicarán con más detalle. También se presentarán los detalles del cliente.

> ℹ️ *`@EnableConfigServer` es una anotación común*.

## Spring Cloud Consul

Spring Cloud Consul proporciona integraciones con Hashicorp's Consul. Esta herramienta aborda los problemas de la misma manera que el descubrimiento de servicios, una configuración distribuida y un bus de control. Este módulo nos permite configurar aplicaciones Spring y Consul con algunas anotaciones en un modelo de programación basado en Spring. También se admite la configuración automática. Lo sorprendente aquí es que este módulo se puede integrar con algunas bibliotecas OSS de Netflix, como Zuul y Ribbon, a través de Spring Cloud Zuul y Spring Cloud Ribbon respectivamente (por ejemplo).

> ℹ️ *`@EnableDiscoveryClient` es una anotación común.

## Spring Cloud Security

Este módulo es como una extensión de Spring Security. Sin embargo, los sistemas distribuidos tienen diferentes requisitos de seguridad. Normalmente, tienen una gestión de identidad central, o la autenticación recae en los clientes en el caso de las API REST. Normalmente, en los sistemas distribuidos, tenemos microservicios, y estos servicios pueden tener más de una instancia en el entorno de ejecución cuyas características hacen que el módulo de autenticación sea ligeramente diferente de las aplicaciones monolíticas. El módulo se puede usar junto con las aplicaciones Spring Boot y hace que la implementación de OAuth2 sea muy fácil con un par de anotaciones y algunas configuraciones. Además, se admiten algunos patrones comunes, como el inicio de sesión único, la retransmisión de tokens y el intercambio de tokens.

Para las aplicaciones de microservicio basadas en Spring Cloud Netflix, es particularmente interesante porque permite que la autenticación descendente funcione con un proxy Zuul y ofrece soporte de clientes Feign. Se utiliza un interceptor para buscar tokens.

> ℹ️ *Algunas anotaciones comunes son `@EnableOAuth2Sso` y `@EnableResourceServer`*.

## Spring Cloud Bus

El objetivo principal de este proyecto es proporcionar una forma sencilla de difundir los cambios en todo el clúster. Las aplicaciones pueden conectar los nodos del sistema distribuido a través del message broker.

Proporciona una manera fácil para que los desarrolladores creen un mecanismo de publicación y suscripción utilizando `ApplicationContext` proporcionado por Spring Container. Permite la posibilidad de crear aplicaciones utilizando el estilo de arquitectura impulsada por eventos con Spring Ecosystem.

Para crear eventos personalizados, necesitamos crear una clase secundaria desde `RemoteApplicationEvent` y marcar la clase que se escaneará a través de `@RemoteApplicationEventScan`.

Los proyectos admiten tres agentes de mensajes como capa de transporte:

* AMQP
* Apache Kafka
* Redis

> ℹ️ *`@RemoteApplicationEventScan` es una anotación común*.

## Spring Cloud Stream

La idea detrás de este módulo es proporcionar una forma sencilla de crear microservicios basados en mensajes. El módulo tiene una forma de configuración obstinada. Significa que debemos seguir algunas reglas para crear estas configuraciones. En general, la aplicación se configura mediante el archivo ` yaml|properties`.

El módulo también admite anotaciones. Esto significa que un par de anotaciones son suficientes para crear consumidores, productores y vinculaciones; desacopla la aplicación y la hace fácil de entender. Proporciona algunas abstracciones en torno a los agentes y canales de mensajes, y también hace que la vida del desarrollador sea más cómoda y productiva.

Spring Cloud Stream tiene implementaciones de Binder para RabbitMQ y Kafka.

> ℹ️ *Algunas anotaciones comunes son `@EnableBinding`, `@Input` y `@Output`*.

## Spring Integration

Este módulo admite muchos patrones de aplicaciones empresariales y trae el modelo de programación Spring a este tema. El modelo de programación Spring permite un amplio soporte de inyección de dependencia y se centra en la programación de anotaciones. Las anotaciones nos instruyen sobre cómo se debe configurar el marco y define los comportamientos del marco.

Se sugiere el modelo POJO porque es simple y ampliamente conocido en el mundo del desarrollo de Java.

Este proyecto tiene algunas intersecciones con los otros módulos. Algunos otros proyectos utilizan estos conceptos de módulo para hacer su trabajo. Hay un proyecto llamado Spring Cloud Stream, por ejemplo.

Los patrones de integración empresarial se basan en una amplia gama de canales, protocolos y patrones de comunicación. Este proyecto apoya algunos de estos.

Los módulos admiten una variedad de características y canales, como los siguientes:

* Aggregators
* Filters
* Transformers
* JMS
* RabbitMQ
* TCP/UDP
* Web services
* Twitter
* Email
* Y mucho más

Hay tres conceptos principales de integración de aplicaciones empresariales:

* Messages
* Message channel
* Message endpoint

Finalmente, el módulo Spring Integration ofrece una forma integral de crear integración de aplicaciones y permite a los desarrolladores hacerlo con un soporte increíble.

> ℹ️ *Algunas anotaciones comunes son `@EnableIntegration`, `@IntegrationComponentScan` y `@EnablePublisher`*.

## Spring Boot

Spring Boot se lanzó en 2014. La idea detrás de este proyecto era presentar una forma de implementar la aplicación web fuera de cualquier contenedor, como Apache Tomcat, Jetty, etc. El beneficio de este tipo de implementación es la independencia de cualquier servicio externo. Nos permite ejecutar las aplicaciones web con un archivo JAR. Hoy en día, este es un enfoque excelente porque constituye la forma más natural de adoptar la cultura DevOps.

Spring Boot proporciona contenedores de servlets integrados, como Apache Tomcat, Jetty y Undertow. Hace que el proceso de desarrollo sea más productivo y cómodo al probar nuestras aplicaciones web. Además, las personalizaciones durante la configuración se permiten mediante un archivo de configuración o proporcionando algunos beans.

Hay algunas ventajas al adoptar el marco Spring Boot. El marco no requiere ningún XML para su configuración. Esto es fantástico porque encontraremos todas las dependencias en los archivos Java. Esto ayuda a los IDE a ayudar a los desarrolladores y mejora la trazabilidad del código. Otra ventaja importante es que el proyecto intenta mantener la configuración lo más automática posible. Algunas anotaciones hacen que suceda la magia. Lo interesante aquí es que Spring inyectará la implementación de cualquier código que se genere en tiempo de ejecución.

El marco de Spring Boot también proporciona características interesantes para ayudar a los desarrolladores y operaciones, como verificaciones de estado, métricas, seguridad y configuración. Esto es indispensable para aplicaciones modernas donde los módulos se descomponen en una arquitectura de microservicios.

Hay algunas otras características interesantes que pueden ayudar a los desarrolladores en cuanto a DevOps. Podemos usar los archivos `application-{profile}.properties` o `application.yaml` para configurar diferentes perfiles de tiempo de ejecución, como desarrollo, pruebas y producción. Es una función Spring Boot realmente útil.

Además, el proyecto tiene soporte completo para las pruebas, desde la capa web hasta la capa de repositorio.

El framework  proporciona una API de alto nivel para trabajar con pruebas unitarias y de integración. Además, el marco proporciona muchas anotaciones y clases de ayuda para los desarrolladores.

El proyecto Spring Boot es un marco listo para producción con configuraciones optimizadas predeterminadas para los servidores web, métricas y funciones de monitoreo para ayudar al equipo de desarrollo a entregar software de alta calidad.

Podemos desarrollar aplicaciones codificando en los lenguajes Groovy y Java. Ambos son lenguajes JVM. En la versión 5.0, Spring Team anunció el soporte completo para Kotlin, el nuevo idioma para JVM. Nos permite desarrollar códigos coherentes y legibles. Examinaremos esta característica en profundidad en el Capítulo 7, *Airline Ticket System*.

## Configurar nuestro entorno de desarrollo

Antes de comenzar, debemos configurar nuestro entorno de desarrollo. Nuestro entorno de desarrollo consta de las siguientes cuatro herramientas:

* JDK
* Build tool
* IDE 
* Docker

Instalaremos JDK versión 8.0. Esta versión es totalmente compatible con Spring Framework 5. Presentaremos los pasos para instalar Maven 3.3.9, la herramienta de compilación más famosa para el desarrollo de Java, y en la última parte, le mostraremos algunas instrucciones detalladas sobre cómo instalar IntelliJ IDEA Edición comunitaria. Usaremos Ubuntu 16.04, pero puede usar su sistema operativo favorito. Los pasos de instalación son sencillos.

## Instalación de OpenJDK

OpenJDK es un kit de desarrollo de Java estable, gratuito y de código abierto. Este paquete será necesario para todo lo relacionado con la compilación de código y los entornos de ejecución.

Además, es posible utilizar un JDK de Oracle, pero debe prestar atención a la licencia y los acuerdos.

Para instalar OpenJDK, abriremos una terminal y ejecutaremos el siguiente comando:

```sh
sudo apt-get install openjdk-8-jdk -y
```

> ℹ️ *Podemos encontrar más información sobre cómo instalar Java 8 JDK en la sección de instalación (http://openjdk.java.net/install/) de la página de OpenJDK.*

Verifique la instalación usando el siguiente comando:

```sh
java -version
```

Debería ver la versión de OpenJDK y sus detalles relevantes mostrados de la siguiente manera:

![image](https://user-images.githubusercontent.com/23094588/126779406-09fa38d1-bb73-451b-ad0c-85ab5796acbe.png)

Ahora que hemos instalado el kit de desarrollo de Java, estamos listos para el siguiente paso. En el mundo real, debemos tener una herramienta de construcción para ayudar a los desarrolladores a compilar, empaquetar y probar las aplicaciones Java.

Instalemos Maven en la siguiente sección.

## Instalación de Maven

Maven es una herramienta de compilación popular para el desarrollo de Java. Algunos proyectos importantes de código abierto se crearon con esta herramienta. Hay características que facilitan el proceso de construcción, estandarizan la estructura del proyecto y brindan algunas pautas para el desarrollo de mejores prácticas.

Instalaremos Maven, pero el paso de instalación debe ejecutarse después de la instalación de OpenJDK.

Abra una terminal y ejecute lo siguiente:

```sh
sudo apt-get install maven -y
```

Verifique la instalación usando este comando:

```sh
mvn -version
```

Debería ver el siguiente resultado, aunque la versión puede ser diferente para usted:

![image](https://user-images.githubusercontent.com/23094588/126779623-c81d6c0b-7742-4c19-975b-d3f42d2b7887.png)

Bien hecho. Ahora tenemos Maven instalado. Maven tiene una comunidad vibrante que produce muchos complementos para ayudar a los desarrolladores con tareas importantes. Hay complementos para ejecutar una prueba unitaria y complementos para preparar el proyecto para el evento de lanzamiento que se pueden integrar con el software SCM.

Usaremos el plugin `spring boot maven` y el plugin `docker maven`. El primero convierte nuestra aplicación en un archivo JAR y el segundo nos permite integrarnos con Docker Engine para crear imágenes, ejecutar contenedores y mucho más. En los próximos capítulos, aprenderemos cómo configurar e interactuar con estos complementos.

## Instalación de IDE

El IDE es una herramienta importante para ayudar a los desarrolladores. En este libro, usaremos IntelliJ IDEA como una herramienta *oficial* para desarrollar nuestros proyectos. No hay restricciones para otros IDE porque el proyecto se desarrollará utilizando Maven como herramienta de construcción.

El IDE es una elección personal para los desarrolladores y, en general, implica pasión; lo que algunas personas aman, otros desarrolladores odian. No dude en utilizar su favorito.

## IntelliJ IDEA

IntelliJ IDEA es un producto JetBrains. Usaremos Community Edition, que es de código abierto y una herramienta fantástica para codificar Java y Kotlin. La herramienta ofrece una fantástica función de autocompletar y también es totalmente compatible con las funciones de Java 8.

Vaya a https://www.jetbrains.com/idea/download/#section=linux y descargue Community Edition. Podemos extraer tar.gz y ejecutarlo.

## Spring Tools Suite

Spring Tools Suite se basa en Eclipse IDE, proporcionado por Eclipse Foundation, por supuesto. El objetivo es brindar soporte para el ecosistema Spring y facilitar la vida del desarrollador. Esta herramienta admite características interesantes como Beans Explorer.

Descarga la herramienta en el siguiente enlace:

http://download.springsource.com/release/STS/3.6.4.RELEASE/dist/e4.4/groovy-grails-tool-suite-3.6.4.RELEASE-e4.4.2-linux-gtk-x86_64.tar.gz

## Instalación de Docker

Docker es un proyecto de código abierto que ayuda a las personas a ejecutar y administrar contenedores. Para los desarrolladores, Docker ayuda en diferentes etapas del ciclo de vida del desarrollo.

Durante la fase de desarrollo, Docker permite a los desarrolladores poner en marcha diferentes servicios de infraestructura como bases de datos y descubrimientos de servicios como Consul sin instalación en el sistema operativo actual. Ayuda a los desarrolladores porque los desarrolladores no necesitan instalar este tipo de sistemas en la capa del sistema operativo. Por lo general, esta tarea puede causar conflictos con las libraries durante el proceso de instalación y consume mucho tiempo.

A veces, los desarrolladores necesitan instalar la versión exacta. En este caso, es necesario reinstalar toda la aplicación en la versión esperada. No es bueno porque la máquina de revelado durante este tiempo se vuelve lenta. La razón es bastante simple, hay muchas aplicaciones que se utilizan durante el desarrollo de software.

Docker ayuda a los desarrolladores en esta etapa. Es bastante sencillo ejecutar un contenedor con MongoDB. No hay instalación y permite a los desarrolladores iniciar la base de datos con una línea. Docker admite la etiqueta de imagen. Esta característica ayuda a trabajar con diferentes versiones del software; esto es fantástico para los desarrolladores que necesitan cambiar la versión del software cada vez.

Otra ventaja es que cuando los desarrolladores necesitan entregar los artefactos con fines de prueba o producción, Docker habilita estas tareas a través de imágenes de Docker.

Docker ayuda a las personas a adoptar la cultura DevOps y ofrece funciones sorprendentes para mejorar el rendimiento de todo el proceso.

Instalemos Docker.

La forma más sencilla de instalar Docker es descargar el script que se encuentra en https://get.docker.com:

```sh
curl -fsSL get.docker.com -o get-docker.sh
```

Una vez completada la descarga, ejecutaremos el script de la siguiente manera:

```sh
sh get-docker.sh
```

Espere la ejecución del script y luego verifique la instalación de Docker usando el siguiente comando:

```sh
docker -v
```

La salida debe tener el siguiente aspecto:

![image](https://user-images.githubusercontent.com/23094588/126827889-137a149d-005f-41da-9b84-2b2c7c8f236f.png)

> ℹ️ *A veces, la versión de Docker se puede aumentar y la versión debe ser al menos 17.10.0-ce.*

Finalmente, agregaremos el usuario actual al grupo de Docker, y esto nos permite usar la línea de comando de Docker sin la palabra clave sudo. Escriba el siguiente comando:

```sh
sudo usermod -aG docker $USER
```

Necesitamos cerrar la sesión para realizar estos cambios. Confirme si el comando funciona como se esperaba escribiendo lo siguiente. Asegúrese de que la palabra clave sudo no esté presente:

```sh
docker ps
```

La salida debe ser la siguiente:

![image](https://user-images.githubusercontent.com/23094588/126828254-efe12c41-b36a-47dc-8f04-e0783912b1c0.png)

## Introducción a los conceptos de Docker

Ahora, presentaremos algunos conceptos de Docker. Este libro no trata sobre Docker, pero algunas instrucciones básicas sobre cómo usar Docker son necesarias para interactuar con nuestros contenedores durante los próximos capítulos. Docker es una herramienta de facto que se utiliza para administrar contenedores.

### Docker images

La imagen de Docker es como una plantilla para un contenedor de Docker. Contiene un conjunto de carpetas y archivos necesarios para iniciar el contenedor Docker. Nunca tendremos una imagen en modo ejecución. La imagen proporciona una plantilla para que **Docker Engine** inicie el contenedor. Podemos crear una analogía con la orientación a objetos para comprender mejor el proceso. ***La imagen es como una clase que proporciona una infraestructura para crear instancias de algunos objetos, y las instancias son como un contenedor***.

Además, tenemos un registro de Docker para almacenar nuestras imágenes. Estos registros pueden ser públicos o privados. Algunos proveedores de nube proporcionan estos registros privados. El más famoso es **Docker Hub**. Puede ser gratis, pero si elige esta opción, la imagen debe ser pública. Por supuesto, Docker Hub admite imágenes privadas, pero en este caso, debe pagar por el servicio.

### Containers

Los contenedores Docker son una virtualización ligera. El término ligero significa que Docker usa las funcionalidades de SO para almacenar el proceso del sistema y administrar la memoria, los procesadores y las carpetas. Esto es diferente de la virtualización con máquinas virtuales porque, en este modo, la tecnología necesita simular todo el SO, los controladores y el almacenamiento. Esta tarea consume mucha potencia de cálculo y, en ocasiones, puede resultar ineficaz.

### Docker Networks

Una red Docker es una capa que proporciona aislamiento en tiempo de ejecución para contenedores. Es una especie de caja de arena en la que ejecutar contenedores que están aislados de otros contenedores. Cuando Docker está instalado, de forma predeterminada crea tres redes que no deben eliminarse. Estas tres redes son las siguientes:

* `bridge`
* `none`
* `host`


Además, Docker proporciona al usuario una forma sencilla de crear su red. Para este propósito, Docker ofrece dos controladores: **bridge** y **overlay**.

**Bridge** se puede utilizar para el entorno local, lo que significa que este tipo de red está permitido en un solo host. Será útil para nuestras aplicaciones porque promueve el aislamiento entre contenedores en cuanto a seguridad. Ésta es una buena práctica. El nombre del contenedor adjunto a este tipo de red se puede utilizar como **DNS** para el contenedor. Internamente, Docker asociará el nombre del contenedor con la IP del contenedor.

La overlay network ofrece la posibilidad de conectar contenedores a diferentes máquinas. **Docker Swarm** utiliza este tipo de red para administrar el contenedor en un entorno agrupado. En la versión más reciente, la herramienta **Docker Compose** es compatible de forma nativa con Docker Swarm.

## Docker volumes

Los volúmenes de Docker son la forma sugerida de conservar los datos fuera de un contenedor. Estos volúmenes están completamente administrados por Docker Engine, y estos volúmenes se pueden escribir y leer según la configuración cuando se usan con una línea de comandos de Docker. Los datos de estos volúmenes se conservan en una ruta de directorio en una máquina host.

Existe una herramienta de línea de comandos para interactuar con los volúmenes. La base de esta herramienta es el comando **`docker volume`** el argumento **`--help`** al final muestra las instrucciones de ayuda.

### Docker commands

Ahora echaremos un vistazo a los comandos de Docker. Estos comandos se utilizan principalmente en el ciclo de vida del desarrollo, comandos como **`spin up container`**, **`stop containers`**, **`remove`** y **`inspect`**.

### Docker run

**`docker run`** es el comando de Docker más común. Este comando debe usarse para iniciar los contenedores. La estructura básica de un comando es la siguiente:

```sh
docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
```

Los argumentos de opciones habilitan algunas configuraciones para el contenedor, por ejemplo, el argumento 
**`--name`** le permite configurar un nombre para un contenedor. Es importante para DNS cuando el contenedor se ejecuta en un bridge network.

La configuración de red también se puede configurar en el comando de ejecución, y el parámetro es **`--net`**. Esto nos permite configurar la red a la que se adjuntará el contenedor.

Otra opción importante es **`detached`**. Indica si el contenedor se ejecutará en segundo plano. El parámetro **`-d`** indica a Docker que ejecute un contenedor en segundo plano.

### Docker container

El comando **`docker container`** le permite administrar los contenedores. Hay muchos comandos, como se muestra en la siguiente lista:

* `docker container attach`
* `docker container commit`
* `docker container cp`
* `docker container create`
* `docker container diff`
* `docker container exec`
* `docker container export`
* `docker container inspect`
* `docker container kill`
* `docker container logs`
* `docker container ls`
* `docker container pause`
* `docker container port`
* `docker container prune`
* `docker container rename`
* `docker container restart`
* `docker container rm`
* `docker container run`
* `docker container start`
* `docker container stats`
* `docker container stop`
* `docker container top`
* `docker container unpause`
* `docker container update`
* `docker container wait`


Aquí hay algunos comandos importantes. El **`docker container exec`** le permite ejecutar comandos en un contenedor en ejecución. Esta es una tarea importante para depurar o mirar dentro de los archivos contenedores. El **`docker container prune`** elimina los contenedores detenidos. Es útil en el ciclo de desarrollo. Hay algunos comandos conocidos, como **`docker container rm`**, **`docker container start`**, **`docker container stop`** y **`docker container restart`**. Estos comandos se explican por sí mismos y tienen comportamientos similares.

### Docker network

Los comandos **`docker network`** le permiten administrar las cosas de la Docker network a través de la línea de comandos. Hay seis comandos básicos y los comandos se explican por sí mismos:

* `docker network create`
* `docker network connect`
* `docker network ls`
* `docker network rm`
* `docker network disconnect`
* `docker network inspect`

**`docker network create`**, **`docker network ls`** y **`docker network rm`** son los comandos principales. Es posible compararlos con los comandos de Linux, donde el comando **`rm`** se usa para eliminar cosas y el comando **`ls`** generalmente se usa para listar cosas como carpetas. El comando **`create`** debe usarse para crear redes.

Los comandos **`docker network connect`** y **`docker network disconnect`** le permiten conectar el contenedor en ejecución a la red deseada. Pueden resultar útiles en algunos escenarios.

Finalmente, el comando **`docker network inspect`** proporciona información detallada sobre la red solicitada.

### Docker volume

El comando **`docker volume`** le permite administrar los volúmenes de Docker a través de la interfaz de línea de comandos. Hay cinco comandos:

* `docker volume create`
* `docker volume inspect`
* `docker volume ls`
* `docker volume prune`
* `docker volume rm`

Los comandos **`docker volume create`**, **`docker volume rm`** y **`docker volume ls`** se utilizan eficazmente para gestionar el **`docker volume`** por el Docker Engine. Los comportamientos son bastante similares a los de las networks, pero por volúmenes. El comando **`create`** creará un nuevo volumen con algunas opciones permitidas. El comando **`ls`** enumera todos los volúmenes y el comando **`rm`** eliminará el volumen solicitado.

## Resumen

En este capítulo, analizamos los conceptos principales de Spring Framework. Entendimos los módulos principales del framework y cómo estos módulos pueden ayudar a los desarrolladores a crear aplicaciones en diferentes tipos de arquitectura, como aplicaciones de mensajería, API REST y portales web.

También dedicamos un tiempo a preparar nuestro entorno de desarrollo instalando herramientas esenciales, como Java JDK, Maven e IDE. Este fue un paso fundamental antes de continuar con los siguientes capítulos.

Usamos Docker para ayudarnos a configurar un entorno de desarrollo, como contenedores para bases de datos y entrega para nuestra aplicación en imágenes de Docker. Instalamos Docker y analizamos los comandos principales para administrar contenedores, redes y volúmenes.

En el próximo capítulo, crearemos nuestra primera aplicación Spring y la pondremos en práctica.
