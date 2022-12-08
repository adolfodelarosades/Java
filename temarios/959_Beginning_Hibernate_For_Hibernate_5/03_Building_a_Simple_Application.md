# Chapter 3: Building a Simple Application

* A Simple Application
* A First Attempt
* Writing Data
* Reading Data
* Updating Data
* Persistence Contexts
* Removing Data
* A Note on Transactions
* Writing Our Sample Application
* Summary

En este capítulo, vamos a crear el shell de una aplicación, lo que nos permitirá demostrar una serie de conceptos comunes para los sistemas que usan Hibernate. Cubriremos lo siguiente:

* Diseño de modelos de objetos, incluidas las relaciones entre objetos.
* Operaciones que visualizan y modifican datos persistentes (inserciones, lecturas, actualizaciones y eliminaciones).

Por lo general, usaríamos una capa de servicio para encapsular algunas operaciones y, de hecho, agregaremos una capa de servicio a medida que avancemos, pero en este punto queremos ver más sobre cómo interactuar con Hibernate. El objetivo aquí es no perder el tiempo con una aplicación de muestra que es "una para tirar". Definitivamente no podremos tener una base de código completa e ideal, pero será un modelo de cómo se podría usar Hibernate en el mundo real.

Por supuesto, tal declaración tiene una advertencia: diferentes aplicaciones y arquitectos tienen diferentes enfoques. Esta es solo una forma de crear una aplicación de este tipo; otros tomarán diferentes enfoques que son tan válidos como este.

Además, nuestro modelo será progresivo, por lo que su calidad en su génesis no será muy alta. Vamos a presentar varios conceptos nuevos a medida que avanzamos; y tendremos muchas oportunidades para volver al código escrito previamente y mejorarlo.

## A Simple Application

Lo que estamos tratando de crear es una aplicación que permita la clasificación de pares en varias áreas de habilidades.

El concepto es algo así: John piensa que Tracy es bastante buena en Java, por lo que en una escala del 1 al 10, le daría a Tracy un 7. Sam piensa que Tracy es decente, pero no genial; le daría a Tracy un 5. Con estas dos clasificaciones, uno podría suponer que Tracy obtuvo un 6 en Java. Siendo realistas, con un conjunto de muestras tan pequeño, no sería capaz de evaluar si esta clasificación fue precisa o no, pero después de 20 clasificaciones de este tipo, tendría la oportunidad de una evaluación por pares verdaderamente legítima.

Entonces, lo que queremos es una forma de que un observador ofrezca una clasificación para una habilidad dada para una persona específica. También nos gustaría una forma de determinar la clasificación real de cada persona, así como una forma de averiguar quién fue clasificado como "el mejor" para una habilidad determinada.

Si observa estos párrafos con miras al diseño de aplicaciones, verá que tenemos cuatro tipos diferentes de entidades (objetos para administrar en una base de datos) y algunos servicios.

Nuestras entidades son estas: People - Personas (que son observadores y sujetos, por lo tanto, dos tipos de entidades que se ven exactamente iguales), Skills - habilidades y Rankings - clasificaciones.

Nuestras relaciones son algo así:

Un sujeto, una People, tiene cero, una o muchas habilidades. Cada una de las Skills de una persona tiene cero, uno o muchos Rankings.

Un Ranking tiene una puntuación (“en una escala del 1 al 10”) y un observador (una Persona que envía un ranking en particular).

### Un primer intento

Nuestro proyecto nos permitirá escribir, leer y actualizar clasificaciones para diferentes temas, así como decirnos quién tiene el puntaje promedio más alto para una habilidad determinada.

No hará estas cosas de manera muy eficiente al principio, pero en el camino cumpliremos nuestro deseo de prácticas de desarrollo (algo) ágiles, y aprenderemos un poco sobre cómo leer y escribir datos con Hibernate.

Como de costumbre, utilizaremos el desarrollo basado en pruebas. Escribamos algunas pruebas y luego tratemos de hacerlas pasar. Nuestros primeros bits de código serán muy primitivos, probando solo nuestro modelo de datos, pero eventualmente estaremos probando servicios.

Nuestro modelo de datos se muestra en la Figura 3-1. Como puedes ver, tiene tres tipos de objetos y tres relaciones: **`Person`** se relaciona con **`Ranking`** de dos maneras (como sujeto y observador), y cada **`Ranking`** tiene una **`Skill`** asociada.

<img width="808" alt="image" src="https://user-images.githubusercontent.com/23094588/206443556-67704e5c-194c-4821-969f-b6bf42fcea2d.png">

Probablemente valga la pena señalar que este modelo de datos no es ideal. Por ahora, está bien: estamos tratando de construir algo que nos brinde un punto de partida, y tendremos en cuenta todos nuestros requisitos a medida que avancemos.

También admitimos que subespecificamos nuestras entidades. Por ejemplo, una **`Person`** puede ser algo más que un nombre. (Una **`Person`** también puede ser un número, ¿correcto?... Oh, espera, eso no es tan divertido como podría ser porque eventualmente vamos a agregar un identificador numérico a cada **`Person`** como una clave artificial). Quizás arreglemos esto. y otros temas a medida que desarrollamos nuestro modelo.

Entonces, comencemos por diseñar nuestros objetos.

Dado que la descripción de nuestro problema se centra en el concepto de **`Person`** (como sujeto y observador), comencemos con eso. El JavaBean más simple que puede representar a una **`Person`** podría parecerse al Listado 3-1:

**Listado 3-1. UN POJO Representando Nuestro Objeto `Person`**

```java
package chapter03.simple;

public class Person {

    String name;
    
    public Person() {}
    
    public void setName(String name) { this.name=name; }
    public String getName() { return name; }
}
```

En aras de la brevedad, de ahora en adelante vamos a ignorar los mutadores y accesores simples (el **`setName()`** y **`getName()`**, respectivamente, en la clase **`Person`**) a menos y hasta que necesitemos incluirlos. También vamos a ignorar las implementaciones de **`toString()`**, aunque el código de muestra lo tiene.

Esta implementación de **`Person`** solo incluye el concepto de **`Person`** e ignora los otros tipos de objetos. Veamos cómo se ven, para que podamos volver a visitar **`Person`** y desarrollarlo, por así decirlo.

La clase **`Skill`** se parece casi exactamente a la clase **`Person`**, como debería ser; podrían heredar de una clase base común, pero por ahora dejémoslos completamente separados, como se muestra en el Listado 3-2.

**Listado 3-2. Un POJO que representa las habilidades de una persona**

```java
Package chapter03.simple;

public class Skill {

    String name;
    
    public Skill() {}
}
```

La clase **`Ranking`** es un poco más complicada, pero no mucho. Realmente, todo lo que hace es codificar un lado de las asociaciones que se muestran en el UML. Vale la pena señalar que no tenemos que considerar las asociaciones de bases de datos cuando diseñamos nuestros objetos; un **`Ranking`** tiene un atributo que coincide con un tema, así que eso es lo que usa. Eche un vistazo al Listado 3-3.

