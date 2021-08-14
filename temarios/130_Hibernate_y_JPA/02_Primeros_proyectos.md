# 2. Primeros proyectos 81m
   * 04 Primer proyecto 34:30 
   * 05 Primer proyecto con Hibernate con JPA 13:58 
   * 06 Primer proyecto con Spring boot, Spring MVC e Hibernate (parte I) 16:25 
   * 07 Primer proyecto con Spring boot, Spring MVC e Hibernate (parte II) 16:34 
   * Contenido adicional 3
   
# 04 Primer proyecto 34:30 

[Primer proyecto](pdfs/03_Primer_proyecto.pdf)

## Resumen Profesor

### 3.1 Prerrequisitos antes de comenzar

Para poder comenzar con nuestro primer proyecto con Hibernate, debemos tener en cuenta los siguientes prerrequisitos, con respecto al software que vamos a utilizar.

* Como herramienta fundamental de desarrollo vamos a usar una versión *tuneada* de **Eclipse**, llamada **Spring Tool Suite**. Hemos escogido esta versión por varias razones, como por ejemplo que nos permite hacer lo mismo que cualquier versión más elemental de eclipse, como la Neon; y que además nos permitirá utilizar más adelante Spring, para implementar proyectos Web MVC con Hibernate y JPA (si quieres información más concreta y precisa, puedes visitar nuestro curso sobre **Spring**).

Añadiremos a Eclipse un conjunto de herramientas, llamadas Hibernate Tools. Se trata de un conjunto de asistentes y vistas que nos permitirán acelerar y facilitar el desarrollo de nuestras aplicaciones con Hibernate. Para instalarlo, una vez abierto STS, nos dirigimos a
*Help > Eclipse Marketplace:*

En el buscador escribimos: **JBoss Tools**. De entre todas las opciones seleccionamos la opción JBoss Tools (la versión actual es la 4.3.1.Final), y pulsamos sobre el botón *Install*,

<img src="images/1-jboss-1.jpg">

No tenemos porque instalar todas las opciones que nos aparecen. Tan solo debemos seleccionar **Hibernate Tools**

<img src="images/1-jboss-2.jpg">

Continuamos con el asistente hasta finalizar.

* Mysql será nuestro RDBMS de referencia. Las razones son muchas, y no vamos a entrar en detalle ahora mismo. Usaremos la versión community, que es de uso gratuito (si el alumno lo prefiere, puede utilizar MariaDB, que es 100% compatible con Mysql y además es software libre). Para descargar Mysql Community Version, podemos hacerlo desde su web: https://dev.mysql.com/downloads/mysql/.

* Aunque presuponemos unos ciertos conocimientos con bases de datos y SQL antes de iniciar este curso, trataremos de facilitar las operaciones de gestión con el RDBMS, como la creación de usuarios, ejecución de consultas de comprobación, etc… Lo haremos a través de la herramienta gráfica *oficial*, llamada Mysql Workbench. También es gratuita, y se puede descargar desde la web de mysql: https://dev.mysql.com/downloads/workbench/.

### 3.2 Creación de un nuevo esquema

Como punto de partida, vamos a crear un espacio en la base de datos donde podremos crear tablas e insertar datos. En la nomenclatura de MySQL, esto se llama esquema (*schema*). Un esquema puede ser utilizado por diferentes usuarios, con distintos niveles de privilegios.

Para crear un nuevo esquema desde MySQL Workbench tan solo tenemos que pulsar con el botón derecho del ratón sobre el panel *Navigator*, y seleccionar la opción *Create Schema*. A continuación, indicamos el nombre (por ejemplo, `hibernate`), y pulsamos sobre el botón Apply.

<img src="images/1-newesquema.jpeg">

Nosotros haremos uso de este nuevo esquema con un usuario que hemos creado durante la instalación de MySQL que se llama `openwebinars` y cuya contraseña es `12345678`.

### 3.3 Nuevo proyecto

#### 3.3.1 Creación y configuración inicial

Vamos a comenzar creando nuestro proyecto Maven, a través de la siguiente ruta

*File > New > Other > Maven > Maven project*

Seleccionamos como arquetipo

*org.apache.maven.archetypes maven-archetype-quickstart 1.1*

Se trata de la plantilla de proyecto más elemental.

En la siguiente pantalla, los datos serán:

* GroupId: `com.openwebinars.hibernate` (o algo similar)

* ArtifacId: `PrimerEjemploHibernate` (o algo similar)

* Package: `com.openwebinars.hibernate.primerejemplohibernate` (se trata de la concatenación de groupId y artifactId, pero todo en minúscula).

Lo siguiente es solucionar el warning, provocado por el arquetipo elegido, cambiando en el *Build Path* la versión de java, de la 1.5 a 1.8.

<img src="images/1-path-1.jpg">

<img src="images/1-path-2.jpeg">

<img src="images/1-path-3.jpg">

### 3.3.2 Configuración del fichero `pom.xml`

Ahora vamos a añadir las dependencias necesarias al fichero `pom.xml`, de forma que el apartado de dependencias queda de la siguiente forma:

```xml
  <dependencies>
    <!-- Otras dependencias, como la de jUnit... -->
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>5.2.9.Final</version>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.41</version>
        </dependency>
    </dependencies>
```

La primera dependencia es la que incluye de manera efectiva a Hibernate, entre otros módulos. La segunda es la que incluye las clases JDBC para conectar a Java con Mysql, y que son usadas por Hibernate.

#### 3.3.3. Creación del fichero de configuración de Hibernate, `hibernate.cfg.xml`.

#### 3.3.3. Creación del fichero de configuración de Hibernate, hibernate.cfg.xml.

A continuación, creamos una carpeta de recursos, en la ruta `/src/main/resources`. Para ello, pulsamos sobre el proyecto con el botón derecho y *New > Source Folder*. Indicamos la ruta completa, y marcamos la opción de *Update exclusion filters…*

Ahora, sobre la nueva carpeta creada, volvemos a pulsar con el botón derecho y *New > Other …*. En el asistente, buscamos la carpeta `Hibernate` y seleccionamos la opción `Hibernate Configuration File (cfg.xml)`. Pulsamos siguiente, y nombramos al fichero `hibernate.cfg.xml`.

El asistente nos facilitará mucho el trabajo, aunque es posible que luego tengamos que editar a mano alguna propiedad concreta.

Rellenamos los siguientes datos (o los que correspondan en nuestro caso):

<img src="images/1-hibernatecfg.jpeg">

Una vez creado el fichero, nos aparece el editor del mismo. Nos situamos en la opción `Hibernate`, y establecemos las propiedades *Show sql y Format sql a true*, así com *Hbm2ddl Auto a create*. Esta última propiedad es la encargada de generar las tablas necesarias para albergar nuestro modelo, sin necesidad de que nosotros lo tengamos que hacer manualmente.

<img src="images/1-hibernatecfg-2.jpeg">

### 3.3.4 Definición de nuestras clases modelo.

En este ejemplo, tan solo tendremos una clase modelo, cuyo contenido es el siguiente:

```java
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    private int id;

    @Column
    private String userName;

    @Column
    private String userMessage;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

}
```

Aunque estamos trabajando con Hibernate nativo, usamos las anotaciones de JPA (entre otras cosas, algunas anotaciones de Hiberante ya están deprecadas).

* `@Entity` indica que esta clase es una *entidad* que deberá ser gestionada por el motor de persistencia de Hibernate.

* `@Id` indica que, de todos los atributos, ese será tratado como clave primaria.

* `@Column` indica que ese atributo es una columna de la tabla resultante.

#### 3.3.5 Clase de aplicación

Por último, nos falta implementar el código necesario para cargar la configuración del fichero `hibernate.cfg.xml` y realizar las operaciones necesarias. En nuestro caso, insertar dos nuevas entidades en la base de datos.

El código es el siguiente. Que no le preocupe al lector si no lo comprende completamente, ya que se irá desgranando a lo largo de las siguientes lecciones:

```java
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Primer ejemplo con Hibernate Openwebinars.net
 *
 */
public class App {
    public static void main(String[] args) {
        // Inicializamos un objeto SessionFactory con la configuración
        // del fichero hibernate.cfg.xml
        SessionFactory sf = new Configuration().configure().buildSessionFactory();

        // Iniciamos una sesión
        Session session = sf.openSession();

        // Construimos un objeto de tipo User
        User user1 = new User();
        user1.setId(1);
        user1.setUserName("Pepe");
        user1.setUserMessage("Hello world from Pepe");

        // Construimos otro objeto de tipo User
        User user2 = new User();
        user2.setId(2);
        user2.setUserName("Juan");
        user2.setUserMessage("Hello world from Juan");

        // Iniciamos una transacción dentro de la sesión
        session.beginTransaction();

        // Almacenamos los objetos
        session.save(user1);
        session.save(user2);

        // Commiteamos la transacción
        session.getTransaction().commit();

        // Cerramos todos los objetos
        session.close();
        sf.close();
    }
}
```

Si comprobamos a través de Mysql Workbench, en nuestro esquema `hibernate` tendremos una nueva tabla, llamada `user` y que tendrá dos filas insertadas.

## Preguntas

P= Buen día, podrían ayudarme con la configuración del proxy en el IDE STS, puesto que al crear un nuevo proyecto MAVEN no responden las dependencias.

Aclaro que ya realice los siguientes:

`Windows -> Preferences >> General -> Network Connections >> Edit >> "Edit Proxy Entry"` en ella ingrese los datos del proxi.
Cree el archivo Settings.xml dentro de la carpeta .m2 con su respectivo contenido configurado para establecer proxy para Maven

`Windows -> Preferences >> Maven -> User Settings >> Agrege` la ruta del archivo Settings.xml en la caja de texto `"User Settings" >> Update Settings >> Apply >> Ok`

Mensaje visualizado en el archivo pom.xml: Cannot read lifecycle mapping metadata for artifact org.apache.maven.plugins:mav

Que más tengo que realizar o cuál es la manera correcta de configurar el IDE para crear proyectos Maven cuando estoy conectado a una red con Proxy.

R= Se me ocurren, a priori, dos causas posibles:

1) Revisar bien los datos de conexión del fichero settings.xml. Dentro se deberían indicar los elementos necesarios para la conexión http y https. A continuación, dejo un ejemplo:

```html
<proxies>
 <!-- Proxy para HTTP -->
 <proxy>
  <id>optional</id>
  <active>true</active>
  <protocol>http</protocol>
  <username></username>  <!-- Solo si es necesario -->
  <password></password>  <!-- Solo si es necesario -->
  <host>domain.com</host>
  <port>3128</port>
  <nonProxyHosts>local.net|some.host.com</nonProxyHosts>
 </proxy>
 <!-- Proxy para HTTPS -->
 <proxy>
  <id>optional</id>
  <active>true</active>
  <protocol>https</protocol>
  <username></username>   <!-- Solo si es necesario -->
  <password></password>  <!-- Solo si es necesario -->
  <host>domain.com</host>
  <port>3128</port>
  <nonProxyHosts>local.net|some.host.com</nonProxyHosts>
 </proxy>
</proxies>
```
2) En ocasiones, se puede llegar a corromper alguna librería o fichero descargado con maven. En tal caso, una solución práctica suele ser eliminar el contenido de la carpeta `.m2/repository/*;` posteriormente se pueden descargar las librerías a través de `Run > Maven > Maven install` (entre otras opciones).

P= java.lang.ClassNotFoundException: Could not load requested class : com.mysql.jdbc.Driver
Buenas noches por que me dice ese error que debo de hacer

R= Ese error indica que la JVM no es capaz de localizar la clase que indica en el classpath. Esa clase es la que utiliza el framework para conectarse, de forma efectiva, a la base de datos MySQL.

Te pediría que revises tu fichero pon.xml, y compruebes si la dependencia correspondiente está añadida.

P= Porque la tabla se autogenera en la base de datos con el mismo nombre de la clase User? Donde podria leer mas acerca de esto?

porque si le cambio el nombre de la carpeta `<default package>` a resources para el archivo hibernate.cfg.xml surgen problemas?

R= El hecho de que la tabla que se genera tenga el mismo nombre que la clase es una convención ampliamente aceptada. Este comportamiento por defecto se puede configurar con la anotación @Table. Si usas sobre una entidad esta anotación, indicando su argumento name, puedes modificar el nombre de la tabla que se genera. Por ejemplo:

```java
@Entity
@Table(name="persona")
public class User {
      //...
}
```  
  
P= He montado el primer ejemplo, con Mysql 8.0 y tras resolver varios errores, tales como el driver, la url,.... me he quedado estancado en el error:
java.sql.SQLException: Unknown system variable 'query_cache_size'

Segun he podido comprobar en internet, esta variable de sistema esta eliminada en el Mysql 8.0

Ciertamente, veo en el Workbench en Server Variables que have_query_cache = NO

¿Qué puedo hacer para seguir avanzando en el curso?

Un saludo y gracias de antemano

R= Según leo en la web de bugs de Mysql, para poder conectar a esa versión, tienes que tener una versión muy concreta del driver JDBC para Mysql.

