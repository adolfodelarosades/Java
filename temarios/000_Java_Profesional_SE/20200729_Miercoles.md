# 20200729 Miercoles

## Acceso a Base de Datos con JDBC

<img src="images/M2-11-01.png">

<img src="images/M2-11-02.png">

<img src="images/M2-11-03.png">

<img src="images/M2-11-04.png">

## `Statement`

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
         String sql= "INSERT INTO contactos(nombre, email, edad) values('otra prueba', 'otra@gmail.com', 40)";
         Statement st = con.createStatement();
         st.execute(sql);
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}
```

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
         String sql = "SELECT nombre FROM contactos";
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery(sql);
         while(rs.next()) {
            System.out.println(rs.getString("nombre"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
	}
}
```



