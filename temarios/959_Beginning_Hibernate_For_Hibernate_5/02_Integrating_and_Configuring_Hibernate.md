# Chapter 2: Integrating and Configuring Hibernate

* The Steps Needed to Integrate and Configure Hibernate
* Understanding Where Hibernate Fits into Your Java Application
* Deploying Hibernate
* Installing Maven
* Connection Pooling
* Summary

Integrar Hibernate en una aplicación Java es fácil. Los diseñadores de Hibernate evitaron algunas de las trampas y problemas más comunes con las soluciones de persistencia de Java existentes y crearon una arquitectura limpia pero poderosa. En la práctica, esto significa que no tiene que ejecutar Hibernate dentro de ningún contenedor o marco Java EE en particular. A partir de Hibernate 5.2, se requiere Java 8 o posterior, gracias a la integración de la API de fecha y hora y otras características útiles.<sup>1</sup>

Al principio, agregar Hibernate a su proyecto Java parece intimidante: la distribución incluye un gran conjunto de bibliotecas. Para que su primera aplicación de Hibernate funcione, debe configurar las referencias de la base de datos y la configuración de Hibernate, lo que podría incluir la asignación de sus objetos a la base de datos. También debe crear sus POJO, incluido cualquier mapeo basado en anotaciones. ¡Después de haber hecho todo eso, necesita escribir la lógica en su aplicación que usa Hibernate para lograr algo! Pero una vez que aprenda cómo integrar Hibernate con su aplicación, los conceptos básicos se aplican a cualquier proyecto que use Hibernate.

Una de las características clave del diseño de Hibernate es el principio de mínima intrusión: los desarrolladores de Hibernate no querían que Hibernate se entrometiera en su aplicación más de lo necesario. Esto condujo a varias de las decisiones arquitectónicas que se tomaron para Hibernate. En el Capítulo 1, vio cómo se puede aplicar Hibernate para resolver problemas de persistencia utilizando objetos Java convencionales. En este capítulo, explicamos algunos de los detalles de configuración necesarios para soportar este comportamiento.

## The Steps Needed to Integrate and Configure Hibernate

Este capítulo explica la configuración y la integración en detalle, pero para obtener una descripción general rápida, consulte la siguiente lista para determinar qué debe hacer para poner en funcionamiento su primera aplicación Hibernate. Luego, el Capítulo 3 lo guiará a través de la construcción de un par de pequeñas aplicaciones de ejemplo que usan Hibernate. El primero de estos ejemplos es tan simple como podríamos hacerlo, por lo que es una excelente introducción a los siguientes pasos necesarios:

1. Identifique los POJO que tienen una representación de base de datos.
2. Identifique qué propiedades de esos POJO deben conservarse.
3. Anote cada uno de los POJO para mapear las propiedades de su objeto Java a columnas en una tabla de base de datos (tratado con más detalle en el Capítulo 6).
4. Cree el esquema de la base de datos con la herramienta de exportación de esquemas, use una base de datos existente o cree su propio esquema de base de datos.
5. Agregue las bibliotecas Java de Hibernate a la ruta de clases de su aplicación (que se tratan en este capítulo).
6. Cree un archivo de configuración XML de Hibernate que apunte a su base de datos y sus clases asignadas (cubierto en este capítulo).
7. En su aplicación Java, cree un objeto **`Configuration`** de Hibernate que haga referencia a su archivo de configuración XML (cubierto en este capítulo).
8. También en su aplicación Java, construya un objeto Hibernate **`SessionFactory`** desde el objeto **`Configuration`** (cubierto en este capítulo).
9. Recupere los objetos de sesión de Hibernate de SessionFactory y escriba su lógica de acceso a datos para su aplicación (crear, recuperar, actualizar y eliminar).

No se preocupe si no comprende todos los términos o conceptos mencionados en esta lista. Después de leer este capítulo y luego seguir el ejemplo en el próximo capítulo, sabrá qué significan estos términos y cómo encajan entre sí.

## Understanding Where Hibernate Fits into Your Java Application

