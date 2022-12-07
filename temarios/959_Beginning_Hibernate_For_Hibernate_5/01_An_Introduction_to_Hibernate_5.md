# Chapter 1: An Introduction to Hibernate 5
* Plain Old Java Objects (POJOs)
* Origins of Hibernate and Object/Relational Mapping
* Hibernate as a Persistence Solution
* A Hibernate Hello World Example
* Mappings
* Persisting an Object
* Summary

Los proyectos de desarrollo más importantes involucran una base de datos relacional.<sup>1</sup> El pilar de la mayoría de las aplicaciones comerciales es el almacenamiento a gran escala de información ordenada, como catálogos, listas de clientes, detalles de contratos, texto publicado y diseños arquitectónicos.

Con la llegada de la World Wide Web, la demanda de bases de datos ha aumentado. Aunque no lo sepan, los clientes de librerías y periódicos en línea están utilizando bases de datos. En algún lugar de las entrañas de la aplicación, se consulta una base de datos y se ofrece una respuesta.

Hibernate es una biblioteca que simplifica el uso de bases de datos relacionales en aplicaciones Java al presentar los datos relacionales como objetos simples de Java, a los que se accede a través de un administrador de sesión, por lo que obtiene la descripción de ser un "Mapeador de objetos/relaciones" u ORM. Proporciona dos tipos de interfaces programáticas: una interfaz "nativa de Hibernate" y la API de persistencia Java estándar de Java EE.

La versión más reciente de Hibernate a partir de este escrito es la serie 5.x (la versión específica es 5.2.2.Final, pero eso puede haber cambiado desde que se escribió este párrafo), y esa es la versión en la que se enfoca este libro. En el capítulo de OGM, usaremos una versión un poco más antigua (ya que OGM no está tan actualizado con el resto de Hibernate mientras se escribe esto), pero eso no debería ser un gran problema.

Hay soluciones para las que es apropiado un Hibernate similar a ORM, y algunas para las que es apropiado el enfoque tradicional de acceso directo a través de la API de conectividad de base de datos de Java (JDBC). Creemos que Hibernate representa una buena primera opción, ya que no excluye el uso simultáneo de enfoques alternativos, aunque se debe tener cuidado si los datos se modifican desde dos API diferentes.

Para ilustrar algunas de las fortalezas de Hibernate, en este capítulo echamos un vistazo a un breve ejemplo usando Hibernate y lo contrastamos con el enfoque tradicional de JDBC.

## Plain Old Java Objects (POJOs)

Java, al ser un lenguaje orientado a objetos, trata con objetos. Por lo general, los objetos que representan los estados del programa son bastante simples y contienen propiedades (o atributos) y métodos que alteran o recuperan esos atributos (mutadores y accesores, conocidos como "setters" y "getters", coloquialmente). En general, estos objetos pueden encapsular algún comportamiento con respecto a los atributos, pero normalmente su único propósito es contener un estado de programa. Estos se conocen típicamente como "objetos Java antiguos simples" o POJO.

En un mundo ideal,<sup>2</sup> sería trivial tomar cualquier objeto de Java, simple o no, y conservarlo en la base de datos. No se requeriría una codificación especial para lograr esto, no se produciría ninguna penalización en el rendimiento y el resultado sería totalmente portátil. En este mundo ideal, tal vez realizaríamos tal operación de una manera como la que se muestra en el Listado 1-1.

**Listado 1-1. Una visión teñida de rosa de la persistencia de objetos**

```java
POJO pojo = new POJO();
ORMSolution magic = ORMSolution.getInstance();
magic.save(pojo);
```

No habría sorpresas desagradables, ni trabajo adicional para correlacionar la clase con tablas en la base de datos, ni problemas de rendimiento.

Hibernate se acerca notablemente a esto, al menos en comparación con las alternativas, pero hay archivos de configuración para crear y problemas sutiles de rendimiento y sincronización a considerar. Sin embargo, Hibernate logra su objetivo fundamental: le permite almacenar POJO en la base de datos. La Figura 1-1 muestra cómo Hibernate encaja en su aplicación entre el código del cliente y la base de datos.

<img width="845" alt="image" src="https://user-images.githubusercontent.com/23094588/206312143-568d40d8-c076-4b52-9d7e-ece70d53b3ea.png">

El término común para la persistencia directa de los objetos tradicionales de Java es mapeo objeto/relacional, es decir, mapear los objetos en Java directamente a las entidades relacionales en una base de datos.

