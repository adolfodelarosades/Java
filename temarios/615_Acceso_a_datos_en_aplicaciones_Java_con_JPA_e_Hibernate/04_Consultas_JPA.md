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

JPA puede utilizarse en cualquier aplicación Java aunque normalmente vamos a ver su uso casi siempre centrado en el contexto del desarrollo de aplicaciones Web. 

<img src="images/10-02.png">

En una aplicación web que sigue el patrón Modelo Vista Controlador, lo que es la Lógica de Negocio que es donde se realiza el acceso a los datos es encapsulado dentro de Clases o Enterprise Java Beans EJB en lo que se conoce como el *Modelo*. El Modelo que es utilizado desde el Controlador, punto central que recibe todas las peticiones del Cliente y que controla las Vistas que sirven para generar las respuestas y el Modelo que es el que le va a proporcionar toda la lógicas de negocio a dicha aplicación. Esto significa que será en la capa *Modelo* donde vamos a utilizar ese API JPA para acceder a nuestra capa de persistencia que es la que nos va a exponer los datos.

<img src="images/10-03.png">

El Modelo como decíamos puede ser implementado con clases estándares Java o bien EJB que ya lo veremos en una lección posterior, dentro de sus métodos sean clases estándares Java o EJB es donde vamos a codificar las instrucciones JPA para acceso a la capa de persistencia.

<img src="images/10-04.png">

Las aplicaciones web se ejecutan no sólo dentro de la máquina virtual Java sino que requieren de un software adicional conocido como servidor de aplicaciones que es el que gestiona el ciclo de vida de esas aplicaciones Web. Las aplicaciones Web tienen como elementos fundamentales los Servlets y JSPs que se ejecutan sobre un contenedor, llamado Contenedor Web que forma parte de ese servidor de aplicaciones Java EE.

Aunque nuestra lógica de negocio esté en clases estándar en Java sí va a formar parte de una aplicación Web tenemos que disponer de ese Servidor de Aplicaciones para que la aplicación entera pueda funcionar.

Entonces antes de ver el ejercicio que vamos a presentar a continuación de utilización de JPA con las consultas Query y TypeQuery que comentamos en la lección anterior, vamos a ver cómo configurar nuestro Eclipse para poder utilizar un servidor de aplicaciones. Aquí te presentamos algunos de los más utilizados en el desarrollo aplicaciones Web y quizá el más sencillo y es con el que vamos a trabajar ahora es Apache Tomcat.

<img src="images/10-05.png">

Apache Tomcat lo podemos descargar gratuitamente desde la dirección http://www.apache.org/. La versión 8 es la más utilizada y como digo en esta dirección tienes una sección de descargas donde puedes descargar para 32 bits 64 bit se puede descargar el modo ejecutable o modo Zip simplemente descomprimirlo y ya está, el proceso de instalación es muy sencillo, muy básico y una vez que ya lo tengamos instalado descomprimido, instalado, dependiendo de si hemos elegido un exe o un punto zip en una carpeta de nuestro disco lo tenemos que integrar dentro de Eclipse para que luego cuando hagamos una aplicación Web podamos usar ese servidor de aplicaciones para probarlo.

<img src="images/10-07.png">

Bien pues aquí tenemos el Eclipse que tendremos que hacer en él para poder integrar ese servidor de aplicaciones Tomcat que acabamos de descargar.

<img src="images/10-06.png">

Lo primero nos vamos a ir a las Preferences de Eclipse exactamente a Server - Runtime Enviroment

<img src="images/10-08.png">

En Runtime Enviroment es donde deberíamos tener registrados los servidores de aplicaciones que queremos utilizar para construir aplicaciones dentro de este Workspace actual en el que estamos, como vemos no tenemos ninguno, vamos a registrar a través del botón `Add` el servidor de aplicaciones Tomcat que lo vamos a encontrar dentro de la lista de tipos de posibles servidores admitidos por Eclipse.

<img src="images/10-09.png">

Como ves es posible que a lo mejor en tu versión de Eclipse tengas menos que yo porque me he descargado algún plugin adicional para poder disponer de otros servidores aparte de Apache como por ejemplo Glassfish que también lo veremos en una lección posterior cuando queramos utilizar EJB.

<img src="images/10-10.png">

