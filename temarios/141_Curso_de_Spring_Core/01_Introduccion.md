# 1. Introducción  60m

* 01 Presentación 4:31 
* 02 Introducción a Spring 14:25 
* 03 Instalación del entorno de trabajo 13:55 
* 04 Estructura de una aplicación empresarial y patrones de diseño 12:55 
* 05 Inversión de control e inyección de dependencias 15:09 
* Contenido adicional  5

# 01 Presentación 4:31

[PDF 1-1_Presentacion_del_curso.pdf](pdfs/1-1_Presentacion_del_curso.pdf)

## Transcripción

<img src="images/1-01.png">

<img src="images/1-02.png">

<img src="images/1-03.png">

<img src="images/1-04.png">

<img src="images/1-05.png">

<img src="images/1-06.png">

<img src="images/1-07.png">

<img src="images/1-08.png">

Hola a todos mi nombre es Luis Miguel López vengo a presentaros el curso de Spring core 5 como decía mi nombre es Miguel López Magaña tengo experiencia en el desarrollo de aplicaciones sobre el ecosistema a va a cenar os deja de ser Sabadell estén líder mail Android y además soy profesor de ciclos formativos desde hace algunos años realizar el curso de 5 tendríamos algunos requisitos iniciales importante y otra persona que sea necesario conocer Java para poder trabajar con stream os recomiendo que además pues te contaba con soltura no sobre todo para este ya que estamos con lo que vamos a utilizar la versión 8 también sería necesario que aparte de tabaco en conceptos de metodología de programación orientado a objetos de clase interfaz herencia polimorfismo etcétera además estaría muy bien si sabéis algo sobre Java deseablemente la última versión 7 algo y también de patrones de diseño aunque no estrictamente obligatorio aportar a mí el poder saber sobre bueno pues si hacemos este curso de frente y aprendemos tecnología sobre todo en la parte 40 vamos a poder conocer alguno de los patrones de diseño que se utilizan más en el desarrollo de aplicaciones empresariales también vamos a poder reconocer la utilidad del uso de la inversión de control y la inyección de dependencias como mecanismo que nos permiten desacoplar nuestro software igual hacer un sobre que sea robusto refractory sable reutilizable y en definitiva puede manejar unos conceptos que son transversales al resto de proyectos y de módulos de los contenidos del curso son sencillos comenzaremos haciendo una introducción a esta tecnología por poder centrarnos y aterrizar estaremos el entorno de desarrollo este traje a partir de ahí empezamos a conocer el contenedor de su ciclo de vida y por último terminaremos con dos secciones en las que ascenderemos además de lo que ya hayamos aprendido a configurar las aplicaciones día XML lo aprenderemos a hacer a través de anotaciones diferentes vídeos sobre las distintas anotaciones que podemos utilizar y por último la configuración a través de Java finalizaremos el curso con un ejemplo que integren la gran mayoría de los conceptos que hayamos visto lo largo de los diferentes vídeos que vienen cada uno de los vídeos podemos ir viendo un pequeño proyecto uno varios pequeños proyectos ejemplos al finalizar el curso serás capaz de manejar habrá aprendido el uso de algunos patrones de diseño serás capaz de diferenciar cuáles son los módulos más típicos de Trini y algunos de los proyectos que existen también en reconocer en la importancia de ese mecanismo de inversión de control y de inyección de dependencia habrá instalado el entorno de desarrollo con el cuarto no va a poder trabajar con su proyección detén el mecanismo de creación de Link y la configuración a través de las distintas tecnología y utilizar el contenedor de inversión de control y toda la potencia que ofrece una vez finalizado el curso te puedo recomendar alguno otro de los que tenemos nuestro catálogo por si quieres funcionar en tecnologías que son adyacentes como puede ser de desarrollo de Java orientado a la web el de Hibernate también el de introducción assainies o el de SQL desde cero


# 02 Introducción a Spring 14:25

[PDF 1-2_Introduccion_a_Spring.pdf](pdfs/1-2_Introduccion_a_Spring.pdf)

## Resumen Profesor

### Proyectos que conforman Spring

A día de hoy, Spring se considera algo más que un framework, ya que incluye una gran cantidad de proyectos que abarcan ámbitos diferentes. En este enlace, puedes encontrar un listado completo:

https://spring.io/projects

### Novedades de Spring 5

En este enlace podrás encontrar todas las novedades incluidas en las últimas versiones de Spring.

https://github.com/spring-projects/spring-framework/wiki/What's-New-in-Spring-Framework-5.x

## Transcripción

<img src="images/2-01.png">

<img src="images/2-02.png">

<img src="images/2-03.png">

<img src="images/2-04.png">

<img src="images/2-05.png">

<img src="images/2-06.png">

<img src="images/2-07.png">

<img src="images/2-08.png">

<img src="images/2-09.png">

<img src="images/2-10.png">

### [Spring Projects](https://spring.io/projects)

### [Spring Framework](https://spring.io/projects/spring-framework)

Spring Framework proporciona un modelo integral de programación y configuración para aplicaciones empresariales modernas basadas en Java, en cualquier tipo de plataforma de implementación.

Un elemento clave de Spring es el soporte de infraestructura a nivel de aplicación: Spring se enfoca en la "plomería" de aplicaciones empresariales para que los equipos puedan enfocarse en la lógica de negocios a nivel de aplicación, sin vínculos innecesarios con entornos de implementación específicos.

#### Caracteristicas