Los POJO pueden ser cualquier objeto Java. Hibernate le permite persistir POJO con muy pocas restricciones. El Listado 1-2 es un ejemplo de un POJO simple que podría usarse para representar un mensaje. (Modificaremos esta clase a medida que analicemos un código de ejemplo).

**Listado 1-2. El POJO utilizado en los ejemplos de este capítulo**

```java
package chapter01.pojo;

public class Message {
    
    String text;
    
    public Message() {
    }

    public Message(String text) {
        setText(text);
    }
    
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
```

La única condescendencia a Hibernate aquí es la provisión de un constructor predeterminado. Hibernate exige que todos los POJO que se almacenen proporcionen un constructor predeterminado;<sup>3</sup> pero incluso esa situación se puede solucionar cuando las clases de terceros no cumplen con este requisito limitado (mediante el uso de un mecanismo Interceptor en la configuración de Hibernate; demostraremos esto en el Apéndice A).


## Origins of Hibernate and Object/Relational Mapping

Si Hibernate es la solución, ¿cuál era el problema? Una respuesta es que hacer las cosas de la manera correcta cuando se usa JDBC requiere una cantidad considerable de código y una cuidadosa observación de varias reglas (como las que rigen la administración de conexiones) para garantizar que su aplicación no pierda recursos. Este fragmento de código de la clase JDBC **`PersistenceTest`** de ejemplo muestra cuánto se debe hacer para recuperar una lista de objetos **`Message`**:

**Listado 1-3. El enfoque JDBC para recuperar el POJO**

```java
@Test(dependsOnMethods = "saveMessage")
public void readMessage() {
    final String SELECT = "SELECT id, text FROM messages";
    final String JDBCURL = "jdbc:h2:./db1";
    List<Message> list = new ArrayList<>();
    try (Connection connection = DriverManager.getConnection(JDBCURL, "sa", "")) {
        try (PreparedStatement ps = connection.prepareStatement(SELECT)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getLong(1));
                    message.setText(rs.getString(2));
                    list.add(message);
                }

                assertEquals(list.size(), 1);
                for (Message m : list) {
                    System.out.println(m);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw new RuntimeException(e);
    }
}
```

Este código es tan conciso como puede ser el código JDBC, fuera de bibliotecas como Hibernate. Utiliza la administración automática de recursos<sup>4</sup> (ARM) para manejar la desasignación de recursos (lo que limpia el código de manera inconmensurable<sup>5</sup>), pero todavía está hablando de múltiples niveles de bloques **`try`** anidados; y aunque nuestro SQL aquí es muy simple, es fácil de usar SQL que es específico para una base de datos en particular.

Sin embargo, al final el problema persiste: todavía estamos administrando recursos específicos como SQL **`PreparedStatement`** y **`ResultSet`**, y el código en sí es bastante frágil. Si agregáramos un campo a la base de datos, tendríamos que encontrar cada instrucción SQL que pudiera necesitar acceder a ese campo, y modificaríamos el código para acomodarlo.

También nos encontramos con el problema de los tipos con este código. Este es un objeto muy simple: almacena un identificador numérico simple con una cadena simple. Sin embargo, si quisiéramos almacenar una ubicación geográfica, tendríamos que dividir la ubicación en sus múltiples propiedades (longitud y latitud, por ejemplo) y almacenar cada una por separado, lo que significa que su modelo de objeto ya no coincide claramente con su base de datos.

Todo esto hace que el uso directo de la base de datos parezca cada vez más defectuoso, y eso no sin antes tener en cuenta otros problemas relacionados con la persistencia y recuperación de objetos.

## Hibernate as a Persistence Solution

Hibernate aborda muchos de estos problemas o alivia parte del dolor donde no puede hacerlo, por lo que abordaremos los puntos uno por uno.

Primero, Hibernate requiere menos recursos para administrar y es más fácil trabajar con ellos. No tiene que preocuparse por las conexiones reales de la base de datos, por ejemplo; trabaja con un objeto **`Session`**, que envuelve los recursos JDBC subyacentes. Las condiciones de error pueden ocurrir de tal manera que necesite manejarlas, por supuesto; pero estas son condiciones excepcionales, no normales. (En otras palabras, está manejando excepciones que realmente debería manejar, en lugar de manejar todas las excepciones que podría tener que manejar, lo que puede ser un problema incluso con la administración automática de recursos).