[Ver](https://bugs.mysql.com/bug.php?id=87846)

¿Podrías probar con la última versión del driver? Según la web, es la 8.0.11

[Ver](https://dev.mysql.com/downloads/connector/j/)

Espero que te sirva de ayuda.

P= Tengo un problema al ejecutar la clase App.

MappingException: Unknown entity: com.alfonso.domenech.primerproyecto.User

Esto error se debe, por lo que he buscado, a que no lo reconoce como clase. He visto que la solución es no haber importado la librería de persistence, pero he revisado en la carpeta de dependencias y su que se ha cargado correctamente.

P= Creo que es por alguna version diferente, pero la configuración de hibernate tiende a añadirme esto:

`< session-factory name="" >`

dando errores de jndi. funciona correctamente quitando el name, tal como está en los repositorios GIT.

R= Gracias por el aporte Miguel Ángel :)

P= Entro en hibernate.org/orm y siguiendo los enlaces me indica la siguiente configuración de maven

```html
<dependency>
<groupId>org.hibernate</groupId>
<artifactId>hibernate-agroal</artifactId>
<version>5.3.7.Final</version>
<type>pom</type>
</dependency>
```

R= La última versión publicada es la 5.3.7. La dependencia maven debería ser entonces:

```html
<!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-core -->
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-core</artifactId>
    <version>5.3.7.Final</version>
</dependency>
```

R= Eso es porque "hibernate-agroal" es el primero alfabéticamente de la lista de artefactos de Hibernate que hay en la web de Bintray, que es a donde te lleva el enlace en la web de Hibernate, y al ser el primero aparece ese por defecto. Pero si te fijas, encima del botón de copiar hay una especie de flechita o triángulo verde que apunta hacia abajo, que abre un desplegable para elegir el artefacto, y ahí puedes escoger hibernate-core.

P= ¿Que relación hay o se tiene que dar, entre la version Hibernate en la creación del fichero config(cuadro de dialogo) y la versión que específicamos en las dependencias Maven que determinan las librerías a usar? Esa versión 5.1(5.3) que luego no aparece en el fichero hibernate.cfg.xml
Realmente no entiendo a que se refiere

R= El asistente pertenece a las llamadas Hibernate Tools de JBoss, y sirve para facilitarnos el trabajo de creación del fichero de configuración. La documentación sobre este asistente no deja muy claro para qué se debe seleccionar una versión concreta, si bien puedo imaginar que condicionará los datos que se ofrecen en los desplegables, entre otras posibles tareas.

Desde que publicamos el curso a día de hoy hemos pasado a la versión 5.3 de Hibernate, cuyas mejoras destacan en:

Posibilidad de usar JPA 2.2
Soporte para Java 9
Arreglo de algunos bugs
En teoría, prácticamente todo lo que hagas para la versión 5.2 debe funcionarte bien con la versión 5.3, por lo que puedes seleccionar esta última.

Con respecto a la correspondencia con Maven, también te recomiendo que, salvo que pierdas compatibilidad con algo de código desarrollado para una versión anterior, dejes incluida la última versión estable liberada, ya que suelen incluir arreglos a pequeños fallos de versiones anteriores.

P= En la clase de aplicación ¿La creación de los objetos de entidad no sería mejor hacerla antes de abrir sesion?

R= Se trata de un pequeño proyecto de ejemplo, y no hay verdaderos problemas de eficiencia en hacerlo antes o después.

En otro tipo de proyectos sí que tenemos que plantearnos que estrategia vamos a tener con respecto a la sesión, si bien esta depende del tipo de proyecto concreto.

P= Tengo un windows 7 de 64, y no he podido descargarme la última versión de mySql Community, por falta de un archivo en mi sistema. A pesar de buscar las actualizaciones de mi sistema, no ha sido capaz de resolver tal problemática.

¿¿Que versión podría ser compatible??

R= Durante el curso se utiliza la 5.7. Creo que podrás descargarla para Windows en este enlace:
https://dev.mysql.com/downloads/windows/installer/5.7.html

P= Estoy usando la version de MYsql 5.5.62
y solo me funciono especificado el hibernate.dialect como org.hibernate.dialect.MySQL5InnoDBDialect.

R= Si no me equivoco, es el dialecto que se utiliza en el ejemplo del vídeo. En el mismo lo que se explica lo necesario para, seleccionando InnoDB, poder seleccionar la clase de driver correcta.

P= Disculpa, el error que me da es el siguiente:

```sh
feb 07, 2019 2:17:00 AM org.hibernate.Version logVersion
INFO: HHH000412: Hibernate Core {5.4.1.Final}
feb 07, 2019 2:17:00 AM org.hibernate.annotations.common.reflection.java.JavaReflectionManager <clinit>
INFO: HCANN000001: Hibernate Commons Annotations {5.1.0.Final}
feb 07, 2019 2:17:01 AM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl configure
WARN: HHH10001002: Using Hibernate built-in connection pool (not for production use!)
feb 07, 2019 2:17:01 AM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001005: using driver [com.mysql.jdbc.Driver] at URL [jdbc:mysql://localhost/hibernate]
feb 07, 2019 2:17:01 AM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001001: Connection properties: {user=openwebinars, password=****}
```
R= Vamos a ver si somos capaces.

Para crear el usuario y la base de datos, quizás te pueda explicar mejor en un comentario como se hace a través de la línea de comandos. Para ello:

1. Abre un nuevo terminal (linux/Mac) o ventana de comandos (en Windows: Inicio > Ejecutar > cmd)
2. Doy por supuesto que ya has instalado mysql. Para conectarte con el cliente, el comando es: 
 `$ mysql -u root -p`
3. Te debe solicitar entoces la contraseña de administrador. La escribes, y te dará acceso.
4. Para crear un usuario y darle privilegios, las sentencias a ejecutar son:

```sql
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena';
GRANT ALL PRIVILEGES ON * . * TO 'nombre_usuario'@'localhost';
```

5. Te recomiendo que salgas de la base de datos con exit, y te logues ahora con el nuevo usuario.
6. Una vez que lo has hecho, puedes crear la base de datos con el siguiente comando:

```sql
CREATE DATABASE databasename;
```

Ya debes de tener el usuario y la base de datos creada.

Por el primer error que me dices, te pediría que revisaras la versión de Mysql que tienes instalada. Este curso está pensado para Mysql 5.7, y a día de hoy la última versión es la 8; entre ellas, hay algunas pequeñas diferencias que pueden producir error. Te pediría que revises la versión del servidor y del conector, para ver si están en consonancia. Si el error persiste, puedes volver a avisarme por aquí.

R= Modifiqué la versión en el fichero de configuración a la 8, y se me solucionó el problema.

P= Tengo el mismo error, y al acceder como root a MySQL, (¿la contraseña por defecto es 'sin contraseña'?), me devuelve el siguiente error:

```sh
C:\Program Files\MySQL\MySQL Workbench 8.0 CE>mysql -u root -p
Enter password:
ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost' (10061)

C:\Program Files\MySQL\MySQL Workbench 8.0 CE>
```

¿Cómo podría solventar dicho error?

R= Puede ser debido a varias causas, y la primera que se me ocurre es que el servidor de Mysql no esté ejecutandose. Puedes forzar el inicio siguiendo los siguientes pasos:

1. Ejecuta la consola (en windows cmd) como administrador (`Inicio > escribes cmd > botón derecho > ejecutar como administrador`).
2. Cambia de directorio al directorio `/bin` del servidor mysql
3. Suponiendo que la ruta es `c:\mysql\bin>`, ejecuta el comando `mysqld --install`
4. Después, ejecuta el comando `net start mysql`
5. Si vuelves a conectarte con `mysql -u root -p`, ya deberías tener conexión.

P= Hola, soy nuevo en Spring, y al estar empezando me está siendo muy complicado, he seguido todos los pasos desde 0, y me dice el siguiente error:`-Class "com.pruebaHibernate.User" is managed, but is not listed in the persistence.xml file User.java /prueba1/src/main/java/com/pruebaHibernate line 8 JPA Problem` He vuelto a empezar 7 veces el proyecto desde nuevo, y hasta he copiado y pegado el codigo de gitHub para ver si era un error mio de picar mal el código. Pero es que no entiendo si lo estoy configurando para conectarlo desde hibernate.cfg.xml, ¿Por qué le molesta tanto el persistence.xml, si eso no lo hemos tocado y a ti te va bien, de hecho ni siquiera aparece ese archivo en tu repositorio? Me estoy volviendo loco, Spring es un poco duro al principio jajaja

R=Este curso se desarrolla sin el uso de Spring. Solamente hay un ejemplo del uso de Spring e Hibernate. Sí que es verdad que el IDE que se utiliza es Spring Tool Suite, pero no por nada, sino porque en el fondo es Eclipse.
Tengo la impresión de que tienes una mezcla entre un proyecto JPA y un proyecto Hibernate nativo. ¿Te ha funcionado el código que te has descargado desde el repositorio? Si no, te animo a que puedas postear todo el código, para que lo pueda revisar.

P= Al lanzar el proyecto me da un error: Que no encuentra mi Unknown entity: ..User, Pero si voy al fichero de configuracion de hibernate donde está mapeada la clase, pulsando el botón control me la reconoce y puedo acceder a ella.

R= ¿Podrías darme más información sobre el error? Por ejemplo, puedes copiar y pegar toda la traza de la pila, para poder ayudarte mejor.

R= La traza completa es la siguiente: Y al debuguear ocurre el error al persistir el objeto user. 

```sh
( sesion.save(user);)


Exception in thread "main" org.hibernate.MappingException: Unknown entity: com.felix.hibernate.primerproyectohiber.User
at org.hibernate.internal.SessionFactoryImpl.getEntityPersister(SessionFactoryImpl.java:1096)
at org.hibernate.internal.SessionImpl.getEntityPersister(SessionImpl.java:1443)
at org.hibernate.event.internal.AbstractSaveEventListener.saveWithGeneratedId(AbstractSaveEventListener.java:116)
at org.hibernate.event.internal.DefaultSaveOrUpdateEventListener.saveWithGeneratedOrRequestedId(DefaultSaveOrUpdateEventListener.java:209)
at org.hibernate.event.internal.DefaultSaveEventListener.saveWithGeneratedOrRequestedId(DefaultSaveEventListener.java:55)
at org.hibernate.event.internal.DefaultSaveOrUpdateEventListener.entityIsTransient(DefaultSaveOrUpdateEventListener.java:194)
at org.hibernate.event.internal.DefaultSaveEventListener.performSaveOrUpdate(DefaultSaveEventListener.java:49)
at org.hibernate.event.internal.DefaultSaveOrUpdateEventListener.onSaveOrUpdate(DefaultSaveOrUpdateEventListener.java:90)
at org.hibernate.internal.SessionImpl.fireSave(SessionImpl.java:715)
at org.hibernate.internal.SessionImpl.save(SessionImpl.java:707)
at org.hibernate.internal.SessionImpl.save(SessionImpl.java:702)
at com.felix.hibernate.primerproyectohiber.App.main(App.java:35)
```

R= Pero, ¿estás ejecutando el código tal cual? ¿O has hecho alguna modificación?

R= Yo acabo de ejecutarlo tal cual, y no produce ese error; genera el DDL de la base de datos y realiza las inserciones correctamente :S

R= Tras descargar tu proyecto he visto diferencias en el pom. Mi pom contenía estas líneas. Las he quitado y me ha funcionado tras hacer un maven update. GRacias.

```html
<plugin>
<artifactId>maven-resources-plugin</artifactId>
<version>3.0.2</version>
</plugin>
<plugin>
<artifactId>maven-compiler-plugin</artifactId>
<version>3.8.0</version>
</plugin>
<plugin>
<artifactId>maven-surefire-plugin</artifactId>
<version>2.22.1</version>
</plugin>
<plugin>
<artifactId>maven-jar-plugin</artifactId>
<version>3.0.2</version>
</plugin>
<plugin>
<artifactId>maven-install-plugin</artifactId>
<version>2.5.2</version>
</plugin>
<plugin>
<artifactId>maven-deploy-plugin</artifactId>
<version>2.8.2</version>
</plugin>
<!-- site lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#site_Lifecycle -->
<plugin>
<artifactId>maven-site-plugin</artifactId>
<version>3.7.1</version>
</plugin>
<plugin>
<artifactId>maven-project-info-reports-plugin</artifactId>
<version>3.0.0</version>
</plugin>
</plugins>
```

R= Puede que hubiera diferencias en cuanto a las versiones.

## Transcripción

<img src="images/4-01.png">

Este tercer capítulo que tendrá unas tres lecciones vamos a aprender a crear nuestro primer proyecto en el que usemos Hibernate en, primero vamos a conocer cómo usar hibernate de forma nativa es decir sin JPA y sin ningún otro framework de por medio.

<img src="images/4-02.png">

<img src="images/4-03.png">

Como prerrequisito sobre todo a nivel de software vamos a comentar lo que utilizaremos a lo largo de todo el curso. Les recomiendo que utilicéis eclipse que es el IDE para proyectos Java por autonomacia, también podemos descargarnos Spring Tools Suite, que nos ofrece lo mismo que Eclipse y además también ofrece el soporte nativo para  trabajar con proyectos Spring. 

Si lo queréis descargar pues lo podéis encontrar fácilmente en la página web de Spring qué es https://spring.io/ o desde Eclipse https://www.eclipse.org/.

<img src="images/4-04.png">

Dentro de Eclipse existen lo que se conocían como las Hibernate Tools que quedan dentro de un paraguas de algo más amplio conocido ahora como las *JBoss Tools* nos van a permitir tener funcionalidades propias de Hibernate dentro de Eclipse. 

Vamos a ver fácilmente cómo se pueden instalar *JBoss Tools*, dentro de Help, el Marketplace, buscamos *JBoss Tools* para instalarla simplemente pulsar sobre el botón y seguiríamos el proceso puedo recomendar que de todas las herramientas que incluyen las JBoss tools si no vais a usarlas todas que marque solamente la de la de Hibernate.

<img src="images/4-14.png">

<img src="images/4-15.png">

<img src="images/4-16.png">

<img src="images/4-05.png">

Utilizaremos MySQL como sistema gestor de base de datos, si bien como tal ya no es software libre desde que Oracle de alguna manera compro a Sun el proyecto quedó dentro de paraguas de Oracle y aunque existe un Folk como MaríaDB, vamos a usar la versión Comunity de MySQL, además usaremos MySQL Workbench que nos permitira realizar algunas tareas de creación de esquemas de consulta de las tablas con un entorno gráfico bastante atractivo, es algo así como un IDE para MySQL y que será pues bastante  útil para nosotros.

Si entramos en la página de [MySQL](https://www.mysql.com/) en el apartado de descargas podremos encontrar como descargar las distintas versiones de MySQL, en particular si nos vamos abajo podemos encontrar la versión community y desde aquí si quisiéramos la podríamos descargar y en el menú de la izquierda también tenemos el *Workbeanch* que si queremos lo podemos descargar para diferentes sistemas operativos, este software no es obligatorio si tenéis alguna instalación de MySQL o de incluso MaríaDB podría valer o incluso XAMP.

<img src="images/4-06.png">

Vamos a ver qué pasos vamos a seguir para crear un nuevo proyecto en el que utilicemos Hibernate.

<img src="images/4-07.png">

Los pasos lo tenemos definido aquí que van a hacer estos seis, lo primero hacer la creación y configuración inicial del proyecto, después gestionaremos las dependencias, crearemos el fichero de configuracion de Hibernate `hibernate.cfg.xml`, crearemos las clases de nuestro modelo, la clase de ejemplo de aplicación que va a manejar un poco este modelo y ejecutaremos el proyecto.

<img src="images/4-08.png">

En primer lugar vamos a crear el proyecto, vamos a crear un proyecto de tipo Maven, vamos a escoger el arquetipo *quickstart* definiendo los datos iniciales y vamos a cambiar la versión de Java que trae el prototipo que por defecto es la 1.5 a la 1.8, por si queremos incorporar algún tipo de característica específica de Java 8 como podría ser el API Stream, las expresiones Lambda o algún otro tipo de elementos que quede incorporado dentro de Java 8.

<img src="images/4-17.png">

Creamos un nuevo Proyecto Maven

<img src="images/4-18.png">

Dejamos los datos como aparecen por defecto.

<img src="images/4-19.png">

Vamos a ulilizar el arquetipo *quitstart*, un arquetipo no es más que un proyecto de plantilla, *quitstart* es el proyecto Maven más sencillo que podemos encontrar y que nos va a servir para desarrollar una aplicación de escritorio. 

<img src="images/4-20.png">

↪️
![image](https://user-images.githubusercontent.com/23094588/128746842-d4feca48-fe2e-4659-9091-1301604b034b.png)

Recordar que Maven organiza sus proyectos mediante artefactos que vienen definidos por Id de Grupo y un Id de Artefacto.

Lo primero que vamos hacer es cambiar la versión de Java 1.5 a Java 1.8

<img src="images/4-21.png">

<img src="images/4-22.png">

<img src="images/4-23.png">

<img src="images/4-24.png">

<img src="images/4-25.png">

<img src="images/4-26.png">

<img src="images/4-27.png">

Como segundo paso vamos a añadir las dependencias necesarias a nuestro proyecto en el `pom.xml`.

<img src="images/4-09.png">

En nuestro caso van a ser dos, la primera es la dependencia Maven de Hibernate, las podemos localizar en el [mvnrepository](https://mvnrepository.com/) siempre tendrá publicada la última dependencia.

Y también nos hará falta el conector java para MySQL.

Hibernate no es más que una capa de abstracción sobre JDBC y JDBC necesita diferentes conectores en función del sistema Gestor de Bases de Datos que vayamos a usar de manera específica. 

Vamos a buscarla en https://bintray.com/hibernate/artifacts/hibernate-orm donde obtenemos:

```html
<dependency>
  <groupId>org.hibernate</groupId>
  <artifactId>hibernate-agroal</artifactId>
  <version>5.4.17.Final</version>
  <type>pom</type>
</dependency>
```

Y también tenemos que añadir la dependencia de MySQL en [mvnrepository](https://mvnrepository.com/)

<img src="images/4-28.png">

<img src="images/4-29.png">

Donde obtenemos:

```html
<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.20</version>
</dependency>
```

Estas dos dependencias las vamos a incluir dentro de nuestro archivo `pom.xml`

Al guardar el `pom.xml` todas las dependencias se descargan en nuestro proyecto dentro de la carpeta `Maven Dependencies`, como son varios archivos JARs que si lo tuvieramos que hacer manualmente sería muy complicado.

<img src="images/4-30.png">

Como tercer paso vamos a crear el fichero de configuración de Hibernate `hibernate.cfg.xml`.

<img src="images/4-10.png">

Posteriormente lo iremos rellenando con los datos que nos correspondan.

Antes de este paso deberíamos estar concientes que tendríamos que crear un usuario en MySQL para poder acceder a nuestra base de datos, no se recomienda que sea el usuario root, sino que sea un usuario que contenga los permisos especificos y también crear un esquema con el que nuestra aplicación va a trabajar. Un esquema es un conjunto de objetos dentro de la base de datos, tablas, vistas, secuencias, etc.

Al esquema lo llamaremos `hibernate` dentro tendra una base de datos también llamada `hibernate`, al usuario lo llamaremos  `openwebinars`, con contraseña `12345678`.

<img src="images/4-31.png">

Primero nos aseguramos que MySQL este arrancado.

<img src="images/4-32.png">

Creamos el esquema `hibernate` con el usuario `root`.

<img src="images/4-33.png">

Testeamos la conección.

<img src="images/4-34.png">

El esquema se ha creado.

<img src="images/4-35.png">

Entramos al esquema y creamos nuestro usuario.

```sql
CREATE USER 'openwebinars'@'localhost' IDENTIFIED BY '12345678';
GRANT ALL PRIVILEGES ON * . * TO 'openwebinars'@'localhost';
```
<img src="images/4-36.png">

Se ha creado correctamente.

<img src="images/4-37.png">

Ahora creamos la base de datos.

```sql
CREATE DATABASE hibernate;
```

<img src="images/4-38.png">

Todo va bien.

<img src="images/4-39.png">

Editamos el esquema para que podamos acceder con el usuario creado.

<img src="images/4-40.png">

Testeamos la conección.

<img src="images/4-41.png">

Y ya tenemos listo nuestro esquema con el usuario especifico.

Una vez que tenemos creado ese esquema ya podemos hacer el paso 3.

<img src="images/4-10-0.png">

<img src="images/4-10.png">

Para poder almacenar en un lugar adecuado ese fichero de configuración de Hibernate vamos a crear una nueva carpeta de código fuente con lo cual estará incluida dentro del classpath.

<img src="images/4-42.png">

Marcamos la opción de actualizar los filtros de exclusión para evitar que configurarlo nosotros a mano. 

En la nueva carpeta vamos a crear un nuevo archivo de tipo `Hibernate Configuration File (cfg.xml)`, las opciones nos aparecen gracias a que instalamos las JBoss Tools.

<img src="images/4-43.png">

<img src="images/4-44.png">

<img src="images/4-45.png">

↪️
![image](https://user-images.githubusercontent.com/23094588/128748964-6166629b-0cab-4896-aa7d-a8da997edac1.png)


No vamos a darle un nombre al `Session factory name`, esto es útil si le queremos definir más de uno.

Y podemos usar un pequeño truco primero marcamos en `Database dialect` con `MySQL` y en `Driver class` seleccionamos `com.mysql.jdbc.Driver` y ya que lo tenemos volvemos a `Database dialect` y ponemos `MySQL 5 (InnoDB)` ya que si lo marcabamos desde el principio el driver que aparece no es el recomendado, por eso tenemos que hacer este apaño.

El dialecto no es más que la manera de decirle a Hibernate el sistema gestor de base de datos que vamos a utilizar. Si incluyen infinidad de dialectos donde tiene los elementos concretos de ese sistema gestor de base de datos, de cara a la gestión de esquemas, tablas, consultas, etc.

La url de conexión no es más que una URL JDBC `jdbc:mysql://localhost/hibernate`, nuestro esquema por defecto será `hibernate`, el usuario `openwebinars` y la contraseña `12345678`.

Si marcamos la opción `Create a console configuration` nos van a salir muchos más apartados que ahora mismo no vamos a usar. Finalizamos en la creación del fichero.

Al haber instalado Hibernate Tools nos aparce una consola con diferentes pestañas para gestionar el archivo.

<img src="images/4-46.png">

<img src="images/4-47.png">

↪️
![image](https://user-images.githubusercontent.com/23094588/128749511-ad0c76cb-f9a7-4bd2-88df-fe6046a7d2e3.png)

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC
		"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
		"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
        <property name="hibernate.connection.password">12345678</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost/hibernate</property>
        <property name="hibernate.connection.username">openwebinars</property>
        <property name="hibernate.default_schema">hibernate</property>
        <property name="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
    </session-factory>
</hibernate-configuration>
```

<img src="images/4-11.png">

Vamos a continuar con las tareas, vamos a añadir una serie de propiedades que nos van a ser muy utiles como son *Show sql, Format sql y Hbm2ddl Auto*.

Las dos primeras servirán para que Hibernate vaya mostrando por el log, las consultas SQL que va lanzando al sistema Gestor de Base de Datos la primera solo los muestra, la segunda hace una especie de función Pretty y nos muestra ese código SQL más entendible, la tercer propiedad *Hbm2ddl Auto* nos va a permiti que sea Hibernate el que se encargue de construir el esquema de la base de datos si nosotros lo queremosy  de actualizar los cambios con respecto a versiones anteriores descargandonos a nosotros de esa tarea en particular. 

Nos vamos a la consola del archivo `hibernate.cfg.xml` en la pestaña `Hibernate` 
 
<img src="images/4-48.png">

Le vamos a decir que nos muestre SQL, que lo muestre formateado y que cree el esquema de la base de datos.

<img src="images/4-49.png">

Podemos ver como en el código se insertan las propiedades que marcamos.

<img src="images/4-50.png">

<img src="images/4-12.png">

Ahora es el momento de crear nuestra clase Modelo y añadir las anotaciones que seran las necesarias. En principio vamos a manejar muy pocas, para indicar en el mundo Hibernate y en el mundo JPA también que una clase tiene que ser manejada por el ORM, tan solo añadiremos la anotación `@Entity` y como obligación tan solo tenemos que añadir una anotación más, que es definir que propiedad definirá la clave primaria, es decir aquella que no podrá repetirse para dos instancias de una entidad con la anotación `@Id`. Hay una tercera anotación opcional `@Column` para el resto de propiedades que desemos indicar que son columnas, si bien no es obligatorio.

Vamos a crear una nueva clase Java normal en el paquete principal llamada `User`.

<img src="images/4-51.png">

Como hemos dicho anotamos con `@Entity` la clase `User`. Creamos una primera propiedad llamada `id` y la anotamos con `@Id` para indicar que es la clave primaria de nuestra tabla, ya nos va sugiriendo el que nosotros vayamos añadiendo las anotaciones, aunque estamos trabajando con Hibernate nativo nos vamos ir acostubrando a ir trabajando con las anotaciones de JPA, por que es la tecnología que vamos a usar en los próximos proyectos.

Vamos a añadir otros dos atributos `userName` y `userMesagge` si bien ya hablaremos más adelante como elementos mínimos de una entidad deberíamos tener un constructor sin parámetros y los getter y setter de las propiedades que vamos a manejar, los podemos autogenerar con Eclipse. Pues ya tenemos nuestra primera entidad:

```java
package com.openwebinars.hibernate.primerproyectohbn;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

   @Id
   private int id;
	
   private String userName;
	
   private String userMessage;
 	
   public User() {
		
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getUserMessage() {
      return userMessage;
   }

   public void setUserMessage(String userMessage) {
      this.userMessage = userMessage;
   }
	
}
```

Aaunque para que realmente sea una entidad, tendremos que añadir la entidad dentro de nuestro fichero de configuracion de Hibernate, eso lo podemos hacer bien desde el código fuente, bien desde el asistente, en el apartado de `Mapping`.

<img src="images/4-52.png">

Podemos añadir la clase

<img src="images/4-53.png">

Incluso podemos buscar la clase.

<img src="images/4-54.png">

<img src="images/4-55.png">

<img src="images/4-56.png">

Si vemos en el código fuente, se ha añadido una nueva anotación mapping con la ruta completa con el nombre cualificado de nuestra clase. 

<img src="images/4-57.png">

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
                                         "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
 <session-factory name="">
  <property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
  <property name="hibernate.connection.password">12345678</property>
  <property name="hibernate.connection.url">jdbc:mysql://localhost/hibernate</property>
  <property name="hibernate.connection.username">openwebinars</property>
  <property name="hibernate.default_schema">hibernate</property>
  <property name="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
  <property name="hibernate.show_sql">true</property>
  <property name="hibernate.format_sql">true</property>
  <property name="hibernate.hbm2ddl.auto">create</property>
  <mapping class="com.openwebinars.hibernate.primerproyectohbn.User"/>
 </session-factory>
</hibernate-configuration>
```

<img src="images/4-13.png">

Ya casi hemos terminado, tan solo nos quedaría crear la clase de aplicación. Hibernet va a descansar, si bien ya lo veremos con más detenimiento más adelante, va a descansar sobre un objeto que se llama 
`Session` que no es más que una conexión a la base de datos, que mantiene las instancias de las entidades que estamos manejando en ese momento y esa sesión la vamos a obtener a partir de una factoría de sesiones, las sesiones de un objeto algo más liviano, la factoría es un objeto bastante pesado, su creación se lleva bastante tiempo y recursos, con lo cual solamente se suele crear una sola `SessionFactory` en toda la aplicación y la cantidad de sesiones que veamos necesaria aunque ya hablaremos del tema en los Patrones y Antipatrones del capítulo 10.

Vamos a crear la `SessionFactory` que carge la configuración que hemos definido antes en el fichero XML, abriremos una sesión, crearemos las instancias, iniciaremos una transacción para que la persistencia de nuestro objeto queden marcadas dentro de esa transacción, haremos la persistencia real, commitearemos esa transacción es decir marcaremos el fin para que hagan de manera efectiva los cambios en la base de datos y cerraremos los diferentes objetos. Todo esto lo vamos hacer dentro de nuestra clase de aplicación `App.java`.

Podemos cargar la configuración del `SessionFactory` con el fichero XML de dos maneras diferentes un código `Legazi` heredado de versiones anteriores, sería algo más fácil por la cantidad de líneas de código y sería algo así:

```java
SessionFactory sf = new Configuration().configure().buildSessionFactory();
```

Para crear un `SessionFactory` solamente tendríamos que usar la clase `Configuration()` para que configurara el fichero XML, como el fichero tiene el nombre que por defecto espera Hibernate que es `hibernate.cfg.xml` y además se encuentra dentro de la carpeta donde espera encontrarlo que es la carpeta `source/main/resource` no tenemos que indicar ningún parámetro más.

Sin embargo como decimos este código es `Legazi` es decir es antiguo, vamos a utilizar la forma que Hibernate propone en su documentación, para la versión 5, es algo más compleja pero tener en cuenta que se hace solamente en un sitio del proyecto y si seguimos los parámetros por defecto posiblemente no necesitemos nada más que copiarlo y pegarlo.

Creamos un registro estándar de servicio a través de un builder, y ya podemos configurar en este caso tampoco debemos indicar nada con respecto al fichero de configuración y podemos construir este objeto directamente. 

```java
StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
```

Y ahora este objeto lo utilizamos para fabricar propiamente dicho el SessionFactory, que lo haríamos a través del `MetadataSources` vamos a construir todos los metadatos y el `SessionFactory`. 

```java
SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
```

Ya tendríamos nuestro `SessionFactory` preparado. 

¿Qué tendríamos que hacer ahora?, tendríamos que abrir la sesión, lo hacemos de una manera sencilla mediante el comando `openSession()` nos inicia una nueva sesión, la sesión se cerrará mediante el comando `close()` y todo el código que desarrollemos va en medio y después de cerrar la sesión también cerraremos la factoría porque nuestro programa ya termina. 

```java
//Apertura de una sesión (e inicio de una transacción)
Session session = sf.openSession();
    	
    	
    	
//Cierre de la sesión
session.close();
sf.close();
```

Es en medio donde vamos a generar el resto de nuestro código, va a ser muy sencillo crear una entidad no es más que crear un objeto Java. Como hemos definido un constructor sin parámetros hacemos uso de el, le asignamos un id, por ejemplo el número 1, le asignamos un nombre vamos a llamarlo Pepe, vamos a ponerle un mensaje de bienvenida. Si queremos podríamos crear otro objeto vamos a llamarle `user2` le asignamos el id 2, un hombre le vamos a llamar Juan, mensaje de bienvenida.

Muy bien ya tenemos dos objetos creados pero no persistidos para ello tendríamos comenzar una nueva transacción, vamos a marcar también el cierre de la misma, sobre transacciones ya hablaremos largo y tendido a lo largo del curso, pero podríamos entender una transacción como un lote de operaciones que vamos a realizar enfrentada a la base de datos. Vamos a almacenar los objetos utilizando el método `save(user)` del objeto `Session` y lo mismo para `user2`.

```java
User user1 = new User();
user1.setId(1);
user1.setUserName("Pepe");
user1.setUserMessage("Hello world from Pepe");
    	
User user2 = new User();
user2.setId(2);
user2.setUserName("Juan");
user2.setUserMessage("Hello world from Juan");

//Inicio de la transacción
session.beginTransaction();
    	
//Almacenamos los objetos
session.save(user1);
session.save(user2);
    			
//Commit de la transacción
session.getTransaction().commit();
```

El código completo de la clase queda así:

*`App.java`*

```java
package com.openwebinars.hibernate.primerproyectohbn;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        
    	StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
    	
    	SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
    	
    	//SessionFactory sf = new Configuration().configure().buildSessionFactory();
    
    	//Apertura de una sesión (e inicio de una transacción)
    	Session session = sf.openSession();
    	
    	User user1 = new User();
    	user1.setId(1);
    	user1.setUserName("Pepe");
    	user1.setUserMessage("Hello world from Pepe");
    	
    	User user2 = new User();
    	user2.setId(2);
    	user2.setUserName("Juan");
    	user2.setUserMessage("Hello world from Juan");
	
	session.beginTransaction();
    	
    	//Almacenamos los objetos
    	session.save(user1);
    	session.save(user2);
    			
    	//Commit de la transacción
    	session.getTransaction().commit();
    	
    	//Cierre de la sesión
    	session.close();
    	sf.close();
	
    }
}
```

Ya podemos ejecutar nuestra aplicacíon como una aplicación Java, da un primer error:

`ERROR: The server time zone value 'CEST' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the 'serverTimezone' configuration property) to use a more specifc time zone value if you want to utilize time zone support.`

Este es un error por la configuración del tiempo en la base de datos que no tiene nada que ver con nuestro programa, para solucionar este problema tenemos el siguiente [link](https://es.stackoverflow.com/questions/48935/configurar-zona-horaria-jdbc-driver-java/48946), vamos a aplicar el siguiente comando en la base de datos hibernate `SET GLOBAL time_zone = '-3:00';`.

Vamos a volver a ejecutar la aplicación, ahora se nos presenta lo siguiente:

<img src="images/4-58.png">

Este error lo solucionamos elimininando del archivo `hibernate.cfg.xml` de la línea `<session-factory name="">` el atributo `name` es decir que debe quedar así `<session-factory>` por que no le habiamos dado un nombre. Una vez hecho el cambio volvamos a intentarlo.

<img src="images/4-59.png">

A parte de un monton de mensajes en rojo nos vamos a centrar solamente en aquellos que tuvieran en negro, Hibernate lo primero que hace cuando le marcamos la propiedad `hbm2ddl.auto` con valor `create` lo primero que hace es verificar si existe el modelo en la base de datos y lo borra, para generarlo de nuevo.

```sql
Hibernate: 
    
    drop table if exists User
```

Posteriormente trata de lanzar la sentencia DDL, es decir de creación de la tabla que como podemos comprobar, es una sentencia que va a crear la tabla llamada `User` con un campo `id` y los tipos los ha optenido mapeando los tipos Java a MySQL qué es el sistema gestor que nosotros estamos utilizando y además añadido la restricción de clave primaria el campo que tenemos como `id`.

```sql
Hibernate: 
    
    create table User (
       id integer not null,
        userMessage varchar(255),
        userName varchar(255),
        primary key (id)
    ) engine=InnoDB
```

Posteriormente nos muestra las dos sentencias de inserción que hemos ejecutado:

```sql
Hibernate: 
    insert 
    into
        User
        (userMessage, userName, id) 
    values
        (?, ?, ?)
Hibernate: 
    insert 
    into
        User
        (userMessage, userName, id) 
    values
        (?, ?, ?)
```

Vamos entrar a través de MySQL Workbench y vamos a comprobar que está creación se ha hecho de verdad y podríamos comprobar que se han almacenados nuestros valores almacenados.

<img src="images/4-61.png">

### :computer: Código Completo - Proyecto 130-01-PrimerProyectoHbn

Vamos a poner la estructura y código de este proyecto.

<img src="images/4-100.png">

<img src="images/4-60.png">

*`pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.openwebinars.hibernate</groupId>
	<artifactId>PrimerProyectoHbn</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<name>PrimerProyectoHbn</name>
	<!-- FIXME change it to the project's website -->
	<url>http://www.example.com</url>

	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<maven.compiler.source>1.7</maven.compiler.source>
		<maven.compiler.target>1.7</maven.compiler.target>
	</properties>

	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.11</version>
			<scope>test</scope>
		</dependency> 
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-agroal</artifactId>
			<version>5.4.17.Final</version>
			<type>pom</type>
		</dependency>
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>8.0.20</version>
		</dependency>
		
	</dependencies>

	<build>
		<pluginManagement><!-- lock down plugins versions to avoid using Maven 
				defaults (may be moved to parent pom) -->
			<plugins>
				<!-- clean lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#clean_Lifecycle -->
				<plugin>
					<artifactId>maven-clean-plugin</artifactId>
					<version>3.1.0</version>
				</plugin>
				<!-- default lifecycle, jar packaging: see https://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_jar_packaging -->
				<plugin>
					<artifactId>maven-resources-plugin</artifactId>
					<version>3.0.2</version>
				</plugin>
				<plugin>
					<artifactId>maven-compiler-plugin</artifactId>
					<version>3.8.0</version>
				</plugin>
				<plugin>
					<artifactId>maven-surefire-plugin</artifactId>
					<version>2.22.1</version>
				</plugin>
				<plugin>
					<artifactId>maven-jar-plugin</artifactId>
					<version>3.0.2</version>
				</plugin>
				<plugin>
					<artifactId>maven-install-plugin</artifactId>
					<version>2.5.2</version>
				</plugin>
				<plugin>
					<artifactId>maven-deploy-plugin</artifactId>
					<version>2.8.2</version>
				</plugin>
				<!-- site lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#site_Lifecycle -->
				<plugin>
					<artifactId>maven-site-plugin</artifactId>
					<version>3.7.1</version>
				</plugin>
				<plugin>
					<artifactId>maven-project-info-reports-plugin</artifactId>
					<version>3.0.0</version>
				</plugin>
			</plugins>
		</pluginManagement>
	</build>
</project>
```

*`hibernate.cfg.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
                                         "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
 <session-factory>
  <property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
  <property name="hibernate.connection.password">12345678</property>
  <property name="hibernate.connection.url">jdbc:mysql://localhost/hibernate</property>
  <property name="hibernate.connection.username">openwebinars</property>
  <property name="hibernate.default_schema">hibernate</property>
  <property name="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
  <property name="hibernate.show_sql">true</property>
  <property name="hibernate.format_sql">true</property>
  <property name="hibernate.hbm2ddl.auto">create</property>
  <mapping class="com.openwebinars.hibernate.primerproyectohbn.User"/>
 </session-factory>
</hibernate-configuration>
```

*`User.java`*

```java
package com.openwebinars.hibernate.primerproyectohbn;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private int id;
	
	private String userName;
	
	private String userMessage;
	
	
	public User() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMessage() {
		return userMessage;
	}

	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}
	
}
```

*`App.java`*

```java
package com.openwebinars.hibernate.primerproyectohbn;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        
    	StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
    	
    	SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
    	
    	//SessionFactory sf = new Configuration().configure().buildSessionFactory();
    
    	//Apertura de una sesión (e inicio de una transacción)
    	Session session = sf.openSession();
    	
    	User user1 = new User();
    	user1.setId(1);
    	user1.setUserName("Pepe");
    	user1.setUserMessage("Hello world from Pepe");
    	
    	User user2 = new User();
    	user2.setId(2);
    	user2.setUserName("Juan");
    	user2.setUserMessage("Hello world from Juan");
    	
    	
    	session.beginTransaction();
    	
    	//Almacenamos los objetos
    	session.save(user1);
    	session.save(user2);
    			
    	//Commit de la transacción
    	session.getTransaction().commit();
    	
    	//Cierre de la sesión
    	session.close();
    	sf.close();

    }
}
```

# 05 Primer proyecto con Hibernate con JPA 13:58 

[Primer proyecto con Hibernate con JPA](pdfs/04_Primer_proyecto_JPA.pdf)

## Resumen Profesor

### 4.1 Comenzamos de nuevo

En esta lección, vamos a realizar las mismas tareas, pero en lugar de usar Hibernate de forma nativa, usaremos JPA con Hibernate como motor de persistencia.

### 4.2 Pasos iniciales

Seguimos los mismos pasos que en la lección pasada, creado el proyecto Maven. En este caso, los datos pueden ser:

* GroupId: `com.openwebinars.hibernate` (o algo similar)

* ArtifacId: `PrimerEjemploHibernateJpa` (o algo similar)

* Package: `com.openwebinars.hibernate.primerejemplohibernatejpa` (se trata de la concatenación de groupId y artifactId, pero todo en minúscula).

Actualizamos la versión de Java, y pasamos a configurar el `pom.xml`.

En este caso, las dependencias que incluiremos son las siguientes:

```xml
  <dependencies>
    <!-- Otras dependencias, como la de jUnit... -->
    <!-- for JPA, use hibernate-entitymanager instead of hibernate-core -->
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-entitymanager</artifactId>
            <version>5.2.9.Final</version>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.41</version>
        </dependency>
    </dependencies>
```

En la misma web de Hibernate se nos indica que si vamos a trabajar con JPA, incluyamos la dependencia `hibernate-entitymanager`, en lugar de `hibernate-core` (que por cierto, va incluida transitivamente en la anterior).

En este caso, no es indispensable crear la carpeta `/src/main/resources`.

### 4.3 Añadir características JPA

Este será el primer paso diferente al anterior. Pulsamos el botón derecho sobre el proyecto y seleccionamos la opción *Properties*.

Ahora, añadimos la característica JPA, y en la pestaña *Runtimes*, seleccionamos Java 8.

<img src="images/2-project-facets.jpeg">

A partir de ahora, nuestro proyecto incluye algunos elementos más, como **la unidad de persistencia**.

<img src="images/2-project-facets-2.jpeg">

### 4.4 Añadir las entidades

Antes de configurar la unidad de persistencia, vamos a añadir las entidades que vayamos a manejar en nuestro programa. Va a ser un simple clon del programa anterior, así que añadimos la misma clase *User*:

```java
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    private int id;

    @Column
    private String userName;

    @Column
    private String userMessage;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

}
```

Nada más añadirla, eclipse nos lanza un fallo, diciendo que por estar anotada, la clase es *gestionada*, pero que no está listada dentro de la unidad de persistencia. Vamos a solventarlo.

### 4.5 Configuración de la unidad de persistencia

#### 4.5.1 Clases gestionadas

A través del asistente, añadimos nuestra clase *User*, y podemos marcar la opción de *Exclude unlisted classes*

#### 4.5.2 Conexión

En la segunda pestaña, vamos a definir nuestra conexión. Lo hacemos como un *Resource Local* y, bien podemos establecer los datos a mano, o dar de alta una nueva conexión a base de datos, a través de la vista *Data Source Explorer*.

<img src="images/2-project-facets-3.jpeg">

#### 4.5.3 Opciones de Hibernate

Vamos a establecer ahora algunos parámetros propios de Hibernate, para que nuestro proyecto pueda funcionar. Son muy parecidos al proyecto anterior:

* `hibernate.dialect: org.hibernate.dialect.MySQL5InnoDBDialect`

* `hibernate.connection.driver: com.mysql.jdbc.Driver`

* `hibernate.hbm2ddl.auto: create`

* `hibernate.show_sql: true`

* `hibernate.format_sql: true`

Algunas se pueden añadir directamente desde la pestaña *Hibernate*, y otras desde la pestaña *Properties*.

<img src="images/2-project-facets-4.jpeg">

### 4.6 Clase de aplicación

Ya podemos pasar a realizar nuestra clase de aplicación. Esta implementará las mismas tareas que en la lección anterior, pero la configuración inicial es algo diferente. Veamos el código:

```java
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Primer proyecto JPA con Hibernate
 * www.openwebinars.net
 *
 */
public class App {
    public static void main(String[] args) {

        //Configuramos el EMF a través de la unidad de persistencia
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PrimerEjemploHibernateJPA");

        //Generamos un EntityManager
        EntityManager em = emf.createEntityManager();

        //Iniciamos una transacción
        em.getTransaction().begin();

        // Construimos un objeto de tipo User
        User user1 = new User();
        user1.setId(1);
        user1.setUserName("Pepe");
        user1.setUserMessage("Hello world from JPA with Pepe");

        // Construimos otro objeto de tipo User
        User user2 = new User();
        user2.setId(2);
        user2.setUserName("Juan");
        user2.setUserMessage("Hello world from JPA with Juan");

        //Persistimos los objetos
        em.persist(user1);
        em.persist(user2);

        //Commiteamos la transacción
        em.getTransaction().commit();

        //Cerramos el EntityManager
        em.close();

    }
}
```

A diferencia del proyecto anterior, en este caso tenemos que inicializar dos objetos `EntityManagerFactory` y `EntityManager`. El segundo será nuestra interfaz directa con la base de datos, teniendo los métodos necesarios para consultar, actualizar, insertar o borrar datos. El primero es la *factoría* que nos permite construir al segundo, cargando los datos de nuestra unidad de persistencia.

## Preguntas

P= Buenas, estoy intentando entender porque es necesario usar JPA. ¿Hibernate no tiene ya definida la persistencia?. ¿No estoy viendo a priori las ventajas de JPA?.

R= La gran diferencia es que Hibernate es un producto comercial, y JPA es un estándar. De hecho, JPA es solo un documento, una especie de contrato, que establece una serie de elementos que deben ser implementados por aquellos vendors que quieran realizar su implementación.

Las ventajas del uso de JPA+Hibernate frente a Hibernate a secas pueden ser las siguientes:

* Si usas JPA, el día de mañana podrías mudarte de motor de persistencia, cambiando de Hibernate a otro mejor, diferente, más ligero, más barato, .... con un mínimo esfuerzo de cambio de código.
* Si bien es cierto que JPA, en sus orígenes. está basado en el trabajo de Hibernate, sus derroteros en el futuro pueden ir por separado. En tanto en cuanto Hibernate proporcione una implementación para JPA, podrás seguir disfrutando de sus características.
* El uso de JPA sobre Hibernate no te limita a, en casos concretos, utilizar elementos concretos de la implementación de Hibernate; a cambio, ese código que has producido estará más acoplado a esta solución tecnológica. Pero si te aporta algún beneficio, no es mala solución.

P= Para las dependencias Maven estoy viendo el Maven Repository y dice que _EntityManager está deprecado y que use el core...¿Será que el core ya implementa JPA?

```sh
Hibernate ORM Hibernate EntityManager
org.hibernate » hibernate-entitymanagerLGPL
(deprecated - use hibernate-core instead) Hibernate O/RM implementation of the JPA specification
```

R= Efectivamente, a día de hoy se mantiene por compatibilidad. Si utilizas la dependencia core debes de poder utilizar EntityManager sin ninguna dificultad.

P= Cual es la diferencia de usar la libreria EntityManager y hibernate core?, como voy a determinar si debo usar esta o el otro?

¿Que es JPA J facet?

Como se llama la primera opcion de hacer un proyecto hibernate y como se llama la segunda opcion?

R= Te respondo por partes

* Cual es la diferencia de usar la libreria EntityManager y hibernate core?, como voy a determinar si debo usar esta o el otro?

En las nuevas versiones de Hibernate, esto queda resuelto. Si vas a trabajar con JPA como estándar, e Hibernate como motor de JPA, ya solo tienes que incluir la dependencia de hibernate core, ya que incluye de por sí la de EntityManager.

* ¿Que es JPA J facet?

Las eclipse facets (facetas eclipse) es una característica que ofrece eclipse, que permite que un determinado proyecto Java EE tenga un aspecto de configuración de ejecución determinado. Para poder trabajar correctamente con un proyecto JPA, deberíamos asegurarnos de que dicho proyecto tenga la faceta JPA.

* Como se llama la primera opcion de hacer un proyecto hibernate y como se llama la segunda opcion?

En este curso os propongo varias formas de utilizar Hibernate.

1. De forma nativa. Aquí utilizamos Hibernate directamente, con todas las funcionalidades que ofrece.
2. Utilizar JPA como estándar, e Hibernate como motor de persistencia. Si el día de mañana queremos cambiar de motor de persistencia, lo podremos hacer más fácilmente.
3. Utilizar JPA en un proyecto Spring. JPA es un estándar de Java EE, y como tal, lo podemos utilizar en un proyecto Java EE normal o también en un proyecto Spring. Si vas a trabajar con Spring, esta sería tu forma de trabajo.

## Transcripción

<img src="images/5-01.png">

En esta lección vamos a seguir creando nuestro primer proyecto Hibernate pero en este caso lo vamos a hacer conjuntamente con JPA, vamos a ver qué pasó hay que seguir porque algunos son bastante distinto.

<img src="images/5-02.png">

En primer lugar vamos a crear nuestro proyecto que también será un proyecto Maven, vamos añadir las características de JPA, Eclipse o Spring Tools tienen una perspectiva para JPA, vamos a añadir las clases Modelo o entidades en nuestro caso será la misma que en el ejemplo anterior, vamos a configurar la unidad de persistencia, podriamos decir que algo parecido al archivo de configuración de Hibernate, por lo menos en cuanto a contenido conceptualmente son dos cosas distintas, vamos a crear nuestra clase de aplicación y lo vamos a ejecutar.

<img src="images/5-03.png">

Creamos de nuevo el mismo proyecto, nuevo proyecto de tipo Maven.

<img src="images/5-09.png">

<img src="images/5-10.png">

<img src="images/5-11.png">

<img src="images/5-12.png">

<img src="images/5-13.png">

Vamos a cambiar el build Path de 1.7 a 1.14

<img src="images/5-14.png">

<img src="images/5-04.png">

Vamos a ir buscando la dependencia, en este caso en lugar de usar `hibernate-core`  usaremos `hibernate-entitymanager` si vamos a usar JPA solamente, a diferencia de antaño que teniamos que incluir varias dependencias, solamente tendríamos que insertar esta dependencia, esta va a incluir el nucleo y los elementos necesarios para poder trabajar con JPA.

```html
<!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-entitymanager -->
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-entitymanager</artifactId>
    <version>5.4.17.Final</version>
</dependency>
```

y también añadimos la dependencia de MySQL dentro del `pom.xml`

```html
<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.20</version>
</dependency>
```

Al incluir estas dos dependencias en el archivo `pom.xml` ya tendríamos nuestras dependencias organizadas.

Ya tenemos nuestro proyecto creado ya tenemos configurado Java 8 y las dependencias, que tendríamos que hacer.

<img src="images/5-05.png">

El siguiente paso será añadir las características de JPA a nuestro proyecto, eso lo vamos a hacer como sigue,pulsamos sobre el proyecto con el botón derecho y pulsamos  propiedades y vamos a seleccionar la opción `Project Facets`. 

<img src="images/5-15.png">

Lo primero que tenemos que indicar es que este proyecto será usado con `Project Facets`. Pulsamos sobre el enlace para que se configure automáticamente.

<img src="images/5-16.png">

Para aquellos que no lo hayáis hecho antes es posible que marque algún tipo de configuración en la que podéis elegir que seréis vosotros mismos los que vais a gestionar la configuración de la librería y los ficheros en lugar de marcar una serie de ficheros Jars que ya esten añadidos.

Marcamos JPA y en la pestaña de Runtimes marcamos Java 8.

<img src="images/5-17.png">

Y pulsamos en el enlace `Further configuration required` 

<img src="images/5-18.png">

Como a mi no me sale pongo lo que hace el profesor.

<img src="images/5-19.png">

<img src="images/5-20.png">

Marcamos Hibernate.

<img src="images/5-21.png">

Desabilitamos la configuración de las librerias.

<img src="images/5-22.png">

Con esto nuestro proyecto ya es un proyecto JPA, pero no lo parece porque seguimos en una perspectiva que no es la perspectiva de JPA, para abrir una perspectiva nos tenemos arriba en la esquina en la que seleccionamos una perspectiva JPA.

<img src="images/5-23.png">

Una perspectiva no es más que un conjunto de ventanas, de vistas Eclipse nos ofrece  cómo podéis comprobar las que tenemos disponible han cambiado.

<img src="images/5-06.png">

A partir de ahora vamos a seguir los diferentes pasos, cómo es crear nuestras clases modelos y anotarla al igual que en el ejemplo anterior, lo que vamos a hacer es copiar la clase `User` porque su contenido va a ser exactamente el mismo.

```java
package com.openwebinars.hibernate.primerproyectohibernatejpa;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private int id;

	@Column
	private String userName;

	@Column
	private String userMessage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMessage() {
		return userMessage;
	}

	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}

}
```

Sin embargo ahora al añadirla nos da un error y es que nos dice la clase `User` es una entidad, es decir que va a ser manejada por JPA, pero no está listada en el fichero de persistencia y es que no lo hemos configurado aún.

<img src="images/5-24.png">

Al convertir nuestro proyecto a un proyecto JPA se nos a creado el JPA Context con el fichero `persistence.xml`

<img src="images/5-07.png">

Está configuración tiene los pasos de de la imágen, vamos a añadir nuestra entidad como clases gestionada, vamos a crear la conexión y vamos a añadir las diferente opciones de Hibernate.

<img src="images/5-25.png">

El nombre de aquí será el nombre del contexto de persistencia `PrimerProyectoHibernateJPA`. 

Vamos a ver la pestaña de Conexión entre los dos tipos de conexión que tenemos tenemos la conexión usando transacciones JTA o transacciones de recurso local,

<img src="images/5-26.png">

utilizaremos esta última, mediante este sistema del cual hablaremos en el capítulo 10, somos nosotros los encargados de gestionar las transacciones y no un sistema centralizado como ofrece JavaEE o Spring.

<img src="images/5-27.png">

Para insertar los datos de la conexión lo podemos hacer a través de una conexión ya generada que podemos construir aquí abajo, o través de una serie de datos.

Vamos a configurar rápidamente la conexión en la vista `Data Source Explorer` pulsamos con el botón derecho sobre `Database Connection`, seleccionamos MySQL y ahora le tendríamos que proporcionar un driver y alguien se preguntará, no lo hemos descargado directamente mediante una dependencia Maven.

<img src="images/5-28.png">

<img src="images/5-29.png">

<img src="images/5-30.png">

Sí sin embargo esta parte de Eclipse necesita el JAR directamente, con lo cual lo podemos agregar, no nos valdría de los que tenemos aquí 

<img src="images/5-31.png">

y lo que podemos añadir de una manera efectiva, tenemos nosotros el fichero JAR dentro de nuestro repositorio local de Maven que es accesible desde usuarios/adolfodelarosa/.m2/repository/mysql/mysql-connector y la versión que queramos usar.

<img src="images/5-32.png">

<img src="images/5-33.png">

(Todo esto en mi local no funciono, no me dejo añadir el JAR)

De esta manera estaremos usando la misma librería que tenemos incluida dentro de nuestro proyecto una vez seleccionado el driver tenemos que proporcionar el nombre de la base de datos, `hibernate`, nombre de usuario, y contraseña, testeamos la conexión, perfecta y ya la podemos almacenar.

<img src="images/5-34.png">

<img src="images/5-35.png">

<img src="images/5-36.png">

<img src="images/5-37.png">

Una vez que tengamos aquí la conexión, podemos rellenar los datos desde esa nueva conexión, ya tenemos aquí las propiedades.

<img src="images/5-38.png">

<img src="images/5-39.png">

Aun quedan propiedades por settear son propiedades de Hibernate, que las podemos agregar de varias maneras, desde el fichero de código fuente o desde la pestaña de propiedades. Al igual que antes seleccionamos MySQL y el driver. Como podemos comprobar incluso podríamos proporcionar un fichero de configuracion hibernate.cfg.xml para que leyera las propiedades.

<img src="images/5-40.png">

Las otras opciones que vamos a añadir que la tenemos aquí en la pestaña Properties.

<img src="images/5-41.png">

Podemos añadir `hibernate.show_sql true`, `hibernate.format_sql true` y  `hibernate.hbm2ddl.auto create`.

<img src="images/5-42.png">

Ya tenemos que estas opciones añadidas, solamente nos faltaría especificar que nuestra clase `User` es una entidad que será manejada por JPA y lo hacemos a través del asistente.

<img src="images/5-43.png">

Vamos a marcar que excluya aquellas clases que no esten marcadas clase que no estén listadas.

<img src="images/5-44.png">

Con todo lo que hemos hecho, hemos pasado de tener el archivo `persistence.xml` 

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="PrimerProyectoHibernateJPA">
	</persistence-unit>
</persistence>
```

Y pasar a tenrlo así:

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.1" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd">
	<persistence-unit name="PrimerEjemploHibernateJPA" transaction-type="RESOURCE_LOCAL">
		<class>com.openwebinars.hibernate.PrimerEjemploHibernateJPA.User</class>
		<exclude-unlisted-classes>true</exclude-unlisted-classes>
		<properties>
			<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/hibernate"/>
			<property name="javax.persistence.jdbc.user" value="openwebinars"/>
			<property name="javax.persistence.jdbc.password" value="12345678"/>
			<property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
			<property name="hibernate.dialect" value="org.hibernate.dialect.MySQL5InnoDBDialect"/>
			<property name="hibernate.connection.driver_class" value="com.mysql.jdbc.Driver"/>
			<property name="hibernate.hbm2ddl.auto" value="create"/>
			<property name="hibernate.show_sql" value="true"/>
			<property name="hibernate.format_sql" value="true"/>
		</properties>
	</persistence-unit>
</persistence>
```

Cómo podemos comprobar el error sobre nuestra clase `User` ya ha desaparecido.

<img src="images/5-45.png">

Debemos recordar el nombre de nuestro contexto de persistencia `PrimerEjemploHibernateJPA`

<img src="images/5-46.png">

Porque lo vamos a necesitar para crear nuestra clase de aplicación.

<img src="images/5-08.png">

La inicialización de un proyecto JPA es diferente a la de un proyector de Hibernate nativo, porque aquí lo que necesitamos es un objeto llamado EntityManager que será el que haga las veces de SessionFactory en este caso se llama EntityManagerFactory y EntityManager y son un poco más faciles de crear. 

JPA proporciona un método llamado `createEntityManagerFactory` que solamente proporcionandole el nombre nos va a permitir cargar el fichero de configuración 

`EntityManagerFactory emf = Persistence.createEntityManagerFactory("PrimerEjemploHibernateJPA");`.

A partir de allí vamos a generar el `EntityManager` que es facíl de generar tan solo llamando al método de creación del mismo.

`EntityManager em = emf.createEntityManager();`

Y al igual que antes vamos a incluir los métodos de cierre.

```java
em.getTransaction().commit();
em.close();
```

Nos faltaría incluir el código de aplicación, podemos utilizar igual que en el caso anterior.

```java
User user1 = new User();
user1.setId(1);
user1.setUserName("Pepe");
user1.setUserMessage("Hello world from JPA with Pepe");

User user2 = new User();
user2.setId(2);
user2.setUserName("Juan");
user2.setUserMessage("Hello world from JPA with Juan");
```

Y faltaría que definiéramos el inicio de la transacción, el almacenamiento de la información y el final de la transacción.

```java
em.getTransaction().begin();

em.persist(user1);
em.persist(user2);

em.getTransaction().commit();
```
Y ya podemos ejecutar nuestra aplicación como una aplicación Java.

<img src="images/5-47.png">

Cómo podemos comprobar se ha borrado la tabla porque existia  del ejemplo anterior, se ha vuelto a crear con los mismos tipos de datos que antes y se han insertado los dos valores, de hechos vamos a consultar en MySQL Workbeanch, vamos a refrescar y podemos comprobar que se han insertado los nuevos valores.

<img src="images/5-48.png">

En la próxima lección que será la última en el capítulo haremos el mismo proyecto pero lo crearemos usando Spring Boot y Spring MVC.

### :computer: Código Completo - 130-02-PrimerProyectoHibernateJPA

<img src="images/5-49.png">

*`pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.openwebinars.hibernate</groupId>
	<artifactId>PrimerProyectoHibernateJPA</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<name>PrimerProyectoHibernateJPA</name>
	<!-- FIXME change it to the project's website -->
	<url>http://www.example.com</url>

	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<maven.compiler.source>1.7</maven.compiler.source>
		<maven.compiler.target>1.7</maven.compiler.target>
	</properties>

	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.11</version>
			<scope>test</scope>
		</dependency>
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-entitymanager</artifactId>
			<version>5.4.17.Final</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>8.0.20</version>
		</dependency>
	</dependencies>

	<build>
		<pluginManagement><!-- lock down plugins versions to avoid using Maven 
				defaults (may be moved to parent pom) -->
			<plugins>
				<!-- clean lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#clean_Lifecycle -->
				<plugin>
					<artifactId>maven-clean-plugin</artifactId>
					<version>3.1.0</version>
				</plugin>
				<!-- default lifecycle, jar packaging: see https://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_jar_packaging -->
				<plugin>
					<artifactId>maven-resources-plugin</artifactId>
					<version>3.0.2</version>
				</plugin>
				<plugin>
					<artifactId>maven-compiler-plugin</artifactId>
					<version>3.8.0</version>
				</plugin>
				<plugin>
					<artifactId>maven-surefire-plugin</artifactId>
					<version>2.22.1</version>
				</plugin>
				<plugin>
					<artifactId>maven-jar-plugin</artifactId>
					<version>3.0.2</version>
				</plugin>
				<plugin>
					<artifactId>maven-install-plugin</artifactId>
					<version>2.5.2</version>
				</plugin>
				<plugin>
					<artifactId>maven-deploy-plugin</artifactId>
					<version>2.8.2</version>
				</plugin>
				<!-- site lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#site_Lifecycle -->
				<plugin>
					<artifactId>maven-site-plugin</artifactId>
					<version>3.7.1</version>
				</plugin>
				<plugin>
					<artifactId>maven-project-info-reports-plugin</artifactId>
					<version>3.0.0</version>
				</plugin>
			</plugins>
		</pluginManagement>
	</build>
</project>
```

*`persistence.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.1" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd">
	<persistence-unit name="PrimerEjemploHibernateJPA" transaction-type="RESOURCE_LOCAL">
		<class>com.openwebinars.hibernate.primerproyectohibernatejpa.User</class>
		<exclude-unlisted-classes>true</exclude-unlisted-classes>
		<properties>
			<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/hibernate"/>
			<property name="javax.persistence.jdbc.user" value="openwebinars"/>
			<property name="javax.persistence.jdbc.password" value="12345678"/>
			<property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
			<property name="hibernate.dialect" value="org.hibernate.dialect.MySQL5InnoDBDialect"/>
			<property name="hibernate.connection.driver_class" value="com.mysql.jdbc.Driver"/>
			<property name="hibernate.hbm2ddl.auto" value="create"/>
			<property name="hibernate.show_sql" value="true"/>
			<property name="hibernate.format_sql" value="true"/>
		</properties>
	</persistence-unit>
</persistence>
```

*`User.java`*

```java
package com.openwebinars.hibernate.primerproyectohibernatejpa;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private int id;

	@Column
	private String userName;

	@Column
	private String userMessage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMessage() {
		return userMessage;
	}

	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}

}
```

*`App.java`*

```java
package com.openwebinars.hibernate.primerproyectohibernatejpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Primer proyecto JPA con Hibernate 
 *
 */
public class App {
	public static void main(String[] args) {
		
		//Configuramos el EMF a través de la unidad de persistencia
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PrimerEjemploHibernateJPA");

		//Generamos un EntityManager
		EntityManager em = emf.createEntityManager();

		//Iniciamos una transacción
		em.getTransaction().begin();

		// Construimos un objeto de tipo User
		User user1 = new User();
		user1.setId(1);
		user1.setUserName("Pepe");
		user1.setUserMessage("Hello world from JPA with Pepe");

		// Construimos otro objeto de tipo User
		User user2 = new User();
		user2.setId(2);
		user2.setUserName("Juan");
		user2.setUserMessage("Hello world from JPA with Juan");
		
		//Persistimos los objetos
		em.persist(user1);
		em.persist(user2);

		//Commiteamos la transacción
		em.getTransaction().commit();
		
		//Cerramos el EntityManager
		em.close();

	}
}
```

# 06 Primer proyecto con Spring boot, Spring MVC e Hibernate (parte I) 16:25 

[Primer proyecto con Spring boot, Spring MVC e Hibernate](pdfs/05_Primer_proyecto_Spring_JPA_e_Hibernate.pdf)

## Resumen Profesor

### 5.1 Y volvemos a comenzar

Vamos a realizar, por tercera vez, la misma operación. En este caso, el punto de partida será un proyecto Spring Boot. Animamos al lector a que al menos visite el **curso online de Spring MVC** para manejar bien algunos conceptos como la inyección de dependencias, el patrón MVC de Spring o el uso de Spring Boot.

### 5.2 Creación del proyecto

#### 5.2.1 Datos iniciales

Creamos un nuevo proyecto. En este caso, se trata de un proyecto *Spring Starter Project*. Podemos dejar los elementos de configuración (Maven, Java 1.8, …).

* groupId: `com.openwebinars.hibernate`

* artifactId: `PrimerEjemploSpringJPAHibernate`

* description: a gusto del programador

* package: `com.openwebinars.hibernate.primerejemplospringjpahibernate`

(Como siempre, estos datos pueden ser establecidos por el alumno siguiendo su propia nomenclatura).

#### 5.2.2. Dependencias

Para aquellos que ya hayan creado algún proyecto de Spring Boot será conocido que este asistente nos permite seleccionar las dependencias que vamos a utilizar. Spring nos facilita mucho el trabajo, ya que podemos marcar aquello que sea necesario, y él se encargará de incluirlo en el `pom.xml`:

* *Web*: indicaremos que vamos a crear un proyecto Web MVC. Se encarga de insertar las dependencias, también, de *IoC container*.

* *SQL > MySQL*: incluirá el conector de Mysql para Java.

* *JPA*: nos permite utilizar en nuestro proyecto JPA, Spring Data JPA, Spring ORM e Hibernate. Esta dependencia nos ahorra tener que incluir manualmente las dependencias de JPA+Hibernate.

### 5.3 Configuración de la base de datos

Ya que estamos usando Spring Boot, haremos uso de la configuración vía Java, en lugar de a través de descriptores XML. Para configurar la base de datos, usaremos una clase con todos los elementos necesarios, y el fichero de *properties*.

Creamos una nueva clase, llamada DatabaseConfig:

```java
import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

    /**
     * Definición del DataSource para la conexión a nuestra base de datos.
     * Las propiedades son establecidas desde el fichero de properties, y
     * asignadas usando el objeto env.
     *
     */
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(env.getProperty("db.driver"));
        dataSource.setUrl(env.getProperty("db.url"));
        dataSource.setUsername(env.getProperty("db.username"));
        dataSource.setPassword(env.getProperty("db.password"));
        return dataSource;
    }

    /**
     *
     * Declaración del EntityManagerFactory de JPA
     */
    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();

        //Le asignamos el dataSource que acabamos de definir.
        entityManagerFactory.setDataSource(dataSource);

        // Le indicamos la ruta donde tiene que buscar las clases anotadas
        entityManagerFactory.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));

        // Implementación de JPA a usar: Hibernate
        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        entityManagerFactory.setJpaVendorAdapter(vendorAdapter);

        // Propiedades de Hiberante
        Properties additionalProperties = new Properties();
        additionalProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
        additionalProperties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        additionalProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
        entityManagerFactory.setJpaProperties(additionalProperties);

        return entityManagerFactory;
    }

    /**
     * Inicializa y declara el gestor de transacciones
     */
    @Bean
    public JpaTransactionManager transactionManager() {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory.getObject());
        return transactionManager;
    }

    /**
     *  
     * Este bean es un postprocessor que ayuda a relanzar las excepciones específicas
     * de cada plataforma en aquellas clases anotadas con @Repository
     *
     */
    @Bean
    public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
        return new PersistenceExceptionTranslationPostProcessor();
    }

    @Autowired
    private Environment env;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private LocalContainerEntityManagerFactoryBean entityManagerFactory;

}
```

Y el fichero de properties:

```
# Base de datos
db.driver: com.mysql.jdbc.Driver
db.url: jdbc:mysql://localhost/hibernate
db.username: openwebinars
db.password: 12345678

# Hibernate
hibernate.dialect: org.hibernate.dialect.MySQL5InnoDBDialect
hibernate.show_sql: true
hibernate.hbm2ddl.auto: create
entitymanager.packagesToScan: com.openwebinars.hibernate.primerejemplospringjpahibernate
```

Los diferentes métodos anotados con `@Bean` sirven para construir esos beans al *vuelo* e inyectarlos directamente.

* El bean `dataSource` es el que crea dicho objeto con los datos definidos en el fichero de properties. Un `DataSource` es un objeto Java que nos permite generar conexiones con una base de datos.

* El bean `entityManagerFactory` es el que utilizaremos más adelante para construir instancias de EntityManager. Para crearlo, le tenemos que asignar el `dataSource` y un `vendorAdapter`, es decir, una implementación concreta de JPA. En nuestro caso es Hibernate.

* El bean `transactionManager` permitira utilizar la anotación `@Transactional`, que estudiaremos más adelante.

Por último, el bean `exceptionTranslation` sirve para propagar las excepciones de bases de datos a las clases que implementemos y anotemos con `@Repository`.

### 5.4 Nuestro modelo y nuestra clase DAO (Data Access Object)

Nuestro modelo sigue siendo el mismo de los últimos proyectos:

```java
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    private int id;

    @Column
    private String userName;

    @Column
    private String userMessage;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

}
```

En este proyecto, vamos a añadir una nueva clase, haciendo uso del patrón *Data Access Object*, que nos invita a crear un objeto que encapsule las operaciones CRUD sobre una entidad.


```java
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class UserDao {

    // A través de la anotación @PersistenceContext, se inyectará automáticamente
    // un EntityManager producido desde el entityManagerFactory definido en la clase
    // DatabaseConfig.
    @PersistenceContext
    private EntityManager entityManager;


    /**
     * Almacena el usuario en la base de datos
     */
    public void create(User user) {
        entityManager.persist(user);
        return;
    }

    /**
     * Elimina el usuario de la base de datos.
     */
    public void delete(User user) {
        if (entityManager.contains(user))
            entityManager.remove(user);
        else
            entityManager.remove(entityManager.merge(user));
        return;
    }

    /**
     * Devuelve todos los usuarios de la base de datos.
     */
    @SuppressWarnings("unchecked")
    public List<User> getAll() {
        return entityManager.createQuery("from User").getResultList();
    }

    /**
     * Devuelve un usuario en base a su Id
     */
    public User getById(int id) {
        return entityManager.find(User.class, id);
    }

    /**
     * Actualiza el usuario proporcionado
     */
    public void update(User user) {
        entityManager.merge(user);
        return;
    }

}
```

Destaquemos algunos elementos:

* El estereotipo `@Repository` indica que esta clase es algo así como un almacén de datos.

* La anotación `@Transactional` permitirá, al tener definido un motor de transacciones en la clase DatabaseConfig, provocará que se invoquen los métodos begin() y commit() de forma “mágica” en el inicio y el fin cada método de esta clase.

* La anotación `@PersistenceContext` nos permite realizar dos operaciones en una: inyectar un `EntityManager` que será creado desde el bean `entityManagerFactory`.

### 5.5 Controlador

Por último, nuestro proyecto MVC necesita un controlador. Veamos el código fuente:

```java
package com.openwebinars.hibernate.primerejemplospringjpahibernate;

import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {


    // Inyectamos el DAO dentro del Controller
    @Autowired
    private UserDao userDao;

    /**
     *
     * Crea un nuevo usuario con un Id autogenerado, y con los datos recibidos
     * por la URL
     *
     * /create?name=...&message=....
     *
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    public String create(String name, String message) {
        try {
            User user = new User();
            // Estas líneas de código generan un Id aleatorio.
            // En las próximas lecciones veremos como delegar esto en la base de
            // datos
            Random r = new Random();
            int randomId = r.nextInt(Integer.MAX_VALUE);
            // Asignamos los datos
            user.setId(randomId);
            user.setUserName(name);
            user.setUserMessage(message);

            userDao.create(user);
        } catch (Exception ex) {
            return "Error creando el usuario: " + ex.toString();
        }
        return "Usuario creado correctamente";
    }

    /**
     *
     * Elimina un usuario, localizándolo por su Id
     *
     * /delete?id=...
     *
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(int id) {
        try {
            User user = new User();
            user.setId(id);
            userDao.delete(user);
        } catch (Exception ex) {
            return "Error eliminando el usuario: " + ex.toString();
        }
        return "Usuario eliminado correctamente";
    }

    /**
     *
     * Actualiza el nombre y el mensaje de un usuario, localizándolo por su Id
     *
     * /update?id=...&name=...&message=....
     *
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String updateName(int id, String name, String message) {
        try {
            User user = userDao.getById(id);
            user.setUserName(name);
            user.setUserMessage(message);
            userDao.update(user);
        } catch (Exception ex) {
            return "Error actualizando el usuario: " + ex.toString();
        }
        return "Usuario actualizado correctamente";
    }

}
```
## Preguntas 

P= Cuando estuve creando el segundo bean que genera el LocalContainerEntityManagerFactoryBean, me sugirió que también podia usar el LocalEntityManagerFactoryBean.
Mi consulta es: Al configurar una fábrica de administradores de entidades ya sea que esten gestionados por la aplicación o por el contenedor. ¿En qué casos debo elegir una de ellas? ¿Cual es el más comun? ¿Por qué en este caso usaste el LocalContainer ?

R= Lo suelo utilizar porque, según indica la documentación, es una clase más flexible. LocalEntityManagerFactoryBean lee la configuración de persistencia de un fichero XML; LocalContainerEntityManagerFactoryBean nos permite establecer, por ejemplo, la configuración a través de un Datasource de forma programática. Puedes echar un vistazo a la documentación de Javadoc de ambas clases para ver los métodos que proporciona LocalContainerEntityManagerFactoryBean y que no están disponibles en LocalEntityManagerFactoryBean

P= Otros autores también señalan que debería existir un bean de tipo PersistenceAnnotationBeanPostProccesor que es necesario para que Spring pueda inyectar EntityManagerFactory o EntityManager. Sin embargo en este ejemplo no veo esto. ¿Se trata de alguna versión que ya deprecó este método o lo hace ahora internamente con alguno de los demás beans que generaste?

R= Al utilizar Spring Boot y las dependencias starter, ese bean se ha inyectado "por debajo", pero estar, está. Con todo, muchas gracias por tu aportación.

## Transcripción

En esta lección vamos a aprender cómo poder trabajar con JPA y Hibernate pero dentro de un proyecto Spring en particular dentro de un proyecto Spring Boot y que será una aplicación Web MVC.

<img src="images/6-01.png">

<img src="images/6-02.png">

<img src="images/6-03.png">

<img src="images/6-04.png">

Vamos a ver los pasos que tendríamos que seguir para crear nuestro proyecto, el primer paso cómo pasó 0 os recomiendo que visitéis el curso de Spring sobre todo el apartado de en Spring MVC, allí se explica con detenimiento los pasos a seguir para utilizando la herramienta Spring Tool Suite poder crear proyectos de aplicaciones Web utilizando los distintos módulos que tiene Spring en particular el modulo web y también Spring Boot que nos va a facilitar mucho la configuración de proyectos, nosotros lo haremos a fondo en este ejemplo.

<img src="images/6-05.png">

Primero lo que vamos a hacer es crear ese nuevo proyecto, vamos a crear como un proyecto starter.

<img src="images/6-11.png">

<img src="images/6-12.png">

El nombre del proyecto va a ser `PrimerProyectoSpringHibernateJPA` será un proyecto Maven, para Java 8, empaquetado JAR, pondremos como Group `com.openwebinars.hibernate`, como nombre de proyecto `com.openwebinars.hibernate.spring`. 

<img src="images/6-13.png">

De entre todos los módulos posibles que podemos incluir con Spring Boot vamos a añadir algunos de ellos, el módulo Spring Web que nos añadira las dependencias necesarias para hacer una aplicación web, el módulo de JPA y el de MySQL, de esa manera nos desentenderemos de tener que añadir nosotros manualmente las dependencias en el fichero `pom.xml`. 

Spring Tool Suite descarga el proyecto, se trata de un proyecto especial porque es un proyecto Maven preparado especialmente para trabajar con Spring, la estructura del proyecto es un poco diferente ya viene directamente la carpeta resource, con el fichero de properties, la aplicación que carga por defecto es distinta es una aplicación Spring Boot. Trae las dependencias Maven nos hemos ahorrado de tener que escribirlas.

<img src="images/6-14.png">

<img src="images/6-06.png">

Como primer paso vamos a marcar la configuración que va a tener este proyecto JPA con Hibernate, en lugar de hacerlo mediante XML cosa que hemos hecho en los dos proyectos anteriores, vamos a aprovechar la tecnología Java Config que nos ofrece Spring para configurar el proyecto a través de una clase.

Para ello creamos una nueva clase, la vamos a llamar `DatabaseConfig`.

<img src="images/6-15.png">

La vamos a anotar con `@Configuration` lo cual le va a indicar a Spring Boot que se trata de una clase de configuración y la ejecutará en el momento correspondiente y vamos a añadir la anotación de la habilitación de la gestión de transacciones para que podamos definir la gestión de transacciones también en esta clase `@EnableTransactionManagement`.

```jav
@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

}
```

<img src="images/6-07.png">

Dentro tenemos que crear una serie de BEANs, en particular tenemos que crear una serie de beans dónde definamos el origen de los datos, en el haremos referencia al fichero de properties que es donde finalmente pondremos está configuración.

<img src="images/6-08.png">

Vamos a crear otro bean que será el que se encargue de crear el `entityManagerFactory` y cómo lo va a crear, a partir del DataSource que hemos definido indicándole las clases que va a manejar, indicándole la implementación que vamos a utilizar de JPA que en nuestro caso será Hibernate y las propiedades adicionales de Hibernate que hemos estado añadiendo hasta ahora en los diferentes proyectos de ejemplo.

<img src="images/6-09.png">

Por último también definiremos quien se va a encargar de las transacciones, veremos que el manejo de las transacciones con Spring aquí será más sencillo y este `PostProcessor` se va a encargar de determinadas excepciones para que las podamos recoger de una manera efectiva. 

<img src="images/6-10.png">

Y por último dentro de esta clase de configuración autoinyectoremos los beans qué vamos a necesitar. 

Vamos a crear el código.

Vamos a generar un bean dónde cargaremos las propiedades.

```java
@Bean
public DataSource dataSource() {
		
}
```

Para crear este bean vamos a necesitar de un elemento que esté auto-inyectado, auto-cableado que es `Environment`.

```java
@Autowired
private Environment env;
```

Que nos va a permitir leer la configuración de las diferentes properties, que vamos a tener definidas.

Ya dentro del método `dataSource()` lo que vamos a hacer es crear el `dataSource` a partir del `DriverManager` para los que ya habéis trabajado con JDBC y DataSource puede ser que este código resulte un poco conocido.

`DriverManagerDataSource dataSource = new DriverManagerDataSource();`

Marcamos las propiedades del origen de datos, el driver que lo vamos a cargar desde una propiedad, la propiedad `db.driver` que definiremos en el fichero de properties.

`dataSource.setDriverClassName(env.getProperty("db.driver"));`

La URL de conexión que también la vamos a cargar desde la propiedad `db.url`

`dataSource.setUrl(env.getProperty("db.url"));`

Y el nombre de usuario y contraseña 

```java
dataSource.setUsername(env.getProperty("db.username"));
dataSource.setPassword(env.getProperty("db.password"));
```

Y finalmente retornamos el `dataSource`.

```java
return dataSource;
```

Todo el bean queda así:

```java
/**
* Definición del DataSource para la conexión a nuestra base de datos. 
* Las propiedades son establecidas desde el fichero de properties, y 
* asignadas usando el objeto env.
* 
*/
@Bean
public DataSource dataSource() {
   DriverManagerDataSource dataSource = new DriverManagerDataSource();
   dataSource.setDriverClassName(env.getProperty("db.driver"));
   dataSource.setUrl(env.getProperty("db.url"));
   dataSource.setUsername(env.getProperty("db.username"));
   dataSource.setPassword(env.getProperty("db.password"));
   return dataSource;
}
```

Después añadiremos estos valores en el fichero de properties.

Muy bien ya tenemos nuestro bean de origen de datos y lo vamos a auto-cablear también directamente aquí para que cuando se cargue el fichero de configuración se auto-inyecte.

```java
@Autowired
private DataSource dataSource;
```

Vamos a hacer la declaración del `EntityManagerFactory` este método es algo más largo. Spring nos va a permitir definir mediante un bean el `EntityManagerFactory` de forma local mediante el objeto que va a devolver este método.

```java
@Bean
public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

}
```

Ya lo podemos auto-cablear.

```java
@Autowired
private LocalContainerEntityManagerFactoryBean entityManagerFactory;
```

Este objeto nos permitirá generar el EntityManager haya dónde lo vayamos a necesitar de una manera que veremos qué es batante interesante.

Volviendo al método `entityManagerFactory()` creamos un nuevo objeto de este tipo, que será el que devolvamos.

```java
@Bean
public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

   LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
		
   return entityManagerFactory;
}
```

Y ahora vamos a asignarle una serie de propiedades, en primer lugar le asignamos como origen de datos el DataSource que hemos creado a inyectado en esta clase.


```java
//Le asignamos el dataSource que acabamos de definir.
entityManagerFactory.setDataSource(dataSource);
```

En segundo lugar le vamos a indicar cuál será los paquetes que tiene que escanear para buscar las clases anotadas, vendrá también como un property en el fichero de properties.

```java
// Le indicamos la ruta donde tiene que buscar las clases anotadas
		entityManagerFactory.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));

```

En tercer lugar le vamos a decir que como implementación, como vendor de JPA  vamos a usar Hibernate, para eso usaremos las clases propias que nos da Hibernate para ellos, a través de `HibernateJpaVendorAdapter` y se lo asignaremos al `entityManagerFactory`.

```java
// Implementación de JPA a usar: Hibernate
HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
entityManagerFactory.setJpaVendorAdapter(vendorAdapter);
````
Y por último vamos añadirlos las propiedades de Hibernate que hemos arrastrado hasta antes, como son el dialecto, la propiedad show SQL y la generación del DDL, que también se cargará desde el fichero de properties.

```java
// Propiedades de Hiberante
Properties additionalProperties = new Properties();
additionalProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
additionalProperties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
additionalProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
entityManagerFactory.setJpaProperties(additionalProperties);
```

Y finalmente retornamos el `entityManagerFactory`.

`return entityManagerFactory;`

Este método ya estaría completo.

```java
/**
*
* Declaración del EntityManagerFactory de JPA
 */
@Bean
public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
   LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
		
   //Le asignamos el dataSource que acabamos de definir.
   entityManagerFactory.setDataSource(dataSource);

   // Le indicamos la ruta donde tiene que buscar las clases anotadas
   entityManagerFactory.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));

   // Implementación de JPA a usar: Hibernate
   HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
   entityManagerFactory.setJpaVendorAdapter(vendorAdapter);

   // Propiedades de Hiberante
   Properties additionalProperties = new Properties();
   additionalProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
   additionalProperties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
   additionalProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
   entityManagerFactory.setJpaProperties(additionalProperties);

   return entityManagerFactory;
}
```

Nos faltaría definir el gestor de transacciones y el bean `PostProcessor` del que hablamos antes.

El gestor de transacciones vendrá definido por un `JpaTransactionManager`. A este transaction manager le vamos a setear el `entityManagerFactory` que venimos manejando y lo retornamos, ya veremos qué fácil es manejar las transacciones.


```java
/**
* Inicializa y declara el gestor de transacciones
*/
@Bean
public JpaTransactionManager transactionManager() {
   JpaTransactionManager transactionManager = new JpaTransactionManager();
   transactionManager.setEntityManagerFactory(entityManagerFactory.getObject());
   return transactionManager;
}
```

Y por último el bean `PostProcessor` que nos permitira relanzar una serie de excepciones a nivel de base de datos a través de las distintas capas para que nosotros las podamos utilizar. 

```java
/**
*  
* Este bean es un postprocessor que ayuda a relanzar las excepciones específicas
* de cada plataforma en aquellas clases anotadas con @Repository
* 
*/
@Bean
public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
   return new PersistenceExceptionTranslationPostProcessor();
}
```

La clase completa a quedado así.

```java
package com.openwebinars.hibernate.primerejemplospringjpahibernate;

import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

	/**
	 * Definición del DataSource para la conexión a nuestra base de datos. 
	 * Las propiedades son establecidas desde el fichero de properties, y 
	 * asignadas usando el objeto env.
	 * 
	 */
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("db.driver"));
		dataSource.setUrl(env.getProperty("db.url"));
		dataSource.setUsername(env.getProperty("db.username"));
		dataSource.setPassword(env.getProperty("db.password"));
		return dataSource;
	}

	/**
	 *
	 * Declaración del EntityManagerFactory de JPA
	 */
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
		
		//Le asignamos el dataSource que acabamos de definir.
		entityManagerFactory.setDataSource(dataSource);

		// Le indicamos la ruta donde tiene que buscar las clases anotadas
		entityManagerFactory.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));

		// Implementación de JPA a usar: Hibernate
		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		entityManagerFactory.setJpaVendorAdapter(vendorAdapter);

		// Propiedades de Hiberante
		Properties additionalProperties = new Properties();
		additionalProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
		additionalProperties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		additionalProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
		entityManagerFactory.setJpaProperties(additionalProperties);

		return entityManagerFactory;
	}

	/**
	 * Inicializa y declara el gestor de transacciones
	 */
	@Bean
	public JpaTransactionManager transactionManager() {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory.getObject());
		return transactionManager;
	}

	/**
	 *  
	 * Este bean es un postprocessor que ayuda a relanzar las excepciones específicas
	 * de cada plataforma en aquellas clases anotadas con @Repository
	 * 
	 */
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}

	@Autowired
	private Environment env;

	@Autowired
	private DataSource dataSource;

	@Autowired
	private LocalContainerEntityManagerFactoryBean entityManagerFactory;

}
```

En la próxima lección vamos a ver el código de la clase DAO de las distintas entidades que vamos a manejar en particular una y del controlador para finalizar este proyecto de primer ejemplo con Spring JPA Hibernet.

# 07 Primer proyecto con Spring boot, Spring MVC e Hibernate (parte II) 16:34 

## Resumen Profesor

Continuación de la creación de un primer proyecto con Spring Boot, Spring MVC e Hibernate

## Preguntas

P= Buenos días,
trabajo con IDEA y me da este error en el dataconfig:
Couldn't autowired,there is more than one bean of DataSource type

He comentado el la linea que tiene el @Autowired y funciona igualmente.
Lo que no me hace la aplicación es crear si o si la tabla cuando inicio la aplicación.
También me daba un fallo a la hora de iniciar la aplicacion como que no encontraba el hibernate.properties y lo cree por si fuera eso, pero sigue sin hacerlo...
Alguna propuesta?
Gracias,
Un saludo

R= Creo que puede ser porque no tengo persistence.xml....voy a ver.
R= Hola! Yo siempre he trabajado con Eclipse; de Jetbrains solo he utilizado Android Studio y PyCharm.

En principio, con la configuración tipo Javaconfig realizada a través del fichero DatabaseConfig.javadebe construir el contexto de persistencia (los beans van encadenados uno sobre otro en la definición). En ocasiones, no es capaz de inyectar el bean Datasource porque existe algún problema de conectividad con la base de datos, algún pequeño fallo en los datos de configuración. Sería bueno que le echaras un vistazo a la traza de la pila, por si más abajo del error identifica alguna causa.

P= Soy nuevo en Java ,
He creado el ejemplo paso a paso y sin problemas, pero al " Run as" el proyecto spring, se despliega el server en el puerto 9002 y coloco :
http://localhost:9002/create?name=Pepe&message=Hola%20mundo

pero me aparece el siguiente error:
"
Error creando el usuario: org.springframework.dao.InvalidDataAccessApiUsageException: Unknown entity: com.openwebinars.hibernate.spring.User; nested exception is java.lang.IllegalArgumentException: Unknown entity: com.openwebinars.hibernate.spring.User
"

Es como no reconoce el entity.
¿Alguna idea para que reconosca la entidad?

R= Por si es el mismo error que me daba a mi ... revisa la línea "entitymanager.packagesToScan:" en el fichero application.properties.
Tiene que tener la ruta de paquetes donde estén las entidades, si lo has hecho igual que Luis Miguel sería ... com.openwebinars.hibernate.primerejemplospringjpahibernate

R= Efectivamente, no se está detectando a dicha clase como una entidad. ¿Podrías postear la estructura de paquetes y clases que tienes y el contenido del fichero application.properties?

P= Parece que no puede inicializar la conexión de la base de datos.

Caused by: com.mysql.cj.exceptions.InvalidConnectionAttributeException: The server time zone value 'Hora estándar romance' is unrecognized or represents more than one time zone. You must configure either the server or JDBC driver (via the serverTimezone configuration property) to use a more specifc time zone value if you want to utilize time zone support.
He aplicado una solución que he encontrado por ahí que añade más parámetros a la url:

jdbc:mysql://localhost/hibernate?useUnicode\=true&useJDBCCompliantTimezoneShift\=true&useLegacyDatetimeCode\=false&serverTimezone\=UTC
Y con esto consigo que funcione pero quisiera tu opinión. Gracias.

R= ¿Qué versión del driver de jdbc estás utilizando?
R= `....m2\repository\org\springframework\spring-jdbc\5.1.2.RELEASE\spring-jdbc-5.1.2.RELEASE.jar`

P= Estoy teniendo los mismos errores en todos los ejercicios de éste bloque.
Lo he solventado modificando en las distintas properties el siguiente código:

```sh
db.url: jdbc:mysql://localhost/hibernate?serverTimezone=UTC
(lo adicional es "?serverTimezone=UTC")
```
R= ¿Qué versión de Mysql estás utilizando?
R= Efectivamente, es la versión 8:
```sh
Server version: 8.0.15 MySQL Community Server - GPL
Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.
```
R= Como decía en alguno de los mensajes anteriores, el curso se elaboró con Mysql 5.7, y de ahí algunas de las diferencias en las cadenas de conexión. Gracias por tu aportación.

P= mi repositorio del proyecto en github: https://github.com/jlrc23/openwebinars-hibernate
Hola, explicas muy bien, tengo un problema al intentar conectarme a la base de datos, es el siguiente:

```
org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'databaseConfig': Unsatisfied dependency expressed through field 'entityManagerFactory'; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'entityManagerFactory' defined in class path resource [com/gvm/reportes/DatabaseConfig.class]: Invocation of init method failed; nested exception is java.lang.IllegalArgumentException: Class name must not be null
```
R=Ya vi que fue lo diferente, yo estaba usando la version spring la 2.1.0 y en el ejemplo usan la 1.5.2, ¿como se debe de hacer en la version 2.1.0?
R=Entonces, ¿has conseguido solucionar tu problema? No sé si he entendido si lo has conseguido o no.
R=Sí ya lo solucione

P=¿Cuál es la ventaja de poner un DAO como Repository?... Mencionas que utilizamos @Repository para el DAO para identificarlo, además de hacerlo por convención hay algún beneficio de utilizar esta anotación en lugar de por ejemplo Bean o Component?
R= Sin llegar a profundizar mucho en la explicación, las diferencias no son muy grandes, ni tan obvias con otros estereotipos, como por ejemplo @Controller. Alguna de las ventajas podría ser el simple hecho de tener identificadas estas clases como un tipo concreto de estereotipo.

Si profundizamos algo más, según la documentación de dicha anotación, una ventaja concreta del uso de la misma sería que dicha clase sería candidata a ser elegida como traductora de las excepciones de tipo DataAccessException. Aunque como bien sigue diciendo a continuación, la misión principal es la de definir un componente que tiene un rol específico dentro de la arquitectura de la aplicación.

P=Buenos días, por si a alguien le occurre. Estoy ejecutando este ejemplo contra una base de datos que ya tengo en SQL Server.
Me daba este error al crear la tabla: Sintaxis incorrecta cerca de la palabra clave 'User'.
Pensaba que era un problema de dialecto que no estaba poniendo el correcto hasta que encontré que es porque User es palabra reservada. He cambiado la clase java User por UsuarioPrueba y todo me ha ido bien.
R=Gracias por compartirlo Ana Isabel.

## Transcripción

Vamos a continuar con el ejemplo anterior de Spring Boot, Spring MVC, JPA y Hibernate configurando el fichero de properties. Si en el fichero `DatabaseConfig` indicabamos que íbamos a usar unsa seríe de properties tenemos que darle valor a esas propiedades, en el fichero de properties que tenemos dentro de la ruta `source/main/resource` podemos definir todas esas propiedades.

Primero vamos a definir sobre la conexión a la base de datos, el driver, la url, nombre de usuario y contraseña.

Nos quedan ahora algunas propiedades como la de busqueda de entidades, damos la ruta dónde vamos a incluir la entidad.

Y las propiedades propias de Hibernate cómo eran el dialecto, que nos muestre el SQL por pantalla y que cree la base de datos automaticamente.

*`application.properties`*

```sh
# Base de datos
db.driver: com.mysql.jdbc.Driver
db.url: jdbc:mysql://localhost/hibernate
db.username: openwebinars
db.password: 12345678

