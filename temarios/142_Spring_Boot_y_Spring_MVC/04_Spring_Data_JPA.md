# 4. Spring Data JPA 01:24

* 29 Introducción a Spring Data 12:28 
* 30 Entidades 11:09 
* 31 Integración de las entidades en nuestro proyecto 4:06 
* 32 Repositorios 10:43 
* 33 Integración de los repositorios en nuestro proyecto 13:21 
* 34 Consultas básicas 19:36 
* 35 Otras consultas 12:40 
* Contenido adicional 4

# 29 Introducción a Spring Data 12:28

[PDF Introducción_a_Spring_Data.pdf](pdfs/21._Introducción_a_Spring_Data.pdf)

## Resumen Profesor

### Módulos de Spring Data

Spring Data es un proyecto *paraguas* de otros subproyectos. Ofrece diversos módulos para múltiples formas de almacenar datos:

### Módulos principales

* Spring Data Commons: elementos comunes al todos los demás módulos
* Spring Data JDBC: Repositorios de Spring Data sobre JDBC.
* Spring Data JDBC ext: Soporte para extensiones específicas de algunos SGBD.
* **Spring Data JPA: Spring Data con soporte para JPA**
* Spring Data KeyValue: Repositorios basados en `Map` (almacenes clave/valor)
* Spring Data LDAP: Repositorios con soporte para Spring LDAP.
* Spring Data MnogoDB: Repositorios para Mongodb con soporte objeto-documental.
* Spring Data Redis: Configuración fácil para el uso de Redis en aplicaciones Spring
* Spring Data for Apache Cassandra: Configuración y acceso fácil a Apache Cassandra.
* Spring Data for Apache Geode: Configuración y acceso fácil para Apache Geode.
* Spring Data for Apache Solr: Configuración y acceso fácil para Apache Solr.
* Spring Data for Pivotal GemFire: Configuración y acceso fácil para Pivotal GemFire.

### Módulos de la comunidad

* Spring Data Aerospike: Spring Data para Aerospike.
* Spring Data ArangoDB: Spring Data para ArangoDB.
* Spring Data Couchbase: Spring Data para Couchbase.
* Spring Data Azure Cosmos DB: Spring Data para Microsoft Azure Cosmos DB.
* Spring Data DynamoDB: Spring Data para DynamoDB.
* Spring Data Elasticsearch: Spring Data para Elasticsearch.
* Spring Data Hazelcast - Soporte de repositorios Spring Data para Hazelcast.
* Spring Data Jest - Spring Data para Elasticsearch basado en el cliente REST Jest.
* Spring Data Neo4j - Soporte para repositorios Spring Data para Neo4j.
* Spring Data Vault - Repositorios Vault sobre Spring Data KeyValue.

### Módulos relacionados

* Spring Data JDBC Extensions: extensiones a JDBC provistas en Spring Framework
* Spring para Apache Hadoop: Simplifica Hadoop ofreciendo una configuración y modelo unificado.
* Spring Content: Asociación de contenido con entidades Spring Datay almacenamiento de datos en un abanico de almacenes como S3, Mongo GridFS, …

### Dependencias Maven

Para usar Spring Data JPA, podemos utilizar la dependencia *starter* de Spring Boot:

```html
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
```

Para poder utilizar H2, usamos la siguiente dependencia:

```html
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>runtime</scope>
</dependency>
```

Esta dependencia no es solo un conector a la base de datos, sino que incluye la base de datos en sí dentro de nuestro proyecto.

## Transcripción

