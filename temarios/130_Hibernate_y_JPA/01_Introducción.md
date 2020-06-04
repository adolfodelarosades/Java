# 1. Introducción 44m

   * 01 Presentación del profesor y del curso 2:49 
   * 02 Introducción 18:52 
   * 03 Hibernate, más que un ORM 22:43 
   * Contenido adicional 2
      
# 01 Presentación del profesor y del curso 2:49 

## Resumen Profesor

Conoce al profesor y lo que veremos durante el curso de Hibernate.

REPOSITORIO DEL CURSO: https://github.com/OpenWebinarsNet/Curso_hibernate_ejemplos

## Transcripción

<img src="images/1-01.png">

Curso de Hibernate 5, una tecnología de ORM de las más utilizadas en el mercado sobre todo para Java. Vamos a compartir 12 capítulos en los que nos iremos metiendo de lleno en esta tecnología.

<img src="images/1-02.png">

En el primer capítulo veremos una introducción a lo que es el concepto de ORM y los diferentes productos que podemos encontrar en el mercado.

En el segundo iremos conociendo Hibernate y también los diferentes módulos que ofrece, lo compararemos con el estándar JPA.

En el tercer capítulo realizaremos nuestro primer proyecto con Hibernate, nuestro primer proyecto con JPA y también marinaremos estás tecnologías con Spring Boot y Spring MVC.

En el capítulo 4 vamos a saber cómo mapear nuestras entidades en la base de datos haciéndolo a través de anotaciones y a través de fichero de descriptores XML y también conoceremos el ciclo de vida de las entidades.

En el capítulo 5 conoceremos cómo asociar una entidad desconocida y los diferentes tipos de asociaciones que existen.

<img src="images/1-03.png">

En el capítulo 6 hablaremos de algunos elementos avanzados como la herencia o los campos calculados.

En el siete veremos como Hibernate nos permite mapear colecciones de diferentes tipos y estas colecciones pueden ser de valores simples de valores algo más complejo y también puede ser ordenada de diferentes maneras.

En el capítulo 8 veremos cómo genera el esquema de nuestra base de datos y así lo deseamos o cómo podemos hacer el proceso inverso para un esquema dado de generación de la entidad.

En el capítulo 9 hablaremos un poco sobre qué es eso de la unidad de persistencia, el contexto de persistencia y cómo se pueden almacenar, recuperar y borrarlo.

En el capítulo 10 hablaremos de transacciones y control de concurrencia y veremos algunos patrones y antipatrones.

<img src="images/1-04.png">

En el capítulo 11 veremos cómo podemos realizar consulta en lenguaje nativo de Hibernate y sobretodo utilizaremos el de JPA.

Y por último en el capítulo 12 hablaremos de Hibernate Envers y cómo realizar la auditoría de entidades y cómo realizar la auditoría de entidades y un control de revisiones.

# 02 Introducción 18:52 

[Introducción](pdfs/01_Introducción.pdf)

## Resumen Profesor

### 1.1 Necesidad de almacenamiento de información

Desde que *el mundo es mundo* el ser humano ha tenido necesidad de almacenar información. Con la invención de la escritura, no se estaba haciendo más que conseguir que la palabra escrita pudiera reflejar hechos, ideas, sentimientos… más allá de la mera experiencia oral. La imprenta de caracteres móviles supuso una expansión del conocimiento como nunca antes de había conseguido, y todo gracias a que la información se podía replicar de una manera más rápida y eficiente.

Ya en el siglo XX, con la invención de las computadoras, aparecen diferentes dispositivos de almacenamiento, como son las tarjetas o cintas perforadas, cintas de casete, discos magnéticos, ópticos, sólidos… En menos de 50 años, hemos pasado de una capacidad de almacenamiento de 4MB en un disco que pesaba cientos de kilos, a tarjetas de memoria de pocos gramos con una capacidad de cientos de GB.

#### 1.1.1 Organización de la información

Más allá de la forma *física* de almacenar la información, existe otra perspectiva, que es la forma *lógica* de organizarla, es decir, como utilizamos los dispositivos de almacenamiento para guardar todos los datos que deseemos.