# Busqueda de entidades
entitymanager.packagesToScan: com.openwebinars.hibernate.spring

# Hibernate
hibernate.dialect: org.hibernate.dialect.MySQL5InnoDBDialect
hibernate.show_sql: true
hibernate.hbm2ddl.auto: create
```

Muy bien ya lo tenemos configurado.

<img src="images/7-02.png">

Ahora siguiendo los pasos de nuestro tutorial, tendríamos que crear la clase Entidad y la clase DAO.

<img src="images/7-01.png">

La clase DAO seguira el patron DAO, para aquellos que ya hayas hecho el curso de Spring les sonara. El patrón DAO no es más que un patrón de diseño en el que organizamos el acceso a datos mediante una clase que nos van a devolver objetos de nuestro modelo en lugar de acceder directamente al origen de los datos, eso nos permite el trabajar con diferentes bases de datos, diferentes sistemas de persistencia sin que nos tengamos que preocupar de cuál cogemos en particular y también nos ofrece una interfaz común con ese almacén de datos.

<img src="images/7-03.png">

Vamos a encargarnos de crear esa clase entidad y la clase DAO que servirá para manejarla. En la clase DAO no olvidar anotarla con la anotación de `@Repository` eso nos permitirá indicar que se trata de un bean de acceso a datos y además con `@Transaccional`, eso va a indicar que dentro de cada uno de los métodos cuando lo llamemos, justo antes de empezar la llamada al método se comenzara una transacción y justo al terminar el código del método esa transacción será commitear sin que nosotros tenemos que encargarnos de hacerlo como en los proyectos anteriores. También tenemos que inyectar el contexto de persistencia y tendremos que implementar los diferentes métodos necesarios.


Vamos a crear la clase `User` al igual que antes la podemos copiar.

```java
package com.openwebinars.hibernate.spring;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private int id;

	@Column
	private String userName;

	@Column
	private String userMessage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMessage() {
		return userMessage;
	}

	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}

}
```

Creamos una nueva clase que vamos a llamar `UserDao` y como decíamos antes esta clase tendremos que anotarla como un bean estereotipado como repositorio, que además va a ejecutarse dentro de un marco transaccional
```java
@Repository
@Transactional
public class UserDao {

}
```

Los diferentes métodos que tendrá este bean son los lógicos de una clase que va a acceder a los datos, nos permitirá crear una nueva instancia, actualizar una existente, borrar una existente, obtener todas las que hay de un determinado tipo, de tipo `User` y obtener una en particular en base a a Id.

Lo primero que tenemos que hacer es obtener un EntityManager y eso lo vamos a hacer a través de una anotación `@PersistenceContext` esta anotación no es de Spring sino que esta definida en el standar Java y lo que va a hacer es buscar una factoria de EntityManager construir un EntityManager en particular e inyectarlo dentro de la variable que vamos a definir.

```java
// A través de la anotación @PersistenceContext, se inyectará automáticamente
// un EntityManager producido desde el entityManagerFactory definido en la clase
// DatabaseConfig.
	