Pero bueno en el caso concreto de Tomcat la categoría Apache viene por defecto ya en la versión de Eclipse Java EE Marte, desplegamos Apache y aquí vemos Apache Tomcat. 

<img src="images/10-10.png">

Elegimos la opción siguiente y ahora se nos pide el directorio de instalación.

<img src="images/10-11.png">

A través del botón Browse tendrías que ir a la carpeta donde has descomprimido Tomcat concretamente a la carpeta que se llamará Apache Tomcat y la versión que hayas descargado.

<img src="images/10-12.png">

Esa es la carpeta raíz de Tomcat que hay indicar en ésta indicar en esta opción. 

<img src="images/10-13.png">

Bueno pues una vez que ya lo tengamos fijados directamente finalizamos 

<img src="images/10-14.png">

y ya lo tenemos disponible para poderlo utilizar en todas las aplicaciones web que hagamos dentro de este workspace.

Pero para ello nos vamos a cambiar de perspectiva, si vamos a desarrollar aplicaciones web ya no vamos a estar en la perspectiva Java sino bien en la perspectiva Java EE o en la perspectiva Web cualquiera de las dos es igualmente válida cualquiera de JavaEE o Web.

<img src="images/10-15.png">

Una vez en esa perspectiva se habilitará esta pestaña servidores y si no siempre podemos hacer que se nos muestre por aquí a través de Windows

<img src="images/10-16.png">

Bien está la pestaña servidores y aquí tenemos que registrar el servidor de los que tendremos en la lista de ruta y en environments, en nuestro caso sólo tenemos uno el Tomcat, pero tenemos que tenerlo registrado aquí para que Eclipse pueda utilizarlo de cara a probar las aplicaciones, entonces pulsamos sobre el enlace 
 
<img src="images/10-17.png">
 
y lo mismo volvemos a elegir en la sección del tipo de servidor Apache Tomcat 9 y ahora ya directamente te aparece que se observe Runtime Environment registrado.

<img src="images/10-18.png">

Si tuviéramos varios podríamos elegir, pero sólo tenemos uno con el que nos vamos a quedar directamente finalizamos y ya tenemos el servidor registrado.

<img src="images/10-19.png">

Ahora mismo está en estado parado pero bueno ya se encargará el propio Eclipse cuando vemos aprobar una aplicación arrancarlo y publicar sobre las aplicaciones. Eso lo vamos a ver en la siguiente elección en el ejercicio que vamos a desarrollar que es una aplicación web donde vamos a utilizar JPA para acceder a la capa de persistencia utilizando en este caso las consultas y demás.

# 11 Ejercicio práctico I Parte 1 19:04

<img src="images/11-01.png">

Seguidamente vamos a desarrollar una aplicación web en la que vamos a poner en práctica el uso de Query y también de los métodos básicos de EntityManager.

<img src="images/11-02.png">

En este ejercicio va a consistir como decía en una aplicación Web que nos va a permitir a los usuarios añadir y listar todos los contactos de la base de datos agenda con la que hemos estado trabajando en los ejemplos vistos hasta el momento.

Cuando se listen los contactos cada uno mostrará un enlace que permitirá al ser pulsado que se elimine dicho contacto.

<img src="images/11-04.png">

El esquema de la página de la aplicación será el que se muestra en esta imagen. Como vemos habra una Página Inicial que mostrará los enlaces para las dos opciones que comentábamos. Nuevo Contacto nos llevaría a la página donde se piden los datos del Contacto, al guardarlo se volvería a la Página Inicial y Ver Contactos, es la lista de contactos con todos sus datos nombre, email y teléfono y un enlace para Eliminar que permitiría eliminar el contacto en concreto y regresar a la propia página. Desde el enlace Menú volveríamos otra vez a la Página Inicial.

Para abordar el desarrollo de esta aplicación vamos a aplicar el patrón Modelo Vista Controlador dentro de lo que sería la construcción de una aplicación Web.

Cómo empezamos, bueno pues lo primero vamos a crear el proyecto File - New y en este caso utilizaremos la opción Dynamic Web Project puesto que se trata de una aplicación Web.

<img src="images/11-06.png">

Vamos a nombrarlo como `615-02_web_jpa`, como vemos aquí ya aparece Apache Tomcat como servidor en el que vamos a probar nuestra aplicación, ya que lo registramos en la lección anterior.

<img src="images/11-07.png">

