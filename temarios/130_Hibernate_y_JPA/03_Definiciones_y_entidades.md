# 3. Definiciones y entidades 37m
   * 08 Entidades y su ciclo de vida 22:28 
   * 09 Mapeo con ficheros XML 14:45 
   * Contenido adicional 2
   
# 08 Entidades y su ciclo de vida 22:28 

[Entidades y su ciclo de vida](pdfs/06_Entidades_y_su_ciclo_de_vida.pdf)

## Resumen Profesor

### 6.1 Modelo de Dominio

Un modelo de dominio es una descripción de las diferentes *entidades*, atributos y relaciones asociados a un problema específico (**Modelo de dominio**).

Para representar este modelo, se suele utilizar un diagrama de clases UML, una herramienta potente que nos permite describir este tipo de modelos.

<img src="images/3-modelo-1.png">

Este tipo de diagramas, a la hora de definir nuestro problema (lo que en Ing. del Software se llama la **fase de análisis**), no representa ningún tipo de clase asociada a la solución del problema. **Básicamente, es la información que necesitamos persistir**. Serán las clases que el ORM debe transformar en filas de tablas de nuestra base de datos relacional, y las representaremos mediante clases POJO (Plain Old Java Object) o **JavaBeans**.

### 6.2 Valores y entidades

En Hibernate, una entidad será la representación de una clase del modelo. En cambio, un valor será la representación de un atributo de una clase.

Por ejemplo, si estuviéramos implementando una lista de contactos, el *Contacto* sería, con toda probabilidad, una entidad; y el *email* sería un valor de la misma.

#### 6.2.1 Valores

A diferencia de las entidades, no tienen un ciclo de vida propio, y existen tres categorías:

* Tipos básicos

* Tipos *embeddable*

* Tipos colección

#### 6.2.2 Entidades

Las entidades si tienen un ciclo de vida; además, por el hecho de tener un identificador único (en el campo de las RDBMS se llama clave primaria), existen independientemente de otros objetos. Esto no sucede con los valores.

##### Identidad e igualdad

*En Java, hay diferencia entre identidad e igualdad. Dos objetos tienen la misma identidad si la comparación con el operador == devuelve true; es decir, son dos referencias apuntando al mismo objeto en memoria.
Por otro lado, la igualdad, también llamada a veces equivalencia, hace referencia al método equals. Dos objetos son iguales si su estado (el valor de sus propiedades) es el mismo.
Las bases de datos relacionales complican este panorama. Dos objetos almacenados en una base de datos relacional son idénticos si están en la misma tabla y tienen la misma clave primaria (a esto se le llama identidad de base de datos).*

### 6.3 Mapeo de entidades con anotaciones

Para convertir una clase Java en una **entidad**, tan solo tenemos que hacer dos cosas:

* Anotarla con `@Entity`.

* Incluir un atributo que esté anotado con `@Id`.

```java
@Entity
public class MyEntity {

    @Id
    private long id;


    public long getId() {
        return id;
    }

}
```

Por defecto, esta entidad se mapea en la base de datos con una tabla llamada **MIENTIDAD**.

Como la anotación **@Id** es sobre un campo, por defecto, Hibernate habilitará por defecto todos los atributos de la clase como propiedades persistentes.

#### 6.3.1 Eligiendo la clave primaria.

Si bien en el mundo de los diseñadores de bases de datos relacionales ha existido siempre una serie de procesos formales para la determinación de dependencias entre atributos y el cálculo de las claves primarias, es una práctica habitual entre los desarrolladores el utilizar un valor numérico (entero y potencialmente grande), como en el ejemplo anterior (`long id`).

Además, para *tranquilidad* del programador, este valor puede ser autogenerado (por ejemplo, puede comenzar en 1, y asignar el siguiente valor a cada *fila* insertada).

Añadiendo la anotación `@GeneratedValue` a continuación de `@Id`, JPA asume que se va a generar un valor y a asignar el mismo antes de almacenar la instancia de la entidad. Existen diferentes estrategias de asignación:

* `GenerationType.AUTO`: Hiberante escoge la mejor estrategia en función del dialecto SQL configurado (es decir, dependiendo del RDBMS).

* `GenerationType.SEQUENCE`: Espera usar una secuencia SQL para generar los valores.

* `GenerationType.IDENTITY`: Hibernate utiliza una columna especial, autonumérica.

* `GenerationType.TABLE`: Hibernate usa una tabla extra en nuestra base de datos. Tiene una fila por cada tipo de entidad diferente, y almacena el siguiente valor a utilizar.

##### Generación de los ID antes o después de la inserción

*Normalmente, un ORM optimizará las inserciones en una base de datos, agrupándolas por lotes. Esto supone que, en la realidad, es posible que no se realice la inserción al llamar al método `entityManager.persist(someEntity)`. Si esperamos a generar el ID a insertar los datos tiene como inconveniente que si llamamos a `someEntity.getId()`, obtendremos nulo. Por tanto, suele ser buena estrategia generar el ID antes de insertar, por ejemplo a través de una secuencia. Las columnas autoincrementales, los valores por defecto o las claves generadas por un trigger solo están disponibles después de la inserción.*