@PersistenceContext
private EntityManager entityManager;
```

Ya tenemos nuestro EntityManager para poder usarlo a lo largo de los diferentes métodos.

Vamos a crear los distintos métodos CRUD que podríamos llamar.

El método `create(User user)` lo que hará es persistirlo, no tenemos que preocuparnos de la gestión de transacciones.

```java
/**
* Almacena el usuario en la base de datos
*/
public void create(User user) {
   entityManager.persist(user);
   return;
}
```

Vamos a eliminar un usuario, vamos a comprobar si el usuario esta contenido antes de eliminarlo, mediante el método `contains`. Si no lo contiene lo elimina pero antes hace una operación `merge` ya hablaremos de ella con más detenimiento.

```java
/**
* Elimina el usuario de la base de datos
*/
public void delete(User user) {
   if (entityManager.contains(user))
      entityManager.remove(user);
   else
      entityManager.remove(entityManager.merge(user));
   return;
}
```

Nos quedaría la actualización.

```java
/**
* Actualiza el usuario proporcionado
*/
public void update(User user) {
   entityManager.merge(user);
   return;
}
```

Y por último los dos `getById()` que no va a devolver un usuario en base a su Id, usaremos el método de `entityManager` ya hablaremos sobre consulta, el método `find(...)` que nos va a devolver una instancia, recibe el tipo de dato y el valor id, un método muy sencillo de utilizar.

```java
/**
* Devuelve un usuario en base a su Id
*/
public User getById(int id) {
   return entityManager.find(User.class, 1);
}
```

Y el método que nos va a devolver todos devolverá una lista de usuarios, podemos llamarlo `getAll()` no necesita recibir ningún argumento usaremos una consulta de las que crearemos en los siguientes capítulos. Le hemos añadido el `@SuppressWarnings` del cual también hablaremos más adelante.  

```java
/**
* Devuelve todos los usuarios de la base de datos.
*/
@SuppressWarnings("unchecked")
public List<User> getAll() {
   return entityManager.createQuery("select u from User").getResultList();
}
```

Ya tendiamos nuestra clase DAO echa.

*`UserDao.java`*

```java
package com.openwebinars.hibernate.primerejemplospringjpahibernate;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

