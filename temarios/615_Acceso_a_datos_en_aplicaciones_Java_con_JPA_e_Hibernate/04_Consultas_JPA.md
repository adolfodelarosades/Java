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

Cómo lanzamos esa instrucción desde la lógica de negocio de nuestra aplicación hacia la capa de persistencia. Como decíamos a través del *Objeto Query*, un Objeto Query es simplemente una implementación de la interfaz `javax.persistence.Query`.

Y cómo obtenemos ese Objeto Query, bueno pues dada la instrucción JPQL por ejemplo esta

```java
String jpql = Select c From Contacto c";
Query qr=em.createQuery(jpql);
```

para poder crear un Objeto Query que tenga asociada dicha instrucción utilizaríamos el método `createQuery(jpql)` del `EntityManager` siempre como ves el `EntityManager` es el elemento central de JPA a través del método `createQuery(jpql)` le pasamos la cadena `jpql` y no devolverá un Objeto Query listo para poder ejecutar la instrucción JPQL.

<img src="images/9-05.png">

La ejecución de esa instrucción la vamos a realizar a través de los métodos que nos proporciona dicha interfaz Query. Entre los principales métodos destacamos estos tres:

* `List getResultList()` 
* `Object getSingleResult()`
* `void executeUpdate()`


`List getResultList()` en el caso de una `Select` lógicamente nos va a devolver una lista de resultados en forma de `List` de objetos Entidad. 

```java
String jpql = "Select c From Contacto c";
Query qr = em.createQuery(jpql);
//casting al tipo de colección especifica
List<Contacto> contacts = (List<Contacto>)qr.getResultList();
```

Entonces si nosotros lanzamos esta `Select` esta `jpql` hacia la capa de persistencia con el Objeto Query llamando al método `getResultList()`, nos va a dar un Objeto `List` con todos los objetos que cumplen dicha condición en este caso serían todos los contactos, como enviarles un `List` lo devuelven en forma de Object hay que hacer un casting al tipo específico de objetos que esperamos, un casting a una colección de tipo `List` de objetos Contacto.

Si la consulta solamente va a devolver un objeto pues entonces llamaríamos al método `getSingleResult()`, no necesitaríamos llamar al `getResultList()`, `getSingleResult()` nos da un único objeto el único que cumple la condición, eso sí, sí por lo que sea la condición devolviera mas de una entidad, la llamada a este método provocaría una excepción. Este método sólo vamos a utilizarlo cuando estemos seguros de que la `Select` por la condición que le hemos indicado solamente va a devolver un resultado. Como ves también lo devuelve como tipo Object por lo que habría que hacer un casting al tipo de entidad que estamos esperando.

En el caso de instruciones JPQL que ya las veremos en lecciones posteriores que no sean de tipo `Select` sino de actualización masiva o eliminación masiva de entidades utilizaríamos el método `executeUpdate()`, ya lo veremos en lecciones posteriores.

<img src="images/9-06.png">

Tenemos también otra interfaz llamada `TypedQuery` que es una SubInterfaz de Query disponible desde JPA 2, no estaba en las primeras versiones de JPA, que proporsiona los mismos métodos del Quey, es una interfaz pero adaptados digamos para el tipo específico de objetos que esperamos.

Por ejemplo `List<T> getResultList()` ya nos devolvería un `List` del tipo del que hemos creado la consulta.

```java
String jpql = "Select c From Contacto c";
TypedQuery<Contacto> qr = em.createQuery(jpql, Contacto.class);
//No hay que hacer casting
List<Contacto> contacts = qr.getResultList();
```

Partimos también de la JPQL, a la hora de crear un Objeto Query, `TypedQuery` sería el mismo método `createQuery` del `EntityManager` pero como ves es un método que aparece sobrecargado en este caso porque además de la JPQL le debemos indicar el tipo de entidad que queremos recuperar. Entonces esto ya nos devolvería un `TypedQuery` del tipo Contacto que es el tipo que le hemos indicado en `em.createQuery(jpql, Contacto.class)`, como un objeto class. Eso qué significa que a la hora por ejemplo de aplicar el `getResultList()` para obtener los resultados no habría que hacer ningún tipo de casting sino que directamente ya nos devolvería la colección del tipo que se le indica.

En `T getSingleResult()` es exactamente lo mismo devolvería una única entidad, pero ya sería del tipo que le hemos indicado a la hora de crear el `TypedQuery`.

Muy bien pues en la siguiente elección vamos a ver un ejercicio práctico, además va a ser una aplicación web, donde vamos a aplicar todas las consultas JPQL a través de `Query` y `TypedQuery`.

# 10 JPA en aplicaciones Web 06:26

<img src="images/10-01.png">



JPA puede utilizarse en cualquier aplicación Java aunque normalmente vamos a ver su uso casi siempre centrado en el contexto del desarrollo de aplicaciones web en una aplicación web que sigue el patrón modelo vista controlador lo que es la lógica de negocio que es la donde se realiza el acceso a los datos es encapsulado dentro de clases o Enterprise Java.

<img src="images/10-02.png">

<img src="images/10-03.png">

<img src="images/10-04.png">

<img src="images/10-05.png">

En lo que se conoce como el modelo modelo que es utilizado desde el controlador punto central recibe todas las peticiones del cliente y que controla las vistas que sirven para generar las respuestas y el modelo que es el que le va a proporcionar todas las lógicas de negocio a dicha aplicación.

Esto significa que será aquí en esta capa donde vamos a utilizar ese API JPA para acceder a nuestra capa de persistencia que es la que nos va a exponer los datos.