Hola hola todos comenzamos un nuevo bloque de este curso de Spring y no introducimos en el mundo de stringdata primero hablaremos sobre la persistencia de los datos la persistencia de la información hasta ahora todas las aplicaciones que hemos venido desarrollando almacenaban los datos en memoria es decir que entre inicio y reinicio de la aplicación por los datos se perdían la mayoría de las aplicaciones con las que solemos trabajar Mobile suelen trabajar con necesita persistencia de información en decir trabajan con ciclo de vida con trabajan con lógica de aplicación que necesita presentación ya nos la suele aportar cualquier sistema de almacenamiento no vamos a entrar en detalle en los diversos sistemas que ve que podríamos tener eso escapa este curso y nos vamos a centrar en nuestro casa en la base de datos que sería la solución más usual podríamos decir para para persistir información a día de hoy existen dos grandes podremos llamar grupo de base de datos en el fondo son grandes modelo a la hora de representar la información en una en una base de datos por un lado el relacional y por otro lado el no SQL el modelo relacional que nacen los años 70 y que a día de hoy pues sigue siendo fuertemente utilizado se basa en una estructura de datos que es la tabla que es bueno pues está matriz bidimensional de doble entrada con columna y con pila bueno por el propio modelo tenemos una serie de características de ventajas como en la garantía frente a duplicidad de decir jamás podemos tener en una base de datos relacional dos filas que sean exactamente exactamente iguales suelen ser base de datos cuando trabajamos con ellas que normalmente pues tienen un diseño normalizado lo cual también nos ayuda la integridad referencial a poder llevarlo a cabo la integridad referencial es una regla que bueno pues nos permite asociar datos entre tablas y garantizar que esos datos asociados son consistentes y como desventaja porque no todo son ventajas pues encontramos que no son fácilmente escalables es decir que si estamos desarrollando un sistema que en principio está pensado para un manejo de un cierto volumen de datos bueno pues duplicar triplicar ciento plicar este es el volumen de datos no es no es sencillo no en la otra mano tenemos la fase de datos no es sequel frente al modelo relacional no SQL no significa que no sean más se de datos relacionales y no que no solamente son relacionales no porque ofrecen algunas características de las base de datos relacionales y otra adicionales lo primero que nos encontramos que hay distintos modelos y es que podemos encontrar en el mercado diferentes forma de arquitectura vale de modelo de representación de los datos vale aquellos que trabajan con hámsters otros que trabajan con documento diferentes modelo una de las grandes ventajas en la velocidad y la flexibilidad frente al modelo relacional qué es modelo ciertamente rígido tenemos las bases de datos NoSQL que son que tienen un modelo totalmente flexibles no por ejemplo un sistema gestor de base de datos como podría ser Mongo que trabaja con documentos nos permite guardar en una colección dos documentos que no tengan la misma factura lo cual pues nos da mucha fiesta y vida en este caso sí que son francamente más fáciles de escalar vale mediante diferentes técnicas y sobre todo están pensados para un manejo de un gran volumen de datos aunque


Lo podríamos utilizar que así que cualquier contesta como ya decía las bases de datos relacionales que bueno pues llevan imperando de alguna manera desde los años 80 90 siguen siendo a día de hoy muy utilizada sin embargo tienen una dificultad si nosotros pensamos en nuestras aplicaciones Java podremos pensar en clase y en objetos no usamos objetos que es bueno si lo hiciéramos plantear en un dibujo podríamos decir que tienen n dimensiones no porque no pueden tener múltiples atributos asociación entre otros objetos etcétera las bases de datos relacionales basadas en el uso de tabla tienen dos dimensiones no fila y columna no entonces cómo podríamos salvar nosotros este este despacito si lo tuviéramos que programar a mano utilizando JDBC qué es la tecnología podríamos decir más elemental que tiene Java para acceder a base de datos pues tendríamos que programar un código parecido a este no aquí podemos apreciar este desfase objeto-relacional es decir somos nosotros los que tenemos que hacer el mapeo datos datos vale entre cada atributo de en este caso la clase empleado con cada atributo el perdón con cada columna de la base de datos vale que hemos consultado no este código suele ser tedioso muy repetitivo solamente van variando en la termina imágenes las consultas que podemos realizar o bien bueno pues los distintos datos y los tipos de datos que nos devuelve con lo cual es muy propenso a errores no es francamente te vio para salvar esto tenemos bueno fue todo un estilo podríamos llamar día de software porque no es una única solución que es el mapeo objeto relacional y qué es una pieza de software que colocaríamos entre nuestra aplicación y la base de datos y qué se encarga podríamos decir que básicamente de traducir objetos a filas y viceversa es decir que nos va a permitir seguir trabajando con objetos aunque de manera subyacente bueno pues seguirán trabajando con fila y tabla de una base de datos relacional en el mercado podemos encontrar varios si bien estuvimos decir que el rey de todos ellos para Java es Hibernate aparte de Hibernate podemos encontrar Mané a nivel superior como una abstracción por encima el estándar anda vale se define en Java para dar respuesta a esta proliferación de RM que iba surgiendo y bueno para definir un estándar no una especie de contrato al cual seguirnos cuándo vamos a trabajar con persistencia en Java Java no ofrecen ninguna implementación concreta de estancias no sino que todos son implementaciones de terceros podríamos decir que si j.p.a. es el baile por así decirlo vale Hibernate sería el bailarín es decir que podemos trabajar con un esquema donde bueno trabajamos con la notación con las clases interfaces vale con el estilo del estándar j.p.a. pero por debajo sea Hibernate y que vaya trabajando con la aplicación JP no facilita la especificación de como nuestro objeto se asocian al esquema las tablas de la base de datos vale no ofrece manera sencilla de poder hacer operaciones Cruz van a de lectura de inserción de borrado de actualización no ofrece un lenguaje de consulta de datos vale distinto a SQL aunque francamente parecido pero es un lenguaje de consulta sobre objeto y nos da mucho elementos de optimización