Los primeros sistemas informáticos organizaban los datos en registros. Un registro no es más que un conjunto de datos *coherentes* entre ellos. Por ejemplo, nuestra declaración de la renta (IRPF) es un extenso conjunto de datos, la mayoría de ellos numéricos, que hacen referencia, normalmente, a una sola persona; o también, la información meteorológica para un lugar, por ejemplo Sevilla, en una fecha exacta, por ejemplo el día de hoy, también sería un conjunto de datos coherentes, es decir, un registro.

Con el tiempo, surge la necesidad de separar los programas de aplicación y el almacenamiento de los datos, y con ello, las **bases de datos**.

### 1.2 Bases de datos

Desde los años 50-60 surgieron diferentes modelos de datos, como el jerárquico o el modelo en red, que implicaban que los programas estuvieran muy acoplados a los datos. Para solventar este problema, surge el **modelo relacional**.

#### 1.2.1 Modelo relacional

Fue propuesto por Edgar Codd, y está sustentado en la teoría de conjuntos y la lógica de predicados.

La estructura fundamental de este modelo es la *relación*, aunque usaremos su sinónimo, llamado **tabla**. Se trata de una estructura formada por columnas y filas, que contiene información sobre una misma clase o entidad. Además, esta estructura es independiente de la forma en que se almacenan los datos (es decir, el esquema físico y el lógico son diferentes). Este modelo perseguía diferentes objetivos además de esta independencia, como es la uniformidad, la flexibilidad, y la sencillez.

Con el tiempo, este modelo es el que más se ha extendido, siendo un estandar de *facto* durante muchos años, incluso en la actualidad, si bien han surgido una nueva ola de modelos, llamados NoSQL (Not Only SQL).

### 1.3 Desfase objeto-relacional

En la actualidad, el modelo de programación más extendido es la Orientación a Objetos, mediante la cual todos los componentes que manejamos en una aplicación son objetos. Si pudiéramos representar gráficamente un objeto y una tabla, caeríamos en la cuenta de que no tienen el mismo número de dimensiones: las tablas son *bidimensionales*, frente a los objetos que son *tridimensionales*. Esto nos sugiere que sería ideal tener una base de datos que nos permitiera almacenar objetos. Sin embargo, los productos más extendidos en el mercado, a día de hoy, siguen siendo los SGBD relacionales.

¿Cómo solventar este problema? En principio, un programador tenía que escribir toneladas de código fuente para poder almacenar o recuperar información. Además, ese código suele repetirse en un alto porcentaje, ya que las sentencias de conexión, recuperación o cierre suelen ser muy parecidas.

A continuación, mostraremos un ejemplo de un código Java que, haciendo uso de JDBC, consultaría una base de datos relacional.

```java
public List<Alumno> findAll() throws ClassNotFoundException, SQLException {
        String sql = "SELECT ID_ALUMNO, NOMBRE, APELLIDOS,"
                + " TO_CHAR(FECHA_NACIMIENTO,'DD/MM/YYYY') AS FEC_NAC, "
                + " CORREO_ELECTRONICO, HORAS_FALTAS "
                + " FROM ALUM";

        List<Alumno> result = null;

    //Este método nos devolvería un objeto PreparedStatement
    //listo para ejecutar la sentencia de más arriba
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            if (result == null)
                result = new ArrayList<Alumno>();

            result.add(new Alumno(rs.getInt("ID_ALUMNO"),
                    rs.getString("NOMBRE"),
                    rs.getString("APELLIDOS"),
                    rs.getString("FEC_NAC"),
                    rs.getString("CORREO_ELECTRONICO"),
                    rs.getInt("HORAS_FALTAS")));
        }

        rs.close();
        ps.close();

        return result;
    }
```    

Para tratar de aligerar la tarea de los programadores, surgen la técnica del mapeo objeto-relacional.

### 1.4 *Object Relational Mapping* (ORM)

Se conoce comunmente como ORM a un componente software, ubicado entre una aplicación y un SGBDR, que se encargará de salvar el desfase objeto-relacional, ayudándonos a transformar los objetos de nuestra aplicación en filas de tablas de nuestra base de datos relacional.

Un mapeador objeto-relacional nos permite abstraernos del proceso de transformación entre objetos y tablas, y viceversa, acelerando así el desarrollo, pues nos permite centrarnos en programar la lógica de negocio de nuestra aplicación. También permite aumentar la seguridad y fiabilidad.

