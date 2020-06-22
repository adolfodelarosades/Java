# 5. JPA en EJBs 39:50

* 17 Utilización de JPA con Enterprise JavaBeans 04:42
* 18 El servidor Glassfish 05:11
* 19 Creación de un DataSource 11:20
* 20 Ejercicio práctico III 17:57
* Autoevaluación IV 00:40

# 17 Utilización de JPA con Enterprise JavaBeans 04:42

<img src="images/17-01.png">

Aunque los ejemplos vistos hasta el momento hemos utilizado JPA dentro de clases normales Java, es muy habitual encapsular toda la lógica de negocio en muchas aplicaciones empresariales dentro de los llamados Enterprise Java Beans o EJB.

<img src="images/17-02.png">

Y qué es exactamente un EJB, un EJB es una especificación que forma parte de Java EE para la creación de componentes que encapsula la lógica de negocio de una aplicación.

Estos componentes no se ejecutan directamente sobre la máquina virtual Java como una clase normal sino que se ejecuta sobre un contenedor EJB, que formaría parte del Servidor de Aplicaciones y que proporciona una serie de beneficios a la hora de implementar esa lógica de negocio.

La Lógica de Negocio como tal realmente se va a crear en clases, es decir crear un EJB no es muy diferente a crear una clase normal Java, lo único que también se exponen los métodos a través de una interfaz de negocio, que es lo que realmente utilizan los clientes, es decir la Capa del Controlador o Servlet por ejemplo para poder acceder a esa Lógica de Negocio, no accede directamente a la clase sino que lo hace a través de la interfaz de negocio para que sea el contenedor el que gestione directamente la clase y proporcione esos beneficios que ahora vamos a comentar brevemente, los que nos interesan realmente de cara a JPA.

Un entorno de Java Beans se puede crear dentro de un módulo Web con los JSP como hemos visto hasta ahora con las clases normales o en módulos EJB independientes para que puedan ser reutilizados desde muchas aplicaciones.

<img src="images/17-03.png">

Bien como te decía el Contenedor de EJB proporciona una serie de servicios que benefician al programador a la hora de realizar determinadas tareas que no va a tener que programar. En lo que a nosotros nos concierne es decir de cara a implementar la lógica de negocio con JPA dentro de un EJB, pues esos beneficios son:

* *Inyección de Dependencia* y
* *Gestión Automática de Transacciones*


Qué es eso de *Inyección de Dependencia*, bueno pues que el objeto `EntityManager` que nosotros hemos creado hasta ahora con código a través de  `Persistence`, `EntityManagerFactory`, etc., es decir:

```jav
EntityManagerFactory factory = Persistence.createEntityManagerFactory("615-01_ejemplo_jpa");
EntityManager em = factory.createEntityManager();
```

O así:

```java
//Método que permite obtener el objeto EntityManager
private EntityManager getEntityManager() {
   EntityManagerFactory factory = Persistence.createEntityManagerFactory("615-02_web_jpa");
	 return factory.createEntityManager();
}
``` 

si implementamos toda esa lógica dentro de un contenedor EJB no vamos a tener que crear todas esas instrucciones, a través de la anotación `@PersistenceContext` le vamos a decir al contenedor EJB de que unidad de persistencia queremos obtener el `EntityManager` y ya se encargará él de hacer todo el proceso de crear el objeto e inyectarlo en la variable `em`:

```java
@PersistenceContext(name ="unidad_persistencia")
private EntityManager em;
```
Esto va a suponer un ahorro de código, pero no sólo eso también la gestión automática de transacciones es decir el contenedor EJB se va a encargar de a nivel de cada método de negocio iniciar una transacción , confirmarla o rechazarla si se produce alguna excepción en tiempo de ejecución. Por lo tanto lo de Transaction, iniciar transacciones con `begin()` confirmarlas es algo que también nos vamos a poder ahorrar. Es decir esto que antes metiamos en nuestros ejemplos pasados:

```java
EntityManagerFactory factory = Persistence.createEntityManagerFactory("615-01_ejemplo_jpa");
EntityManager em = factory.createEntityManager();

//Inicio de una transacción
EntityTransaction tx = em.getTransaction();
tx.begin();

//Eliminación de un contacto
c = em.find(Contacto.class, 33);
em.remove(c);

//Confirmar transacción
tx.commit();
```
puesto que se van a gestionar automáticamente con el contenedor, controlándolo eso sí a través de una anotación `@TransactionAttribute` que vamos a utilizar a nivel de cada método para indicar cómo queremos que se comporte nuestro método a nivel de transacciones.

<img src="images/17-04.png">

<img src="images/17-05.png">

Existen distintos valores que se pueden asignar a esa anotación que están definidos dentro de una serie de constantes en la numeración `TransactionAttributeType` como por ejemplo:

* `MANDATORY` que indicaría que para poder ejecutar ese método debe haberse ya iniciado una transacción anteriormente y que el método participara de esa transacción.

* `REQUIRED` es que si hay una transacción el método va a participar en ella y si no iniciará una nueva.

* `REQUIRES_NEW`

* `SUPPORTS`

* `NOT_SUPPORTED`

* `NEVER`

estos son seis posibles valores que puede tomar esta anotación.

Anotación que por otro lado no va a ser obligatorio incluir a nivel de cada método puesto que hay un valor por defecto es precisamente `REQUIRED`. Es decir cuando se hace un llamado a un método de un EJB, si hay una transacción ya iniciada por el cliente que ha hecho la llamada, pues ese método participará dentro de la transacción y si no se encargará el contenedor de iniciar una nueva y confirmarla al final.

Por lo tanto eso significa que nuestro método siempre va a contener todas las instrucciones dentro de una transacción y por lo tanto no será necesario que nosotros explicitamente las iniciemos como hemos hecho hasta ahora.

Bien pues vamos a ver después en la siguiente lección vamos a explicar cómo configurar nuestro entorno de desarrollo para trabajar con EJB y a continuación veremos una nueva versión de la agenda de contactos implementada con EJB.

# 18 El servidor Glassfish 05:11

<img src="images/18-01.png">

El servidor de aplicaciones Tomcat que hemos utilizado los ejemplos que hemos creado hasta el momento en aplicaciones web no incluye contenedores EJB.

Es por eso que necesitamos descargar e instalar un servidor que incluya este contenedor en nuestro caso vamos a ver cómo trabajar con GlassFish,

<img src="images/18-02.png">

<img src="images/18-03.png">

<img src="images/18-04.png">

El servidor GlassFish incluye un contenedor EJB y lo podemos descargar de esta dirección https://www.payara.fish/downloads/#community. Una vez descargado y descomprimido puesto que se distribuye como un zip lo tendremos que registrar en Eclipse. Lo que pasa es que en Eclipse tal cual lo hemos descargado las primeras lecciones y si has seguido los pasos que yo te he explicado hasta el momento y no has incluido ninguna otra cosa más y no lo tenían ya creado antes o instalado de antes pues probablemente vas a necesitar este plugin Glassfish Tools que ahora mismo te explicaré también cómo descargarlo e instalarlo.

Lo primero vamos a descargar el servidor, nos vamos a ir a la dirección https://www.payara.fish/downloads/#community que aparecía en la transparencia y entraremos en la web de Payara, Payara es una implementación completa del servidor Glassfish que podemos descargarla pulsando este botón.

<img src="images/18-05.png">

<img src="images/18-06.png">

Al pulsarlo nos va a pedir que descargamos el archivo zip lo descargamos lo descomprimir en la carpeta donde queramos tenerlo y descomprimir. Se creará una carpeta `payara5` dentro de la cual tendremos una carpeta `glassfish` que corresponde con el directorio raíz de nuestro servidor de aplicaciones. Ahí dentro ya tienen las carpetas propias de `glassfish`.

