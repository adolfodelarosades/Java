# 2. Introducción a la persistencia con JPA 29:16

* 02 Introducción a la persistencia 04:49
* 03 Java persistence API 04:09
* 04 Instalación del software 05:36
* 05 Creación de una capa de persistencia con JPA parte 1 03:47
* 06 Creación de una capa de persistencia con JPA parte 2 10:14
* Autoevaluación I 00:41

## 02 Introducción a la persistencia 04:49

<img src="images/2-01.png">

En esta primera lección del curso de persistencia con JPA voy a explicarte lo que es una capa de persistencia y qué beneficios nos va a aportar en la creación de aplicaciones.

<img src="images/2-02.png">

En primer lugar nos preguntamos qué es exactamente una capa de persistencia, pues es una capa que aparecería entre lo que es la lógica de negocio de una aplicación, la lógica aplicación, las instrucciones de acceso a datos etcétera y la propia base de datos.

La idea es que a través de la capa de persistencia los datos de la base de datos, las filas, columnas, las tablas en definitiva, se expongan a la aplicación en forma de objetos, de manera que el programador cuando quiera programar instrucciones para acceder a datos, no tenga que cambiar de mentalidad y pasar del mundo de los objetos al mundo relacional, al mundo de las tablas con sus filas y columnas sino que directamente los datos se han expuesto como objetos y pueda hacer las operaciones de manipulación de datos contra objetos, no contra lo que sería la base de datos relacional.

<img src="images/2-03.png">

El principal componente de una capa de persistencia es la *Entidad*, esos objetos que se exponen en la capa de persistencia y que realmente representan como se ve en la imagen, filas de una tabla de la base de datos, se les conoce como entidades, a la hora de definirlos los definiremos mediante clases tipo Java Bean estándares, es decir con sus atributos para almacenar cada una de las columnas, de la fila que representan en esa tabla y con sus métodos setter y getter para poder acceder a ellos.

Entonces las operaciones sobre la capa de persistencia que realizará la lógica de negocio consistirá no en mandar instrucciones SQL la base de datos, sino en crear objetos entidades, modificar entidades, eliminar entidades, recuperar entidades, siempre trabajando con este tipo de objetos. 

<img src="images/2-04.png">

Para trabajar con una capa de persistencia existen los llamados Frameworks de Persistencia, que no son más que utilidades creadas por terceros que nos facilitan tanto la creación de la capa de persistencia, como su posterior manipulación desde una lógica de negocio en una aplicación. 

Entre los Frameworks de persistencia más populares tenemos por ejemplo Hibernate e IBatis y el que nos ocupa en este curso que es JPA y que como vamos a ver más adelante pues no es exactamente un Frameworks sino más bien una especificación. 

Y qué nos ofrece esos Frameworks de persistencia, en primer lugar nos van a ofrecer un motor de persistencia que es un software ya creado, de librerías Java que se encargan de todo lo que es lo que llamamos el mapeo ORM, es decir los datos en las entidades realmente representan filas reales de una tabla una base de datos, quien se encarga de sincronizar esto, el motor de persistencia, cuando nosotros añadamos o modifiquemos entidades esas instrucciones se reflejarán en la base de datos a través del motor de persistencia que se encargará de todas las operaciones JDBC contra dicha tabla de la base de datos.

Además se nos proporciona un sistema de configuración para indicarle al motor de persistencia cómo tiene que trabajar y eso ya depende de cada tipo de Frameworks si es basado en XML, en anotaciones y por supuesto un API es decir el modelo, la lógica de negocio ya no va a utilizar JDBC para acceder a la base de datos porque no va a acceder directamente a la base de datos, va a acceder a la capa de persistencia y eso implica utilizar un conjunto de clases e interfaces específicos para manipular esas entidades y que como ya verás a lo largo del curso mucho más sencillo que el clásico JDBC con sus instrucciones SQL.

<img src="images/2-05.png">

En nuestro caso este curso lo vamos a centrar en JPA Java Persistence API, que es una especificación de Java EE para la configuración y gestión de una capa de persistencia.

