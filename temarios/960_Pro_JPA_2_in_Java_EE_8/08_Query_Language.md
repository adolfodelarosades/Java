# Chapter 8: Query Language 

* Introducing JP QL
   * Terminology
   * Example Data Model
   * Example Application
* Select Queries
   * SELECT Clause
   * FROM Clause
   * WHERE Clause
   * Inheritance and Polymorphism
   * Scalar Expressions
   * ORDER BY Clause
* Aggregate Queries
   * Aggregate Functions
   * GROUP BY Clause
   * HAVING Clause
* Update Queries
* Delete Queries
* Summary

# Capítulo 8: Lenguaje de Consulta

La API de persistencia de Java proporciona dos métodos para consultar entidades: el lenguaje de consulta de persistencia de Java (JPQL) y la API de criterios.

El lenguaje de consulta de persistencia de Java (JP QL) es el lenguaje de consulta estándar basado en cadenas de JPA. Es un lenguaje de consulta portátil diseñado para combinar la sintaxis y la semántica de consulta simple de SQL con la expresividad de un lenguaje de expresión orientado a objetos. Las consultas escritas con este lenguaje se pueden compilar de forma portátil en SQL en todos los principales servidores de bases de datos.

La API Criteria se utiliza para crear consultas con seguridad de tipos utilizando las API del lenguaje de programación Java cuando se consultan entidades y sus relaciones.

En el último capítulo, analizamos la programación utilizando las interfaces de consulta y presentamos una breve introducción a JP QL para usuarios que ya tienen experiencia con SQL. Este capítulo explora el lenguaje de consulta en detalle, desglosando el lenguaje pieza por pieza con ejemplos para demostrar sus características.

## Introdución JP QL

Para describir qué es JP QL, es importante aclarar qué no es. JP QL no es SQL. A pesar de las similitudes entre los dos idiomas en términos de palabras clave y estructura general, existen diferencias muy importantes. Intentar escribir JP QL como si fuera SQL es la forma más fácil de frustrarse con el lenguaje. Las similitudes entre los dos lenguajes son intencionales (dando a los desarrolladores una idea de lo que JP QL puede lograr), pero la naturaleza orientada a objetos de JP QL requiere un tipo de pensamiento diferente.

Si JP QL no es SQL, ¿qué es? En pocas palabras, JP QL es un lenguaje para consultar entidades. En lugar de tablas y filas, *la moneda del idioma son entidades y objetos*. Nos proporciona una forma de expresar consultas en términos de entidades y sus relaciones, operando en el estado persistente de la entidad como se define en el modelo de objetos, no en el modelo de base de datos física.

Si JPA admite consultas SQL, ¿por qué introducir un nuevo lenguaje de consulta? Hay un par de razones importantes para considerar JP QL sobre SQL. El primero es la portabilidad. ***JP QL se puede traducir a los dialectos SQL de los principales proveedores de bases de datos***. La segunda es que las consultas se escriben en el modelo de dominio de entidades persistentes, sin necesidad de saber exactamente cómo se asignan esas entidades a la base de datos.

Comparemos un poco las API de JPQL y Criteria.

Las consultas JPQL son generalmente más concisas y legibles que las consultas Criteria. JPQL es fácil de aprender para programadores con conocimientos previos de SQL.

Las consultas JPQL no son seguras en los tipos, lo que significa que requieren una conversión al recuperar el resultado de la consulta del Entity Manager. Debido a eso, es posible que los errores de conversión de tipos no se detecten durante la compilación.

Además, las consultas JPQL no admiten parámetros abiertos.

Las consultas de Criteria API son seguras para los tipos y, por lo tanto, no requieren conversión.

Al comparar el rendimiento entre JPQL y Criteria API, las consultas Criteria API proporcionan un mejor rendimiento porque las consultas dinámicas JPQL deben analizarse cada vez que se llaman.

Una de las desventajas comunes de las consultas de Criteria API es que suelen ser más detalladas que las consultas JPQL. Esto significa que requerirán que los programadores creen muchos objetos y realicen operaciones en esos objetos antes de enviar la consulta Criteria API al Entity Manager.

Los ejemplos de este capítulo demuestran el poder presente incluso en las expresiones JP QL más simples.