Pues nada directamente aquí ya podemos finalizar, esta sería la estructura de la aplicación Web.

<img src="images/11-08.png">

Le vamos a aplicar el patrón Modelo Vista Controlador. El Modelo será la parte que encapsule toda la lógica de negocio de acceso, en este caso la capa de persistencia, que ofrecerá a la Capa de Controlador los métodos para realizar las opciones, las funciones de eliminar un Contacto a partir de su identificador, recuperar todos los contactos y también añadir contacto.

La parte que realmente nos interesa, la Capa de Lógica de Negocio, puesto que la Capa Web que la conforma el Controlador y la Vista que se implementa con Servlets y páginas JSP no forma parte del estudio de este curso, pero también lo presentaré para que veas como queda en general el conjunto.

Lo primero ya hemos creado la aplicación Web pues vamos a crear la Capa de Persistencia, para ello vamos a seguir exactamente los mismos pasos que seguimos con el ejercicio uno de JPA, es decir vamos a irnos a las propiedades del proyecto 

<img src="images/11-09.png">

y vamos a habilitar a través de Project Faces 

<img src="images/11-10.png">

la opción Java JPA Java persistan 

<img src="images/11-11.png">

si no vamos a `Further configuration available...`

<img src="images/11-12.png">

ya se nos presenta una configuración disponible, esto de descargar el EclipseLink sin indicarlo como implementación JPA ya nos viene por defecto porque ya lo hicimos en el ejercicio anterior. Una vez que ya se descargó y lo asociamos a las propiedades de JPA pues eso queda ya predefinido para todos los proyectos donde añadamos esta característica, así que aquí ya no hay que tocar nada más, solo pulsar OK.

Al hacer esto se va a crear el `persistence.xml` vacío claro. 

<img src="images/11-13.png">

Y se habilitarán algunas de las opciones para poder generar las entidades desde la base de datos que es lo que vamos a hacer ahora. Este paso ya lo hicimos con JPA Tools - Generate Entities from Tables ... , ya lo hicimos en el ejercicio anterior.

<img src="images/11-14.png">

Entonces la conexión la tenemos que tener ya hecha, cogemos la conexión que ya habíamos creado en la lección pasada `msql_prueba`, al seleccionarla aparecen ya las tabla, vamos a seleccionar la tabla Contacto que es con la que trabajaremos por el momento.

<img src="images/11-15.png">

En el siguiente paso, asociaciones nada.

<img src="images/11-16.png">

En el siguiente paso en Key generator le tenemos que decir que el campo Primary Key, en nuestro caso se genera mediante una identity, es decir es autonumerico, el paquete donde vamos a meter o queremos que se genere nuestra clase se llamara `entidades` en lugar de `model`.

<img src="images/11-17.png">

En el siguiente paso, es el resumen de la clase Contacto y Primary Key se genera con identidad 

<img src="images/11-18.png">

y finalizamos.

<img src="images/11-19.png">

y aquí tendremos ahora nuestra clase Contacto dentro del paquete entidades, la misma entidad que utilizamos en el ejercicio de ejemplo JPA.

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the contactos database table.
 * 
 */