La idea es que a diferencia de otros Framework que son muy específicos, es decir por ejemplo Hibernate pues todo lo que proporciona es para trabajar con Hibernate, pues JPA pretende ser universal, es decir pretende ser compatible con otros Framework existentes de manera que por ejemplo, nosotros podríamos tener un motor Hibernate o motor iBatis y trabajar con el mismo API el mismo API JPA cuya idea es que sea compatible con los diferentes Framework de persistencia existentes.

Es un API estandarizado, ya digo forma parte de Java Enterprise Edition y nos va a proporcionar ese acceso estandarizado a la capa de persistencia, independientemente del motor que nosotros queramos utilizar después.

Ya en posteriores lecciones vamos a ir profundizando en cómo se crea la capa de persistencia y cómo utilizar este API dentro de nuestras aplicaciones.

## 03 Java persistence API 04:09

<img src="images/2-3-01.png">

Bien pues en este curso por tanto vamos a abordar el estudio de la persistencia a través de la especificación Java Persistence API de Oracle.

<img src="images/2-3-02.png">

Java Persistence API como decíamos es una especificación que forma parte del Java Enterprise Edition para la creación, configuración y gestión de una capa de persistencia, es decir a través de esta especificación nosotros vamos a poder crear la capa de persistencia y también vamos a poder acceder a ella desde la lógica de negocio de la aplicación utilizando el API y el sistema de configuración universal que proporciona dicha especificación JPA.

Y qué es eso de que proporciona una API un sistema de configuración universal, que vamos a poder utilizar JPA es decir la misma manera de configurar la capa y el mismo juego de clases interfaces para atacar dicha capa, lo vamos a poder utilizar con diferentes proveedores o motores de persistencia existentes y que sean compatibles con JPA, como por ejemplo Hibernate que es uno de los más utilizados Toplink, IBatis etc..

<img src="images/2-3-03.png">

Qué es lo que nos proporciona exactamente la especificación JPA a los programadores para poder construir esa capa de persistencia y acceder a ella desde la lógica de negocio.

Pues en primer lugar podríamos resumirlo en tres componentes.

* En primer lugar el archivo de configuración `persistence.xml`. 

   * Un archivo de configuración `persistence.xml` organiza la información de configuración en lo que se conoce como unidades de persistencia.
   * Dentro de cada nivel de cada unidad de persistencia, lo que se va a indicar es por un lado que motor o que   proveedor de persistencia estamos utilizando para acceder a los datos. Las propiedades de conexión a la base de datos para que ese motor conecte con la base de datos, no olvidemos que al final, el objetivo de la capa de persistencia es exponer los datos como objeto, pero claro ese flujo de información entre los objetos y la base de datos tiene que realizarlo alguien, el motor de persistencia.
   
   Dentro de la Unidad de persistencia viven las etiquetas que se utilizan, se define *el proveedor* motor de persistencia que vamos a utilizar, una serie de propiedades donde le damos los datos de conexión y alguna propiedad específica que pueda necesitar algún proveedor en concreto. Se indica también la lista de entidades que se van a utilizar en esta capa de persistencia dentro de dicha unidad y esto nos permite además el organizarlo así en unidades de persistencia, que una aplicación, una capa persistente puede trabajar por ejemplo con distintas bases de datos. Cada base de datos podría tener su propio proveedor, sus propios datos de conexión, sería una unidad de persistencia, la información de cada base de datos. 
   
* Bien pues no es esa toda la configuración que hay que proporcionar cuando se está creando una capa de persistencia, además del `persistence.xml`, son las *Entidades*, que son las clases que representan los objetos con los datos de la base de datos, tienen que incluir una serie de anotaciones como luego iremos viendo en posteriores elecciones, pero bueno resumiendo por ejemplo `@Entity`, `@Table`, `@Id`, etc.

