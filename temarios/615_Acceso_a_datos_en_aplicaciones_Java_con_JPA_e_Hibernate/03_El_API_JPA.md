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

<img src="images/8-01.png">

Muy bien vamos a crear nuestra primera aplicación de ejemplo JPA lo que vamos a hacer es realizar una serie de operaciones CRUD de crear, recuperar, actualizar y eliminar entidades contra la capa de persistencia de la base de datos `agenda` de la tabla `contactos` que creamos en una de las lecciones anteriores.

<img src="images/8-02.png">

El Código de la aplicación al final quedará algo como esto:

<img src="images/8-03.png">

Vamos a obtener un `EntityManagerFactory` para obtener el `EntityManager`, iniciar una transacción y a partir de ahí hacer una serie de operaciones y confirmar en último lugar la transacción con un commit, para comprobar que efectivamente se han realizado sobre la base de datos.

Pues lo primero vamos a abrir es Workbeanch y comprobar el contenido de la tabla contactos.

<img src="images/8-04.png">

Bueno pues vamos a pasar a desarrollar con Eclipse y recuperaremos el ejercicio primero que hicimos de ejemplo JPA donde como recordarás creamos la capa de persistencia que fue básicamente eso crear la entidad y la configuración de la misma a través de las anotaciones usando el asistente que veíamos en Eclipse. Y  también la configuración del `persistence.xml` que se genera automáticamente los datos de conexión.

Lo que vamos a hacer es crear una clase Java básica de aplicación de consola con su método main donde vamos a realizar una serie de operaciones contra la capa de persistencia (Contacto).

Entonces nos colocamos encima del proyecto vamos presionar el botón derecho, New Class para crear una nueva clase, esta clase la vamos a llamar por ejemplo `Test`, no la vamos a meter en el mismo paquete donde están las entidades más bien en un paquete aparte, por ejemplo `principal`. Y por supuesto con el método `main`.

<img src="images/8-05.png">

A partir de ahí vamos a esperar que genere la clase 

```java
package principal;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
```

Y aquí ya vamos a introducir el código de la aplicación que vamos a hacer para realizar esas operaciones. Qué es lo que tenemos que hacer es crear `EntityManagerFactory` para crear el `EntityManagerFactory` como te comentaba en la lección anterior tenemos que recurrir al método de la clase `Persistence`, `createEntityManagerFactory()`, el cual necesita el nombre de la unidad de persistencia, y como se se llama la unidad de persistencia, ese dato lo tenemos en el archivo `persistence.xml` en la línea `<persistence-unit name="615-01_ejemplo_jpa" transaction-type="RESOURCE_LOCAL">`, sería `615-01_ejemplo_jpa` por lo que el código en `Test` queda así:

```java
EntityManagerFactory factory = Persistence.createEntityManagerFactory("615-01_ejemplo_jpa");
```

Aquí ya tenemos la creación del `EntityManagerFactory` con el cual podremos crear el `EntityManager`

Recuerda en Eclipse Control+Shift+O para importar las clases e interfaces que vayamos utilizando en cada momento.

`EntityManager` a partir de ahí vamos a crear el objeto `factory` recurriendo al método `createEntityManager()` que no recibe ningún parámetro puesto que el nombre de la Unidad de persistencia lo indicamos al crear la factoría.

```java
EntityManagerFactory factory = Persistence.createEntityManagerFactory("615-01_ejemplo_jpa");
EntityManager em = factory.createEntityManager();
```

Pues ya tenemos el `EntityManager` a partir de ahí a poder realizar las operaciones CRUD.

Pero vamos a iniciar una transacción.

```java
EntityManagerFactory factory = Persistence.createEntityManagerFactory("615-01_ejemplo_jpa");
EntityManager em = factory.createEntityManager();

//Inicio de una transacción
EntityTransaction tx = em.getTransaction();
tx.begin();
```

Cómo vemos lo primero que hacemos es iniciar una transacción a través del `EntityTransaction`, `EntityTransaction` también forma parte del `javax.persistence` y dispone de un método `begin()` para iniciar la transacción, aparte por supuesto de los métodos para confirmar y rechazar.

Todas las operaciones CRUD que realicemos ahora de acción, es decir crear, actualizar y eliminar una entidad en el momento que se confirmen quedarán reflejadas en la base de datos.


si no hacemos un cómic esas operaciones no quedarán en ningún

sitio entonces vamos a crear vamos a hacer nuestra momento una persistencia de objeto vamos a crear

una entidad cualquier comentario al existir una entidad vamos a crear un objeto contacto

el asistente de Eclipse que creaba que utilizamos para crear las entidades nos crearon las entidades

con el constructor sin parámetros podríamos haber incluido nosotros un constructor explícito con parámetros

que permitieran inicializar todos los atributos pero bueno no está nada llamando a los métodos Shep.

Por ejemplo si el nombre.

Aquí vamos a poner contacto de prueba

Sethi mail

la arroba porque tampoco quiero que utilicemos uno que gasistas nos vamos a poner un email nuevo por

un pacto punto com por ejemplo vale

y por último le vamos a dar un teléfono