En ese modelo como decíamos puede ser implementado con clases estándares Java o bien interpretada bien que ya lo veremos en una lección posterior dentro de sus métodos sean clases estándares Java o EJB Java.

Es donde vamos a codificar las instrucciones JPA para acceso a la capa de persistencia las aplicaciones web se ejecutan no sólo dentro de la máquina virtual Java sino que requieren de un software adicional conocido como servidor de aplicaciones que es el que gestiona el ciclo de vida de esas aplicaciones web aplicaciones web.

Los elementos fundamentales que son las células y JSP se ejecutan sobre un contenedor llamado contenedor web que forma parte de ese servidor de aplicaciones Java.

Aunque nuestra lógica de negocio esté en clases estándar en Java sí va a formar parte de una aplicación web pues tenemos que disponer de ese servidor de aplicaciones para que la aplicación entera pueda funcionar.

Entonces antes de ver el ejercicio que vamos a presentar a continuación de utilización de JPA con las consultas cuerito y que comentamos en la lección anterior vamos a ver cómo configurar nuestro Eclipse para poder utilizar un servidor de aplicaciones.

Aquí te presentamos algunos de los más utilizados en el desarrollo aplicaciones web y quizá el más sencillo y es el que vamos a hablar con el que vamos a trabajar ahora es el Apache Tomcat Apache Tomcat.

Lo podemos descargar gratuitamente desde la dirección de Apache pintor. La versión de 8 es la más utilizada y como digo en esta dirección. Aquí tienes una sección de descargas donde puedes descargar para 32 bits 64 bit se puede descargar el modo ejecutable o Modo Zip simplemente descomprimir lo que ya está en proceso de instalación es muy sencillo muy básico y una vez que ya lo tengamos instalado descomprimido instalado dependiendo de si hemos elegido un exe o un punto zip en una carpeta de nuestro disco.

Pues lo tenemos que integrará aventuren clips para que luego cuando hagamos una aplicación web podamos usar ese servidor de aplicaciones para probarla.

Bien pues aquí tenemos el Eclipse que tendremos que hacer en él para poder integrar ese servidor de aplicaciones Tomcat que acabamos de descargar.

Lo primero nos vamos a ir a la opción de menú Windows Preferences en Windows Preferences pues hay una serie de propiedades y dentro de la categoría Server tenemos run run the environments donde deberíamos tener registrados los servidores de aplicaciones que queremos utilizar para construir aplicaciones dentro de este paisa actual en el que estamos como no queremos ninguno.

Vamos a registrar a través del botón A desde el servidor de aplicaciones Toccata que lo vamos a encontrar dentro de la lista de tipos de posibles servidores admitidos por el eclipse.

Como ves es posible que a lo mejor en tu versión de Eclipse tengas menos que ello porque hay que yo me he descargado algún plugin adicional para poder disponer de otros servidores aparte del Apache como por ejemplo glacis que también eso lo veremos en una lección posterior cuando queramos utilizar EJB.

Pero bueno en el caso concreto de Tomcat la categoría Apache viene por defecto ya en la versión de Eclipse Java Marthe y nos vamos.

Desplegamos Apache y aquí vemos Apache Tomcat. Elegimos la opción siguiente y ahora se nos pide el directorio de instalación que ya me aparece donde lo tenía seleccionado. En tu caso a través del botón Broewe tendrías que ir a la carpeta donde has descomprimido Tomcat concretamente a la carpeta que se llamará Apache Tomcat y la versión que hayas descargado. Dentro de esta huelga Micco libre etcétera.
Esa es la carpeta raíz de Tomcat en la que hay que elegir la dirección que hay que indicar en ésta. En esta opción.Bueno pues una vez que ya lo tengamos fijados directamente finalizamos y ya lo tenemos disponible para poderlo utilizar en todas las aplicaciones web que hagamos dentro de este país.

Pero para ello nos vamos a cambiar a si vamos a desarrollar aplicaciones web ya no vamos a estar en la perspectiva Java sino bien en la perspectiva Java o en la perspectiva web cualquiera de las dos es igualmente válida cualquiera de Java o web.

Una vez en esa perspectiva se habilitará esta pestaña servidores y si no siempre podemos hacer que se nos muestre por aquí a través de Windows o bien está la pestaña servidores y aquí tenemos que registrar el servidor de los que tendremos en la lista de ruta y en environments.

En nuestro caso sólo tenemos uno elongar pero tenemos que tenerlo registrado aquí para que el Eclipse pueda utilizarlo de cara a probar las aplicaciones.

Entonces pulsamos sobre el enlace y lo mismo volvemos a elegir en la sección del tipo de servidor Apache Tomcat Apache con grado 8 y ahora ya directamente te aparece que se observe Runtime Environment registrado.

Si tuviéramos varios podríamos elegir pero sólo tenemos ocho con el que nos vamos a quedar directamente finalizamos y ya tenemos el servidor registrado.

Ahora mismo está en estado parado pero bueno ya se encargará el propio Eclipse cuando vemos aprobar una aplicación arrancarlo y publicar sobre las aplicaciones.

Eso lo vamos a ver en la siguiente elección en el ejercicio que vamos a desarrollar que es una aplicación web donde vamos a utilizar JPA para acceder a la capa de persistencia utilizando en este caso las consultas y demás.

# 11 Ejercicio práctico I Parte 1 19:04
# 12 Ejercicio práctico I Parte 2 10:01
# 13 Consultas parametrizadas 03:00
# 14 Consultas nominadas 02:28
# 15 Ejercicio práctico II 13:06
# 16 Consultas de acción 04:38
# Autoevaluacion III 00:54