<img src="images/18-07.png">


Nota: Las descargas echas en Payara no funcionarón, por lo que se procedio a descargar GlassFish del siguiente enlace https://javaee.github.io/glassfish/download.

<img src="images/18-07-2.png">

Se descargo el archivivo `glassfish-5.0.1.zip` se descomprimio 

<img src="images/18-07-3.png">

Este descarga de GlassFish es la que se usará más adelante ya que la de Payara nunca la acepto en un paso que se va a ejecutar posteriormente a la hora de instlar el servidor GlassFish.

Una vez que ya lo tenemos descargado y descomprimido nos vamos a Eclipse. Y qué tenemos que hacer en Eclipse pues registrarlo. En principio tenemos que seguir los mismos pasos que seguimos para registrar el servidor Tomcat es decir nos vamos a las Preferences del proyecto, en Server - Runtime Environment.

<img src="images/18-08.png">

Presionamos el botón Add.

<img src="images/18-09.png">

Qué ocurre, pues que muestra algunas opciones pero la categoría GlassFish no aparece, es necesario instalar el plugin GlassFish Tools para poder disponer de esta opción y que nos permita registrar GlassFish.

Entonces antes de intentar registrarlo nos vamos a ir a Help - Eclipse Marketplaces y ahí vamos a buscar las GlassFish Tools pulsamos el botón de búsqueda y nos aparecerá GlassFish Tools.

<img src="images/18-10.png">

Aquí me aparece el botón `Install` lo pulsamos.

<img src="images/18-11.png">

<img src="images/18-12.png">

recién instalado que aparecerá al instar para que instales pulsas el botón y sigues todos los pasos con las opciones por defecto hasta el final tras instalar las GlassFish Tools te pedirá reiniciar Eclipse se reinicia.

Con estos pasos me fue imposible la instalación segui los siguientes pasos:

```sh
Go to Help > Install New Software...

Add the GlassFish Tools Update Site

http://download.eclipse.org/glassfish-tools/1.0.0/repository

as repository (or add the URL under Work with: directly) and install the tools via the wizard.
```

<img src="images/18-14.png">

<img src="images/18-15.png">

<img src="images/18-16.png">

Se me pide reiniciar Eclipse.

Una vez que se vuelve a cargar Eclipse nuevamente nos vamos a las Preferences del Proyecto en la pestaña Server - Runtime Environment, presionamos el botón Add.

<img src="images/18-17.png">

<img src="images/18-18.png">

Ahora sí ya tendrás GlassFish lo seleccionamos 

<img src="images/18-19.png">

y vamos al siguiente paso

<img src="images/18-20.png">

y aquí lo que nos va a decir es el nombre del servidor `GlassFish` y nos pide la localización de la carpeta donde hemos descomprimido el servidor `GlassFish` al igual que el JDK de Java.

<img src="images/18-21.png">

Ahora ya tenemos nuestro servidor GlassFish

<img src="images/18-22.png">

Ya lo podremos usar en nuestros proyectos, pero lo tenemos que registrar dentro de los Servers.

<img src="images/18-23.png">

actualmente tenemos Tomcat en la carpeta de servidores, podemos seguir manteniendo Tomcat sin ningún problema o lo podemos quitar si no lo queremos. Para añadir GlassFish sería botón derecho y elegiríamos New - Server

<img src="images/18-24.png">

Nos pide otra vez el tipo de servidor, vamos a GlassFish y ahora ya sabe dónde está simplemente nos aparece aquí su nombre, el nombre que se le dió cuando lo registramos

<img src="images/18-25.png">

en el siguiente paso dejamos estos valores por defecto

<img src="images/18-26.png">

y finalizamos.

<img src="images/18-27.png">

y ya tenemos nuestro servidor GlassFish también registrado parado y ahora cuando vayamos a probar una aplicación podremos optar o bien por probarlo en Tomcat o en GlassFish.

En la siguiente lección haremos un ejercicio con EJBs que habrá que probarlo en este servidor GlassFish.

# 19 Creación de un DataSource 11:20

<img src="images/19-01.png">

Hasta ahora cuando teníamos que conectar con una base de datos proporcionamos los datos de conexión a la misma dentro de la propia aplicación. En el caso de JPA concretamente dentro del `persistence.xml`, ahora que vamos a utilizar EJBs necesitamos hacer uso de DataSource, es decir en vez de conectar directamente desde la aplicación a la base de datos, la conexion la vamos a obtener a través de un DataSource, que aparte de ser más eficiente, por la manera de los EJB en gestionar las transacciones, utilizan una API que interno que se llama JTA, pues es necesario que si queremos delegar dicha gestión de transacciones en EJB el acceso a los datos se haga vía DataSource porque las conexiones directas no utilizan ese tipo de transacción y entonces no podríamos delegar la transaccionalidad en un EJB.

<img src="images/19-02.png">

Bien primero qué es exactamente un DataSource, un DataSource es un objeto que vive dentro de los servidores de aplicaciones y que como decía proporciona conexiones a la base de datos para la aplicación. Esas conexiones existen ya en un Pool de Conexiones que se genera dentro del servidor de aplicaciones y que gestiona el propio DataSource y que ya contiene como digo conexiones hacia la base de datos con la que vamos a trabajar.

Cuando la aplicación en nuestro caso JPA será el proveedor de persistencia, necesite conexiones con la base de datos en vez de crearla directamente contra dicha base de datos se va a pedir al DataSource, el DataSource le cogerá una conexión del Pool y la entregará y cuando el proveedor de persistencia en nuestro caso termine de usar esa conexión se la devolverá al DataSource para que lo devuelva al Pool.

Entonces es mucho más eficiente porque no hay que estar constantemente creando y cerrando conexiones sino que las conexiones ya están ahí y son gestionadas por el objeto DataSource.

Bien pues vamos a ver cómo crear un DataSource en el servidor de aplicaciones GlassFish que acabamos de instalar.

Para ello lo primero que tenemos que hacer vamos a la carpeta donde tenemos instalados GlassFish. Dentro de la carpeta glassfish tenemos una carpeta Domains dentro de ella una Domaine1 que es lo que llamaríamos el dominio por defecto donde automáticamente vas a ver qué Eclipse ahí arranca el servidor y gestiona el servidor dentro de ese dominio y dentro de Domaio 1 tenemos una carpeta que se llama LIB y  justo dentro tenemos una carpeta que se llama ext.

<img src="images/19-03.png">

Aquí vamos a copiar el Driver de MySQL que descargamos en las primeras lecciones del curso.

<img src="images/19-04.png">

Por qué. Pues porque como digo el DataSource no es un objeto que va a vivir dentro del servidor de aplicaciones, entonces el propio servidor de aplicaciones para poder crear el DataSource y crear el Pool de conexiones contra la base de datos necesita el driver, entonces los driver o en general cualquier librería externa que necesitemos que use el servidor de aplicaciones GlassFish la vamos a copiar en esta carpeta `glassfish/domains/domain1/lib/ext`.

Bien, hecho eso ahora vamos a iniciar el servidor de aplicaciones GlassFish, nos vamos a la carpeta raíz de `glassfish/bin` y ahí ejecutarían un archivo, no necesitamos Eclipse para esto como ves, necesitaríamos ejecutar un archivo que es `starserv` que lo que hace es iniciar el servidor.  

<img src="images/19-05.png">

**NOTA**: En la Mac he encontrado con varios problemas para poder arrancar el Servidor con lo describe el paso anterior, los pasos necesarios para poder arrancar el servidor son los siguientes:

1) Modificar el archivo `glassfish/config/asenv.conf` para incluir la línea `AS_JAVA="/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home"`
2) Ejecutar la versión 8 de Java `setJDK8`; `java -version openjdk version "1.8.0_242"`
3) Desde la misma terminal donde se cambio la versión de Java 8 ejecutar `/Users/adolfodelarosa/Documents/Udemy2020/Cursos/OW/615_Acceso_a_datos_en_aplicaciones_Java_con_JPA_e_Hibernate/download/glassfish5/glassfish/bin/startserv`

<img src="images/19-06.png">

se inicia esta ventana de línea de comando donde van saliendo unos mensajes y por fin nos dice que está iniciado cuando ya termine de arrancar.

Entonces lo que hacemos es que cogemos nuestro navegador y nos vamos a ir a la siguiente dirección `http://localhost:4848`

<img src="images/19-07.png">

No hace falta que pongamos el resto porque automáticamente es una dirección por defecto y entraríamos en esta página.

Esto es la Consola de Administración del GlassFish, es decir una aplicación que utilizan los Administradores del Servidor de Aplicaciones para hacer tareas propias de un administrador, como por ejemplo desplegar aplicaciones o crear DataSources, que es lo que vamos a hacer nosotros ya que el DataSource al vivir en un servidor de aplicaciones es un objeto administrativo que debe ser creado por un administrador y eso es lo que vamos a hacer nosotros crear el DataSource.

Bien pues recuerda primero el paso anterior de haber copiado el driver de MySQL en la carpeta indicada porque es necesario para poder hacer la creación ahora del DataSource. 

Para crear el DataSource nos vamos a ir a la sección de *Resources - JDBC*. Primero se creará el Pool de Conexiones y a continuación se creará un DataSource asociado a dicho Pool de Conexiones. 

El Pool de Conexiones que se puede crear estarían dentro de la sección *JDBC Connection Pools* si la seleccionamos veremos una lista de conexiones que ya están ahí creados.

<img src="images/19-08.png">

El propio servidor de aplicaciones GlassFish tiene ya unos Pools de conexiones que serían estos. Vamos a crear nuestro Pool de Conexiones asociado a la base de datos de agenda. Para ello pulsamos el botón NEW.

<img src="images/19-09.png">

Le vamos a dar un Pool Name `poolagenda` por ejemplo, Resource Type es un `javax.sql.DataSource`, Database Driver Vendor va a ser `MySql`.

<img src="images/19-10.png">

Vamos al siguiente paso pulsando el botón Next.

<img src="images/19-11.png">

En el siguiente paso vas a ver que ya nos aparecen unas propiedades por defecto y que no tenemos que tocar, me refería a estas concretamente de *Pool Settings* sobre, tamaño inicial del Pool, máximo tamaño que pueden alcanzar, esto significa que el Pool de conexiones cuando se arranca el servidor va a tener un tamaño mínimo de 8 conexiones hasta alcanzar un máximo de 32. Esto luego ya el propio DataSource irá encargándose de ir poblando las conexiones de cuando llegue al máximo no crear más y repartiendo las entre los clientes que se la vayan solicitando, en fin esto es una configuración por defecto que tampoco nosotros vamos a entrar.

Lo que nos interesa son las *Additional Properties (8)*, en tu casa a lo mejor te aparecen algunas menos 100 suelen ser entre 170 para arriba. Evidentemente no vamos a tener que configurarlas todas, solamente cinco o seis propiedades que representan los datos que necesita el Pool de conexiones para poder crear las conexiones, es decir dónde está la base de datos, como se llama, el servidor, el puerto. 

Bueno vamos a ordenarlas alfabéticamente pulsamos en Name, entonces se ordenará la lista alfabéticamente para así centrarnos mejor en las que nos interesa.

La primera de esas propiedades que tenemos que configurar es la propiedad `databaseName` en donde debemos indicar el nombre de la base de datos con la que queremos conectar para que se generen las conexiones dentro de ese Pool ponemos `agenda`.

La siguiente propiedad ya nos iríamos directamente al puerto de MySQL para que sepa en que puerto tiene que estar escuchando MySQL de cara a conectar el servidor con la base de datos y rellenar este Pool como digo, bueno este dato ya viene relleno pero si en tu caso no es así hay que poner `3306`.

La siguiente propiedad serían los datos de conexión a la base de datos user y password con valor `root`.

La siguiente propiedad el ServerName, nombre del servidor, es decir el equipo físico donde se encuentra el servidor de base de datos de MySQL, aquí habría que poner la dirección IP o el nombre de la máquina, como estamos haciendo de modo local ponemos `localhost`

Dado el nombre del servidor nos iríamos a las propiedades Url y URL hay dos URLs en minúsculas y mayúsculas. Estas propiedades deberían ya haberse rellenado con los datos que le hemos dado de la base de datos y del servidor pero no lo han hecho el valor que tendrían es `jdbx:mysql://localhost:3306/agenda`. Entonces tenemos que indicar explícitamente la cadena de conexión en ambas propiedades.

<img src="images/19-12.png">

Estas son las propiedades que hemos tenido que proporcionar. En definitiva los datos de conexión a la base de datos, credenciales incluidos, como ya hemos llegado al finalizamos y ya tenemos creado nuestro DataSource.

<img src="images/19-13.png">

Podemos incluso hacer una prueba ver si efectivamente esos datos de conexión que le hemos dado están bien y conecta con la base datos y si es capaz de poblar este Pool, entraríamos de nuevo en las propiedades y tenemos ahí un botoncito Ping, para hacer un ping.

<img src="images/19-14.png">

<img src="images/19-15.png">

En este caso al hacer el Ping no ha ido bien, el mensaje de error nos daría una pista de que nos podría falta y volveríamos a repasar las propiedades para ver si todas están bien introducidos o nos faltan algunas.

<img src="images/19-16.png">

Hemos añadido algunas propiedades y vamos a probar nuevamente el Ping, nos sigue presentando un error

`Ping Connection Pool failed for poolagenda. Class name is wrong or classpath is not set for : com.mysql.jdbc.jdbc2.optional.MysqlDataSource Please check the server.log for more details.`

<img src="images/19-17.png">

En la pestaña General tenemos el valor *Datasource Classname:* `com.mysql.jdbc.jdbc2.optional.MysqlDataSource`. Vamos a cambiar el valor por : `com.mysql.jdbc.Driver` que es el valor que usabamos en nuestros antiguos ejercicios e iba bien.

<img src="images/19-18.png">

Ahora nos aparece un error diferente, si revisamos el log de GlassFish nos muestra la siguiente traza:

```sh
[#|2020-06-18T20:34:09.723+0200|SEVERE|glassfish 5.0|javax.enterprise.resource.resourceadapter.com.sun.gjc.spi|_ThreadID=53;_ThreadName=admin-listener(1);_TimeMillis=1592505249723;_LevelValue=1000;_MessageID=jdbc.exc_cce;|
  RAR5111 : Error casting to javax.sql.Datasource
java.lang.ClassCastException: com.mysql.jdbc.Driver cannot be cast to javax.sql.DataSource
	at com.sun.gjc.spi.DSManagedConnectionFactory.getDataSource(DSManagedConnectionFactory.java:163)
	at com.sun.gjc.spi.DSManagedConnectionFactory.createManagedConnection(DSManagedConnectionFactory.java:102)
	at com.sun.enterprise.connectors.service.ConnectorConnectionPoolAdminServiceImpl.getUnpooledConnection(ConnectorConnectionPoolAdminServiceImpl.java:702)
	at com.sun.enterprise.connectors.service.ConnectorConnectionPoolAdminServiceImpl.testConnectionPool(ConnectorConnectionPoolAdminServiceImpl.java:431)
	at com.sun.enterprise.connectors.ConnectorRuntime.pingConnectionPool(ConnectorRuntime.java:1162)
	at org.glassfish.connectors.admin.cli.PingConnectionPool.execute(PingConnectionPool.java:143)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$2$1.run(CommandRunnerImpl.java:540)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$2$1.run(CommandRunnerImpl.java:536)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:360)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$2.execute(CommandRunnerImpl.java:535)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$3.run(CommandRunnerImpl.java:566)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$3.run(CommandRunnerImpl.java:558)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:360)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl.doCommand(CommandRunnerImpl.java:557)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl.doCommand(CommandRunnerImpl.java:1465)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl.access$1300(CommandRunnerImpl.java:110)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$ExecutionContext.execute(CommandRunnerImpl.java:1847)
	at com.sun.enterprise.v3.admin.CommandRunnerImpl$ExecutionContext.execute(CommandRunnerImpl.java:1723)
	at org.glassfish.admin.rest.utils.ResourceUtil.runCommand(ResourceUtil.java:254)
	at org.glassfish.admin.rest.utils.ResourceUtil.runCommand(ResourceUtil.java:232)
	at org.glassfish.admin.rest.resources.TemplateExecCommand.executeCommandLegacyFormat(TemplateExecCommand.java:157)
	at org.glassfish.admin.rest.resources.TemplateCommandGetResource.processGetLegacyFormat(TemplateCommandGetResource.java:75)
	at sun.reflect.GeneratedMethodAccessor87.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.glassfish.jersey.server.model.internal.ResourceMethodInvocationHandlerFactory.lambda$static$0(ResourceMethodInvocationHandlerFactory.java:76)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher$1.run(AbstractJavaResourceMethodDispatcher.java:148)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.invoke(AbstractJavaResourceMethodDispatcher.java:191)
	at org.glassfish.jersey.server.model.internal.JavaResourceMethodDispatcherProvider$ResponseOutInvoker.doDispatch(JavaResourceMethodDispatcherProvider.java:200)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.dispatch(AbstractJavaResourceMethodDispatcher.java:103)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.invoke(ResourceMethodInvoker.java:493)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:415)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:104)
	at org.glassfish.jersey.server.ServerRuntime$1.run(ServerRuntime.java:277)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:272)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:268)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:316)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:298)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:268)
	at org.glassfish.jersey.process.internal.RequestScope.runInScope(RequestScope.java:289)
	at org.glassfish.jersey.server.ServerRuntime.process(ServerRuntime.java:256)
	at org.glassfish.jersey.server.ApplicationHandler.handle(ApplicationHandler.java:703)
	at org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpContainer.service(GrizzlyHttpContainer.java:377)
	at org.glassfish.admin.rest.adapter.RestAdapter$2.service(RestAdapter.java:316)
	at org.glassfish.admin.rest.adapter.RestAdapter.service(RestAdapter.java:179)
	at com.sun.enterprise.v3.services.impl.ContainerMapper$HttpHandlerCallable.call(ContainerMapper.java:463)
	at com.sun.enterprise.v3.services.impl.ContainerMapper.service(ContainerMapper.java:168)
	at org.glassfish.grizzly.http.server.HttpHandler.runService(HttpHandler.java:206)
	at org.glassfish.grizzly.http.server.HttpHandler.doHandle(HttpHandler.java:180)
	at org.glassfish.grizzly.http.server.HttpServerFilter.handleRead(HttpServerFilter.java:242)
	at org.glassfish.grizzly.filterchain.ExecutorResolver$9.execute(ExecutorResolver.java:119)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.executeFilter(DefaultFilterChain.java:284)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.executeChainPart(DefaultFilterChain.java:201)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.execute(DefaultFilterChain.java:133)
	at org.glassfish.grizzly.filterchain.DefaultFilterChain.process(DefaultFilterChain.java:112)
	at org.glassfish.grizzly.ProcessorExecutor.execute(ProcessorExecutor.java:77)
	at org.glassfish.grizzly.nio.transport.TCPNIOTransport.fireIOEvent(TCPNIOTransport.java:539)
	at org.glassfish.grizzly.strategies.AbstractIOStrategy.fireIOEvent(AbstractIOStrategy.java:112)
	at org.glassfish.grizzly.strategies.WorkerThreadIOStrategy.run0(WorkerThreadIOStrategy.java:117)
	at org.glassfish.grizzly.strategies.WorkerThreadIOStrategy.access$100(WorkerThreadIOStrategy.java:56)
	at org.glassfish.grizzly.strategies.WorkerThreadIOStrategy$WorkerThreadRunnable.run(WorkerThreadIOStrategy.java:137)
	at org.glassfish.grizzly.threadpool.AbstractThreadPool$Worker.doWork(AbstractThreadPool.java:593)
	at org.glassfish.grizzly.threadpool.AbstractThreadPool$Worker.run(AbstractThreadPool.java:573)
	at java.lang.Thread.run(Thread.java:748)
```

No he podido saber la causa del error. En el proyecto del profesor usa MySQL 5 y yo la 8 por lo que habría ver por donde va el fallo, la URL https://nikals.se/2019/04/05/using-mysql-connector-j-jdbc-driver-with-glassfish/ menciona una posible solución.

### Solución encontrada.

La solución esta en el siguiente enlace:

https://es.stackoverflow.com/questions/261195/error-pool-de-conexi%C3%B3n-glassfish-4-0-con-mysql-8-servidor-aws

<img src="images/19-50.png">

Con los valores:

**Resource Type:** javax.sql.DataSource

**Datasource Classname:** com.mysql.cj.jdbc.MysqlDataSource

Hay que añadir la propiedad

**useSSL:** false

<img src="images/19-51.png">

Con esto el Ping ya responde: **Ping Succeeded**

En caso de que todo estuvierá bien al momento de hacer el Ping nos aparecería `Ping Succeeded` significa que todo ha ido bien y que es capaz de crear conexiones.

Una vez que tenemos creado el Pool de conexiones vamos a crear el DataSource asociado a ese Pool y nos iríamos a la opción de *JDBC Resource*.

<img src="images/19-19.png">

Damos al botón New y le damos el nombre del DataSource lo que llaman el *JNDI Name* que suele por costumbre suele empezar con la cadena JDBC barra y luego el nombre que queramos darle al caso que habitualmente es el nombre de la base de datos terminado en ds, nos queda así `jdbc/agendads`, pero bueno puede ser el nombre que tú quieras proporcionar, lo único que hay que indicar es el Pool que lleva asociado, este caso `poolagenda`

<img src="images/19-20.png">

 pulsamos OK.
 
 <img src="images/19-21.png">
 
 y ya tenemos el DataSource, en la siguiente lección vamos a ver ya cómo utilizar este DataSource para proporcionar los datos de conexión en el `persistence.xml` de cara a que EJB pueda gestionar la transaccionalidad como te decía antes a través de un API que se llama JTA y podamos delegar en él dicha transaccionalidad.



# 20 Ejercicio práctico III 17:57

<img src="images/20-01.png">

<img src="images/20-02.png">

En esta lección vamos a crear una nueva versión del ejercicio de la agenda de contactos, en el que vamos a utilizar o implementar la lógica de negocio dentro del EJB para poder aprovechar las características que comentábamos antes de gestión de transaccionalidad e inyección del objeto `EntityManager`.

Vamos directamente a Eclipse, lo que vamos a hacer es que vamos a crearnos una copia del proyecto que ya teníamos hecho anteriormente con todas las funcionalidades que ya implementamos a través del botón derecho creamos una copia y lo vamos a renombrar como `615-04_web_jpa`.

<img src="images/20-03.png">

Cuando hacemos una copia de un proyecto web ya existente, como ya vimos es importante ir a las propiedades del proyecto en *Web Project Setting* y  cambiar el `Content root` al del proyecto actual.

<img src="images/20-04.png">