**Listado 3-3. Un POJO que representa un `Ranking` del `Skill` de una `Person`**

```java
package chapter03.simple;

public class Ranking {

    Person subject;
    Person observer;
    Skill skill;
    Integer ranking;
    
    public Ranking() { }
}
```

## Writing Data

En este punto, tenemos un modelo de datos completamente funcional en Java. Podemos usar este modelo de datos con algunos cambios leves para crear entidades que representen los tipos de **`Person`**, los tipos de **`Skill`** y los **`Ranking`**; y podemos usar las asociaciones para extraer suficientes datos para cumplir con nuestros requisitos. La creación de nuestro modelo de datos podría parecerse a la que se muestra en el Listado 3-4:

**Listado 3-4. Un Test que rellena un Simple Model**

```java
package chapter03.simple;

import org.testng.annotations.Test;

public class ModelTest {
    @Test
    public void testModelCreation() {
    
        Person subject=new Person();
        subject.setName("J. C. Smell");

        Person observer=new Person();
        observer.setName("Drew Lombardo");

        Skill skill=new Skill();
        skill.setName("Java");

        Ranking ranking=new Ranking();
        ranking.setSubject(subject);
        ranking.setObserver(observer);
        ranking.setSkill(skill);
        ranking.setRanking(8);

        // just to give us visual verification
        System.out.println(ranking);
    }
}
```

Sin embargo, poder usar el modelo de datos no es lo mismo que poder persistir o consultar el modelo de datos. Este es un buen comienzo para ver cómo podría funcionar el modelo de datos, pero no es tan lejos como para usarlo.

Para permitir que Hibernate funcione con nuestro modelo, primero convertiremos el objeto **`Person`** en una entidad marcándolo con la anotación **`@Entity`**.<sup>1</sup> A continuación, marcaremos el nombre como una columna (con **`@Column`**) para nuestro modelo de datos, y luego agregaremos una clave artificial, un identificador único, que nos permita usar algo más que un nombre para una clave principal.

Describiremos más sobre las anotaciones **`@Id`** y **`@GeneratedValue`** más adelante; por ahora, esto marca el atributo como una clave primaria única, generada automáticamente por la base de datos. La forma de generación de claves dependerá de la propia base de datos. (En este caso, la generación de claves usará una secuencia de base de datos. Esto puede no ser lo que desea; también es algo que puede controlar).

El objeto **`Person`** ahora se parece a lo que se muestra en el Listado 3-5:

**Listado 3-5. El objeto `Person` como candidato para la persistencia de Hibernate**

```java
package chapter03.hibernate;

import javax.persistence.*;

@Entity
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column
    String name;

    public Person() {
    }
}
```

Ahora podemos crear una prueba que escriba una instancia en la base de datos. Aquí hay un fragmento de código para ese propósito. Nuevamente, vamos a refactorizar bastante este código en iteraciones futuras; consulte el Listado 3-6.

**Listado 3-6. Un Test que persiste la entidad `Person`**

```java
package chapter03.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class PersonTest {
    SessionFactory factory;

    @BeforeClass
    public void setup() {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        factory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
    }

    @Test
    public void testSavePerson() {
        try(Session session = factory.openSession()) {
            Transaction tx = session.beginTransaction();
            Person person = new Person();
            person.setName("J. C. Smell");

            session.save(person);

            tx.commit();
        }
    }
}
```

Esta es una imagen casi especular de nuestro ejemplo **`Message`** de los Capítulos 1 y 2, con algunos cambios para reflejar que estamos guardando una **`Person`** y no un **`Message`**. (Imagínate.)

La prueba real es muy simple. Crea una **`Person`**, y no hace más que persistirla. Ni siquiera estamos tratando de validar que persista, solo estamos ejecutando el mecanismo de persistencia. Suponiendo que ese sea el caso (y lo es), también podemos suponer que el mismo código funciona para el objeto **`Skill`**; pero el objeto **`Ranking`**, con sus asociaciones, necesita un poco más de trabajo.

Una de las cosas en las que debemos pensar antes de escribir un objeto **`Ranking`** es cómo encontrar uno de nuestros objetos. Por un lado, ese tipo de capacidad nos ayudaría en la prueba de persistencia simple: para validar que no solo se ejecutó el método **`save()`** sino que también persistió en nuestros datos. Por otro lado, en el código **`testSavePerson()`**, estamos creando una **`Person`** cuando sabemos que esa **`Person`** no existe; con **`Ranking`**, sin embargo, esperamos reutilizar las instancias de **`Person`** así como las **`Skill`**s.

Entonces necesitamos crear un mecanismo por el cual podamos consultar nuestra base de datos. Crearemos un método para devolver una referencia de **`Person`** de la **`session`**, usando una consulta; y revisaremos el mecanismo de consulta en el futuro para optimizarlo un poco.

## Reading Data

El Listado 3-7 es el código para buscar una **`Person`**, dado un nombre. Este fragmento utiliza el lenguaje de consulta de Hibernate (HQL), que está vagamente relacionado con SQL; Veremos más sobre HQL en capítulos posteriores.

**Listado 3-7. Un método para localizar una instancia de `Person` específica**

```java
private Person findPerson(Session session, String name) {
    Query<Person> query = session.createQuery("from Person p where p.name=:name",
            Person.class);
    query.setParameter("name", name);
    Person person = query.uniqueResult();
    return person;
}
```

Este código declara una referencia a **`org.hibernate.query.Query`**, y crea un análogo aproximado de una declaración de selección de SQL. Esta forma de consulta selecciona datos de la tabla creada a partir de la entidad **`Person`** (que puede o no tener un nombre de tabla de "**`person`**"), con un alias "**`p`**" y limitado a objetos cuyo atributo "**`name`**" es igual a un parámetro con nombre (llamado útilmente "**`name`**"). También especifica el tipo de referencia de la consulta (con **`Person.class`**) para reducir el encasillamiento y los posibles errores de tipos de retorno incorrectos.<sup>2</sup>

Luego establecemos el valor del parámetro de "**`name`**" en el nombre que estamos buscando.

Como solo estamos interesados en una posible coincidencia en este punto (una limitación de nuestra implementación por ahora), devolvemos un resultado único: un solo objeto. Si tenemos cinco personas con ese nombre en nuestra base de datos, se lanzará una excepción; Podríamos arreglar esto usando **`query.setMaxResults(1)`** y devolviendo la primera (y única) entrada en **`query.list()`**, pero la forma correcta de arreglarlo es averiguar cómo ser muy específico al devolver la **`Person`** correcta .

Si no se encuentra ningún resultado, se devolverá un valor de señal, **`null`**.

Los lectores astutos (por lo tanto, todos ellos) notarán que pasamos una **`Session`** a este método y que se declara **`private`**. Esto es para que administremos los recursos de manera más limpia; estamos construyendo pequeños bloques de funcionalidad, y no queremos que cada pequeña funcionalidad pase por un proceso de adquisición de recursos. Tenemos la expectativa de que las personas que llaman administren la **`Session`** y, por implicación, la transacción que afectaría este método. Si necesitamos una versión de este método expuesto que no cargue a la persona que llama con la administración de la sesión, podemos sobrecargar el nombre del método, y lo haremos. (En realidad, este método está diseñado para ser utilizado específicamente por otros métodos en nuestro servicio; esos métodos son los que se espera que adquieran la **`Session`** y administren las transacciones).

