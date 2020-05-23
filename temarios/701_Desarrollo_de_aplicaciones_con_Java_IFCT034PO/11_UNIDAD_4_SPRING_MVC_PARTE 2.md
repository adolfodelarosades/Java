# UNIDAD 4: SPRING MVC [PARTE 2]

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

5. Gestión de transacciones
   * 5.1 Gestión de Transacciones
6. Spring Web Services
   * 6.1 REST
7. Spring Security
   * 7.1 Cómo funciona Spring Security
8. Spring Test
   * 8.1 Pruebas unitarias
   * 8.2 Integración con Spring Test
9. Capacidades específicas
   * 9.1 Spring Mobile
   * 9.2 Spring Social
   * 9.3 Spring Android
   * 9.4 Spring Boot
   
### Mapa Conceptual

<img src="images/c4/4-2-mapa.png">

### 5. Gestión de transacciones

Las transacciones son uno de los principales motivos de ser de Spring MVC. En este apartado daremos un vistazo a cómo Spring MVC maneja las transacciones y veremos que existen dos ámbitos para ellas: las transacciones globales y las locales.  

Igualmente, veremos las ventajas que nos ofrece trabajar con transacciones.  

También, estudiaremos cómo implementarlas en nuestra aplicación de ejemplo, además, le daremos un poco más de forma a esta misma, agregándole más funcionalidad. 

##### Enlace de interés

En el siguiente enlace puedes aprender más sobre las transacciones en Spring.