o lo que es lo mismo la dirección asociada a la aplicación web que al hacer la copia del proyecto, esa información no se cambia por lo que hay que realizarlo manualmente, entonces aplicamos.

Lo primero que vamos a hacer es asociar este proyecto con el nuevo servidor de aplicaciones que ya registramos en lecciones anteriores que es GlasFish, porque como sabes el servidor de aplicaciones Tomcat no incluye contenedores EJB y por lo tanto no podemos utilizar EJB con Tomcat lo utilizaremos sobre GlassFish.

Este proyecto que se creó en su momento estaba asociado al servidor Tomcat, esta nueva copia sigue asociado a Tomcat, habrá que decirle que queremos que quede asociado a GlassFish, aquí vemos las librerías del proyecto, lo que es la librería de Java EE, la asociación que proporciona Tomcat.

<img src="images/20-05.png">

Cuando creas un nuevo proyecto Web dinámico a la hora de crearlo 

<img src="images/20-06.png">

aquí ya le dices que servidor de aplicaciones con el que vas a trabajar, como nosotros no lo hemos creado de cero, pues entonces ya viene asociado con el servidor que se asoció al proyecto original y para cambiarlo nos vamos a ir a las propiedades y en `Targeted Runtime`.

<img src="images/20-07.png">

Como ves tenemos asociado Tomcat pues vamos a desactivar esta opción y asociable el servidor GlassFish

<img src="images/20-08.png">

aplicamos y ya las librerías del EJB las cogerá de ese servidor y de cara a probarlo bueno también podremos elegir uno u otro pero bueno ya tenemos por defecto asociado el proyecto con nuestro servidor GlassFish.

Una vez hecho eso lo que vamos a hacer, dado que lo que tenemos es una copia del proyecto es que nos vamos a ir al archivo `persistence.xml` y vamos a cambiar la manera en la que vamos a conectar con la base de datos a través del proveedor de persistencia, porque como ya te comenté en la lección anterior, resulta que no podemos utilizar datos de conexión directos a la base de datos, es decir no podemos proporcionar los datos de conexión para que el motor de persistencia que conecte a la base de datos, sino que hay que hacerlo a través de un DataSource que ya creamos en la lección anterior.

Esa información donde se cambia, bueno pues podemos cambiar directamente el código o para poder hacer los cambios más comodamente apoyarnos de la pestaña `Connection`.

OJO CON LA IMAGEN PARECE QUE NO ES CORRECTA

<img src="images/20-09.png">

En vez de elegir *Resource Local* seleccionemos *Default (JTA)* o JTA a secas y como ves desaparecen los datos de conexión directos a la base de datos y le indicamos la dirección del DataSource que creamos en la lección anterior y que vive dentro de ese servidor de aplicaciones GlassFish, `jdbc/agendades`.

Si vemos el código de `persistence.xml` vemos como cambia.

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-03_web_jpa">
		<jta-data-source>jdbc/agendads</jta-data-source>
		<class>entidades.Contacto</class>
		<class>entidades.Usuario</class>
	</persistence-unit>
</persistence>
```

Esa información donde se cambia, ahora ya no hay datos de conexión con la base datos sino que está directamente la entrada  `<jta-data-source>jdbc/agendads</jta-data-source>` con la dirección del DataSource, esto significa que el motor de persistencia va a utilizar este DataSource y el servidor va a ser mucho más óptimo y además utilizará el sistema de gestión de transacciones que es JTA que es el mismo que utilizan los EJBs.

Otra cosa que vamos a hacer es que vamos a cambiar el nombre de la Unidad de persistencia puesto que ahora estamos con el ejercicio `615-04_web_jpa` y es el nombre que le vamos a asociar a la nueva unidad de resistencia.

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-04_web_jpa">
		<jta-data-source>jdbc/agendads</jta-data-source>
		<class>entidades.Contacto</class>
		<class>entidades.Usuario</class>
	</persistence-unit>
</persistence>
```

Ahora lo que vamos a hacer es implementar la lógica negocio en los EJBs, en lugar de tener clases normales en el paquete `modelo` como lo tenemos crearemos Enterprise JavaBeans, vamos a crear un EJB para la Gestión de Usuarios y otro para la Gestión de los Contactos.

Nos vamos al proyecto y con el botón derecho en la opción New dentro de la categoría Other en la subcategoría EJB elegimos Session Bean

<img src="images/20-10.png">

En el siguiente paso el paquete es el mismo donde tenemos las clases y el nombre de la clase porque un EJB va a estar formado por una clase de implementación muy parecida a las clases estándares Java y una interfaz de negocio con la que va a interaccionar el cliente en nuestro caso los controladores. Bueno a la clase le vamos a llamar `GestionUsuariosEjb` y la interfaz de negocio va a ser en una interfaz local puesto que el acceso va a ser local, no se va a acceder al EJB remotamente desde otro servidor, sino que se va a acceder desde el mismo servidor completamente de la misma aplicación, le asigna nombre que por defecto a dicha interfaz `modelo.GestionUsuarioEjbLocal` . Vamos a desactivar la opción `No-interface View` puesto que sí que vamos a utilizar interfaz de negocio y ya directamente aquí podemos pulsar Finish.

<img src="images/20-11.png">

Ya tendríamos creado el EJB

<img src="images/20-12.png">

Nos crea dos archivos `GestionUsuarioEjb` y `GestionUsuarioEjbLocal`

La Interface es una simple interfaz.

*`GestionUsuarioEjbLocal`*

```java
package modelo;

import javax.ejb.Local;

@Local
public interface GestionUsuarioEjbLocal {

}
```

La Clase es una clase normal y corriente Java

*`GestionUsuarioEjb`*

```java
package modelo;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class GestionUsuarioEjb
 */
@Stateless
public class GestionUsuarioEjb implements GestionUsuarioEjbLocal {

    /**
     * Default constructor. 
     */
    public GestionUsuarioEjb() {
        // TODO Auto-generated constructor stub
    }

}
```

que lleva la anotación `@Stateless` que indica que estamos ante un EJB de tipo sin Estado, por lo demás lo que vamos a tener son los métodos del EJB que son mismos métodos que teníamos en `GestionUsuario` aunque no descartaremos `getEntityManager()` ya que la conexión ya no se realiza de esta manera, puesto que lo vamos a inyectar directamente.

Vamos a copiar el método `autenticar` que ya tenemos creado en `GestionUsuario`. Ahora veremos qué cambios vamos a hacer en su interior.

Cómo obtenemos el EntityManager, declaramos una variable de ese tipo y en este caso al utilizar EJB, el contenido del EJBs nos va a permitir inyectar automáticamente el objeto dentro de la variable, sin que lo tengamos que crear nosotros explícitamente desde código. Para ello se utilizará una anotación `@PersistenceContext` es la  anotación que nos va a permitir la inyección del EntityManager dentro de la variable, lo único que habrá que indicarle es el `unitName` que nos permite indicar el nombre de la Unidad de Persistencia en la que tiene que buscar la información, el nombre de la Unidad de persistencia como sabes está en el `persistence.xml` por lo que la anotación completa queda así: 

```
@PersistenceContext(unitName="615-04_web_jpa")
EntityManager em;
```

Con esto ya inyectariamos el `EntityManager` por lo que podemos elininar `EntityManager em = getEntityManager();`. Nuestra clase completa queda así:

```java
package modelo;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import entidades.Usuario;


@Stateless
public class GestionUsuarioEjb implements GestionUsuarioEjbLocal {
	@PersistenceContext(unitName="615-04_web_jpa")
	EntityManager em;
	@Override
	public boolean autenticar(String usuario, String pwd){
		
		boolean res=false;
		TypedQuery<Usuario> qr=em.createNamedQuery("Usuario.findByUserAndPwd", Usuario.class);
		qr.setParameter(1, usuario);
		qr.setParameter(2, pwd);
		try{
			qr.getSingleResult();
			res=true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return res;
	}

}
```