Ahora podemos escribir un método **`findPerson()`** que devuelve una **`Person`** existente si existe una con ese nombre, creando un nuevo objeto **`Person`** si no se encuentra ninguno; consulte el Listado 3-8.

**Listado 3-8. Un método para salvar una instancia de `Person`, dado un nombre**

```java
private Person savePerson(Session session, String name) {

    Person person = findPerson(session, name);
    
    if(person==null) {
        person=new Person();
        person.setName(name);
        session.save(person);
    }
    
    return person;
}
```

Nuestro primer corte en el código para construir un **`Ranking`** (en **`RankingTest`**) podría parecerse a lo que se muestra en el Listado 3-9:

**Listado 3-9. Guardar una instancia de `Ranking`**

```java
@Test
public void testSaveRanking() {
    try (Session session = factory.openSession()) {
        Transaction tx = session.beginTransaction();

        Person subject = savePerson(session, "J. C. Smell");
        Person observer = savePerson(session, "Drew Lombardo");
        Skill skill = saveSkill(session, "Java");

        Ranking ranking = new Ranking();
        ranking.setSubject(subject);
        ranking.setObserver(observer);
        ranking.setSkill(skill);
        ranking.setRanking(8);
        session.save(ranking);

        tx.commit();
    }
}
```

El código del capítulo tiene este método codificado tal como está, pero este método también nos da el comienzo de otro método, uno que abstrae todo el código repetido de modo que podamos ofrecer las cuatro piezas importantes de información y generar datos muy rápidamente.

Con eso en mente, echemos un vistazo a las consultas de nuevo. Hemos demostrado que las consultas pueden devolver resultados únicos; veamos las consultas que devuelven múltiples resultados, en orden, con el entendimiento de que todavía estamos muy lejos de ser eficientes, o incluso correctos, en muchos sentidos.

Uno de nuestros requisitos es poder determinar la **`Ranking`** de una **`Person`** dada para una **`Skill`** dada. Escribamos otro test como prueba de concepto.

Primero, escribiremos un método que agregue algunas **`Rankings`** más para J. C. Smell; ya le mostramos que tiene un 8 en Java, agreguemos un 6 y un 7, lo que le daría una **`Skill`** promedio de 7, obviamente. Con eso, nuestro método de prueba podría verse como lo que se muestra en el Listado 3-10:

**Listado 3-10. Un método para probar las operaciones de clasificación**

```java
@Test
public void testRankings() {

    populateRankingData();

    try (Session session = factory.openSession()) {
        Transaction tx = session.beginTransaction();

        Query<Ranking> query = session.createQuery("from Ranking r "
                + "where r.subject.name=:name "
                + "and r.skill.name=:skill", Ranking.class);
                
        query.setParameter("name", "J. C. Smell");

        query.setParameter("skill", "Java");

        IntSummaryStatistics stats = query.list()
                .stream()
                .collect(Collectors.summarizingInt(Ranking::getRanking));

        long count = stats.getCount();
        int average = (int) stats.getAverage();

        tx.commit();
        session.close();
        assertEquals(count, 3);
        assertEquals(average, 7);
    }
}

private void populateRankingData() {
    try(Session session = factory.openSession()) {
        Transaction tx = session.beginTransaction();
        createData(session, "J. C. Smell", "Gene Showrama", "Java", 6);
        createData(session, "J. C. Smell", "Scottball Most", "Java", 7);
        createData(session, "J. C. Smell", "Drew Lombardo", "Java", 8);
        tx.commit();
    }
}

private void createData(Session session, String subjectName,
                        String observerName, String skillName, int rank) {
                        
    Person subject = savePerson(session, subjectName);
    Person observer = savePerson(session, observerName);
    Skill skill = saveSkill(session, skillName);

    Ranking ranking = new Ranking();
    ranking.setSubject(subject);
    ranking.setObserver(observer);
    ranking.setSkill(skill);
    ranking.setRanking(rank);
    session.save(ranking);
}
```

El método **`testRanking()`** utiliza una consulta un poco más avanzada: la consulta recorre el árbol de atributos desde el objeto **`Ranking`** para hacer coincidir el nombre del sujeto y el nombre de la **`Skill`**. Con las referencias a entidades en nuestro modelo de objetos, es muy fácil hacer un SQL JOIN sin tener que conocer la sintaxis o las capacidades específicas de la base de datos; Hibernate se encarga de escribir todo el SQL por nosotros y podemos usar los objetos "naturalmente".

Por cierto, este no es un uso particularmente bueno de la función de consulta; lo revisaremos un poco a medida que avancemos, especialmente en la última sección de este capítulo, donde usamos la capacidad de consulta de Hibernate para hacer todo el trabajo de calcular el promedio por nosotros.<sup>3</sup>

## Updating Data

¿Y si queremos cambiar datos? Supongamos que Gene Showrama, quien en nuestro código de ejemplo clasificó a J. C. Smell como un 6 en Java, se da cuenta de que ha cambiado de opinión. Veamos qué tenemos que hacer para actualizar los datos.

Primero, tomemos nuestra rutina de cálculo de promedio de **`Ranking`** y refactorícela en un método reutilizable. (El código de prueba tiene el método refactorizado y la prueba original como se muestra aquí). A continuación, escribiremos nuestra prueba para actualizar los datos y luego volveremos a calcular el promedio, probándolo para asegurarnos de que nuestros datos se conserven correctamente. Consulte el Listado 3-11.

**Listado 3-11. Un test que demuestra las actualizaciones**

```java
@Test
public void changeRanking() {

    populateRankingData();
    
    try (Session session = factory.openSession()) {
        Transaction tx = session.beginTransaction();
        Query<Ranking> query = session.createQuery("from Ranking r "
                + "where r.subject.name=:subject and "
                + "r.observer.name=:observer and "
                + "r.skill.name=:skill", Ranking.class);
        query.setParameter("subject", "J. C. Smell");
        query.setParameter("observer", "Gene Showrama");
        query.setParameter("skill", "Java");
        Ranking ranking = query.uniqueResult();
        assertNotNull(ranking, "Could not find matching ranking");
        ranking.setRanking(9);
        tx.commit();
    }
    assertEquals(getAverage("J. C. Smell", "Java"), 8);
}
```

¿Qué estamos haciendo aquí? Después de completar los datos con valores conocidos, creamos una consulta para ubicar el **`Ranking`** específico que queremos cambiar (un **`Ranking`** en Java para "J. C. Smell", escrita por "Gene Showrama"). Verificamos para asegurarnos de tener un **`Ranking`** válido, lo cual deberíamos, ya que los datos fueron creados por nuestro método **`populateRankingData()`**, y luego hacemos algo muy curioso.

