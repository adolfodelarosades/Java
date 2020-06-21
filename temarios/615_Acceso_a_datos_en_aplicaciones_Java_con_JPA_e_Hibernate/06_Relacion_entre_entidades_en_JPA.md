# 6. Relación entre entidades en JPA 47:26

* 21 Relación entre entidades 07:43
* 22 Crear entidades relacionadas parte I 08:20
* 23 Crear entidades relacionadas parte 2 08:41
* 24 Ejercicio práctico IV parte I 07:19
* 25 Ejercicio práctico IV parte 2 01:57
* 26 joins 05:53
* 27 Ejercicio práctico V 06:02
* Autoevaluación V 01:30

# 21 Relación entre entidades 07:43

En todos los ejemplos vistos hasta el momento, hemos trabajado siempre con entidades asociadas a tablas independientes, pero en las bases de datos del mundo real la información se encuentra repartida en tablas relacionadas, es decir, los datos se distribuyen en varias tablas y dichas tablas cuentan con campos comunes que nos permiten identificar que registros de una tabla se corresponden con los de otras.

En JPA las relaciones entre tablas se pueden representar también en el mundo de las entidades. En esta lección te enseñaré a establecer relaciones entre entidades  y estudiaremos  los beneficios que ello nos  aportará a la hora de implementar la lógica de negocio de una aplicación. Y es que, al relacionar entidades, un objeto de una entidad contendrá el objeto u objetos de la entidad relacionada, lo que implica que al recuperar un objeto de una entidad recuperamos con él el objeto u objetos relacionados.

De cara a poder relacionar entidades, no es necesario que las tablas correspondientes se encuentren relacionadas explícitamente en la base de datos, basta con que cuenten con una columna común que permita identificar los registros de una tabla que se corresponden con los de la otra.

## Tipos de relaciones entre entidades

Lo primero que hay que tener en cuenta es que para establecer una relación entre entidades **no es necesario que las tablas asociadas se encuentren relacionadas** físicamente en la base de datos, aunque deberán tener campos o columnas comunes que permitan identificar que registros de una tabla se corresponden con los de la otra.

Según las posibles relaciones que se pudieran establecer entre las tablas, se distinguen los siguientes tipos de relaciones entre entidades:

* **Relación uno a uno**. A un objeto entidad le corresponde un objeto de otra entidad. Este tipo de relación se da cuando cada registro de una tabla de la base de datos está asociado a un único registro de otra tabla. Es el tipo de relación menos común.

* **Relación uno a muchos**. A un objeto entidad le corresponden varios objetos de otra entidad. En sentido contrario, esta relación se puede interpretar como de muchos a uno. Por ejemplo, cuando tenemos una tabla de empelados y otra de departamentos, la entidad Departamento se relaciona uno a muchos con la entidad Empleado, pero en sentido contrario, Empleado se relaciona muchos a uno con Departamento. Es el tipo de relación más habitual.

* **Relación muchos a muchos**. Un objeto de una entidad se asocia con varios objetos de otra entidad y viceversa. Este tipo de relación requiere la existencia de tres tablas en la base de datos, las tablas principales y una de unión que relacione las claves primarias de las tablas principales.

## Relación uno a muchos/muchos a uno

Para estudiar esta relación vamos a partir de las siguientes tablas de ejemplo:

<img src="images/21-01.png">

Se trata de dos tablas correspondientes a la base de datos de un almacén. En la primera tabla tenemos registradas las secciones en las que se divide el almacén, mientras que en la segunda tenemos el registro de productos existentes. En este caso, es claro que se trata de una relación uno a muchos, pues en cada sección podemos tener varios productos almacenados.

La clave primaria de la tabla Secciones, idSeccion, aparece también en la tabla de Productos como clave ajena (fereing key). Esto nos permite identificar la sección a la que pertenece cada producto almacenado.

### Atributos de relación

La relación entre entidades implica que en una entidad podemos almacenar el objeto u objetos de la entidad con la que se relaciona. Por tanto, lo  primero que tenemos que hacer para poder establecer la relación será definir dentro de la clase un atributo del tipo de objeto con el que se va a relacionar.

En el ejemplo que estamos utilizando, dentro de la entidad Seccion tendremos que definir un atributo de tipo Collection,List o Set, que contendrá la colección de objetos Producto asociados a cada objeto Seccion, mientras que en la entidad Producto, **en vez de definir el atributo clave ajena “idSeccion”, se creará una atributo de tipo de entidad** (en este caso de tipo Seccion), que guardará el objeto sección asociado a cada producto.

En el siguiente listado te mostramos como quedaría la definición de atributos de cada clase:

#### Entidad Sección

```java
@Entity
@Table(name = "Secciones")
public class Seccion implements Serializable {
   
   private static final long serialVersionUID = 1L;
   
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private Integer idSeccion;

   private String seccion;
   private String responsable;
   private List<Producto> productos;
   //resto de código: constructores y métodos getter y setter

   ...
    
}
```
 
#### Entidad Producto

```java
@Entity
@Table(name = "Productos")
public class Producto implements Serializable {

   private static final long serialVersionUID = 1L;

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int idProducto;

   private String nombre;
   private double precio;
   private String descripcion;
   private Seccion seccion;
   //resto de código: constructores y métodos getter y setter

   ...

}
```

Tanto en una como en otra entidad, deberíamos añadir también la pareja de métodos set/get para acceder a los atributos de relación

### Configuración de la relación

Además de la definición de los atributos de relación, es necesario indicar cierta información de configuración al motor de persistencia para que sepa cómo obtener los objetos de las entidades relacionadas. Esta información se proporcionará a través de una serie de **anotaciones** que se colocarán delante de los atributos de relación.

### Entidad del lado uno

En primer lugar, veremos cómo configurar el atributo de relación en la entidad del lado uno. Dicho atributo será de tipo colección y tendrá que estar definido con la anotación `@OneToMany`, que indica que un objeto de la clase actual está asociado al conjunto de objetos sobre el que se aplica la anotación.

Esta anotación deberá incluir al menos el atributo *mappedBy*, en el que se indicará el nombre del atributo de relación de la entidad relacionada que contendrá el objeto de la entidad actual.

Con el ejemplo de la entidad Seccion lo veremos más claro; así tendría que quedar definido el atributo productos:

```java
@OneToMany(mappedBy = "seccion")   
private List<Producto> productos;
```

Como vemos, aquí *mappedBy* hace referencia al atributo “seccion” de la entidad Producto que contendrá el objeto de tipo Seccion asociado a cada producto.

Como indicamos anteriormente, estos campos de colección pueden ser Collection, List o Set.

### Entidad del lado muchos

La entidad del lado muchos es la propietaria de la relación, por ello la configuración del atributo de relación de esta entidad requiere algo más de trabajo, puesto que deberá indicarse en ella la información de relación. Así, en este atributo utilizaremos las siguientes anotaciones para la configuración de la relación