Una de las grandes desventajas achacadas a los ORMs es que pueden *ralentizar* mucho el acceso a bases de datos. Sin embargo, muchos ORMs nos permiten el uso de cachés, que aceleran el proceso de consulta.

#### 1.4.1 Productos existentes en el mercado

Algunos de los ORMs más conocidos para Java son:

* Hibernate

* EclipseLink

* JDO

* MyBatis

Para otros lenguajes de programación, también podemos encontrar algunos ORMs:

* PHP

   * Propel

   * Doctrine

* C#
 
   * NHibernate

   * ADO.NET Entity Framework
   
* Python

   * Django ORM

   * SQL Alchemy
   
   * Pony
   
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

<img src="images/2-11.png">

<img src="images/2-12.png">

<img src="images/2-13.png">

<img src="images/2-14.png">

<img src="images/2-15.png">

<img src="images/2-16.png">

<img src="images/2-17.png">

<img src="images/2-18.png">

<img src="images/2-19.png">

<img src="images/2-20.png">

<img src="images/2-21.png">

# 03 Hibernate, más que un ORM 22:43 

[Hibernate, más que un ORM](pdfs/02_Hibernate.pdf)

## Resumen Profesor

### 2.1 Hibernate como ORM

Ya hemos hablado en el capítulo anterior de lo que era un mapeador objeto-relacional y como nos podía ahorrar muchas líneas de código muy repetitivo. Sin embargo, los beneficios de uso de Hibernate no se quedan solamente ahí:

**Ventaja**	| **Descripción**
--------|------------
**Productividad** |	Nos permite centrarnos en el desarrollo de la lógica de negocio, ahorrándonos una gran cantidad de código (más del que cabría esperar).
**Mantenibilidad** | El ORM de Hibernate, al reducir el número de líneas de código que tenemos que escribir, nos permite realizar refactorizaciones de forma más fácil.
**Rendimiento** |	Aunque la persistencia manual podría permitir un rendimiento mayor, Hibernate aporta muchas optimizaciones, como el almacenamiento en caché.
**Independencia** |	Hibernate nos permite aislarnos del RDBMS concreto que estemos usando. Aunque no tengamos pensado cambiar de gestor, nos puede permitir usar un RDBMS ligero (como H2) para la fase de desarrollo, usando otro en producción.

### 2.2 Hibernate, no solo un ORM
Hibernate no solamente es un ORM. Se trata de un proyecto formado por varios módulos, que nos ofrecen grandes funcionalidades.

#### Hibernate ORM

Este módulo ya ha sido, de alguna forma, presentado. Contiene una serie de servicios para la persistencia de objetos en bases de datos relacionales. Funciona en casi cualquier proyecto Java (Java EE, Java Swing, con Servlets, Spring, …).

#### Hibernate EntityManager

Más adelante hablaremos de JPA, pero podemos decir aquí que este módulo es el que nos permite utilizar Hibernate como implementación del estándar JPA. Las características nativas de Hibernate son un superconjunto de las que ofrece JPA en todos los sentidos.

#### Hibernate Validator

Hibernate proporciona una implementación del estándar JSR 303 Bean Validation. Se puede usar independientemente de otros proyectos de Hibernate, y proporciona una validación declarativa para nuestras *clases modelo*.

#### Hibernate Envers

Dedicaremos el último capítulo de este curso a este módulo, que nos permite auditar los cambios en nuestra persistencia, manteniendo múltiples versiones de los datos en nuestra base de datos SQL. Esto nos permitirá implementar facilmente históricos (funciona de forma similar a los sistemas de control de versiones, como Git).

#### Hibernate Search

Este módulo mantiene un índice de todas los datos de nuestro dominio dentro de una base de datos de `Apache Lucene`. En conjunción con Hibernate ORM, podremos realizar búsquedas de texto completo.

#### Hibernate OGM

Se trata del *mapeador objeto-grid*, y está orientado hacia bases de datos NoSQL. Proporciona soporte JPA para este tipo de soluciones, reusando el núcleo de Hibernate pero almacenando las entidades en pares clave-valor, documentos u otro tipo de almacenes de datos no relacionales.