* Y por último quizá el elemento principal el API JPA. Es precisamente el conjunto de clases e interfaces que vamos a utilizar desde la lógica de negocio para poder acceder a las entidades y hacer las operaciones clásicas de añadir, eliminar, modificar, recuperar, etc.

   Es conocido como API JPA que se utilizará como digo desde la lógica de negocio para acceder a las entidades que han sido configuradas a través de estas anotaciones `@Entity`, `@Table`, `@Id` y cuya información de configuración de gestión de esa capa se encuentra en el `persistence.xml`.
   
En la siguiente lección vamos a ver todos los componentes, los paquetes software que necesitamos para poder trabajar con persistencia con JPA y ya vamos a ir profundizando tanto en la creación de una capa de persistencia, como en su utilización desde las aplicaciones.

## 04 Instalación del software 05:36

<img src="images/3-01.png">

En esta elección vamos a ver los elementos software que necesitamos para poder trabajar con JPA tanto creación de capa de persistencia como su utilización desde las aplicaciones.

<img src="images/3-02.png">

Aquí tenemos resumidos los tres bloques de programas que necesitamos, en primer lugar el Java Development Kit que es el kit de desarrollo Java. Cualquier aplicación JPA está basada en Java y por lo tanto vamos a necesitar este paquete básico un entorno de desarrollo que nos facilite la creación de los programas y por supuesto la base de datos con la que vamos a trabajar. Al hablar de persistencia lógicamente estamos necesitamos una base de datos en la que se almacene dicha información además de un Reimer que va a ser el intermediario que utilice las aplicaciones para poder acceder a la base de datos.

<img src="images/3-03.png">

Java Development Kit, como decíamos JDK es el kit básico que nos proporciona Oracle para trabajar con Java y además de la máquina virtual Java, incluye la librería Java estándar, por supuesto herramientas para compilar y ejecutar programas que se usan desde la línea de comandos, pero para eso utilizaremos después de instalar el JDK un entorno de desarrollo que facilitará el uso de estas herramientas y no tengamos que bajar la línea de comandos para manejarlas. En esta dirección vamos a poder descargar el JDK última versión. 

<img src="images/3-04.png">

Como decía con el JDK tenemos la base pero no lo vamos a manejar directamente nosotros, necesitamos un entorno de desarrollo que lo maneje por nosotros y nos facilite la tarea de creación de los programas compilación pruebas entre los más utilizados tenemos NetBeans y Eclipse ambos de libre distribución, pero como digo no son los únicos, en este curso vamos a centrarnos en Eclipse que es el más utilizado por la comunidad de desarrolladores Java.

<img src="images/3-06.png">

También vamos a necesitar una base de datos y en este curso vamos a utilizar MySQL. Todo lo que vamos a estudiar sería aplicable a cualquier base de datos, pero vamos a utilizar MySQL por su sencillez y su potencia, no solamente sencillos sino también la potencia, va a ser muy sencillo crear bases de datos con MySQL, poblarlas, inspeccionarlas, etc..

Las herramientas para trabajar con mayor SQL en el caso de Windows las encontramos en esta dirección donde podrás encontrar el motor de base de datos y luego alguna herramienta gráfica como Workbeanch que nos facilite la creación y la utilización de dichas bases de datos.

Para otros sistemas operativos esta la dirección y también la web de MySQL concretamente en esta dirección podríamos descargarnos el Driver para manejar la base de datos en el código.

<img src="images/3-07.png">

A continuación podéis ver las direcciones que indicábamos antes en la presentación.

Aquí tenemos en primer lugar la dirección de descarga del JDK que sería pulsando este botón que tienes aquí y el proceso de instalación es muy sencillo sería siguiendo todos los pasos hasta el final.

<img src="images/3-08.png">

Después nos iríamos a otra dirección para la descarga de Eclipse. En esta dirección puedes encontrar muchos packs de instalación para descargar e instalar Eclipse. Yo recomiendo el Eclipse de Java developers puesto que es el más completo, incluye todo lo necesario para construir aplicaciones web que es donde vamos a utilizar fundamentalmente la persistencia.

<img src="images/3-09.png">