Puede llamar a Hibernate directamente desde su aplicación Java o puede acceder a Hibernate a través de otro framework. Puede llamar a Hibernate desde una aplicación Swing, un servlet, un portlet, una página JSP o cualquier otra aplicación Java que tenga acceso a una base de datos. Por lo general, usaría Hibernate para crear una capa de acceso a datos para una aplicación o reemplazar una capa de acceso a datos existente.

Hibernate es compatible con los estándares de lenguaje Java de Java Management Extensions (JMX), J2EE Connector Architecture (JCA) y Java Naming and Directory Interface (JNDI). Usando JMX, puede configurar Hibernate mientras se está ejecutando. Hibernate se puede implementar como un conector JCA y puede usar JNDI para obtener una fábrica de sesiones de Hibernate en su aplicación. Además, Hibernate utiliza el  estándar de Java Database Connectivity (JDBC) para acceder a la base de datos relacional con database drivers. Hibernate no reemplaza a JDBC como una capa de conectividad de base de datos; Hibernate se encuentra en un nivel por encima de JDBC.

Además de las API estándar de Java, muchos frameworks de aplicación y web de Java ahora se integran con Hibernate. La API simple y limpia de Hibernate facilita que estos frameworks admitan Hibernate de una forma u otra. Spring Framework proporciona una excelente integración con Hibernate, que incluye soporte genérico para objetos de persistencia, un conjunto genérico de excepciones de persistencia y gestión de transacciones. El Apéndice C explica cómo se puede configurar Hibernate dentro de una aplicación Spring.

Independientemente del entorno en el que integre Hibernate, ciertos requisitos permanecen constantes. Deberá definir los detalles de configuración que se aplican; luego se representan mediante un objeto **`ServiceRegistry`**. A partir del objeto **`ServiceRegistry`** se crea un objeto **`SessionFactory`**; y a partir de esto, se crean instancias de objetos de sesión, a través de los cuales su aplicación accede a la representación de Hibernate de la base de datos. 

## Deploying Hibernate

Hay dos conjuntos de componentes necesarios para la integración de Hibernate en su aplicación: un database driver y las propias libraries de Hibernate.

El código de ejemplo de este libro utiliza H2 como una pequeña embeddable database<sup>2</sup>; esto se puede encontrar en http://h2database.com/. Esto no indica que otras bases de datos sean de menor valor que H2, sino que es simplemente una opción conveniente; HSQLDB, una especie de proyecto hermano de H2, también es factible, al igual que Derby; si tiene a mano un servidor de datos MySQL o PostgreSQL, también funcionan, pero una base de datos integrada significa que no tiene que tener un proceso externo ejecutándose, ni tiene que configurar una base de datos especial o una cuenta de usuario.<sup>3</sup>