/**
 * 
 * Esta es la clase que usaremos para acceder a los datos de las entidades User.
 * Al estar anotada con el estereotipo @Repository, será localizada rapidamente,
 * y usada para tal fin.
 * 
 * Al tener definido un motor de transacciones en DatabaseConfig, toda clase
 * anotada con @Transactional provocará que se invoquen los método begin()
 * y commit() de forma "mágica" en el inicio y el fin del método.
 * 
 * 
 */
@Repository
@Transactional
public class UserDao {
	
	// A través de la anotación @PersistenceContext, se inyectará automáticamente
	// un EntityManager producido desde el entityManagerFactory definido en la clase
	// DatabaseConfig.
	
	@PersistenceContext
	private EntityManager entityManager;


	/**
	 * Almacena el usuario en la base de datos
	 */
	public void create(User user) {
		entityManager.persist(user);
		return;
	}

	/**
	 * Elimina el usuario de la base de datos.
	 */
	public void delete(User user) {
		if (entityManager.contains(user))
			entityManager.remove(user);
		else
			entityManager.remove(entityManager.merge(user));
		return;
	}

	/**
	 * Devuelve todos los usuarios de la base de datos.
	 */
	@SuppressWarnings("unchecked")
	public List<User> getAll() {
		return entityManager.createQuery("from User").getResultList();
	}