Adoptar JP QL no significa perder todas las funciones de SQL a las que se ha acostumbrado. Se admite directamente una amplia selección de características SQL, incluidas subconsultas, consultas agregadas, declaraciones UPDATE y DELETE, numerosas funciones SQL y más.

### TERMINOLOGÍA

Las consultas(queries) se dividen en una de cuatro categorías: ***select***, ***aggregate***, ***update*** y ***delete*** (seleccionar, agregar, actualizar y eliminar). Las Select queries recuperan el estado persistente de una o más entidades y filtran los resultados según sea necesario. Las Aggregate queries son variaciones de consultas seleccionadas que agrupan los resultados y producen datos de resumen. En conjunto, las consultas select y aggregate a veces se denominan consultas de informes, ya que se centran principalmente en generar datos para informes. Las consultas de Update y delete (actualización y eliminación) se utilizan para modificar condicionalmente o eliminar conjuntos completos de entidades. Encontrará cada tipo de consulta descrito en detalle en su propia sección de este capítulo.

Las consultas operan en el conjunto de entidades y elementos integrables(embeddables) definidos por una unidad de persistencia. Este conjunto de entidades y elementos integrables(embeddables) se conoce como ***esquema de persistencia abstracto***, cuya colección define el dominio general del que se pueden recuperar los resultados.

> **NOTA** *Para permitir que este capítulo se utilice como complemento del capítulo Lenguaje de consulta de la especificación de la API de persistencia de Java, se utiliza la misma terminología siempre que sea posible.*

En las expresiones de consulta, las entidades se denominan por su nombre. Si una entidad no ha sido nombrada explícitamente (usando el atributo de nombre de la anotación `@Entity`, por ejemplo), el nombre de clase no calificado se usa por defecto. Este nombre es el nombre de esquema abstracto de la entidad en el contexto de una consulta.

Las entidades se componen de una o más propiedades de persistencia implementadas como campos o propiedades JavaBean. El tipo de esquema abstracto de una propiedad persistente en una entidad se refiere a la clase o tipo primitivo utilizado para implementar esa propiedad. Por ejemplo, si la entidad `Employee` tiene una propiedad `name` de tipo `String`, el tipo de esquema abstracto de esa propiedad en las expresiones de consulta también es `String`. Las propiedades persistentes simples sin mapeo de relaciones comprenden el estado persistente de la entidad y se denominan campos de estado(state fields). Las propiedades persistentes que también son relaciones se denominan campos de asociación (association fields).

Como vio en el último capítulo, las consultas se pueden definir de forma dinámica o estática. Los ejemplos de este capítulo consisten en consultas que se pueden utilizar de forma dinámica o estática, según las necesidades de la aplicación.

Finalmente, es importante tener en cuenta que ***las consultas no distinguen entre mayúsculas y minúsculas, excepto en dos casos: los nombres de entidad y los nombres de propiedad deben especificarse exactamente como se nombran***

### EJEMPLO DEL MODELO DE DATOS

La Figura 8-1 muestra el modelo de dominio para las consultas de este capítulo. Continuando con los ejemplos que hemos estado usando a lo largo del libro, demuestra muchos tipos de relaciones diferentes, incluidas las relaciones unidireccionales, bidireccionales y autorreferenciales. Agregamos los nombres de los roles a este diagrama para hacer explícitos los nombres de las propiedades de relación.

![08-01](images/08-01.png)

Las asignaciones relacionales(relational mappings) de objetos para este modelo no se incluyen en este capítulo, excepto cuando describimos el equivalente SQL de una consulta en particular. No es necesario saber cómo se asigna un objeto para escribir consultas porque el lenguaje de consulta se basa completamente en el modelo de objeto y las relaciones lógicas entre entidades. ***El trabajo del traductor de consultas es tomar las expresiones de consulta orientadas a objetos e interpretar los metadatos de mapeo para producir el SQL necesario para ejecutar la consulta en la base de datos.***

### EJEMPLO DE LA APLICACIÓN