#### 6.3.2 Control de nombres

Por defecto, Hibernate toma una *estrategia de generación de nombres* para transformar el nombre de una clase (que en Java normalmente estará escrita en notación **UpperCamelCase**) al nombre de una tabla (por defecto, suele usar el mismo nombre en MAYÚSCULAS).

Se puede controlar el nombre de la tabla a través de la anotación `@Table(name= "NEWNAME")`.

```java
@Entity
@Table(name= "MY_ENT")
public class MyEntity {

    @Id
    private long id;


    public long getId() {
        return id;
    }

}
```

### 6.4 Mapeo de valores

Cuando mapeamos una entidad, todos sus atributos son considerados persistentes por defecto. Las reglas por defecto son:

* Si la propiedad es un tipo primitivo, un envoltorio de un tipo primitivo (`Integer`, `Double`, …), `String, BigInteger, BigDecimal, java.util.Date, java.util.Calendar, java.sql.Date, java.sql .Time, java.sql.Timestamp, byte[], Byte[], char[],` o `Character[]` se persiste automáticamente con el tipo de dato SQL adecuado.

* Si es `java.io.Serializable`, se almacena con su representación serializada (esto no será lo que habitualmente deseemos).

* Si usamos `@Embeddable` (lo estudiaremos después), también lo persiste.

En otro caso, *lanzará un error en la inicialización*. Hibernate escoge, dependiendo del dialecto configurado, la mejor correspondencia de tipos de dato en el RDBMS para los tipos Java que hayamos usado.

#### 6.4.1 Anotación `@Column`

Esta anotación, sobre una propiedad, nos permitirá indicar algunas propiedades, entre las que se encuentran:

* `nullable`: nos permite indicar si la columna mapeada puede o no almacenar valores nulos. En la práctica, es como marcar el campo como requerido.

* `name`: permite modificar el nombre por defecto que tendrá la columna mapeada.

* `insertable`, `updatable`: podemos modificar si la entidad upede ser insertada, modificada, …

* `length`: nos permite definir el número de caracteres de la columna.

*¿Dónde anotar? ¿En las propiedades o en los getter?
Hibernate nos permite definir las anotaciones (`@Id`, `@Column`, …) tanto sobre las propiedades como sobre los métodos getter (**nunca sobre los setter**). La pauta la marca la anotación `@Id`. Allá donde usemos esta anotación, marcaremos la estrategia a seguir.

#### 6.4.2 Tipos temporales

Los tipos de datos temporales, de fecha y hora, tienen un tratamiento algo especial en Hibernate. Para un campo que contiene este tipo de información, se añade la propiedad `@Temporal`.

Esta anotación la podemos usar con los tipos `java.util.Date`, `java.util.Calendar`, `java.sql.Date`, `java.sql.Time`, `java.util.Timestamp`. Hibernate también soporta los nuevos tipo de `java.time` disponibles en el JDK 8.

Como propiedad, podemos indicar que tipo de dato temporal vamos a querer usar a través del atributo TemporalType, teniendo disponibles `DATE`, `TIME`, `TIMESTAMP`.

```java
@Entity
@Table(name= "MY_ENT")
public class MyEntity {

    @Id
    private long id;

  @Temporal(TemporalType.TIMESTAMP)
  private Date createdOn;

  //...

}
```

*Hibernate utiliza por defecto `TemporalType.TIMESTAMP` si no encuentra una anotación `@Temporal` sobre alguno de los tipos de datos definidos más arriba.*

### 6.5 Tipos embebidos

En ocasiones, nos puede interesar tratar un grupo de atributos como si fueran uno solo. Un ejemplo clásico suele ser la dirección (nombre de la vía, número, código postal, …). Para este tipo de situaciones tenemos la posibilidad de covertir una clases en `Embeddable`. Veamoslo con un ejemplo:

```java
@Embeddable
public class Direccion {

  @Column(nullable=false)
  private String via;

  @Column(nullable=false, length = 5)
  private String codigoPostal;

  @Column(nullable=false)
  private String poblacion;

  @Column(nullable=false)
  private String provincia;

  //...


}
```

```java
@Entity
@Table(name="USERCONEMBEDD")
public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;

    private String name;

  @Temporal(TemporalType.DATE)
    private Date birthDate;

  private Direccion address;

    //...
}
```

De esta forma, Hibernate detecta que el campo `Direccion` es una clase `Embeddable`, y mapea las columnas a la tabla `USER`.

#### 6.5.1 Sobrescritura con @Embedded

¿Qué pasaría si quisiéramos añadir dos direcciones a un usuario? Hibernate nos lanzará un error, indicando que no se soportan columnas con nombre repetido.

La solución la podemos aportar sobrescribiendo los atributos de la clase embebida, para que tengan otro nombre (o incluso otras propiedades)

```java
@Entity
@Table(name="USERCONEMBEDD")
public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;

  //Otros atributos

    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "via", column = @Column(name="VIA_FACTURACION")),
        @AttributeOverride(name = "codigoPostal", column = @Column(name="CODIGOPOSTAL_FACTURACION", length=5)),
        @AttributeOverride(name = "poblacion", column = @Column(name="POBLACION_FACTURACION")),
        @AttributeOverride(name = "provincia", column = @Column(name="PROVINCIA_FACTURACION"))

    })
    private Direccion billingAddress;


  //...
```