### 2.3 Hibernate frente a otros ORMs del mercado

¿Hibernate? ¿MyBatis? ¿JDBC? ¿Qué tecnología deberíamos escoger?
Esa es una pregunta que no tiene una sola respuesta, ya que dependerá del proyecto concreto que estemos desarrollando. Espero que estas pistas os sirvan.

#### 2.3.1 Hibernate vs JDBC

JDBC no es un ORM, pero es la tecnología de base que nos ofrece Java para poder tener conectividad con bases de datos relacionales.

Tecnología | Ventajas |	Desventajas
-----------|----------|------------
JDBC | Ofrece un rendimiento superior. Además, nos permite utilizar al máximo las funcionalidades concretas de nuestro servidor de base de datos | El desarrollo y mantenimiento de nuestras aplicaciones es mucho más costoso. Además, es muy fácil introducir errores durante el desarrollo.
Hibernate	| Podemos desarrrollar más rápidamente, y haciendo uso de entidades (objetos) en lugar de consultas. Es una gran ayuda en la fase de mantenimiento, y nos permite eliminar al 100% los errores de ejecución debido al acceso a bases de datos | Tiene una curva de aprendizaje mayor, y normalmente no conseguirá el mismo rendimiento que el acceso a base de datos de forma nativa.

#### 2.3.2 Hibernate vs MyBatis

Haciendo honor a la verdad, MyBatis (antes conocido como iBatis) no es un ORM, ya que no genera código SQL. Se trata más bien de un mapeador SQL, que nos permite asociar a un objeto a una tabla de nuestra base de datos mediante un descriptor en formato XML o usando anotaciones.

Algunas características comparadas podrían ser las siguientes.

MyBatis	| Hibernate
--------|----------
Es muy simple. El empaquetado ocupa poco espacio | Genera el SQL por nosotros, lo cual significa que no tenemos que invertir nuestro tiempo en hacerlo.
Es flexible, ofrece un tiempo de desarrollo muy rápido | Es altamente escalable, y ofrece una caché más avanzada.
Utiliza SQL, que si bien es un estándar, puede tener elementos concretos de un RDBMS | Utiliza HQL, que es más independiente del RDBMS utilizado. Es fácil cambiar de base de datos con Hibernate.
Mapea un ResultSet del API JDBC en nuestros objetos POJO, de forma que no debemos preocuparnos por las tablas relacionales. | Hibernate mapea nuestros objetos POJO en tablas de una base d edatos.
Es fácil usar procedimientos almacenados | Es algo dificultoso usar procedimiento almacenados.

### 2.4 Hibernate y JPA

Muchas personas que se han introducido en el mundo de la persistencia se preguntan: ¿no son Hibernate y JPA lo mismo? Realmente, la diferencia es mucha, ya que JPA es una especificación (inicialmente JSR 220; en la versión actual, la 2.1, el JSR 338) que carece de implementación. Hibernate, por contra, es un producto muy real, un framework con una serie de funcionalidades muy concretas.

Entonces, ¿qué relación tienen? Hibernate, a través de uno de sus módulos, proporciona una implementación la especificación JPA, de forma que podemos usar JPA como *interfaz*, sabiendo que por debajo, las operaciones con la base de datos se estarán realizando con Hibernate. De alguna manera, Hibernate es de facto la implementación de referencia de JPA.

La especificación JPA define lo siguiente:

* Una *facilidad* para especificar como nuestros objetos Java se relaciona con el esquema de una base de datos (a través de XML o de anotaciones).

* Una api sencillo para realizar las operaciones CRUD (*create, read, update, delete*), haciendo uso de un `javax.persistence.EntityManager`.

* Un lenguaje y un API para realizar consultas sobre los datos. El lenguaje, llamado JPQL (*Java Persistence Query Language*) se parece mucho a SQL.

* Como el motor de persistencia interacciona con las instancias transaccionales para buscar instancias *sucias*, captura de asociaciones u otras funciones de optimización.

Hibernate incluye, como parte de su código, toda la especificación JPA. Es decir, podemos usar Hibernate como *motor de persistencia* de JPA; sin embargo, incluye más funcionalidades que las que define la especificación.