A continuación tenemos la dirección de descarga de MySQL, por un lado podríamos descargar el servidor de MySQL de base de datos y el Workbeanch que es una herramienta gráfica para manejar la base de datos.

<img src="images/3-10.png">

En esta última dirección es donde tendríamos la descarga de el driver de MySQL tienes la última versión que sería 5.1.42. Sobre la descarga e instalación de MySQL si tienes algún problema a la hora de descargar estas versiones de servidor, Workbeanch yo te voy a proporcionar también un conjunto de archivos bueno por un lado aquí tenemos estos tres archivos que vienen ya te digo te lo voy a proporcionar dentro de lo que es el material adicional viene todo comprimido dentro de un archivo y tendrías estos tres.

<img src="images/3-11.png">

Por un lado tenemos el driver, te lo puedes descargar también, pero te lo incluido si no quieres descargar y con esto hay que hacer nada simplemente se utilizará cuando se nos vaya pidiendo las lecciones que va a seguir estudiando más adelante a lo largo del curso, fundamentalmente para la configuración del motor de persistencia que es el que utiliza el driver para acceder a la base de datos, pero ya te digo con esto no hay que hacer nada simplemente lo tienes.

Los otros dos archivos corresponden a los programas de instalación de MySQL por un lado teníamos SQL Essential que es para instalar el servidor de base de datos y el GUI que se instala posteriormente y que es una herramienta gráfica para manejar de forma sencilla el motor de base de datos y crear bases de datos de forma gráfica e inspeccionar las configurarlas etc. Son un poquito más antiguos de los problemas que tenemos en la página oficial, pero bueno son perfectamente válidos para lo que vamos a ver en el curso y de hecho son los que yo voy a utilizar en esta versión de MySQL, es la que voy a utilizar en los ejercicios que voy a seguir viendo a lo largo de todas las lecciones que te voy a ir presentando.

Esto te lo voy a proporcionar como digo dentro material adicional y son también de libre distribución, los podrías encontrar en Google escribiendo su nombre directamente en Google los encontrarías y también los puedes descargar pero en cualquier caso te lo voy a proporcionar.

## 05 Creación de una capa de persistencia con JPA parte 1 03:47

<img src="images/5-01.png">

En esta lección vamos a crear nuestra primera capa de persistencia con JPA y vamos a indicar el proceso que tenemos que seguir para ello.

<img src="images/5-02.png">

Básicamente son dos pasos que tendremos que hacer para crear una capa de persistencia:

1. Es crear y configurar las entidades, esa configuración se realiza a través de unas anotaciones que ahora comentaremos.

2. Y en segundo lugar configurar el archivo `persistence.xml`, en el que se debe indicar dentro de la Unidad de persistencia correspondiente:

   * Qué proveedor de persistencia vamos a utilizar, un motor de persistencia.
   * La lista de entidades que van a formar parte de esa unidad de persistencia 
   * Y por supuesto las propiedades de conexión a la base de datos que necesitará dicho proveedor.
   
<img src="images/5-03.png">

La base de datos con la que vamos a trabajar es una base datos MySQL.
La base de datos se llamara `agenda` la tabla sobre la que vamos a trabajar se llama `contactos`.

Uno de los archivos adicionales de contenido material adicional te explica el proceso para instalar MySQL y para crear esta base de datos con la que vamos a trabajar ahora.

Una vez creado el esquema agenda hay que meter el password para el usuario root con el siguiente comando:

`ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';`

El Script completo de la Base de Datos `agenda` es:

```sql
-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema agenda
--

CREATE DATABASE IF NOT EXISTS agenda;
USE agenda;

--
-- Definition of table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
CREATE TABLE `contactos` (
  `idContacto` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`idContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactos`
--

/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` (`idContacto`,`nombre`,`email`,`telefono`) VALUES 
 (19,'jsf3','rfre',9),
 (31,'contacto de prueba','prueba@Contacto.com',999999),
 (33,'mi contacto','mycontact@gmail.com',555);
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idUsuario` int(10) unsigned NOT NULL auto_increment,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`idUsuario`,`usuario`,`password`) VALUES 
 (1,'test1','test1'),
 (2,'test2','test2'),
 (3,'test3','test3');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

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

La tabla tiene cuatro campos:

* `idContacto` Integer Auto Unsigned
* `nombre` Varchar(45)
* `email` Varchar(45)
* `telefono` Integer Unsigned

<img src="images/5-04.png">

Una vez que lleguemos al primer paso, creación de la entidad, la entidad como tal va a ser una clase tipo Java Bean como las que podemos utilizar para encapsular cualquier conjunto de datos en Java, tendrá sus atributos que corresponderán con los diferentes campos de las columnas de la base de datos cuya información va a almacenar. Recordemos que la entidad los objetos de la entidad, lo que van a almacenar es el contenido de una fila básicamente. Los métodos setter y getter para acceder a dichos campos. Encontraremos unas anotaciones a nivel de clase y a nivel de atributo, que indicarán cierta información al motor de persistencia relativo a esta entidad.

<img src="images/5-05.png">

Entre las más interesantes, las más importantes por ejemplo `@Entity` indicará que se trata de una clase de Entidad, esta anotación se utiliza delante de la clase `@Table`  que mapea la entidad con la tabla de la base datos a la que va asociada. Y ya a nivel de atributo por ejemplo, `@Id` que va delante del atributo que hace de clave primaria, toda entidad tiene que tener una clave primaria que le permita al motor de persistencia identificar cada objeto de la capa de persistencia, de la unidad de persistencia e identificar en este caso unos contactos de otros a través del atributo `idContacto` y `@GeneratedValue` que es la estrategia de generación de esta clave primaria, en este caso se trata de un campo identidad autogenerados.

Una anotación que no aparece en el ejemplo, en este listado es `@Column` que sería una anotación que habría que indicar delante de cada columna, de cada atributo, para indicar el nombre de la columna de la base de datos con la que está asociada, obviamente de la tabla contactos, como los atributos coinciden con los nombres de las columnas no es necesario utilizarlos sino coincidieran habría que utilizar la anotación `@Column` delante de cada atributo para indicar exactamente a qué columna está asociado dicho atributo.

<img src="images/5-06.png">

`persistence.xml` al final deberán quedar, segunda parte del proceso, algo parecido a la imagen, donde indicaremos la unidad de persistencia, dentro de ella el proveedor que se va a utilizar, la clase de la lista de clase de entidades y como vemos las propiedades de conexión a la base de datos.

Vamos a ver cómo generar todo esto con un ejemplo concreto.

## 06 Creación de una capa de persistencia con JPA parte 2 10:14

El ejercicio que vamos a desarrollar será una aplicación de consola donde vamos a crear una capa de persistencia para posteriormente en la siguiente elección empezar a utilizar la API JPA para acceder a ella.

Para ello vamos a utilizar el entorno de desarrollo Eclipse que instalamos en la elección anterior y nos vamos a situar dentro de la perspectiva Java, si aparece otra perspectiva por defecto atrás de este botoncito elegiremos la perspectiva Java que es la más adecuada para este tipo de proyecto.

Una vez estemos en perspectiva Java, vamos a crear nuestro proyecto con la opción File - New - Java Project.

<img src="images/6-01.png">

<img src="images/6-02.png">

<img src="images/6-03.png">

Le vamos a poner de nombre `615-01_ejemplo_jpa`, con el JDK que hemos instalado también previamente a la instalación de Eclipse y aquí directamente vamos a finalizar. Nos crea la siguiente estructura de proeyecto.

<img src="images/6-04.png">

A partir de ahora vamos a crear ya la *Capa de Persistencia*, lo primero es preparar el proyecto para que disponga de alguna de las plantillas y opciones de menú propios de JPA, donde lo que vamos a hacer es a través del botón derecho nos vamos a ir a las propiedades del proyecto

<img src="images/6-05.png">

y en `Project Facets` aparecerán o deberían aparecer una lista de propiedades, de características que queramos añadir a nuestro proyecto.

<img src="images/6-06.png">

Como es un proyecto Java estándar no suelen aparecer por defecto esas características hay que pulsar en el enlace `Convert to faceted from...`

<img src="images/6-07.png">

Para que ahora ya aparezcan una serie de características, como digo que hará que Eclipse incorpore nuevos menus, librerías, etc.

<img src="images/6-08.png">

En nuestro caso vamos a activar la opción JPA, al activar la opción JPA aparece este enlace `Futher configuration available...`, antes de darle OK, vamos a pulsar en este enlace para habilitar unas propiedades de JPA

<img src="images/6-09.png">

Que concretamente van a consistir en indicarle Eclipse qué motor vamos a utilizar, si no es un motor que lo incorpore el propio Elipse. En Platform Generic 2.2 que es la especificación de JPA actual y donde dice Type simplemente deshabilitaríamos configuración de librería, para luego posteriormente añadirla nosotros manualmente, pero resulta que Eclipse incorpora ya un motor, una librería de motor de proveedor de persistencia que es el EclipseLink muy parecido a TopLink de Oracle. Entonces vamos a elegir la opción `User Library` y si no nos aparece aquí ninguna librería ya marcada es porque aún no la ha descargado, le damos a este botoncito el disco.

<img src="images/6-10.png">

Y aparece las posibles librerías a descargar 

<img src="images/6-11.png">

elegiríamos Eclipse Linh 2.5.2

<img src="images/6-12.png">

El paso siguiente aceptaríamos la licencia 

<img src="images/6-13.png">

y procedería a descargar dicha librería que ya la tendríamos disponible para el resto del proyecto en el workspace, una vez que ya la tengamos descargada pulsamos OK.

<img src="images/6-14.png">

Aquí también pulsamos OK. 

<img src="images/6-15.png">

y como veremos en la lista de librerías aquí la tenemos. 

<img src="images/6-16.png">

EclipseLink todas las librerías del motor de persistencia Eclipse.

<img src="images/6-17.png">

Además ya se ha creado también, lo podemos ver aquí el archivo `persistence.xml`

<img src="images/6-18.png">

<img src="images/6-19.png">

Esto simplemente es una plantilla, está preparado para empezar el proceso de creación de las entidades y en segundo lugar la creación del archivo `persistence.xml` que ya está creado, pero si su configuración.

Vamos con la creación de las entidades, con el botón derecho sobre la raíz del proyecto, nos vamos a la acción JPA Tools - Generates Entities from Tables..., generar entidades desde tablas,

<img src="images/6-20.png">

Aquí nos aparecerá una lista de posibles conexiones con base datos ya creadas por este asistente, por que este asistente cada vez que queramos generar entidades habrá que, al propio asistente darle unos datos de conexión con la base de datos de la que quiere sacar las entidades.

<img src="images/6-21.png">

Y si ya hemos conectado alguna vez con la base de datos de MySQL, aparecen en el combo algunas conexiones creadas.

Pero si es la primera vez entonces habrá que presionar en el botón `Add conections...` para crear una conexión contra MySQL.

<img src="images/6-22.png">

Debemos indicar un nombre a la conexión por ejemplo `msql_prueba`.

<img src="images/6-23.png">

En el paso siguiente ya nos van a pedir los datos de conexión a la base de datos

<img src="images/6-24.png">

para que este asistente como digo pueda conectar con ella y extraer la información para generar las entidades, en primer lugar debemos indicar el driver de MySQL que queremos utilizar, le damos el boton `New Driver Definition` aquí elegimos la opción más MySQL 5.1, le damos el nombre `driver_para_mysql` un nombre propio interno del asistente

<img src="images/6-25.png">

y eso sí en Jar list aparece un nombre de archivo que realmente no existe,

<img src="images/6-26.png">

tenemos que eliminar con `Remove Jar/zip` y aquí lo que debemos incluir es la localización del archivo jar de nuestro driver que va a utilizar el asistente para conectarse con la base de datos, en la lección anterior como recuerdas tuvimos que descargar un Driver que vamos a añadir con `Add Jar/zip` lo localizamos, la carpeta donde lo tengamos, porque no había que instalar nada con ese archivo, simplemente había que descargarlo y guardarlo en algún sitio, pues lo localizamos y ya lo tenemos pulsamos OK.

<img src="images/6-27.png">

<img src="images/6-28.png">

y ahora rellenamos los datos de conexión a la base de datos con nuestra base de datos se llama `agenda`, también indicaremos el URL para la base de datos agenda y los datos los credenciales usuario `root` y también la contraseña `root`.

<img src="images/6-29.png">

Podemos hacer un test de conexión para probar que efectivamente conecta con la base de datos.

<img src="images/6-30.png">

En el siguiente paso simplemente es un resumen 

<img src="images/6-31.png">

y finalizamos y ahora se habrá localizado ya, efectivamente ahí el esquema aparecerá la base de datos agenda.

<img src="images/6-32.png">

la lista de tablas que la conforman.

<img src="images/6-33.png">

En nuestro caso sólo nos interesa la tabla contactos que es la única que tenemos, la tabla usuarios no se va a usar en este ejercicio.

<img src="images/6-34.png">

En el siguiente paso, que asociaciones entre tablas existen si solo hay una tabla no tienen sentido hablar de asociaciones así que nada. 

<img src="images/6-35.png">

Siguiente.

<img src="images/6-36.png">

Y aquí nos va a preguntar sobre la Primery Key, va a ser o no autogenerada, si no fuera autogenerada dejaríamos `none` en nuestro caso sí que lo es lo pondremos `identity`, el tipo de identidad que sea la opción que elegiremos.

Esto se queda por defecto, indicaremos el nombre del paquete donde queremos guardar esa clase entidad `entidades`.

<img src="images/6-37.png">

En el siguiente paso nos va a dar un resumen de cómo se va a llamar la clase.

<img src="images/6-38.png">

Normalmente suele llamarse igual que la tabla pero en singular y con la primera letra mayúscula, en cualquier caso a través de la anotación `@Table` se asocia esta clase, con esta tabla y ya está finalizamos.

<img src="images/6-39.png">

y ahora veremos aquí nuestra entidad contacto ya creada, el código generado es el siguiente:


*`Contacto`*

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

Como vemos la anotación `@Entity` y `@Table(name="contactos")` que veíamos en la transparencia anterior asociada con el nombre de la tabla y `@Column` no aparece porque como ya te decía las nombres de los atributos de los campos coinciden con los nombres de las columnas de la tabla.

<img src="images/6-40.png">

Aquí aparece también una anotación `@NamedQuery(name="Contacto.findAll", query="SELECT c FROM Contacto c")` que introduce automáticamente el asistente pero en este caso no vamos a utilizarla para nada, ni sería necesario que estuviera ahí, ya hablaremos de las NamedQuery en la lección dedicada a las consultas.

La entidad ya está ahora falta rellenar los datos del `persistence.xml` 

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-01_ejemplo_jpa">
		<class>entidades.Contacto</class>
	</persistence-unit>
</persistence>
```