Bien ese método queremos que sea expuesto también a través de la interfaz para que el cliente, que son los Servlets puedan hacer uso del mismo. Podríamos incluirlo manualmente, pero vamos a ver como nos ayuda Eclipse para hacerlo. Para ello vamos dentro de la clase de implementación del EJB y con el botón derecho elegimos la opción `Refactor - Pull Up...`

<img src="images/20-13.png">

lo que queremos es llevarnos a esta interfaz que ya detecta como la implementa la clase ya que esta es la interfaz donde te quieres llevar la Declaración de los métodos que te indican esta lista.

<img src="images/20-14.png">

Autenticar que es el único que tenemos bien si se está el método directamente finalizamos y veremos como era dicho método aparecerá definido también declarado ya en la interfaz de negocio pues ya tenemos hecho un EJB que implementa la lógica de negocio de la gestión de usuarios.

<img src="images/20-15.png">

```java
package modelo;

import javax.ejb.Local;

@Local
public interface GestionUsuarioEjbLocal {
	
   boolean autenticar(String usuario, String pwd);

}
```

La clase `GestionUsuarios` podemos eliminarla tranquilamente ya no la necesitamos.

Vamos a hacer lo mismo con `GestionContactos` vamos a crear un segundo EJB volvemos a los mismos pasos.

<img src="images/20-16.png">

<img src="images/20-17.png">

Fíjate aquí que no te lo comenten en la lección anterior que dentro de lo que son 
`State Type` tenemos `Stateless`, `Stateful` y `Singleton`, habitualmente `Stateless` que no mantienen el Estado, es decir de una llamada a otra de un método EJB no hay que mantener información dentro de lo que es el propio EJB, no contienen variables atributos para almacenar información, esto permitirá que el contenedor de EJB haga una gestión óptima de dicha instancia de EJBs, siempre que podamos `Stateless`, si por lo que sea vamos a implementar una lógica de negocio que tienen que almacenar datos en atributos asociados a cada cliente que haga la llamada utilizaremos `Stateless`, lo dejamos con la `Stateless` y finalizamos.

Se habrán creado de nuevo la clase junto con la interfaz `GestionContactosEjb`, `GestionContactosEjbLocal` y vamos a hacer lo mismo de antes es decir vamos a `GestionContactos` nos vamos a llevar todos los métodos que teníamos ahí creados y los vamos a copiar a `GestionContactosEjb` el constructor lo podemos borrar no nos hace falta, vamos a incluir la gestión de dependencia de `EntityManager`, hacemos algunos retoques que tenemos que hacer a nivel de los métodos. Aquí viene algo interesante que es lo que venimos comentando desde lecciones anteriores, es que el contenedor EJB se va a encargar de la gestión de la transaccionalidad. No necesitamos nosotros obtener `EntityTransaction`, comenzar, confirmar o rechazar una transacción, eso lo gestiona automáticamente el contenedor de EJBs, por lo tanto en el método `altaContacto` simplemente se crear el objeto Contacto y se persiste punto, iniciar la transacción al principio, confirmarlo al final lo hace automáticamente el contenedor de EJB. Con los demas métodos es exactamente lo mismo. El código final de la clase EJB queda así:

*`GestionContactosEjbLocal`*

```java
package modelo;

import java.util.List;
import javax.ejb.Local;
import entidades.Contacto;

@Local
public interface GestionContactosEjbLocal {
	
	public void altaContacto(String nombre, String email, int telefono);
	public void altacontacto(Contacto c);
	public void eliminarContacto(int idContacto);
	public void eliminarContactosPorEmail(String email);
	public List<Contacto> recuperarContactos();
	public Contacto buscarContactos(String email);
						
}
```
*`GestionContactosEjb`*

```java
package modelo;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import entidades.Contacto;

/**
 * Session Bean implementation class GestionContactosEjb
 */
@Stateless
public class GestionContactosEjb implements GestionContactosEjbLocal {

	@PersistenceContext(unitName="615-04_web_jpa")
	EntityManager em;
	public void altaContacto(String nombre, String email, int telefono) {
		Contacto c = new Contacto(email, nombre, telefono);
		
		em.persist(c);
	}

	public void altacontacto(Contacto c) {
		
		em.persist(c);
		
	}
	
	public void eliminarContacto(int idContacto) {
		
		Contacto c = em.find(Contacto.class, idContacto);
		
		if(c != null) {
		   em.remove(c);
		}
		
	}
	
	public void eliminarContactosPorEmail(String email){
		
		Query qr=em.createNamedQuery("Contacto.deleteByEmail");
		qr.setParameter(1, email);
		
		qr.executeUpdate();
		
	}
	
	public List<Contacto> recuperarContactos(){
		
		/*Query qr = em.createQuery("Select c From Contacto c");
		return (List<Contacto>)qr.getResultList();*/
		TypedQuery<Contacto> qr = em.createQuery("Select c From Contacto c", Contacto.class);
		return qr.getResultList();
	}
	
	public Contacto buscarContactos(String email){
				
		String jpql = "Select c From Contacto c Where c.email = ?1";
		TypedQuery<Contacto> qr = em.createQuery(jpql, Contacto.class);
		qr.setParameter(1, email);
		//return qr.getSingleResult();
		return qr.getResultList().get(0);
	}

}
```

Cómo se ve se el código se reduce bastante, pues muchos de los métodos de la Lógica de Negocio, si ya estaban de por sí reducida por utilizar JPA, el hecho de que la transacción la gestione automáticamente el contenedor de EJBs pues hace que aún sea más simple la Lógica de Negocio.

Vamos a borrar la clase `GestionContactos` y ya lo único que nos queda es utilizar esos EJBs desde la capa cliente, en este caso los controladores de acción, vamos al paquete Servlets e ir revisando servlet por servlet.

### Paquete Servlets

Empezamos por `AltaAction` aquí ya no tenemos una clase de `GestionContactos` que instanciar sino que tenemos que utilizar el EJB concretamente la Interfaz de Negocio, para ello vamos a utilizar esta anotación que forma parte de Java Enterprise Edition.

```java
@EJB
GestionContactosEjbLocal gcontactos;
```
Qué lo que hace es inyectar una referencia al objeto de la interfaz de negocio y declara una variable del tipo de objeto que quieres y a través de la anotación, el contenedor de servlets, el contenedor web nos inyecta una referencia a ese objeto dentro de la variable, gracias a esta anotación. Por lo tanto esto `GestionContactos gcontactos=new GestionContactos();` ya nos sobra.

```java
@EJB
GestionContactosEjbLocal gcontactos;
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   String nombre=request.getParameter("nombre");
   String email=request.getParameter("email");
   int telefono=Integer.parseInt(request.getParameter("telefono"));
   //creamos un objeto de la capa de lógica de negocio
   //y llamamos al método encargado de hacer el alta
		
   gcontactos.altaContacto(nombre,email,telefono);
   request.getRequestDispatcher("menu.html").forward(request, response);
}
```

Vamos a hacer exactamente lo mismo en el resto de los servlets. Una vez hecho esto ya tendríamos adaptados los servlet con la inyección de dependencia EJB para realizar las mismas tareas que realizaban antes.

En teoría de la vista no hay que tocar absolutamente nada, pero tal y como estaba hecha esta página de `contactos.jsp` tenia un import con `modelo.GestionContactos,` que no se usaba para nada pero lo tenia simplemente se elimina porque esas clases ese no se va a utilizar en la JSP.

Antes de ejecutar la aplicación vemos que nos da una serie de errores en las clases del Modelo y Servlets