A lo largo del curso las iremos descubriendo.

### 2.5 Hibernate con Maven

Si queremos trabajar con Hibernate, tenemos que incorporar a nuestro proyecto Java una serie de librerías, que se pueden descargar facilmente desde la web `http://hibernate.org/orm/downloads/`.
Sin embargo, el mantenimiento de estas librerías puede llevarnos al conocido como **infierno de los Jar**, ya que podemos tener algunos problemas:

* Incluir dos versiones diferentes de una misma biblioteca.

* Dos bibliotecas que están relacionadas entre sí, y de las que se incluyen versiones incompatibles.

* …

Por toda estas razones, entre otras, es razonable utilizar algún sistema que nos permita gestionar las dependencias de nuestro proyecto con librerías externas. En nuestro caso, usaremos Maven.

Utilizando Maven, nuestro proyecto tendrá un fichero, llamado `pom.xml` que, entre otros elementos, nos permitirá definir las librerías que necesitamos.

De esa forma, podremos añadir las dependencias de nuestras librerías. Estas pueden ser encontradas en la web del repositorio de Maven (https://mvnrepository.com/).

Alguna de las que usaremos durante el curso es la siguiente:

```xml
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-core</artifactId>
    <version>5.2.9.Final</version>
</dependency>
```

En cada uno de los proyectos de ejemplo indicaremos las librerías que necesitaremos.

## Preguntas

P= Mi consulta va respecto al último punto sobre Hibernate cuando dice "es algo difuso usar procedimientos almacenados". Qué pasaría si tengo un o varios procedimientos almacenados o funciones para "reportes especiales" a nivel de base de datos, en el cual se hacen varios "joins" con tablas o crea una tabla dinámica fruto de estas consultas. ¿Sería mejor invocar desde Hibernate o JPA al procedimiento almacenado o función? ¿Y si este cojunto de datos que retorna del procedimiento almacenado, corresponde mapearlo en un nuevo objeto? ¿Cómo Hibernate soluciona este escenario?.

R= Con ello me refería a que, a diferencia de otros elementos del estándar SQL, los procedimientos almacenados están fuertemente acoplados al sistema gestor de base de datos concreto que se utilice. No es lo mismo programar en PLSQL (Oracle) o en T-SQL (SQL Server).
Como premisa, cabe indicar que una función es un bloque de código que se puede usar en una sentencia SQL, y que recibe cero o más argumentos, devolviendo una salida. Frente a él, un procedimiento almacenado es un bloque de código que no se puede usar en una sentencia SQL y que recibe cero o más parámetros que pueden ser de entrada, de salida o de entrada-salida.
JPA tiene la interfaz `StoredProcedureQuery` que nos permite invocar procedimientos almacenados. Se pueden utilizar parámetros de salida de tipo `REF_CURSOR`, permitiendo así obtener un listado de resultados como salida de dicho procedimiento. Si al crear el procedimiento, se indica el tipo sobre el que se realiza la consulta (por ejemplo, con el método `entityManager.createdStoredProcedure`) (ver https://docs.oracle.com/javaee/7/api/javax/persistence/EntityManager.html#createStoredProcedureQuery-java.lang.String-java.lang.Class...-), el conjunto de resultados puede ser un `List<Tipo>` siendo `Tipo` el tipo de dato de la entidad que queremos utilizar. En otro caso, lo habitual es que sea un `List<Object[]>`.
  
P= Mi consulta va respecto al último punto sobre Hibernate cuando dice "es algo difuso usar procedimientos almacenados". Qué pasaría si tengo un o varios procedimientos almacenados o funciones para "reportes especiales" a nivel de base de datos, en el cual se hacen varios "joins" con tablas o crea una tabla dinámica fruto de estas consultas. ¿Sería mejor invocar desde Hibernate o JPA al procedimiento almacenado o función? ¿Y si este cojunto de datos que retorna del procedimiento almacenado, corresponde mapearlo en un nuevo objeto? ¿Cómo Hibernate soluciona este escenario?.

## Transcripción




# Contenido adicional 2   

[Introducción](pdfs/01_Introducción.pdf)

[Hibernate, más que un ORM](pdfs/02_Hibernate.pdf)