	/**
	 * Devuelve un usuario en base a su Id
	 */
	public User getById(int id) {
		return entityManager.find(User.class, id);
	}

	/**
	 * Actualiza el usuario proporcionado
	 */
	public void update(User user) {
		entityManager.merge(user);
		return;
	}
	
}
```

<img src="images/7-04.png">

Nos faltaría crear un controlador, dentro del controlador vamos a inyectar mediante `@Autowired` nuestro DAO para poder utilizarlo y en el controlador vamos a definir los métodos necesarios para manejar peticiones a la URL create, update, delete, etc.

En nuestro proyecto crearíamos una nueva clase que la vamos a llamar `UserController` la vamos a anotar con `@Controller`.

```java
@Controller
public class UserController {

}
```

Auto-cableamos el `UserDao` para tenerlo listo para utilizarlo.

```java
// Inyectamos el DAO dentro del Controller
@Autowired
private UserDao userDao;
```

Vamos a crear un bean a partir del nombre y el mensaje, le añadimos las anotaciones `@RequestMapping(value = "/create")` o incluso si queremos la anotación getmapping.

```java
@RequestMapping(value = "/create")
@ResponseBody
public String create(String name, String message) {

}
```

Bueno no hemos declarado todavía un mecanismo automático de creación de Ids, podemos inventar uno sobre la marcha, para que lo haga de manera aleatoria y nos valga para el ejemplo y no tener que pasarle el Id como argumento, creamos un usuario, podemos crear un número aleatorio, asignamos los datos, asignamos el nombre y el mensaje, nos quedaría llamar al DAO para poder crear al usuario y devolver algún tipo de mensaje con respecto a la creación del usuario.

```java
@RequestMapping(value = "/create")
public String create(String name, String message) {

   User user = new User();

   Random r = new Random();
   int randomId = r.nextInt(Integer.MAX_VALUE);
   // Asignamos los datos
   user.setId(randomId);
   user.setUserName(name);
   user.setUserMessage(message);
   userDao.create(user);
   
   return "Usuario creado correctamente";
}
```

Para que podemos visualizar directamente este mensaje y no nos perdamos ahora en gestión del sistema de vistas, le vamos a añadir la anotación `@ResponseBody` que hara que lo que se devuelva como parte del método será el cuerpo de la respuesta y por lo tanto será el mensaje que nosotros podremos visualizar. Hay que tener en cuenta que esta creación puede dar alguna exepción aun que nosotros lo la hayamos capturado aquí, lo podríamos meter todo dentro de un bloque try catch de manera que quedara un poco más armado.

```java
/**
* 
* Crea un nuevo usuario con un Id autogenerado, y con los datos recibidos
* por la URL 
* 
* /create?name=...&message=....
* 
*/
@RequestMapping(value = "/create")
@ResponseBody
public String create(String name, String message) {
   try {
      User user = new User();
      // Estas líneas de código generan un Id aleatorio.
      // En las próximas lecciones veremos como delegar esto en la base de
      // datos
      Random r = new Random();
      int randomId = r.nextInt(Integer.MAX_VALUE);
      // Asignamos los datos
      user.setId(randomId);
      user.setUserName(name);
      user.setUserMessage(message);

      userDao.create(user);
   } catch (Exception ex) {
      return "Error creando el usuario: " + ex.toString();
   }
   return "Usuario creado correctamente";
}
```

Las diferentes llamadas serían de una forma parecida. El método `delete(int id)` quedará así:

```java
/**
* 
* Elimina un usuario, localizándolo por su Id
* 
* /delete?id=...
* 
*/
@RequestMapping(value = "/delete")
@ResponseBody
public String delete(int id) {
   try {
      User user = new User();
      user.setId(id);
      userDao.delete(user);
   } catch (Exception ex) {
      return "Error eliminando el usuario: " + ex.toString();
   }
   return "Usuario eliminado correctamente";
}
```

Crearíamos al usuario en base al Id y le pasariamos ese usuario al DAO.

Y para actualizarlo nos quedaría así:

```java
/**
* 
* Actualiza el nombre y el mensaje de un usuario, localizándolo por su Id
* 
* /update?id=...&name=...&message=....
* 
*/
@RequestMapping(value = "/update")
@ResponseBody
public String updateName(int id, String name, String message) {
   try {
      User user = userDao.getById(id);
      user.setUserName(name);
      user.setUserMessage(message);
      userDao.update(user);
   } catch (Exception ex) {
      return "Error actualizando el usuario: " + ex.toString();
   }
   return "Usuario actualizado correctamente";
}
```

La clase completa queda así:

```java
package com.openwebinars.hibernate.primerejemplospringjpahibernate;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {


	// Inyectamos el DAO dentro del Controller
	@Autowired
	private UserDao userDao;

	/**
	 * 
	 * Crea un nuevo usuario con un Id autogenerado, y con los datos recibidos
	 * por la URL 
	 * 
	 * /create?name=...&message=....
	 * 
	 */
	@RequestMapping(value = "/create")
	@ResponseBody
	public String create(String name, String message) {
		try {
			User user = new User();
			// Estas líneas de código generan un Id aleatorio.
			// En las próximas lecciones veremos como delegar esto en la base de
			// datos
			Random r = new Random();
			int randomId = r.nextInt(Integer.MAX_VALUE);
			// Asignamos los datos
			user.setId(randomId);
			user.setUserName(name);
			user.setUserMessage(message);

			userDao.create(user);
		} catch (Exception ex) {
			return "Error creando el usuario: " + ex.toString();
		}
		return "Usuario creado correctamente";
	}

	/**
	 * 
	 * Elimina un usuario, localizándolo por su Id
	 * 
	 * /delete?id=...
	 * 
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public String delete(int id) {
		try {
			User user = new User();
			user.setId(id);
			userDao.delete(user);
		} catch (Exception ex) {
			return "Error eliminando el usuario: " + ex.toString();
		}
		return "Usuario eliminado correctamente";
	}

	/**
	 * 
	 * Actualiza el nombre y el mensaje de un usuario, localizándolo por su Id
	 * 
	 * /update?id=...&name=...&message=....
	 * 
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public String updateName(int id, String name, String message) {
		try {
			User user = userDao.getById(id);
			user.setUserName(name);
			user.setUserMessage(message);
			userDao.update(user);
		} catch (Exception ex) {
			return "Error actualizando el usuario: " + ex.toString();
		}
		return "Usuario actualizado correctamente";
	}

}
```

Ya tendríamos nuestro Controlador echo, ahora tendríamos que invocar a las siguientes URLs

<img src="images/7-04.png">

```java
/create?name=...&message=...
/delete?id=...
/update?id=...&name=...&message=...
```

Para poder crear un nuevo usuario, lo podemos comprobar.

Vamos a añadir una nueva propiedad a nuestro fichero de properties para que no nos choque con ningún otro servidor que es

`server.port: 9002`

Y ya podriamos ejecutar nuestro proyecto como una Spring Boot App.


<img src="images/7-05.png">

<img src="images/7-06.png">

<img src="images/7-07.png">

<img src="images/7-08.png">

<img src="images/7-09.png">

<img src="images/7-10.png">

<img src="images/7-11.png">

<img src="images/7-12.png">

<img src="images/7-13.png">

<img src="images/7-14.png">

<img src="images/7-16.png">

### :computer: Código Completo - 130-03-PrimerProyectoSpringHibernateJPA

<img src="images/7-15.png">

*`pom.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.3.0.RELEASE</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.openwebinars.hibernate</groupId>
	<artifactId>PrimerProyectoSpringHibernateJPA</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>PrimerProyectoSpringHibernateJPA</name>
	<description>Práctica controladores</description>

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
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<scope>runtime</scope>
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

*`application.properties`*

```properties
# Base de datos
db.driver: com.mysql.jdbc.Driver
db.url: jdbc:mysql://localhost/hibernate
db.username: openwebinars
db.password: 12345678

# Busqueda de entidades
entitymanager.packagesToScan: com.openwebinars.hibernate.spring

# Hibernate
hibernate.dialect: org.hibernate.dialect.MySQL5InnoDBDialect
hibernate.show_sql: true
hibernate.hbm2ddl.auto: create

server.port: 9002
```


*`DatabaseConfig`*

```java
package com.openwebinars.hibernate.spring;

import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

	/**
	 * Definición del DataSource para la conexión a nuestra base de datos. 
	 * Las propiedades son establecidas desde el fichero de properties, y 
	 * asignadas usando el objeto env.
	 * 
	 */
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("db.driver"));
		dataSource.setUrl(env.getProperty("db.url"));
		dataSource.setUsername(env.getProperty("db.username"));
		dataSource.setPassword(env.getProperty("db.password"));
		return dataSource;
	}

	/**
	 *
	 * Declaración del EntityManagerFactory de JPA
	 */
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
		
		//Le asignamos el dataSource que acabamos de definir.
		entityManagerFactory.setDataSource(dataSource);

		// Le indicamos la ruta donde tiene que buscar las clases anotadas
		entityManagerFactory.setPackagesToScan(env.getProperty("entitymanager.packagesToScan"));

		// Implementación de JPA a usar: Hibernate
		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		entityManagerFactory.setJpaVendorAdapter(vendorAdapter);

		// Propiedades de Hiberante
		Properties additionalProperties = new Properties();
		additionalProperties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
		additionalProperties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		additionalProperties.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
		entityManagerFactory.setJpaProperties(additionalProperties);

		return entityManagerFactory;
	}

	/**
	 * Inicializa y declara el gestor de transacciones
	 */
	@Bean
	public JpaTransactionManager transactionManager() {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory.getObject());
		return transactionManager;
	}

	/**
	 *  
	 * Este bean es un postprocessor que ayuda a relanzar las excepciones específicas
	 * de cada plataforma en aquellas clases anotadas con @Repository
	 * 
	 */
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}

	@Autowired
	private Environment env;

	@Autowired
	private DataSource dataSource;

	@Autowired
	private LocalContainerEntityManagerFactoryBean entityManagerFactory;

}