La anotación `@Embedded` es util cuando queremos mapear otras clases. El atributo `@AttributeOverrides` selecciona las propiedades que serán sobrescritas. El atributo `@AttributeOverride` indica el cambio que va a haber en un determinado atributo.

### 6.6 Ciclo de vida de una entidades

Si bien profundizaremos sobre este apartado en lecciones posteriores, no está de más que vayamos conociendo los diferentes estados en los que se puede encontrar una entidad JPA.

* `transient` (nueva): la entidad acaba de ser creada (posiblemente con el operador `new`) y aun no está asociada al contexto de persistencia. No tiene representación en la base de datos.

* `managed`, `persistent`: la entidad tiene un identificador y está asociada al contexto de persistencia. Puede estar almacenada en la base de datos, o aun no.

* `detached`: la entidad tiene un identificador, pero no está asociada al contexto de persistencia (normalmente), porque hemos cerrado el contexto de persistencia.

* `removed`: la entidad tiene un identificador y está asociada al contexto de persistencia, pero este tiene programada su eliminación.

<img src="images/3-diagrama.jpg">

## Preguntas

P= Me salta este error al correr el la clase App

```sh
Exception in thread "main" javax.persistence.PersistenceException: [PersistenceUnit: HibernateJPAGeneracionId] Unable to build Hibernate SessionFactory
at org.hibernate.jpa.boot.internal.EntityManagerFactoryBuilderImpl.persistenceException(EntityManagerFactoryBuilderImpl.java:1225)
at org.hibernate.jpa.boot.internal.EntityManagerFactoryBuilderImpl.access$600(EntityManagerFactoryBuilderImpl.java:119)
```

R= No he entendido bien en tu mensaje si has modificado el código o no. Si te puedo decir que no todos los dialectos (es decir, no todos los sistemas gestores de bases de datos) tienen porqué soportar todos los tipos de estrategias de generación de claves primarias. A no ser que queramos escoger una forma concreta por alguna cuestión de eficiencia o circunstancia del proyecto, se suele indicar la estrategia Auto; al hacerlo, Hibernate escoge, en función del dialecto, la mejor estrategia para ese sistema gestor.

P= Al momento de modelar el dominio de la aplicación, he visto en varios tutoriales y sistemas que el atributo "Id" lo representan de varias formas: int, long, Integer, Long. Igualmente para valores como: edad, precio, importeTotal, o atributos contables algunos hacen uso del tipo de valor primitivo y otros invocan a un objeto (double o Double). Una vez tuve la oportunidad de preguntarle por qué lo definia de tal manera y me respondia que por ejemplo para un "Id" de tipo Integer lo pueden asignar como "null" en caso inicialice un objeto y eso no se puede hacer con el "int" Mi pregunta es:

¿Cuál es la forma correcta de utilizar para el modelo del dominio definirlos con un tipo primitivo o con su equivalente en clases (Integer, Long, Double)?
¿Definirlo de una u otra forma afecta el rendimiento o alguna buena práctica en el desarrollo del código?

R= Tu pregunta es buena, y por desgracia no tiene una única respuesta, ya que en el fondo depende del problema a resolver. Podemos tener en cuenta algunas consideraciones:

* El uso de los tipos primitivos es francamente cómodo, y posiblemente (esto tendría que estudiarlo con mayor detenimiento), a nivel de Java tenga mejor rendimiento.
* El uso de un tipo primitivo y su correspondiente wrapper produce un DDL casi idéntico (en caso de que deleguemos en JPA/Hibernate la generación del esquema de base de datos). Así, que en ese sentido, el rendimiento es el mismo. Si es verdad que tendríamos severas diferencias si la columna que estamos mapeando soporta valores nulos o no.
* El uso de tipos primitivos estaría indicado: cuando no queremos dar la posibilidad de valor nulo o cuando vamos a realizar una gran cantidad de operaciones matemáticas con esos valores (como te digo, en principio tienen mejor rendimiento, aunque tendría que estudiar con detenimiento el factor de comparación entre ambos).
* El uso de los tipos envoltorio (wrappers) estaría indicado: si queremos permitir el uso de nulo, si vamos a utilizar colleciones, como tipo de retorno de métodos que, de vez en cuando, pueden devolver nulo, etc...

Por tanto, la única conclusión que a mi modo de ver podríamos sacar, es que la si la columna no va a soportar nulos, no hay inconveniente en usar tipos primitivos; y si va a soportar nulos, sería bueno usar las clases envoltorio.

P= Tengo algunas consultas para hibernate y el uso de algunos comando:
1. la opcion que ponemos Hbm2ddl.auto: Create. En produccion que valor debe tener o si se debe de usar?.
2. los campos Id s pueden generar con numeros y letras por ejemplo para el cliente seria: C00001

R= Te respondo:

1. En producción no usaría la opción Hbm2ddl.auto; vamos, la pondría a none. Aunque parezca mentira, lo ideal sería llevar esa gestión por nuestra cuenta, o bien a través de algún sistema como Flyway o Liquibase, que nos permiten que nuestra base de datos vaya "evolucionando", y replicar estos cambios en diferentes entornos (desarrollo, pruebas, preproducción, producción, ...). En todo caso, si se quiere usar, la opción sería update, que mantiene los datos que haya en la base de datos ya añade los cambios necesarios al DDL.
2. Sí que se podría, pero tendrías que implementar tú el generador para hacerlo a nivel de base de datos, posiblemente a través de un procedimiento almacenado. La manera más fácil, creo yo, sería utilizar java.util.UUID como tipo de dato, y utilizar la generación automática de valores.

## Transcripción

<img src="images/8-01.png">

En este capítulo el número cuatro vamos a hablar sobre Modelo de Dominio, sobre las Entidades, sobre su Ciclo de Vida y dejaremos para la siguiente lección de este capítulo como definir las entidades, el mapeo a través XML. Por que en este capítulo lo haremos a través de anotaciones. 

<img src="images/8-02.png">

Primero vamos a hablar de modelo de dominio a qué podemos llamar o que se conoce como Modelo de Dominio.

<img src="images/8-03.png">

Bien pues el modelo de dominio en un sistema software representa el problema que estamos tratando de resolver, representa al sistema en si, aquí tenemos un ejemplo sacado de la wikipedia de modelo de dominio donde tendríamos un sistema de una empresa de seguros y dónde tendríamos la representación de todas las clases y las asociaciones, por facilidad, por limpiar un poco el diseño, no han incluido los atributos que intervienen en el mundo de los seguros, bien a esa representación normalmente en un diagrama de clase UML de las clases y de las asociaciones existentes entre ellas incluyendo los atributos se le conoce como el *Modelo de Dominio* son dos los objetos con los que nosotros trabajaremos dentro de nuestro sistema.

<img src="images/8-04.png">

Normalmente dentro del desarrollo de software existen cuatro grandes fases en el desarrollo, las metodología Agiles vinieron a cambiar un poco este esquema más clasico pero para entender el Modelo de Dominio nos viene bien. 

Estas grande fases son:

* Análisis
* Diseño
* Implementación
* Mantenimiento

En la fase de análisis normalmente intentamos buscar que problema es el que vamos a resolver haciendo la aplicación que estamos desarrollando.

En la fase de diseño una vez que hemos entendido bien qué problema estamos resolviendo y la vez que lo hemos definido y acotado tratamos de buscar la mejor solución, la diseñamos y buscamos la mejor solución para este problema.

En la implementación lo que hacemos es la resolución directa de ese problema a través de un sistema informatico.

Y en la de mantenimiento lo que nos dedicamos es a corregir posibles errores que surgen, a evolucionar el Software esto sucede muy a menudo a software que acompañan 
elementos legislativos por ejemplo en gestión de empresas, en educación, sí nuestro software implementa algún determinado proceso marcado en la ley y la ley cambia al respecto tendremos que modificar nuestro sistema, no porque no funcione bien sino porque el cambio legal nos lo exige.

En la fase de análisis que es donde definimos qué problemas vamos a resolver es donde mediante, ya digo normalmente un diagrama de clases UML, tendremos que marcar nuestro modelo de dominio.

<img src="images/8-05.png">

Dentro de el vamos a hablar de dos elementos distintos, a la hora de construir nuestra identidad es con JPA y Hibernate tenemos que diferenciar entre lo que es un valor y una entidad, podríamos decir que una entidad será una cantidad de información que va a tener un ciclo de vida dentro de nuestro modelo de dominio, frente a un valor que normalmente pues sera un dato que por sí mismo no tenga ese ese ciclo de vida.

<img src="images/8-06.png">

Normalmente lo solemos asociar a que las entidades pues se aparejarán de alguna manera, no tiene porqué ser esta asociación uno a uno, se aparejarán a las clases que incluyamos dentro de nuestro modelo de dominio, aunque ya digo luego veremos cómo podemos tratar algunas clases de una manera especial y Hibernate JPA mapearan esa entidad con normalmente una tabla, dentro de nuestra base de datos relacional y un valor normalmente será una propiedad de una clase aquella que hayamos marcado como entidad y que normalmente se transforma como una columna de esa tabla, para un objeto en particular, una instancia de la entidad sería una fila de la tabla y una propiedad de esa instancia sería el cruce de la fila y la columna correspondiente.

<img src="images/8-07.png">

Dentro de los valores encontramos valores de tipo básico, que serán los que trabajemos sobre todo en este tema, junto con los de tipo *embebido embeddable*  y dejaremos para más adelante los de tipo colección y como decimos con las entidades que vamos a trabajar ahora también ahora qué tienen un ciclo de vida en sí mismo a diferencia de los valores.

<img src="images/8-08.png">

Como podemos nosotros mismos mapear una entidad para transformar una clase Java en una entidad de JPA y que por debajo Hibernate se haga cargo de confrontar esa entidad con la base de datos.

<img src="images/8-09.png">