[Transacciones en Spring](http://www.juntadeandalucia.es/servicios/madeja/contenido/recurso/170)

#### 5.1 Gestión de Transacciones

Las transacciones ya las hemos estado utilizando aunque no hemos sido conscientes de ello. Por ejemplo, a nivel local, podríamos decir que una transacción son las consultas que hacemos a nuestra base de datos.   

En ocasiones se trata de transacciones sencillas, pero cuando hablamos de grandes cantidades de movimientos de datos y de servidores remotos, hay que tener en cuenta que cualquier aspecto puede fallar y debemos ser capaces de controlar que procesos se llevan a cabo y, así mismo, debemos ser capaces de deshacer cualquier cambio indeseado producto de un error.  

También, el llevar un control de todos los procesos para luego hacer auditorías es una función importante de las transacciones.  

A nivel general, el uso de transacciones busca mejorar la calidad y confiabilidad de los datos. 

Las transacciones ya las hemos estado utilizando aunque no hemos sido conscientes de ello. Por ejemplo, a nivel local, podríamos decir que una transacción son las consultas que hacemos a nuestra base de datos.   

En ocasiones se trata de transacciones sencillas, pero cuando hablamos de grandes cantidades de movimientos de datos y de servidores remotos, hay que tener en cuenta que cualquier aspecto puede fallar y debemos ser capaces de controlar que procesos se llevan a cabo y, así mismo, debemos ser capaces de deshacer cualquier cambio indeseado producto de un error.  

También, el llevar un control de todos los procesos para luego hacer auditorías es una función importante de las transacciones.  

A nivel general, el uso de transacciones busca mejorar la calidad y confiabilidad de los datos. 

**Atomicidad**

Consiste que en cada actividad que ejecuta una transacción sea dividida en las partes más pequeñas, de modo que no exista anidación ni dependencia, para que si existe un error sea más fácil revertir todo el proceso.

**Consistencia**

Toda transacción se ejecute de manera correcta o incorrecta, debe garantizar el estado consistente de los datos y la integridad de los mismos.

**Aislamiento**

Se refiere a la independencia entre las transacciones, es decir, nunca una transacción debe interferir la ejecución de otra y debe ser posible la ejecución aislada de la misma.

**Durabilidad**

Al finalizar cualquier transacción debe ser perdurable en el tiempo, es decir, debe quedar registro de todo lo que se hizo se haya fallado o no.

Debemos entender que en Spring Framework todo este soporte de transacciones declarativas está basado en AOP, cuestión que estudiamos anteriormente.  

**El ámbito de una transacción**

Se refiere a todo aquello que ocurre dentro de una transacción, es decir, todo lo que hace una transacción, pudiendo haber distintos métodos declarados dentro de una transacción. 

**Propagación**

Si dentro del ámbito de una transacción se encuentra otra transacción, el comportamiento a seguir se denomina propagación y puede ser de los siguientes tipos: 

**PROPAGATION_REQUIRED**

En este caso se ejecutan todas las transacciones dentro de la misma, no se crean nuevas transacciones dentro, pero si se ejecutan aprovechando la que ya se tiene.

**REQUIRES_NEW**

En este caso se crea una nueva transacción y se pausa la transacción inicial por lo que, cuando esta finaliza, continúa con la transacción primaria.

**PROPAGATION_SUPPORTS**

Aprovecha la transacción ya existente, no crea ninguna otra.

**PROPAGATION_MANDATORY**

Se ejecuta solo si existe una transacción abierta.

**PROPAGATION_NEVER**

Lanza un error si ya existe una transacción abierta.

**PROPAGATION_NOT_SUPPORTED**

Coloca la transacción inicial en suspenso, y se reactiva al finalizar el método.

El commit de una transacción se realiza siempre a menos que exista un error. De ser así, automáticamente se ejecuta un rollback.  

Existen maneras de controlar el rollback, pudiendo especificar que ocurra para ciertos tipos de errores.  

En Spring MVC tenemos la anotación @Transactional, ahora veremos el uso de esta anotación, que indica que la interface, clase o método a declarar tendrá un comportamiento transaccional, que quiere decir que heredará el comportamiento de la interface PlataformTransactionManager. 

<img src="images/c4/4-2-codigo-1.png">

Ahora veamos getTransaction(TrasactionDefinition definition), donde este método nos servirá para saber el estatus en que se encuentra nuestra transacción o, dependiendo del valor de su parámetro, podría ser una nueva transacción. Este parámetro es de suma importancia, porque a través de él podremos definir el comportamiento de nuestra transacción.   

Este método nos devuelve un objeto de tipo TransactionStatus: 

<img src="images/c4/4-2-codigo-2.png">

Aquí podremos conocer mucha información sobre nuestra transacción: si es nueva, si es completa y otras cuestiones más, como se ve en los atributos de la misma.

Para poder usar las transacciones, lo primero que debemos hacer es agregar las siguientes dependencias a nuestro pom.xml:

[Ver código](pdfs/dependency5-1.pdf)

Lo podemos hacer como lo hicimos antes con el STS:

<img src="images/c4/4-2-transacciones-1.png">

Después, cambiamos nuestro archivo de configuración (RootApplicationContexConfig.java) agregando la siguiente anotación @EnableTransactionManagement:

[Ver código](pdfs/dependency5-2.pdf)

Ahora cambiaremos nuestro ContactoController, y con el siguiente código añadiremos un método que inserte un contacto en la base de datos:

[Ver código](pdfs/dependency5-3.pdf)

Si ejecutamos este código y vamos a la url `http://localhost:8080/unidad1/app/contactos/crear` vemos que se ha creado un nuevo contacto bajo el criterio de transacciones.

<img src="images/c4/4-2-transacciones-2.png">

¿Cómo podemos comprobar que esto está funcionando? Para eso activaremos log4j.

Con esta librería seremos capaces de ver todo lo que está pasando según cómo lo configuremos. Lo primero es agregar la dependencia al pom.xml

[Ver código](pdfs/dependency5-4.pdf)

Este archivo lo guardaremos en la carpeta src/java/resources, luego de hacer esto podemos ejecutar nuestra aplicación y ver qué pasa cuando vamos a la url `http://localhost:8080/unidad1/app/contactos/crear` :

<img src="images/c4/4-2-transacciones-4.jpg">

Como podemos observar en la consola, vemos cómo se realiza el commit de la transacción y observamos que todo está efectivamente funcionando de manera correcta, después del mensaje “llamada a metodo en servicio”. 

Ahora veamos que pasaría si la transacción falla. Modifiquemos un poco nuestro código de la tabla contacto para lo que colocaremos ahora este operador: 

<img src="images/c4/4-2-transacciones-5.png">

El nombre debe ser único, por lo que entonces si en el controlador, en el método crearContacto, cambiamos el nombre por uno que ya exista, por ejemplo: 

<img src="images/c4/4-2-transacciones-6.png">

Si ejecutamos esto nos dará un error pero, si revisamos la consola, vemos como se hace un rollback automático de la transacción. 

<img src="images/c4/4-2-transacciones-7.jpg">

Así podríamos ir revisando todos los aspectos de las transacciones para continuar visualizando que el concepto de transacciones es bastante complejo y denso. 

<img src="images/c4/4-2-crusi-1.png">

<img src="images/c4/4-2-crusi-2.png">

### 6. Spring Web Services

Se podría decir que cuando surgió esta idea de los servicios web, revolucionó la manera en que las herramientas de software se comunican y trajo consigo un aporte excepcional a las arquitecturas de software.  

En este apartado veremos cómo Spring nos facilita tanto la implementación de los mismos, como el consumo de estos. Los servicios web simplemente nos enseñan como dos piezas de software pueden compartir información. Pero también se pueden usar como parte de la arquitectura de una misma aplicación separando la capa visual de la lógica y el almacenamiento de datos, permitiendo la comunicación remota de los mismos.  

Esto nos aporta una gran cantidad de ventajas a nivel de seguridad y funcionabilidad, haciendo una aplicación más sostenible en el tiempo, y con mucha más versatilidad en el momento de actualizarla.  

Los servicios web no son más que unos protocolos y estándares de comunicación. 

##### Enlace de interés

En el siguiente enlace tienes un tutorial sobre la creación de servicios web con Spring. 

[Creación de servicios web con Spring](https://www.adictosaltrabajo.com/2009/03/15/springwsexample-1/)

Los servicios web se definen como aquellos estándares y protocolos que permiten la interoperabilidad máquina-máquina a través de las redes de comunicación.  Podemos decir que los servicios web, de manera general, se dividen en dos grandes tipos: 

**Servicios web basados en REST.**

Los servicios web basados en REST, son aquellos que cumplen el estándar de comunicación REST. Pero, ¿qué es REST?

REST (representational state transfer), es un término que se empezó a utilizar por el año 2000 y se podría decir que es un estándar en la arquitectura de software, que es usado con bastante frecuencia en la actualidad.

Este tipo de servicios tienen unas operaciones bien definidas. Las más usadas son PUT, GET, DELETE y POST. Estas, por lo general, se homologan o asimilan con las operaciones de actualizar, leer, eliminar y crear, conocidas en inglés como CRUD (create, read, update, delete), que en castellano sería CLAB (crear, leer, actualizar y borrar).

**Servicios web arbitrarios.**

Los servicios web arbitrarios son aquellos que cumplen funciones distintas a las anteriormente mencionadas. Por lo general son más específicos, o se concentran en ofrecer información particular sobre el sistema.

Entre los estándares más empleados para la implementación de servicios web tenemos:

* XML: usado para el intercambio de datos.
* SOAP: Simple Object Access Protocol.
* HTTP: Hyper Text Transfer Protocol.
* FTP: File Transfer Protocol.
* SMTP: Simple Mail Transfer Protocol.
* WSDL: Web Services Description Language.
* REST: Representative State Transfer.
* JSON: JavaScript Object Notation.

Nosotros nos concentraremos en los siguientes apartados en los servicios web basados en REST. 

#### 6.1 REST

Como hemos visto anteriormente, REST es un estándar de comunicación para servicios web, el cual debe seguir y respetar ciertas pautas.   

Las características principales para que lo anterior se cumpla son: 

* Debe poseer las siguientes operaciones básicas: Crear, actualizar, eliminar, borrar y listar. 
* El uso de una interfaz uniforme, es decir, que cada recurso debe de poder acceder a través de una url única enmarcada en el uso de alguno de los métodos GET, PUT, POST, DELETE … etc. 
* Debe ser una arquitectura de cliente – servidor. 
* Las operaciones no deben poseer un status asociado, y cualquier cambio de status debe ser manejado en el lado del cliente. * Todos los recursos deben ser posible almacenarlos en cache a menos que sea explícitamente requerido lo contrario. 
* Debe ser multicapas. 

También es importante generar una documentación para esto ya que se supone que nuestro servicio podría ser usado por muchas personas en el futuro.  

Teniendo en cuenta estas características, debemos empezar a pensar en diseñar nuestra propia REST api. 

<img src="images/c4/4-2-rest-1.png">

*Esquema de REST*

De este modo, el flujo sería más o menos así: el cliente hace una petición http, que puede ser de varios tipos, como POST, GET, DELETE, PUT. Esta es recibida en el servidor por la API REST, la cual, según lo requerido, se comunica con la base de datos y responde en algunos de estos formatos: XML o JSON. Posteriormente, esto es recibido en el cliente, que se encargará de hacer lo que deba con esta información, ya sea mostrarla en la pantalla de alguna manera u otra. 

##### Enlace de interés

Aquí podrás conocer más detalles sobre la creación de servicios REST en Spring. 

[Creación de servicios REST en Spring](https://www.arquitecturajava.com/spring-rest-service-con-restcontroller/)

Para hacer todo esto en Spring MVC nos valdremos de todos los recursos que ya hemos aprendido, así como de unas librerías nuevas que nos darán mucha más facilidad en este aspecto.  

Lo primero que haremos será darle un vistazo a la librería JPA.  

JPA son las siglas en inglés de JAVA Persistence Api. Es decir, es la API para la persistencia de JAVA y está definida en el paquete javax.persistence.  

Esta API usa un lenguaje para las consultas que se llama JPQL (Java Persistence Query Language) y su objetivo principal de esta API es permitir la persistencia de datos, sin perder las relaciones de la POO (Programación orientada a objetos).  

En JPA se considera que un objeto puede ser almacenado y, para hacer esto, dichos objetos deben ser entidades de persistencia. En java utilizaremos la anotación @Entity y la debemos colocar al principio de la clase.  

Además de esto, tenemos muchas anotaciones que nos serán de gran utilidad para hacer nuestros objetos persistentes. Podremos definir campos de tipo autogenerados para los IDs y claves primarias; podremos especificar el nombre de la tabla que los almacenará; también podremos especificar relaciones con otras entidades, etc.

Veamos esto en la práctica, para lo que crearemos un nuevo proyecto:  

En primer lugar iremos al menu file -&gt; new -&gt; Spring Starter Project 

<img src="images/c4/4-2-rest-2.jpg">

*Formulario para creación de proyecto*

A continuación le damos a next y nos aparece este segundo formulario:

<img src="images/c4/4-2-rest-3.jpg">

*Continuación de la creación de un proyecto*

En este formulario elegiremos dentro del apartado web, Spring Web Starter y luego le daremos a finalizar. Esto nos creará una estructura básica de directorios e importará automáticamente las dependencias necesarias para nuestra API REST. 

A continuación le damos a next y nos aparece este segundo formulario:

<img src="images/c4/4-2-rest-4.jpg">

En este formulario elegiremos dentro del apartado web, Spring Web Starter y luego le daremos a finalizar. Esto nos creará una estructura básica de directorios e importará automáticamente las dependencias necesarias para nuestra API REST. 

Crearemos las siguientes clases:  

Bajo el paquete com.restejemplo  

ContactoController.java, que tendrá el siguiente contenido: 

<img src="images/c4/4-2-rest-5.png">

Para ejecutar esto y ver si todo funciona, basta con dar click en Run as -&gt; Spring Boot App: 

<img src="images/c4/4-2-rest-6.jpg">

*Como ejecutar el código*

Después iremos al navegador y colocamos la siguiente ruta: localhost:8080/contacto  
Y obtendremos la siguiente salida: 

<img src="images/c4/4-2-rest-7.png">

Ahora, que sabemos que todo va bien, continuamos.

Creemos un objeto domain, que será persistido:

[Ver código](pdfs/objeto_domain_6-2.pdf)

Aquí vemos que hemos añadido unas cuantas anotaciones para indicar que nuestro objeto será persistido por JPA.

Hemos agregado @Entity a la clase para hacerla persistente. Hemos agregado @Id para marcar como clave primaria y @GeneratedValue  con el tipo GenerationType.AUTO, configurando así un campo que será autoincrementado. También hemos marcado el campo createDateTime y lo hemos colocado como @CreationTimestamp. Esto nos almacenará automáticamente la fecha de creación.

Ahora crearemos la interfaz del repositorio con el siguiente codigo:  

En el paquete com.restejemplo.repository 

<img src="images/c4/4-2-rest-8.png">

Y este repositorio lo usaremos en el servicio, que quedará de la siguiente manera:

En el paquete com.restejemplo.service

[Ver código](pdfs/package_com_restejemplo_controller_6-2.pdf)

Como podemos observar, la interfaz del repositorio hereda de CrudRepository, lo que hace que nuestro repositorio tenga ya los metodos del CRUD.

Posteriormente tenemos que hacer nuestro controlador, que debe tener todos lo metodos necesarios para hacer una api rest. Para que cumpla con los requisitos, debería quedar algo como esto:

En el paquete com.restejemplo.controller

[Ver código](pdfs/package_com_restejemplo_controller_6-3.pdf)

Ahora, simplemente le damos a ejecutar como aplicación Spring Boot, como lo hicimos antes.  

Si todo va bien, al acceder a la dirección localhost:8080/ veremos nuestro saludo programado anteriormente en el controlador: “Hola Contacto”   

Ahora debemos probar si nuestra REST funciona. Para ello debemos instalar una herramienta para poder hacer peticiones a nuestro servidor.  

Instalaremos la más utilizada: Postman. Desde aquí https://www.getpostman.com/downloads/ descargamos la versión más reciente disponible según nuestro sistema operativo. Procedemos a instalarla, que es muy sencillo. Una vez instalada la abrimos y nos saldrá algo similar a esto. 

<img src="images/c4/4-2-postman.png">

##### Enlace de interés

En el siguiente enlace podrás leer sobre las experiencias de un desarrollador utilizando Postman. 

[Postman](https://www.paradigmadigital.com/dev/postman-gestiona-construye-tus-apis-rapidamente/)

Le damos a Request y ahí nos saldrá otra pantalla, tal que así:

<img src="images/c4/4-2-postman-2.jpg">

*Request en Postman*

Como podemos ver, tenemos un campo donde podemos elegir el tipo de peticion: GET, POST, DELETE, PUT y otras. 

Elegiremos GET. Ahora, en el campo de URL, colocaremos la dirección de nuestro API REST: localhost:8080/contactos y presionamos en el boton Send: 

<img src="images/c4/4-2-postman-3.jpg">

*Selección de GET*

Como podemos ver, obtenemos una respuesta de un array vacio [] y no hay error. Eso quiere decir que todo es correcto, pues no hemos añadido nada aún. Ahora agregaremos un contacto. 

Elegiremos el metodo POST y crearemos un header con el key Content-Type y el value será application/json. Tras esto, en el apartado de body, agregaremos un objeto json como este: 

<img src="images/c4/4-2-postman-4.png">

Luego le daremos enviar y si todo es correcto obtendremos una salida con el objeto que acabamos de crear y su id: 

<img src="images/c4/4-2-postman-5.png">

Podríamos seguir probando todos los metodos de esta manera. Si le damos un GET, como en la primera petición que hicimos, el array ya no estará vacío. Ahora tendrá el objeto que acabamos de crear.  

De este modo hemos creado nuestra primera API REST con Spring.

<img src="images/c4/4-2-video-1.png">

[Video](https://www.youtube.com/watch?v=CodAbAGvTsg&feature=emb_logo)

<img src="images/c4/4-2-arrastrar-1.png">

<img src="images/c4/4-2-arrastrar-2.png">

### 7. Spring Security

Spring Security es un Framework dentro de Spring que nos ofrece un control de acceso para las aplicaciones basadas en el propio Spring. Es muy sencillo de implementar y, además, tiene un alto grado de adaptabilidad, permitiendo que sea extendido de manera sencilla.  

Dentro de sus características principales están: 

* Soporte para autenticación y autorización. 
* Protección contra ataques. 
* Integración con API. 
* Integración con Spring MVC. 

### Enlace de interés

En el siguiente enlace encontrarás un tutorial que muestra cómo configurar Spring Security en nuestros proyectos Java. 

[Configurar Spring Security](https://cleventy.com/configurando-spring-security/)

#### 7.1 Cómo funciona Spring Security

Supongamos que tenemos una aplicación y no queremos que determinadas personas puedan tener acceso a ciertas páginas y a ciertas peticiones particulares. Ahí es donde Spring security nos va a ayudar.  

Crearemos una aplicación básica con una home y veremos cómo podemos aplicarle Spring Security.  

Lo primero que haremos será crear un nuevo Proyecto en STS de tipo Maven, como ya lo hicimos al inicio de este curso. Para ello seleccionamos “create simple Project”. 

<img src="images/c4/4-2-security-1.jpg">

*Creación de un nuevo proyecto*

Luego, cumplimentamos los datos del proyecto de la siguiente manera y le damos finalizar. 

<img src="images/c4/4-2-security-2.jpg">

*Configuración del nuevo proyecto*

Después de esto vamos a añadir las dependencias necesarias en nuestro pom.xml, que quedará así:

[dependencias en nuestro pom.xml](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD4_P2/dependencias%20en%20nuestro%20pom.xml%20(7.1).pdf)

Podemos simplemente editar el pom.xml, o ir agregando las dependencias como lo hemos estado haciendo anteriormente. Después de guardar se irán descargando las dependencias automáticamente. Como podemos ver en el código hay dos dependencias nuevas spring-security-config y spring-security-web.

Ahora crearemos los archivos de configuración (todos bajo el paquete webasegurada.config):

Primero el DispatcherServletInitializer.class

[package webasegurada.config](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD4_P2/package%20webasegurada.config%20(7.1).pdf)

Como podemos ver en el getRootConfigClasses, este retorna null. Eso se debe que no usaremos ninguna base de datos en esta ocasión.

Creemos el WebApplicationContextConfig.class

[package webasegurada.config_2](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD4_P2/package%20webasegurada.config_2%20(7.1).pdf)

Esta última codificación es muy similar a la creada anteriormente.

Ahora sí que crearemos dos nuevos. El primero será:

SecurityConfig.class

[package webasegurada.config_3](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD4_P2/package%20webasegurada.config_3%20(7.1).pdf)

Y el otro será SecurityWebApplicationInitializer.class

<img src="images/c4/4-2-security-3.png">

En los ejemplos anteriores podemos observar el uso en el primero de @EnableWebSecurity. Con esto indicamos que se debe activar la seguridad en nuestra página. Más abajo podemos ver que inyectamos un método con la etiqueta @Autowire configureGlobalSecurity, en el cual configuramos la autenticación en memoria configurando un usuario un administrador. 

Luego, en el método de configuración, colocamos toda la información necesaria para que nuestro módulo funcione correctamente en las distintas url donde enviará Spring Security según sea el caso. 

Ahora vamos a crear dos controladores: uno para el home y otro para el login, todos bajo el paquete webasegurada.controller: 

**HomeController.class**

<img src="images/c4/4-2-security-4.png">

**LoginController.class**

<img src="images/c4/4-2-security-5.png">

Ya casi tenemos todo listo. Únicamente nos falta crear las vistas para nuestros controladores. Para ello crearemos dos home y login en la carpeta src/main/webapp/WEB-INF/vistas:

[home.jsp](pdfs/home_jsp.pdf)

[login.jsp](pdfs/login_jsp.pdf)

Ahora podemos ejecutar nuestra aplicación mediante Run as -&gt; Run on Server:  

Si visitamos el localhost:8080/webasegurada 

<img src="images/c4/4-2-security-6.jpg">

*Resultado de la ejecución del código*

Como podemos ver nos redirecciona a la pantalla de login que hemos creado, ahora podremos registrarnos con los datos que hemos configurado y ese proceso nos llevaría a nuestra home.jsp 

<img src="images/c4/4-2-security-7.jpg">

*Resultado de la redirección*

Por tanto, ya hemos configurado satisfactoriamente Spring Security.

<img src="images/c4/4-2-crusi-3.png">

<img src="images/c4/4-2-crusi-4.png">

### 8. Spring Test

Una de las tareas que puede llevar una gran cantidad de tiempo y esfuerzo es el testing de nuestras aplicaciones. Gracias a las herramientas que nos proporciona Spring podremos probar nuestras aplicaciones de manera efectiva.  

Aunque realizar casos de test en nuestra aplicación nos puede ayudar a mejorar la seguridad, esto se suele dilatar mucho en el tiempo y requiere de esfuerzos que no podremos dedicar a introducir ninguna otra mejora a la funcionalidad de nuestra aplicación. Además, cuando nuestra aplicación crezca y escale debemos garantizar que esos mismos tests funcionen y no entren en conflicto con las características que vamos sumando a nuestra aplicación.  

Ahí es donde Spring Test surge para ser nuestro framework para las pruebas de nuestra aplicación. 

##### Enlace de interés

En el siguiente enlace tienes más información sobre las pruebas unitarias en Spring. 

[Pruebas unitarias en Spring](https://www.adictosaltrabajo.com/2008/02/17/gienah/)

#### 8.1 Pruebas unitarias

En el desarrollo de software los test unitarios o pruebas unitarias, consisten en probar las partes más pequeñas de nuestra aplicación llamadas unidades. Estas partes deben ser independientes y en ellas verificamos que se dé el comportamiento esperado.   

Para probar nuestra fuente debemos utilizar una herramienta de software llamada JUnit.  

Para hacer esto lo primero es añadir la dependencia de JUnit, lo que haremos sobre el proyecto del apartado anterior.  

Agregaremos Junit al pom.xml 

<img src="images/c4/4-2-junit-1.jpg">

*Agregación de JUnit*

##### Enlace de interés

En el siguiente enlace tienes más información sobre las pruebas unitarias en Spring. 

[Pruebas unitarias en Spring](https://www.adictosaltrabajo.com/2008/02/17/gienah/)

Ahora agregaremos un Domain para probarlo. Creemos el archivo Contacto.java en el paquete webasegurada.domain en la carpeta src/test/java

[package webasegurada.domain](pdfs/package_webasegurada_domain_8-1.pdf)

Una vez que hemos agregado el método getEdad(), que será el método que queremos probar con nuestro test. También crearemos la clase ContactoTest.java en el paquete webasegurada.domain en la carpeta src/test/java:

[package webasegurada.domain_2](pdfs/package_webasegurada_domain_8-2.pdf)

A continuación ejecutaremos este test. Para eso solo tenemos que ir al menú Run as y ahí tenemos la opción Junit Test sobre el test que queremos ejecutar: 

<img src="images/c4/4-2-junit-2.jpg">

Tras esto tendremos la siguiente salida:

<img src="images/c4/4-2-junit-3.jpg">

Como podemos observar tenemos un error, la salida esperada es 35 y el método ha devuelto 1935. Ahora debemos reparar el método que calcula la fecha. Veamos. 

<Reparemos el error anterior: remplacemos el método getEdad() en Contacto.java

[método getEdad](pdfs/metodo_getEdad_8-1.pdf)

Agregamos los imports necesarios:

<img src="images/c4/4-2-junit-4.png">

Ahora ejecutando este test nuevamente la salida será la siguiente:

<img src="images/c4/4-2-junit-5.jpg">

A lo largo de este apartado hemos escrito un método que calcula la edad en función de la fecha de nacimiento, y en base a esto hemos creado un test para verificar que funciona basándonos en la librería junit. Hemos usado la anotación @Test que indica que la clase que se va a declarar es un test. Después hemos usado la anotación @Before.  

Nuestro método para hacer test contacto_edad_de_nacimiento_en_funcion_de_fecha() está dividido en tres partes lógicas que están comentadas: 

* Preparación 
   La primera parte es Preparación. Aquí colocamos todas las precondiciones necesarias para nuestro test y cargamos toda nuestra entrada. En nuestro caso sería cargar una fecha de nacimiento, para la cual sepamos cual debería ser el resultado.

* Acción
   Luego viene la acción, donde ejecutaríamos el método que deseamos probar. En este caso es getEdad, el cual nos devuelve un int.
   
* Afirmación
   Luego vendría la parte de Afirmación, donde usamos la API de Junit Assert.assertEquals(35,edad). Con este método chequeamos la igualdad del resultado.

#### 8.2 Integración con Spring Test

Cuando integramos distintos test unitarios y los testeamos como grupos estamos realizando una integración de test. Para integrar nuestros test en el contexto de Spring vamos a usar la librería spring-test. Ahora la importamos a nuestro proyecto. 

<img src="images/c4/4-2-integracion-1.png">

También debemos agregar la librería jsp-api:

<img src="images/c4/4-2-integracion-2.png">

Ahora validaremos el correcto funcionamiento de los controladores, para ello crearemos un test para el controlador de la home:

[package webasegurada.controller](pdfs/package_webasegurada_controller_8-2.pdf)

Si ejecutamos esto, obtendremos la siguiente salida:

<img src="images/c4/4-2-integracion-3.jpg">

La imagen anterior nos indica que todo está bien. Pero, ¿qué paso ha tenido lugar? Si revisamos el test unitario que hemos ejecutado vemos que posee una etiqueta @Before como el test anterior donde preparamos todo el terreno para hacer nuestras pruebas. Ahora cabe destacar que spring-test no corre si no tenemos instalado el junit. Tenemos una inyección de un atributo llamado wac de tipo WebApplicactionContext y más arriba en la cabecera de la clase tenemos @ContextConfiguration indicando el nombre de nuestro archivo de configuración. Con esto le indicamos a Spring test el contexto en que debe ejecutar nuestra aplicación para el test. En este caso un contexto web.  

También, vemos la llamada al testGetHome, que realiza una llamada al mockMvc y hace una llamada al método get en la url “/” y con el método andExpect le pasamos el status esperado, que sería un ok o 200. Con esto garantizamos que nuestra home está cargando correctamente. En este punto podríamos añadir más pruebas según sea necesario. 

Ahora veremos cómo hacer test sobre la API REST que habíamos creado en apartados anteriores.

En la carpeta src/test/ creamos nuestro test bajo el paquete com.restejemplo.controller.

[package com.restejemplo.controller](pdfs/package_com_restejemplo_controller.pdf)

Luego ejecutamos esto como anteriormente lo hemos hecho Run as -&gt; Junit Test

<img src="images/c4/4-2-integracion-4.jpg">

Ahora, cómo podemos ver, hemos simulado un contexto para probar nuestra api, utilizando las anotaciones @SpringBootTest @AutoConfigureMockMvc , de igual manera debemos inyectar una instancia de MockMvc.  

Luego abajo podemos poner la cantidad de tests necesarios para nuestra api y las posible respuestas implicadas. De nuevo, podemos generar de forma análoga con esta misma api todos los test de los métodos restantes. 

<img src="images/c4/4-2-crusi-5.png">

<img src="images/c4/4-2-crusi-6.png">

### 9. Capacidades específicas

Alrededor del framework Spring, por su popularización, se han generado multitud de proyectos que pretenden especializar y potenciar las capacidades de Spring para dar respuesta a retos y necesidades concretas. 

<img src="images/c4/4-2-logo-spring.png">

#### 9.1 Spring Mobile

Dada la creciente popularización del uso de los dispositivos móviles en los últimos años, se ha creado una extensión de Spring MVC como es Spring Mobile. El objetivo principal de Spring Mobile es simplificar el desarrollo de aplicaciones web en movilidad.  

Spring Mobile es un framework o marco de trabajo que no aporta capacidades añadidas para la detección del tipo de dispositivo que realiza una petición a un sitio web desarrollado con Spring. 

##### Enlace de interés

La web oficial de Spring Mobile, donde podrás descargar el software, manuales, casos de uso, consultar dudas, etc. 

[Spring Mobile](https://projects.spring.io/spring-mobile/)

Entre las características de Spring Mobile podemos destacar:

**Nos abstrae del proceso de identificación**

Nos abstrae del proceso de identificación del móvil o tableta desde el cual se está accediendo, realizando este proceso desde el lado del servidor.

**Simplifica la gestión de preferencias de la aplicación web**

Simplifica la gestión de preferencias de la aplicación web ya que de modo muy sencillo el usuario puede decidir si prefiere la vista normal o de escritorio, la vista mínima para móvil o la visualización intermedia para Tablet.
 
**Se reduce a un selector sencillo**

El punto anterior es muy usable porque se reduce a un selector sencillo donde claramente se presenta la vista que está siendo utilizada y que puede ser cambiada a voluntad del usuario.
 
**Implementa una gestión y administración de las vistas**

Implementa una gestión y administración de las vistas para que el equipo de desarrollo pueda crear aquellos entornos que considere necesarios en base al perfil de su cliente.

##### Bibliografía recomendada

Donald, K. Clarkson, R. Spring Mobile Reference Documentation.

[Spring Mobile Reference Documentation](https://docs.spring.io/spring-mobile/docs/2.0.0.M3/reference/html/)

#### 9.2 Spring Social

Spring tampoco es ajeno a la importancia de las redes sociales en los tiempos actuales. Por este motivo, se ha creado un proyecto dentro de Spring que es Spring Social.  

El objetivo de Spring Social es simplificar como se integran las aplicaciones desarrolladas bajo el framework Spring con las redes sociales líderes de mercado como Facebook o Twitter.  

El beneficio principal de Spring Social es lo sencillo que se hacer la autenticación oAuth con la cuenta del usuario en dichas redes sociales. 

##### Bibliografía recomendada

Walls, C., Donald, K. Clarkson, R., Turnquist, G. Spring Social Reference.

[Spring Social Reference](https://docs.spring.io/spring-social/docs/2.0.0.M4/reference/htmlsingle/)

##### Enlace de interés

La web oficial de Spring Social donde podrás descargar el software, manuales, casos de uso, consultar dudas, etc. 

[Spring Social](https://projects.spring.io/spring-social/)

#### 9.3 Spring Android

Se trata de una extensión de Spring que proporciona componentes en el desarrollo de aplicaciones móviles para ser ejecutadas en el popular sistema operativo Android.  

La iniciativa Spring Android facilita el uso del marco Spring en plataformas Android. Esto incluye la posibilidad de utilizar RestTemplate como cliente REST para las aplicaciones en el teléfono móvil. Spring Android también nos proporciona soporte para integrarnos con la funcionalidad de Spring Social, incluyendo su potente mecanismo de autorización basado en OAuth. 

##### Para saber más ...

Consulta el siguiente tutorial de Spring Android.

[Spring Android](https://hop2croft.wordpress.com/2011/02/27/spring-android-instalacion/)

##### Enlace de interés

La web oficial de Spring Android donde podrás descargar el software, manuales, casos de uso, consultar dudas, etc. 

[Spring Android](https://projects.spring.io/spring-android/)

#### 9.4 Spring Boot

Spring Boot viene a dar respuesta a la creciente popularización de los microservicios.  

Los microservicios son una forma de estructurar las arquitecturas informáticas basándonos en la creación de pequeños servicios, que se ejecutan de forma independiente, pero que están en comunicación constante con otros microservicios normalmente a través del protocolo HTTP y de las APIs.  

En las arquitecturas de microservicios suele ser común que un bloque de servicios sea gestionado de forma común, por ejemplo, el acceso a las fuentes de información, pero el resto de microservicios sean completamente autónomos y resuelvan problemas específicos de cada negocio.  

Spring Boot, para facilitar la programación de microservicios intenta abstraer al programador de las tareas pesas de configuración para que pueda dedicar más tiempo a la creación de estos pequeños y ligeros servicios que se integren con otros dentro de un ecosistema global y abierto. 

Spring Boot aporta entre otras capacidades, las siguientes:

**Auto-configuración de los parámetros**

Auto-configuración de los parámetros necesarios para evitar que el micro servicio se tenga que responsabilizar de ello.

**Resuelve las dependencias de forma trivial**

Resuelve las dependencias de forma trivial por lo que el desarrollador de microservicios no tiene que preocuparse de la inclusión de librerías y otras dependencias.
 
**Facilita la ejecución independiente de los microservicios**

Facilita la ejecución independiente de los microservicios, tanto en formato “stand alone” como en entornos web.
 
**Incluye herramientas para la mejor monitorización del microservicio**

Incluye herramientas para la mejor monitorización del microservicio, consumo de memoria, beans en uso, etc.

##### Para saber más ...

Consulta la página oficial de Spring Boot.

[Spring Boot](https://spring.io/projects/spring-boot)

<img src="images/c4/4-2-crusi-7.png">

<img src="images/c4/4-2-crusi-8.png">

### Resumen Final

En esta unidad hemos conocido la historia del Framework Spring MVC, la motivación por la que surge y los beneficios implícitos que hacen necesario el uso de un framework.  

También hemos estudiado la estructura básica que tiene Spring MVC y conocido el patrón MVC.  

Hemos preparado nuestro entorno de desarrollo, con las distintas herramientas que nos facilitarán nuestro trabajo e incursión en el mundo de Spring MVC, configurando las variables de entorno e instalando STS, Maven y Tomcat.  

También hemos visto cómo hacer nuestra primera aplicación con Spring MVC de manera fácil y rápida, comprobando como Spring nos facilita toda nuestra actividad, al igual que STS nos ayuda como entorno de trabajo.  

Hemos estudiado el contexto y cómo este modifica nuestra aplicación. También hemos accedido a una base de datos en memoria, creándola e insertando datos vía sql, también recopilamos información de esta misma y vimos cómo configurarla desde el repository y como Spring nos ofrece distintas anotaciones para que todo esto sea posible de manera ordenada y rápida. 

Además, hemos aprendido como usar POA en nuestro proyecto y cómo nos son de utilidad para mejorar su eficiencia, evitando que repitamos código.   

Hemos analizado cómo usar la librería AspectJ, como declarar sus dependencias y también como implementarla de manera sencilla a través de las anotaciones @Aspect, @Before y @EnableAspectJAutoProxy.  

También, hemos hablado de los servicios web con Spring y los beneficios que nos aportan a nuestra arquitectura en el uso diario.   

Hemos aprendido a implementar una API REST de manera sencilla y rápida con Spring y analizado conceptos básicos de JPA. También, a configurar de manera simple y rápida nuestras aplicaciones.   

Por último,  hemos visto cómo hacer test a lo largo de nuestra aplicación, así como los beneficios que implica su uso. 

### BIBLIOGRAFÍA

* Pérez Martínez, Eugenia. (2015). Desarrollo de aplicaciones mediante el framework de Spring. Ra-Ma Editorial.
* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill.
* Pérez Martínez, Eugenia (2018). Spring 5. Anaya Multimedia.
* Walls, Craig. (2015) Spring. Anaya Multimedia
* Spring. Recuperado de: https://spring.io/
* Java EE. Recuperado de: https://www.arquitecturajava.com/
* Programación orientada a objetos (POO). Recuperado de: https://compu2poo.wordpress.com/
* La web del programador. Recuperado de: https://www.lawebdelprogramador.com/

