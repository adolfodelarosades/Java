# 2. Primeros proyectos 81m
   * Primer proyecto 34:30 
   * Primer proyecto con Hibernate con JPA 13:58 
   * Primer proyecto con Spring boot, Spring MVC e Hibernate (parte I) 16:25 
   * Primer proyecto con Spring boot, Spring MVC e Hibernate (parte II) 16:34 
   * Contenido adicional 3
   
## Primer proyecto 34:30 

[Primer proyecto](pdfs/03_Primer_proyecto.pdf)

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

<img src="images/1-path-2.jpg">

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

## Primer proyecto con Hibernate con JPA 13:58 

[Primer proyecto con Hibernate con JPA](pdfs/04_Primer_proyecto_JPA.pdf)

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

## Primer proyecto con Spring boot, Spring MVC e Hibernate (parte I) 16:25 

[Primer proyecto con Spring boot, Spring MVC e Hibernate](pdfs/05_Primer_proyecto_Spring_JPA_e_Hibernate.pdf)

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

## Primer proyecto con Spring boot, Spring MVC e Hibernate (parte II) 16:34 

Continuación de la creación de un primer proyecto con Spring boot, Spring MVC e Hibernate

## Contenido adicional 3   

[Primer proyecto](pdfs/03_Primer_proyecto.pdf)

[Primer proyecto con Hibernate con JPA](pdfs/04_Primer_proyecto_JPA.pdf)

[Primer proyecto con Spring boot, Spring MVC e Hibernate](pdfs/05_Primer_proyecto_Spring_JPA_e_Hibernate.pdf)