Para empezar lo primero que es necesario antes de entrar en materia es diferencia entre *Identidad*, *Igualdad* e *Identidad a nivel de Base de Datos* porque va a ser necesario para que lo manejemos, una entidad va a tener que ser identificada por fuerza, esto viene por el modelo que estamos utilizando el modelo relacional en el que todas las tablas deberían tener una clave primaria, esa clave primaria no es más que un atributo, o conjunto de atributo que nos permiten diferenciar una fila de la otra y que de alguna manera lo identifica. 

En JPA todas las entidades van a tener un identificador y no es lo mismo identidad que igualdad incluso la identidad a nivel Java y a nivel de base de datos. La identidad en Java nos permite decir que dos objetos son el mismo cuando al compararlos con un "==" esa comparación nos devuelve `true` es decir son la misma representación en memoria de un objeto sin embargo, dos objetos que sean iguales no tienen porqué ser idénticos, la igualdad en Java esta asociada a la comparación con `equals()` también se suele llamar equivalencia y quiere decir que una a una todas sus propiedades son equivalentes es decir que tienen el mismo valor, sin embargo pueden ser objetos distintos en memoria.

A nivel de base de datos dos objetos es decir serán dos filas, serán idénticas utilizando su PRIMARY KEY su clave primaria porque será idéntico cuando estén en la misma tabla y tengan el mismo valor de clave primaria.

<img src="images/8-10.png">

Para definir una entidad como mínimo ya sabiendo que además la tenemos que identificar, si vamos a usar anotaciones, tenemos que usar como mínimo dos anotaciones la primera es `@Entity` sobre el nombre de la clase nos permitirá decir que esa clase será gestionada dentro del contexto de persistencia de nuestra aplicación, al menos uno de ellos, ya veremos que se pueden definir más de uno, pero por lo menos en el que tengamos definido. Al anotar la clase con `@Entity` nos obliga por fuerza a que tengamos una propiedad anotada con `@Id`, podemos hacer las anotaciones a nivel de propiedad o a nivel de método getter nunca de setter, allá donde anotemos con la anotación `@Id` marcará la tónica que vamos a seguir, si anotamos sobre una propiedad  Hibernate se encargará de trabajar con las propiedades y si marcamos `@Id` sobre un método getter trabajara con los métodos getter en lugar de las propiedades.

Antes de continuar vamos a ver un ejemplo de Mapeo.

Aquí tenemos una Entidad User.

```java
package com.openwebinars.hibernate.mapeocolumnas;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ANOTHER_USER")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	@Column(name="USERNAME")
	private String name;
	
	
	@Temporal(TemporalType.DATE)
	private Date birthDate;

	
	public long getId() {
		return id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Date getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}


}
```

Está mapeada y que tiene `@Entity` y `@Id` tiene también algunas anotaciones que vamos a ver en esta misma lección más adelante.

<img src="images/8-11.png">

Sobre la elección del Identificador aquí existe siempre un debate, porque los diseñadores más clásicos de base de datos conocen metodología específica a través de las dependencias funcionales existentes dentro de una relación de una tabla y son capaces de aplicar métodos formales del calculo de clave candidata y de clave primaria sin embargo entre los desarrolladores es habitual el usar un campo artificial es decir uno que no está asociado al modelo que suele tener casi siempre el mismo nombre, se suele llamar *id* que suele ser de tipo entero un `long` y mediante un número que va a ser muy facil diferenciarlo de otro número es muy fácil identificar.

JPA a través de la anotación `@GeneratedValue` nos permite generar automáticamente, descargando al programador, como hemos hecho nosotros en los proyectos anteriores que lo hemos asignado estaticamente o lo hemos inventado algún método aleatorio bueno pues JPA se puede encargar de generarlo utilizando alguna estrategia. En particular tenemos cuatro:

* AUTO 
* SEQUENCE
* IDENTITY
* TABLE

La estrategia SEQUENCE nos permite utilizar una secuencia que un objeto a nivel de base de datos que va devolviendo valores desde un valor inicial y con un incremento que nosotros marquemos.


IDENTITY que lo que hace es utilizar para que ellas base de datos que permiten un campo de tipo autonumerico.

Y la estrategia TABLE que se utiliza una tabla extra especial que normalmente tiene una sola columna y una fila por cada tabla o mejor dicho entidad que tengamos definida con generación de valor por tabla y que almacena en ese único valor el siguiente Id qué va a necesitar.

La estrategia AUTO en función del dialecto que tengamos seleccionado escoge cuál es la mejor de ella para cada uno de los sistemas gestores de base de datos que Hibernate tiene posibilidad de manejar. 

Todo a través de `@GeneratedValue`.

Si vemos en el mismo ejemplo de antes 

```java
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private long id;

```

tenemos que el valor de `id` que es de tipo `long` será generado con la mejor estrategia según la marque el dialecto, en particular para MySQL5InnoDB suele utilizar la estrategia de TABLE.

<img src="images/8-12.png">