Hibernate también maneja la asignación del objeto a la tabla de la base de datos, incluida la construcción del esquema de la base de datos si así lo configura; no requiere una tabla por tipo de objeto y puede asignar fácilmente un objeto a varias tablas. Hibernate también maneja las relaciones por usted; por ejemplo, si agregó una lista de direcciones a un objeto Persona, fácilmente podría tener las direcciones almacenadas en una tabla secundaria, construida y administrada por Hibernate.

Además de mapear el objeto a la tabla de la base de datos, Hibernate puede manejar mapeos de nuevos tipos a la base de datos. La geolocalización se puede especificar como su propia tabla, se puede normalizar o puede tener un mecanismo de serialización personalizado de modo que pueda almacenarla en cualquier forma nativa que necesite.

El inicio de Hibernate toma un poco más de tiempo que el código JDBC directo, sin duda. Sin embargo, el tiempo de inicialización del sistema no suele ser una métrica significativa. La mayoría de las aplicaciones tienen tiempos de ejecución prolongados y el porcentaje de tiempo dedicado a la inicialización de Hibernate es irrelevante para el rendimiento real de la aplicación. Las ventajas de Hibernate en el mantenimiento y la gestión de objetos compensan con creces el tiempo que la aplicación dedica a la configuración. Como de costumbre, la forma correcta de considerar el rendimiento es a través de pruebas y análisis de una aplicación real, en lugar de escupir evidencia anecdótica.<sup>6</sup>

Cualquier objeto Java capaz de persistir en una base de datos es candidato para la persistencia de Hibernate. Por lo tanto, Hibernate es un reemplazo natural para las soluciones ad hoc (como nuestro ejemplo de JDBC), o como el motor de persistencia para una aplicación que aún no ha incorporado la persistencia de la base de datos. Además, al elegir la persistencia de Hibernate, no se está atando a ninguna decisión de diseño en particular para los objetos comerciales en su aplicación, incluida la base de datos que usa la aplicación para la persistencia, que es un aspecto configurable.

## A Hibernate Hello World Example

El Listado 1-4 muestra la misma prueba que el Listado 1-3, usando Hibernate en lugar de JDBC. Aquí, el objeto de fábrica se inicializa en el inicio de prueba, pero cumple la misma función que la inicialización de la conexión desde el código basado en JDBC.

**Listado 1-4. El enfoque de Hibernate para recuperar el POJO**

```java
private SessionFactory factory=null;

@BeforeClass
public void setup() {
    StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
            .configure()
            .build();
    factory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
}

@Test(dependsOnMethods = "saveMessage")
public void readMessage() {
    try (Session session = factory.openSession()) {
        List<Message> list = session.createQuery("from Message", Message.class).list();

        assertEquals(list.size(), 1);
        for (Message m : list) {
            System.out.println(m);
        }
    }
}
```

Observe cómo obtenemos una **`List`** de **`Message`**: creamos una consulta (que especifica los tipos de contenido de la consulta) y obtenemos una **`List`** de ella. Hibernate gestiona la construcción de las referencias; el programador que escribe este código no necesariamente sabe cómo la base de datos representa un **`Message`**, ni tiene que preocuparse. Es un detalle de implementación que maneja Hibernate, bajo nuestro control. (También vale la pena señalar que hay un método "**`saveMessage()`**" que no se muestra aquí; aparece en el Listado 1-6).

También tenga en cuenta que estamos utilizando el lenguaje de consulta de Hibernate (**HQL**) para localizar el mensaje. HQL es muy poderoso, y este es un mal uso de él; Profundizaremos un poco en HQL a medida que avancemos.

## Mappings

Como hemos implicado, Hibernate necesita algo que le diga qué tablas se relacionan con qué objetos. En la terminología de Hibernate, esto se denomina ***mapeo - mapping***. Las asignaciones se pueden proporcionar mediante anotaciones de Java o mediante un archivo de asignación XML. En este libro, nos centraremos en el uso de anotaciones, ya que podemos marcar las clases POJO Java directamente. El uso de anotaciones le brinda una imagen clara de la estructura a nivel de código, que parece ser el preferido por las personas que escriben código.<sup>7</sup> Hibernate también adopta un enfoque de configuración por excepción para las anotaciones: si estamos satisfechos con los valores predeterminados que proporciona Hibernate para nosotros, no necesitamos proporcionarlos explícitamente como anotaciones. Por ejemplo, Hibernate usa el nombre de la clase POJO como el valor predeterminado de la tabla de la base de datos a la que se asigna el objeto. En nuestro ejemplo, si estamos satisfechos con usar una tabla de base de datos llamada **`Message`**, no necesitamos definirla en el código fuente, ya que el objeto que se está mapeando se llama **`Message`**.

