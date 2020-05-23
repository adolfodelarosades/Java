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