```

*`User`*

```java
package com.openwebinars.hibernate.spring;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private int id;

	@Column
	private String userName;

	@Column
	private String userMessage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMessage() {
		return userMessage;
	}

	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}

}
```

*`UserDao`*

```java
package com.openwebinars.hibernate.spring;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

/**
 * 
 * Esta es la clase que usaremos para acceder a los datos de las entidades User.
 * Al estar anotada con el estereotipo @Repository, será localizada rapidamente,
 * y usada para tal fin.
 * 
 * Al tener definido un motor de transacciones en DatabaseConfig, toda clase
 * anotada con @Transactional provocará que se invoquen los método begin()
 * y commit() de forma "mágica" en el inicio y el fin del método.
 * 
 * 
 */
@Repository
@Transactional
public class UserDao {
	
	// A través de la anotación @PersistenceContext, se inyectará automáticamente
	// un EntityManager producido desde el entityManagerFactory definido en la clase
	// DatabaseConfig.
	
	@PersistenceContext
	private EntityManager entityManager;


	/**
	 * Almacena el usuario en la base de datos
	 */
	public void create(User user) {
		entityManager.persist(user);
		return;
	}

	/**
	 * Elimina el usuario de la base de datos.
	 */
	public void delete(User user) {
		if (entityManager.contains(user))
			entityManager.remove(user);
		else
			entityManager.remove(entityManager.merge(user));
		return;
	}