Sobre cómo controlar los nombres podemos cambiar el nombre que por defecto utiliza Hibernate para generar la tabla, si tenemos la propiedad h2ddl-auto en create o update  o alguno de los valores asociados Hibernate se encarga de crear la tabla si se llama `MyEntity` utilizara el mismo nombre sin embargo, con la anotación `@Table` y la propiedad `name` podemos cambiar nosotros el nombre de la tabla que se generará o la cual va a buscar en la base de datos a la hora de mapear esta entidad. 

Esa también la tenemos dentro del ejemplo, aunque la clase se llama `User` vamos a crear una nueva tabla que se llama `ANOTHER_USER`.

```java
@Entity
@Table(name="ANOTHER_USER")
public class User {
   ...
```

<img src="images/8-13.png">

<img src="images/8-14.png">

A la hora de mapear valores hemos visto que no tenemos por qué anotar de ninguna manera los valores, solamente el `id` ya que Hibernate se va a encargar de buscar las distintas propiedades que tengan estos tipos que tenemos en pantalla para anotarlo.
En principio buscara tipos básicos Java `int`, `long`, `double`, `float`, los envoltorios de esos tipos básicos con mayúsculas como se suelen conocer y alguna de las clases que tenemos en la diapositiva String, BigInteger, BigDecimal, etcétera.  También aquellas clases que implementen serializable si viene el comportamiento no será el que nosotros esperemos porque lo que almacenará seran las representaciones bytes y los tipos embebidos que hablaremos de ellos más tarde.

Si Hibernate encuentra algún tipo de dato que no es alguno de estos y no tiene la anotación adecuada generará un error a la hora de cargar ese contexto de persistencia con lo cual si queremos mapear algo como un valor lo tenemos que hacer a través de alguno de estos tipos que tenemos en la diapositiva.

<img src="images/8-15.png">

La anotacion `@Column` que ya hemos dicho que no es obligatoria pero si nos permite definir algunas propiedades en particular la más usual es la propiedad `name` nos permite cambiar el nombre que tendrá esa propiedad como columna en la base de datos. Pero también nos permite indicar el tamaño que será el que tenga el campo en la base de datos te viene bien para cadena de caracteres, para número, etcétera. La propiedad `nullable` que si es `true` permite almacenar nulos dentro de ese valor o la propiedad insertable y updatable que define si puede ser insertada o no o actualizada o no. Esto en determinados contextos ya veremos que resulta bastante util.

<img src="images/8-16.png">

Y con respecto a los tipos de datos temporales, decir que para las fechas Hibernate nos da un poco de soporte, ya que el tratamiento no es exactamente el mismo que con un atributo normal con la anotación `@Temporal` podemos indicar que un determinado atributo será un tipo de dato temporal, nos permite gestionar los clásicos `Date` tanto de `util` como de `sql`, `Timestamp`, `Time`, `Calendar` y también los tipos nuevos que hay dentro de la `java.time` de Java 8. Esta anotación nos permite almacenar en la base de datos los datos de tres maneras distintas como DATE, TIME y TIMESTAMP, que es lo que tenemos en el ejemplo.

Vamos a ver el ejemplo en funcionamiento.

Tenemos `persistence.xml`.

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.1" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd">
	<persistence-unit name="PrimerEjemploHibernateJPA" transaction-type="RESOURCE_LOCAL">
		<class>com.openwebinars.hibernate.mapeocolumnas.User</class>
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

Tenemos el `pom.xml`.

```html
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.openwebinars.hibernate</groupId>
	<artifactId>130-04-PrimerProyectoHibernateJPAMapeoColumnas</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<name>130-04-PrimerProyectoHibernateJPAMapeoColumnas</name>
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

Como ya hemos visto tenemos la clase `User`.

*`User`*

```java
package com.openwebinars.hibernate.mapeocolumnas;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ANOTHER_USER")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	@Column(name="USERNAME")
	private String name;
	
	
	@Temporal(TemporalType.DATE)
	private Date birthDate;

	
	public long getId() {
		return id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Date getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}


}
```

Tiene un campo `name` pero en la base de datos se llamará `USERNAME`, le hemos añadido un dato temporal `birthDate` que es del tipo `java.util.date` pero que hemos anotado como `@Temporal(TemporalType.DATE)` y que se almacenará en la base de datos como `DATE`.

Tenemos nuestra clase de aplicación `App` seguimos la línea que marcamos en el capitulo 3 en los proyectos de JPA.

*`App.java`*

```java
package com.openwebinars.hibernate.mapeocolumnas;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Entidades y mapeo de atributos
 * www.openwebinars.net
 * @LuisMLopezMag
 */
