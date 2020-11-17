# 02: Getting Started (Comenzando)

* Entity Overview
   * Persistability
   * Identity
   * Transactionality
   * Granularity
* Entity Metadata
   * Annotations
   * XML
   * Configuration by Exception
* Creating an Entity
* Entity Manager
   * Obtaining an Entity Manager
   * Persisting an Entity
   * Finding an Entity
   * Removing an Entity
   * Updating an Entity
   * Transactions
   * Queries
* Putting It All Together
* Packaging It Up
   * Persistence Unit
   * Persistence Archive
* Summary

2. Comenzando

Uno de los principales objetivos de JPA era que fuera simple de usar y fácil de entender. Aunque el dominio de su problema no puede trivializarse ni diluirse, la tecnología que permite a los desarrolladores abordarlo puede ser sencilla e intuitiva. Este capítulo muestra lo sencillo que puede resultar desarrollar y utilizar entidades.

Comenzamos describiendo las características básicas de las entidades y revisamos los requisitos que debe seguir una clase de entidad. Definimos qué es una entidad y cómo crear, leer, actualizar y eliminar una. También presentamos a los administradores de entidades y cómo se obtienen y utilizan. Luego, echamos un vistazo rápido a las consultas y cubrimos cómo especificar y ejecutar una consulta utilizando los objetos EntityManager y Query. El capítulo concluye mostrando una aplicación de trabajo simple que se ejecuta en un entorno estándar de Java SE y demuestra todo el código de ejemplo en acción.

## Descripción General de la Entity

Una entidad no es algo nuevo en la gestión de datos. De hecho, las entidades han existido por más tiempo que muchos lenguajes de programación y ciertamente más que Java.

En general, una entidad es una representación de Java de la tabla de la base de datos que tiene características como persistencia, identidad, transaccionalidad y granularidad.

Fueron introducidos por Peter Chen en su artículo fundamental sobre el modelado entidad-relación1. Describió las entidades como cosas que tienen atributos y relaciones. La expectativa era que los atributos y las relaciones se conservarían en una base de datos relacional.

Incluso ahora, la definición es cierta. Una entidad es esencialmente un sustantivo o una agrupación de estados asociados como una sola unidad. Puede participar en relaciones con cualquier número de otras entidades de varias formas estándar. En el paradigma orientado a objetos, le agregamos comportamiento y lo llamamos objeto. En JPA, cualquier objeto definido por la aplicación puede ser una entidad, por lo que la pregunta importante podría ser esta: ¿Cuáles son las características de un objeto que se ha convertido en una entidad?

### PERSISTABILITY (PERSISTABILIDAD) 

La primera y más básica característica de las entidades es que son persistentes. Esto generalmente solo significa que se pueden hacer persistentes. Más específicamente, significa que su estado se puede representar en un almacén de datos y se puede acceder a él en un momento posterior, quizás mucho después del final del proceso que lo creó.

Podría llamarlos objetos persistentes, y mucha gente lo hace, pero no es técnicamente correcto. Estrictamente hablando, un objeto persistente se vuelve persistente en el momento en que se instancia en la memoria. Si existe un objeto persistente, entonces, por definición, ya es persistente.

Una entidad es persistente porque se puede guardar en un almacén persistente. La diferencia es que no se persiste automáticamente y que, para que tenga una representación duradera, la aplicación debe invocar activamente un método API para iniciar el proceso. Esta es una distinción importante porque deja el control sobre la persistencia firmemente en manos de la aplicación. La aplicación tiene la flexibilidad de manipular datos y realizar lógica de negocios en la entidad, haciéndola persistente solo cuando la aplicación decide que es el momento adecuado. La lección es que las entidades pueden manipularse sin que necesariamente se persistan, y es la aplicación la que decide si lo son.

### IDENTITY (IDENTIDAD)

Como cualquier otro objeto Java, una entidad tiene una identidad de objeto, pero cuando existe en la base de datos también tiene una identidad persistente. La identidad de objeto es simplemente la diferenciación entre objetos que ocupan memoria. La identidad persistente, o un identificador, es la clave que identifica de forma única una instancia de entidad y la distingue de todas las demás instancias del mismo tipo de entidad. Una entidad tiene una identidad persistente cuando existe una representación de ella en el almacén de datos; es decir, una fila en una tabla de base de datos. Si no está en la base de datos, aunque la entidad en memoria puede tener su identidad establecida en un campo, no tiene una identidad persistente. El identificador de la entidad, entonces, es equivalente a la clave principal en la tabla de la base de datos que almacena el estado de la entidad.

### TRANSACTIONALITY (TRANSACCIONALIDAD)

Las entidades pueden denominarse cuasi transaccionales. Aunque se pueden crear, actualizar y eliminar en cualquier contexto, estas operaciones normalmente se realizan dentro del contexto de una transacción2 porque se requiere una transacción para que los cambios se confirmen en la base de datos. Los cambios realizados en la base de datos tienen éxito o fallan atómicamente, por lo que la vista persistente de una entidad debería ser transaccional.

En la memoria, es una historia ligeramente diferente en el sentido de que las entidades pueden cambiar sin que los cambios persistan. Incluso cuando se inscriben en una transacción, pueden quedar en un estado indefinido o inconsistente en caso de una reversión o una falla en la transacción. Las entidades en memoria son objetos Java simples que obedecen todas las reglas y restricciones que aplica la máquina virtual Java (JVM) a otros objetos Java.

### GRANULARITY (GRANULARIDAD)

Finalmente, una buena forma de mostrar qué son las entidades es describir qué no lo son. No son primitivas, envolturas primitivas ni objetos incorporados con estado unidimensional. Estos no son más que escalares y no tienen ningún significado semántico inherente a una aplicación. Una cadena, por ejemplo, es un objeto demasiado detallado para ser una entidad porque no tiene ninguna connotación específica de dominio. Más bien, una cadena es adecuada y se usa muy a menudo como un tipo para un atributo de entidad y se le da un significado de acuerdo con el atributo de entidad que está escribiendo.

Las entidades están diseñadas para ser objetos detallados que tienen un conjunto de estados agregados que normalmente se almacenan en un solo lugar, como una fila en una tabla, y normalmente tienen relaciones con otras entidades. En el sentido más general, son objetos de dominio empresarial que tienen un significado específico para la aplicación que accede a ellos.

Si bien es cierto que las entidades pueden definirse de manera exagerada para ser tan precisas como almacenar una sola cadena o lo suficientemente generales como para contener 500 columnas de datos, las entidades JPA definitivamente estaban destinadas a estar en el extremo más pequeño de el espectro de granularidad. Idealmente, las entidades deberían diseñarse y definirse como objetos bastante ligeros de un tamaño comparable al del objeto Java medio.
