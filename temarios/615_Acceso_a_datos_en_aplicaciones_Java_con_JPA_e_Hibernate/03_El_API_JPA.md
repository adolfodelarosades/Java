# 3. El API JPA 18:53

* 07 El API JPA 05:48
* 08 Primera aplicación JPA 12:05
* Autoevaluación II 01:00

# 07 El API JPA 05:48

<img src="images/7-01.png">

Después de haber estudiado la lección anterior como crear una capa de persistencia vamos a continuación a introducirnos en el uso de la API JPA para poder manejar esa capa de persistencia desde la lógica de una aplicación Java en primer lugar.

<img src="images/7-02.png">

Pues aquí tienes la dirección del sábado.

La ayuda oficial de la API de JPA que forma parte como ya sabes de Java Enterprise Edition y que como digo la puedes obtener la puedes ver en esta dirección para tener a mano las clases e interfaces que vamos a tratar a lo largo de las siguientes elecciones.

El paquete principal Java X persistan en donde se encuentran los componentes principales que vamos a estudiar a lo largo de este curso.

<img src="images/7-03.png">

El primero y más importante de todos es el objeto Entity maneira timãn ayer pues es una interfaz que se encuentra en el paquete que te comentaba antes.

Java X persisten y los objetos que implementan en esta interfaz se encuentran asociados a una unidad de persistencia a través de estos objetos es con los que vamos a poder acceder desde nuestra aplicación a dicha unidad de persistencia y poder hacer las operaciones básicas que llamamos de crear entidades recuperar entidades actualizar entidades y eliminar entidades.

Cómo obtenemos un timan ayer lo vamos a ver ahora la siguiente transparencia pero se hará siempre a través de una factoría que se conoce como el Entity manager Factory o factorial de ayer que se encuentran asociados a la unidad de persistencia de la que queremos obtener los sentí Timaná y el proceso.

<img src="images/7-04.png">

Nos vemos aquí.

Lo primero que hay que hacer es crear un Inti-Illimani Factory factoría que se crea a partir de la clase persistan persistan tiene un método estático que se llama Create Entity manager Factory al que le indicamos la unidad de persistencia lo vemos aquí directamente la llamada de ese método nos va a devolver ya una factoría sucede de esa unidad de persistencia para a partir del cómo crear el Entity manager utilizando el método create Identity Manager de la factoría de temade Factory obtenemos ya lentísima.

<img src="images/7-05.png">

Una vez que tenemos Identity Manager vamos a poder acceder a sus métodos y poder hacer esas operaciones CRUD que comentábamos anteriormente aquí las tenemos.

Las operaciones son se realizarían detrás de estos métodos Persiles le proporcionamos el objeto de la entidad que queremos persistir y lo añadiría a la unidad de persistencia que básicamente se traduce por detrás en insertar una nueva fila en la base de datos con los datos de ese objeto.

Si lo que queremos es actualizar una entidad que ya existe es decir con datos de un objeto que ya existe en la base de datos su fila llamaríamos al método Merk lo que hace de la entidad que lanzaría su instrucción.

Por detrás el motor de persistencia hacia la base de datos si lo que queremos es recuperar una entidad a partir de la primary key utilizaríamos este método define en primer parámetro proporcionaremos la clase de la entidad cuyo objeto queremos recuperar y a partir del segundo parámetro la primera y qué método nos devolvería ese objeto.

Esa Kyte es el tipo de la entidad con la que estemos trabajando contacto o lo que sea.

Si no existiera un objeto con esa clave primaria ensuciada nos devolvería Nul y por último para eliminar entidades proporcionamos el objeto de entidad que queremos eliminar y métodos remó y lo eliminarían traduciría en un delete hacia la base de datos estas son las operaciones básicas.

Te estarás preguntando si yo lo que quiero es recuperar una entidad pero no a partir de su clave primaria sino a partir de otro criterio o eliminar un conjunto de entidades que cumplan una determinada condición.

Entonces ya tendríamos que recurrir a las consultas que veremos en posteriores elecciones.

Estos son digamos los métodos básicos del propio Entity ayer para realizar estas operaciones básicas por último tenemos otro quinto método que lo que hace es refrescarnos una entidad es decir le proporcionamos un objeto entidad y lo que hace es actualizar sus datos con la información existente actualmente en la base de datos.

<img src="images/7-06.png">

Digamos que lo contrario al bien importante indicar una cosa sobre JPA. 

Y es que todas las operaciones de acción es decir eliminar actualizar y añadir entidades deben ser incluidas dentro de una transacción si realizamos un perfil por ejemplo un Hummer o un Remus sin haber marcado una transacción.

Esas operaciones no se van a realizar físicamente en la base de datos entonces esas operaciones como digo deben estar englobadas dentro de una transacción.

Las transacciones campear la vamos a gestionar a través del Entity transacción que también se puede obtener a partir de la manager como versen.

Esta instrucción dado el Identity Manager llamando al Guez transaction obtendríamos un Entity transaction a partir del 27 transaction podemos marcar la transacción con los métodos clásicos de gestión de transacciones Vein para iniciar la transacción.

Roll Back.

Si hay que rechazarla y commit para confirmar si iniciamos una transacción hacemos una operación y no realizamos un cómic sería como si implícitamente se estuviera haciendo un rol back Sharing y por lo tanto no quedaría físicamente registrada esa operación en la base de datos a la que está asociada la capa de persistencia.

Pues bien si en la siguiente elecciones siguiente vídeo vamos a ver ya un primer ejemplo de utilización de este API JPA con las operaciones básicas.

A partir de la capa de persistencia creada en la elección anterior.

# 08 Primera aplicación JPA 12:05

# Autoevaluación II 01:00
