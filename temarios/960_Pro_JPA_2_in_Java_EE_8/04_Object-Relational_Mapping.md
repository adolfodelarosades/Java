### Chapter 4: Object-Relational Mapping

* Persistence Annotations
* Accessing Entity State
   * Field Access
   * Property Access
   * Mixed Access
* Mapping to a Table
* Mapping Simple Types
   * Column Mappings
   * Lazy Fetching
   * Large Objects
   * Enumerated Types
   * Temporal Types
   * Transient State
* Mapping the Primary Key
   * Overriding the Primary Key Column
   * Primary Key Types
   * Identifier Generation
* Relationships
   * Relationship Concepts
   * Mappings Overview
   * Single-Valued Associations
   * Collection-Valued Associations
   * Lazy Relationships
* Embedded Objects
* Summary

La mayor parte de una API que persiste objetos en una base de datos relacional termina siendo el componente de mapeo relacional de objetos (ORM). El tema de ORM generalmente incluye todo, desde cómo se asigna el estado del objeto a las columnas de la base de datos hasta cómo emitir consultas entre los objetos. Nos enfocamos en este capítulo principalmente en cómo definir y mapear el estado de la entidad a la base de datos, enfatizando la manera simple en que se puede hacer.

Este capítulo presenta los conceptos básicos de la asignación de campos a las columnas de la base de datos y luego muestra cómo asignar y generar identificadores de entidad automáticamente. Entramos en algunos detalles sobre los diferentes tipos de relaciones e ilustramos cómo se asignan desde el modelo de dominio al modelo de datos.

Las características de ORM más importantes son:

* ***Persistencia idiomática***: Al habilitar la escritura de las clases de persistencia utilizando clases orientadas a objetos.

* ***Alto rendimiento***: Habilitando técnicas de búsqueda y bloqueo.

* ***Confiable***: Al permitir la estabilidad para los programadores JPA.

![04-01](images/04-01.png)

## Persistence Annotations (Anotaciones de Persistencia)

Hemos mostrado en capítulos anteriores cómo las anotaciones se han utilizado ampliamente tanto en las especificaciones EJB como en JPA. Discutimos la persistencia y los metadatos de mapeo con mucho detalle, y debido a que usamos anotaciones para explicar los conceptos, vale la pena revisar algunas cosas sobre las anotaciones antes de comenzar.

***Las anotaciones de persistencia se pueden aplicar en tres niveles diferentes: clase, método y campo***. Para anotar cualquiera de estos niveles, la anotación debe colocarse delante de la definición de código del artefacto que se anota. En algunos casos, los colocamos en la misma línea justo antes de la clase, método o campo; en otros casos, los ponemos en la línea de arriba. La elección se basa completamente en las preferencias de la persona que aplica las anotaciones y creemos que tiene sentido hacer una cosa en algunos casos y la otra en otros. Depende de la longitud de la anotación y de cuál parece ser el formato más legible.

Las anotaciones JPA fueron diseñadas para ser legibles, fáciles de especificar y lo suficientemente flexibles como para permitir diferentes combinaciones de metadatos. La mayoría de las anotaciones se especifican como hermanas en lugar de estar anidadas entre sí, lo que significa que varias anotaciones pueden anotar la misma clase, campo o propiedad en lugar de tener anotaciones incrustadas dentro de otras anotaciones. Sin embargo, al igual que con todas las compensaciones, se debe pagar el gaitero y el costo de la flexibilidad es que muchas posibles permutaciones de metadatos de nivel superior serán sintácticamente correctas pero semánticamente inválidas. El compilador no será de utilidad, pero el tiempo de ejecución del proveedor a menudo hará algunas comprobaciones básicas en busca de agrupaciones de anotaciones incorrectas. Sin embargo, la naturaleza de las anotaciones es que, cuando son inesperadas, a menudo no se notan en absoluto. Vale la pena recordar esto cuando intente comprender un comportamiento que podría no coincidir con lo que pensó que había especificado en las anotaciones. Puede ser que se estén ignorando una o más de las anotaciones.

