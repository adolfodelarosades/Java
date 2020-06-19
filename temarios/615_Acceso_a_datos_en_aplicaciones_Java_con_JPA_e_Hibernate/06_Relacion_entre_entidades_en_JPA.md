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

<img src="images/22-07.png">

<img src="images/22-08.png">

Partiendo de que tenemos esta base de datos `almacen` con esas dos tablas `productos` y `secciones` cómo crearíamos las entidades ya relacionadas utilizando el entorno de desarrollo Eclipse.

AQUIIII

Vamos a crearnos un proyecto dinámico que vamos a llamar la opción almacén por ejemplo cómo posteriormente utilizaremos este proyecto para crear un ejercicio donde vamos a incorporar lógica de negocio implementada en pareja Babín ya vamos a coger aquí como servidor de aplicaciones en el que vamos a desplegar la aplicación el servidor las que ya directamente finalizamos y lo que vamos a hacer.

Lo primero para incorporar la característica JPA a nuestro proyecto nos vamos a ir a través del botón derecho a las propiedades y en Project Faces activaremos JPA donde la configuración disponible ya viene por defecto.

Eclipse Lihn que por cierto este es el motor de persistencia que hemos utilizado en los ejemplos realizados hasta ahora.

Pero si vamos a desplegar la aplicación en un servidor de aplicaciones Graphics Goldfish también incorpora un motor de persistencia compatible con JPA o sea que podríamos seguir utilizando este o bien lo que conocemos como Class System Library que sería el motor de Fish es indiferente en cualquier caso es todo lo que vamos a ver funcionaría lógicamente tanto con uno como con otro.

Pero bueno vamos a dejar el eclipse Linker que hemos utilizado hasta ahora bien perfecto porque ya tenemos activado la característica JPA.

Ahora vamos a proceder como siempre que queremos generar entidades a irnos a la opción botón derecho dentro del proyecto JPA Tools generar entidades desde tablas.

Entonces aquí lo que vamos a tener que hacer es crear una conexión a esa nueva base de datos que hemos creado es una base de datos de mayor SQL vamos a llamar a la conexión por ejemplo almacén Maire SQL el siguiente paso vamos a elegir el Driver Driver para mayor secuela que esto ya lo tenemos creado ese trailer de otros ejercicios ya podemos seguir utilizando porque al fin y al cabo es el mismo.

Se trata de mayor secuela misma base de datos y el nombre de la base datos almacén almacena que también y los datos de conexión credenciales Rut y Errota.

Hacemos un test de conexión para comprobar que efectivamente todo es correcto y finalizamos entonces aquí la lista de esquemas de ver aparecer el nombre de la base de datos y todas sus tablas.

Nosotros vamos a crear entidades para las tablas productos y secciones y además la vamos.

Las queremos relacionar bien pues eso lo vamos a hacer precisamente en el siguiente paso.

Este paso que nunca hemos hecho nada hasta el momento porque nunca hemos tenido la necesidad de crear relaciones entre entidades pero ahora llega el momento.

Por lo tanto vamos a añadir aquí una nueva asociación de tablas que es como llama eclipse la relación entre entidades.

Se puede puede ser una relación simple uno a muchos muchos a uno o asociación digamos compleja muchos a muchos.

Nuestro caso se trataba de uno a muchos y muchos a uno por lo tanto le dejaremos la opción simple.

Elegimos una de las tablas o secciones por ejemplo tabla dos productos y en el siguiente paso vamos a indicar de ambas tablas cuál es el campo común la columna común ambas tablas a través del botón adrede por defecto el indica que en secciones sería de sección y en productos.

Evidentemente no pueden ser descripción sino que se también la sección la columna que permite identificar a qué sección pertenece cada producto ser la columna común de ambas tablas en el siguiente paso ya debemos elegir exactamente qué tipo de relación queremos entre esas dos entidades que vamos a generar a partir de esas tablas pueden ser muchos a uno de cada producto le corresponden muchas secciones no es el caso sino uno a muchos cada sección le corresponden muchos productos que obviamente se traducirá en el lado de producto de una relación tipo muchos a uno muchos productos una sección pues una vez ya elegido esto finalizamos aparece aquí la información de la relación gráficamente que si pulsamos sobre ella nos indica las propiedades simplemente que hemos configurado.

Si tuviéramos que cambiar algo sería aquí donde lo podríamos hacer no tendríamos que borrarla y volver a crear sino que aquí podríamos hacer los cambios que necesitase.

Pues en el siguiente paso no le demos indicar ya los datos que normalmente indicamos no vamos a crear entidades a partir de las tablas.

La generación de claves aquí de momento no decimos nada y luego sólo vamos a indicar uno por uno en el paso siguiente y si queremos que las entidades se generen en el paquete entidades muy importante ahora porque como se trata de asociación de uno a muchos muchos a uno va a haber entidades que tendrán campos de colección.

Debemos indicar si queremos que esas colecciones sean de tipo OSEP o Licks.

Habitualmente es el que se suele utilizar bien en el siguiente paso entidad productos Tabla Productos aquí nombre de la entidad producto generación de clave identidad tablas secciones nombre de la clase sección o secciones quitado la S.

Pero obviamente en singular secciones serían sección y la generación de clave también es identidad que analizamos y ya tenemos nuestras entidades generales y relacionadas.

Vamos a comprobarlo.

Empezamos por la entidad sección la del lado 1 y aquí veremos a partir de las anotaciones clásicas.

Pues efectivamente vemos ese nuevo atributo productos que contienen la colección de productos asociados a esta sección anotada con arroba o en Tumen y en Paperboy el nombre del atributo de la otra entidad de producto que contiene el objeto secciona asociado a puestos secciones.

No podemos cambiar o lo podemos dejar así nada vamos a ver esa entidad producto ya veremos que tenemos pues efectivamente un atributo de tipo sección o secciones lo ha llamado y anotado con arroba mérito a través de un club como ya explicamos en la lección anterior se establece el nombre de las columnas reglas que definen esa relación entre las tablas Name y referentes con name aquí directamente como ambas se llaman igual.

Basta con indicar el atributo name de sección para saber que ambas columnas con ese mismo nombre van a ser las que permiten identificar los objetos asociados a cada una de las otras entidades de la tabla relacionada.

Por lo tanto ya tenemos las entidades generadas con toda la información de configuración correspondiente a sus relaciones.

# 23 Crear entidades relacionadas parte 2 08:41
# 24 Ejercicio práctico IV parte I 07:19
# 25 Ejercicio práctico IV parte 2 01:57
# 26 joins 05:53
# 27 Ejercicio práctico V 06:02
# Autoevaluación V 01:30