De hecho, si nuestro único acceso es a través de Hibernate, ni siquiera necesitamos saber cuál es el nombre de la tabla; como muestra nuestro ejemplo, consultamos en función del tipo de objeto y no del nombre de la tabla. Hibernate construye automáticamente la consulta de modo que se use el nombre de tabla correcto, incluso si tuviéramos que cambiar el nombre de tabla real a "**`Messages`**", por ejemplo.

El Listado 1-5 muestra el Message POJO con anotaciones para mapear el objeto Java en la base de datos. Agrega un identificador y un método **`toString()`** a nuestro POJO original; querríamos la ID en cualquier caso, pero **`toString()`** agrega conveniencia a medida que usamos la clase. (Eventualmente querremos agregar un **`equals()`** y **`hashCode()`** también).

**Listado 1-5. El POJO con anotaciones de mapeo**

```java
package chapter01.hibernate;
import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @Column(nullable = false)
    String text;

    public Message(String text) {
        setText(text);
    }

    public Message() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + getId() +
                ", text='" + getText() + '\'' +
                '}';
    }
}      
```


## Persisting an Object

En aras de la exhaustividad, este es el método utilizado para escribir un **`Message`** en la base de datos con Hibernate. (La versión JDBC de este código está presente en los ejemplos descargables, pero no agrega nada al conocimiento de cómo usar Hibernate).

**Listado 1-6. Guardar un objeto de mensaje en Hibernate**

```java
@Test
public void saveMessage() {
    Message message = new Message("Hello, world");
    try (Session session = factory.openSession()) {
        Transaction tx = session.beginTransaction();
        session.persist(message);
        tx.commit();
    }
}
```

## Summary

En este capítulo, hemos considerado los problemas y requisitos que han impulsado el desarrollo de Hibernate. Hemos visto algunos de los detalles de una aplicación de ejemplo trivial escrita con y sin la ayuda de Hibernate. Hemos pasado por alto algunos de los detalles de implementación, pero los discutiremos en profundidad en el Capítulo 3.

En el próximo capítulo, veremos la arquitectura de Hibernate y cómo se integra en sus aplicaciones.

### Footnotes

1 Una base de datos relacional es una colección de conjuntos de elementos de datos, cada uno de los cuales se describe y organiza formalmente. Se pueden establecer reglas para los datos de modo que se puedan validar, y se pueden crear índices para que los datos se puedan consultar y actualizar de forma rápida y segura.

2 Bueno, tal vez un mundo ideal en el que se utilice un ORM para el acceso a datos. Pero en este libro se puede suponer que este es el caso.

3 Consulte http://docs.jboss.org/hibernate/orm/5.2/quickstart/html_single/#hibernate-gsg-tutorialbasic-entity para obtener más detalles. Forma abreviada: Hibernate usa la reflexión para construir un objeto antes de la población de datos. El camino más corto (y más rápido) para hacerlo es con un constructor sin argumentos.

4 Para obtener más información sobre la gestión automática de recursos, introducida en Java 7, consulte la referencia del tutorial de Java: http://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html.

5 Por cierto, si está interesado, "inconmensurablemente" equivale a treinta y dos líneas. La forma antigua, sin ARM, tenía treinta y dos líneas de código dedicadas a la limpieza segura. No sé ustedes, pero a mí me gusta más este código. No solo es más corto, sino que es más difícil estropearlo.

6 Una crítica común a Java es que una aplicación "Hello, World" puede tardar unos segundos en ejecutarse, porque el inicio de la VM es parte del tiempo de ejecución. Sin embargo, el inicio de la VM en sí mismo es una ocurrencia rara para la mayoría de las aplicaciones; después de todo, solo ocurre una vez por ejecución, y en una aplicación que se ejecuta durante horas, días o meses, el tiempo que tarda la VM en iniciarse no es relevante. La crítica está fuera de lugar, a menos que el objetivo de su negocio sea ejecutar "Hello, World" en el menor tiempo posible.

7 Imagínese; ¿Quién sabía que a los codificadores les gusta que las cosas sean código? (Además de los codificadores, quiero decir).