<img src="images/20-50.png">

Esto es por que no reconoce las librerias de los EJB `Stateless cannot be resolved to a type`. Según este enlace https://stackoverflow.com/questions/9830401/java-ejb-the-import-javax-ejb-cannot-be-resolved/24833985 debemos incluir el archivo `glassfish5\glassfish\lib\javaee.jar` dentro de nuestro Java Build Path, vamos a hacerlo.

<img src="images/20-51.png">

<img src="images/20-52.png">

<img src="images/20-53.png">

<img src="images/20-54.png">

Como podemos observar los errores han desaparecido.

Pues ya lo tenemos todo listo y se supone que el ejercicio funcionaría exactamente igual que antes vamos a ejecutar la página de login para autenticarnos.

<img src="images/20-55.png">

Seleccionamos un servidor GlassFish.

<img src="images/20-56.png">

Y horror un nuevo error.

<img src="images/20-57.png">

Según el enlace https://www.it-swarm.dev/es/java/no-se-puede-implementar-una-aplicacion-para-glassfish-4.1-en-eclipse/1049983109/ sugiere los siguientes pasos:

Pruebe los siguientes pasos:

1. clic derecho en glassfish servidor
2. haga clic en propiedades
3. entonces obtendrá 3 opciones (general, glassfish, monitoreo) en el lado izquierdo de ese cuadro.
4. haga clic en glassfish
5. haga clic en la casilla de verificación "Usar archivos JAR para la implementación". Anteriormente estaba desmarcado. Por eso me estaba dando problemas.

<img src="images/20-58.png">

<img src="images/20-59.png">

<img src="images/20-60.png">

Vamos a intententarlo de nuevo. vamos a ejecutar la página de login para autenticarnos.

<img src="images/20-61.png">

Seleccionamos un servidor GlassFish.

<img src="images/20-62.png">

Y ahora si arranca nuestra Aplicación, ahora está publicando la aplicación y en el momento que arranque el navegador aparece aquí el navegador tendremos la página de inicio

<img src="images/20-63.png">

nos autenticamos y vamos al menú podemos probar las dos opciones que tenemos ver los contactos que está efectivamente trabajando correctamente e insertar un nuevo contacto y después eliminarlo, las operaciones trabajan correctamente contra la base de datos.

<img src="images/20-64.png">

<img src="images/20-65.png">

<img src="images/20-66.png">

<img src="images/20-67.png">

<img src="images/20-68.png">

<img src="images/20-69.png">

<img src="images/20-72.png">

<img src="images/20-70.png">

Como podemos observar el proyecto trabaja exactamente igual que el proyecto anterior pero **contiene varias diferencias**, insistir la Lógica Negocio (modelo) la hemos implementado con EJBs, las Entidades (entidades) son las mismas, la capa de persistencia (`persistence.xml`) es la misma lo único es que ahora como estamos utilizando EJBs el acceso a los datos está haciendose a través de un DataSource, las conexiones que está utilizando para sincronizar las operaciones contra la base de datos, el motor de persistencia las está realizando a través de un DataSource que hemos creado en el Servidor de Aplicaciones local. Los controladores (servlets) al usar EJB han cambiado un poco para inyectar el EJB y no hacer uso de la Transaccionalidad que maneja automaticamente los EJB, las vistas son exactamente las mismas.

Han visto cómo implementar ya la Lógica Negocio con EJBs que es muy parecido a hacerlo con clases, pero incluso con menos código.

### :computer: Código Completo - 615-04_web_jpa 

<img src="images/20-73.png">

*`pom.xml`*

```html
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>615-04_web_jpa</groupId>
	<artifactId>615-04_web_jpa</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>
	<build>
		<sourceDirectory>src</sourceDirectory>
		<resources>
			<resource>
				<directory>src</directory>
				<excludes>
					<exclude>**/*.java</exclude>
				</excludes>
			</resource>
		</resources>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.8.0</version>
				<configuration>
					<source>1.8</source>
					<target>1.8</target>
				</configuration>
			</plugin>
			<plugin>
				<artifactId>maven-war-plugin</artifactId>
				<version>3.2.3</version>
				<configuration>
					<warSourceDirectory>WebContent</warSourceDirectory>
				</configuration>
			</plugin>
		</plugins>
	</build>
	<dependencies>
		<!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>8.0.20</version>
		</dependency>
	</dependencies>
</project>
```

*`persistence.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
   <persistence-unit name="615-04_web_jpa">
      <jta-data-source>jdbc/agendads</jta-data-source>
      <class>entidades.Contacto</class>
      <class>entidades.Usuario</class>
   </persistence-unit>
</persistence>

```

**Entidades**

*`Contacto.java`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the contactos database table.
 * 
 */
@Entity
@Table(name="contactos")
@NamedQueries({
	@NamedQuery(name="Contacto.findAll", query="SELECT c FROM Contacto c"),
	@NamedQuery(name="Contacto.deleteByEmail", query="DELETE FROM Contacto c WHERE c.email=?1")
})