va perfecto y a partir de ahí ya tenemos contacto creado lo persistimos para ello Identity Manager disponer

el método pero si os comentamos en la lección anterior con esto que habría persistido a la espera de

que confirmamos la transacción que lo haremos al final cuando hayamos hecho ya todas las operaciones

que vamos a hacer ahora lo vamos a actualizar una entidad por ejemplo tenemos aquí los datos.

Vamos a ver Operación y modificación de la entidad vamos a coger reutilizamos la misma posible contacto

y lo que hacemos en este caso es llamar a uno de los segundos métodos documentamos del Entity manager

Find para localizar una entidad.

Cómo funciona.

Le proporcionas el tipo la clase objeto clase contacto lo que queremos nosotros y la prima que quieren

localizar.

Efectivamente hay un contacto con un valor unos días de prueba.

Pues la modificamos el email y hacemos números con lo cual esto haría que se modificase dicho e-mail

en la base de datos y quedaría cambiado éste aparecería modificado una vez que se confirme la transacción.

Vamos ahora a eliminar una entidad recuperamos la entidad y llamaríamos al método Ramu

para eliminar un contacto o volvemos a hacer una búsqueda y le vamos a proporcionar un identificador

de una prima Key que ya existe.

Por ejemplo yo tengo aquí el 17 vamos a eliminar este usuario J.S. bien proporcionamos la primary key

y una vez que lo hemos obtenido un remó es así de simple.

Como es muy sencillo manejar JPA y realizar operaciones contra la capa de persistencia bastante más

que por supuesto con JRC.

Ahora ya por fin confirmamos la transacción.

Bueno pues ya lo tenemos

pues simplemente sería ejecutarlo y ver los resultados.

Podríamos haber dicho que nos mandaron un mensajito por aquí vamos a hacerlo si está en punto al punto

Proein LNE operaciones realizadas aunque lo comprobaremos lógicamente en la base de datos macro directamente

vamos a ejecutar a la hora de ejecutarlo vamos a hablar ya verás que va a haber un pequeño problema

ya te lo voy anunciando pero quería que apareciera para que lo viaxes Bueno pues lo típico ejecutas

el programa y de repente empiezan a aparecer excepciones.

Error.

Qué ha pasado.

Bueno no tenemos que alarmarnos esto es muy habitual todos vamos a cometer errores y lo que más veces

nos va a pasar cometer errores durante la ejecución de los programas cuando nos encontramos es todo

lo que tenemos que hacer siempre sea el programa del tipo que sea.

Si no es al principio el error o sea todos estos mensajes que empiezan a aparecer aquí de Exception

tal y bueno están volcados de error que se llama Los volcarlos de pila de la excepción pues a partir

de ahí aunque luego se pueden repetir pero normalmente suele ser al principio donde está el mensaje

que nos va a indicar qué está pasando y efectivamente aquí al principio ya nos dice que falta o que

no encuentra el driver de SQL tened en cuenta que aquí hay un motor de persistencia que se va a encargar

de hacer las operaciones contra la base de datos.

Nosotros lo hemos dicho no existen XML a ese motor de persistencia que la base datos está en esta dirección

y que tienen que utilizar este driver pero dónde está el driver no está aquí nosotros sí lo utilizamos

cuando el asistente para crear la capa de persistencia pero dentro de lo que es el proyecto no está

el asistente hay que añadir la referencia a esa librería para que la pueda utilizar la aplicación y

por lo tanto la puede utilizar el motor de persistencia no estaríamos en el Classmate de las clases

posibles que puede utilizar.

Este proyecto está jre que son precisamente las clases de Java estándar y el eclipse Link es el motor

de persistencia pero aquí tendríamos que añadir el driver como lo hacemos.

Botón derecho nos vamos a las propiedades del proyecto y una propiedad que es Java.

Path pestañea Library ahí aparece como ves las librerías que te comentaba debemos añadir también el

jar correspondiente a Android de se cuelga pulsamos el botón Añadir externan jar y lo localizamos donde

lo tengamos grabado lo tenemos aquí en esta carpeta.

Ahí está lo seleccionamos y ya tenemos el Braida.

Ahora ya cuando el proveedor de persistencia vaya a hacer las operaciones contra la base de datos intente

tirar de este diario y ver que nosotros lo hemos indicado aquí como está dentro de las librerías reconocidas

por los localizara y puedan hacer las operaciones.

Vamos a ejecutarlo.

Java aplicación y ahora ya no ha habido errores y nos dice operaciones realizadas pero vamos a comprobarlo

nos vamos a la base de datos refrescamos y efectivamente como es primero el contacto de prueba que hemos

hecho con el perfil.

Aquí se ha añadido con los datos que le hemos indicado se ha modificado el email del contacto uno es

anteponía la nueva prueba tal solamente modificado y se ha añadido se ha eliminado el contacto número

17 que era un JSF y ya no existe pero se ha visto cómo realizar las operaciones básicas a través del

Entity manager.

Si quisiéramos hacer otras operaciones más complejas de búsqueda de un conjunto de entidades o eliminación

por otros criterios etcétera tendríamos que recurrir a las consultas que vamos a estudiar ya próximamente.

# Autoevaluación II 01:00