Ventajas del propio jpg sin embargo parece que no lo habíamos olvidado de fresno y qué pasa con esto pues no ofrece spring data a la hora de trabajar con base de datos no ofrece un abanico muy amplio de posibilidades stringata digamos que es un paraguas que nos permite trabajar con múltiples tipos de base de datos de una manera similar podemos trabajar directamente con JDBC no podemos hacer con Hibernate no podemos hacer con JP sobre Hibernate vale podemos trabajar de distintas maneras el propio spring data como ya digo no ofrece un modelo consistente para trabajar con base de datos relacionales y base de datos NoSQL decir que podríamos decir que es un paraguas que no ofrece algunas ventajas una serie de repository potente la posibilidad de realizar consulta que se derivan del nombre del método en un repositorio la implementación de entidades la posibilidad de realizar el proceso de auditoría de cambios en cada una de nuestras entidades configuración muy sencilla con Spring boot etcétera etcétera existen muchos sus proyectos de Spring data vale para distintos distintas tecnologías distintos sistemas gestores de base de datos cómo sería spring data JP a el de Casandra Montgó Reddit etcétera etcétera así acceder a la página de Spring data podéis encontrar toda la lista de módulos principales del proyecto de proyectos que son mantenidos por la comunidad yo diría que hay unos 20-25 aproximadamente y para que así que cualquier sistema gestor de base de datos tanto relacional como no es ekuele de los grandes encontremos en el mercado decir entonces que nuestras pila a la hora de trabajar con la persistencia queda en todo lo bajo tendríamos nuestro sistema gestor que en nuestro caso será de 2 es un sistema gestor de base de datos sencillo que nos permite trabajar con él de forma en bebida en nuestro proyecto y que se suele utilizar en muchos casos durante la fase de desarrollo o en prueba vale para hacer prototipado vale sobre todo en las fases iniciales de desarrollo tienda terrible con Maven también tiene cumple con la regla de atomicidad consistencia y la miento y durabilidad vale la la regla las cuatro reglas así que debería cumplir cualquier sistema gestor de base de datos relacional y es muy ligero sobre el bueno pues no encontramos la pila que comentábamos antes JDBC sobre el Hibernate sobre el JP ah y sobre el Spring data J P a S su proyecto es integrar todo lo que podemos hacer con JP y algunas funcionalidades más cómo pueden ser los automáticos a través de los repositorios muchas facilidades a la hora de realizar consulta la posibilidad de realizar consultas con jpql consultas nativa vale nos veremos en alguno de los vídeos posteriores muchas facilidades a la hora de hacer consulta la dependencia que añadiremos después y que nos faltan serían estás de aquí por un lado la dependencia starter de data j.p.a. y por otro lado tendríamos que añadir la dependencia de la base de datos H2 y como decías quedará en bebida dentro de dentro de de nuestra aplicación al igual que nos pasa con nuestro contenedor de servlets y así bueno pues no te preocupare hemos de tener que tener un sistema remoto gestionar conexiones etcétera etcétera hasta aquí la introducción a JP a en el próximo vídeo empezaremos hablando de entidades


