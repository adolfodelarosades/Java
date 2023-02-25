# Consulta de datos de MySQL usando JDBC

En este tutorial, le mostraremos cómo consultar datos de **MySQL** usando **JDBC Statement** y objetos **`ResultSet`**.

Para consultar datos de **MySQL**, primero debe establecer una [conexión a MySQL](https://github.com/adolfodelarosades/Java/blob/master/temarios/211_MySQL_JDBC_Tutorial/03-Connecting-to-MySQL-Using-JDBC-Driver.md) utilizando el objeto **`Connection`**.

```java
Connection conn = DriverManager.getConnection(url,username,password);
```

Desarrollamos una clase de utilidad llamada **`MySQLJDBCUtil`** que abre una nueva conexión con los parámetros de la base de datos almacenados en un archivo de propiedades.

```java
Connection conn = MySQLJDBCUtil.getConnection()
```

Después de abrir la conexión, debe crear un objeto **`Statement`**. **JDBC** proporciona varios tipos de instrucciones, como Declaración, **`Statement`**, **`PreparedStatement`** y **`CallableStatement`**. Para consultar datos, solo necesita usar el objeto **`Statement`** de la siguiente manera:

```java
Statement stmt  = conn.createStatement();
```

Una vez que haya creado un objeto **`Statement`**, puede usarlo para ejecutar cualquier consulta **MySQL** válida como la siguiente:

```java
String sql = "SELECT first_name, last_name, email " 
           + "  FROM candidates";

ResultSet rs = stmt.executeQuery(sql)
```

Hemos llamado al método **`executeQuery()`** del objeto **`Statement`**. Este método devuelve un objeto **`ResultSet`** que contiene el resultado de la consulta **SQL**. El resultado tiene la forma de filas con columnas de datos basadas en la instrucción **`SELECT`**.

El objeto **`ResultSet`** le proporciona métodos para recorrer el resultado y leer los datos. El método **`next()`** devuelve **`true`** y pasa a la siguiente fila en el **`ResultSet`** si hay filas disponibles; de lo contrario, devuelve **`false`**. Debe llamar al método **`next()`** al menos uno antes de leer los datos porque antes de la primera llamada **`next()`**, el **`ResultSet`** se encuentra antes de la primera fila.

Para obtener los datos de la columna de la fila actual, utilice el método **`getDataType()`** donde **`DataType`** es el tipo de datos de la columna, por ejemplo, **`int`**, **`string`**, **`double`**, etc. Debe pasar el nombre de la columna o el índice de la columna al método **`getDataType()`**, por ejemplo:

```java
String s = rs.getString("column_name");
int id   = rs.getInt(1);
```

Para obtener los datos de los candidatos **`ResultSet`**, lo hace de la siguiente manera:

```java
while (rs.next()) {
   System.out.println(rs.getString("first_name") + "\t" + 
                      rs.getString("last_name")  + "\t" +
                      rs.getString("email"));
                    
}
```

Siempre debe cerrar los objetos **`ResultSet`** y **`Statement`** cuando complete el recorrido de los datos mediante la llamada del método **`close()`**.

```java
try{
   rs.close();
   stmt.close();
} catch(SQLException e) {
   System.out.println(e.getMessage());
}
```

Si usa la declaración **try-with-resource**, el método **`close()`** se llama automáticamente para que no tenga que hacerlo explícitamente. El siguiente es el ejemplo completo de consulta de datos de la tabla **`candidatestabla`** en nuestra base de datos de ejemplo .


```java
package org.mysqltutorial;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author mysqltutorial.org
 */
public class Main {
    
    public static void main(String[] args) { 
        // 
        String sql = "SELECT first_name, last_name, email " +
                     "FROM candidates";
        
        try (Connection conn = MySQLJDBCUtil.getConnection();
             Statement stmt  = conn.createStatement();
             ResultSet rs    = stmt.executeQuery(sql)) {
           
            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getString("first_name") + "\t" + 
                                   rs.getString("last_name")  + "\t" +
                                   rs.getString("email"));
                    
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
```

La salida del programa es la siguiente:

![image](https://user-images.githubusercontent.com/23094588/221359391-8f811db4-e828-46b3-b707-bae937e1cc98.png)


En este tutorial, le mostramos cómo consultar datos de MySQL usando JDBC con una declaración SQL simple.