* `@ManyToOne`. Anotación utilizada en el campo de relación del lado muchos. Indica básicamente que varios objetos de la clase actual (en nuestro caso Producto) están asociados al objeto al que se le aplica esta anotación (Seccion)

* `@JoinColumn`. Proporciona la información de relación, indicando al motor de persistencia como están relacionadas las tablas en la base de datos. A través de los siguientes atributos se especifican los campos de relación:

   * *name*. Nombre de la columna foreing key (lado muchos)
   * *referencedColumnName*. Nombre de la columna primary key (lado uno)

Así pues en nuestro ejemplo, el atributo *seccion* de la entidad Producto deberá estar definido como se indica a continuación:

```java
@JoinColumn(name = "idSeccion", referencedColumnName = "idSeccion")
@ManyToOne
private Seccion seccion;
```

Al configurar las relaciones de este modo, cada vez que se obtenga un objeto de una entidad se obtendrá también el objeto u objetos de la entidad relacionada.

El siguiente bloque de código de ejemplo nos mostraría por pantalla el nombre de la sección a la que pertenece un producto, a partir del código del mismo:

```java
Producto p=em.find(Producto.class,2222);
if(p!=null){
   System.out.println(“Sección: “+p.getSeccion().getSeccion());
}
```

Este otro ejemplo nos muestra los nombres de todos los productos asociados a una determinada sección:

```java
Query q=em.createQuery(“select e from Seccion e where e.idSeccion=?1”);
q.setParameter(1,31);

Seccion m=(Seccion)q.getSingleResult();

//recupera los objetos Producto relacionados
List<Producto> productos=m.getProductos();

for(Producto p:productos){
   System.out.println(“Producto: “+p.getNombre());
}
```

## Relación muchos a muchos

En este tipo de relación, cada entidad tiene asociado un conjunto de objetos de la otra entidad. A nivel de tablas, se requiere de una tabla de unión.

Para analizar este tipo de relación, vamos a pensar en el caso de las cuentas bancarias y los clientes de un banco. Cada cliente puede tener varias cuentas en dicho banco, a su vez, una cuenta puede estar asociada a varios clientes. A nivel de base de datos, sería una situación como la que se muestra en el siguiente esquema, en el que hemos simplificado el número de campos de las tablas Cuentas y Clientes:

<img src="images/21-02.png"> 

Las tablas Cuentas y Clientes se encuentran relacionadas muchos a muchos, pero lo hacen a través de una tabla intermedia Titulares, que contiene las claves ajenas de ambas tablas, lo que permite identificar las cuentas asociadas a cada cliente y los clientes propietarios de cada cuenta.

Observa cómo, de forma deliberada, he definido en la tabla Titulares los nombres de las claves ajenas de manera distinta a como están definidos en las tablas principales.

### Atributos de relación

A la hora de definir las entidades, Cuenta dispondrá de un atributo colección con los objetos Cliente asociados, mientras que Cliente contará con la colección de objetos Cuenta asociados:

```java
@Entity
@Table(name="Cuentas")
public class Cuenta implements Serializable{

   @Id
   private int numeroCuenta;
   
   private double saldo;
   private String tipoCuenta;
   private List<Cliente> clientes;
   //constructores y métodos setter getter

   ...

}

@Entity
@Table(name="Clientes")
public class Cliente implements Serializable{

   @Id
   private int dni;

   private String nombre;
   private String direccion;
   private int telefono;
   private List<Cuenta> cuentas;
   //constructores y métodos setter getter

   ...

}
```
 
### Configuración de la relación

De cara a configurar la relación, tenemos que tener en cuenta que una de las entidades será la propietaria de la relación mientras que la otra será la entidad del lado inverso de la relación. Al tratarse del mismo tipo de relación en ambos sentidos, da igual cual elijamos como propietaria y cual como inversa. En nuestro ejemplo, elegiremos Cliente como entidad propietaria de la relación y Cuenta como entidad inversa.

En ambas entidades, el atributo que contiene la colección de objetos relacionados deberá ser anotado con `@ManyToMany`. En el caso de la entidad del lado inverso (en nuestro ejemplo Cuenta), su atributo *mappedBy* indicará el nombre del atributo de la otra entidad que contiene los objetos relacionados de ésta:

```java
@ManyToMany(mappedBy="cuentas")
private List<Cliente> clientes;
```

Será la entidad propietaria de la relación, en nuestro caso Cliente, la que deberá incluir la información sobre la relación a través de la anotación `@JoinTable`, en la que se deberá especificar  los siguientes atributos:

* `name`. Nombre de la tabla de unión. En nuestro ejemplo, sería  "Titulares".
* `joinColumns` e `inverseJoinColumns`. Con estos atributos indicamos los campos de relación entre la tabla de join las tablas propietarias e inversa, respectivamente. El valor de cada uno de estos atributos es una anotación `@JoinColumn` con dos atributos:
   * `name`. Nombre de la columna en la tabla de join
   * `referencedColumnName`. Nombre de la columna en la tabla principal.
 
En nuestro ejemplo, el atributo *cuentas* de la entidad Cliente debería estar definido de la siguiente manera:

```java
@ManyToMany
@JoinTable(name="Titulares",
           joinColumns=@JoinColumn(name="idCliente",referencedColumnName="dni"),                inverseJoinColumns=@JoinColumn(name="idCuenta",
           referencedColumnName="numeroCuenta"))
private List<Cuenta> cuentas;
```

Teniendo las entidades relacionadas de esta manera, si, por ejemplo, quisiéramos mostrar los nombres de todos los titulares de una determinada cuenta procederíamos de la siguiente manera:

```java
String jpql="Select c From Cuenta c Where c.numeroCuenta=?1";

TypedQuery<Cuenta> q=em.createQuery(jpql,Cuenta.class):
q.setParameter(1,6666);

Cuenta cuenta=q.getSingleResult();

List<Cliente> titulares=cuenta.getClientes();

for(Cliente cl:titulares){
   System.out.println(cl.getNombre());
}
```

# 22 Crear entidades relacionadas parte I 08:20

<img src="images/22-01.png">

Después de estudiar las relaciones entre entidades en la lección anterior, a continuación te voy a enseñar cómo crear entidades relacionadas utilizando el entorno de desarrollo Eclipse.

Para ello vamos a partir de la base de datos `almacen` que te mostraba en la lección anterior relativa a un almacén de productos, donde teníamos dos tablas, una tabla de `secciones` en la que teníamos registradas las secciones en las que se van a organizar los productos del almacén con los campos:

* `idSeccion` identificador de sección que es la PRIMARY KEY
* `seccion` que representa el nombre de la sección 
* `responsable` y responsable.

Mientras que en la Tabla `productos` tendríamos:

* `idProducto` el identificador de producto 
* `nombre` el nombre del producto
* `idSeccion` la sección a la que pertenece
* `precio` el precio
* `descripcion` y la descripción

Sería una relación **Uno a Muchos** de secciones a productos **Muchos a Uno** de productos a secciones.

Vamos a proceder a crear esta nueva base de datos antes que nada. Primero creamos una conección llamada `almacen`.

<img src="images/22-02.png">

<img src="images/22-03.png">

Entramos a nueva conección que hemos creado y le aplicamos el password con la instrucción:

`ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';`

<img src="images/22-04.png">

Si retornamos al Home podemos hacer un Test de conección.

<img src="images/22-06.png">

El Script SQL para crear toda la Base de Datos `almacen` es el siguiente:

```sql
--
-- Create schema almacen
--

CREATE DATABASE IF NOT EXISTS almacen;
USE almacen;

--
-- Definition of table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `idProducto` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `idSeccion` int(10) unsigned NOT NULL,
  `precio` double NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY  (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`idProducto`,`nombre`,`idSeccion`,`precio`,`descripcion`) VALUES 
 (1,'Alicates 25m',1,10.4,'Disponibles en 10 dias'),
 (2,'Bombilla led 30w',3,5.7,'duración 10 años'),
 (3,'cable cobre 10mm',3,2,'flexible y resistente'),
 (4,'Tubo de cobre',2,3.6,'precio por metro'),
 (5,'Grifo gres',2,27.5,'Alta resistencia'),
 (6,'Taladradora 1000w',3,40.6,'Sistema silencioso'),
 (7,'Bote pintura blanca 10 l',4,25.8,'Doble capa'),
 (8,'Cerradura verja 30 mm',1,37.9,'Universal para exterior'),
 (9,'Candado 25 mm',1,13.5,'Llave incluida'),
 (10,'Interruptor doble',3,22.4,'Solo color blanco'),
 (11,'Rodillo pintura 25 cm',4,14.9,'se lava facilmente'),
 (12,'Bombilla led 10w luz blanca',3,4.8,'Gran potencia');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;


--
-- Definition of table `secciones`
--

DROP TABLE IF EXISTS `secciones`;
CREATE TABLE `secciones` (
  `idSeccion` int(10) unsigned NOT NULL auto_increment,
  `seccion` varchar(45) NOT NULL,
  `responsable` varchar(45) NOT NULL,
  PRIMARY KEY  (`idSeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secciones`
--

/*!40000 ALTER TABLE `secciones` DISABLE KEYS */;
INSERT INTO `secciones` (`idSeccion`,`seccion`,`responsable`) VALUES 
 (1,'ferreteria','Juan López'),
 (2,'fontaneria','Ana Marcos'),
 (3,'electricidad','Ruth Esteban'),
 (4,'pintura','Pedro Ramos');
/*!40000 ALTER TABLE `secciones` ENABLE KEYS */;


--
-- Definition of table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales` (
  `nombre` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `presupuesto` double NOT NULL,
  `innauguracion` int(11) NOT NULL,
  PRIMARY KEY  (`nombre`,`calle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sucursales`
--

/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` (`nombre`,`calle`,`presupuesto`,`innauguracion`) VALUES 
 ('bazar em','c/los altos',450000,2012),
 ('nueva era','c/povedilla',50000,2010),
 ('venta chin','c/povedilla',3000000,2009);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;


--
-- Definition of table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `idVenta` int(10) unsigned NOT NULL auto_increment,
  `idProducto` int(10) unsigned NOT NULL,
  `unidades` int(10) unsigned NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY  (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ventas`
--

/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`idVenta`,`idProducto`,`unidades`,`ciudad`) VALUES 
 (1,1,3,'Madrid'),
 (2,3,2,'Madrid'),
 (3,1,5,'Sevilla'),
 (4,10,4,'Avila'),
 (5,3,2,'Jaen'),
 (6,5,7,'Madrid'),
 (7,4,2,'Sevilla'),
 (8,10,3,'Salamanca'),
 (9,7,8,'Albacete'),
 (10,4,3,'Soria');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

--
-- Create schema bancabd
```

Lo ejecutamos y nos creara las tablas para esta base de datos.

<img src="images/22-05.png">

Tenemos las tablas `productos`, `secciones`, `sucursales` y `ventas`, las dos tablas de las que hablamos, más dos tablas adicionales que usaremos posteriormente.

<img src="images/22-09.png">

<img src="images/22-10.png">

<img src="images/22-07.png">

<img src="images/22-08.png">

### Creación del Proyecto en Eclipse

Partiendo de que tenemos esta base de datos `almacen` con esas dos tablas `productos` y `secciones` cómo crearíamos las entidades ya relacionadas utilizando el entorno de desarrollo Eclipse.

Vamos a crearnos un proyecto Web dinámico 

<img src="images/22-22.png">

que vamos a llamar `615-05_relacion_almacen`, cómo posteriormente utilizaremos este proyecto para crear un ejercicio donde vamos a incorporar Lógica de Negocio implementada en EJB ya vamos a coger aquí como servidor de aplicaciones GlassFish en el que vamos a desplegar la aplicación el servidor GlassFish.

<img src="images/22-23.png">

Lo primero que vamos a hacer es incorporar la característica JPA a nuestro proyecto, nos vamos a ir a través del botón derecho a las propiedades y en Project Faces activaremos JPA.

<img src="images/22-24.png">

<img src="images/22-25.png">

Debemos pulsar en `Futher Configuration Availible`

<img src="images/22-26.png">

Donde la configuración disponible ya viene por defecto Eclipse Link que por cierto este es el motor de persistencia que hemos utilizado en los ejemplos realizados hasta ahora, pero si vamos a desplegar la aplicación en un servidor de aplicaciones GlassFish, GlassFish también incorpora un motor de persistencia compatible con JPA o sea que podríamos seguir utilizando este o bien lo que conocemos como GlasFish System Library que sería el motor de GlassFish, es indiferente, en cualquier caso vamos a ver que funcionaría lógicamente tanto con uno como con otro. Vamos a dejar Eclipse Link que hemos utilizado hasta ahora, bien perfecto porque ya tenemos activado la característica JPA.

Ahora vamos a proceder como siempre que queremos generar entidades a irnos a la opción botón derecho dentro del proyecto, JPA Tools - Generate entities from Tables ..., generar entidades desde tablas.

<img src="images/22-27.png">

<img src="images/22-28.png">

Entonces aquí lo que vamos a tener que hacer es crear una conexión a esa nueva base de datos que hemos creado, es una base de datos de MySQL vamos a llamar a la conexión por ejemplo `mysql_bd_almacen`

<img src="images/22-29.png">

en el siguiente paso vamos a elegir el Driver `driver_para_mysql_2`, ya tenemos creado el Driver `driver_para_mysql` de otros ejercicios pero al usarlo fallo por eso se creo `driver_para_mysql_2` siguiendo los mismos pasos, podemos seguir utilizandolo porque al fin y al cabo es el mismo se trata de MySQL, indicamos el nombre de la base de datos, la URL y las credenciales.

<img src="images/22-30.png">

Hacemos un test de conexión para comprobar que efectivamente todo es correcto.

<img src="images/22-31.png">

y finalizamos entonces en la lista de esquemas debe aparecer el nombre de la base de datos y todas sus tablas.

<img src="images/22-32.png">

Nosotros vamos a crear Entidades para las tablas `productos` y `secciones` por lo cual las marcamos.

<img src="images/22-33.png">

y además las queremos relacionar bien pues eso lo vamos a hacer precisamente en el siguiente paso.

<img src="images/22-34.png">

En este paso que nunca hemos hecho nada hasta el momento porque nunca hemos tenido la necesidad de crear relaciones entre entidades, pero ahora llega el momento. Por lo tanto vamos a añadir aquí una nueva *Asociación de Tablas* que es como llama Eclipse la relación entre entidades.

<img src="images/22-35.png">

Puede ser una relación Simple (Uno a Muchos o Muchos a Uno) o una asociación digamos compleja (Muchos a Muchos). En nuestro caso se trataba de Uno a Muchos y Muchos a Uno, por lo tanto le dejaremos la opción simple. Elegimos una de las tablas `secciones` por ejemplo y tabla dos `productos`.

<img src="images/22-36.png">

y en el siguiente paso 

<img src="images/22-37.png">

vamos a indicar de ambas tablas cuál es el campo común, la columna común a ambas tablas a través del botón Add, por defecto el indica que en secciones sería `idSeccion` y en productos `descripcion`.

<img src="images/22-38.png">

Evidentemente no pueden ser descripción sino que se también `idSeccion` la columna que permite identificar a qué sección pertenece cada producto, la columna común de ambas tablas.

<img src="images/22-39.png">

en el siguiente paso 

<img src="images/22-40.png">

ya debemos elegir exactamente qué tipo de relación queremos entre esas dos entidades que vamos a generar a partir de esas tablas, pueden ser Muchos a Uno, de cada producto le corresponden muchas secciones no es el caso, sino Uno a Muchos cada sección le corresponden muchos productos que obviamente se traducirá en el lado de producto en una relación tipo Muchos a Uno, muchos productos una sección.

<img src="images/22-41.png">

Una vez ya elegido esto finalizamos aparece aquí la información de la relación gráficamente

<img src="images/22-42.png">

que si pulsamos sobre ella nos indica las propiedades simplemente que hemos configurado, si tuviéramos que cambiar algo sería aquí donde lo podríamos hacer, no tendríamos que borrarla y volver a crear sino que aquí podríamos hacer los cambios que necesitase.

<img src="images/22-43.png">

En el siguiente paso 

<img src="images/22-44.png">

le demos indicar ya los datos que normalmente indicamos cuando vamos a crear entidades a partir de las tablas. En la generación de claves(Key generator) de momento no decimos nada, luego se lo vamos a indicar uno por uno en el paso siguiente, lo que si queremos que las entidades se generen en el paquete entidades no en model como indica lo cambiamos, muy importante ahora porque como se trata de asociación de Uno a Muchos - Muchos a Uno, va a haber entidades que tendrán campos de colección, debemos indicar en `Collection properties type` si queremos que esas colecciones sean de tipo `Set` o `List` que es el que habitualmente se suele utilizar.

<img src="images/22-45.png">

En el siguiente paso 

<img src="images/22-46.png">

Tabla `Producto`, nombre de la entidad `Producto`, generación de clave `identity`.

<img src="images/22-47.png">

Tabla `Secciones` nombre de la clase `Seccion`, generación de clave también es `identity`.

<img src="images/22-48.png">

Finalizamos y ya tenemos nuestras entidades generadas y relacionadas.

<img src="images/22-49.png">

Vamos a comprobarlo. Empezamos por la Entidad `Seccion` la del lado 1.

*`Seccion`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the secciones database table.
 * 
 */
@Entity
@Table(name="secciones")
@NamedQuery(name="Seccion.findAll", query="SELECT s FROM Seccion s")
public class Seccion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idSeccion;

	private String responsable;

	private String seccion;

	//bi-directional many-to-one association to Producto
	@OneToMany(mappedBy="seccione")
	private List<Producto> productos;

	public Seccion() {
	}

	public int getIdSeccion() {
		return this.idSeccion;
	}

	public void setIdSeccion(int idSeccion) {
		this.idSeccion = idSeccion;
	}

	public String getResponsable() {
		return this.responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getSeccion() {
		return this.seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	public List<Producto> getProductos() {
		return this.productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

	public Producto addProducto(Producto producto) {
		getProductos().add(producto);
		producto.setSeccione(this);

		return producto;
	}

	public Producto removeProducto(Producto producto) {
		getProductos().remove(producto);
		producto.setSeccione(null);

		return producto;
	}

}
```

Y aquí veremos a partir de las anotaciones clásicas, efectivamente vemos ese nuevo atributo `productos`

```java
//bi-directional many-to-one association to Producto
@OneToMany(mappedBy="seccione")
private List<Producto> productos;
```

que contienen la colección de productos asociados a esta sección anotada con `@OneToMany(mappedBy="seccione")` el nombre del atributo de la otra Entidad de Producto, que contiene el objeto `seccione` asociado, le a puesto `seccione` lo podemos cambiar o lo podemos dejar así no pasa nada.

Vamos a ver esa Entidad `Producto`

*`Producto`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the productos database table.
 * 
 */
@Entity
@Table(name="productos")
@NamedQuery(name="Producto.findAll", query="SELECT p FROM Producto p")
public class Producto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProducto;

	private String descripcion;

	private String nombre;

	private double precio;

	//bi-directional many-to-one association to Seccion
	@ManyToOne
	@JoinColumn(name="idSeccion")
	private Seccion seccione;

	public Producto() {
	}

	public int getIdProducto() {
		return this.idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return this.precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Seccion getSeccione() {
		return this.seccione;
	}

	public void setSeccione(Seccion seccione) {
		this.seccione = seccione;
	}

}
```

Vemos que tenemos efectivamente un atributo de tipo `Seccion` llamado `seccione`


```java
//bi-directional many-to-one association to Seccion
@ManyToOne
@JoinColumn(name="idSeccion")
private Seccion seccione;
```

lo a anotado con `@ManyToOne` a través `@JoinColumn(name="idSeccion")` como ya explicamos en la lección anterior se establece el nombre de las columnas que definen esa relación entre las tablas, como en ambas tablas se llama igual basta con indicar el atributo `name="idSeccion")` para saber que ambas columnas con ese mismo nombre, van a ser las que permiten identificar los objetos asociados a cada una de las otras entidades de la tabla relacionada.

Por lo tanto ya tenemos las entidades generadas con toda la información de configuración correspondiente a sus relaciones.

### :computer: Código Completo - 615-05_relacion_almacen

Este código realmente no hace nada, así como esta.

<img src="images/22-50.png">

*`persistence.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-05_relacion_almacen">
		<class>entidades.Producto</class>
		<class>entidades.Seccion</class>
	</persistence-unit>