***Las anotaciones de mapeo se pueden clasificar en una de dos categorías: anotaciones lógicas y anotaciones físicas***. Las anotaciones en el grupo lógico son aquellas que describen el modelo de entidad desde una vista de modelado de objetos. Están estrechamente vinculados al modelo de dominio y son el tipo de metadatos que quizás desee especificar en UML o en cualquier otro lenguaje o marco de modelado de objetos. Las anotaciones físicas se relacionan con el modelo de datos concreto en la base de datos. Se ocupan de tablas, columnas, restricciones y otros artefactos a nivel de base de datos que el modelo de objetos nunca podría conocer de otra manera.

Usamos ambos tipos de anotaciones a lo largo de los ejemplos y para demostrar los metadatos del mapeo. Comprender y poder distinguir entre estos dos niveles de metadatos lo ayudará a tomar decisiones sobre dónde declarar metadatos y dónde usar anotaciones y XML. Como verá en el Capítulo 13, existen equivalentes XML para todas las anotaciones de mapeo descritas en este capítulo, lo que le brinda la libertad de utilizar el enfoque que mejor se adapte a sus necesidades de desarrollo.

## Acceder al Entity State (Estado de la Entidad)

El proveedor debe poder acceder al estado mapeado de una entidad en tiempo de ejecución, de modo que cuando llegue el momento de escribir los datos, puedan obtenerse de la instancia de la entidad y almacenarse en la base de datos. De manera similar, cuando el estado se carga desde la base de datos, el tiempo de ejecución del proveedor debe poder insertarlo en una nueva instancia de entidad. La forma en que se accede al estado en la entidad se denomina modo de acceso.

En el Capítulo 2, aprendió que hay dos formas diferentes de especificar el estado de la entidad persistente: puede anotar los campos o anotar las propiedades de estilo JavaBean. El mecanismo que usa para designar el estado persistente es el mismo que el modo de acceso que usa el proveedor para acceder a ese estado. Si anota campos, el proveedor obtendrá y establecerá los campos de la entidad *mediante la reflexión*. Si las anotaciones se establecen en los métodos getter de las propiedades, el proveedor invocará esos métodos getter y setter para acceder y establecer el estado.

### ACCESO AL CAMPO

Anotar los campos de la entidad hará que el proveedor utilice el acceso al campo para obtener y establecer el estado de la entidad. Los métodos getter y setter pueden estar presentes o no, pero si están presentes, el proveedor los ignora. Todos los campos deben declararse como `protected`, `package` o `private`. **Los campos públicos no están permitidos porque abrirían los campos de estado al acceso de cualquier clase desprotegida en la VM**. Hacerlo no es solo una mala práctica obviamente, sino que también podría frustrar la implementación del proveedor. Por supuesto, los otros calificadores no impiden que las clases dentro del mismo paquete o jerarquía hagan lo mismo, pero existe una compensación obvia entre lo que debería restringirse y lo que debería recomendarse. Otras clases deben usar los métodos de una entidad para acceder a su estado persistente, e incluso la propia clase de entidad solo debería manipular los campos directamente durante la inicialización.

El ejemplo del Listado 4-1 muestra la entidad `Employee` que se asigna mediante el acceso de campo. La anotación `@Id` indica no solo que el campo `id` es el identificador persistente o la clave principal de la entidad, sino también que se debe asumir el acceso al campo. Los campos `name` y `salary` se configuran de forma predeterminada para ser persistentes y se asignan a columnas con el mismo nombre.

***Listado 4-1*** Usando Field Access

```java
@Entity
public class Employee {
   @Id private long id;
   private String name;
   private long salary;
   
   public long getId() { return id; }
   public void setId(long id) { this.id = id; }
   
   public String getName() { return name; }
   public void setName(String name) { this.name = name; }
   
   public long getSalary() { return salary; }
   public void setSalary(long salary) { this.salary = salary; }
}
```

### ACCESO A LA PROPIEDAD

Cuando se usa el modo de acceso a la propiedad, se aplica el mismo contrato que para los JavaBeans, y debe haber métodos getter y setter para las propiedades persistentes. El tipo de propiedad está determinado por el tipo de retorno del método getter y debe ser el mismo que el tipo del parámetro único pasado al método setter. Ambos métodos deben tener visibilidad `public` or `protected`. Las anotaciones de mapeo de una propiedad deben estar en el método getter.