# 30 Entidades 11:09 

[PDF Entidades.pdf](pdfs/22._Entidades.pdf)

## Resumen Profesor

No existe.

## Transcripción

# 31 Integración de las entidades en nuestro proyecto 4:06 

## Resumen Profesor

No existe.

## Transcripción

# 32 Repositorios 10:43 

[PDF Repositorios.pdf](pdfs/23._Repositorios.pdf)

## Resumen Profesor

### Algunos elementos de Spring Framework

Por si tienes oxidados algunos de los elementos de Spring Framework, aprovecho para recordar:

* Si utilizamos la anotacion `@Autowired` sobre una referencia de un tipo interfaz, Spring se encarga de buscar en el *IoC container* una instancia de un *bean* de un tipo que sea compatible, es decir, que implemente dicha interfaz.

* Si Spring encuentra más de una instancia de un tipo de bean (en nuestro caso, hay dos clases que implementan una interfaz, `EmpleadoService`), posiblemente tendríamos una excepción. Al anotar uno de los beans con `@Primary`, Spring escoge dicho bean entre los dos.

### Propiedades en `application.properties` para Spring Data JPA

```html
# URL jdbc de conexión a la base de datos
# spring.datasource.url=jdbc:h2:mem:db
spring.datasource.url=jdbc:h2:./openwebinars

# Usuario y contraseña de la base de datos
spring.datasource.username=sa
spring.datasource.password=

# Habilitamos la consola de H2
# http://localhost:{server.port}/h2-console
# En nuestro caso http://localhost:9000/h2-console
spring.h2.console.enabled=true

# Habilitamos los mensajes sql en el log
spring.jpa.show-sql=true
```

### `CommandLineRunner`

Se trata de una interfaz muy útil, ya que nos permite definir fragmentos de código que se lanzarán justo al iniciar la aplicación.

Si vemos la estructura del código a usar:

```java
@Bean
CommandLineRunner initData(EmpleadoRepository repositorio) {
    return (args) -> {
        //código a ejecutar
    };
}
```

Apreciamos que estamos usando una *expresión lambda* para devolver el objeto. Como los demás métodos anotados con `@Bean`, lo podemos definir en una clase anotada con `@Configuration` o en la clase `@SpringBootApplication`.

### Actualización en la seguridad

Como hemos visto en las propiedades, hemos habilitado la posibilidad de acceder a la consola de H2, pero al ser un acceso web que está dentro de nuestro proyecto, tenemos que darle “via libre” para entre en la configuración de seguridad.

*Vamos a dar un acceso total al cualquier usuario porque estamos aprendiendo. En otro caso, esto no sería una buena práctica, y solamente deberíamos dar acceso a algún usuario que cumpliera alguna característica, como tener el rol de administrador. Otra solución podría ser tener dos beans de configuración de la seguridad, y activar uno u otro en base a los perfiles. Si quieres saber cómo hacer esto, puedes visitar nuestro Curso de Spring Core.*