public class App {
	public static void main(String[] args) {
		
		//Configuramos el EMF a través de la unidad de persistencia
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("MapeoColumnas");

		//Generamos un EntityManager
		EntityManager em = emf.createEntityManager();

		//Iniciamos una transacción
		em.getTransaction().begin();

		//Obtenemos el Calendar con el que gestionaremos las fechas
		Calendar calendar = Calendar.getInstance();

		// Construimos un objeto de tipo User
		User user1 = new User();
		user1.setName("Pepe");
		
		calendar.set(1982, 9, 18);
		user1.setBirthDate(calendar.getTime());

		// Construimos otro objeto de tipo User
		User user2 = new User();
		user2.setName("Juan");
		calendar.set(1990, 5, 20);
		user2.setBirthDate(calendar.getTime());
		
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

Creamos nuestro `EntityManagerFactory`, a partir de allí a partir de ahí creamos nuestro `EntityManager` iniciamos una transacción y simplemente vamos a crear dos usuarios el primer usuario Pepe y Juan y a través de un calendar vamos a obtener las fechas de nacimiento, observemos que los meses comienzan en 0.

Si ejecutamos vemos que Hibernate ha hecho algún trabajo duro, ha borrado la tabla si existe, también ha borrado una tabla que utiliza como hemos dicho antes para generar los valores, la vuelve a crear, ha vuelto a crear la tabla especial, a utilizado esa tabla para obtener los nuevos valores que tiene que insertar.

```java

```


y si miramos en Workbeanch podemos ver que tenemos las tablas `another_user`  

los meses son distintos porque bueno calendar funciona de una manera diferente empezar a contar en cero si quisiéramos que realmente fuera septiembre sería el 8 mayo almacenado store ahora vamos a vernos tipo en bebidos y los ciclos de vida de los posibles valores ciclo de vida de las entidades los tipos de medido nos permiten insertar una clase dentro de otra si bien el traslado va a ser bueno pues a una sola tabla vale los tipos que quedamos marcar cómo medir los tendrán que llevar la anotación en verdad vale y bien solamente tendremos que hacer referencia a este objeto dentro de la clase de la queremos en beber la clase no es una entidad pero si es verdad que la podremos trabajar como un objeto no tenemos que preocuparnos de matarlo como otra entidad con su respectiva asociaciones la dificultad estriba en si queremos añadir más de uno por ejemplo la dirección de vivienda y la dirección de facturación online como una incidente vida porque tendríamos el nombre de atributo repetidos aunque hibernate es capaz de proporcionar algún tipo de mecanismo para que nos podamos saltar ese problema y lo podemos solventar tenemos usuarios con direcciones la dirección y en los usuarios aunque hemos embebido a través del atributo perdón del anotación atributo de raids podemos marcar que sobreescriba las el nombre de una clase que estamos viviendo por otro de manera que hay crearse en la base de datos tendrá nombre diferente y nosotros saltaremos ese problema y podremos tener dos direcciones la dirección normal y la dirección de facturación vale dentro de si bien nosotros solamente tenemos la entidad y dirección y está guardando las dos direcciones con los nombres de campo distintos aunque los próximos capítulos hablaremos más sobre contexto de persistencia unidad de persistencia si le sacará ahora el ciclo de vida de la entidad para que no nos perdamos en las próximas lecciones una entidad puede pasar por estos distintos estados y los distintos métodos de la clase EntityManager nos sirven para cambiar una entidad de un estado la entidad puede pasar del estado no existe al cual podemos llegar porque no hay nadapor por el contexto de persistencia la podemos separar vale ya veremos que sí que en determinadas causas por ejemplo limpiarla queen las próximas lecciones lo que hablaremos será de las asociaciones entre entidades para ir poco a poco creando aplicaciones más




<img src="images/8-13.png">

<img src="images/8-14.png">

<img src="images/8-15.png">

<img src="images/8-16.png">

<img src="images/8-17.png">

<img src="images/8-18.png">

<img src="images/8-19.png">

<img src="images/8-20.png">

<img src="images/8-21.png">

# 09 Mapeo con ficheros XML 14:45 

[Mapeo con ficheros XML](pdfs/07_Mapeo_con_ficheros_XML.pdf)

## Resumen Profesor

En el origen de los ORMs, no existía la posibilidad, como hemos visto en las lecciones anteriores, de mapear las clases de nuestro modelo mediante anotaciones. Esta tarea se realizaba mediante descriptores de ficheros XML. Estos deben incluir toda la información sobre cómo se llamará la tabla, los atributos que incluye, el atributo identificador. Hibernate tiene, de forma nativa, su tipología de ficheros XML, y JPA tiene otro. Veamos una introducción a ambos.

### 7.2 Mapeo con ficheros XML Hibernate (hbm.xml)

Cuando utilizamos XML para mapear nuestras clases debemos crear (normalmente) un fichero XML por cada clase que queramos mapear. Este fichero estará en el mismo paquete de la clase a persistir, o bien junto al fichero hibernate.cfg.xml.

Las Hibernate (JBoss) Tools que instalamos en lecciones anteriores nos facilitarán el trabajo. Tomaremos como punto de partida una copia del proyecto de ejemplo del **Primer proyecto**. La clase a persistir sería la siguiente:

```java
public class User {

    private int id;

    private String userName;

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

Si ahora pulsamos con el botón derecho sobre el proyecto > *New > Others > Hibernate > Hibernate XML Mapping file
(hbm.xml).*

Agregamos la clase `User`.

<img src="images/3-user.jpeg">

Y si queremos podemos pulsar sobre finalizar.

Por defecto, eclipse genera el fichero junto con el `.java`. Nosotros lo moveremos junto con el fichero `hibernate.cfg.xml`.

Si consultamos el fichero, Hiberante se ha encargado (por nosotros) de generar el esqueleto del fichero XML.

```xml
<hibernate-mapping>
    <class name="com.openwebinars.hibernate.hibernatexml.User" table="USER">
        <id name="id" type="int">
            <column name="ID" />
            <generator class="assigned" />
        </id>
        <property name="userName" type="java.lang.String">
            <column name="USERNAME" />
        </property>
        <property name="userMessage" type="java.lang.String">
            <column name="USERMESSAGE" />
        </property>
    </class>
</hibernate-mapping>
```

En el fichero de configuración de hibernate, añadimos un elemento `<mapping resource="..." />`, donde el valor del atributo será la ruta hacia el fichero.

### 7.3 Mapeo con ficheros XML JPA (orm.xml)

JPA especifica un mecanismo ligeramente diferente para realizar el mapeo de las entidades mediante XML.

Nos basaremos en el proyecto de ejemplo Primer proyecto JPA. En este caso, podemos añadir el fichero `orm.xml` a través del asistente de eclipse. Pulsamos sobre el proyecto con el botón derecho > *New* > *JPA ORM Mapping file*, y lo situamos junto al fichero de la unidad de persistencia (carpeta META-INF).

Antes de continuar, nos vamos a la unidad de persistencia, y añadimos el fichero `orm.xml`

<img src="images/3-general.jpeg">

*Añadir a la unidad de persistencia el fichero orm.xml*

Si pasamos a editar el fichero de mapeo, tenemos dos posibilidades:

* Conocer las etiquetas XML necesarias, con sus atributos y su estructura.

* Aprovecharnos de un pequeño ayudante que nos propone eclipse a través del facet JPA.

Al editar el fichero `orm.xml` nos debería aparecer a la derecha una pequeña ventana llamada **JPA Structure** (si no aparece, la podeos visualizar a través de *Window > Show view*).

A través de él, podemos ir añadiendo las etiquetas necesarias para mapear la entidad y sus atributos.

<img src="images/3-asistente.jpg">

*Asistente de JPA*

La versión (equivalente al ejemplo de hibernate) del fichero sería la siguiente:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<entity-mappings version="2.1"
    xmlns="http://xmlns.jcp.org/xml/ns/persistence/orm" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence/orm http://xmlns.jcp.org/xml/ns/persistence/orm_2_1.xsd">
    <entity class="com.openwebinars.hibernate.hibernatejpaxml.User">
        <table name="USERHBNXML" />
        <attributes>
            <id name="id">
            </id>
            <basic name="userName">
            </basic>
            <basic name="userMessage">
            </basic>
        </attributes>
    </entity>

</entity-mappings>
```
## Preguntas

P= Al configurar el mapeo en el XML me saltaba un error a la hora de parsear el XML. He sustituido los elementos class por elementos type quedando así :

```html
<hibernate-mapping>
    <class name="com.openwebinars.hibernate.hibernatexml.User" table="User">
        <id name="id" type="int">
            <column name="ID" />
            <generator class="assigned" />
        </id>
        <property name="userName" type="java.lang.String">
            <column name="USERNAME" />
        </property>
        <property name="userMessage" type ="java.lang.String">
            <column name="USERMESSAGE" />
        </property>
    </class>
</hibernate-mapping>
```

¿A qué se puede deber?

R= ¿Te indica algún error en concreto?

P=Esto esta super desactualizado, ahora ya no se mapea con ficheros XML porque se puede hacer de forma muy sencilla con las java anotattions.
Por favor actualizar los cursos!!

R= Efectivamente, no creo que nadie utilice en proyectos nuevos este tipo de mapeo. Por ello, no es el que se usa principalmente a lo largo del curso.

Este tipo de mapeo se explica, en primer lugar, para saber que existe; y en segundo lugar, por si alguna vez trabajáis en algún proyecto con código heredado, algo que es más habitual de lo que parece.

R=Eso lo entiendo, y esta bien una explicación de la configuración de los xml para saber como funciona. Pero vais a subir un curso tanto de spring como hibernate actualizados? tener en cuenta que son los frameworks mas utilizados en desarrollo java y hay empresas en las que no tenemos ya ni un solo proyecto con xml...
Muchas gracias!

R= De Spring hay publicados algunos cursos que utilizan la versión 5.X:

Curso de Spring Boot y Spring Web MVC
Curso de Desarrollo de una API REST con Spring Boot
Curso de Elementos avanzados en tu API REST con Spring Boot
Curso de Seguridad en tu API REST con Spring Boot.
Por ser también adyacentes, también tienes los cursos de Introducción a Thymeleaf y Thymeleaf intermedio.

Un saludo.


## Transcripción

<img src="images/9-01.png">

<img src="images/9-02.png">

<img src="images/9-03.png">

<img src="images/9-04.png">

<img src="images/9-05.png">

<img src="images/9-06.png">

<img src="images/9-07.png">

# Contenido adicional 2  

[Entidades y su ciclo de vida](pdfs/06_Entidades_y_su_ciclo_de_vida.pdf)

[Mapeo con ficheros XML](pdfs/07_Mapeo_con_ficheros_XML.pdf)