En el Listado 4-2, la clase `Employee` tiene una anotación `@Id` en el método getter `getId()` para que el proveedor use el acceso a la propiedad para obtener y establecer el estado de la entidad. Las propiedades `name` y `salary` se harán persistentes en virtud de los métodos getter y setter que existen para ellos, y se asignarán a las columnas `NAME` y `SALARY`, respectivamente. Tenga en cuenta que la propiedad de salario está respaldada por el campo `salary`, que no comparte el mismo nombre. Esto pasa desapercibido para el proveedor porque al especificar el acceso a la propiedad, le estamos diciendo al proveedor que ignore los campos de la entidad y use solo los métodos getter y setter para nombrar.

***Listado 4-2*** Usando Property Access

```java
@Entity
public class Employee {
   private long id;
   private String name;
   private long wage;
   
   @Id public long getId() { return id; }
   public void setId(long id) { this.id = id; }
    
   public String getName() { return name; }
   public void setName(String name) { this.name = name; }
    
   public long getSalary() { return wage; }
   public void setSalary(long salary) { this.wage = salary; }
}
```

### ACCESO MIXTO

También es posible combinar el acceso al campo con el acceso a la propiedad dentro de la misma jerarquía de entidad, o incluso dentro de la misma entidad. Esta no será una ocurrencia muy común, pero puede ser útil, por ejemplo, cuando se agrega una subclase de entidad a una jerarquía existente que usa un tipo de acceso diferente. Agregar una anotación `@Access` con un modo de acceso especificado en la entidad de subclase hará que el tipo de acceso predeterminado sea anulado para esa subclase de entidad.

La anotación `@Access` también es útil cuando necesita realizar una transformación simple a los datos al leer o escribir en la base de datos. Por lo general, querrá acceder a los datos a través del acceso de campo, pero en este caso, definirá un par de métodos getter/setter para realizar la transformación y usar el acceso a la propiedad para ese atributo. En general, hay tres pasos esenciales para agregar un campo o propiedad persistente para acceder de manera diferente al modo de acceso predeterminado para esa entidad.

Considere una entidad de `Employee` que tiene un modo de acceso predeterminado de `FIELD`, pero la columna de la base de datos almacena el código de área como parte del número de teléfono, y solo queremos almacenar el código de área en el campo de la entidad `phoneNum` si no es un número local. Podemos agregar una propiedad persistente que la transforme en consecuencia en lecturas y escrituras.

Lo primero que se debe hacer es marcar explícitamente el modo de acceso predeterminado para la clase anotándolo con la anotación `@Access` e indicando el tipo de acceso. A menos que se haga esto, no estará definido si se anotan tanto los campos como las propiedades. Etiquetaríamos nuestra entidad `Employee` para que tenga acceso de `FIELD`:

```java
@Entity
@Access(AccessType.FIELD)
public class Employee { ... }
```

El siguiente paso es anotar el campo o propiedad adicional con la anotación `@Access`, pero esta vez especificando el tipo de acceso opuesto al especificado en el nivel de clase. Puede parecer un poco redundante, por ejemplo, especificar el tipo de acceso de `AccessType.PROPERTY` en una propiedad persistente porque es obvio al mirarla que es una propiedad, pero hacerlo indica que lo que está haciendo no es un descuido, pero una excepción consciente al caso predeterminado.

```java
@Access(AccessType.PROPERTY) @Column(name="PHONE")
protected String getPhoneNumberForDb() { ... }
```

El último punto a recordar es que el campo o propiedad correspondiente al que se hace persistente debe marcarse como transitorio para que las reglas de acceso predeterminadas no hagan que el mismo estado persista dos veces. Por ejemplo, debido a que estamos agregando una propiedad persistente a una entidad para la que el tipo de acceso predeterminado es a través de campos, el campo en el que se almacena el estado de la propiedad persistente en la entidad debe anotarse con `@Transient`

```java
:

@Transient private String phoneNum;
```