Aprender un nuevo lenguaje puede ser una experiencia desafiante. Una cosa es leer página tras página de texto que describe las características del lenguaje, pero otra cosa es poner en práctica estas características. Para acostumbrarse a escribir consultas, considere usar una aplicación como la que se muestra en el Listado 8-1. Esta sencilla aplicación lee consultas desde la consola y las ejecuta contra las entidades de una unidad de persistencia particular.

***Listado 8-1*** Aplicación para Testing Queries

```java
package persistence;
import java.io.*;
import java.util.*;
import javax.persistence.*;
import org.apache.commons.lang.builder.*;
public class QueryTester {
   public static void main(String[] args) throws Exception {
      String unitName = args[0];
      EntityManagerFactory emf = Persistence.createEntityManagerFactory(unitName);
      EntityManager em = emf.createEntityManager();
      BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
      for (;;) {
         System.out.print("JP QL> ");
         String query = reader.readLine();
         if (query.equals("quit")) {
            break;
         }
         if (query.length() == 0) {
            continue;
         }
         try {
            List result = em.createQuery(query).getResultList();
            if (result.size() > 0) {
               int count = 0;
               for (Object o : result) {
                  System.out.print(++count + " ");
                  printResult(o);
               }
            } else {
               System.out.println("0 results returned");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }
   private static void printResult(Object result) throws Exception {
      if (result == null) {
         System.out.print("NULL");
      } else if (result instanceof Object[]) {
         Object[] row = (Object[]) result;
         System.out.print("[");
         for (int i = 0; i < row.length; i++) {
            printResult(row[i]);
         }
         System.out.print("]");
      } else if (result instanceof Long ||
         result instanceof Double ||
         result instanceof String) {
         System.out.print(result.getClass().getName() + ": " + result);
      } else {
         System.out.print(ReflectionToStringBuilder.toString(result,
                           ToStringStyle.SHORT_PREFIX_STYLE));
      }
      System.out.println();
   }
}
```

El único requisito para usar esta aplicación es el nombre de una unidad de persistencia que contenga las entidades que desea consultar. La aplicación leerá el nombre de la unidad de persistencia desde la línea de comando e intentará crear una `EntityManagerFactory` para ese nombre. Si la inicialización es exitosa, las consultas se pueden escribir en el indicador `JP QL>`. La consulta se ejecutará y los resultados se imprimirán. El formato de cada resultado es el nombre de la clase seguido de cada una de las propiedades de esa clase. Este ejemplo utiliza la biblioteca ***Apache Jakarta Commons-Lang library*** para generar el resumen del objeto. El Listado 8-2 muestra una sesión de muestra con la aplicación.

***Listado 8-2*** Ejemplo Session con QueryTester
```sh
JP QL> SELECT p FROM Phone p WHERE p.type NOT IN ('office', 'home')
1 Phone[id=5,number=516-555-1234,type=cell,employee=Employee@13c0b53]
2 Phone[id=9,number=650-555-1234,type=cell,employee=Employee@193f6e2]
3 Phone[id=12,number=650-555-1234,type=cell,employee=Employee@36527f]
4 Phone[id=18,number=585-555-1234,type=cell,employee=Employee@bd6a5f]
5 Phone[id=21,number=650-555-1234,type=cell,employee=Employee@979e8b]
JP QL> SELECT d.name, AVG(e.salary) FROM Department d JOIN d.employees e ➥
GROUP BY d.name
1 [java.lang.String: QA
java.lang.Double: 52500.0
]
2 [java.lang.String: Engineering
java.lang.Double: 56833.333333333336
]
JP QL> quit
```

## Select Queries

Las consultas seleccionadas son el tipo de consulta más importante y facilitan la recuperación masiva de datos de la base de datos. No es sorprendente que las consultas seleccionadas sean también la forma más común de consulta utilizada en las aplicaciones. La forma general de una consulta de selección es la siguiente:

```sql
SELECT <select_expression>
FROM <from_clause>
[WHERE <conditional_expression>]
[ORDER BY <order_by_clause>]
```

La forma más simple de una consulta de selección consta de dos partes obligatorias: la cláusula `SELECT` y la cláusula `FROM`. La cláusula `SELECT` define el formato de los resultados de la consulta, mientras que la cláusula `FROM` define la entidad o entidades de las que se obtendrán los resultados. Considere la siguiente consulta completa que recupera a todos los empleados de la empresa:


```sql
SELECT e
FROM Employee e
```

La estructura de esta query es muy similar a una consulta SQL, pero con un par de diferencias importantes. **La primera diferencia es** que el dominio de la consulta definido en la cláusula `FROM` no es una tabla sino una entidad; en este caso, la entidad `Employee`. Como en SQL, se le ha asignado un alias al identificador `e`. Este valor de alias se conoce como una ***variable de identificación*** y es la clave por la cual se hará referencia a la entidad en el resto de la instrucción de selección. A diferencia de las consultas en SQL, donde un alias de tabla es opcional, ***el uso de variables de identificación es obligatorio en JP QL***.

**La segunda diferencia es** que la cláusula `SELECT` en este ejemplo no enumera los campos de la tabla ni usa un comodín para seleccionar todos los campos. En su lugar, solo se enumera la variable de identificación para indicar que el tipo de resultado de la consulta es la entidad `Employee`, no un conjunto tabular de filas.

A medida que el procesador de consultas itera sobre el conjunto de resultados devuelto por la base de datos, convierte los datos de filas y columnas tabulares en un conjunto de instancias de entidad. El método `getResultList()` de la interfaz `Query` devolverá una colección de cero o más objetos `Employee` después de evaluar la consulta. A pesar de las diferencias de estructura y sintaxis, todas las consultas se pueden traducir a SQL.

Para ejecutar una consulta, el motor de consultas primero crea una representación SQL óptima de la consulta JP QL. La consulta SQL resultante es lo que realmente se ejecuta en la base de datos. En este ejemplo simple, el SQL podría verse así, según los metadatos de mapeo para la entidad `Employee`:

```sql
SELECT id, name, salary, manager_id, dept_id, address_id
FROM emp
```

La instrucción SQL debe leer todas las columnas asignadas necesarias para crear la instancia de entidad, incluidas las columnas de clave externa. Incluso si la entidad está almacenada en caché en la memoria, el motor de consultas normalmente leerá todos los datos necesarios para asegurarse de que la versión almacenada en caché esté actualizada. Tenga en cuenta que si las relaciones entre `Employee` y las entidades `Department` o `Address` hubieran requerido una carga eager, la declaración SQL se ampliaría para recuperar los datos adicionales o se habrían agrupado varias declaraciones para construir completamente la entidad `Employee`. Cada proveedor proporcionará algún método para mostrar el SQL que genera al traducir JP QL. Para el ajuste del rendimiento en particular, comprender cómo su proveedor se acerca a la generación de SQL puede ayudarlo a escribir consultas más eficientes.

Ahora que hemos visto una consulta simple y cubierto la terminología básica, las siguientes secciones se moverán a través de cada una de las cláusulas de la consulta de selección, explicando la sintaxis y las funciones disponibles.

> **NOTA** *Como mostramos en el Capítulo 2, la nueva función de transmisión de consultas incluida en JPA 2.2 nos ayudará a evitar obtener demasiados datos y causar errores. Sin embargo, sigue siendo recomendable y más eficaz utilizar el método `Result Set` de paginación.

### CLÁUSULA SELECT

La cláusula `SELECT` de una query puede adoptar varias formas, incluidas expresiones de ruta(path expressions) simples y complejas, expresiones escalares(scalar expressions), expresiones de constructor (constructor expressions), funciones agregadas(aggregate functions) y secuencias de estos tipos de expresión. Las siguientes secciones presentan expresiones de ruta(path expressions) y discuten los diferentes estilos de cláusulas `SELECT` y cómo determinan el tipo de resultado de la consulta. Aplazamos la discusión de las expresiones escalares hasta explorar las expresiones condicionales en la cláusula `WHERE`. Se describen completamente en la sección denominada "Expresiones escalares". Las funciones agregadas se detallan más adelante en el capítulo de la sección denominada "Consultas agregadas".

#### ***Path Expressions***