El código del método que gestiona la autorización debería quedar como sigue:

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    //... otros métodos

    @Override
    protected void configure(HttpSecurity http) throws Exception {  
        http
            .authorizeRequests()
                .antMatchers("/webjars/**", "/css/**", "/h2-console/**").permitAll()
                .anyRequest().authenticated()
            .and()
            .formLogin()
                .loginPage("/login")
                .permitAll()
            .and()
                .logout();

            http.csrf().disable();
            http.headers().frameOptions().disable();

    }    
}
```

Necesitamos esto porque:

* Tenemos que dar acceso a la ruta concreta de acceso a la consola, `/h2-console/`
* Por defecto, Spring Security habilita la protección contra CSRF, y para usar la consola de H2 esta no puede estar habilitada.
* La interfaz de usuario de la consola utiliza frames, y Spring Security no los permite por defecto (envía la cabecera `X-Frame-Options: DENY`). Al deshabilitar esa cabecera, ya podemos cargar frames.

## Transcripción

# 33 Integración de los repositorios en nuestro proyecto 13:21 

## Resumen Profesor

No existe.

## Transcripción

# 34 Consultas básicas 19:36 

[PDF Consultas.pdf](pdfs/24._Consultas.pdf)

## Resumen Profesor

### *Keywords* a usar en las consultas derivadas del nombre del método

Hemos visto que Spring Data nos permite utilizar algunas palabras especiales en las consultas derivadas del nombre del método. La lista completa de palabras con su correspondencia lógica es la siguiente:

Expresión lógica | Expresión Spring Data
-----------------|----------------------
AND | and
OR |	or
AFTER | After, IsAfter
BEFORE | Before, IsBefore
CONTAINING | Containing, IsContaining, Contains
BETWEEN | Between, IsBetween
ENDING_WITH | EndingWith, IsEndingWith, EndsWith
EXISTS | Exists
FALSE | False, IsFalse
GREATER_THAN | GreaterThan, IsGreaterThan
GREATER_THAN_EQUALS | GreaterThanEqual, IsGreaterThanEqual
IN | In, IsIn
IS | Is, Equals
IS_EMPTY | IsEmpty, Empty
IS_NOT_EMPTY | IsNotEmpty, NotEmpty
IS_NOT_NULL | NotNull, IsNotNull
IS_NULL | Null, IsNull
LESS_THAN | LessThan, IsLessThan
LESS_THAN_EQUAL | LessThanEqual, IsLessThanEqual
LIKE | Like, IsLike
NEAR | Near, IsNear
NOT | Not, IsNot
NOT_IN | NotIn, IsNotIn
NOT_LIKE | NotLike, IsNotLike
REGEX | Regex, MatchesRegex, Matches
STARTING_WITH | StartingWith, IsStartingWith, StartsWith
TRUE | True, IsTrue
WITHIN | Within, IsWithin

En la documentación de Spring Data JPA podemos encontrar la correspondencia entre estas *keywords* y el correspondiente snippet de código JPQL https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation.

### Querydsl

La dependencia maven a incluir sería:

```html
<dependency>
   <groupId>com.querydsl</groupId>               
   <artifactId>querydsl-jpa</artifactId>
</dependency>
```

Además, necesitamos añadir un plugin, que es el que creará las clases derivadas de nuestro modelo de datos que se utilizan para consultar

```html
<plugin>
    <groupId>com.mysema.maven</groupId>
    <artifactId>apt-maven-plugin</artifactId>
    <version>1.1.3</version>
    <executions>
        <execution>
            <goals>
                <goal>process</goal>
            </goals>
            <configuration>
                <outputDirectory>target/generated-sources/java</outputDirectory>
                <processor>com.querydsl.apt.jpa.JPAAnnotationProcessor</processor>
            </configuration>
        </execution>
    </executions>
</plugin>
```

### Query by Example

Si nos fijamos en la especificación de métodos de `JpaRepositoriy<T, ID>`, nos damos cuenta de que podemos utilizar algún método que hace uso de `Example<S>`.

```java
public interface JpaRepository<T, ID> extends PagingAndSortingRepository<T, ID>, QueryByExampleExecutor<T> {

    // otros métodos

    @Override
    <S extends T> List<S> findAll(Example<S> example);

    @Override
    <S extends T> List<S> findAll(Example<S> example, Sort sort);
}
```

## Transcripción

# 35 Otras consultas 12:40 

## Resumen Profesor

No existe.

## Transcripción

# Contenido adicional 4

* [PDF Introducción_a_Spring_Data.pdf](pdfs/21._Introducción_a_Spring_Data.pdf)
* [PDF Entidades.pdf](pdfs/22._Entidades.pdf)
* [PDF Repositorios.pdf](pdfs/23._Repositorios.pdf)
* [PDF Consultas.pdf](pdfs/24._Consultas.pdf)