El Listado 4-3 muestra la clase de entidad `Employee` completa anotada para usar el property access solo para una propiedad.

***Listado 4-3*** Uso de Acceso Combinado

```java
@Entity
@Access(AccessType.FIELD)
public class Employee {

   public static final String LOCAL_AREA_CODE = "613";
  
   @Id private long id;
   @Transient private String phoneNum;
   ...
   public long getId() { return id; }
   public void setId(long id) { this.id = id; }
    
   public String getPhoneNumber() { return phoneNum; }
   public void setPhoneNumber(String num) { this.phoneNum = num; }
    
   @Access(AccessType.PROPERTY) @Column(name="PHONE")
   protected String getPhoneNumberForDb() {
      if (phoneNum.length() == 10)
         return phoneNum;
      else
         return LOCAL_AREA_CODE + phoneNum;
   }
   
   protected void setPhoneNumberForDb(String num) {
      if (num.startsWith(LOCAL_AREA_CODE))
         phoneNum = num.substring(3);
      else
         phoneNum = num;
   }
   ...
}
```

## Mapping a una Tabla

En el Capítulo 2 viste que, en el caso más simple, mapear una entidad a una tabla, no necesita ninguna anotación de mapeo. Solo es necesario especificar las anotaciones `@Entity` y `@Id` para crear y asignar una entidad a una tabla de base de datos.

En esos casos, el nombre de la tabla predeterminado, que era solo el nombre no calificado de la clase de entidad, era perfectamente adecuado. Si sucede que el nombre de la tabla predeterminado no es el nombre que le gusta, o si una tabla adecuada que contiene el estado ya existe en su base de datos con un nombre diferente, debe especificar el nombre de la tabla. Para ello, anota la clase de entidad con la anotación `@Table` e incluye el nombre de la tabla con el elemento `name`. Muchas bases de datos tienen nombres breves para las tablas. El Listado 4-4 muestra una entidad que está asignada a una tabla que tiene un nombre diferente al de su clase.

***Listado 4-4*** Sobreescribir el Nombre de Default de la Tabla

```java
@Entity
@Table(name="EMP")
public class Employee { ... }
```

**TIP** ***Los nombres predeterminados no se especifican en mayúsculas o minúsculas. La mayoría de las bases de datos no distinguen entre mayúsculas y minúsculas, por lo que generalmente no importa si un proveedor usa el nombre de la entidad en mayúsculas o si lo convierte a mayúsculas. En el Capítulo 10, discutimos cómo delimitar los identificadores de la base de datos cuando la base de datos está configurada para distinguir entre mayúsculas y minúsculas.***

La anotación `@Table` brinda la capacidad no solo de nombrar la tabla en la que se almacena el estado de la entidad, sino también de nombrar un esquema o catálogo de base de datos. El nombre de esquema se usa comúnmente para diferenciar un conjunto de tablas de otro y se indica mediante el elemento `schema`. El Listado 4-5 muestra una entidad `Employee` que está mapped a la tabla `EMP` en el esquema de `HR`.

***Listado 4-5*** Establecer un Schema

```java
@Entity
@Table(name="EMP", schema="HR")
public class Employee { ... }
```

Cuando se especifica, el nombre del esquema se antepondrá al nombre de la tabla cuando el proveedor de persistencia vaya a la base de datos para acceder a la tabla. En este caso, el esquema `HR` se antepondrá a la tabla `EMP` cada vez que se acceda a la tabla.

**TIP** ***Algunos proveedores pueden permitir que el esquema se incluya en el elemento de nombre de la tabla sin tener que especificar el elemento de esquema, como en `@Table(name="HR.EMP")`. El soporte para incluir el nombre del esquema con el nombre de la tabla no es estándar.***

Algunas bases de datos apoyan la noción de catálogo. Para estas bases de datos, se puede especificar el elemento `catalog` de la anotación `@Table`. El Listado 4-6 muestra un catálogo que se configura explícitamente para la tabla `EMP`.

***Listado 4-6*** Establecer un Catalog

```java
@Entity
@Table(name="EMP", catalog="HR")
public class Employee { ... }
```

## Mapeo de Tipos Simples