</persistence>
```

**Entidades**

*`Seccion.java`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the secciones database table.
 * 
 */
@Entity
@Table(name="secciones")
@NamedQuery(name="Seccion.findAll", query="SELECT s FROM Seccion s")
public class Seccion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idSeccion;

	private String responsable;

	private String seccion;

	//bi-directional many-to-one association to Producto
	@OneToMany(mappedBy="seccione")
	private List<Producto> productos;

	public Seccion() {
	}

	public int getIdSeccion() {
		return this.idSeccion;
	}

	public void setIdSeccion(int idSeccion) {
		this.idSeccion = idSeccion;
	}

	public String getResponsable() {
		return this.responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getSeccion() {
		return this.seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	public List<Producto> getProductos() {
		return this.productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

	public Producto addProducto(Producto producto) {
		getProductos().add(producto);
		producto.setSeccione(this);

		return producto;
	}

	public Producto removeProducto(Producto producto) {
		getProductos().remove(producto);
		producto.setSeccione(null);

		return producto;
	}

}
```

*`Producto.java`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the productos database table.
 * 
 */
@Entity
@Table(name="productos")
@NamedQuery(name="Producto.findAll", query="SELECT p FROM Producto p")
public class Producto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProducto;

	private String descripcion;

	private String nombre;

	private double precio;

	//bi-directional many-to-one association to Seccion
	@ManyToOne
	@JoinColumn(name="idSeccion")
	private Seccion seccione;

	public Producto() {
	}

	public int getIdProducto() {
		return this.idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return this.precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Seccion getSeccione() {
		return this.seccione;
	}

	public void setSeccione(Seccion seccione) {
		this.seccione = seccione;
	}

}
```

# 23 Crear entidades relacionadas parte 2 08:41

En esta nueva lección después de haber explicado cómo crear una relación Una a Muchos - Muchos a Uno entre entidades a través de Eclipse, vamos a ver ahora cómo crear una relación Muchos a Muchos y vamos a utilizar el ejemplo de base de datos que vimos en la lección anterior.

Lo primero vamos a irnos a Workbeanch donde vamos a crear una nueva conexión de base de datos llamada `bancadb`.

<img src="images/23-01.png">

<img src="images/23-02.png">

<img src="images/23-03.png">

Entramos a esa nueva conexión para asignarle el password con:

`ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';`

