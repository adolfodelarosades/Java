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

Hay cuatro estados para un objeto en relación con una sesión: persistente, transitorio, desconectado o eliminado.

Cuando creamos un nuevo objeto, es transitorio, es decir, Hibernate no le ha asignado ningún identificador y la base de datos no tiene conocimiento del objeto. Eso no significa que la base de datos no tenga los datos. Imagínese si hubiéramos creado un Ranking manualmente para J. C. Smell, de Gene Showrama, en Java. El nuevo Ranking tendría un análogo en la base de datos, pero Hibernate no sabría que el objeto en la memoria era equivalente a la representación del objeto en la base de datos.

Cuando llamamos a save() en un nuevo objeto, lo marcamos como "persistente", y cuando consultamos la sesión por un objeto, también está en estado persistente. Los cambios se reflejan en la transacción actual y se escriben cuando se confirma la transacción. Podemos convertir un objeto transitorio en un objeto persistente usando Session.merge(), que aún no hemos visto (pero lo haremos).

Un objeto separado es un objeto persistente cuya sesión se ha cerrado o se ha desalojado de una sesión. En nuestro ejemplo de cambio de clasificación, cuando se cierra la sesión, el objeto de clasificación que cambiamos está en estado independiente para la llamada findRanking() aunque lo cargamos desde la base de datos y solía estar en estado persistente.

Un objeto eliminado es uno que se ha marcado para su eliminación en la transacción actual. Un objeto cambia al estado eliminado cuando se llama a Session.delete() para esa referencia de objeto. Tenga en cuenta que un objeto en estado eliminado se elimina en la base de datos pero no en la memoria, al igual que un objeto puede existir en la base de datos sin una representación en memoria.

## Removing Data
## A Note on Transactions
## Writing Our Sample Application
## Summary