Las Path Expressions(expresiones de ruta) son los componentes básicos de las consultas. Se utilizan para navegar fuera de una entidad, ya sea a través de una relación con otra entidad (o colección de entidades) o con una de las propiedades persistentes de una entidad. La navegación que da como resultado uno de los campos de estado persistentes (ya sea campo o propiedad) de una entidad se denomina ruta de campo de estado. La navegación que conduce a una única entidad se denomina ruta de asociación(association path) de valor único, mientras que la navegación a una colección de entidades se denomina ruta de asociación con valor de colección.

El operador de punto (.) Significa navegación de ruta(path navigation) en una expresión. Por ejemplo, si la entidad `Employee` se ha asignado a la variable de identificación `e`, `e.name` es una expresión de ruta de campo de estado que se resuelve en el nombre del empleado. Del mismo modo, la expresión de ruta `e.department` es una asociación de valor único del empleado al departamento al que está asignado. Por último, `e.directs` es una asociación de valor de colección que resuelve la colección de empleados que reportan a un empleado que también es gerente(manager).

Lo que hace que las expresiones de ruta sean tan poderosas es que no se limitan a una sola navegación. En su lugar, las expresiones de navegación se pueden encadenar para atravesar gráficos de entidad complejos siempre que la ruta se mueva de izquierda a derecha a través de asociaciones de un solo valor. Una ruta no puede continuar desde un campo de estado o una asociación con valor de colección. Con esta técnica, podemos construir expresiones de ruta como `e.department.name`, que es el nombre del departamento al que pertenece el empleado. Tenga en cuenta que las expresiones de ruta pueden navegar hacia y a través de objetos incrustados, así como entidades normales. La única restricción sobre los objetos incrustados en una expresión de ruta es que la raíz de la expresión de ruta debe comenzar con una entidad.

Las expresiones de ruta se utilizan en cada cláusula de un select query, determinando todo, desde el tipo de resultado de la consulta hasta las condiciones bajo las cuales se deben filtrar los resultados. La experiencia con path expressions(expresiones de ruta) es la clave para escribir consultas efectivas.

#### ***Entities y Objects (Entidades y Objetos)***

La primera y más simple forma de la cláusula `SELECT` es una única variable de identificación. El tipo de resultado para una consulta de este estilo es la entidad a la que está asociada la variable de identificación. Por ejemplo, la siguiente consulta devuelve todos los departamentos de la empresa:


```sql
SELECT d
FROM Department d
```

La palabra clave `OBJECT` se puede utilizar para indicar que el tipo de resultado de la consulta es la entidad vinculada a la variable de identificación. No tiene ningún impacto en la consulta, pero puede usarse como una pista visual.

```sql
SELECT OBJECT(d)
FROM Department d
```

El único problema con el uso de `OBJECT` es que aunque las expresiones de ruta pueden resolverse en un tipo de entidad, la sintaxis de la palabra clave `OBJECT` se limita a las variables de identificación. La expresión `OBJECT(e.department)` es ilegal aunque `Department` es un tipo de entidad. Por esa razón, no recomendamos la sintaxis `OBJECT`. Existe principalmente por compatibilidad con versiones anteriores del lenguaje que requerían la palabra clave `OBJECT` en el supuesto de que una futura revisión de SQL incluiría la misma terminología.

Una path expression(expresión de ruta) que se resuelve en un campo de estado o una asociación de un solo valor también se puede usar en la cláusula `SELECT`. En este caso, el tipo de resultado de la consulta se convierte en el tipo de la path expression(expresión de ruta), ya sea el tipo de campo de estado o el tipo de entidad de una asociación de un solo valor. La siguiente consulta devuelve los nombres de todos los empleados:

```sql
SELECT e.name
FROM Employee e
```

El tipo de resultado de la path expression(expresión de ruta) en la cláusula `SELECT` es `String`, por lo que la ejecución de esta consulta usando `getResultList()` producirá una colección de cero o más objetos `String`. Las path expression(expresión de ruta) que se resuelven en campos de estado también se pueden utilizar como parte de expresiones escalares, lo que permite transformar el campo de estado en los resultados de la consulta. Discutiremos esta técnica más adelante en la sección llamada "Expresiones escalares".

Las entidades a las que se llega desde una path expression(expresión de ruta) también se pueden devolver. La siguiente consulta demuestra la devolución de una entidad diferente como resultado de la path navigation(navegación de ruta):