<img src="images/23-04.png">

Vamos a ejecutar el siguiente Script para crear la BD `bancadb`.

```sql
--
-- Create schema bancabd
--

CREATE DATABASE IF NOT EXISTS bancabd;
USE bancabd;

--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `dni` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`dni`,`nombre`,`direccion`,`telefono`) VALUES 
 (1111,'Pepito','c/marte',1111),
 (2222,'Alicia','c/ jupiter',2222),
 (3333,'Marta','c/venus',3333);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Definition of table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE `cuentas` (
  `numeroCuenta` int(10) unsigned NOT NULL,
  `saldo` double NOT NULL,
  `tipocuenta` varchar(45) NOT NULL,
  PRIMARY KEY  (`numeroCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuentas`
--

/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` (`numeroCuenta`,`saldo`,`tipocuenta`) VALUES 
 (1000,300,'ahorro'),
 (2000,3450,'ahorro'),
 (3000,670,'recibos'),
 (4000,880,'ahorro'),
 (5000,6700,'recibos');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;


--
-- Definition of table `titulares`
--

DROP TABLE IF EXISTS `titulares`;
CREATE TABLE `titulares` (
  `idCuenta` int(10) unsigned NOT NULL,
  `idCliente` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`idCuenta`,`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titulares`
--

/*!40000 ALTER TABLE `titulares` DISABLE KEYS */;
INSERT INTO `titulares` (`idCuenta`,`idCliente`) VALUES 
 (1000,3333),
 (1000,5555),
 (2000,1111),
 (2000,3333),
 (3000,1111),
 (4000,2222),
 (5000,4444);
/*!40000 ALTER TABLE `titulares` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

```

Al ejecutar el Script anterior se crea la base de datos `bancadb` y las tablas `clientes`, `cuentas` y `titulares`

<img src="images/23-05.png">

<img src="images/23-06.png">

<img src="images/23-07.png">

<img src="images/23-08.png">

La base datos se llama `bancadb` donde tenemos una tabla de `clientes`

<img src="images/23-09.png">

con los datos registrados de todos los clientes DNI, nombre, dirección y teléfono.

La tabla `cuentas` 

<img src="images/23-10.png">

que son las cuentas de esos clientes el número de cuenta, saldo o el tipo de cuenta y luego la tabla `titulares` tabla intermedia o joing

<img src="images/23-11.png">

que relaciona las Foreign Keys de cada una de las tablas principales de modo que podamos establecer esa relación Muchos a Muchos entre `clientes` y `cuentas` que como vemos la clave primaria de esta tabla intermedia sería la combinación de ambas claves Foreign Keys el `idCuenta` e `idCliente`.

Aquí como ya viste en la lección anterior el `idCliente` aposta se ha llamado diferente a como se llama esa columna de clientes que es `dni` mientras que `idCuenta` también se llama de forma diferente a como se llama la Primary Key de la tabla `cuentas` que es `numeroCuenta`.


### Creación Proyecto en Eclipse

Pues bien vamos a establecer la relación de tipo Muchos a Muchos entre las dos entidades que vamos a generar a partir de esas tablas `clientes` y `cuentas`.

Vamos a crearnos un nuevo proyecto Dynamic Web Project

<img src="images/23-12.png">

lo vamos a llamar `615-06_relacion_bancadb` también sobre el servidor GlassFish aunque ahora eso nos da un poquito igual de cara a generar las entidades.

<img src="images/23-13.png">

y finalizamos. Procedemos como en el ejemplo anterior a las propiedades siempre y Project Facets 

<img src="images/23-14.png">

activamos JPA

<img src="images/23-15.png">

para que el asistente nos permita generar las entidades, así que através del botón derecho JPA Tools - Generated Entity Tables.. generar entidades desde tablas.

<img src="images/23-16.png">

Vamos a crear la conexión a esa base de datos que llamaremos `mysql_bd_bancadb`.

<img src="images/23-17.png">

En el siguiente paso seleccionamos el Driver de MySQL que estamos usando y metemos los datos de conexión de la base de datos, ojo por que el Schema lo llamamos `bancadb` y la base de datos realmente se llama `bancabd`.

<img src="images/23-18.png">

Al hacer el Test de Conexión nos dimos cuenta de este pequeño fallo y así ponemos el nombre adecuado.

<img src="images/23-19.png">

**NOTA:** Un pequeño parentesis, antes de continuar. Si necesitamos por algún motivo editar las conexiones de base de datos que tenemos. Bueno tenemos aquí un pequeño truquillo si nos vamos a las perspectivas hay una de las perspectivas en Eclipse que se llama `Database Development`. Por ejemplo yo no he estado salvando el password de la conexión y he notado que al momento de hacer el ping no me lo hace, el motivo puede ser ese, por lo que tendría que editar dichas conexiones. La forma de hacerlo es abrir la perspectiva `Database Development`.

<img src="images/23-40.png">

Si entramos en esa perspectiva vemos aquí todas las conexiones que se han ido creando con el asistente y uno de ellos es precisamente `bancabd`.

<img src="images/23-41.png">

Para posteriores veces donde quieras crear a lo mejor otra vez las entidades o nuevas entidades de esa base de datos para que no tengas que volver a crear de nuevo otra conexión 

<img src="images/23-42.png">

te vas aquí y deberíamos conectarnos. 

<img src="images/23-43.png">

aparecen los datos de conexión que habiamos insertado, lo único que me falta es la contraseña porque no le di a la opción de guardar para que se quedara guardada para las siguientes veces

<img src="images/23-44.png">

entonces usamos el botón Apply and Close y se genera la conexión con esa base de datos.

Si volvemos a la perspectiva Java EE ya voy a poder volver al asistente JPA Tools - Generate Entity Tables ... y así elegir la conexión `mysql_bd_bancabd`  y aparecen los datos de la base de datos y las tres tablas que hay.

Una vez creada la conexión a la base de datos ya podemos seleccionar el Schema y me aparecen las tablas.

<img src="images/23-20.png">

Nosotros vamos a generar entidades de dos tablas `clientes` y `cuentas` no de `titulares`, `titulares` es la tabla de Join no la tenemos que elegir aquí 

<img src="images/23-21.png">

vamos al siguiente paso 

<img src="images/23-22.png">

y pulsamos el botón `New Association`

<img src="images/23-23.png">

para crear la asociación que va a ser de tipo Muchos a Muchos, primera tabla por ejemplo `cuentas` segunda tabla `clientes`,  tabla Join, tabla de unión que contiene las Primary Keys de las dos tablas o le damos a este botoncito y ahora sí aparecen las tres aunque no haya elegido titulares pero aparecen todas las que hay para que pueda elegir `titulares`.

<img src="images/23-24.png">

En el siguiente paso 

<img src="images/23-25.png">

nos va a decir que especificamos las columnas de unión entre cuentas y titulares y entre titulares y clientes, bien aquí pulsando el boton Add

<img src="images/23-26.png">

Lógicamente el `numeroCuenta` en `cuentas` y tenemos que cambiar `idCliente` por `idCuenta` para `titulares` que es la tabla de Join.

<img src="images/23-27.png">

Abajo hacemos lo mismo presionamos Add,

<img src="images/23-28.png">

en `titulares` esta bien `idCliente` pero en `clientes` debe ser `dni`.

<img src="images/23-29.png">

Pues ya tenemos toda la información de unión, el siguiente paso.

<img src="images/23-30.png">

La única opción que cabe es Many to Many finalizamos.

<img src="images/23-31.png">

Aquí aparece la relación, si pinchamos en la imagen aparecen los detalles

<img src="images/23-32.png">

y ya en el siguiente paso 

<img src="images/23-33.png">

pues como de costumbre debemos indicarnos cuáles son la la forma de generación de las claves y cómo van a ser los campos de colección, vamos a dejar siempre por efecto List, el paquete `entidades`.

<img src="images/23-34.png">

y en el siguiente paso vamos a ir tabla por tabla indicando `clientes`, entidad correspondiente `Cliente` forma de generación de clave ninguna (none), puesto que el DNI del cliente no es autogenerado, no se va a generar de forma automática.

<img src="images/23-35.png">

con `cuentas` lo mismo el `numeroCuenta` no se va a generar automáticamente

<img src="images/23-36.png">

Finalizamos y vamos a ver ahora qué es lo que nos ha creado el asistente.

<img src="images/23-37.png">

Al ver esto nos vamos a llevar una pequeña desagradable sorpresa, existen errores. Y es que por ejemplo vamos a la entidad `Cliente`.

*`Cliente`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the clientes database table.
 * 
 */
@Entity
@Table(name="clientes")
@NamedQuery(name="Cliente.findAll", query="SELECT c FROM Cliente c")
public class Cliente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int dni;

	private String direccion;

	private String nombre;

	private int telefono;

	//bi-directional many-to-many association to Cuenta
	@ManyToMany(mappedBy="clientes")
	private List<Cuenta> cuentas;

	public Cliente() {
	}

	public int getDni() {
		return this.dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
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

	public List<Cuenta> getCuentas() {
		return this.cuentas;
	}

	public void setCuentas(List<Cuenta> cuentas) {
		this.cuentas = cuentas;
	}

}
```

En la entidad `Cliente` nos ha puesto efectivamente un atributo con la lista de todos los objetos cuenta asociados a ese cliente 

```java
//bi-directional many-to-many association to Cuenta
@ManyToMany(mappedBy="clientes")
private List<Cuenta> cuentas;
```

Se supone que entonces serían en `Cuenta` donde tendríamos la información de configuración de la relación. Si vemos `Cuenta`.

*`Cuenta`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the cuentas database table.
 * 
 */
@Entity
@Table(name="cuentas")
@NamedQuery(name="Cuenta.findAll", query="SELECT c FROM Cuenta c")
public class Cuenta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int numeroCuenta;

	private double saldo;

	private String tipocuenta;

	//bi-directional many-to-many association to Cliente
	@ManyToMany
	@JoinColumn(name="numeroCuenta")
	private List<Cliente> clientes;

	public Cuenta() {
	}

	public int getNumeroCuenta() {
		return this.numeroCuenta;
	}

	public void setNumeroCuenta(int numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}

	public double getSaldo() {
		return this.saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}

	public String getTipocuenta() {
		return this.tipocuenta;
	}

	public void setTipocuenta(String tipocuenta) {
		this.tipocuenta = tipocuenta;
	}

	public List<Cliente> getClientes() {
		return this.clientes;
	}

	public void setClientes(List<Cliente> clientes) {
		this.clientes = clientes;
	}

}
```

Resulta que sí tenemos aquí el atributo `clientes`, con la lista de objetos clientes relacionados, aquí tendría que estar la información de configuración, pero no está, por algún motivo que tampoco se explicar, el asistente no es capaz de generar y es aquí donde nos marca el error.

```java
//bi-directional many-to-many association to Cliente
@ManyToMany
@JoinColumn(name="numeroCuenta")
private List<Cliente> clientes;
```

<img src="images/23-38.png">

entonces eso ya lo tenemos que hacer nosotros a mano.

En `Cliente` que es la entidad que elegimos como propietaria, cuando explicamos todo esto en la lección anterior, la lección correspondiente a las relaciones entre entidades, aquí en `Cliente` concretamente en este atributo `cuentas`, la colección cuenta, es donde vamos a cambiar esto:

```java
//bi-directional many-to-many association to Cuenta
@ManyToMany(mappedBy="clientes")
private List<Cuenta> cuentas;
```

Por esto:

```java
@ManyToMany
@JoinTable(name = "Titulares", 
	joinColumns = @JoinColumn(name="idCliente", referencedColumnName = "dni"),
	inverseJoinColumns = @JoinColumn(name="idCuenta", referencedColumnName = "numeroCuenta"))
private List<Cuenta> cuentas;
```

Hemos anotado el atributo `cuentas` con `@ManyToMany` y luego con la anotación `@JoinTable` indicamos cual la tabla de Join en este caso `Titulares` y la relación de la tabla de `Titulares` con la tabla de `Clientes` con el atributo `joinColumn` y la relación entre ambas las tablas de `Titulares` con la tabla de `Cuentas` con el atributo `inverseJoinColumn`.

Y en la Entidad Cuenta tenemos que cambiar esto:


```java
//bi-directional many-to-many association to Cliente
@ManyToMany
@JoinColumn(name="numeroCuenta")
private List<Cliente> clientes;
```

Por 

```java
//bi-directional many-to-many association to Cliente
@ManyToMany(mappedBy="cuentas")
private List<Cliente> clientes;
```

El error desaparece ahora tenemos completamente relacionada ambas entidades, ahora si estan relacionadas Muchos a Muchos correctamente ya podríamos operar con ellas.

### :computer: Código Completo - 615-06_relacion_bancadb

Este código realmente no hace nada, así como esta.

<img src="images/23-39.png">


*`persistence.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-06_relacion_bancadb">
		<class>entidades.Cliente</class>
		<class>entidades.Cuenta</class>
	</persistence-unit>
</persistence>
```

**Entidades**

*`Cliente.java`*

```java
package entidades;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the clientes database table.
 * 
 */
@Entity
@Table(name="clientes")
@NamedQuery(name="Cliente.findAll", query="SELECT c FROM Cliente c")
public class Cliente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int dni;

	private String direccion;

	private String nombre;

	private int telefono;

	//bi-directional many-to-many association to Cuenta
	@ManyToMany
	@JoinTable(name = "Titulares", 
	joinColumns = @JoinColumn(name="idCliente", referencedColumnName = "dni"),
	inverseJoinColumns = @JoinColumn(name="idCuenta", referencedColumnName = "numeroCuenta"))
	private List<Cuenta> cuentas;

	public Cliente() {
	}

	public int getDni() {
		return this.dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
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

	public List<Cuenta> getCuentas() {
		return this.cuentas;
	}

	public void setCuentas(List<Cuenta> cuentas) {
		this.cuentas = cuentas;
	}

}
```

*`Cuenta.java`*

```java
package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the cuentas database table.
 * 
 */
@Entity
@Table(name="cuentas")
@NamedQuery(name="Cuenta.findAll", query="SELECT c FROM Cuenta c")
public class Cuenta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int numeroCuenta;

	private double saldo;

	private String tipocuenta;

	//bi-directional many-to-many association to Cliente
	@ManyToMany(mappedBy="cuentas")
	private List<Cliente> clientes;

	public Cuenta() {
	}

	public int getNumeroCuenta() {
		return this.numeroCuenta;
	}

	public void setNumeroCuenta(int numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}

	public double getSaldo() {
		return this.saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}

	public String getTipocuenta() {
		return this.tipocuenta;
	}

	public void setTipocuenta(String tipocuenta) {
		this.tipocuenta = tipocuenta;
	}

	public List<Cliente> getClientes() {
		return this.clientes;
	}

	public void setClientes(List<Cliente> clientes) {
		this.clientes = clientes;
	}

}
```

# 24 Ejercicio práctico IV parte I 07:19

<img src="images/24-01.png">

Bueno pues después de haber visto cómo crear entidades relacionadas utilizando Eclipse, qué te parece si hacemos una aplicación donde pongamos en práctica lo que hemos estudiado.

<img src="images/24-02.png">

La idea se trataría de desarrollar una aplicación Web en la que vamos a trabajar con la base de datos de almacén la que hemos creado las relaciones Uno a Muchos - Muchos a Uno anteriormente y se trataría de tener una página inicial con un enlace que nos daría acceso a una página en la que podríamos seleccionar la sección cuyos productos queremos consultar, es una aplicación para consulta de productos.

Si seleccionamos una sección al pulsar el botón *Ver Productos* veríamos los productos que pertenecen a dicha sección su nombre, precio y descripción. Tendríamos también una opción Todos que al seleccionarlo nos mostraría los productos de todas las secciones.

En la tercera página habría un enlace para volver otra vez a la página de Selección de Sección.

### Creación de la Aplicación

Lo primero que vamos a recordar son los datos de nuestra la base de datos que usaremos en esta aplicación el nombre es `almacen`.

<img src="images/24-03.png">

La base de datos tiene 4 tablas pero para esta aplicación solo vamos a usar dos de ellas `secciones` y `productos`, los datos que contienen actualmente son:

<img src="images/24-04.png">

<img src="images/24-05.png">

#### 1. Creación DataSource y JNDI en GlassFish.

Lo primero que vamos a hacer antes de nada será crear el DataSource en GlassFish para poder acceder a la base de datos `almacen`.

Por lo que nos vamos a GlassFish - Resources - JDBC - JDBC Connections Pools

<img src="images/24-06.png">

Vamos a presionar el botón New

<img src="images/24-07.png">

Ingresamos los datos para este nuevo DataSource.

<img src="images/24-08.png">

Damos a siguiente paso

<img src="images/24-09.png">

Aquí debemos meter las propiedades necesarias para poder hacer la conexión, algunas de las que necesitamos no aparecen hay que añadirlas.

Las propiedades completas son:

databaseName: almacen
password: root
Port: 3306
portNumber: 3306
serverName: localhost
Url: jdbc:mysql://localhost:3306/almacen?serverTimezone=UTC
URL: jdbc:mysql://localhost:3306/almacen?serverTimezone=UTC
user: root
useSSL: false

<img src="images/24-10.png">

ademas en la pestaña General en el dato Datasource Classname: tuvimos que cambiar el valor que salia por `com.mysql.cj.jdbc.MysqlDataSource` para que funcione.

<img src="images/24-11.png">

Al presionar el botón Ping para probar la conexión a la base de datos nos muesta **Ping Succeeded**

<img src="images/24-12.png">

Por lo que ya tenemos nuestra JDBC Connection Pools `poolalmacen` funcionando.

<img src="images/24-13.png">

Nos fata hacer el JNDI para lo cual vamos a JDBC Resources 

<img src="images/24-14.png">

Presionamos New para crear un nuevo JNDI e ingresamos los datos solicitados.

JNDI Name: `jdbc/almacends`
Pool Name: `poolalmacen`

<img src="images/24-15.png">

Presionamos OK.

<img src="images/24-16.png">

Perfecto ahora si ya esta nuestro DataSource y JNDI completamente funcional.

#### 2. Repetir los pasos de la sección "22 Crear entidades relacionadas parte I" para crear la capa de Persistencia y las Entidades Seccion y Producto.

AQUI.

Bien pues vamos a ver en el entorno de desarrollo Eclipse cómo se desarrollaría dicha aplicación.

Yo ya la tengo desarrollada.

Realmente se trata de seguir los mismos pasos que hemos seguido los ejercicios anteriores y centrarnos en lo que es la lógica de negocio JPA entonces vamos a ello.

Realmente he partido del ejercicio de la relación almacén que teníamos del vídeo anterior.

Lo he renombrado como 0 5 ejercicio práctico 4.

Y bueno pues en esas entidades que ya teníamos relacionadas producto sección de uno a muchos y de muchos a uno le hemos añadido ya la capa de persistencia realmente y lo hemos añadido pues todo lo que es la Lógica de Negocio el modelo el controlador con los servlet y las vistas paginas HTML y JSP.

Pero vamos a centrarnos en el modelo que es la lógica de negocio JPA que accede a esa capa de persistencia y que debe ofrecer dicha funcionalidad en primer lugar te voy a enseñar los métodos que deberías poner la Lógica de Negocio a través de la interfaz de LJG La interfaz de negocio obviamente tendríamos que tener un método que nos devuelva todas las secciones para poder mostrarlas en la lista de selección de secciones otro método que nos devolvería todos los productos para el caso de que elijamos qué queremos ver todos los productos y un método último que es digamos en el que más nos interesa por el tema de las relaciones que nos devolvería la lista de productos asociados a una determinada sección un determinado código versación vamos a ver el código ampliamos aquí y puedes obtener secciones y obtener productos pues realmente son muy sencillos porque realmente utilizamos lo que ya hemos visto en lecciones anteriores.

Aprovechamos las Lamet que cree que crea automáticamente Eclipse cuando creamos las entidades de selección de todas las secciones en este caso selección de todos los productos creamos un Taipe QR llamada results simplemente vamos a centrarnos en este método que es el más interesante.

Cómo podríamos obtener la lista de productos de una determinada sección A partir de su código.

Podríamos construir esta J.P. se LTP fue un producto Wer como el la columna y de sección forma parte de la entidad producto pues podríamos establecer esta condición pero las entidades están relacionadas como están relacionadas.

Lo primero es que este campo de sección ya no lo tenemos en la entidad producto tendríamos el campo o atributo sección y si podríamos poner Sección Punto y sección esa sería la forma de hacerlo pero ya que las tenemos relacionadas vamos a aprovecharnos de esa relación.

No vamos a necesitar esta instrucción J.P. QL no la vamos a necesitar.

Por qué Podemos directamente hacer una búsqueda simple de la sección A partir de su primary key cómo la sección está relacionada con productos ya trae la lista de productos asociados.

Sería simplemente una vez que ya tenemos el objeto sección llamada El método de productos que nos devuelve todos los productos que tiene esa sección de asociados.

Gracias a la relación automáticamente al hacer la búsqueda de la sección vienen con ella todos los objetos de las entidades.

En este caso de la entidad relacionada.

Así de simple sería.

Y esto es lo que nos facilita enormemente el trabajo y la lógica de negocio en muchas aplicaciones donde necesitamos aprovecharnos de la relación.

Esto sería lo que es la parte JPA lo servlet bueno pues tendríamos el controlador por un lado productos Auction que se encargan de recuperar el parámetro que viene de la página HTML con la sección elegida.

Si es cero es que a pedido todos llamamos a un método obtener productos si es distinto de cero es que a pedido los productos de una determinada sección y al final pasamos el control a la página de productos para que los enseñes controlador de las secciones que es el que es llamado cuando queremos entrar en la página de donde aparece la lista de secciones pues debe recuperar todas las secciones o guardarlo también en un atributo de petición y pasar el control a las clases presenciales.

Este código no es exactamente objetivo de este curso porque realmente esto ya no es JPA.

No te preocupes porque la sección de recursos adicionales te lo vas a poder descargar porque yo ya tengo este proyecto ya creado y está dentro de la lección y te lo puedes descargar para examinarlo tranquilamente probarlo etc..

En las páginas HTML y JSP se utilizan LJ STL utilizan etiquetas HTML en fin algo ya propio de lo que es la tecnología JSP y lo único bueno te voy a enseñar el pomme XML que es porque este proyecto lo hemos convertido en proyecto Maven para poder incluir estas dependencias tanto Ojota STL como del driver para no tener que incorporarlo explícitamente.

Esto ya lo hemos visto en algún otro proyecto donde hemos utilizado Maven y por último así mencionarte el persiste en XML pues al crear las entidades las entidades ya se han generado se han incluido automáticamente dentro del archivo.

Eso sí el Data Suhr JDBC almacén de S.

Este es un data Sohr que ha habido que crear homogéneamente en el servidor de aplicaciones apuntando a la base de datos como ya te explique en la lección correspondiente a la creación de la tasó el caso es que volviendo otra vez al tema de las relaciones entre entidades has visto cómo efectivamente ha simplificado bastante la lógica de negocio.

Pero bueno pongamos otro caso imaginamos que imagínate que queremos también incluir un método que nos que queremos que nos devuelva la sección a la que pertenece un determinado producto a partir de su nombre.

Bueno pues gracias a la relación yo puedo hacer una búsqueda directa del producto que cumple la condición no necesito hacer uniones entre las L.T entre las entidades porque directamente buscando el producto automáticamente una vez que ya no encuentro esto sería el método que me devuelve el producto que Singhal resulta como me trae la sección relacionada directamente llamando a su método.

Obtengo el objeto acción y ya lo puedo devolver directamente.

Es decir simplifica la relación enormemente pues parte de la lógica de negocio de las aplicaciones.

El hecho de que traernos una entidad nos venga ya con sus objetos relacionados.



# 25 Ejercicio práctico IV parte 2 01:57
# 26 joins 05:53
# 27 Ejercicio práctico V 06:02
# Autoevaluación V 01:30

