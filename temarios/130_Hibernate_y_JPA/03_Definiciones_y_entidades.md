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

## Transcripción

<img src="images/8-01.png">

<img src="images/8-02.png">

<img src="images/8-03.png">

<img src="images/8-04.png">

<img src="images/8-05.png">

<img src="images/8-06.png">

<img src="images/8-07.png">

<img src="images/8-08.png">

<img src="images/8-09.png">

<img src="images/8-10.png">

<img src="images/8-11.png">

<img src="images/8-12.png">

<img src="images/8-13.png">

<img src="images/8-14.png">

<img src="images/8-15.png">

<img src="images/8-16.png">

<img src="images/8-15.png">

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