public class Contacto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idContacto;

	private String email;

	private String nombre;

	private int telefono;

	public Contacto() {
	}

	public Contacto(String email, String nombre, int telefono) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.telefono = telefono;
	}

	public Contacto(int idContacto, String email, String nombre, int telefono) {
		super();
		this.idContacto = idContacto;
		this.email = email;
		this.nombre = nombre;
		this.telefono = telefono;
	}

	public int getIdContacto() {
		return this.idContacto;
	}

	public void setIdContacto(int idContacto) {
		this.idContacto = idContacto;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getTelefono() {
		return this.telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

}
```

*`Usuario.java`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the usuarios database table.
 * 
 */
@Entity
@Table(name="usuarios")
@NamedQueries({
   @NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u"),
   @NamedQuery(name="Usuario.findByUserAndPwd", query="SELECT u FROM Usuario u Where u.usuario=?1 and u.password=?2")
})
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUsuario;

	private String password;

	private String usuario;

	public Usuario() {
	}

	public int getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

}
```

**Modelo**

*`GestionContactosEjbLocal.java`*

```java
package modelo;

import java.util.List;
import javax.ejb.Local;
import entidades.Contacto;

@Local
public interface GestionContactosEjbLocal {
	
	public void altaContacto(String nombre, String email, int telefono);
	public void altacontacto(Contacto c);
	public void eliminarContacto(int idContacto);
	public void eliminarContactosPorEmail(String email);
	public List<Contacto> recuperarContactos();
	public Contacto buscarContactos(String email);
						
}
```

*`GestionContactosEjb.java`*

```java
package modelo;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import entidades.Contacto;

/**
 * Session Bean implementation class GestionContactosEjb
 */
@Stateless
public class GestionContactosEjb implements GestionContactosEjbLocal {

	@PersistenceContext(unitName="615-04_web_jpa")
	EntityManager em;
	public void altaContacto(String nombre, String email, int telefono) {
		Contacto c = new Contacto(email, nombre, telefono);
		
		em.persist(c);
	}

	public void altacontacto(Contacto c) {
		
		em.persist(c);
		
	}
	
	public void eliminarContacto(int idContacto) {
		
		Contacto c = em.find(Contacto.class, idContacto);
		
		if(c != null) {
		   em.remove(c);
		}
		
	}
	
	public void eliminarContactosPorEmail(String email){
		
		Query qr=em.createNamedQuery("Contacto.deleteByEmail");
		qr.setParameter(1, email);
		
		qr.executeUpdate();
		
	}
	
	public List<Contacto> recuperarContactos(){
		
		/*Query qr = em.createQuery("Select c From Contacto c");
		return (List<Contacto>)qr.getResultList();*/
		TypedQuery<Contacto> qr = em.createQuery("Select c From Contacto c", Contacto.class);
		return qr.getResultList();
	}
	
	public Contacto buscarContactos(String email){
				
		String jpql = "Select c From Contacto c Where c.email = ?1";
		TypedQuery<Contacto> qr = em.createQuery(jpql, Contacto.class);
		qr.setParameter(1, email);
		//return qr.getSingleResult();
		return qr.getResultList().get(0);
	}

}
```

*`GestionUsuarioEjbLocal.java`*

```java
package modelo;

import javax.ejb.Local;

@Local
public interface GestionUsuarioEjbLocal {
	
	boolean autenticar(String usuario, String pwd);

}
```

*`GestionUsuarioEjb.java`*

```java
package modelo;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import entidades.Usuario;


@Stateless
public class GestionUsuarioEjb implements GestionUsuarioEjbLocal {
	@PersistenceContext(unitName="615-04_web_jpa")
	EntityManager em;
	@Override
	public boolean autenticar(String usuario, String pwd){
		
		boolean res=false;
		TypedQuery<Usuario> qr=em.createNamedQuery("Usuario.findByUserAndPwd", Usuario.class);
		qr.setParameter(1, usuario);
		qr.setParameter(2, pwd);
		try{
			qr.getSingleResult();
			res=true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return res;
	}

}
```

**Servlets**

*`AltaAction.java`*

```java
package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.GestionContactosEjbLocal;

/**
 * Servlet implementation class AltaContacto
 */
@WebServlet("/AltaAction")
public class AltaAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	GestionContactosEjbLocal gcontactos;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre=request.getParameter("nombre");
		String email=request.getParameter("email");
		int telefono=Integer.parseInt(request.getParameter("telefono"));
		//creamos un objeto de la capa de lógica de negocio
		//y llamamos al método encargado de hacer el alta
		
		gcontactos.altaContacto(nombre,email,telefono);
		request.getRequestDispatcher("menu.html").forward(request, response);
	}

}
```

*`EliminarAction.java`*

```java
package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.GestionContactosEjbLocal;

/**
 * Servlet implementation class EliminaContacto
 */
@WebServlet("/EliminarAction")
public class EliminarAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	GestionContactosEjbLocal gcontactos;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idContacto=Integer.parseInt(request.getParameter("idContacto"));
		
		gcontactos.eliminarContacto(idContacto);
		request.getRequestDispatcher("RecuperarAction").forward(request, response);
	}

}
```

*`RecuperarAction.java`*

```java
package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Contacto;
import modelo.GestionContactosEjbLocal;

/**
 * Servlet implementation class RecuperarAction
 */
@WebServlet("/RecuperarAction")
public class RecuperarAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	GestionContactosEjbLocal gcontactos;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Contacto> contactos=gcontactos.recuperarContactos();
		//guardamos contactos en un atributo de petición
		request.setAttribute("contactos", contactos);
		//trasnferencia de la petición
		request.getRequestDispatcher("contactos.jsp").forward(request, response);
	}

}
```

*`LoginAction.java`*

```java
package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.GestionUsuarioEjbLocal;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	GestionUsuarioEjbLocal gusuarios;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		
		if(gusuarios.autenticar(user, pwd)){
			//guardamos el nombre de usuario en un atributo de sesión
			HttpSession s=request.getSession();
			s.setAttribute("user", user);
			request.getRequestDispatcher("menu.html").forward(request, response);
		}else{
			request.getRequestDispatcher("login.html").forward(request, response);
		}
	}

}
```

*`Controller.java`*

```java
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		String url = "";
		switch (op) {
		case "doLogin":
			url = "LoginAction";
			break;
		case "doAlta":
			url = "AltaAction";
			break;
		case "doEliminar":
			url = "EliminarAction";
			break;
		case "doRecuperar":
			url = "RecuperarAction";
			break;
		case "toNuevo":
			url = "nuevo.html";
			break;
		case "toMenu":
			url = "menu.html";
			break;

		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
```

**WebContent**

*`login.html`*

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <form action="Controller?op=doLogin" method="post">
      Usuario:<input type="text" name="user"/><br/>
      Contraseña:<input type="password" name="pwd"/><br/>
      <input type="submit" value="Enviar"/>
   </form>
</body>
</html>
```

*`menu.html`*

```html
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <center>
        <a href="Controller?op=toNuevo">Nuevo contacto</a><br/>
        <a href="Controller?op=doRecuperar">Ver contactos</a><br/>
    </center>
    </body>
</html>
```

*`nuevo.html`*

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>nuevo</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
 	function comprobar(){ 	
 		if(document.getElementById("nombre").value==""||
 			document.getElementById("email").value==""||
 			document.getElementById("edad").value==""){
 				alert("faltan datos");
 			return false;
 		}
 		else{
 			return true;
 		}
 		
 	}
        function comprobarEdad(){
            if(isNaN(document.getElementById("edad").value)){
                alert("Edad debe ser numérico");
                document.getElementById("edad").value="";
            }
        }
</script>
</head>
<body>
<form action="Controller?op=doAlta" method="post" onsubmit="return comprobar();">
	Nombre:<input id="nombre" type="text" name="nombre"/>
	<br/>
	Email:<input id="email" type="text" name="email"/>
	<br/>
        Telefono:<input id="edad" onblur="comprobarEdad();" type="text" name="telefono"/>
	<br/>
	<input type="submit" value="Guardar"/>
</form>
</body>
</html>
```

*`contactos.jsp`*

```html
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList,entidades.Contacto"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="contactos" value="${requestScope.contactos}"/>
	
	<br/><br/><br/>
	
	<c:choose>
	
		<c:when test="${!empty contactos}">
	
			<table border="1">
						<tr>
							<th>Nombre</th>
							<th>Email </th>
							<th>Telefono</th>
							<th></th>
						</tr>
						
						<c:forEach var="cont" items="${contactos}">
							<tr><td>${cont.nombre}</td>
							<td>${cont.email}</td>
							<td>${cont.telefono}</td>
							<td><a href="Controller?op=doEliminar&idContacto=${cont.idContacto}">Eliminar</a></td></tr>
						
						
						</c:forEach>
						
						
						
			</table>
		</c:when>
		<c:otherwise>
			<h1>No hay contactos</h1>
		</c:otherwise>
	</c:choose>
	<br/>
	<br/>
	<a href="Controller?op=toMenu">Menu</a>
</body>
</html>
```

# Autoevaluación IV 00:40

Autoevaluación IV

1. Indica cual de las siguientes afirmaciones son EJBs es falsa:
   * El contenedor EJB gestiona de forma automática las transacciones
   * La clase del EJB de estar anotada con @EJB :+1:
   * Un EJB se compone de una clase y una interfaz 
   * Los EJBs encapsulan la lógica de negocio de una aplicación

2. Para inyectar un EntityManager en un EJB se utiliza la anotación:
   * `@EJB` 
   * `@EntityManager`
   * `@PersistenceContext` :+1:
   * `@Stateless`

3. ¿Cuál de los siguientes servidores de aplicaciones no soporta el uso de EJBs?
   * Glassfish
   * Weblogic
   * Tomcat :+1:
   * WebSphere
   
4. Un DataSource es:
   * Una conexión con una base de datos
   * Una réplica de la base de datos en el servidor de aplicaciones
   * Una implementación de EntityManager en el servidor
   * Un objeto que provee conexiones a una base de datos :+1:

5. ¿Cuál de estos objetos no tenemos que utilizar cuando accedemos con el API JPA a la capa de persistencia en un EJB?:
   * `EntityTransaction` :+1:
   * `EntityManager`
   * `Query`
   * `TypedQuery`
 







SOLUCIONES:

1.- B

2.- C

3.- C

4.-D

5.- A

 