La unidad de persistencia se ha creado con un nombre por defecto `name="615-01_ejemplo_jpa"` y la lista de entidades 

`<class>entidades.Contacto</class>`

al crear la entidad ya la a añadir aquí, que forman esa unidad de persistencia.

Faltaría por indicar el Provider, el Provider es el nombre del proveedor utilizado. Bueno este dato no es necesario puesto que al utilizar Eclipse Link que es el que trae Eclipse, el Provider ya viene predeterminado entonces lo obtiene directamente de las librerías. En cualquier caso podríamos asociable el nombre de nombres asociados a proveedores el que tenemos en la transparencia de `persistence.xml`.

`<provider>org.eclipse.persistence.jpa.PersistenceProvider</provider>`

en la presentación que te enseñe antes aquí lo ves, es el proveedor predeterminado y si no se indica nombre pues este es el que va a buscar, así que en este caso como no es necesario no lo vamos a utilizar, no lo vamos a indicar pero podríamos indicar ese nombre a Eclipse.

Y lo que sí que falta son los datos de conexión a la base de datos pero en vez de incluirlos aquí manualmente podemos hacer lo siguiente, cuando vamos al archivo vamos a abrir ese archivo `persistence.xml` con Open With con el editor Persistence XML Editor, que nos permite abrirlo para verlo de una forma más amigable a través de esta serie de pestañas (es lo mismo que pulsar en la pestaña General)

