# Conexión a MySQL usando el controlador JDBC

En este tutorial, aprenderá cómo conectarse a la base de datos **MySQL** utilizando el objeto **`Connection`** de JDBC.

Para conectarse a la base de datos **MySQL** desde un programa Java, debe realizar los siguientes pasos:

1. Cargue **MySQL Connector/J** en su programa.
2. Cree un nuevo objeto **`Connection`** de la clase **`DriverManager`**. Luego puede usar este objeto **`Connection`** para ejecutar consultas.


## Cargando MySQL Connector/J en su programa

Para cargar **MySQL Connector/J** en su programa, siga los tres pasos a continuación:

Primero, en **NetBeans IDE**, desde el nombre del proyecto, haga clic con el botón derecho del mouse y elija el elemento del menú **properties**. Aparecerá el cuadro de diálogo de propiedades del proyecto.

![image](https://user-images.githubusercontent.com/23094588/221357311-9e27a92a-e72a-476b-82ad-85701bf228aa.png)

En segundo lugar, en el lado izquierdo del cuadro de diálogo de propiedades del proyecto, en la sección Categorías, elija el elemento **Libraries**.

![image](https://user-images.githubusercontent.com/23094588/221357353-b798bc64-68cb-462e-9c47-400ca7a7a9cd.png)

En tercer lugar, haga clic en el botón **Add JAR folder**, busque la ubicación donde instaló **MySQL Connector/J** y elija el archivo **JAR** como se muestra a continuación; después de eso, haga clic en el botón **OK**.

![image](https://user-images.githubusercontent.com/23094588/221357428-a980026e-ce46-4bf3-8ebf-7b22f30905e1.png)

![image](https://user-images.githubusercontent.com/23094588/221357465-091ec9c4-857a-4d8d-a83f-accf87fab5c8.png)

## Conexión a la base de datos MySQL

Primero, debe importar tres clases: **`SQLException`**, **`DriverManager`** y **`Connection`** desde el paquete **`java.sql.*`**.

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
```

En segundo lugar, llame al método **`getConnection()`** de la clase **`DriverManager`** para obtener el objeto **`Connection`**. Hay tres parámetros que debe pasar al método **`getConnection()`**:


1. **`url`**: la URL de la base de datos en el formato **`jdbc:subprotocol:subname`**. Para MySQL, utiliza **`jdbc:mysql://localhost:3306/mysqljdbc`**, es decir, se está conectando a **MySQL** con el nombre del servidor **`localhost`**, el puerto **`3006`** y la base de datos **`mysqljdbc`**.

2. **`user`**: el usuario de la base de datos que se utilizará para conectarse a MySQL.

3. **`password`**: la contraseña del usuario de la base de datos.


```java
Connection conn = null;
try {
    // db parameters
    String url       = "jdbc:mysql://localhost:3306/mysqljdbc";
    String user      = "root";
    String password  = "secret";
	
    // create a connection to the database
    conn = DriverManager.getConnection(url, user, password);
    // more processing here
    // ...	
} catch(SQLException e) {
   System.out.println(e.getMessage());
} finally {
	try{
           if(conn ! null)
             conn.close()
	}catch(SQLException ex){
           System.out.println(ex.getMessage())
	}
}
```

Al conectarse a **MySQL**, cualquier cosa podría suceder, por ejemplo, el servidor de la base de datos no está disponible, el nombre de usuario o la contraseña son incorrectos, etc. En tales casos, **JDBC** genera un archivo **`SQLException`**. Por lo tanto, cuando crea un objeto **`Connection`**, siempre debe colocarlo dentro de un bloque **`try catch`**. Además, siempre debe cerrar la conexión de la base de datos una vez que complete la interacción con la base de datos llamando al método **`close()`** del objeto **`Connection`**.

Desde **Java 7**, hay otra buena declaración llamada [try-with-resources](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html) que le permite simplificar el código anterior de la siguiente manera:


```java
// db parameters
String url       = "jdbc:mysql://localhost:3306/mysqljdbc";
String user      = "root";
String password  = "secret";

Connection conn = null;

try(conn = DriverManager.getConnection(url, user, password);) {
	// processing here
} catch(SQLException e) {
   System.out.println(e.getMessage());
}
```

Se llama automáticamente al método **`close()`** del objeto **`Connection`** una vez que finaliza el programa. Como podéis ver es más limpio y elegante. Sin embargo…

No es seguro ni flexible cuando codificas los parámetros de la base de datos dentro del código como se muestra arriba. En caso de que cambie el servidor de la base de datos o la contraseña; tienes que cambiar el código, compilarlo de nuevo, lo cual no es un buen diseño.

Para evitar codificar todos los parámetros de la base de datos en el código, puede usar un archivo de propiedades de Java para almacenarlos. En caso de cambios, solo necesita cambiarlos en el archivo de propiedades y no tiene que volver a compilar el código.

Echemos un vistazo al archivo de propiedades llamado **db.properties**:

# MySQL DB parameters

```php
# MySQL DB parameters
user=root
password=secret
url=jdbc:mysql://localhost:3306/mysqljdbc
```

Puede reescribir el código para crear un objeto **`Connection`** con parámetros de un archivo de propiedades de la siguiente manera:

```java
Connection conn = null;

try(FileInputStream f = new FileInputStream("db.properties")) {
    // load the properties file
    Properties pros = new Properties();
    pros.load(f);

    // assign db parameters
    String url       = pros.getProperty("url");
    String user      = pros.getProperty("user");
    String password  = pros.getProperty("password");
    // create a connection to the database
    conn = DriverManager.getConnection(url, user, password);
} catch(IOException e) {
   System.out.println(e.getMessage());
} finally {
    try{
        if(conn != null)
            conn.close();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
}
```

Para cada interacción con la base de datos MySQL, debe crear una nueva conexión. Tendría el mismo código para hacer esto en todos los lugares. En lugar de hacer esto, puede crear una nueva clase para gestionar la creación de conexiones:

```java
package org.mysqltutorial;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author mysqltutorial.org
 */
public class MySQLJDBCUtil {

    /**
     * Get database connection
     *
     * @return a Connection object
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        Connection conn = null;

        try (FileInputStream f = new FileInputStream("db.properties")) {

            // load the properties file
            Properties pros = new Properties();
            pros.load(f);

            // assign db parameters
            String url = pros.getProperty("url");
            String user = pros.getProperty("user");
            String password = pros.getProperty("password");
            
            // create a connection to the database
            conn = DriverManager.getConnection(url, user, password);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

}
```

En el próximo tutorial, usaremos esta clase **`MySQLJDBCUtil`** para crear una nueva conexión a MySQL de la siguiente manera:

```java
package org.mysqltutorial;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author mysqltutorial.org
 */
public class Main {

    public static void main(String[] args) {
        // create a new connection from MySQLJDBCUtil
        try (Connection conn = MySQLJDBCUtil.getConnection()) {
            
            // print out a message
            System.out.println(String.format("Connected to database %s "
                    + "successfully.", conn.getCatalog()));
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
```

En este tutorial, le mostramos paso a paso cómo conectarse a MySQL usando el objeto de conexión JDBC y usar el archivo de propiedades para almacenar parámetros de la base de datos. Al final del tutorial, desarrollamos una clase de utilidad que puede reutilizar cada vez que crea una conexión a la base de datos.
