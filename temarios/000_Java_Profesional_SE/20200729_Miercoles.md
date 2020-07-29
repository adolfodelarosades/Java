# 20200729 Miercoles

## Acceso a Base de Datos con JDBC

<img src="images/M2-11-01.png">

<img src="images/M2-11-02.png">

<img src="images/M2-11-03.png">

<img src="images/M2-11-04.png">


## Creación de Tabla en WorkBeanch

<img src="images/20200729-02.png">

<img src="images/20200729-01.png">

<img src="images/20200729-03.png">

## Instrucciones SQL

Básicamente existen 4 instrucciones SQL que nos permiten crear lo que se le suele llamar el **CRUD**.

**C**reate: `Insert`
**R**ead: `Select`
**U**pdate: `Update`
**D**elete: `Delete`

### Instrucciones de Acción 

Son instrucciones que no devuelven resultados:

* `Insert`
* `Update`
* `Delete`

Usan la instrucción `execute` o `executeUpdate`.

### Instruccion de Consulta

Es una instrucción que devuelve registros:

* `Select`

Usan la instrucción `executeQuery`.

## Dependencia MySQL

Debemos meter la siguiente dependencia en muestro archivo `pom.xml`.

```html
<dependencies>
   <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
   <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>8.0.19</version>
   </dependency>
</dependencies>
```

## `Statement` y `execute`

### :computer: `000-062_ejemplo_bd`

*`TestJDBC`*

```java
package principal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TestJDBC {
	
   static String driver = "com.mysql.cj.jdbc.Driver";
   static String cadenaConexion = "jdbc:mysql://localhost:3306/miscontactos?serverTimezone=UTC";
   static String user= "root";
   static String password= "root";
   static {
      //cargar del driver
      try {
         Class.forName(driver);
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
   }

   public static void main(String[] args) {
      //Conexión de la base de datos.
      try(Connection con = DriverManager.getConnection(cadenaConexion, user, password)) {
         //envío de instrucciones SQL
         String sql= "INSERT INTO contactos(nombre, email, edad) values('adolfo', 'adolfo@gmail.com', 18)";
         Statement st = con.createStatement();
         st.execute(sql);
	 System.out.println("Contacto Insertado")
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}
```

<img src="images/20200729-04.png">

<img src="images/20200729-05.png">

## `Statement` y `ResultSet` 

### :computer: `000-062_ejemplo_bd`

*`TestResultados`*

```java
package principal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestResultados {

   static String driver = "com.mysql.cj.jdbc.Driver";
   static String cadenaConexion = "jdbc:mysql://localhost:3306/miscontactos?serverTimezone=UTC";
   static String user = "root";
   static String password = "root";
   static {
      // cargar del driver
      try {
	 Class.forName(driver);
      } catch (ClassNotFoundException e) {
	 e.printStackTrace();
      }
   }

   public static void main(String[] args) {

      // Conexión de la base de datos.
      try (Connection con = DriverManager.getConnection(cadenaConexion, user, password)) {
         // envío de instrucciones SQL
         String sql = "SELECT nombre, email, edad FROM contactos";
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery(sql);
         System.out.format("%-18s | %-20s | %s \n", "Nombre", "Email", "Edad");
         System.out.format("%-18s | %-20s | %-4s \n", "-".repeat(18), "-".repeat(20), "-".repeat(4));
         while(rs.next()) {
             System.out.format(new String(Character.toChars(0x1F600)) + " %-15s | %-20s | %d \n", rs.getString("nombre"), rs.getString("email"), rs.getInt("edad"));
	 }
      } catch (SQLException e) {
	 e.printStackTrace();
      }
   }
}
```

<img src="images/20200729-06.png">




