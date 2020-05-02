# 3. Bases de Datos 26:30

* Introducción 02:45
* Diseño de un diagrama E-R sencillo 09:35
* Generación del script SQL 06:22
* Configuración de la BD mediante JNDI 07:48

## Introducción 02:45

[JSP Tutorial](https://www.tutorialspoint.com/jsp/index.htm)

## Diseño de un diagrama E-R sencillo 09:35

En esta lección diseñaremos un diagrama Entidad-Relación que nos permitira realizar operaciones sobre la base de datos. 

Lo primero que debemos asegurarnos es que MySQL se esta ejecutando. 

En Mac debemos entrar en las **preferencias del Sistema**.

![3-preferencias](images/3-preferencias.png)

Pulsamos en el simbolo de MySQL

![3-preferencias-2](images/3-preferencias-2.png)

Y nos aseguramos de que se esta ejecutando y si no es así pulsamos el botón para levantar MySQL.

Una vez comprobado esto entramos a **Workbeanch** 

![3-workbeanch](images/3-workbeanch.png)

Vamos entrar a la conexión por defecto `Local instance 3306`, nos pedirá la contraseña que asigmas al instalar MySQL para el usuario `root` en este caso es `password`.

![3-password](images/3-password.png)

Esta conexión por default esta alojada en `127.0.0.1:3306` tiene un usuario `root` con contraseña `password` y esta asociada a una BD test. En la realidad no es aconsejable usar un usuario `root` y deberiamos tener una contraseña robusta, ademas de tener una ruta y puerto diferente por cuestiones de seguridad.

Una vez que ingresamos los datos de acceso muestra lo siguiente:

![3-workbeanch-2](images/3-workbeanch-2.png)

### Crear una Base de Datos

Para crear una nueva base de datos pulsamos sobre el icono de *Create New Schema...*

![3-new-schema](images/3-new-schema.png)

Nos pide un nombre para el nuevo esquema, introducimos `administradores` y presionamos el botón `Apply`

![3-administradores](images/3-administradores.png)

Me genera el Script para generar el nuevo esquema presionamos el botón `Apply` para aplicarlo.

![3-administradores-2](images/3-administradores-2.png)

Finalmente me indica que todo se a ejecutado correctamente.

![3-administradores-3](images/3-administradores-3.png)

Y en la lista de esquemas ya me aparece el de `administradores`.

![3-administradores-4](images/3-administradores-4.png)

### Crear la conexión con la Base de Datos

Retornamos al inicio en Workbeanch y vamos a presionar el simbolo de **+** en **MySQL Connections.

![3-workbeanch](images/3-workbeanch.png)

Nos muestra la siguiente pantalla.

![3-conexion-1](images/3-conexion-1.png)

Aquí vamos a meter los datos para nuestra nueva conexión, solo metemos `administradores` en el nombre del esquema y esquema por default. 

![3-conexion-2](images/3-conexion-2.png)

Vamos a presionar el botón `Test Connection` para probar la conexión, nos pide los accesos.

![3-conexion-3](images/3-conexion-3.png)

Y nos indica que la conexión a ido perfecta.

![3-conexion-4](images/3-conexion-4.png)

Por lo que presionamos el boton `OK` y nos aparecerá una conexión directa a `administradores`.

![3-conexion-5](images/3-conexion-5.png)

Si la presionamos entraremos directamente a la base de datos `administradores` activada para poder usarla.

![3-conexion-6](images/3-conexion-6.png)


### Crear el Diagrama Entidad-Relación de la Base de Datos

Podríamos crear la BD con Scrips SQL directamente pero lo haremos de una forma distinta creando un diagrama E-R. Vamos al inicio de Workbeanch y en la parte lateral izquierda el segundo icono nos permitira acceder a la seccion de los modelos.

![3-modelo-1](images/3-modelo-1.png)

Vamos a presionar el icono de los Modelos.

![3-modelo-2](images/3-modelo-2.png)

Tenemos un modelo llamado `sakilla_full` el cual a sido creado al instalar MySQL. Nosotros presionamos en el signo de **+** para crear nuestro modelo.

![3-modelo-3](images/3-modelo-3.png)

Vamos a dar doble click en el icono `mydb` para cambiar el nombre y poner `administradores`.

![3-modelo-4](images/3-modelo-4.png)

Ahora podemos dar doble click en `Add Diagram` y nos aparecera la interfaz para crear mi diagrama E-R. 

![3-modelo-5](images/3-modelo-5.png)

Podemos ver la BD administradores en los paneles de la izquierda donde se listan tablas, vistas y procedimientos almacenados. por ahora todo esta vacío. 

En la parte central tenemos varios botones que nos permitiran crear tablas, vistas, procedimientos almacenados, relaciones entre las tablas, podemos insertar imagenes, textos, etc. Usaremos algunos de estos botones para crear nuestro diagrama, vamos a seguir los siguientes pasos:

##### Crear tabla administrador

* Pulsar en el botón `New Table` y pulsamos en la rejilla, aparecerá una tabla.
* Editemos la tabla dandole doble click
* Podremos el nombre de `administrador` a la tabla.
* Vamos a insertar los campos:
   * `id` Con los atributos PK, NN y AI
   * `email`
   * `contrasena`
   * `nombre`
   * `estado`

![3-modelo-6](images/3-modelo-6.png)

* Salvamos nuestro diagrama pulsando el botón `Savel Model`, nospide el nombre y sitio en el que lo queremos guardar.

![3-modelo-7](images/3-modelo-7.png)

##### Crear tabla pregunta

* Pulsar en el botón `New Table` y pulsamos en la rejilla, aparecerá una tabla.
* Editemos la tabla dandole doble click
* Podremos el nombre de `pregunta` a la tabla.
* Vamos a insertar los campos:
   * `idpregunta` Con los atributos PK, NN y AI
   * `pregunta`

![3-modelo-8](images/3-modelo-8.png)

##### Crear relación entre las tablas

* Vamos a seleccionar una Relación No-Identificada (segundo botón de las relaciones)
* Damos clic en la tabla `administrador` y después en la tabla `pregunta` para que nos cree la relación.

![3-modelo-9](images/3-modelo-9.png)

Observamos que al crear la relación nos ha insertado el campo `pregunta_idpregunta` dentro de la tabla `administrador`, lo cual nos permite claramente ver la relación entre las tablas. Podemos cambiar el nombre de ese campo le pondremos simplemente `idpregunta`, podemos salvar nuestro modelo.

![3-modelo-10](images/3-modelo-10.png)

### Generación del script SQL 06:22

En esta lección crearemos el Script para generar la BD a partir del modelo creado, para lo cual nos vamos al menú *Database > Forward Engineer*

![3-script-1](images/3-script-1.png)

Al seleccionarla nos aparece:

![3-script-2](images/3-script-2.png)

Esta opción lo que hara es **crear el Script SQL y ejecutarlo sobre una conexión creada anteriormente** 

![3-script-3](images/3-script-3.png)

![3-script-4](images/3-script-4.png)

![3-script-5](images/3-script-5.png)

Finalmente nos crea el Script SQL el cual podemos salvar en un archivo o copiar.

![3-script-6](images/3-script-6.png)

Este es el Script generado:

```sql
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema administradores
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema administradores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `administradores` DEFAULT CHARACTER SET utf8 ;
USE `administradores` ;

-- -----------------------------------------------------
-- Table `administradores`.`pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administradores`.`pregunta` (
  `idpregunta` INT NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(45) NULL,
  PRIMARY KEY (`idpregunta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `administradores`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administradores`.`administrador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `contrasena` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `idpregunta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_administrador_pregunta_idx` (`idpregunta` ASC) VISIBLE,
  CONSTRAINT `fk_administrador_pregunta`
    FOREIGN KEY (`idpregunta`)
    REFERENCES `administradores`.`pregunta` (`idpregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```

Al presionar continue me resume las tareas que ha realizado

![3-script-7](images/3-script-7.png)

* Conectarse a la BD
* Ejecuta el Script SQL
* Lee cambios hechos en en el servidor
* Salva el estado de sincronización

como podemos ver todo se ha ejecutado correctamente en caso de algún posible error tenemos el botón `Show log` para ver el log y solucionar el problema.

![3-script-8](images/3-script-8.png)

Cerramos el popup.

Una vez hecho todo esto podemos regresar a la sección de conexiones y entrar a nuestra conexión **administradores**, donde podremos ver que las tablas han sido creadas en nuetra BD.

![3-table-1](images/3-table-1.png)

### Insertar datos en la tabla preguntas

Para insertar datos en una tabla lo haremos a través de sentencias `insert` de `SQL`, vamos a insertar lo siguiente:

```sql
insert into pregunta(idpregunta, pregunta) values(1, 'Nombre de la primer mascota');
insert into pregunta(idpregunta, pregunta) values(2, 'Apellido de soltera de la madre');
```

Una vez que insertemos las instrucciones las podemos ejecutar.

![3-sql-1](images/3-sql-1.png)

También podríamos guardar las el script pulsando el botón `Save script to file`

![3-sql-2](images/3-sql-2.png)

Para ver los datos insertados en la tabla podemos dar el `select` automatico que tenemos en el contexto de la tabla.

![3-sql-3](images/3-sql-3.png)

![3-sql-4](images/3-sql-4.png)

También podemos insertar directamente registros en la tabla 

![3-sql-5](images/3-sql-5.png)

Al presionar el botón `Apply` nos presenta el Script necesario para insertar el registro, presionamos nuevamente el botón `Apply`.

![3-sql-6](images/3-sql-6.png)

Nos indica que todo ha ido bien.

![3-sql-7](images/3-sql-7.png)

Y ya podemos ver la tabla con los tres registros insertados.

![3-sql-8](images/3-sql-8.png)

## Configuración de la BD mediante JNDI 07:48

En esta lección vamos a configurar la BD mediante la interfaz JNDI, es una forma sencilla y útil de conectarnos a la BD ya que nos permite dar acceso a los desarrolladores sin que estos conozcan los detalles de los datos de conexión necesarios como usuario y password para acceder a la BD.

### ¿Qué es JNDI?

[¿Qué es JNDI?](https://docs.oracle.com/javase/tutorial/jndi/index.html)

Java Naming and Directory Interface™ (JNDI) es una interfaz de programación de aplicaciones (API) que proporciona funciones de nomenclatura y directorio a aplicaciones escritas usando el lenguaje de programación Java ™. Se define para ser independiente de cualquier implementación específica del servicio de directorio. Por lo tanto, se puede acceder a una variedad de directorios nuevos, emergentes y ya implementados de una manera común.

### Como implementar JNDI en Tomcat 6

En la documentación oficial de Tomcat 6 tenemos una guía para implementar JNDI con diferentes BD.

[JNDI en Tomcat 6](https://tomcat.apache.org/tomcat-6.0-doc/jndi-datasource-examples-howto.html)

En esta guía estan todos los pasos necesarios para implementar JNDI, en esta lección nos fijaremos en los siguientes dos puntos:

![3-jndi-1](images/3-jndi-1.png)

En el **punto dos** nos indica que debemos abrir el archivo **`context.xml`** que se encuentra en el servidor y debemos insertar el código:

```html
<Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"
          maxActive="100" maxIdle="30" maxWait="10000"
          username="javauser" password="javadude" driverClassName="com.mysql.jdbc.Driver"
          url="jdbc:mysql://localhost:3306/javatest"/>
```

Este código será necesario personalizarlo para indicar con que `name` vamos a identificar nuestra conexión el `username` y   `password` para acceder, así como la localización y nombre de la BD. Vamos a cambiar el código para que quede con la información necesaria:

```html
<Resource name="jdbc/novellius" auth="Container" type="javax.sql.DataSource"
          maxActive="100" maxIdle="30" maxWait="10000"
          username="root" password="password" driverClassName="com.mysql.jdbc.Driver"
          url="jdbc:mysql://localhost:3306/administradores"/>
```

Esta parte en teoría se haría en la parte del Servidor por lo que los desarrolladores desconocerían estos detalles. Pero como estamos trabajando localmente tenemos el servidor y el proyecto en el mismo sitio por lo que nosotros tenemos que cambiar el archivo `context.xml`.

En el **punto tres** nos indica que debemos configurar nuestro descriptor `web.xml` nos pide que insertemos la referencia al recurso es decir el siguiente código:

```html
<resource-ref>
   <description>DB Connection</description>
   <res-ref-name>jdbc/TestDB</res-ref-name>
   <res-type>javax.sql.DataSource</res-type>
   <res-auth>Container</res-auth>
</resource-ref>
```

Aquí lo único que debemos personalizar es el nombre del recurso y ponerlo en el tag `<res-ref-name>` como desarrolladores es el único dato que recibiriamos y no sabríamos ni `usuario`, `password`, nombre de la BD, ubicación de la BD, etc. Para este caso el código personalizado queda así:

```html
<resource-ref>
   <description>DB Connection</description>
   <res-ref-name>jdbc/novellius</res-ref-name>
   <res-type>javax.sql.DataSource</res-type>
   <res-auth>Container</res-auth>
</resource-ref>
```

En resumen para hacer la configuración JNDI de la BD hemos modificado dos archivos `context.xml` y `web.xml` veamos el código completo de ambos archivos.

```html
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--><!-- The contents of this file will be loaded for each web application --><Context>

    <!-- Default set of monitored resources -->
    <WatchedResource>WEB-INF/web.xml</WatchedResource>
	
    <!-- Uncomment this to disable session persistence across Tomcat restarts -->
    <!--
    <Manager pathname="" />
    -->

    <!-- Uncomment this to enable Comet connection tacking (provides events
         on session expiration as well as webapp lifecycle) -->
    <!--
    <Valve className="org.apache.catalina.valves.CometConnectionManagerValve" />
    -->
    
    <Resource name="jdbc/novellius" auth="Container" type="javax.sql.DataSource"
              maxActive="100" maxIdle="30" maxWait="10000"
              username="root" password="password" driverClassName="com.mysql.jdbc.Driver"
              url="jdbc:mysql://localhost:3306/administradores"/>
</Context>
```

*context.xml*


```html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" id="WebApp_ID" version="2.5">
  <display-name>04-JSPServlet</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  <servlet>
    <description></description>
    <display-name>Servlet</display-name>
    <servlet-name>Servlet</servlet-name>
    <servlet-class>com.novellius.Servlet</servlet-class>
    <init-param>
    	<param-name>rutaJsp</param-name>
    	<param-value>/jsp/</param-value>
    </init-param>
  </servlet>
  <servlet-mapping>
    <servlet-name>Servlet</servlet-name>
    <url-pattern>//*</url-pattern>
  </servlet-mapping>
  <resource-ref>
   <description>DB Connection</description>
   <res-ref-name>jdbc/novellius</res-ref-name>
   <res-type>javax.sql.DataSource</res-type>
   <res-auth>Container</res-auth>
</resource-ref>
```

*web.xml*
