# 8. Bases de datos y Java 66m
   * 34 Conexión con una base de datos 20:27 
   * 35 Lanzar consultas y procesar resultados 28:52 
   * 36 Uso de RowSet 17:30 
   * Contenido adicional 3
   
# 34 Conexión con una base de datos 20:27 

[Conexión con una base de datos](pdfs/34_Conexión_con_una_base_de_datos.pdf)

## Resumen del Profesor

### 34.1 Introducción

Java nos provee de soporte para conectar con bases de datos relacionales. Dicho soporte lo hace a través de la tecnología JDBC (*Java DataBase Connectivity*). Java SE 8 nos ofrece la versión 4.2 (JSR 211).

JDBC es un conjunto de interfaces, es decir, un *contrato* de nuestra forma de trabajar. Posteriomente necesitaremos un *driver*, es decir, un conjunto de clases que implementen esas interfaces, para darnos conexión con un sistema gestor de base de datos concreto.

### 34.2 Drivers

JDBC nos ofrece soporte para muchos SGBD comerciales a través de sus drivers. La lista completa la podemos encontrar en http://www.oracle.com/technetwork/java/index-136695.html. En estos capítulos nosotros trabajaremos con Mysql, cuyo driver lo podemos descargar en https://dev.mysql.com/downloads/connector/j/5.1.html .

### 34.3 Interfaces principales

* `Connection`: es el que permite mantener la conexión con la base de datos.
* `Statement`, `PreparedStatement`: nos permiten ejecutar consultas.
* `ResultSet`: juego de resultados de una consulta ejecutada.

### 34.4 Conexión con la base de datos

JDBC nos ofrece dos posibilidades para conectar con una base de datos.

* Usar la clase `DriverManager`, que nos permite conectar a través de una url jdbc, y soporta varias operaciones.

* Usar el interfaz `DataSource`, que es más avanzado, y que permite ser transparente a nuestra aplicación. Es más complejo que `DriverManager`.

***NUESTRA ELECCIÓN** A lo largo de estos capitulos utilizaremos DriverManager. Aunque no es obligatorio, el uso de DataSource está orientado a proyectos Java EE. DriverManager será suficientemente potente para pequeños proyectos. Para otros más grandes, sería recomendable usar un sistema de persistencia como JPA.*

#### 34.4.1 URLs JDBC

Se trata de una cadena de texto con los datos de conexión a la base de datos. Dependerá del driver (base de datos) que vayamos a utilizar.

Por ejemplo, para conectar con Mysql, una URL tipo sería:

```java
jdbc:mysql://hostname/database
```

#### 34.4.2 Pasos para conectar, lanzar consultas y desconectar

Aunque las consultas las trabajaremos en profundidad en el siguiente capítulo, estos son los pasos tipo para conectar, lanzar consultas, procesar los resultados y desconectar.

1. Cargar el driver JDBC (< 4.0)
2. Establecer datos de conexión
3. Conectar obteniendo un objeto `Connection`.
4. Crear un objeto `Statement` y ejecutar consultas SQL
5. Los resultados se almacenan en un objeto `ResultSet`, donde se pueden consultar.
6. Cerrar los objetos (`ResultSet`, `Statement` y `Connection`).

## Transcripción

# 35 Lanzar consultas y procesar resultados 28:52 

[Lanzar consultas y procesar resultados](pdfs/35_Lanzar_consultas_y_procesar_resultados.pdf)

## Resumen del Profesor

### 35.1 Introducción

JDBC nos provee de varios objetos para lanzar consultas, y uno para poder procesar los resultados.

* `Statement`: nos permite lanzar consultas y recoger el resultado. Es la forma más básica de realizarlo.

* `PreparedStatement`: permite lanzar consultas a las que podemos asignarle los valores de los parámetros mediante métodos convenientes.

* `CallableStatement`: nos permite lanzar la ejecución de procedimientos almacenados y recoger sus resultados.

* `ResultSet`: es la clase que nos permite recoger el resultado de la ejecución de una consulta realizada con alguno de los interfaces anteriores.

### 35.2 Statement

Nos provee de método para ejecutar consultas en una base de datos relacional. Recibe la consulta como un `String`, y devuelve (generalmente) un objeto de tipo `ResultSet`.

Tiene, entre otros, 3 métodos para ejecutar consultas:

* `execute`: permite obtener más de un `ResultSet`
* `executeQuery`: permite obtener un `ResultSet`
* `executeUpdate`: Devuelve un entero que representa el número de filas afectadas. Se usa con consultas INSERT, UPDATE o DELETE

### 35.3 `ResultSet`

Se trata del objeto que nos permite recoger los resultados de una consulta `SELECT`. Tiene la estructura de un cursor, es decir, un juego de resultados y un puntero que nos permite navegar resultado resultado. Además, nos provee de métodos getXXX, por cada tipo de dato que podemos rescatar. Hay dos implementaciones por cada tipo de dato, una que recibe el índica de la columna, y otra que recibe el nombre.

Para recorrerlo de forma completa, lo normal suele ser utilizar el método `next()` con la siguiente estructura:

```java
while (rs.next()) {
   String coffeeName = rs.getString(1);
   int supplierID = rs.getInt(2);
   float price = rs.getFloat(3);
   int sales = rs.getInt(4);
   int total = rs.getInt(5);
   //…
}
```

Tiene otros métodos para navegar. Además, en algunos casos (depende de la implementación del driver), tiene la posibilidad de trabajar en modo escritura, si bien no lo recomendamos desde aquí, ya que es preferible trabajar con otros esquemas, como el uso de `PreparedStatement` y el patrón de diseño DAO.

### 35.4 PreparedStatement

Se trata de una extensión de `Statement` que nos permite asignar los tipos de dato de los parámetros y sus valores, de forma conveniente.

Con un `Statement`, si quisiéramos buscar a todos los empleados con un sueldo mayor a un valor, tendríamos que hacerlo así:

```java
float valor = 1235.34f;
String sql = "SELECT * FROM empleados WHERE SUELDO >= " + valor;
```

Frente a este esquema, que puede suponer problemas, `PreparedStatement` nos permite indicar, allí donde vamos a insertar un valor, indicar un interrogante, y darle valor después:

```java
float valor = 1235.34f;
String sql = "SELECT * FROM empleados WHERE SUELDO >= ?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setFloat(1, valor);
```

## Transcripción

# 36 Uso de RowSet 17:30 

[Uso de RowSet](pdfs/36_Uso_de_RowSet.pdf)

## Resumen del Profesor

### 36.1 Introducción

Un `RowSet` no es más que un objeto que nos permite manejar información tabular de forma mucho más rápida y eficiente que un `ResultSet`. Existen 5 tipos de referencias y 2 tipos:

* CONECTADOS
   * JdbcRowSet
   
* DESCONECTADOS
   * CachedRowSet
   * JoinRowSet
   * FilteredRowSet
   * WebRowSet.
   
### 36.2 ¿En qué se diferencian de un ResultSet?

Básicamente en que pueden funcionar como *JavaBeans*, y por ende, beneficiarse del mecanismo de notificación que tienen estos (sistema de eventos y manejadores de los mismos), así como del uso de *properties*.

Por otro lado, con los `ResultSet` podíamos tener la posibilidad de hacer scroll (libre, no solo hacia adelante) o utilizarlos en modo escritura, pero solo en algunos tipos de drivers. `RowSet` nos asegura el poder realizarlo con cualquier sistema gestor de bases de datos.

### 36.3 Creación de un RowSet

Hasta Java SE 6, teníamos diferentes mecanismos para realizarlos. Java SE 7 nos incorpora uno más *limpio*, utilizando una factoría.

```java
RowSetFactory myRowSetFactory = null;
JdbcRowSet rowSet = null;

myRowSetFactory = RowSetProvider.newFactory();
rowSet = myRowSetFactory.createJdbcRowSet();
```

La factoría nos permite crear cualquiera de las 5 interfaces que ofrece JDBC.

### 36.4 JdbcRowSet

Este tipo de `RowSet` es el único que mantiene siempre la conexión de la base de datos abierta. Esto tiene como ventaja la velocidad e inmediatez de los cambios. Como desventaja, dicho esquema de trabajo suele ser muy costoso (hablando en términos de recursos, sobre todo en el servidor de bases de datos).

Nos permite realizar operaciones como recorrer los resultados, actualizarlos, insertar nuevos, borrar, …

```java
//...

myRowSetFactory = RowSetProvider.newFactory();
rowSet = myRowSetFactory.createJdbcRowSet();

rowSet.setUrl(DBConnection.JDBC_URL);
rowSet.setUsername(DBConnection.USERNAME);
rowSet.setPassword(DBConnection.PASSWORD);

rowSet.setCommand("SELECT * FROM empleados");
rowSet.execute();

// Nos vamos al último registro de nuevo, y le subimos el sueldo un 10%
rowSet.last();
rowSet.updateFloat("sueldo", rowSet.getFloat("sueldo") * 1.1f);
rowSet.updateRow();

// Insertamos un nuevo registro
rowSet.moveToInsertRow();
rowSet.updateString("nombre", "Joaquín");
rowSet.updateString("apellidos", "Cañadas Casas");
rowSet.updateDate("fecha_nacimiento", Date.valueOf(LocalDate.of(1970, 5, 18)));
rowSet.updateFloat("sueldo", 1400.0f);
rowSet.insertRow();

//..
```

### 36.5 `CachedRowSet`

Se trata del interfaz base de todos los `RowSet` de tipo desconectado (`FilteredRowSet`, `JoinRowSet` y `WebRowSet` heredan de este interfaz). La principal diferencia es que solo abre la conexión para rellenar el `RowSet` de datos, y posteriormente, para enviar las modificaciones a la base de datos.

Al inicializarlo, tenemos que indicar que (índices de) columnas forman parte de la clave (primaria). Y para aceptar los cambios, necesitamos una conexión que tenga el modo auto-commit en `false`.

## Transcripción

## Contenido adicional 3   

[Conexión con una base de datos](pdfs/34_Conexión_con_una_base_de_datos.pdf)

[Lanzar consultas y procesar resultados](pdfs/35_Lanzar_consultas_y_procesar_resultados.pdf)

[Uso de RowSet](pdfs/36_Uso_de_RowSet.pdf)