Establecemos un nuevo **`Ranking`**, con **`ranking.setRanking(9)`**; ... y eso es. Confirmamos la transacción actual y dejamos que la sesión se cierre porque hemos terminado.

Hibernate observa el modelo de datos y, cuando algo cambia, actualiza automáticamente la base de datos para reflejar los cambios.<sup>4</sup> La transacción envía la actualización a la base de datos para que otras sesiones, tal como se incluye en el método **`findRanking()`**, puedan verla.

Hay algunas advertencias para esto (con soluciones alternativas, naturalmente). Cuando Hibernate carga un objeto por usted, es un "objeto administrado", es decir, es administrado por esa sesión. Las mutaciones (cambios) y los accesos pasan por un proceso especial para escribir datos en la base de datos o extraer datos de la base de datos si la sesión aún no los ha cargado. Nos referimos a este objeto como si estuviera en “estado persistente”, lo que nos lleva a un concepto que será importante para nosotros a medida que usemos la persistencia en Java.<sup>5</sup>

## Persistence Contexts

**Hay cuatro estados para un objeto en relación con una sesión**: ***persistent***, ***transient***, ***detached***, o ***removed***.

Cuando creamos un nuevo objeto, es ***transient***(transitorio), es decir, Hibernate no le ha asignado ningún identificador y la base de datos no tiene conocimiento del objeto. Eso no significa que la base de datos no tenga los datos. Imagínese si hubiéramos creado un **`Ranking`** manualmente para J. C. Smell, de Gene Showrama, en Java. El nuevo **`Ranking`** tendría un análogo en la base de datos, pero Hibernate no sabría que el objeto en la *memoria* era equivalente a la representación del objeto *en la base de datos*.

Cuando llamamos a **`save()`** en un nuevo objeto, lo marcamos como ***persistent***(persistente), y cuando consultamos la sesión por un objeto, también está en estado ***persistent***(persistente). Los cambios se reflejan en la transacción actual y se escriben cuando se confirma la transacción. Podemos convertir un objeto ***transient***(transitorio) en un objeto ***persistent***(persistente) usando **`Session.merge()`**, que aún no hemos visto (pero lo haremos).

Un objeto ***detached***(separado) es un objeto ***persistent***(persistente) cuya **`Session`** se ha cerrado o se ha desalojado de una **`Session`**. En nuestro ejemplo de cambio de **`Ranking`**, cuando se cierra la sesión, el objeto de **`Ranking`** que cambiamos está en estado ***detached*** para la llamada **`findRanking()`** aunque lo cargamos desde la base de datos y solía estar en estado ***persistent***.

Un objeto ***removed***(eliminado) es uno que se ha marcado para su eliminación en la transacción actual. Un objeto cambia al estado ***removed***(eliminado) cuando se llama a **`Session.delete()`** para esa referencia de objeto. Tenga en cuenta que un objeto en estado ***removed***(eliminado) se elimina en la base de datos pero no en la memoria, al igual que un objeto puede existir en la base de datos sin una representación en memoria.

## Removing Data

Lo último que queremos ver es cómo eliminar datos o, más bien, cómo moverlos al estado ***removed***(eliminado) con respecto al contexto de persistencia, que casi equivale a lo mismo. (En realidad, no se "elimina" hasta que se confirma la transacción, e incluso entonces la representación en memoria está disponible hasta que queda fuera del scope, como describimos en el párrafo sobre "estado removed").

Digamos, a modo de ejemplo, que Gene Showrama se ha dado cuenta de que realmente no tiene suficiente información para ofrecer una clasificación válida para J. C. Smell en Java, por lo que desea eliminarla. El código para esto es muy similar a nuestra actualización: buscaremos el **`Ranking`** y luego llamaremos a **`Session.delete()`**.

Podemos refactorizar nuestro mecanismo para encontrar un **`Ranking`** (a partir de la prueba **`changeRanking()`**), lo que nos dará un **`Ranking`** en estado ***persistent***(persistente). Luego lo eliminamos a través de la **`session`** y confirmamos el cambio; luego podemos solicitar el nuevo promedio para ver si nuestros cambios se reflejan en la base de datos.

Aquí está nuestro código, que se muestra en el Listado 3-12:

**Listado 3-12. Eliminar un `Ranking`**

```java
@Test
public void removeRanking() {

    populateRankingData();
    
    try (Session session = factory.openSession()) {
        Transaction tx = session.beginTransaction();
        Ranking ranking = findRanking(session, "J. C. Smell",
                "Gene Showrama", "Java");
        assertNotNull(ranking, "Ranking not found");
        session.delete(ranking);
        tx.commit();
    }
    assertEquals(getAverage("J. C. Smell", "Java"), 7);
}
```

Es como magia, excepto que no lo es: es solo Hibernate administrando la base de datos para reflejar los cambios que le mostramos.

## A Note on Transactions

También hemos mencionado bastante las "transacciones", usándolas con cada referencia de sesión. Entonces, ¿qué son?

**Una transacción es una “unidad de trabajo agrupada” para una base de datos**.<sup>6</sup>

Cuando inicia una transacción, está diciendo que desea ver la base de datos tal como existe en un momento determinado ("ahora"), y cualquier modificación afecta solo a la base de datos tal como existe desde ese punto de partida.

Los cambios se confirman como un todo, de modo que ninguna otra transacción pueda verlos hasta que se complete la transacción. Esto significa que las transacciones permiten que la aplicación defina unidades discretas de trabajo, y el usuario solo tiene que decidir los límites de cuándo comienza o finaliza una transacción. Si se abandona la transacción, es decir, no se llama explícitamente a **`commit()`**, los cambios de la transacción se abandonan y la base de datos no se modifica.

Las transacciones se pueden anular ("revertir"(“rolled back,”), con el método **`Transaction.rollback()`**) de modo que se descarten todos los cambios que hayan tenido lugar como parte de esa transacción. Esto le permite garantizar la consistencia en su modelo de datos.

Por ejemplo, imagine que está creando un sistema de entrada de pedidos, con un pedido que consta de un objeto **`Order`**(Pedido), objetos **`LineItem`**(Línea de pedido) y un objeto **`Customer`**(Cliente). Si estaba escribiendo un pedido con siete elementos de línea y el sexto elemento de línea falló debido a datos no válidos,<sup>7</sup> no desearía que un pedido incompleto permaneciera en la base de datos. Le gustaría revertir los cambios y ofrecerle al usuario la oportunidad de volver a intentarlo, con los datos correctos.