Los tipos simples de Java se asignan como parte del estado inmediato de una entidad en sus campos o propiedades. La lista de tipos persistentes es bastante extensa e incluye prácticamente todos los tipos integrados que le gustaría conservar. Incluyen lo siguiente:

* ***Tipos primitivos de Java***: `byte`, `int`, `short`, `long`, `boolean`, `char`, `float` y `double`

* ***Clases de envoltura de tipos primitivos de Java**: `Byte`, `Integer`, `Short`, `Long`, `Boolean`, `Character`, `Float` y `Double`

* ***Tipos array de byte y character***: `byte[]`, `Byte[]`, `char[]` y `Character[]`

* ***Tipos numéricos grandes***: `java.math.BigInteger` y `java.math.BigDecimal`

* ***Strings***: `java.lang.String`

* ***Tipos temporal de Java***: `java.util.Date` y `java.util.Calendar`

* ***Tipos temporal de JDBC***: `java.sql.Date`, `java.sql.Time` y `java.sql.Timestamp`

* ***Tipos enumerados***: Cualquier sistema o tipo enumerado definido por el usuario

* ***Objetos serializables***: Cualquier sistema o tipo serializable definido por el usuario

A veces, el tipo de columna de la base de datos que se asigna no es exactamente el mismo que el tipo de Java. En casi todos los casos, el tiempo de ejecución del proveedor puede convertir el tipo devuelto por JDBC en el tipo Java correcto del atributo. Si el tipo de la capa JDBC no se puede convertir al tipo Java del campo o propiedad, normalmente se lanzará una excepción, aunque no se garantiza.

**TIP** ***Cuando el tipo persistente no coincide con el tipo JDBC, algunos proveedores pueden optar por realizar una acción propietaria o realizar la mejor suposición para convertir entre los dos. En otros casos, el controlador JDBC podría realizar la conversión por sí solo.***

Al persistir un campo o propiedad, el proveedor observa el tipo y se asegura de que sea uno de los tipos persistentes enumerados anteriormente. Si está en la lista, el proveedor lo persistirá usando el tipo de JDBC apropiado y lo pasará al controlador JDBC. En ese momento, si el campo o la propiedad no se pueden serializar, el resultado no se especifica. El proveedor puede optar por lanzar una excepción o simplemente intentar pasar el objeto a JDBC. Verá en el Capítulo 10 cómo se pueden usar los convertidores para ampliar la lista de tipos que pueden persistir en JPA.

Se puede colocar una anotación `@Basic` opcional en un campo o propiedad para marcarlo explícitamente como persistente. Esta anotación es principalmente para fines de documentación y no es necesaria para que el campo o la propiedad sean persistentes. Si no está allí, se asume implícitamente en ausencia de cualquier otra anotación de mapeo. Debido a la anotación, las asignaciones de tipos simples se denominan asignaciones básicas, ya sea que la anotación `@Basic` esté realmente presente o simplemente se esté asumiendo.

**NOTA** ***Ahora que ha visto cómo puede persistir campos o propiedades y cómo son virtualmente equivalentes en términos de persistencia, simplemente los llamaremos atributos. Un atributo es un campo o propiedad de una clase, y usaremos el término atributo de ahora en adelante para evitar tener que referirnos continuamente a campos o propiedades en términos específicos.***

### MAPPINGS DE COLUMNA

La anotación `@Basic` (o asignación básica asumida en su ausencia) se puede considerar como una indicación lógica de que un atributo dado es persistente. La anotación física que es la anotación que acompaña a la asignación básica es la anotación `@Column`. La especificación de `@Column` en el atributo indica características específicas de la columna de la base de datos física por las que el modelo de objetos está menos preocupado. De hecho, es posible que el modelo de objetos nunca necesite saber a qué columna está asignado, y el nombre de la columna y los metadatos de asignación física se pueden ubicar en un archivo XML separado.

