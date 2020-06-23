# 8. Apéndices 04:43

* Apéndice A Crear backup de una base de datos MySQL 03:39
* Apéndice B Consultas SQL nativas en JPA 01:04

# Apéndice A Crear backup de una base de datos MySQL 03:39

Hola en este video Quiero explicarte cómo hacer un Bacab de una o varias bases de datos de malla SQL y cómo hacer un postre y una posterior restauración.

Lo primero entramos en el administrador de mi SQL.

Aquí tenemos en la parte izquierda las bases de datos y en la parte superior tenemos un menú con diferentes opciones y una de ellas es Baka que es donde vamos a entrar.

Accedemos a la sección Bacab y pulsamos el botón New proyecto para generar un nuevo Bacab a partir de aquí nos aparece la lista con las bases de datos que tenemos y podemos añadir a la columna de la derecha aquellas bases de datos de las que queremos generar un Bacab un Baka por fin y al cabo va a ser un archivo SQL con las instrucciones de creación de la base de datos la tabla y los registros que tiene que incluir y en ese mismo SQL puede ir la creación de una o de varias bases de datos.

Por ejemplo si las bases de datos con la que hemos estado trabajando a lo largo del curso agenda almacén y banca vamos a generar un backup de las tres bases de datos juntas.

Bueno pues una vez que ya las tenemos añadidas a la parte derecha pulsamos el botón Ejecutar y nos pide la carpeta donde queramos guardar dicho Baka seleccionamos donde queremos colocarlo por ejemplo yo me voy a poner aquí dentro de la carpeta del curso y le damos un nombre al archivo SQL Bacab bases de datos curso y ya está.

Con esto automáticamente en menos de un segundo ahí tenemos ya generado dicho Baka qué tendríamos que hacer en el caso contrario es decir en el mismo equipo o en otro archivo lo podemos trasladar es un archivo con extensión como digo SQL entonces no podemos ver por aquí lo tengo por aquí para que lo puedas comprobar.

Aquí lo tenemos.

Bueno en este caso como al renombrando no le puse la extensión punto SQL agravado sin extensión pero bueno es un archivo SQL lo podríamos ver intentando abrir aquí por ejemplo con el plus para ver su contenido.

Esto es el contenido de dicho archivo está todo lleno de instrucciones SQL de creación de bases datos e inserción de contenidos.

Pues lo cerramos y ahora que queremos restaurarlo en otro equipo nos iríamos a la sección Restore es decir ese archivo lo podemos trasladar en un pendrive y llevarlo a donde queramos y en el equipo destino donde queramos restaurar esa base de datos.

Llegamos a la sección Restore abrir archivos de backup y lo buscamos si aparece tipo SQL en los tipos de archivo que va a localizar.

Pues claro si no tiene la extensión no lo vamos a ver aquí que es donde lo tengo.

Podemos elegir todos los archivos y ahí nos aparecería.

Aquí tenemos a base de datos curso abrimos y simplemente pulsamos el botón está Restore.

Yo no lo voy a pulsar ahora porque como ya las tengo la base de datos creada no tengo que hacer una nueva creación pero si no existiera esa base de datos se generarían directamente con esto.

Pues en una de las lecciones del curso concretamente en la que te explico todos los elementos software que necesitamos para desarrollar aplicaciones basadas en persistencia en la sección de recursos.

Aparte de todo lo que es el propio SQL driver tienes también un archivo SQL éste que acabamos de generar ahora con las bases de datos para que puedas restaurar en tu equipo y utilizarlas en los ejercicios que vamos a estudiar.

# Apéndice B Consultas SQL nativas en JPA 01:04

### Creación de consultas SQL nativas en JPA

Aunque la utilización de JPQL nos permite resolver la gran mayoría de situaciones para la recuperación de datos de una capa de persistencia, es posible que en algún caso nos interese utilizar consultas nativas SQL para la obtención de datos.

JPA soporta la utilización de consultas nativas utilizando el método `createNativeQuery()` de EntityManager. Este método dispone del siguiente formato:

`Query createNativeQuery(String sql)`

Como vemos, se le proporciona como parámetro la instrucción SQL nativa y nos devuelve un objeto Query para tratar los datos

### Manipulación de resultados

Como sabemos, las instrucciones SQL estándares, permiten obtener solamente parte de las columnas de la base de datos, ¿cómo manejamos esta situación en JPA?. Supongamos que tenemos una entidad Empleados que encapsula los datos de los empleados de una hipotética tabla empleados, pero nosotros solo queremos tratar con los campos nombre y edad del empleado, esta sería la forma de ejecutar la consulta nativa:

`Query q=em.createNativeQuery("select e.nombre, e.edad from Empleado e");`

Como vemos, se trata de una consulta estándar de SQL

Para ejecutar la consulta y manipular los resultados, tenemos nuestro método `getResultList()` de la interfaz Query, que nos devolverá una lista de arrays, donde cada array contiene los datos de la fila. En el ejemplo anterior, nos devolverá una lista de arrays de dos elementos, el nombre y la edad del empleado.

Si quisiéramos mostrar estos datos simplemente haremos lo siguiente:

```java
List<Object[]> datos=(List<Object>)q.getResultList();

for(Object[] d:datos){
   System.out.println("Nombre: "+d[0]+"  edad:"+d[1]);
}
```
 

### Enlaces de interés

Página de Oracle:

http://www.oracle.com/technetwork/articles/vasiliev-jpql-087123.html

Tutorial:

https://www.thoughts-on-java.org/jpa-native-queries/

Blog:

https://vladmihalcea.com/the-jpa-entitymanager-createnativequery-is-a-magic-wand/

Ejemplo práctico

https://howtodoinjava.com/jpa/jpa-native-select-sql-query-example/