```sql
SELECT e.department
FROM Employee e
```

El tipo de resultado de esta consulta es la entidad `Department` porque es el resultado de atravesar la relación de `department` de `Employee` a `Department`. Por tanto, la ejecución de la consulta dará como resultado una colección de cero o más objetos `Department`, incluidos los duplicados.

Para eliminar los duplicados, se debe utilizar el operador `DISTINCT`:

```sql
SELECT DISTINCT e.department
FROM Employee e
```

El operador `DISTINCT` es funcionalmente equivalente al operador SQL del mismo nombre. Una vez que se recopila el conjunto de resultados, los valores duplicados (utilizando la identidad de entidad si el tipo de resultado de la consulta es una entidad) se eliminan para que solo se devuelvan resultados únicos.

El tipo de resultado de una consulta de selección es el tipo correspondiente a cada fila en el conjunto de resultados producido al ejecutar la consulta. Esto puede incluir entidades, tipos primitivos y otros tipos de atributos persistentes, pero nunca un tipo de colección. **La siguiente consulta es ilegal**:

```sql
SELECT d.employees
FROM Department d
```

La path expression (expresión de ruta) `d.employees` es una ruta con valor de colección que produce un tipo de colección. Restringir las consultas de esta manera evita que el proveedor tenga que combinar filas sucesivas de la base de datos en un único objeto de resultado.

Es posible seleccionar objetos incrustables(embeddable) a los que se navega en una path expression(expresión de ruta). La siguiente consulta devuelve solo los objetos embeddable `ContactInfo` para todos los empleados:

```sql
SELECT e.contactInfo
FROM Employee e
```

Lo que hay que recordar sobre la selección de elementos embeddables es que los objetos devueltos no se gestionarán. Si emite una consulta para devolver empleados (`select e FROM Employee e`) y luego, desde los resultados, navegue a sus objetos incrustados `ContactInfo`, obtendrá elementos incrustables que fueron administrados. Los cambios en cualquiera de esos objetos se guardarían cuando se confirmara la transacción. Sin embargo, cambiar cualquiera de los resultados del objeto `ContactInfo` devueltos por una consulta que seleccionó `ContactInfo` directamente no tendría un efecto persistente.

#### ***Combinando Expresiones***

Se pueden especificar varias expresiones en la misma cláusula `SELECT` separándolas con comas. El tipo de resultado de la consulta en este caso es un array de tipo Objeto, donde los elementos del array son el resultado de resolver las expresiones en el orden en que aparecieron en la consulta.

Considere la siguiente consulta que devuelve solo el nombre y el salario de un empleado:

```sql
SELECT e.name, e.salary
FROM Employee e
```

Cuando se ejecuta, se devolverá una colección de cero o más instancias de arrays de tipo Object. Cada array en este ejemplo tiene dos elementos, el primero es un `String` que contiene el nombre del empleado y el segundo es un `Double` que contiene el salario del empleado. ***La práctica de informar solo un subconjunto de los state fields(campos de estado) de una entidad se llama proyección*** porque los datos de la entidad se proyectan fuera de la entidad en forma tabular.

La proyección es una técnica útil para aplicaciones web en las que solo se muestran unos pocos datos de un gran conjunto de instancias de entidades. Dependiendo de cómo se haya asignado la entidad, es posible que se requiera una consulta SQL compleja para recuperar completamente el estado de la entidad. Si solo se requieren dos campos, el esfuerzo adicional invertido en la construcción de la instancia de entidad podría haberse desperdiciado. Una consulta de proyección que devuelve solo la cantidad mínima de datos es más útil en estos casos.


```sql
```

```sql
```

```sql
```


### FROM Clause
### WHERE Clause
### Inheritance and Polymorphism
### Scalar Expressions
### ORDER BY Clause
## Aggregate Queries
### Aggregate Functions
### GROUP BY Clause
### HAVING Clause
## Update Queries
## Delete Queries
## Summary

``
```java
```


``
```java
```


``
```java
```


``
```java
```


``
```java
```

``
```java
```

``
```java
```
``
```java
```


``
```java
```

``
```java
```

``
```java
```

``
```java
```

``
```java
```

``
```java
```

``
```java
```