	/**
	 * Devuelve todos los usuarios de la base de datos.
	 */
	@SuppressWarnings("unchecked")
	public List<User> getAll() {
		return entityManager.createQuery("from User").getResultList();
	}

	/**
	 * Devuelve un usuario en base a su Id
	 */
	public User getById(int id) {
		return entityManager.find(User.class, id);
	}

	/**
	 * Actualiza el usuario proporcionado
	 */
	public void update(User user) {
		entityManager.merge(user);
		return;
	}

	

}
```

*`UserController`*

```java
package com.openwebinars.hibernate.spring;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {


	// Inyectamos el DAO dentro del Controller
	@Autowired
	private UserDao userDao;

	/**
	 * 
	 * Crea un nuevo usuario con un Id autogenerado, y con los datos recibidos
	 * por la URL 
	 * 
	 * /create?name=...&message=....
	 * 
	 */
	@RequestMapping(value = "/create")
	@ResponseBody
	public String create(String name, String message) {
		try {
			User user = new User();
			// Estas líneas de código generan un Id aleatorio.
			// En las próximas lecciones veremos como delegar esto en la base de
			// datos
			Random r = new Random();
			int randomId = r.nextInt(Integer.MAX_VALUE);
			// Asignamos los datos
			user.setId(randomId);
			user.setUserName(name);
			user.setUserMessage(message);

			userDao.create(user);
		} catch (Exception ex) {
			return "Error creando el usuario: " + ex.toString();
		}
		return "Usuario creado correctamente";
	}

	/**
	 * 
	 * Elimina un usuario, localizándolo por su Id
	 * 
	 * /delete?id=...
	 * 
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public String delete(int id) {
		try {
			User user = new User();
			user.setId(id);
			userDao.delete(user);
		} catch (Exception ex) {
			return "Error eliminando el usuario: " + ex.toString();
		}
		return "Usuario eliminado correctamente";
	}

	/**
	 * 
	 * Actualiza el nombre y el mensaje de un usuario, localizándolo por su Id
	 * 
	 * /update?id=...&name=...&message=....
	 * 
	 */
	@RequestMapping(value = "/update")
	@ResponseBody
	public String updateName(int id, String name, String message) {
		try {
			User user = userDao.getById(id);
			user.setUserName(name);
			user.setUserMessage(message);
			userDao.update(user);
		} catch (Exception ex) {
			return "Error actualizando el usuario: " + ex.toString();
		}
		return "Usuario actualizado correctamente";
	}

}
```

## Contenido adicional 3   

[Primer proyecto](pdfs/03_Primer_proyecto.pdf)

[Primer proyecto con Hibernate con JPA](pdfs/04_Primer_proyecto_JPA.pdf)

[Primer proyecto con Spring boot, Spring MVC e Hibernate](pdfs/05_Primer_proyecto_Spring_JPA_e_Hibernate.pdf)