Naturalmente, hay excepciones a las definiciones de transacciones, e Hibernate proporciona varios tipos de transacciones (por ejemplo, puede tener una transacción que permita lecturas de datos no confirmados, una "lectura sucia - dirty read"). Además, diferentes bases de datos pueden definir límites transaccionales a su manera. Afortunadamente, esta es una preocupación bastante importante para las bases de datos, por lo que cada una tiende a documentar cómo se definen las transacciones. (Consulte http://www.h2database.com/html/advanced.html#transaction_isolation para ver la documentación de las transacciones de H2, por ejemplo).

## Writing Our Sample Application

¿Qué hemos visto hasta ahora? Hemos visto lo siguiente:

1. La creación de un modelo de objetos.
2. La asignación de ese modelo de objetos a un modelo de datos.
3. La escritura de datos de un modelo de objeto en una base de datos.
4. La lectura de datos de la base de datos en un modelo de objetos.
5. La actualización de datos en la base de datos a través de nuestro modelo de objetos.
6. La eliminación de datos de la base de datos a través de nuestro modelo de objetos.

Con todo esto, estamos listos para comenzar a diseñar nuestra aplicación real, sabiendo que nuestro modelo de objetos funciona (aunque aún no se ha considerado la eficiencia) y con un código de ejemplo para realizar la mayoría de nuestras tareas según lo especifiquen nuestros requisitos.

Vamos a diseñar nuestra aplicación tal como escribimos nuestro código de ejemplo; es decir, vamos a definir una capa de aplicación (servicios) y llamar a esa aplicación desde las pruebas. En el mundo real, escribiríamos una capa de interfaz de usuario que usaría los servicios, tal como lo hacen las pruebas.

Para que quede claro, nuestras interacciones con los usuarios son:

1. Agregue un **`Ranking`** para un sujeto por un observador.
2. Actualice un **`Ranking`** para un sujeto por un observador.
3. Eliminar un **`Ranking`** de un sujeto por un observador.
4. Encuentre el **`Ranking`** promedio para una habilidad en particular para un tema.
5. Encuentra todos los **`Rankings`** de un tema.
6. Encuentre el tema mejor calificado para una habilidad en particular.

Parece mucho, pero ya hemos escrito gran parte de este código; solo necesitamos refactorizarlo en una capa de servicio para facilitar su uso.

Vamos a poner estos métodos en una interfaz, comenzando con el Listado 3-16, pero antes de hacerlo, queremos resumir algunos servicios básicos, principalmente, la adquisición de una **`Session`**. Para hacer esto, agregaremos un nuevo módulo a nuestro proyecto principal, el módulo "util", con una sola clase, **`SessionUtil`**.

En un servidor de aplicaciones (como Wildfly, Glassfish o Geronimo), se accede a la API de persistencia a través de la inyección de recursos; el implementador de la aplicación configura un contexto para la arquitectura de persistencia de Java y la aplicación adquiere automáticamente un **`EntityManager`** (el JPA equivalente a la **`session`**). Es completamente posible (y posiblemente preferible) configurar Hibernate como el proveedor de JPA; luego puede usar las API de Hibernate con una conversión a **`Session`**.<sup>8</sup>

También puede obtener este mismo tipo de inyección de recursos a través de libraries como Spring o Guice. Con Spring, por ejemplo, configuraría un proveedor de persistencia, tal como lo haría en un servidor de aplicaciones Java EE, y Spring proporcionaría automáticamente un recurso a través del cual podría adquirir Sesiones.

Sin embargo, aunque cada una de estas plataformas (Spring, Java EE y otras) son extremadamente útiles y prácticas (y probablemente necesarias, en el caso de Java EE), las evitaremos en su mayor parte porque queremos limitar el alcance de lo que le estamos haciendo a Hibernate y no entrar en una discusión sobre varias opciones de arquitectura en competencia.

En el código fuente, hay un módulo "util", además de los módulos de capítulos. La clase **`com.autumncode.hibernate.util.SessionUtil`** es un singleton que brinda acceso a **`SessionFactory`**, algo que hemos estado poniendo en nuestro código de inicialización de prueba hasta ahora. Se parece a lo que ve en el Listado 3-13:

**Listado 3-13. Una clase Utility para recuperar una `Session`**

```java
package com.autumncode.hibernate.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.jboss.logging.Logger;

public class SessionUtil {
    private static final SessionUtil instance = new SessionUtil();
    private final SessionFactory factory;
    private static final String CONFIG_NAME = "/configuration.properties";

    Logger logger = Logger.getLogger(this.getClass());

    private SessionUtil() {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        factory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
    }

    public static Session getSession() {
        return getInstance().factory.openSession();
    }

    private static SessionUtil getInstance() {
        return instance;
    }
}
```

La forma en que se usa esta clase es muy simple y se puede ver en el test de **`SessionUtil`**, como se muestra en el Listado 3-14:

**Listado 3-14. Un Test para la clase `SessionUtil`**

```java
@Test
public void testSessionFactory() {
    try(Session session=SessionUtil.getSession()) {
        assertNotNull(session);
    }
}
```

Como puede ver, esta clase no hace nada que no hayamos hecho hasta ahora; simplemente lo hace en una clase con visibilidad general. Podemos agregar una dependencia de este módulo a otros proyectos e inmediatamente tener una forma limpia de adquirir una sesión y, si es necesario, podemos usar esta clase como una abstracción para adquirir sesiones a través del mecanismo de persistencia de Java EE o a través de Spring.<sup>9</sup>

### Agregar un `Ranking`

Lo primero que queremos poder hacer es agregar un **`Ranking`**. Hagamos esto primero creando nuestro código de cliente, que nos dará una idea de lo que necesitamos escribir. Consulte el Listado 3-15.

**Listado 3-15. Un Test para agregar un `Ranking`**

```java
public class AddRankingTest {

    RankingService service=new HibernateRankingService();
    
    @Test
    public void addRanking() {
        service.addRanking("J. C. Smell", "Drew Lombardo", "Mule", 8);
        assertEquals(service.getRankingFor("J. C. Smell", "Mule"), 8);
    }
}
```

Todavía no hemos escrito la interfaz o su implementación, lo cual rectificaremos en la siguiente lista. Aquí, solo estamos probando la API para ver cómo se ve y si parece ajustarse a lo que necesitamos hacer.

Mirando este código en el Listado 3-15, podemos decir fácilmente que **`addRanking()`** agrega lógicamente una clasificación a J. C. Smell, como lo observó Drew Lombardo, sobre Mule, con un nivel de habilidad de 8. Sería fácil confundirse los parametros; tendremos que asegurarnos de nombrarlos claramente, pero incluso con nombres claros existe la posibilidad de confusión.

Del mismo modo, podemos decir que **`getRankingFor()`** recupera con bastante claridad una clasificación de la habilidad de J. C. Smell en Mule. De nuevo, acecha la posibilidad de una confusión de tipos; el compilador no sería capaz de decirnos de antemano si llamamos a **`getRankingFor("Mule", "J. C. Smell")`**; y aunque podríamos mitigar esto en el código, con esta estructura siempre existirá la posibilidad de confusión.<sup>10</sup>

Es justo decir que este aspecto de la API es lo suficientemente claro y fácil de probar; empecemos a escribir algo de código.

El código de prueba que se muestra en el Listado 3-16 nos da la estructura de **`RankingService`**, con estos dos métodos:

**Listado 3-16. La Interfaz de `RankingService`**

```java
package chapter03.application;

public interface RankingService {

    int getRankingFor(String subject, String skill);

    void addRanking(String subject, String observer, String skill, int ranking);
}
```

Ahora veamos **`HibernateRankingService`**, que reutilizará gran parte del código que hemos escrito para probar nuestro modelo de datos.

Lo que estamos haciendo en esta clase es bastante simple: tenemos un método de nivel superior (el que está visible públicamente) que adquiere una **`Session`**, luego delega la **`Session`** junto con el resto de los datos a un método de trabajo. El método de trabajo maneja la manipulación de datos, y es en su mayor parte una copia del método **`createData()`** de **`RankingTest`**, y también usa los otros métodos de utilidad que habíamos escrito para **`RankingTest`**.

¿Por qué estamos haciendo esto? Principalmente, estamos anticipando otros métodos que podrían necesitar usar **`addRanking()`** de tal manera que participe con una **`session`** existente. Consulte el Listado 3-17.

**Listado 3-17. Mecanismos Public y Private para Agregar un `Ranking`**

```java
@Override
public void addRanking(String subjectName, String observerName,
                       String skillName, int rank) {
                       
    try (Session session = SessionUtil.getSession()) {
        Transaction tx = session.beginTransaction();

        addRanking(session, subjectName, observerName, skillName, rank);

        tx.commit();
    }
}

private void addRanking(Session session, String subjectName,
                        String observerName, String skillName, int rank) {
                        
    Person subject = savePerson(session, subjectName);
    Person observer = savePerson(session, observerName);
    Skill skill = saveSkill(session, skillName);

    Ranking ranking = new Ranking();
    ranking.setSubject(subject);
    ranking.setObserver(observer);
    ranking.setSkill(skill);
    ranking.setRanking(rank);
    session.save(ranking);
}
```

Esto deja nuestro método **`getRankingFor()`** sin implementar; sin embargo, así como **`addRanking()`** se eliminó casi por completo de **`RankingTest`**, podemos copiar el código para **`getAverage()`** y cambiar la forma en que se adquiere la Session, como se muestra en el Listado 3-18.

**Listado 3-18. Recuperación de un `Ranking` para un tema - Subject**

```java
@Override
public int getRankingFor(String subject, String skill) {

    try (Session session = SessionUtil.getSession()) {
        Transaction tx = session.beginTransaction();

        int average = getRankingFor(session, subject, skill);
        tx.commit();
        return average;
    }
}

private int getRankingFor(Session session, String subject,
                          String skill) {
                          
    Query<Ranking> query = session.createQuery("from Ranking r "
            + "where r.subject.name=:name "
            + "and r.skill.name=:skill", Ranking.class);
    query.setParameter("name", subject);
    query.setParameter("skill", skill);

    IntSummaryStatistics stats = query
            .list()
            .stream()
            .collect(Collectors.summarizingInt(Ranking::getRanking));

    return (int) stats.getAverage();
}
```

Al igual que con el método **`addRanking()`**, el método visible públicamente asigna una sesión y luego la delega a un método interno, y es por la misma razón: es posible que queramos calcular el promedio en una **`Session`** existente. (Veremos esto en acción en la siguiente sección, cuando queramos actualizar una clasificación).

Para que conste, este método interno sigue siendo horrible. Funciona, pero podemos optimizarlo bastante. Sin embargo, nuestros conjuntos de datos han sido tan pequeños que no ha tenido sentido. Vamos a llegar.

Ahora, cuando ejecutamos la prueba (con **`mvn package`** en el directorio de nivel superior, o a través de su IDE, si está usando uno), **`AddRankingTest`** pasa, sin drama, que es exactamente lo que queremos. Aún más satisfactorio, si queremos jugar con las partes internas de **`HibernateRankingService`**, podemos; podremos saber tan pronto como algo se rompa porque nuestras pruebas requieren que las cosas funcionen.

Además, si miras con mucho cuidado, bueno, no tanto, porque es bastante obvio, verás que también hemos logrado seguir el camino de cumplir con otro de nuestros requisitos: determinar el promedio de **`Ranking`** para la **`Skill`** de un sujeto determinado. Sin embargo, dicho esto, aún no tenemos una prueba rigurosa. Llegaremos allí también.

### Actualizar un `Ranking`

A continuación, nos ocupamos de la (poco probable) situación de actualizar un **`Ranking`**. Esto es potencialmente muy simple, pero debemos pensar en lo que sucede si no existe un **`Ranking`** preexistente. Imagine a Drew Lombardo tratando de cambiar el dominio de Mule de J. C. Smell a 8, cuando aún no se ha molestado en ofrecer ningun **`Ranking`** previa para J. C. y Mule.

Probablemente no necesitemos pensar demasiado en ello, porque en esta situación es probable que solo añadamos el **`Ranking`**, pero otras aplicaciones más críticas pueden querer dedicar más tiempo a pensar.

Tal como están las cosas, creemos dos pruebas: una que use un **`Ranking`** existente y otra que use un **`Ranking`** inexistente; consulte el Listado 3-19.

**Listado 3-19. Tests para actualizar `Ranking`**

```java
@Test
public void updateExistingRanking() {
    service.addRanking("Gene Showrama", "Scottball Most", "Ceylon", 6);
    assertEquals(service.getRankingFor("Gene Showrama", "Ceylon"), 6);
    service.updateRanking("Gene Showrama", "Scottball Most", "Ceylon", 7);
    assertEquals(service.getRankingFor("Gene Showrama", "Ceylon"), 7);
}

@Test
public void updateNonexistentRanking() {
    assertEquals(service.getRankingFor("Scottball Most", "Ceylon"), 0);
    service.updateRanking("Scottball Most", "Gene Showrama", "Ceylon", 7);
    assertEquals(service.getRankingFor("Scottball Most", "Ceylon"), 7);
}
```

Estas dos pruebas son muy simples.

**`updateExistingRanking()`** primero agrega un **`Ranking`**, luego verifica que se haya agregado correctamente; actualiza ese mismo **`Ranking`**, luego determina si el promedio ha cambiado. Dado que esta es la única **`Ranking`** para esta materia y esta **`Skill`**, el promedio debe coincidir con la **`Ranking`** modificada.

**`updateNonExistentRanking()`** hace casi lo mismo: se asegura de que no tengamos nada para este tema y **`Skill`** (es decir, busca 0, nuestro valor de señal para "no existen rankings"), luego "actualiza" ese **`Ranking`** (que, de acuerdo con nuestros requisitos, debe agregar el **`Ranking`**), y luego verifica el promedio resultante.

Ahora veamos el código del servicio utilizado para poner esto en práctica, como se muestra en el Listado 3-20.

**Listado 3-20. El código para actualizar un `Ranking`**

```java
@Override
public void updateRanking(String subject, String observer, String skill, int rank) {
    try (Session session = SessionUtil.getSession()) {
        Transaction tx = session.beginTransaction();

        Ranking ranking = findRanking(session, subject, observer, skill);
        if (ranking == null) {
            addRanking(session, subject, observer, skill, rank);
        } else {
            ranking.setRanking(rank);
        }
        tx.commit();
    }
}

private Ranking findRanking(Session session, String subject,
                            String observer, String skill) {
    Query<Ranking> query = session.createQuery("from Ranking r where "
            + "r.subject.name=:subject and "
            + "r.observer.name=:observer and "
            + "r.skill.name=:skill", Ranking.class);
    query.setParameter("subject", subject);
    query.setParameter("observer", observer);
    query.setParameter("skill", skill);
    Ranking ranking = query.uniqueResult();
    return ranking;
}
```

Vale la pena considerar que este código podría ser más eficiente para lo que hace. Dado que no hay ningún estado que preservar del registro que se modificó, es factible eliminar el registro por completo si existe, y luego agregar un nuevo registro.

Sin embargo, si las clasificaciones tuvieran una especie de marca de tiempo, tal vez los atributos **`createTimestamp`** y **`lastUpdatedTimestamp`**, entonces, en este escenario, una actualización (como lo hacemos aquí) tiene más sentido. Nuestro modelo de datos aún no está completo; deberíamos anticipar la adición de campos como estos en algún momento.

### Eliminar un `Ranking`

Eliminar un **`Ranking`** tiene dos condiciones a considerar: una es que el **`Ranking`** exista (¡por supuesto!) y la otra es que no exista. Puede ser que nuestros requisitos arquitectónicos exijan que la eliminación de un **`Ranking`** que no está realmente presente sea un error; pero para este caso, asumiremos que la eliminación simplemente intenta validar que el **`Ranking`** no existe.

Aquí está nuestro código de prueba, que se muestra en el Listado 3-21:

**Listado 3-21. Tests que validan la eliminación de un `Ranking`

```java
@Test
public void removeRanking() {
    service.addRanking("R1", "R2", "RS1", 8);
    assertEquals(service.getRankingFor("R1", "RS1"), 8);
    service.removeRanking("R1", "R2", "RS1");
    assertEquals(service.getRankingFor("R1", "RS1"), 0);
}

@Test
public void removeNonexistentRanking() {
    service.removeRanking("R3", "R4", "RS2");
}
```

Las pruebas deben ser bastante fáciles de realizar.

La primera prueba (**`removeRanking()`**) crea un **`Ranking`** y valida que nos da un promedio conocido, luego lo elimina, lo que debería cambiar el promedio nuevamente a **`0`** (lo que indica que no existen datos para ese **`Ranking`**, como ya se indicó).

La segunda prueba llama a **`removeRanking()`** que no debería existir (porque no lo creamos en ninguna parte); no debería cambiar nada sobre el tema.

Vale la pena señalar que nuestras pruebas son bastante completas, pero no tan completas como podrían ser. Por ejemplo, algunas de nuestras pruebas podrían estar agregando datos a la base de datos sin darse cuenta, dependiendo de cómo se escriban los servicios. Si bien eso no es muy importante para esta aplicación, vale la pena pensar en cómo validar el estado completo de la base de datos después de ejecutar una prueba.

### Encuentre el Average Ranking para la Skill de un sujeto

Nos acercamos al punto en el que comenzamos a agotar el código base escrito para probar nuestro modelo de datos. Es hora de verificar el código que calcula el **`Ranking`** promedio para una habilidad determinada para un tema determinado. Ya hemos usado este código para verificar algunos de nuestros otros requisitos (de hecho, todos hasta ahora), pero lo hemos hecho con datos limitados. Lancemos más datos al método **`getRankingFor()`** para validar que realmente está haciendo lo que se supone que debe hacer.

Aquí está nuestro código de prueba, que se muestra en el Listado 3-22:

**Listado 3-22. Un Test que valida nuestro mecanismo de Ranking **

```java
@Test
public void validateRankingAverage() {
    service.addRanking("A", "B", "C", 4);
    service.addRanking("A", "B", "C", 5);
    service.addRanking("A", "B", "C", 6);
    assertEquals(service.getRankingFor("A", "C"), 5);
    service.addRanking("A", "B", "C", 7);
    service.addRanking("A", "B", "C", 8);
    assertEquals(service.getRankingFor("A", "C"), 6);
}
```

En realidad, no tenemos ningún cambio para el servicio; está usando el método **`getRankingFor()`** que ya hemos visto.

### Buscar todos los Rankings de un tema

Lo que estamos buscando aquí es una lista de **`Skills`**, con sus promedios, para un tema determinado.

Tenemos algunas opciones sobre cómo podemos representar estos datos; ¿Queremos un **`Map`**, para que podamos localizar fácilmente qué nivel de **`Skill`** corresponde a una **`Skill`**? ¿Queremos una cola **`queue`**, para que los niveles de habilidad se clasifiquen en orden?

Esto dependerá de los requisitos arquitectónicos para la interacción. En este nivel (y para este diseño de aplicación en particular), usaremos un **`Map`**; nos da los datos que necesitamos (un conjunto de **`Skills`** con sus **`Rankings`** promedio) con una estructura de datos simple. Eventualmente, revisaremos este requisito y lo cumpliremos de manera más eficiente.

Como de costumbre, escribamos nuestro código de prueba y luego hagamos que se ejecute correctamente; vea el Listado 3-23.

**Listado 3-23. Código de prueba para los `Rankings` de `Skills` de una `Person`**

```java
@Test
public void findAllRankingsEmptySet() {
    assertEquals(service.getRankingFor("Nobody", "Java"),0);
    assertEquals(service.getRankingFor("Nobody", "Python"),0);
    Map<String, Integer> rankings=service.findRankingsFor("Nobody");

    // make sure our dataset size is what we expect: empty
    assertEquals(rankings.size(), 0);
}

@Test
public void findAllRankings() {
    assertEquals(service.getRankingFor("Somebody", "Java"),0);
    assertEquals(service.getRankingFor("Somebody", "Python"),0);
    service.addRanking("Somebody", "Nobody", "Java", 9);
    service.addRanking("Somebody", "Nobody", "Java", 7);
    service.addRanking("Somebody", "Nobody", "Python", 7);
    service.addRanking("Somebody", "Nobody", "Python", 5);
    Map<String, Integer> rankings=service.findRankingsFor("Somebody");

    assertEquals(rankings.size(), 2);
    assertNotNull(rankings.get("Java"));
    assertEquals(rankings.get("Java"), new Integer(8));
    assertNotNull(rankings.get("Python"));
    assertEquals(rankings.get("Python"), new Integer(6));                                                                                                               
}
```

Tenemos dos pruebas aquí, por supuesto: la primera busca un sujeto para el que no debería haber datos, y valida que obtuvimos un conjunto de datos vacío a cambio.

El segundo valida que no tenemos datos para el tema, completa algunos datos y luego busca el conjunto de promedios de **`Ranking`**. Luego se asegura de que tengamos el recuento de promedios que esperamos y valida que las **`Rankings`** en sí sean lo que esperamos.

Nuevamente, es factible escribir pruebas más completas, quizás, pero estas pruebas validan si se cumplen nuestros requisitos simples. Todavía no estamos comprobando los efectos secundarios, pero eso está fuera del alcance de este capítulo.<sup>11</sup>

Así que veamos el código de **`findAllRankings()`**. Como de costumbre, tendremos un método público y luego un método interno que participa en una **`Session`** existente, como se muestra en el Listado 3-24:

**Listado 3-24. Métodos de servicio para encontrar Rankings**

```java
@Override
public Map<String, Integer> findRankingsFor(String subject) {
    Map<String, Integer> results;
    Session session = SessionUtil.getSession();
    Transaction tx = session.beginTransaction();

    results=findRankingsFor(session, subject);

    tx.commit();
    session.close();

    return results;
}

private Map<String, Integer> findRankingsFor(Session session, String subject) {
    Map<String, Integer> results=new HashMap<>();

    Query query = session.createQuery("from Ranking r where "
            + "r.subject.name=:subject order by r.skill.name");
    query.setParameter("subject", subject);
    List<Ranking> rankings=query.list();
    String lastSkillName="";
    int sum=0;
    int count=0;
    for(Ranking r:rankings) {
        if(!lastSkillName.equals(r.getSkill().getName())) {
            sum=0;
            count=0;
            lastSkillName=r.getSkill().getName();
        }
        sum+=r.getRanking();
        count++;
        results.put(lastSkillName, sum/count);
    }
    return results;
}
```

El método interno **`findRankingsFor()`** (al igual que todos nuestros métodos que calculan promedios) no es realmente muy atractivo. Utiliza un mecanismo de ruptura de control para calcular los promedios a medida que iteramos a través de los **`Rankingss`**.<sup>12</sup>

De acuerdo con la página de Wikipedia sobre ruptura de control ( http://en.wikipedia.org/wiki/Control_break ), “con lenguajes de cuarta generación como SQL, el lenguaje de programación debería manejar la mayoría de los detalles de las rupturas de control automáticamente. ” Eso es absolutamente correcto, y también es por eso que he estado señalando la ineficiencia de todas estas rutinas. Estamos haciendo manualmente algo que la base de datos (e Hibernate) debería poder hacer por nosotros, y puede hacerlo. Simplemente no estamos usando esa capacidad todavía. Finalmente llegaremos allí cuando veamos el próximo requisito de solicitud.

Es posible usar la Streams API en Java para convertir la lista de **`Rankings`** en un mapa de **`Skill`** y el promedio de esa **`Skill`**. Sin embargo, es casi tan artificial como el corte de control que se usa aquí, y es más difícil de leer para la mayoría de las personas. Al final, dado que la base de datos debe calcular el promedio de todos modos, usar la API Streams para esto es una exageración.

En cualquier caso, las nuevas pruebas deberían poder pasar (quizás no con gran éxito, porque los servicios subyacentes reales no se realizan teniendo en cuenta la eficiencia), lo que nos permite pasar al último requisito (y probablemente el más complicado).

### Encuentre el tema mejor calificado para una habilidad

Con este requisito, queremos averiguar quién ocupa el puesto más alto en una **`Skill`** determinada; si tenemos tres personas clasificadas para Java, queremos la que tenga la mejor puntuación media. Si no hay clasificaciones para esta habilidad, queremos una respuesta nula como valor de señal. A las pruebas; veamos el Listado 3-25:

**Listado 3-25. Las pruebas para encontrar a la mejor Persona para una determinada Habilidad**

```java
@Test
public void findBestForNonexistentSkill() {
    Person p = service.findBestPersonFor("no skill");
    assertNull(p);
}

@Test
public void findBestForSkill() {
    service.addRanking("S1", "O1", "Sk1", 6);
    service.addRanking("S1", "O2", "Sk1", 8);
    service.addRanking("S2", "O1", "Sk1", 5);
    service.addRanking("S2", "O2", "Sk1", 7);
    service.addRanking("S3", "O1", "Sk1", 7);
    service.addRanking("S3", "O2", "Sk1", 9);
    // data that should not factor in!
    service.addRanking("S3", "O1", "Sk2", 2);
    Person p = service.findBestPersonFor("Sk1");
    assertEquals(p.getName(), "S3");
}
```

Nuestra primera prueba debería ser obvia: dada una **`Skill`** inexistente, no deberíamos recuperar a una **`Person`**. (Esto sigue nuestra convención establecida que sugiere el uso de un valor de señal en lugar de una excepción).

Nuestra segunda prueba crea tres sujetos, cada uno con Skills en "Sk1", sea lo que sea. (Es "capacidad para servir como datos de prueba".) S1 tiene un promedio de 7, S2 tiene un promedio de 6 y S3 tiene un promedio de 8. Por lo tanto, debemos esperar que S3 sea el propietario de la mejor clasificación. Estamos agregando algunos datos atípicos solo para asegurarnos de que nuestro servicio se limite a los datos reales que está tratando de encontrar.

¡Tenga en cuenta que en realidad no estamos devolviendo el promedio de la Habilidad! Para una aplicación real, es muy probable que sea un requisito; podría cumplirse fácilmente llamando inmediatamente a **`getRankingFor()`**, pero tal como está diseñado, es una operación muy costosa (que implica la creación de una nueva **`Session`** y una serie de viajes de ida y vuelta a la base de datos). Volveremos a visitar esto en poco tiempo; aquí, estamos usando la menor cantidad de tipos de objetos que podemos.

Así que veamos un poco de código en el Listado 3-26. Y finalmente entraremos en una consulta más capaz (y veremos cómo podríamos haber estado escribiendo algunas de nuestras otras consultas de manera más eficiente).

**Listado 3-26. Código para encontrar el promedio más alto para una habilidad dada**

```java
@Override
public Person findBestPersonFor(String skill) {
    Person person = null;
    try (Session session = SessionUtil.getSession()) {
        Transaction tx = session.beginTransaction();

        person = findBestPersonFor(session, skill);

        tx.commit();
    }
    return person;
}

private Person findBestPersonFor(Session session, String skill) {
    Query<Object[]> query = session.createQuery("select r.subject.name, avg(r.ranking)"
            + " from Ranking r where "
            + "r.skill.name=:skill "
            + "group by r.subject.name "
            + "order by avg(r.ranking) desc", Object[].class);
    query.setParameter("skill", skill);
    List<Object[]> result = query.list();
    if (result.size() > 0) {
        return findPerson(session, (String) result.get(0)[0]);
    }
    return null;
}
```

Nuestro método público sigue la convención que hemos establecido hasta ahora: crear una sesión y luego delegar a un método interno.

Sin embargo, el método interno hace algunas cosas que no hemos visto hasta ahora, comenzando con un tipo diferente de consulta.

La mayoría de nuestras consultas han sido del formulario "FROM class alias WHERE condition", que es bastante simple. Hibernate está generando SQL que usa un nombre de tabla y puede hacer uniones automáticamente para iterar sobre un árbol de datos ("r.skillname", por ejemplo), pero la forma general es muy simple.

Aquí, tenemos una cláusula SELECT real. Aquí está la consulta completa tal como está escrita en el código:

## Summary