Se pueden especificar varios elementos de anotación como parte de `@Column`, pero la mayoría de ellos se aplican solo a la generación de esquemas y se tratan más adelante en el libro. El único que tiene importancia es el elemento de nombre, que es solo una cadena que especifica el nombre de la columna a la que se ha asignado el atributo. Esto se usa cuando el nombre de columna predeterminado no es apropiado o no se aplica al esquema que se está usando. Puede pensar en el elemento de nombre de la anotación `@Column` como un medio para anular el nombre de columna predeterminado que de otro modo se habría aplicado. El ejemplo del Listado 4-7 muestra cómo anular el nombre de columna predeterminado para un atributo.

***Listing 4-7*** Mapping Attributes a Columns

```java
@Entity
public class Employee {
   @Id
   @Column(name="EMP_ID")
   private long id;
   
   private String name;
   
   @Column(name="SAL")
   private long salary;
   
   @Column(name="COMM")
   private String comments;
   // ...
}
```

Para poner estas anotaciones en contexto, veamos el mapeo de la tabla completo representado por esta entidad. Lo primero que debe notar es que no existe una anotación `@Table` en la clase, por lo que se le aplicará el nombre de tabla predeterminado `EMPLOYEE`.

A continuación, tenga en cuenta que `@Column` se puede usar con asignaciones de `@Id`, así como con asignaciones básicas. El campo de `id` se anula para asignarlo a la columna `EMP_ID` en lugar de a la columna predeterminada `ID`. El campo `name` no está anotado con `@Column`, por lo que el nombre de columna predeterminado `NAME` se usaría para almacenar y recuperar el nombre del empleado. Los campos `salary` y `comments`, sin embargo, están anotados para asignarlos a las columnas `SAL` y `COMM`, respectivamente. Por lo tanto, la entidad `Employee` se asigna a la tabla que se muestra en la Figura 4-2.

![04-02](images/04-02.png)

### LAZY FETCHING

En ocasiones, se sabrá de antemano que rara vez se accederá a determinadas partes de una entidad. En estas situaciones, puede optimizar el rendimiento al recuperar la entidad obteniendo solo los datos a los que espera que se acceda con frecuencia; el resto de los datos se puede recuperar solo cuando o si es necesario. Hay muchos nombres para este tipo de función, incluida la carga diferida (lazy loading,), la carga diferida, la obtención diferida, la obtención bajo demanda, la lectura justo a tiempo, la indirección y otros. Todos significan más o menos lo mismo, que es solo que algunos datos pueden no cargarse cuando el objeto se lee inicialmente desde la base de datos, pero solo se recuperarán cuando se haga referencia a ellos o se acceda a ellos.

El tipo de búsqueda(fetch) de un mapeo básico se puede configurar para que se cargue de manera perezosa o con entusiasmo (lazily or eagerly) especificando el elemento `fetch` en la anotación `@Basic` correspondiente. El tipo enumerado `FetchType` define los valores para este elemento, que pueden ser `EAGER` o `LAZY`. Establecer el tipo de recuperación de una asignación básica en `LAZY` significa que el proveedor puede aplazar la carga del estado de ese atributo hasta que se haga referencia a él. El valor predeterminado es cargar todas las asignaciones básicas con entusiasmo (eagerly). El Listado 4-8 muestra un ejemplo de cómo anular un mapeo básico para cargarlo de forma diferida (lazily loaded).

***Listado 4-8*** Lazy Field Loading

```java
@Entity
public class Employee {
   // ...
   @Basic(fetch=FetchType.LAZY)
   @Column(name="COMM")
   private String comments;
   // ...
}
```

AQUIIIIIIIIIIIIII

![04-03](images/04-03.png)
![04-04](images/04-04.png)
![04-05](images/04-05.png)
![04-06](images/04-06.png)
![04-07](images/04-07.png)
![04-08](images/04-08.png)
![04-09](images/04-09.png)
![04-10](images/04-10.png)
![04-11](images/04-11.png)
![04-12](images/04-12.png)
![04-13](images/04-13.png)
![04-14](images/04-14.png)
![04-15](images/04-15.png)
![04-16](images/04-16.png)
![04-17](images/04-17.png)
![04-18](images/04-18.png)
![04-19](images/04-19.png)
![04-20](images/04-20.png)
![04-21](images/04-21.png)
![04-22](images/04-22.png)
![04-23](images/04-23.png)