* [Core technologies](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html): dependency injection, events, resources, i18n, validation, data binding, type conversion, SpEL, AOP.
* [Testing](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/testing.html): mock objects, TestContext framework, Spring MVC Test, WebTestClient.
* [Data Access](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/data-access.html): transactions, DAO support, JDBC, ORM, Marshalling XML.
* [Spring MVC](https://docs.spring.io/spring/docs/current/spring-framework-reference/web.html) y [Spring WebFlux](https://docs.spring.io/spring/docs/current/spring-framework-reference/web-reactive.html) web frameworks.
* [Integration](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/integration.html): remoting, JMS, JCA, JMX, email, tasks, scheduling, cache.
* [Languages](https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/languages.html): Kotlin, Groovy, dynamic languages.

### [Spring Boot](https://spring.io/projects/spring-boot)

Spring Boot facilita la creación de aplicaciones independientes basadas en Spring de grado de producción que puede "simplemente ejecutar".

Tomamos una visión obstinada de la plataforma Spring y las bibliotecas de terceros para que pueda comenzar con un mínimo de alboroto. La mayoría de las aplicaciones Spring Boot necesitan una configuración mínima de Spring.

#### Caracteristicas

* Crear aplicaciones independientes de Spring
* Incrusta Tomcat, Jetty o Undertow directamente (no es necesario implementar archivos WAR)
* Proporcione dependencias "iniciales" obstinadas para simplificar su configuración de compilación
* Configura automáticamente las bibliotecas de Spring y de terceros siempre que sea posible
* Proporciona funciones listas para producción, como métricas, comprobaciones de estado y configuración externa.
* Absolutamente ninguna generación de código y ningún requisito para la configuración XML

### [Spring Data](https://spring.io/projects/spring-data)

La misión de Spring Data es proporcionar un modelo de programación familiar y consistente basado en Spring para el acceso a los datos, al mismo tiempo que conserva los rasgos especiales del almacén de datos subyacente.

Facilita el uso de tecnologías de acceso a datos, bases de datos relacionales y no relacionales, marcos de reducción de mapas y servicios de datos basados en la nube. Este es un proyecto general que contiene muchos subproyectos que son específicos de una base de datos determinada. Los proyectos se desarrollan trabajando en conjunto con muchas de las compañías y desarrolladores que están detrás de estas emocionantes tecnologías.

#### Caracteristicas

* Potente repositorio y abstracciones personalizadas de mapeo de objetos
* Consulta dinámica derivada de nombres de métodos de repositorio
* Implementación de clases base de dominio que proporcionan propiedades básicas
* Soporte para auditorías transparentes (creado, modificado por última vez)
* Posibilidad de integrar código de repositorio personalizado
* Fácil integración de Spring a través de JavaConfig y espacios de nombres XML personalizados
* Integración avanzada con controladores Spring MVC
* Soporte experimental para la persistencia entre tiendas

### [Spring Security](https://spring.io/projects/spring-security) 

Spring Security es un marco de autenticación y control de acceso potente y altamente personalizable. Es el estándar de facto para asegurar aplicaciones basadas en Spring.

Spring Security es un marco que se centra en proporcionar autenticación y autorización a las aplicaciones Java. Al igual que todos los proyectos de Spring, el verdadero poder de Spring Security se encuentra en la facilidad con que se puede extender para cumplir con los requisitos personalizados.

#### Caracteristicas

* Soporte completo y extensible para autenticación y autorización
* Protección contra ataques como session fixation, clickjacking, cross site request forgery, etc
* Integración API Servlet
* Integración opcional con Spring Web MVC
* Mucho más...

<img src="images/2-11.png">

[Framework Modules](https://docs.spring.io/spring/docs/5.0.0.RC2/spring-framework-reference/overview.html#overview-modules)

<img src="images/2-12.png">

<img src="images/2-13.png">

Actualmente 5.2.6 GA 27/05/2020

<img src="images/2-14.png">

Hola a todos y bienvenidos a esta primera lección del Este curso de Spring descriptores en el que vamos a introducirnos en esta apasionante tecnología y bueno vamos a conocer un poco cuando hablamos de Spring a qué nos referimos exactamente comencemos nuestra parte que no pues que para los que se introducen en esta tecnología a veces le causa algo de razón porque cuando decimos que nos estamos refiriendo vamos a tratar de dar una definición sencilla y después bueno pues vamos conociendo poco a poco spring es un framework de código abierto para la creación de aplicaciones empresariales Java que además tiene soporte para otro lenguaje como grupitos link con estructura modular que tiene una gran flexibilidad y que nos permite implementar diferentes tipos de arquitectura según las necesidades que tenga la aplicación podremos decir que esto es avistadepajaro una definición de lo que de lo que podría ser spring literatura artículo de poseen algunos encontrar de todo y estar haciendo referencia la mayoría de ellas harán referencia al proyecto Spring Framework qué bueno pues dentro del ecosistema de freno el proyecto nuclear sobre todo en la parte de dentro de este núcleo bueno pues el contenedor de inversión de control el que nos va a permitir que cenar la inyección de dependencia pero también por muchas más funcionalidades cojo Programación Orientada presto el uso de recurso la validación de datos etcétera cuando también veamos por ahí spring postizas estarán recibiendo a toda la familia de proyectos que vamos a ver bueno pues que son muchos los proyectos que han ido creciendo en ese en este ecosistema algunos de ellos con con varios móviles incluso haciendo un abuso del lenguaje pues también podríamos encontrar con que alguien habla de Spring y se está refiriendo bueno para un entorno de desarrollo que instalaremos en las mismas lesiones basada en Eclipse y que se llama Springboks vale ya no pues nos vamos haciendo poco a poco una idea dentro de cualquier rama de conocimiento dentro de la computación también no está mal conocer algo victoria y porque surge pre a finales de los noventa en el inicio del siglo 21 pues la aplicaciones empresariales desarrolladas sobre Java se desarrollaba centro de la especificación dejaba eh que se le conocía a dos eh y utilizando un modelo conocido como los JB los Enterprise Java bean en el que bueno fue una aplicación podía tener esta arquitectura una base de datos que normalmente era relacional sobre esa base de datos descansaba el servidor de Java e innovación no se lo podríamos encontrar esta capa también fragmentada vale dos servidores distintos incluso podrían estar en máquinas distintas el contenedor de JB en el servidor de Java en empresarial propiamente dicho donde tendríamos los Enterprise JavaBeans son unas clases especiales qué mala suerte contenedor sobre el


Trabajar con directamente concert les o con páginas JSP y bueno en la capa cliente podríamos encontrar aplicaciones web vale que se conectaría nada a este contenedor está mente incluso podríamos tener complejo tenía ventaja y sobre todo surge como como respuesta a este modelo algunas desventajas del modelo de la de J&B pues que como decía altamente complejo la productividad no era no era para nada buena vale es decir que el programador tenía que invertir mucho trabajo en el programari configurar para poder hacer un bueno pues algo de código que viera rendimiento la conectividad entre componente está basada en la tecnología RM si te digo que un protocolo también que es complejo frente a otro protocolo mucho más extendido estaba basada en el uso de componentes remotos cuando bueno hay aplicaciones de tamaño mediano o pequeño incluso que no necesitan que pienso componentes residan en un servidor independiente sin embargo bueno bueno de lo eso está bien o no obligaba al uso de componentes de moto una gran dificultad a la hora de depurar y buscar errores y un mapeo objeto-relacional pues ciertamente limitar toda esta serie de dificultades están como respuesta que bueno que en el año 2003 y gracias al trabajo de señor de maduración son pues naciera Springfield no pues como respuesta experiencia con mala experiencia sobre todo el desarrollo de aplicaciones empresariales Java nace como un complemento a esta especificación a la aplicación de esta vez y no como un sustituto directo sino que bueno pues dentro de esa gran explicación esta vez va integrando a algunos componentes como la pide Serlet el de los WebSocket lo que de concurrencia el finde JSON la validación la API de persistencia los va integrando qué tal manera incluso que nosotros no podremos hacer uso de alguna utilizar todos los demás hemos visto algo de sobre los orígenes de Sprint vamos a conocerlo los proyectos y algunos de los módulos que lo integran si entráis en la página de Spring spring. Io poder comprobar que en el apartado del proyecto ay qué bueno pues el primero que se escriba y sobre el cual han nacido los demás y que el que nos da soporte para la inyección de dependencia que 100 de transacciones aplicaciones web recursos mensajería programación orientada a aspectos tuyo va incluido eh en el proyecto de Spencer hace algunos años tiene facebook que es un acelerador de construcción de aplicaciones comprobaremos en este curso que configurara una aplicación de precisamente y bueno pues utiliza el principio de convención sobre configuración para que el programador se centre en programar y ofrecerle una configuración acelerada de nuestro proyecto para que esté disponible lo antes posible spring-data no ofrece una interfaz común de acceso a datos y hacían relacionales no relacionales se integran pues diría que entre 20 y 25 sus proyectos diferentes para para poder acceder a datos nos permite proteger nuestra aplicaciones dando un soporte sencillo y sensible para realizar la operación esvástica de autenticación y autorización alemán diferente esquema conjunto de herramienta para muchas tareas de sistemas distribuidos y que están bastante de moda ahora asociada al concepto de construcción y despliegue de microservicios el siguiente porque tiene un nombre algo innombrable el principito y simplifica la construcción de representaciones red vale siguiendo fue el principio de perfecto como el motor del estado de la aplicación en los significa acrónimo y que en definitiva pues



De una manera sencilla y con un esquema muy definido y otro proyecto que nos permite simplificar y optimizar el procesamiento de grandes volúmenes de operaciones por lotes spring for Android qué es una extensión de Spring para simplificar el desarrollo de aplicaciones Android Xátiva y los puntos suspensivos cita algunos proyectos más que si queréis conocer podéis visitar la página de tren centro de del proyecto de framework vale y bueno lo que está más cercano a él encontramos que bueno que también tiene algunos de los módulos están integrados pues dentro de algunos paquetes que a su vez tienen otros módulos dentro como como es el caso del corecontainer Ikea sube ya digo tiene dentro de algunos productos como como el contexto el cobre Bing el expresión lingüística extreme tambien tenemos el de acceso a datos el web nos vamos a ir haciendo un poco una idea de todas formas ya veremos como en este proyecto el perdón dime este curso trabajamos los proyectos sobre todo dentro del cole con Time vale nos vamos a centrar en aprender lo que transversalmente vamos a necesitar para cualquier tipo de otro proyecto de Friends ya sea suerte acceso a datos de seguridad un servicio web 3 ps3 hemos visto desde 2003 a día de hoy fue ha tenido un largo recorrido hace algunos meses veíamos el lanzamiento de 35 de hecho nos encontramos con que la versión actual panela la que está publicada con disponibilidad general en la 508 si bien ya tenemos una versión candidata de la 51 como podéis ver en el gráfico de la derecha vale también tenemos ya persiane no liberada algunas naps otmane de conocerla 5097 Z sigue estando también la posibilidad de usarla 4 la última versión publicada en la 43 18 por si queremos seguir teniendo algo de compatibilidad que no he puesto con otra librerías que todavía no estén preparadas para para sprint qué novedades nos 35 para aquellos que no conozcáis algo sobre el primer vez el uso totalmente a la estado del JDK 8 y de la especificación 7 de cava eh vale ya es principio viene totalmente adaptado a Java 8 incluso se plantearon el que estuviese totalmente adaptado JDK 9 pero bueno la diferencia de velocidades en la publicación de este amor pues no la ha permitido si es verdad que nos permite tener compatibilidad con el JDK 9 y con la especificación la tercera es mínima de alguno así que utilizamos pozo en el 31 en el caso de los servlets en 11 en la validación JP a 2.1 si tiene entre Springfield y la versión candidata que tenemos de las 51 vamos a poder ver como ya podremos tener acceso a lápiz de hacerles 40 la validación del Punto Cero JP a 2.2 que trae algunas novedades interesantes etcétera etcétera con respecto a los servidores sobre los cuales puede correr pues también tenéis aquí algunas personas con las que ya es disponible y bueno podríamos decir que dos de las novedades más interesantes que ofrece es la posibilidad de hacer aplicaciones web reactiva mediante el módulo webflux y también la programación funcional Hong Kong Hong Kong este otro nuevo lenguaje de programación es súper gente dejaba serían las dos novedades más interesantes que nos ofrece spring 5 nosotros en este curso Serra que nos centraremos en la parte Core i5 aprender todo lo transversal a sprint que podemos utilizar con el resto de una vez y ya conocemos qué es spring las presiones y las novedades que no ofrecen en la próxima elección vamos a instalar nuestro entorno de desarrollo para poder comenzar a trabajar francamente sencilla


# 03 Instalación del entorno de trabajo 13:55

[PDF 1-3_Instalacion_del_entorno.pdf](pdfs/1-3_Instalacion_del_entorno.pdf)

## Resumen Profesor

### Requisitos

Para poder trabajar con Spring, necesitamos que nuestro ordenador disponga de una instalación de JDK 8. Puedes encontrar la información en https://www.oracle.com/technetwork/java/javase/downloads/index.html.

### Spring Tool Suite

Nuestro IDE será Spring Tool Suite, que está basado en Eclipse, e incluye muchas facilidades para trabajar con la familia de proyectos de Spring. Se puede instalar como un plugin sobre una instalación de eclipse, pero si vas a comenzar desde cero, te recomendamos descargar el *bundle* disponible en https://spring.io/tools/sts.

### Instalación vía ubuntu-make

Ubuntu Make es una herramienta de línea de comandos que permite descargar e instalar la última versión de varios entornos de desarrollo. También se encarga de instalar las dependencias necesarias, así como de crear los lanzadores (accesos directos). Básicamente, se trata de un comando para poner tu sistema a punto para desarrollar.

Entre otras herramientas, *Ubuntu make* permite la instalación de *Spring Tool Suite*. Para ello, debemos seguir los siguientes pasos:

### Instalar Ubuntu Make

Añadimos el repositorio PPA a nuestro sistema

```sh
$ sudo add-apt-repository ppa:lyzardking/ubuntu-make
$ sudo apt-get update
```

Instalamos ubuntu make

```sh
$ sudo apt-get install ubuntu-make
```

Ya podemos usarlo para instalar Spring Tool Suite

```sh
$ umake ide spring-tools-suite
```

## Transcripción

<img src="images/3-01.png">

<img src="images/3-02.png">

<img src="images/3-03.png">

<img src="images/3-04.png">

<img src="images/3-05.png">

<img src="images/3-06.png">

<img src="images/3-07.png">

<img src="images/3-08.png">

<img src="images/3-09.png">

<img src="images/3-10.png">

<img src="images/3-11.png">

<img src="images/3-12.png">

<img src="images/3-13.png">

<img src="images/3-14.png">

<img src="images/3-15.png">

<img src="images/3-16.png">

Hola a todos llama a lanzarnos de lleno ahora a poder utilizar friend y lo vamos a hacer instalando nuestro entorno de trabajo lo primero que tenemos que ver es que requisitos previos necesitamos para poder trabajar con Extreme deberíamos manejar las tecnologías Java lenguaje de programación Java sobre todo bueno pues con toda la parte de metodología de programación sintaxis básica y orientación a objetos con eso será suficiente si bien nos vendrá bien que estamos conocer algo de Java e vale o por lo menos algunos conceptos a ver que puede llegar a ser un elemento de aplicaciones empresariales es verdad que hemos nombrado también vendría bien manejar algunos conceptos sobre todo si sobre todo para gestionar las dependencias Diada veremos cuál es la pendiente que tenemos que crear añadir en nuestro proyecto para poder utilizar al menos el contenedor de trabajar con Spring podríamos trabajar con cualquier entorno de desarrollo integrado que nos permita trabajar con Java preferentemente bueno con que nos permitirá trabajar para la gestión de dependencia pues también podríamos trabajar con el el primero que siempre surge cuando hablamos de programación Java efectista cómo es porque es un uni de que está ampliamente extendido su uso por la comunidad y francamente uno de los más potentes del mercado también tenemos otra alternativa idea del empresario spring pistol estudios González cualquiera de ellos nos permitiría trabajar con pon sprint derecho de trabajar directamente con JAVA cómo ir de preferido uno que nos propone directamente desde la comunidad de desarrolladores de qué se trata de un plugin para eclipse o que también vamos a comprobar que lo conozco perfectamente todas las ventajas del uso de Eclipse de sushi trabajado con existen aplicaciones

Cómo servicio donde nosotros podemos construir probar y desplegar una aplicación es que además serán escalable y votel TC Server es un servidor de Tomcat servidor que tiene lo mejor de todo y algunos elementos de servidores de aplicaciones a día de hoy la última versión publicada en la 395 vale está basada en Eclipse oxygen la versión 48 con la versión del TC server de Vocal 326 y ofrece ya soporte para jabones no lo podemos descargar desde la misma fuente y vamos a aprender en este vídeo a cómo podemos instalarla para ello vamos a realizar la instalación yo este curso ya lo habéis comprobado que estoy trabajando sobre Ubuntu y vamos a hacer o voy a hacer una demostración de la instalaciones en una máquina virtual que tengo por aquí lo primero que tendríamos que hacer es comprobar si tenemos instalada la máquina virtual de Java JDK y comprobar la versión que tenemos para ver que sea la 18 que será la que utilizamos a lo largo de este curso podemos comprobar como Java bueno pues os recomiendo que con el gestor de paquetes que utiliza habitualmente pues la descarga una vez que hemos comprobado que tenemos Java vale nos descargamos el battlefield 1 suite para nuestro sistema operativo nosotros lo haremos para para decirte la web la tenéis en las slide vale dentro de steam.io barra azul podemos encontrarlo con esto hace algo así como un escaneo del sistema operativo que tenemos a través del encabezado y es capaz de decirnos la versión sin embargo si pulsamos aquí en en ver todas las versiones para que lo veáis mejor podemos encontrar que podemos descargarla que nosotros necesitamos en nuestro caso la versión de 64 bits de domingos trabaje sobre Windows o sobre más también lo podéis descargar directamente incluso si queréis alguna versión más antigua también hay posibilidad de descargarla nosotros lo podemos descargar yo ya lo tengo descargado en mi carpeta de descarga fichero tar.gz a partir de ahí bueno pues lo que vamos a hacer un sencillo proceso de instalación nos vamos a ir a la carpeta de descarga vamos a mover este fichero a la carpeta o que te y allí lo vamos a descubrir vale el nombre de fichero que se van descomponiendo una vez que se hayan descomprimido vamos a bueno referenciar el ejecutable la verdad es que sería tan sencillo como que descomprimir éramos la carpeta aquellos que sienten menos cómodos por la línea comando a través del gestor de archivos comprimidos por ejemplo en el escritorio y pudiéramos iniciar nuestro entorno de desarrollo no es haciendo doble clic sobre sobre el chiste pero bueno vamos a crear un enlace simbólico para tenerlo dentro de la carpeta de binarios locales vale lo hacemos directamente que con la ruta completa en la carpeta prefería el nombre del ejecutable minúscula correctamente el enlace simbólico crear realmente ya podríamos invocar a spring tool suite desde la línea de comandos pero bueno si nos interesa incluir algún tipo de bono aquí lanzador para poder utilizarlo pues sería interesante que lo pudiéramos hacer para ello vamos a bueno incluir esto dentro de la carpeta application en VCR application dónde vamos a crear lanzador habitual de los lanzadores no podéis copiar directamente y de esa manera vamos a poder utilizar en la zona ejecutable apuntaremos estupendo se crearían nuestro ya lo tenemos por aquí no podríamos ejecutar incluso si queremos lo podemos anclar aquí al dock para tenerlo más no sé que lo vamos a utilizar con frecuencia y de esa manera la primera vez que arranca nos pregunta donde queremos situar el huésped y es una característica básica de gente que vamos a cenar el cuerpo y te llamo o cargar el alguno que ya tengamos por ahí y directamente ya podríamos crear nuestro primer proyecto que lo haremos en algún vídeo posterior lo dejamos cargando por último decir que está en la dependencia may ven que vamos a utilizar siempre que vayamos a trabajar con proyectos de Spring core la dependencia context comprobaremos que se descarga varios heart por detrás variar me ya estaremos decir librería en ballet Mario Fisher Óscar por detrás de manera que nos da todo lo necesario para poder trabajar con este entonces si no recordamos esto que cuando va a ir trabajando poco a poco la verdad es que no es tan difícil de recordar el grupo y el artista bueno pues siempre podemos acceder a la web del repositorio name para poder 508 para poder copiarla y pegarla en el tapicero con esto terminamos el vídeo de instalación del entorno y bueno de ejecución del mismo en los próximos vídeos y hemos aprendido algo más sobre patrones de diseño y aplicaciones


# 04 Estructura de una aplicación empresarial y patrones de diseño 12:55

[PDF 1-4_Estructura_y_patrones.pdf](pdfs/1-4_Estructura_y_patrones.pdf)

## Transcripción

<img src="images/4-01.png">

<img src="images/4-02.png">

<img src="images/4-03.png">

<img src="images/4-04.png">

Algunos autores dividen una aplicación empresarial en varios bloques:

* Personas
   * Propietarios del sistema
   * Usuarios
   * Diseñadores
   * Desarrolladores
   * ...
* Datos: Materia prima usada por el sistema de información, permiten
   * Crear información útil
   * Toma de desiciones
   * etc.
* Procesos: Todas aquellas actividades que se llevan dentro de la empresa 
   * Procesan datos
   * Generan información
* Redes: Aquellos canales que vamos a utilizar y diferenciar a la hora de desplegar y utilizar la aplicación
   * Centros de produción
   * Oficinas
   * etc.
* Tecnología que soporta nuestro sistema de información
   * Hardware
   * Software
   
<img src="images/4-05.png">

A nivel de capas una aplicación empresarial esta formada por:

* Infraestructura del hardware
   * En que servidor va a recidir nuestra aplicación
   * Que tipo de conectividad tenemos para acceder a el
   * Plataforma que hay sobre ese hardware
* Infraestructura de la plataforma
   * Sistema operativo, versión de maquinas virtuales
* Datos
   * Relacional o no relacional
* Aplicación
* Interfaz de usuario

**Spring trabaja sobre todo el nivel de aplicación y sus fronteras**

<img src="images/4-06.png">

Aquí podemos verlo desglosado en aquellos componentes que seran habituales en Spring.

### Datos

Para acceder a la capa de Datos existen varias formas de hacerlo, existen dos grandes tipos:

* Relacionales
* NoSQL

En la frontera ente la capa de *Datos* y *Aplicación* vamos a tener unas clases especiales lladados ***Repositorios*** que nos permiten acceder a los datos desde la *Aplicación*.

### Aplicación

Dentro de la aplicación podemos dividirlos en tres grandes tipos:

* **Entidades** modelan el dominio de nuestra aplicación.
* **Servicios** tienen la lógica de negocio de nuestra aplicación
* **Controladores** son los que reciben las peticiones y son capaces de despacharlas delegando el trabajo en los servicios que sean necesarios.

### Interfaz de Usuario

Los *sistemas de plantillas* conectan la *Aplicación* y la *Interfaz de Usuario*.

<img src="images/4-07.png">

<img src="images/4-08.png">

<img src="images/4-09.png">

<img src="images/4-10.png">

<img src="images/4-11.png">

<img src="images/4-12.png">

Hola a todos vamos a continuar en esta lección hablando un poco sobre la estructura de una aplicación empresarial y también sobre patrones de diseño que no puede otro ámbito que se suele trabajar y que nos servirá como base también pues para para poder utilizar un buen diseño en nuestros proyectos este aplicaciones empresariales aplicación empresarial pues es una gran aplicación comercial y me pongo en cursiva gran porque normalmente esto podríamos decir con aplicación especiales cualquier aplicación dedicada una empresa si bien me está fuera pequeña mediana o grande vale pero en el mundo de la programación se habla sobre todo de aplicaciones que requieren de un rato módulo que normalmente unas integrar diferentes apartados de una misma empresa nos van a permitir gestionar todo el flujo de trabajo de la misma van a manejar un gran volumen de datos etcétera normalmente se espera de la aplicaciones empresariales que sean compleja por todas las razones graciante que sean escalable no es lo mismo diseñar una aplicación para una empresa que tiene mil clientes que para una que tiene un millón distribuida es decir que no tenga porqué recibir solamente en un único en un único servidor por ejemplo tener los datos alojados en un único sitio y también que sea crítica es decir que bueno fue que no bueno que tengas fallos menos espera de cualquiera pero que en el caso de que de que sucediera algún tipo de fallo conectividad o no pues fuera reaccionar rápidamente no aplicaciones empresariales se suelen despegar tanto en internet como en ocasiones también dentro de redes corporativas suelen estar centrada dentro de en torno a los datos nos los datos que les eres la parte nuclear no el manejo de la información Réquiem de que sea intuitiva y de un uso fácil sobre todo para evitar el rechazo de trabajadores de empresa en definitiva lo usuario y también que tenga unos ciertos requisitos de seguridad y de mantenibilidad porque como decías una aplicación en normalmente grande algunas de ellas puede requieren de adaptaciones a lo largo del tiempo pensemos en aquellas que tienes que tener algún tipo de adaptación a la ley vale es que moros que van a lo largo de su vida útil fue variando y tienen que ser más temible y está triste podremos decir que esta sería la radiografía de una aplicación empresarial algunos autores como Witt medley y barro pues escribe en una aplicación empresariales en varios bloques elementales particular en 5 para poder definir un sistema de información en general la aplicación empresariales en particular cómo serían las personas los datos los procesos las redes y la tecnología la persona en lo darían pues tanto los propietarios del sistema los que son directamente los usuarios diseñadores desarrolladores y todas las personas que estarían implicados dentro del proyecto de una u otra manera con los datos bueno pues sería en la materia prima que este sistema de información y si no pues nos van a permitir crear información útil toma de decisiones en los procesos serían pues todas aquellas actividades que se llevan a cabo dentro de la empresa Vale y qué bueno fue en definitiva van a procesar datos y van a generar información las redes serían bueno pues aquellos canales que vamos nosotros a utilizar y diferenciar vale a la hora de desplegar y utilizar la aplicación como podrían ser bueno pues centro de producción oficina delegaciones etcétera y la tecnología pues haría referencia también tanto el hardware como el software que van a soportar nuestro nuestro sistema de información no esto sería de alguna manera los cinco bloques que la conformaría hola a todos vamos a continuar en estación hablando un poco la plataforma


Los cinco bloques que la conformaría a nivel de capa vale podríamos hablar de que una aplicación empresarial está formada por todas estas capas que encontramos aquí desde la infraestructura del propio hardware F5 no fue en qué servidor va a recibir nuestra aplicación qué tipo de conectividad de red tenemos para acceder a él la plataforma que hay sobre César Huete decir qué sistema operativo que verte al incluso de Buenafuente máquinas virtuales sea de trabajo o se piensan otros sistemas servidores cetera por encima de ellas tenían los datos vale corriendo seguramente en un sistema gestor de base de datos ya sea relacionarlo no relacional la propia aplicación y sobre ella la interfaz de usuario a la cual monoconductor yo para nada a poder acceder Efrén nos va a permitir trabajar sobre todo vale dentro de nivel de aplicación y también con sus fronteras no lo que quería hacia la interfaz de usuario y también en la parte de acceso a datos lo tenemos regresado en bueno fue en aquellos componentes cuyas nomenclatura será habitual en si nos centramos en la parte de interfaz de usuario aplicación y datos los datos veremos o con alguno de vosotros ya sabéis que podemos acceder a ellos de diversas maneras que están en una base de datos las podríamos dividir en dos grandes tipos que serían las bases de datos relacionales hola Noe se cuela se cuela y no significa que no sean es secuela y no que no solo son ese cuerno not only SQL algún sistema de ejemplo podría ser MongoDB modernidad y cómo vas a ir a Torre la cenar pues muchas gracias conoces como soy Esther MySQL Oracle SQL Server etcétera bueno pues en la frontera entre los datos y la aplicación vamos a tener las clases especiales que serían los repositorios permitirían acceder a los datos vale desde la aplicación ya dentro de la aplicación podríamos dividirlo en tres grandes tipos que serían las entidades que en el fondo modela vale fue el dominio de nuestra aplicación los servicios de Amanecer digamos que los que realmente trabajen los que se encarguen de aplicar lo que se conoce como la lógica de negocio los controladores que serán aquellos que reciban las peticiones y sean capaz de esta charla vale bueno delegando el trabajo en los servicios que sean necesarios y conectándolos posteriormente con el sistema de plantillas que sería algo en la parte más visual maléolo más cercano alovisual que tendríamos a la hora de trabajar con una aplicación con espejo hacemos ahora hablar de patrones de diseño un patrón de diseño lo vamos a poder definir a partir de esta idea cuando no encontramos antes análisis y diseño de una aplicación podemos encontrarnos con algunos problemas cuando nos encontramos con un problema nos podríamos hacer la pregunta seguro que esto no le ha pasado a nadie más probablemente la respuesta es que si le haya pasado alguien más de hecho en un alto porcentaje de situaciones alguien ya tuvo ese problema y lo resolvió de hecho nos podríamos plantear sí y está solución que esa persona película podríamos adaptar a nuestra versión del problema pues bien podríamos decir que un patrón de diseño es una solución a un problema dado que ya se utiliza da cuya efectividad sino probada y que además será reutilizable en problemas que tengan circunstancias similares los patrones de diseño los podemos pensar en el caso del software y en otro ámbito científico como podría hacer la arquitectura no cómo podemos salvar un tipo de terreno que tengo una pendiente ya alguien se inventó que la idea podría ser puente o un túnel no pues nosotros podemos aplicar algo algo por el estilo al mundo del software en los años 90 4 autores llamados la panda de los cuatro vale se plantearon sobre todo sobre ese magma en plantear una serie de patrones de diseño son veintitantos patrones 23 24 patrones que son altamente reutilizable y aplicable en múltiples situaciones a nivel de capa vale podríamos hablar de él que una aplicación Empresarial está formada por todas la


Cuatro autores de Amador la panda de los cuatro vale se plantearon sobre todo sobre este magma en plantear una serie de patrones de diseño son veintitantos patrones 23 24 patrones que son altamente reutilizable y aplicable en múltiples situaciones estructura y su ámbito general a un objeto en particular y según su propósito en patrones creacionales estructurales o de comportamiento por lo dejo por aquí porque es posible que a la hora de desarrollar aplicaciones en otros patrones como el de la inversión de control ese sí hablaremos en ninguna lesión posterior porque es la parte nuclear se escribe vale la inversión de control a través de inyección de dependencia patrones como el modelo vista controlador el vigente el patrón dao del objeto de acceso a datos son controles se retrase también puedes poner utilizaste pues principalmente el patrón de la inyección de dependencia que le digo que veremos en una lesión posterior otros patrones que utilizamos en el en los ámbitos de un bin sería el patrón Singleton protones el patrón Singleton es aquel que nos va a permitir que hagamos una restricción sobre la creación de objetos de un tipo para que tengamos de una clase particular de un tipo particular un solo objeto frente a single no tenemos prototype que nos va a permitir la creación de nuevo objeto suplicante no lo queremos como la posibilidad de el patrón proxy que nos va a permitir definir un representante de un objeto para controlar el acceso a este la palabra proxys posible que no la conozcamos no se me ve la navegación a Internet y de interponer una máquina en nuestra nada de nuestra navegación bueno pues algo parecido podemos hacer a nivel de objeto y de hecho se utiliza en la programación orientada a aspectos patrones cómo vamos antes de modelo vista controlador que nos va a permitir separar la lógica y los datos de la interfaz y del control de peticiones o el patrón FrontController que nos va a permitir tener un solo controlador de fachada vale que está el principio al frente de la aplicación para manejar todas las peticiones todo ellos lo utiliza el fin en su módulo de web web en bici utilizar as24 factoría que centraliza la construcción de objeto bueno pues lo utilizaría el contenedor de inversión de control de este ya podéis comprobar como algunos de estos patrones son los utilizado médico que no los podemos nos podemos parar a conocerlo en profundidad pero si es verdad que estaría bien que no suenen para motivar el porqué spring realiza así las cosas y también el cómo diseñar nuestra


# 05 Inversión de control e inyección de dependencias 15:09 

[PDF 1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf](pdfs/1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf)

## Transcripción

<img src="images/5-01.png">

<img src="images/5-02.png">

<img src="images/5-03.png">

*Desacoplar objetos* quiere decir que dos objetos puedan colaborar entre si, pero que la interferencia que uno haga sobre el otro sea la mínima, de forma que si en un futuro tenemos que refactorizar, es decir cambiar alguno de esos objetos en su funcionamiento, **NO TENGAMOS QUE CAMBIAR AMBOS**, solo refactorizar uno.

En la imagen vemos un ejemplo de un sistema donde los datos no cambian, pero la interfaz de usuario si que lo ha hecho. Nos interesaria que solo tuvieramos que cambiar la parte de la interfaz gráfica y que nuestra lógica de negocio no se viera alterada. Con esto estamos hablando de **DESACOPLAMIENTO**.

***La Inversion de Control es un pricipio que tiene como objetivo que los objetos esten poco acoplados***

<img src="images/5-04.png">

La Inversion de Control se rige bajo este principio de Hollywood.

<img src="images/5-05.png">

El concepto de Inversión de Contro (IoC) lo acuño Martin Fowler. La idea es dejar que sea otro el que controle el flujo del programa, por ejemplo un Framework.

### Diferencia entre Librería y Framework

Una librería es un conjuto de algoritmos, de utilidades que ayudan a realizar algunas operaciones por ejemplo una librería matématica que ayudan a realizar todo tipo de calculos matématicos. Sin embargo un Framework ademas de proporcionar un conjunto de algoritmos y de utilidades suele proporcionar **una metodología de trabajo, una forma de trabajar y una estructura en donde nosotros vamos a encajar nuestro código** 

<img src="images/5-06.png">

Ralph Johnson y Brian Foote.

**Nosostros perdemos el control, lo delegamos en un Framework y es ese Framework el que va a llevar, va a orquestar los pasos que se tienen que seguir**. Nosotros solo incrustamos ciertos bloques de código que el Framework ejecutara en cierto momento.

<img src="images/5-07.png">

Un ejemplo podría ser pulsar un botón, *qué sucede cuando se pulsa el botón*, nosostros decimos que sucede al pulsar el botón pero no controlamos imperativamente el momento en que va a suceder. 

**La Inyección de Dependencias es una forma de Inversión de Control** 

<img src="images/5-08.png">

<img src="images/5-09.png">

En un *Modelo tradicional* si un objeto necesita de otros dos o *n* objetos, el mismo pude invocar la construcción de los mismos.

En un *Modelo de Inversión de Control con Inyección de Dependencias* lo único que hariamos es declar en nuestro objeto aquellos objetos que van a ser necesarios, es decir nuestras dependencias, de forma que un componente exterior se encargara de proporcionarnos las referencias a los mismos, es decir que nos proporcinara esas dependencias.

<img src="images/5-10.png">

En este ejemplo podemos tener la posibilidad de listar una serie de películas siempre y cuando hayan sido dirigidas por un director en partícular. El *meolloo* se encuentra en el objeto `finder` o como podemos conectar nuestra clase `MovieLister` con el objeto `finder` en particular. 

Sería maravilloso que la manera de listar las películas fuera independiente de como han sido almacenadas, de forma que nuestro método hiciera referencia a `finder`, que lo único que tiene es un método llamado `findAll()`, definido en una interfaz, pero que no dijera nada más sobre este objeto ni donde estan almacenadas.  

<img src="images/5-11.png">

Esto lo hacemos creando una Interfaz donde nos comprometemos a tener el método `findAll()`. De manera que la referencia en nuestra clase `MovieLister` es de tipo `finder`.

¿Cómo podriamos después nosotros tener un objeto en partícular? Lo podemos crear en el constructor de `MovieLister` que lo lee de un archivo `txt`. Si en un futuro quisieramos usar una BD como MySQL o en un fichero XML. Por un lado tendríamos que crear una clase alternativa a `CSVMovieFinder` por ejemplo `BDMovieFinder` o `XMLMovieFinder` y como segundo paso tendrámos que modificar la clase `MovieLister` para cambiar este constructor.

**Esto hace que se genere un gran acoplamiento entre la clase `MovieLister` y `finder` en particular que vamos a utilizar.**

<img src="images/5-12.png">

Como podemos comprobar en este diagrama de clases, aun que `MovieLister` ocupa la Interfaz `MovieFinder`, en definitiva tiene que crear esa clase.  

<img src="images/5-13.png">

Sin embargo si pasamos a un esquema de *Inyección de dependencias* podriamos tener otro objeto, al cual podríamos llamar `Ensamblador` o `Contenedor`. Ese `Ensamblador` es el que se encargaría de crear el objeto que implemente el interfaz `MovieFinder` y de proporcionar la referencia de ese objeto a la clase `MovieLister`, de manera nosotros solo hemos dicho que tenemos una dependencia con un objeto de tipo `MovieFinder`, pero que no dice nada de como se va a crear. De esta manera se nos estará *inyectando* esa dependencia que nosotros queremos. 

<img src="images/5-14.png">

De esa forma nuestra clase `MovieLister` se quedaría *totalmente desacoplada* de lo que sería la implementación final del acceso a datos. El código muestra una posible implementación de la clase `CSVMovieFinder` que implementaria esa Interfaz y la dependencia `MovieLister` la proporcionariamos a través de Setters, del método `setFinder()`.

<img src="images/5-15.png">

Como se orquesta esto a través de este `Ensamblador`, Spring lo hace de varias formas, una es a traves de un fichero XML que permite indicar que objetos existen, en el mundo de Spring esos objetos se llamarán *beans* y como se pueden referenciar los unos con los otros.

En el código podemos comprobar que el objeto `MovieLister` dice que tiene una propiedad llamada `finder` y hace referencia a otro objeto (`MovieFinder`) que es una clase de tipo `CSVMovieFinder`.

Si el día de mañana quisieramos implementar la clase `SQLMovieFinder` solamente tedríamos que cambiar esta inyeccción en el fichero XML, indicando que la clase es de otro tipo, darle las propiedades adecuadas y de esa manera nuestro objeto desacoplado seguira teniendo sus dependencias satisfechas y hemos podido cambiar nuestro código de una manera bastante menos costosa y elegante. De esta forma hemos podido hacer la Inyección de Dependencia a un nivel teórico. 


## Transcripción

Hola todos vamos a continuar hablando sobre el meollo de la cuestión es decir la inversión de control y la inyección de dependencia los conceptos que en ocasiones pueden provocar algún quebradero de cabeza y que espero que después de este vídeo pues no no lo tengáis noches el dolor de cabeza dímelo hablemos de la inversión de control impresión de control es un principio de diseño un buen también lo podríamos llamar patrón aunque no haya entrado dentro del lote de los patrones de la panda de los cuatro la inversión de control principal es desacoplar objeto es decir que dos objetos pueda colaborar en 13 pero que bueno pues la interferencia que el uno haga sobre el otro pues será la mínima de forma que tiene un futuro tenemos que repartir rizar el decir cambiar alguno de esos objetos o al menos como funcionan por dentro pues bueno no tengamos que cambiar sino refactorizar solo uno podríamos dar un ejemplo de un sistema en el cual la lógica de negocio procesos más datos que se manejan no cambian a lo largo del tiempo pero su interfaz gráfica sí que lo ha hecho pensado en un sistema que comenzó trabajando desde la línea de comando una aplicación de las clásicas de escritorio vale antiguas que utilizaban en los 80 y los 90 pasando diario un sistema de ventanas primigenio por ejemplo con Java en un sistema como el que tenemos en pantalla motín o alguno parecido y que de ahí puedes pasar a un tipo de interfaz web no interesaría que solo tuviéramos que cambiar la parte de la interfaz y lo mínimo necesario para que nuestra lógica de negocio pues no se tira alterada con eso estaríamos hablando de desacoplamiento no bueno pues la inversión de control es un principio que trata objetivo es conseguir que los objetos están poco a poco claro y que se rige por un principio tema del principio de Hollywood en el que bueno podríamos decir que no nos llamen nosotros te llamaremos a ti qué es bueno fue una frase que sea cuñado en Hollywood cuando algunos actores hacían las pruebas y bueno pues los productores directores y actores enfrentaban ellos decían buenos llamaré para ver qué tal ha salido la prueba para ver si me va a contratar ONO productores directores Virgen que no la llames y te tenemos que llamar ya te llamaremos nosotros y bueno pues la inversión de control se va a regir mediante este este 13 el concepto de inversión de control como tal no puede una persona quemada Martín Fowler y bueno la idea es deja que sea otro el que controle el flujo del programa por ejemplo un friends no que será lo más usual es la diferencia entre librería y framework la encontraríamos en una librería es un conjunto de algoritmos de utilidades que nos van a ayudar a realizar alguna operación por ejemplo supongamos una librería matemática que nos va a permitir realizar que digo yo desde integrales análisis estadístico además de proporcionar un conjunto de algoritmos y de utilidades suele proporcionar una metodología de trabajo una forma de trabajar y una estructura en la cual nosotros vamos encaja nuestro veamos estos dos estos dos programas estos dos mini programas que están escritos en Rubí y están propuestos por por Martín Fowler ya digo que es un poco el padre de la inversión de control propuesta como tal vamos a continuar hablando sobre el moño de la Constitución control


Método el método tecamenu vale es un método que se va a encargar de ejecutar un código por detrás de una especie de Google infinito en el que está esperando a que nosotros no fue interactuemos con el programa y lo vemos las dos líneas que están señaladas con una flecha podemos ver como el procesamiento del nombre vale o del empresa de cadena se realiza vale cuando dejamos el foco sobre bueno fue un un campo en este caso sería un campo de entrada de texto en el campo y de alguna manera nosotros no estamos invocando directamente de forma imperativa la el procesamiento del nombre o el procesamiento de la cadena quest sino que sería asociado a un evento y cuándo surge este evento será el freno el que se encargue de invocar nuestro código con lo cual nosotros hemos perdido la digamos que esta dirección imperativa de cuándo va a suceder la ejecución del código delegando la en el fresco Ralph Johnson y Brian food en una revista de programación orientado a objetos ya en el año 88 proponían este principio y es que una característica importante de un framework es que los métodos definidos por el usuario para adaptar el mismo a menudo se dan en lugar de invocados por el código del programador serán invocados por el propio fresco el framework por tanto desempeña el papel de programas principal a la hora de coordinar y secuenciar bueno pues qué pasó qué has ido a decir que no citación la inversión de control es decir denegar el control en el framework proporcional mismo la posibilidad de servir como una especie de esqueleto extensible donde nosotros vamos a proporcionar métodos que van a adaptar no pues o algoritmos genéticos que nos proporciona el propio fresco vale sería una primera acercamiento de una manera más profunda a lo que sería el principio de inversión de control nosotros perdemos este control lo del gamo en un framework y este framework el que va a llevar para orquesta los pasos que se tienen que seguir nosotros lo que podemos pues es indicar cierto bloques de código que el señor scooter en algún momento ejemplo de control pues podríamos tener aquí en estas leyes como la suscripción o manejo de eventos podremos tener Puntonet estaba por ejemplo podríamos pensar es en el centro sobre widget gráfico y hacer en clase con pulsar un botón que sucede cuando se pulsa el botón nosotros decimos que sucedería cuando se pulse el botón pero no controlamos imperativamente el momento en el que va a suceder los fin de sesión vale con sus métodos asociados al ciclo de vida que sucede bueno pues cuando se activa cuando pasa almacenamiento secundario cuando se rescata de almacenamiento secundario en bueno pues nosotros podríamos decir que sucede asociado eso evento pero no cuando se tiene que ponernos parecido sería bueno que en la preparación de los técnica arios con J iones ejemplo sería la inyección de dependencias elegir solo una forma más de inversión de control es decir que inversión de control e inyección de dependencia no son dos elementos que sean equivalentes dos conceptos que son estrictamente equivalentes sino que la inyección de dependencia es una forma de inversión de control cómo es podemos encontrar margen qué es eso de la inyección de dependencia es una forma de inversión de control en la cual frente al modelo tradicional en el que bueno si un objeto necesita de otros dos el mismo puede invocar la construcción de los mismos bueno pues en un esquema de inversión de control con inyección de dependencia lo único que haríamos sería declarar en nuestro objeto aquellos objetos que van a ser necesario elegir nuestras dependencias de forma que alguien un componente trío se encargará de proporcionarnos la referencia lo mismo decir que nos proporcionará esas dependencias en línea


Pensemos en un software como como este vale si este ejemplo también es de Martín Fowler en ay qué bueno pues podríamos tener la posibilidad de que éramos una serie de película vale siempre y cuando hayan sido dirigida por un director en particular no lo sé entremos para nada en la eficiencia de bloque de código que es muy baja no en el objeto vale o cómo podemos conectar nuestra clase Mobile Easter con este objeto finer en particular sería maravilloso que bueno pues que esta manera de listar la película Fred independiente de cómo han sido almacenada de forma que bueno pues nuestro método hiciera referencia a Finder que supiéramos que lo único que tiene es un método llamado espainol definido en una interfaz pero no dijera nada más sobre este objeto ni dónde están almacenadas podríamos hacer creando una interfaz donde nos comprometemos a tener el método Ainol de manera que la referencia que tendríamos en este código sería de tipo finders y bueno cómo podríamos nosotros después tener o un objeto en particular cuando tendríamos que por ejemplo crear en el construcción de móviles no donde en este caso si las películas las tenemos almacenada en un fichero de valores separados por comas pues tendríamos que construir invocar el constructor de la clase V movie Fighter qué sucede si el día de mañana nosotros pasamos a tener la cantidad de datos que tenemos es grande y queremos utilizar una base de datos SQL o queremos estructurarlo en un fichero XML pues que tendríamos que proporcionar otra clase pero a su vez la clase movilista y la tendríamos que modificar también para cambiar este constructo esto hace que se genera un gran acoplamiento entre bueno la clase Mobile Easter y el Finder en particular que nosotros vamos a utilizar aunque utiliza la interfaz definitiva tiene que crear casa sin embargo si pasamos un esquema de inyección de dependencias podríamos tener otro objeto al cual podíamos llamar ensamblador o contenedor marino llamado aquí pronto contenedor de inversión de control ensamblador sería el que se encargaría de crear el objeto que implemente el interfaz movie Finder y de proporcionar la referencia de ese objeto a la clase movilista de manera que nosotros solamente hemos dicho que tenemos una dependencia con un objeto de tipo movie Finder pero qué no dice nada sobre cómo se va a Andrea de esta manera pues se nos estaría intentando esta dependencia que nosotros tenemos de esa forma bueno pues nosotros nuestra clase muy lista se quedaría totalmente desacoplada de en lo que sería la implementación final del acceso a datos aquí podemos comprobar cuál sería una posible implementación prácticamente cascarillas mal la idea es dar la implementación completa de la clase CCV movie Finder implementaría esa interfaz y la dependencia la proporción haríamos a través de externos del método set timer qué orquesta esto a través desensamblador muéstreme lo veremos a partir de las próximas lecciones lo hace una de las maneras que tiene que hacerlo a través de Messenger de quién es que nos va a permitir indicar qué objetos existen en el mundo de Gene objeto se llamarán pene y cómo se pueden referenciar lo uno por lo otro de manera que aquí podemos comprobar como este objeto Mobile Easter dice que tiene una propiedad llamada finders y hace referencia a otro objeto que es aquí movie Finder que en este caso es de tipo C FVS el día de mañana quisiéramos implementar nuestra clase se cuele movie Finder y cambiar esta inyección solamente tendríamos que modificar este fichero XML vale indicando que bueno pues que la clase de otro tipo


Y de esta manera pues nuestro objeto desacoplado seguirían teniendo suerte su dependencia satisfecha vale y hemos podido cambiar nuestro código de una manera es actualizarlo de una manera bastante menos costosa y elegante forma hemos podido hacerme independencia la hemos hecho un nivel más teórico de ahora en adelante pasaremos a ver pues ejemplo más prácticos de cómo realizar

# Contenido adicional  5

* [PDF 1-1_Presentacion_del_curso.pdf](pdfs/1-1_Presentacion_del_curso.pdf)
* [PDF 1-2_Introduccion_a_Spring.pdf](pdfs/1-2_Introduccion_a_Spring.pdf)
* [PDF 1-3_Instalacion_del_entorno.pdf](pdfs/1-3_Instalacion_del_entorno.pdf)
* [PDF 1-4_Estructura_y_patrones.pdf](pdfs/1-4_Estructura_y_patrones.pdf)
* [PDF 1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf](pdfs/1-5_Inversion_de_Control_e_Inyeccion_de_Dependencias.pdf)