@Entity
@Table(name="contactos")
@NamedQuery(name="Contacto.findAll", query="SELECT c FROM Contacto c")
public class Contacto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idContacto;

	private String email;

	private String nombre;

	private int telefono;

	public Contacto() {
	}

	public int getIdContacto() {
		return this.idContacto;
	}

	public void setIdContacto(int idContacto) {
		this.idContacto = idContacto;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getTelefono() {
		return this.telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

}
```

En `persistent.xml` vemos como ya se ha registrado automáticamente la clase.

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-02_web_jpa">
		<class>entidades.Contacto</class>
	</persistence-unit>
</persistence>
```

Como vamos a utilizar también el mismo proveedor EclipseLink no hace falta ni siquiera que lo registremos a través del elemento Provider dentro de la Unidad de persistencia.

Lo que sí que vamos a hacer es que vamos a abrir `persistent.xml`, el cual fisicamente se queda almacenado dentro de la carpeta META-INF donde se encuentran todas las clases y forma parte del lugar donde se encuentran todas las clases de Java pero siempre de la subcarpeta META-INF ahí es donde está físicamente, entonces aquí con el botón derecho le decimos que lo queremos abrir con el persiste XML editor y en la sección de Conexiones vamos a indicar Resource Local para que se habilite la opción `Populate from connection...` y nos permite rellenar los datos de conexión a la base de datos para el proveedor.

<img src="images/11-20.png">

A partir de los datos de conexión de esta conexión hemos creado `msql_prueba` 

<img src="images/11-21.png">

Al seleccionarla aparecen todos los datos de conexión.

<img src="images/11-22.png">

Bien ya tenemos la capa de persistencia, ahora se trataría de crear la lógica de negocio con todo lo que son los métodos de acceso a la capa de persistencia que nos van a ofrecer a las otras capas al controlador y la vista por las funcionalidades necesarias para el ejercicio que van a ser dar de alta la entidad eliminar una entidad a partir de el identificador de dicha entidad y recuperar todas las entidades que sólo vamos a tener que implementar mediante una cuenta.

Entonces vamos a crear la clase gestión contactos donde vamos a encapsular toda esa funcionalidad gestión contactos dentro de un paquete modelo bien el código de esta clase.

Pues vamos a ver eso lo tengo yo de aquí hecho y lo vamos.

Lo voy a copiar lo voy a pegar y lo vamos a estudiar lo vamos a analizar para explicarte todas las opciones que hemos ido código y todas las funcionalidades que hemos implementado.

Control sí o para importar todo lo que necesitemos.

Cuidado porque a la hora de importar por ejemplo QWERTY el eclipse puede detectar que hay dos cuerpos en el paquete Java que persistan en otros paquetes diferentes.

Nosotros siempre estamos trabajando en JPA con este paquete cada X persisten como importemos otra clase que es de otro paquete distinto pues evidentemente no va a funcionar y puede darnos errores que luego nos cuesta trabajo detectar.

Entonces aquí utilizo también bueno ya tenemos aquí todo y bien por lo que vamos a hacer es vamos a explicar lo que hemos hecho aquí.

Bueno en primer lugar tenemos un método privado que vamos a utilizar dentro de los métodos de la lógica de negocio que serían estos 4 2 3 4 4 puesto 4 porque he hecho un par de métodos alta contacto dos variantes para darlos de alta a partir de lo que sería la propia entidad ya proporcionada como parámetro o los datos individuales.

Pero primero centrémonos en este método que es usado por los otros métodos de negocio para obtener el Entity manager cuando necesiten acceder a la capa de persistencia.

Recuerda que para obtener el intiman ayer teníamos que crear la factoría la Timaná y rFactor y a partir del Creativity manager ya teníamos el anticlimática vale para crear el Entity manager Factory.

Hay que darle el nombre de la Unidad de persistencia que nuestro persiste en XML pues era el que nos haya dado asistente directamente.

Por supuesto lo podríamos cambiar si no nos gusta ese nombre.

Recordemos aquí y ya lo tenemos ahora vamos a analizar los métodos para dar de alta un contacto pues a partir de los datos de dicho contacto tendríamos que crear el contacto y obtener el intiman ayer iniciaron una transacción.

Como sabéis todas las operaciones recordamos que impliquen hacer acciones sobre la base de datos que está detrás de la capa de persistencia implican que tenemos que tenerlas dentro de una transacción la iniciamos.

Hacemos la llamada proxys y confirmamos este error que tenemos aquí porque por defecto el asistente de Eclipse no nos genera un constructor con parámetros para la entidad y aquí hemos supuesto que ya está bueno o bien utiliza el constructor sin parámetros y le voy dando los datos a través de los eter o por qué no vamos a crearlo.

Y así ya estoy más cómodo dentro de la entidad de contacto vamos a crear aquí un constructor que nos permita crear un objeto de contacto a partir de sus parámetros en sours generar constructores sin Fils podemos decirle que queremos un constructor con todos los parámetros si quisiéramos crearlo también con el ID de contacto para cuando vamos a construir un objeto contacto y lo vamos a devolver.

O en este caso si es un objeto de contacto que viene ya construido y que todavía no tiene contacto porque  se supone que se lo va a dar al dar a la cera la persistencia de la llamada método Perquis pues vamos a darle también un constructor que no necesite ese contacto.

Tenemos ya estos tres parámetros y estos dos parámetros procesara ya desaparece el error y aquí tenemos  el método Arsys bien alta contacto en el caso de que nos den ya directamente el objeto contacto con los datos ya ya metidos digámoslo así pues sería exactamente lo mismo.

Lo único no tendríamos que crear obviamente el objeto de contacto porque ya no viene obtenemos timãn ayer iniciamos transaccion llamada método PES6 y Cómbita eliminar contacto de recuperar contactos para el final pues lo que haría es localizar el contacto a partir de ese identificador y en el caso de que exista pues lo eliminamos.

Como ves también como se trata de una operación de acción hay que iniciar la transacción y confirmarla después siempre a nivel de cada método que hace su operación concreta y por último tenemos el recuperar contactos que en este caso lo que necesitamos es una Macuelizo.

Vale entonces en este caso obtenemos lentísima ayer creamos el objeto Swery a partir de la J.P. QL J.P.QL.

Sería tan simple como Devuélveme todos los contactos sin ningún tipo de condición como hemos utilizado.

Pues tras un Lish nos va a devolver un liso a secas de objetos.

Tenemos que hacer un Ancasti una conversión Alís de contacto si lo queremos devolver con un tipo de objetos contacto para que la capa de controlador o ya directamente trabaje con la colección de objetos que requiera.

Podríamos haber utilizado como ya vimos también en la lección anterior el Taipe y cómo sería contais pecuarios o simplemente sería descuelguen de contacto declaramos la variable y llamaríamos a la versión de create Cury en la que le daríamos la instrucción J.P. cuele que sería exactamente la misma.

Podríamos haber metido la variable o directamente aquí y la clase el objeto clase del tipo de objeto que nos debería devolver contacto portábamos PGR y ahora ya sería simplemente llamada al Treasure List que ya nos va a dar directamente la lista como tipo cuãntas puesto que hemos utilizado pecarí.

Esto es la capa de lógica de negocio de nuestra aplicación cómo ver.

Hemos utilizado métodos básicos del Entity manager y en el caso que tenemos que en este caso recuperar una colección de contactos no hay ningún método básico del Inti-Illimani que no sabes o sólo nos permite recuperar por que ya recurrimos al Ueli que en este caso ha sido bastante sencilla.

Imagínate por ejemplo quisiéramos aunque no lo necesitemos en este ejercicio pues tener un método que nos devuelva un objeto de contacto después por ejemplo a partir de Seimei imagínate que es eso lo que queremos.

Bueno pues obtendríamos en el City Manager como siempre en nuestro caso la instrucción JPEG huele pues sería del tipo CLC from contacto de Wer C punto y mail igual al valor entonces como el email es un campo un valor de tipo texto pues tendríamos que incluir su valor entre comillas simple concatenar con la variable Imai y concatenar con la comida simple de cierre.

Así quedaría la J.P. cuele si solamente el email no se pudiera repetir porque su base de datos no la tenemos configurada para para evitar eso.

Pero bueno suponiendo que estamos seguros que no puede haber dos contactos con el mismo email entonces esto sería tan simple como coger bueno vamos primero vamos a crear Swery sería igual que ésta Cubelli aquí tendríamos la variable J.P. suele y como digo sería tan simple como coger y así que el azul ya no va a devolver el objeto contrasto pero cúrate lo que te comentaba cuando explicamos este método y es que si o lo que sea está Select estás J.P. devuelve más de un contacto.

Pues entonces este método provocará una excepción si no estamos seguros pero solamente queremos devolver un contacto el primero que cumpla la condición.

En este caso podríamos optar por esta otra opción Venetur Cubes repuntó gheto en su lista punto de ser dame el primero de la lista.

Y en este caso por si hubiera más de un contacto simplemente se quedaría recuperar la condición se quedaría con el primero.

Aquí ves que hemos utilizado una SQL la cual ya si metemos una condición ya veremos en posteriores elecciones cómo podemos hacer esto de otra manera utilizando cueles con parámetros.

Bueno pues voy a cortar aquí el vídeo porque para lo que queda explicar las siguientes capas controlador y vista.

Vamos a contar en un vídeo independiente para no hacer demasiado.


# 12 Ejercicio práctico I Parte 2 10:01
# 13 Consultas parametrizadas 03:00
# 14 Consultas nominadas 02:28
# 15 Ejercicio práctico II 13:06
# 16 Consultas de acción 04:38
# Autoevaluacion III 00:54
