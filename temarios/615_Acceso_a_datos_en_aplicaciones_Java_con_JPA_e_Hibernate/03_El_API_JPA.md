# 3. El API JPA 18:53

* 07 El API JPA 05:48
* 08 Primera aplicación JPA 12:05
* Autoevaluación II 01:00

# 07 El API JPA 05:48

<img src="images/7-01.png">

Después de haber estudiado la lección anterior como crear una capa de persistencia vamos a continuación a introducirnos en el uso de la API JPA para poder manejar esa capa de persistencia desde la lógica de una aplicación Java.

<img src="images/7-02.png">

En primer lugar aquí tienes la dirección del Java Doc la ayuda oficial de la API de JPA `https://docs.oracle.com/javaee/7/api/javax/persistence/package-summary.html`, que forma parte como ya sabes de Java Enterprise Edition y que como digo la puedes obtener la puedes ver en esta dirección , para tener a mano las clases e interfaces que vamos a tratar a lo largo de las siguientes elecciones. Otras ayudas pueden ser:

https://www.oracle.com/java/technologies/persistence-jsp.html

https://docs.oracle.com/javaee/7/tutorial/partpersist.htm#BNBPY

El paquete principal `Package javax.persistence`, en donde se encuentran los componentes principales que vamos a estudiar a lo largo de este curso.
El paquete principal Java X persistan en donde se encuentran los componentes principales que vamos a estudiar a lo largo de este curso.

<img src="images/7-03.png">

El primero y más importante de todos es el objeto `EntityManager` es una interfaz que se encuentra en el paquete que te comentaba antes `javax.persistence` los objetos que implementan en esta interfaz se encuentran asociados a una unidad de persistencia, a través de estos objetos es con los que vamos a poder acceder desde nuestra aplicación a dicha unidad de persistencia y poder hacer las operaciones básicas que llamamos CRUD, de crear entidades, recuperar entidades, actualizar entidades y eliminar entidades.

Cómo obtenemos un `EntityManager` lo vamos a ver ahora en la siguiente transparencia pero se hará siempre a través de una factoría que se conoce como el `EntityManagerFactory` que se encuentran asociados a la unidad de persistencia de la que queremos obtener los `EntityManager`.

<img src="images/7-04.png">

El proceso lo vemos aquí, lo primero que hay que hacer es crear un `EntityManagerFactory` factoría que se crea a partir de la clase `Persistence`, `Persistence` tiene un método estático que se llama `createEntityManagerFactory` al que le indicamos la unidad de persistencia lo vemos aquí, directamente la llamada de ese método nos va a devolver ya una factoría asociada a esa  unidad de persistencia para a partir del, cómo ves crear el `EntityManager` utilizando el método `createEntityManager` de la factoría obtenemos ya el `EntityManager`.

Una vez que tenemos Identity Manager vamos a poder acceder a sus métodos y poder hacer esas operaciones CRUD que comentábamos anteriormente aquí las tenemos.

<img src="images/7-05.png">

Las operaciones CRUD se realizarían detrás de estos métodos `persist` le proporcionamos el objeto de la entidad que queremos persistir y lo añadiría a la unidad de persistencia, que básicamente se traduce por detrás en insertar una nueva fila en la base de datos con los datos de ese objeto.

Si lo que queremos es actualizar una entidad que ya existe es decir, con datos de un objeto que ya existe en la base de datos su fila, llamaríamos al método `merge`, lo que hace es un `update` de la entidad, que lanzaría esa instrucción por detrás el motor de persistencia hacia la base de datos.

Si lo que queremos es recuperar una entidad a partir de la Primary Key utilizaríamos este método `find`, en el primer parámetro proporcionariamos la clase de la entidad cuyo objeto queremos recuperar y a partir del segundo parámetro la Primary Key, el método `find` nos devolvería ese objeto, vemos una T que es el tipo de la entidad con la que estemos trabajando, Contacto o lo que sea. Si no existiera un objeto con esa clave primaria asociada nos devolvería `null`.

Y por último para eliminar entidades tenemos el método `remove` proporcionamos el objeto de entidad que queremos eliminar y lo eliminaría, traduciría en un delete hacia la base de datos.

Estas son las operaciones básicas.

Te estarás preguntando si yo lo que quiero es recuperar una entidad pero no a partir de su clave primaria sino a partir de otro criterio o eliminar un conjunto de entidades que cumplan una determinada condición, entonces ya tendríamos que recurrir a las consultas que veremos en posteriores elecciones, estos son digamos los métodos básicos del propio `EntityManager` para realizar estas operaciones básicas.

Por último tenemos otro quinto método `refresh` que lo que hace es refrescarnos una entidad, es decir le proporcionamos un objeto entidad y lo que hace es actualizar sus datos con la información existente actualmente en la base de datos, digamos que lo contrario al `merge`.

<img src="images/7-06.png">

Importante indicar una cosa sobre JPA y es que todas las operaciones de acción es decir eliminar, actualizar y añadir entidades, deben ser incluidas dentro de una transacción, si realizamos un `persist`, un `merge` o un `remove` sin haber marcado una transacción, esas operaciones no se van a realizar físicamente en la base de datos. Entonces esas operaciones como digo deben estar englobadas dentro de una transacción.

Las transacciones, las vamos a gestionar a través del `EntityTransaction` que también se puede obtener a partir del `EntityManager` como ves en la instrucción, dado el `EntityManager` llamando al `getTransaction()` obtendríamos un `EntityTransaction` a partir del `EntityTransaction` podemos marcar la transacción con los métodos clásicos de gestión de transacciones:

* `begin()` para iniciar la transacción.
* `rollback()` si hay que rechazarla 
* `commit()` para confirmar

Si iniciamos una transacción, hacemos una operación y no realizamos un commit, sería como si implícitamente se estuviera haciendo un rollback y por lo tanto no quedaría físicamente registrada esa operación en la base de datos a la que está asociada la capa de persistencia.

Pues bien en la siguiente leccion vamos a ver un primer ejemplo de utilización de este API JPA con las operaciones básicas, a partir de la capa de persistencia creada en la lección anterior.

# 08 Primera aplicación JPA 12:05

# Autoevaluación II 01:00