Si está usando la descarga binaria de Hibernate (desde un "paquete de lanzamiento", a través de http://www.hibernate.org/downloads), todos los archivos jar contenidos en el directorio **`lib/required`** son obligatorios para usar Hibernate.

Quizás una forma más fácil de integrar Hibernate es mediante el uso de una herramienta de compilación, como Gradle ( http://www.gradle.org/ , utilizada por el propio proyecto Hibernate), SBT ( http://www.scala-sbt. org/ ), o Maven ( http://maven.apache.org/ ), esta última posiblemente la más popular de las herramientas de compilación, si no la mejor.<sup>4</sup>

Todas estas herramientas de compilación pueden agrupar dependencias en un artefacto entregable. También pueden incluir dependencias de forma transitiva, lo que significa que los proyectos que dependen de un subproyecto determinado también heredan las dependencias de ese subproyecto.

Apuntaremos a Maven como entorno de construcción para el resto del libro; los usuarios de otras herramientas de compilación generalmente pueden migrar desde Maven con bastante facilidad.<sup>5</sup>

### Instalación de Maven

Hay muchas formas de instalar Maven. Esta es una descripción general rápida; diferentes sistemas operativos (y diferentes configuraciones del sistema) pueden afectar el procedimiento de instalación, por lo que cuando tenga dudas, puede consultar http://maven.apache.org/download.cgi#Installation para obtener la documentación real.

Sin embargo, para ahorrarle algo de tiempo, puede descargar Maven desde http://maven.apache.org/download.cgi/ ; debe obtener la versión más reciente. Los usuarios de UNIX (incluidos los usuarios de Linux y MacOS) deben descargar el archivo que termina en **`tar.gz`**; Los usuarios de Windows deben descargar el archivo **`zip`**.

En UNIX, descomprima el archivo en un directorio de su elección; un ejemplo del comando que podría ejecutarse es este:

```sh
mkdir ∼/tools || cd ∼/tools; tar xf apache-maven-3.3.9-bin.tar.gz
```

Esto creará **`∼/tools/apache-maven-3.3.9/`**, y el ejecutable mvn estará en **`∼/tools/apache-maven-3.3.9/bin`**; agregue esto a su ruta de comando.

Para Windows, abra el archivo y extráigalo en una ubicación conocida (por ejemplo, **`C:\herramientas\`**). Agregue la ubicación de **`mvn.bat`** (en este ejemplo, **`C:\tools\apache-maven-3.3.9\bin`**) a su ruta a través del cuadro de diálogo Propiedades del sistema, y debería poder ejecutar Maven con "**`mvn`**" en el símbolo del sistema

Maven usa un modelo de objeto de proyecto, típicamente escrito en XML, llamado “**`pom.xml`**”. Este archivo describe el nombre y las versiones del proyecto y las configuraciones de las compilaciones (si las hay), así como los subproyectos y las dependencias del proyecto. Cuando se ejecuta Maven, descargará automáticamente cualquier recurso que necesite para completar la compilación según lo especificado, y luego compilará el código fuente del proyecto; si el proyecto incluye pruebas, ejecutará las pruebas y completará la compilación si (y solo si) no se producen fallas en las pruebas.

Este libro utiliza un proyecto principal que contiene dependencias globales para el libro y subproyectos correspondientes a los capítulos; gran parte del código operativo está escrito como un conjunto de pruebas en los subproyectos. El Capítulo 1, por ejemplo, usó dos métodos para escribir y leer datos de una base de datos; esas pruebas se escribieron como clases de prueba **TestNG**<sup>6</sup>: **`chapter01.hibernate.PersistenceTest`** y **`chapter01.jdbc.PersistenceTest`**.

El archivo de configuración del proyecto principal, después de escribir el Capítulo 1, se parecía al Listado 2-1.

**Listado 2-1. Top-Level Project Object Model para Maven**

```java
<?xml version="1.0"?>
<project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd"
         xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.autumncode.books.hibernate</groupId>
    <artifactId>hibernate-parent</artifactId>
    <packaging>pom</packaging>
    <version>1.0-SNAPSHOT</version>
    <modules>
        <module>chapter01</module>
    </modules>
    <name>hibernate-parent</name>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.testng</groupId>
            <artifactId>testng</artifactId>
            <version>[6.9.10,)</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>[5.0.0,5.9.9]</version>
        </dependency>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <version>1.4.192</version>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>2.3.2</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                    <showDeprecation>true</showDeprecation>
                    <showWarnings>true</showWarnings>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```

Esto especifica una serie de cosas sobre el proyecto (como la versión de Java, que es la versión actual mantenida de Java <sup>7</sup>) e incluye tres dependencias: **Hibernate** en sí mismo; la base de datos **H2**; y **TestNG**, el último que se limita a la fase de prueba (como indica el nodo "**`scope`**").

Los proyectos secundarios —en este listado, este es solo el **`chapter01`**— recibirán esta configuración y su conjunto de dependencias automáticamente, lo que significa que no tenemos que repetirnos muy a menudo.

Para compilar y ejecutar este proyecto después de instalar Maven, simplemente tiene que ir al directorio que contiene **`pom.xml`** y ejecutar el "**`mvn package`**", que, como se indicó, descargará todas las dependencias requeridas, las compilará y luego probará el proyectos en orden.

Los proyectos de Maven tienen un diseño de carpeta específico, aunque es configurable; de forma predeterminada, el compilador de Java compila todo el código que se encuentra en **`src/main/java`**, y los archivos de clase resultantes se incluyen con **`src/main/resources`** en el artefacto de entrega. El directorio **`src/test/java`** contiene pruebas, que luego se compilan y ejecutan (con **`src/test/resources`** y el artefacto entregable en el classpath también).

Wow, esa es una gran cantidad de discusión que no es de Hibernate, y toda ella se puede encontrar (y subvertir) en los sitios web para cada entorno de construcción dado. En general, puedes (y debes) usar lo que quieras; este libro usa Maven por lo común que es, no porque sea la herramienta One True Build.

Veamos el código real que hemos estado ejecutando hasta ahora y expliquemos todo. Eso le dará una base para la discusión futura, incluso si no la va a usar mucho más allá de este capítulo.

Ya hemos mencionado el archivo **`pom.xml`** de nivel superior; vamos a comenzar en el directorio **`chapter02`** (que es un clon del directorio **`chapter01`**, excepto con "**`chapter02`**" en lugar de "**`chapter01`**"). Nuestro archivo de descripción del proyecto (nuestro **`pom.xml`**) es muy simple y especifica solo el proyecto principal y el nombre del proyecto actual (consulte el Listado 2-2).

**Listado 2-2. Modelo de objetos del proyecto del capítulo 2**

```java
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>hibernate-parent</artifactId>
        <groupId>com.autumncode.books.hibernate</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>chapter02</artifactId>
</project>
```

Nuestro **`Message.java`** se encuentra en **`src/main/java/chapter02/Message.java`**. Este es el mismo POJO que en el Listado 1-5, excepto que está en un paquete diferente (**`chapter02.hibernate`** en lugar de **`chapter01.hibernate`**). Como todo lo demás es igual, no lo enumeraremos aquí.

Nuestro código de ejecución actual está en el directorio **`src/test`** y consta de dos archivos relevantes:<sup>8</sup> **`src/test/java/chapter02/hibernate/PersistenceTest.java`** y **`src/test/resources/hibernate.cfg.xml`**.

Ya hemos visto los métodos de prueba de **`PersistenceTest.java`**, pero echemos un vistazo al Listado 2-3 completo para que comprenda todo lo que contiene.

**Listado 2-3. Un Set de Persistence Tests**

```java
package chapter02.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.Test;

import java.util.List;

import static org.testng.Assert.assertEquals;

public class PersistenceTest {
    SessionFactory factory;

    @BeforeSuite
    public void setup() {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        factory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();
    }

    @Test
    public void saveMessage() {
        Message message = new Message("Hello, world");
        try (Session session = factory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.persist(message);
            tx.commit();
        }
    }

    @Test(dependsOnMethods = "saveMessage")
    public void readMessage() {
        try (Session session = factory.openSession()) {
            List<Message> list = session.createQuery("from Message",
                Message.class).list();

            assertEquals(list.size(), 1);
            for (Message m : list) {
                System.out.println(m);
            }
        }
    }
}
```

Nuevamente, tenga en cuenta que estamos usando **TestNG** para ejecutar las pruebas, lo que en este caso afecta a nuestra clase de algunas maneras simples.

Primero, los métodos de prueba reales se anotan con **`@Test`**; indicamos una dependencia entre pruebas con una configuración para **`readMessage()`**. Si **`saveMessage()`** fallara, **`readMessage()`** no se ejecutaría, ya que su ejecución depende de un **`saveMessage()`** exitoso.

En segundo lugar, hay un método **`@BeforeSuite`**, que se ejecuta antes de intentar cualquiera de las pruebas. Esto nos da la oportunidad de hacer la inicialización del sistema. Aquí es donde estamos configurando Hibernate para el estado usable: en el código JDBC, usamos este mismo mecanismo para cargar el controlador JDBC y crear nuestro esquema de base de datos.<sup>9</sup>

En tercer lugar, indicamos ese fallo mediante el uso de **`assertEquals()`** importado estáticamente,<sup>10</sup> que debería ser fácil de entender. Una excepción también indica una falla, a menos que le digamos a TestNG que *esperamos* que se produzca una excepción (y también podemos decirle a TestNG qué tipos específicos de excepciones permiten que pase la prueba).

Es probable que use esta construcción a menudo porque es fácil de integrar en el ciclo de vida de construcción de su proyecto (ya que Maven ejecuta las pruebas disponibles como parte de la construcción). Además, le brinda un orden claro de ejecución y también proporciona una manera fácil de ver qué funciona y qué no funciona. Debe sentirse libre de escribir pruebas para validar su propia comprensión de lo que se describe.

A continuación, observe cómo se construye la prueba.

La prueba muestra la forma canónicamente correcta de usar la API nativa de Hibernate:<sup>11</sup> primero, construya una **`SessionFactory`**, que es el punto de entrada a la API de Hibernate (al igual que **`EntityManager`** es el punto de entrada a la arquitectura de persistencia de Java); luego use **`SessionFactory`** para recuperar objetos de **`Session`** de corta duración a través de los cuales se realizan actualizaciones o lecturas. Utilizamos la gestión automática de recursos para asegurarnos de que la **`Session`** se cierre cuando el bloque termine de ejecutarse.

Sin embargo, en realidad no usamos (y no podemos) usar la administración automática de recursos en la **`Transaction`**. No queremos un mecanismo de "cierre" en una **`Transaction`**; queremos determinar específicamente el resultado final, ya sea que esté comprometido o no. Un mecanismo de administración automática para las transacciones tendría implicaciones desafortunadas en los casos de condiciones de error (que pueden ser comunes en aplicaciones orientadas a bases de datos). Cubrimos las transacciones un poco más a fondo en el Capítulo 8.

Las pruebas reales reflejan bastante bien el código JDBC<sup>12</sup> (o viceversa); en ambos, adquirimos un recurso a través del cual “hablamos” con la base de datos, luego realizamos una acción, luego confirmamos nuestros cambios (si los hay) y limpiamos. (Definitivamente se están saltando detalles; esta es la vista de diez mil pies de los mecanismos en su lugar).

La última pieza del rompecabezas es el propio archivo de configuración, que se encuentra en **`src/test/resource/hibernate.cfg.xml`**. Consulte el Listado 2-4.

**Listado 2-4. El `hibernate.cfg.xml`, la configuración de Hibernate**

```java
<?xml version="1.0"?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <!--  Database connection settings  -->
        <property name="connection.driver_class">org.h2.Driver</property>
        <property name="connection.url">jdbc:h2:./db2</property>
        <property name="connection.username">sa</property>
        <property name="connection.password"/>
        <property name="dialect">org.hibernate.dialect.H2Dialect</property>
        <!--  Echo all executed SQL to stdout  -->
        <property name="show_sql">true</property>
        <!--  Drop and re-create the database schema on startup  -->
        <property name="hbm2ddl.auto">create-drop</property>
        <mapping class="chapter02.hibernate.Message"/>
    </session-factory>
</hibernate-configuration>
```

Este archivo puede servir como modelo para cada configuración de Hibernate. En él, especificamos la clase de controlador JDBC; la URL, el nombre de usuario y la contraseña de JDBC utilizados para acceder a la base de datos; *un dialecto* (que permite a Hibernate producir correctamente SQL para cada base de datos dada); alguna configuración, como volcar el SQL generado en la consola; y qué hacer para el esquema. Por último, especifica las clases que deben administrarse; en este caso, solo nuestra clase **`Message`**.

Hay muchas cosas que podemos controlar desde este archivo; incluso podemos usarlo para especificar el mapeo de nuestros objetos a la base de datos (es decir, ignorando las anotaciones que hemos estado usando hasta ahora). Verá un poco más de cómo hacer esto en capítulos posteriores de este libro; ayuda bastante en la asignación de esquemas de bases de datos existentes<sup>13</sup> a modelos de objetos.

La mayoría de los codificadores preferirán (y deberían) las asignaciones basadas en anotaciones.

## Connection Pooling

Como has visto, Hibernate usa conexiones JDBC para interactuar con una base de datos. La creación de estas conexiones es costosa, probablemente la operación individual más costosa que Hibernate ejecutará en un caso de uso típico.

Dado que la administración de conexiones JDBC es tan costosa, puede agrupar las conexiones, lo que puede abrir conexiones con anticipación (y cerrarlas solo cuando sea necesario, en lugar de "cuando ya no se usan").

Afortunadamente, Hibernate está diseñado para usar un grupo de conexiones de forma predeterminada, una implementación interna. Sin embargo, la agrupación de conexiones integrada de Hibernate no está diseñada para uso en producción. En producción, usaría un grupo de conexiones externas utilizando una conexión de base de datos proporcionada por JNDI (la interfaz de directorio y nombres de Java) o un grupo de conexiones externo configurado a través de parámetros y classpath.

**Nota**: C3P0 ( http://www.mchange.com/projects/c3p0/ ) es un ejemplo de un grupo de conexiones externo. Para usarlo, haríamos dos cambios. Primero, necesitamos agregar c3p0 y el proveedor de conexión c3p0 de Hibernate como dependencias en **`pom.xml`**. Observe que la versión de la dependencia hibernate-c3p0 debe coincidir con la versión de Hibernate. El listado 2-5 ilustra esta conexión.

**Listado 2-5. Cambios para el modelo de objetos para incluir c3p0**

```xml
<dependencies>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-c3p0</artifactId>
            <version>[5.0.0,5.9.9)</version>
        </dependency>
        <dependency>
            <groupId>com.mchange</groupId>
            <artifactId>c3p0</artifactId>
            <version>0.9.5.2</version>
        </dependency>
    </dependencies>
```

A continuación, debemos cambiar la configuración de Hibernate para indicarle que use c3p0. Para hacer esto, todo lo que tenemos que hacer es agregar cualquier propiedad de configuración de c3p0 a **`hibernate.cfg.xml`**. Por ejemplo:

```xml
<property name="c3p0.timeout">10</property>
```

Con esta línea en la configuración, Hibernate deshabilitará su conjunto de conexiones internas y usará c3p0 en su lugar.

Sin embargo, c3p0 no es el único grupo de conexiones; también está Proxool ( http://proxool.sourceforge.net/ ), que se menciona a menudo en la documentación de Hibernate.

Si está usando Hibernate en un contexto Java EE, en una aplicación web, por ejemplo, querrá configurar Hibernate para usar JNDI. Los JNDI connection pools son administrados por el contenedor (y, por lo tanto, controlados por el deployer), que generalmente es la "forma correcta" de administrar los recursos en un entorno distribuido.

Por ejemplo, WildFly ( http://wildfly.org/ ) viene preinstalado con una fuente de datos de ejemplo, llamada (helpfully) "java:jboss/datasources/ExampleDS". Es una base de datos H2, por lo que el dialecto ya es correcto; la nueva configuración se parecería a lo que se muestra en el Listado 2-6.

**Listado 2-6. Hibernate, configurado para usar JNDI como Datasource**

```xml
<?xml version="1.0"?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <!--  Database connection settings  -->
        <property name="jndi.url">java:jboss/datasources/ExampleDS</property>
        <property name="dialect">org.hibernate.dialect.H2Dialect</property>
        <!--  Echo all executed SQL to stdout  -->
        <property name="show_sql">true</property>
        <!--  Drop and re-create the database schema on startup  -->
        <property name="hbm2ddl.auto">create-drop</property>
        <mapping class="chapter02.hibernate.Message"/>
    </session-factory>
</hibernate-configuration>
```

Idealmente, no se usaría el árbol **`java:jboss`**; usaría un nombre en el ámbito del componente de la aplicación, en el árbol **`java:comp/env`**.<sup>14</sup>

## Summary

En este capítulo, hemos presentado una breve descripción general de cómo usar Maven para construir y probar sus proyectos, así como también cómo especificar dependencias. También mostramos el uso de TestNG como un simple arnés para ejecutar código. Por último, explicamos cómo configurar Hibernate, comenzando por adquirir **`SessionFactory`** y concluyendo con la configuración de **`SessionFactory`**, cubriendo la administración de conexión JDBC simple incluida con Hibernate, el uso de un grupo de conexiones y el empleo de JNDI para adquirir conexiones de base de datos.

Ahora debería tener suficiente arnés en su lugar para que pueda concentrarse en usar Hibernate para ayudarlo a administrar un modelo de objetos persistente. Agregaremos más detalles sobre esto según sea necesario en el código de ejemplo.

En el próximo capítulo, vamos a construir algunos modelos de objetos un poco más complejos (y útiles) para ilustrar más conceptos básicos de Hibernate.

### Footnotes

<sup>1</sup> Eso significa que si tiene una versión anterior de JVM, tendrá que ceñirse a las versiones anteriores de Hibernate. Eso no debería ser una gran molestia; Java 7 ha llegado al final de su vida útil desde abril de 2015. Es hora de avanzar si aún no lo ha hecho, gracias a las preocupaciones de seguridad y, por supuesto, al hecho de que Java 8 es bueno.

<sup>2</sup> La edición anterior de este libro en realidad usaba HSQLDB. No hubo una razón concreta para el cambio, pero la investigación entre la comunidad mostró una preferencia por H2 sobre HSQLDB, por varias razones (principalmente centradas en el hecho de que H2 está escrito por el autor original de HSQL). Sus autores escuchan a la gente.

<sup>3</sup> También vale la pena señalar que existen complementos para Maven que pueden incorporar bases de datos externas como MariaDB (una variante de MySQL); consulte MariaDB4J en https://github.com/vorburger/MariaDB4j si está interesado. Pero H2 es más pequeño y más rápido para nuestros propósitos, y dado que Hibernate es independiente de la base de datos, la base de datos real que use debería ser irrelevante en gran medida.

<sup>4</sup> Los argumentos sobre “cuál herramienta de compilación es la mejor” se parecen mucho a los argumentos sobre los méritos relativos de IDEA, Emacs, Netbeans, Eclipse y otros. Todo el mundo tiene una opinión, y esa opinión es perfectamente válida para quien la sostiene; sin embargo, generalmente se acepta que Maven no es la "mejor herramienta de compilación", al igual que Eclipse no es el "mejor editor". Son populares. Son comunes. Eso es todo.

<sup>5</sup> Si no utiliza una herramienta de compilación, consulte las instrucciones de su IDE para agregar bibliotecas a los proyectos. Sin embargo, vale la pena señalar que usar una herramienta de compilación es inteligente; significa que sus compilaciones se duplican fácilmente. Por ejemplo, si desea mostrar su código a otra persona, sin una herramienta de compilación, deberá asegurarse de que su entorno coincida con el suyo; pero con una herramienta de compilación, todo lo que tiene que hacer es asegurarse de que tengan la herramienta instalada. Puedes ver esto en este libro; Describo la compilación con Maven, y los lectores pueden usar cualquier editor o IDE que deseen sin afectar el contenido en absoluto.

<sup>6</sup> TestNG ( http://testng.org/ ) es un marco de pruebas unitarias. Es una alternativa popular a JUnit (http://junit.org), y tiene algunas características bastante deseables en comparación.

<sup>7</sup> Java 7 llegó al final de su vida útil en abril de 2015. Es hora de seguir adelante si puede hacerlo. Consulte https://java.com/en/download/faq/java_7.xml para obtener más detalles.

<sup>8</sup> Hay otras clases en el árbol, pero ya no nos preocupamos por JDBC en este capítulo; están aquí porque te prometieron que el árbol del capítulo 02 era el mismo que el del capítulo 01. Todas las cosas de JDBC serán ignoradas.

<sup>9</sup> Hmm, prometimos que no íbamos a mencionar más el código JDBC. ¡Vaya!

<sup>10</sup> La importación de **`assertEquals()`** de forma estática significa que se puede llamar directamente sin una referencia a la clase **`org.testng.Assert`**. Las importaciones estáticas normalmente no son algo muy bueno, pero este es un ejemplo idiomático y muy útil de ellas.

<sup>11</sup> Hibernate implementa la arquitectura de persistencia de Java como una API alternativa. Es un poco más genérica que la API nativa y está configurada de forma ligeramente diferente, aunque la mayoría de los conceptos son idénticos.

<sup>12</sup> Maldita sea, seguimos encontrándonos con ese código JDBC que se supone que no debe mencionarse.

<sup>13</sup> “Schemata” es el plural de “schema”. Consulte http://www.merriam-webster.com/dictionary/schema.

<sup>14</sup> Consulte http://www.ibm.com/developerworks/library/j-jndi/?ca=dnt-62 para obtener un artículo que analiza este concepto con cierto detalle, aunque los detalles de implementación están un poco anticuados.