<img src="images/6-41.png">

Y si nos vamos a la pestaña Connection pues aquí tendríamos que indicar los datos de conexión a la base de datos.

<img src="images/6-42.png">

Lo primero es que la manera en que vamos a conectar con la base de datos va a ser con conexiones directas, eso implica elegir en Transaction type: Resource local. 

<img src="images/6-43.png">

La otra opción JTA es cuando vamos a utilizar lo que se conoce como un data show que ya lo veremos en los casos en los que utilicemos persistencia dentro de un contexto en una aplicación, ahí veremos cómo utilizar un data pero en este caso son conexiones directas, por lo tanto hay que elegir la opción versión local y en vez de incluir los datos aquí como digo manualmente le vamos a decir que los tenga de una de las conexiones que hemos creamos anteriormente con el asistente y que ya están ahí todos los datos, usamos `Populate fom connection...` 

<img src="images/6-44.png">

ya se presenta toda la información y con esto ya tendrían la información suficiente del proveedor para conectar con la base de datos.

<img src="images/6-45.png">

En la pestaña Source vemos cómo quedaría la lista de propiedades

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-01_ejemplo_jpa" transaction-type="RESOURCE_LOCAL">
		<class>entidades.Contacto</class>
		<properties>
			<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/agenda"/>
			<property name="javax.persistence.jdbc.user" value="root"/>
			<property name="javax.persistence.jdbc.password" value="root"/>
			<property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
		</properties>
	</persistence-unit>
