# 4. Consultas JPA 01:05:58

* 09 Consultas. El lenguaje JPQL 06:21
* 10 JPA en aplicaciones Web 06:26
* 11 Ejercicio práctico I Parte 1 19:04
* 12 Ejercicio práctico I Parte 2 10:01
* 13 Consultas parametrizadas 03:00
* 14 Consultas nominadas 02:28
* 15 Ejercicio práctico II 13:06
* 16 Consultas de acción 04:38
* Autoevaluacion III 00:54

# 09 Consultas. El lenguaje JPQL 06:21

<img src="images/9-01.png">

Bueno después de haber visto las operaciones básicas contra la capa de persistencia a través de EntityManager es el momento de ver cómo realizar operaciones más complejas a través de las consultas JPA.

<img src="images/9-02.png">

Las consultas JPA nos van a permitir recuperar, actualizar, modificar grupos de entidades en base a diferentes criterios que no sean siempre la PRIMARY KEY como los métodos básicos que vimos en la lección anterior, para poder ejecutar una consulta JPA hay que definir a través de un lenguaje especial llamado JPQL Java Persisten Query Language, que es muy similar a SQL pero adaptado a la manipulación de entidades en lugar de filas y columnas de tablas de bases de datos.

Estas consultas JPQL, estas instrucciones JPQL, las vamos a poder gestionar a través de los objetos `Query` o `TypedQuery` y del API JPA.

<img src="images/9-03.png">

Vamos a ver primero algunos fundamentos de JPQL. Como hemos dicho es una adaptación del SQL para tratar con entidades. Aquí vemos el formato de una instrucción Select que como ves se parece mucho al SQL normal.

`Select alias From Entidad alias Where condicion`

Select a continuación se indicaría un alias asociado a la entidad, From el nombre de la entidad y el alias que le hemos asociado, Where la condición, la condición emplea los mismos operadores que utilizaríamos en SQL. Es más también las cláusulas `Order By` y `Group by` también se podrían aplicar en la `Select`.

Vamos a ver aquí algún ejemplo.

```sql
Select c From Contacto c
Select e From empleado e Where e.dni="555K"
```

En este caso se trata de una Select que nos permite recuperar todas las entidades de tipo Contacto como ves `Select c` que sería el alias que le hemos asociado a la entidad `From Contacto c` que es el nombre de la entidad y el alias asociado, al no haber clausula `Where` recuperaría todas las entidades Contacto.

En el segundo caso se trata de recuperar todas las entidades de tipo Empleado que cumplen una determinada condición que es que el atributo DNI es igual a cierto valor, como ves en la cláusula `Where` la condición se aplica a partir de los atributos de la entidad, es decir alias de la entidad punto nombre atributo igual mayor, los mismos operadores como decía que se utilizan en la cláusula `Where` de SQL. 

Bien estas son consultas muy sencillas, ya veremos cuando tengamos entidades relacionadas como también incluso se pueden hacer hasta JOINS, pero bueno eso será elecciones posteriores. Esto en cuanto a JPQL.

<img src="images/9-04.png">

<img src="images/9-05.png">

<img src="images/9-06.png">
AQUIIIIII
Cómo lanzamos esa instrucción desde la lógica de negocio de nuestra aplicación hacia la capa de persistencia.

Como decíamos pues a través de El objeto cuerito un objeto cueritos es simplemente una implementación de la interfaz Java X persistan cuerito y cómo obtenemos ese objeto cuerito.

Bueno pues dada la instrucción J.P. cuele por ejemplo para poder crear un objeto Kuric que tenga asociada dicha instrucción utilizaríamos el método create Cury del Himalaya años siempre como veis el City Manager es el elemento central de JPA a través del método create Cuera y le pasamos la cadena JPEG cuele y no devolveré un objeto y listo para poder ejecutar la instrucción JPEG QL.

La ejecución de esa instrucción la vamos a realizar a través de los métodos que nos proporciona dicha interfaz.

Entre los principales métodos destacamos estos tres guerras un Liss en el caso de una Seele lógicamente nos va a devolver una lista de resultados en forma de Lisseth de objetos sentira.

Entonces si nosotros lanzamos esta Select esta J.P. QL hacia la capa de persistencia con el objeto Ueli llamando al método get results nos va a dar un objeto Liss con todos los objetos que cumplen dicha condición en este caso serían todos los contactos como enviarles un Lish lo devuelven en forma de Liz digamos que hacer un casting al tipo específico de objetos que esperamos castin a una colección de tipo List de objetos contando que la consulta solamente va a devolver un objeto pues entonces llamaríamos al QE3 un link sin que el Rasul no necesitaríamos llamar al resurgir sin que resulte nos da un único objeto el único que cumple la condición eso sí sí por lo que sea la condición devolviã mas de una entidad la llamada a este método provocaría una excepción.

Este método sólo vamos a utilizar cuando estemos seguros de que las L.T por la condición que le hemos indicado solamente va a devolver un resultado.

Como veis también lo devuelve como tipo Objet.

Habría que hacer un casting al tipo de entidad que estamos esperando.

En el caso de instruciones JP QL que ya las veremos en elecciones posteriores que no sean de tipo selecto sino de actualización masiva o eliminación masiva de entidades utilizaríamos el método Secot.

Ya lo veremos en lecciones posteriores tenemos también otra interfaz llamada Toit qwerty que es una interfaz de Cleri disponible desde JPA 2 no estaba en las primeras versiones de JPA que proponían los mismos métodos del y es una interfaz pero adaptado digamos para el tipo específico de objetos que esperamos.

Por ejemplo día 3 un Lish ya nos devolvería un Lish del tipo del que hemos creado la consulta a la hora de crear un objeto QWERTY Taipe.

Partimos también de la rapé QL sería el mismo método create Kudrin timan ayer pero como veis es un método que aparece sobrecargado en este caso porque además de la J.P. QL le debemos indicar el tipo de entidad que queremos recuperar con esta cuenta.

Entonces esto ya nos devolviã nos devolvería un Tacuarí del tipo contacto que es el tipo que le hemos indicado como un objeto Flash.

Eso qué significa que la hora por ejemplo de aplicar el single azul para obtener los resultados no habría que hacer ningún tipo de casting sino que directamente ya nos devolvería la colección del tipo que se le indica.

El resultado es exactamente lo mismo devolvería una única entidad pero ya no sería una opción ya sería del tipo que le hemos indicado a la hora de crear el pecuarios.

Muy bien pues en la siguiente elección vamos a ver un ejercicio práctico.

Además va a ser una aplicación web donde vamos a aplicar pues todas las consultas J.P. huele a través de descuella.

# 10 JPA en aplicaciones Web 06:26
# 11 Ejercicio práctico I Parte 1 19:04
# 12 Ejercicio práctico I Parte 2 10:01
# 13 Consultas parametrizadas 03:00
# 14 Consultas nominadas 02:28
# 15 Ejercicio práctico II 13:06
# 16 Consultas de acción 04:38
# Autoevaluacion III 00:54