</persistence>
```

Cada propiedad con su nombre y su valor correspondiente.

Esto es la capa de persistencia, a partir de ahí ya podríamos empezar a utilizarla desde una aplicación a través de JPA, cosa que veremos en posteriores elecciones.

### :computer: Código Completo - 615-01_ejemplo_jpa

<img src="images/6-47.png">

<img src="images/6-46.png">

*`persistence.xml`*

```html
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.2" xmlns="http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
	<persistence-unit name="615-01_ejemplo_jpa" transaction-type="RESOURCE_LOCAL">
		<class>entidades.Contacto</class>
		<properties>
			<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/agenda"/>
			<property name="javax.persistence.jdbc.user" value="root"/>
			<property name="javax.persistence.jdbc.password" value="root"/>
			<property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
		</properties>
	</persistence-unit>
</persistence>
```

*`Contacto.java`*

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

## Autoevaluación I 00:41

Autoevaluación I

1. Una capa de persistencia:
   * Requiere del uso de JDBC para acceder a los datos
   * Expone los registros de la base de datos en forma de objetos :+1:
   * Requiere el uso de un navegador compatible
   * Se gestiona desde la vista de una aplicación
 

2. Indica cuál de las siguientes tecnologías corresponde a un Framework de persistencia
   * EJB
   * JSF
   * Hibernate :+1:
   * Spring

3. Una entidad es
   * Un API de persistencia
   * Un archivo de configuración XML
   * Un framework de persistencia
   * Una clase :+1:

4. ¿Dónde se configuran los datos de conexión a la base de datos en JPA?
   * A través de anotaciones
   * En el archivo de configuración persistence.xml :+1:
   * A través del API JPA
   * En ficheros de texto .cfg

5. La anotación `@Id` de JPA se utiliza para
   * Indicar la primary key de una entidad :+1:
   * Indicar que la clase es una entidad
   * Indicar la tabla a la que se asocia una entidad
   * Indicar el valor predeterminado de un atributo
 

SOLUCIONES:

1.- B

2.- C

3.- D

4.- B

5.- A
