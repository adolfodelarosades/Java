# 2 Hibernate 02:40:14

* Creación de la B.D. 06:25
* Creación del Proyecto en Eclipse 04:39
* Configuración previa de Hibernate 06:20
* Mapping Hibernate mediante XML 12:29
* Uso del método **`save`** 07:47
* Uso de anotaciones JPA en Hibernate 04:01
* Creación de una consulta personalizada con HQL 02:50
* Consultando todos los registros con HQL 04:49
* Consulta de todos los registros con Criteria 06:34
* Consultas personalizadas con Criteria 04:52
* Uso de los métodos update y saveOrUpdate 09:09
* Consultas anidadas con Criteria 07:35
* Consultando campos personalizados con Tuple 04:21
* Uso de **`@OneToOne`** 09:11
* Consulta de registros con clases anotadas con **`@OneToOne`** 04:16
* Actualizaciones en clases anotadas con **`@OneToOne`** 06:36
* Actualización de la Base de Datos a V2 01:51
* Uso **`@OneToMany`** y **`@ManyToOne`** 10:13
* Creación de consultas para clases anotadas con **`@OneToMany`** 08:06
* Actualización de la B.D. a la V3 03:13
* Uso de **`@ManyToMany`** 13:19
* Creación de consultas para clases anotadas con **`@ManyToMany`** 10:49
* Actualizaciones en clases anotadas con **`@ManyToMany`** 10:49

## Creación de la B.D. 06:25

Bienvenido a nuestro curso en esta lección vamos a crear una base de datos y ésta es la que nos va a servir durante el resto de nuestras lecciones.

Te quiero mencionar que este es una versión de una base real, usando un cliente que es una constructora y creo que eso le va a traer un poco más de efectividad al curso.

Estoy en mi MySQL WorkBeanch y también debes asegurarte que el servicio de MySQL esté corriendo.

![image](https://user-images.githubusercontent.com/23094588/127280038-e5343966-dca4-4823-9684-780f56387875.png)


En modelos voy a darle click en el "+"

![image](https://user-images.githubusercontent.com/23094588/127280309-4a158637-1b56-446c-89db-465e545d1824.png)

y voy a dar doble clic donde dice **Add Diagram**

![image](https://user-images.githubusercontent.com/23094588/127280512-a053b7e3-dea3-438a-a989-610dfdb07ddb.png)

Una vez aquí vamos a cambiarle el nombre a la base de datos dando doble clic en **mydb** 

![image](https://user-images.githubusercontent.com/23094588/127280755-c59b7b90-d660-4d17-b08c-a3ed9667d1ab.png)

y le vamos a poner **test_bd**

![image](https://user-images.githubusercontent.com/23094588/127281347-f4be3977-fe9b-47a9-8c67-3c564679e5a5.png)

Y vamos a darle en **File/Save Model**

![image](https://user-images.githubusercontent.com/23094588/127281481-3a00582c-baf6-48ea-9a4d-c1f6789f12e7.png)

Nos pide salvar nuestro modelo vamos a ponerle **JavaPersistenceV1.mwb**

![image](https://user-images.githubusercontent.com/23094588/127289347-0a3c545c-a637-44c4-877d-649fb73d3ab5.png)

Ahora es momento de insertar nuestras tablas, para eso es vamos a hacer click en **Place a New Table** 

![image](https://user-images.githubusercontent.com/23094588/127289871-a32e5f4c-0294-4909-b443-cd19fae6ae56.png)

![image](https://user-images.githubusercontent.com/23094588/127296943-9664b35c-5df4-400d-a213-afa7841ca052.png)

y la primera tabla que nos pide el cliente se llama **`Tramite`**. Este es un trámite que está haciendo la persona que llega a la constructora, esto puede ser un avalúo, puede ser un crédito y muchos más.

Va a tener los siguientes campos:

* **`idTramite`**  es nuestra llave primaria por lo que no puede ser nula. (Aplicando reglas)
* **`tipoTramite`** de tipo **`VARCHAR(45)`**
* **`fhcTramite`**  de tipo **`DATETIME`**

![image](https://user-images.githubusercontent.com/23094588/127298184-aaaf1c8c-623e-4916-8800-3b4f9247f76d.png)

Salvamos.

Vamos a insertar una nueva tabla para esta primera versión, para empezar con las ***Relaciones Uno a Uno***, para esto vamos a crear otra tabla que es **`Avaluo`** que es un avalúo comercial, va a tener los siguientes campos:

* **`idAvaluo`** de tipo **`INT`** es nuestra clave primaria
* **`lugarAvaluo`** de tipo **`VARCHAR(100)`**

![image](https://user-images.githubusercontent.com/23094588/127299315-01f088ee-e7cd-470f-b6f9-cee9b6b18757.png)

Ahora vamos a crear una relación entre estas dos tablas, es decir quiero que en la tabla **`Avaluo`** aparezca el **`idTramite`** que corresponda.

Para eso vamos a dar click en la relación **1:1** 

![image](https://user-images.githubusercontent.com/23094588/127300082-aadac9eb-97dc-49bf-9305-65f50a72a286.png)

y vamos a dar click en **`Avaluo`** y arrastramos hasta **`Tramite`**

![image](https://user-images.githubusercontent.com/23094588/127300273-aa5d824b-c5a9-4109-9c89-5834957d4197.png)

![image](https://user-images.githubusercontent.com/23094588/127300479-a7beb281-73a1-4871-89fb-429e01233ea9.png)

En **`Avaluo`** ya tenemos el **`idTramite`**, claro que este puede ser nulo en base a las reglas que hemos visto, por default nos crea  **`idTramite`** como No Nulo, para modificar esto vamos a deseleccionar el check.

![image](https://user-images.githubusercontent.com/23094588/127300961-f61859cb-1a6d-42e0-9f72-39c32c706488.png)

Salvamos nuestro modelo.

Hasta aquí ya tenemos el Modelo en su versión 1, vamos a generar las tablas a partir del Modelo, para lo cual nos vamos a ir a **Database / Forward Engineer...**

![image](https://user-images.githubusercontent.com/23094588/127332265-b35bebd3-c8e8-43ce-971b-2f14b5dbb5b7.png)

![image](https://user-images.githubusercontent.com/23094588/127332349-2ba3fc1c-fb7d-45ef-ae09-ee1896393678.png)

Se nos pide una conexión, como no hemos hecho la conexión cancelamos y nos vamos a Home.

![image](https://user-images.githubusercontent.com/23094588/127332644-74573e5b-0854-4d48-8ce4-c09a30f7de51.png)

Vamos a crear una nueva Conexión punsando en el "+".

![image](https://user-images.githubusercontent.com/23094588/127332755-a98f16a5-3684-4d19-a472-7101b20c25ad.png)

Vamos a darle el nombre de **`constructora`** y dejamos los demas datos como estan.

![image](https://user-images.githubusercontent.com/23094588/127332917-c18ad228-a34f-4a85-873c-37bdcadfc9fd.png)

Podemos dar click en **Text Connection** para probar la conexión.

![image](https://user-images.githubusercontent.com/23094588/127333088-2127309a-4798-4a56-bc07-d6970976dd55.png)

Una vez que comprobamos que la conexión es correta damos en **ok** y ya vemos la nueva conexión creada **`constructora`**.

![image](https://user-images.githubusercontent.com/23094588/127333309-795fb719-7ffc-46f5-81d0-140db0feeafe.png)

![image](https://user-images.githubusercontent.com/23094588/127333860-db866e7b-abd6-44af-8c14-67fcc6be1219.png)

Vamos a darle **Continue** sucesivamente.

![image](https://user-images.githubusercontent.com/23094588/127334167-0c383017-be5c-448a-8430-590dd79753cd.png)

![image](https://user-images.githubusercontent.com/23094588/127334439-0817be37-ecc9-42e7-ae0f-bfb06337ce43.png)

![image](https://user-images.githubusercontent.com/23094588/127334482-81557df3-f8c2-46c5-8389-9b5d05629f18.png)

```sql
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema test_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test_bd` DEFAULT CHARACTER SET utf8 ;
USE `test_bd` ;

-- -----------------------------------------------------
-- Table `test_bd`.`Tramite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_bd`.`Tramite` (
  `idTramite` INT NOT NULL,
  `tipoTramite` VARCHAR(45) NULL,
  `fhcTramite` DATETIME NULL,
  PRIMARY KEY (`idTramite`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_bd`.`Avaluo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_bd`.`Avaluo` (
  `idAvaluo` INT NOT NULL,
  `lugarAvaluo` VARCHAR(100) NULL,
  `Tramite_idTramite` INT NULL,
  PRIMARY KEY (`idAvaluo`),
  INDEX `fk_Avaluo_Tramite_idx` (`Tramite_idTramite` ASC) VISIBLE,
  CONSTRAINT `fk_Avaluo_Tramite`
    FOREIGN KEY (`Tramite_idTramite`)
    REFERENCES `test_bd`.`Tramite` (`idTramite`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```

![image](https://user-images.githubusercontent.com/23094588/127334556-64f776ae-a275-4a2d-a841-76cbe77b9be5.png)

Y con esto ya se ha creado la BD, para comprobarlo nos vamos a la conexión **constructora** deberíamos asignarle el esquema por default que es **test_db**

![image](https://user-images.githubusercontent.com/23094588/127335396-6c35d94e-e8da-4d5b-8593-c51c6d36ffd0.png)
![image](https://user-images.githubusercontent.com/23094588/127335430-5fa6d0ab-664f-43f2-9759-fd96b1379730.png)

(NO FUNCIONA, no acepta el esquema por default).

Simplemente abrimos la conexión **constructora** y buscamos la BD **test_db**, la abrimos.

![image](https://user-images.githubusercontent.com/23094588/127336604-8c1e0d24-6f79-48b4-879c-d925ea813240.png)

Las tablas obviamente estan vacias.

![image](https://user-images.githubusercontent.com/23094588/127336647-44ae93fa-34ea-4481-af8b-b8bd1c6346c3.png)

![image](https://user-images.githubusercontent.com/23094588/127336707-44e6d512-a534-44d7-8eb8-289ceae5d43a.png)

## Creación del Proyecto en Eclipse 04:39

Vamos a crear nuestro proyecto Eclipse.

Entramos en el Workspace **`PROYECTOS-ECLIPSE/602_Persistencia_de_Datos_con_Java`** y vamos a crear un nuevo Proyecto Java.

![image](https://user-images.githubusercontent.com/23094588/127343393-8ca46cd2-fa6b-4d8d-9325-d8e412a9f08b.png)

![image](https://user-images.githubusercontent.com/23094588/127343477-ee6004dc-1efb-4d83-b9dd-99799af6dad0.png)

Le vamos a llamar **`JavaPersistence`** y vamos a usar Java 1.8

![image](https://user-images.githubusercontent.com/23094588/127349150-aa4f13b3-cb0b-48b0-a0de-a823e6de146a.png)

![image](https://user-images.githubusercontent.com/23094588/127350311-17bee3fa-f9da-4178-b877-edd58261212f.png)

Ahora un framework como Spring, Hibernate o cualquiera son simplemente un conjunto de clases, por lo tanto hay varias formas de importar estas librerías que vienen en forma de JARs que son archivos comprimidos y la que más usada es usar **Maiven** ya que es un repositorio bastante extenso, bastante completo y su uso es muy sencillo.

Para usar Maiven simplemente hacemo click derecho en nuestro proyecto y vamos a decirle lo siguiente:

![image](https://user-images.githubusercontent.com/23094588/127350500-0d4207cb-6618-4067-9e34-09558f0e622e.png)

![image](https://user-images.githubusercontent.com/23094588/127350612-b7414598-284e-4f62-a440-f13d202919ba.png)

Simplemente le damos **Finish**

![image](https://user-images.githubusercontent.com/23094588/127350828-e56a8118-e300-45c1-b8d2-a579a45b16ad.png)

Entre otras cosas lo que hace es agregar el archivo **`pom.xml`**, este archivo es el que nos va a servir para añadir las librerías necesarias, en este caso van a ser las de **Hibernate**.

Vamos a abrir la vista de Maven.

![image](https://user-images.githubusercontent.com/23094588/127351733-0c8a00fb-ddba-47a7-9ea8-d9699a70a341.png)

![image](https://user-images.githubusercontent.com/23094588/127351845-b0eee3f4-f3f6-4ba9-a423-fd2b00cf63dd.png)

En 

![image](https://user-images.githubusercontent.com/23094588/127351957-b0ddb3c0-7fc6-4252-ac20-0b854f526667.png)

Vamos a dar Click Derecho y seleccionamos **Rebuild Index**

![image](https://user-images.githubusercontent.com/23094588/127352162-2e39d4f1-ea4b-45af-9255-f0101b0b0412.png)

![image](https://user-images.githubusercontent.com/23094588/127352222-44e23c88-051f-40fd-a52e-36dfbe8c0440.png)

Esto es por si no hace las busquedas en los repositorios de Maven.

Ahora si vamos a darle **`Add`** y la primer dependencia que vamos a añadir es **`hibernate-core`**.

Como esto no va vamos a usar el repositorio de Maiven https://mvnrepository.com/

![image](https://user-images.githubusercontent.com/23094588/127353369-de137e45-f9f2-4293-ab56-2f135075d2c0.png)

Vamos a insertar las siguientes dependencias de **Hibernate** y **MySQL**


```xml
<dependencies>
   <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-core</artifactId>
      <version>5.2.1.Final</version>
   </dependency>
   <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-validator</artifactId>
      <version>5.2.4.Final</version>
   </dependency>
   <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-entitymanager</artifactId>
      <version>5.2.1.Final</version>
   </dependency>
   <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>5.1.39</version>
   </dependency>
</dependencies>
```

Cuando se salva el archivo **`pom.xml`** se empiezan a descargar todas las librerías necesarias para su uso, las podemos ver en **Maven Dependencies**

![image](https://user-images.githubusercontent.com/23094588/127368527-ae39a1b3-fee0-4cc1-9b0e-f1fdb7850e43.png)

## Configuración previa de Hibernate 06:20

En esta lección vamos a crear dos archivos para ***configurar la sesión de Hibernate***, hasta el momento tenemos un proyecto Java que tiene todas las dependencias, todas las librerías que vamos a estar utilizando, con el propósito de implementar el framework de persistencia de datos Hibernate.

Vamos a crear dos archivos un XML y una clase Java. Estos nos van a servir para realizar las operaciones para gestionar la base de datos.

Dentro de **`src`** vamos a crear un nuevo archivo XML, este por convención se va a llamar **`hibernate.cfg.xml`**

![image](https://user-images.githubusercontent.com/23094588/127369765-65459b6c-a847-4347-a2a7-d89ec46200cf.png)

![image](https://user-images.githubusercontent.com/23094588/127369866-ac839fdc-ac59-4e24-8c7f-88247b2531fb.png)

![image](https://user-images.githubusercontent.com/23094588/127370129-194033f7-efaa-4155-a7f6-8f084c12dbb0.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<hibernate-configuration>
   <session-factory>
      <!-- Database connection settings -->
      <property name="connection.driver_class">com.mysql.jdbc.Driver</property>
      <!-- Ubicación de la B.D. -->
      <property name="connection.url">jdbc:mysql://localhost:3306/test_bd</property>
      <!-- Usuario de la B.D. -->
      <property name="connection.username">root</property>
      <!-- Contraseña de la B.D. -->
      <property name="connection.password"></property>

      <!-- Dialecto SQL -->
      <property name="dialect">org.hibernate.dialect.MySQLDialect</property>

      <!-- Mostrar en consola operaciones SQL -->
      <property name="show_sql">true</property>

   </session-factory>
</hibernate-configuration>
```

Lo que estamos declarando en este archivo de configuración es:

* Driver de la conexión a la BD.
* Ubicación y nombre de la B.D.
* Usuario de la B.D.
* Contraseña de la B.D. (En este caso no tenemos contraseña)
* Dialecto SQL
* Mostrar en consola operaciones SQL

El siguiente paso es crear la clase Java **`HibernateUtil`** en el paquete **`com.javaocio.util`**.

![image](https://user-images.githubusercontent.com/23094588/127373764-30b1ca04-9fd8-4b2e-80b0-d4aebfdfb8cf.png)

Y el contenido es el siguiente:

```java
package com.javaocio.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	
   private static final SessionFactory sessionFactory = buildSessionFactory();
    
   private static SessionFactory buildSessionFactory() {
      try {        	
         // Para Hibernate 4.3.x 
         // Crear  SessionFactory desde hibernate.cfg.xml 
         // Configuration configuration = new Configuration().configure("hibernate.cfg.xml");     
         // return configuration.buildSessionFactory( new StandardServiceRegistryBuilder().applySettings( configuration.getProperties() ).build() );

         // Para Hibernate 5.x 
         // Crear SessionFactory desde hibernate.cfg.xml
            
         StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
         Metadata metadata = new MetadataSources(serviceRegistry).getMetadataBuilder().build();
         return metadata.getSessionFactoryBuilder().build();
            
      } catch (Throwable ex) {
         // Make sure you log the exception, as it might be swallowed
         System.err.println("*** Creación de SessionFactory falló." + ex);
         throw new ExceptionInInitializerError(ex);
      }
   }

   public static SessionFactory getSessionFactory() {
      return sessionFactory;
   }

}
```

Esta clase ***tiene la función de aplicar las configuraciones del archivo XML que creamos antes, con el propósito de crear una sesión***. Hibernate y muchos frameworks de persistencia de datos trabaja con Sesiones, esto es, abren una sesión realicen toda la gestión, todas las operaciones y pueden realizar Rollback o Commit.

Rollback es, si alguna de ellas falla se deshacen todas las anteriores y Commit es que cuando todas las operaciones tengan éxito se modifican los datos en la base de datos.

La clase tiene el código comentado por si queremos usar Hibernate 4.X

Con Hibernate 5.X tenemos que usa **`StandardServiceRegistryBuilder`** para recuperar lo definido en el archivo **`hibernate.cfg.xml`** y nos devuelve una instancia de **`StandardServiceRegistry`**, lo pasa por los Metadatos y finalmente lo que retorna es una **`SessionFactory`**. Si existe algún error se muestra el error en la Excepción.

Con estos dos archivos estamos listos para insertar nuestros primeros valores usando el framework de persistencia de datos Hibernate.

## Mapping Hibernate mediante XML 12:29

En esta clase vamos a revisar cómo implementar **ORM** un mapping entre el ámbito relacional y el ámbito Orientado a Objetos.

![image](https://user-images.githubusercontent.com/23094588/127377987-82b413fd-18e4-46f2-9380-5db03413a9f3.png)

En nuestra clase anteriores vimos que no es lo mismo decir tener un *modelo de objetos* que un *modelo relacional*. 

![image](https://user-images.githubusercontent.com/23094588/127378140-e870d55f-3215-4d54-ab26-4ceaf3c879ce.png)

porque en el *modelo orientado a objetos* tenemos que la información está en ***clases u objetos*** mientras que en el *modelo relacional* tenemos ***tablas, filas y campos***, entonces necesitamos traducir uno a otro, asociar estas clases con ciertas tablas.

Hibernate es un framework ORM de persistencia de datos. **ORM Object Relational Mapping**  básicamente es asociar tablas a clases, campos a propiedades, Hibernate es especialista en esta cuestión y se apoya en las anotaciones JPA.

Si recordamos nuestra BD tenemos:

![image](https://user-images.githubusercontent.com/23094588/127457881-2ee13c6a-1c20-490f-934b-14126d57f26f.png)

Partiendo de la BD vamos a crear dos clases una para **`Tramite`** y otra para **`Avaluo`**.

Empecemos por la clase **`Tramite`** en el paquete **`com.javaocio.domain`**.

Otros paquetes que se pueden usar además de **`domain`** pueden ser:

* **`pojo`**
* **`entity`**

![image](https://user-images.githubusercontent.com/23094588/127379769-2d9306c1-a3bd-454d-a775-428ee230ae4b.png)

En esta clase **`Tramite`** vamos a meter el siguiente código:

```java
package com.javaocio.domain;

import java.sql.Timestamp;

public class Tramite {

   private int idTramite;
   private String tipoTramite;
   private Timestamp fhcTramite;
	
   public Tramite() {
      super();
   }

   public Tramite(String tipoTramite, Timestamp fhcTramite) {
      super();
      this.tipoTramite = tipoTramite;
      this.fhcTramite = fhcTramite;
   }

   public int getIdTramite() {
      return idTramite;
   }

   public void setIdTramite(int idTramite) {
      this.idTramite = idTramite;
   }

   public String getTipoTramite() {
      return tipoTramite;
   }

   public void setTipoTramite(String tipoTramite) {
      this.tipoTramite = tipoTramite;
   }

   public Timestamp getFhcTramite() {
      return fhcTramite;
   }

   public void setFhcTramite(Timestamp fhcTramite) {
      this.fhcTramite = fhcTramite;
   }
		
}
```

Hemos creado tres propiedades encapsuladas para la clase basado en lo que existe en nuestra tabla **Tramite**. Hemos creado un Constructor vacío y otro con dos propiedades sin incluir **`idTramite`** por que este es un valor autoincrementado.

A esta clase usualmente se llama **POJO Plain Old Java Object** representa un dato de la tabla **Tramite** porque va a tener un **`idTramite`**, un **`tipoTramite`** y un **`fhcTramite`**.


Ahora en este caso si te das cuenta los campos de la tabla se llaman idénticos a los de la clase, por que ha si lo hemos programado. Pero que tal y no se llaman de la misma forma, entonces ahí es donde entra el mapping de Hibernate, porque Hibernate no permitirá asociar cada una de esas propiedades a cada uno de los campos de la tabla.

Existen dos formas de hacer el Mapping:

* Mediante XML
* Mediante Anotaciones

El primer enfoque que vamos a usar es con XML.

Vamos a crear un archivo XML dentro del paquete **`domain`** llamado **`hibernate.hbm.xml`**.

![image](https://user-images.githubusercontent.com/23094588/127463189-b59af1a9-79ee-47b1-ad4f-07d02af1e1bf.png)

En este archivo le vamos a decir a Hibernate como va a ser el Mapping.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<hibernate-mapping package="com.javaocio.domain">
   <class name="Tramite" table="Tramite">
      <!-- 	Mapping del id -->
      <id name="idTramite" column="idTramite">
         <generator class="native"/>
      </id>

      <!-- Mapping del resto de las filas -->
      <!-- <property name="tipoTram" type="string" column="tipoTram"/> -->
      <property name="tipoTramite" type="string" />
      <property name="fhcTramite" type="timestamp" />
   </class>
</hibernate-mapping>
```

* En el tag **`hibernate-mapping`** debemos indicar el package donde estan los archivos de configuración.

* Con el tag **`class`** indicamos el nombre de la clase y el nombre de la tabla con el que lo queremos mapear, en este caso ambas se llaman **`Tramite`**.

* Con el tag **`id`** identificamos la propiedad que va a fungir como ID y con que columna de relaciona de la tabla, ademas indicamos como se va a generar su valor con el tag **`generator`**.

* Con el tag **`property`** definimos las demas propiedades que tenemos, si la propiedad y la columna se llaman igual se puede omitir el atributo **`column`**, hay que indicar el tipo de la propiedad.

## Uso del método **`save`** 07:47

En esta lección vamos a insertar una fila en nuestra tabla **`Tramite`** mediante Hibernate usando un mapping mediante XML.

Lo primero que tenemos que hacer es indicar en la configuración de Hibernate es decir en el archivo **`hibernate.cfg.xml`** que tipo de implementación vamos a usar en este primer caso XML.

```xml
   . . .   
   <!-- Use mapping basado en XML-->	
   <mapping resource="com/javaocio/domain/Tramite.hbm.xml"/>
   . . .
```

Le estamos indicando a Hibernate que use el archivo **`Tramite.hbm.xml`** para hacer el Mapping, observece que el nombre del paquete se indica con diagonales en lugar de puntos.

Con esto ya le indicamos que va a usar ese archivo XML para hacer el mapping entre la clase **`Tramite`** y la tabla **`Tramite`**.

### Crear clase Test

Ahora lo que vamos a hacer es crear una clase de prueba o Test para probar lo que hemos hecho hasta ahora.

Creamos la clase **`Test`** dentro del paquete **`com.javaocio.test`**.

![image](https://user-images.githubusercontent.com/23094588/127469963-615d2eaf-c043-4a70-86a0-8f9b29af7fba.png)

Insertamos el siguiente código:

```java
package com.javaocio.test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;

import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class Test {

   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
      session.beginTransaction();
		
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
      Date date = new Date();
		
      // Crear una instancia de Tramite
      Tramite tramite = new Tramite("Crédito", new Timestamp(date.getTime()));
		
      // Salvar el tramite 
      session.save(tramite);	// insert into Tramite (tipoTramite, fhcTramite) values (?, ?)
				
      session.getTransaction().commit();
      session.close();

   }

}
```

* Primero creamos un objeto de tipo **`Session`** usando la clase **`HibernateUtil`** que habiamos creado anteriormente.
* Abrimos una transacción con  **`session.beginTransaction()`** y lo cerramos con **`session.getTransaction().commit()`**
* Cerramos la sesión con **`session.close()`**
* Detro de la transacción lo primero que hacemos es crear una instancia de Tramite.
* Con **`session.save(tramite)`** Hibernate hace la Magia y salva en la BD el registro (realmente se hace al llegar al **`session.getTransaction().commit()`**)

Si vemos la definición de **`session.save(...)`**

![image](https://user-images.githubusercontent.com/23094588/127472609-64bbfe1d-4c3d-4485-ac04-82540a2cfd1b.png)

Lo que hace es persistir el objeto. Lo que realmente esta haciendo es un **`INSERT INTO`** en la BD, lo único que hay que pasarle es la instancia del Objeto "Mappeado"

Vamos a ejecutar la clase **`Test`**.

Debido a que existen problemas con la conexión a la BD se realizarón los siguientes cambios:

1) Cambiar en el **`pom.xml`** la dependencia de MySQL:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>JavaPersistence</groupId>
  <artifactId>JavaPersistence</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <build>
    <sourceDirectory>src</sourceDirectory>
    <plugins>
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
    </plugins>
  </build>
  <dependencies>
  	<dependency>
  		<groupId>org.hibernate</groupId>
  		<artifactId>hibernate-core</artifactId>
  		<version>5.2.1.Final</version>
  	</dependency>
  	<dependency>
  		<groupId>org.hibernate</groupId>
  		<artifactId>hibernate-validator</artifactId>
  		<version>5.2.4.Final</version>
  	</dependency>
  	<dependency>
  		<groupId>org.hibernate</groupId>
  		<artifactId>hibernate-entitymanager</artifactId>
  		<version>5.2.1.Final</version>
  	</dependency>
  	<!-- 
  	<dependency>
  		<groupId>mysql</groupId>
  		<artifactId>mysql-connector-java</artifactId>
  		<version>5.1.39</version>
  	</dependency>
  	-->
  	<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
	<dependency>
	    <groupId>mysql</groupId>
	    <artifactId>mysql-connector-java</artifactId>
	    <version>8.0.19</version>
	</dependency>
  </dependencies>
</project>
```

2) Cambios en la configuración de Hibernate en el archivo **`hibernate.cfg.xml`** para hacer referencia a los datos de la nueva dependencia de MySQL.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<hibernate-configuration>
    <session-factory>
        <!-- Database connection settings -->
        <property name="connection.driver_class">com.mysql.cj.jdbc.Driver</property>
        <!-- Ubicación de la B.D. -->
        <property name="connection.url">jdbc:mysql://localhost:3306/test_bd?serverTimezone=UTC</property>
        <!-- Usuario de la B.D. -->
        <property name="connection.username">root</property>
        <!-- Contraseña de la B.D. -->
        <property name="connection.password">root</property>

        <!-- Dialecto SQL -->
        <property name="dialect">org.hibernate.dialect.MySQLDialect</property>

        <!-- Mostrar en consola operaciones SQL -->
        <property name="show_sql">true</property>
         
        <!-- Use mapping basado en XML-->	
        <mapping resource="com/javaocio/domain/Tramite.hbm.xml"/>
        
        <!-- Usar mapping en base a anotaciones-->
        
    </session-factory>
</hibernate-configuration>
```

Con estos cambios al ejecutar la clase **`Test`** tenemos:

![image](https://user-images.githubusercontent.com/23094588/127483120-2bbe0e21-6ae7-40ae-86fd-02d574ed6008.png)

Y ahora simplemente vamos a ir a nuestra base de datos para ver el contenido de la tabla **`Tramite`**.

![image](https://user-images.githubusercontent.com/23094588/127483528-074d03c7-7e33-475f-a5ab-774b230d56a7.png)

como vemos se insertaron nuestros datos en la base de datos, esta es la magia de Hibernate.

![image](https://user-images.githubusercontent.com/23094588/127484709-6a861746-6248-4495-819c-074c34780861.png)

## Uso de anotaciones JPA en Hibernate 04:01

En esta lección vamos a hacer lo mismos que en la lección anterior solo que en vez de usar configuración de mapping a través de XML lo vamos a hacer mediante ***anotaciones JPA***.

Entonces nos vamos a ir a showers y Cofiño entonces.

Así es como nosotros vamos a usar el mapping basado en XML y para usar el mapping basado en anotaciones

vamos a poner mapping Class y esta clase debe ser el nombre calificado de la clase que ya está anotada.

### Cambiar la Configuración en `hibernate.cfg.xml`.

Vamos a cambiar la configuración de XML a Anotaciones.

```xml
   . . .
   <!-- Use mapping basado en XML-->	
   <!-- <mapping resource="com/javaocio/domain/Tramite.hbm.xml"/>-->
        
   <!-- Usar mapping en base a anotaciones-->
   <mapping class="com.javaocio.domain.Tramite" />
```

### Anotar la clase `Tramite`

> 🔴 **NOTA** Para las anotaciones que vamos a insertar importarlas siempre del paquete **`javax.persistence`** y no de **`org.hibernate.annotation`**

La clase **`Tramite`** con las anotaciones es la siguiente:

```java
package com.javaocio.domain;

import java.sql.Timestamp;

//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Tramite")
public class Tramite {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int idTramite;
	
   //@Column(name="tipoTramite")
   private String tipoTramite;
   private Timestamp fhcTramite;
	
   public Tramite() {
      super();
   }

   public Tramite(String tipoTramite, Timestamp fhcTramite) {
      super();
      this.tipoTramite = tipoTramite;
      this.fhcTramite = fhcTramite;
   }

   public int getIdTramite() {
      return idTramite;
   }

   public void setIdTramite(int idTramite) {
      this.idTramite = idTramite;
   }

   public String getTipoTramite() {
      return tipoTramite;
   }

   public void setTipoTramite(String tipoTramite) {
      this.tipoTramite = tipoTramite;
   }

   public Timestamp getFhcTramite() {
      return fhcTramite;
   }

   public void setFhcTramite(Timestamp fhcTramite) {
      this.fhcTramite = fhcTramite;
   }
		
}
```

* La clase la anotamos con **`@Entity`** para indicar que es una entidad.
* La clase la anotamos con **`@Table(name ="Tramite")`** para indicar con que tabla se debe mapper. (Si los nombres son iguales se puede omitir)
* Simpre debe exisir un campo anotado con **`@Id`** para indicar el campo principal y con **`@GeneratedValue(strategy = GenerationType.IDENTITY)`** indicamos la forma en que se genera el valor de este campo.
* Podemos usar la anotación **`@Column(name="tipoTramite")`** para mapear la propiedad con un campo de la BD, si los nombres son iguales podemos omitirla.

### Probar la aplicación

Vamos a ir a la clase **`Test`** y vamos a crear un trámite diferente.

Ejecutamos la App y tenemos:

![image](https://user-images.githubusercontent.com/23094588/127488716-26260882-e2b6-4d67-9e0b-506a395feaf1.png)

Si vemos la BD tenemos:

![image](https://user-images.githubusercontent.com/23094588/127488776-341b80f8-0b94-4ae2-a192-fbd561466149.png)

Hemos logrado insertar un registro en la tabla **`Tramite`** pero ahora usando la técnica de las Anotaciones en lugar de los XML.

![image](https://user-images.githubusercontent.com/23094588/127489248-a19ada12-c801-4a43-b266-6858b34c11a1.png)

## Consulta con HQL 02:50

[Hibernate ORM 5.0 User Guide](https://docs.jboss.org/hibernate/orm/5.0/userguide/html_single/Hibernate_User_Guide.html)

En esta clase quiero mostrarte como hacer una consulta con una restriccion, antes de entrar a **Criteria** que es donde me gustaría enfocarnos ya que hacer unas consultas con lenguaje SQL puede resultar familiar.

Estoy en la página oficial de la documentación de Hibernate 5 en la parte de HQL

![image](https://user-images.githubusercontent.com/23094588/127612490-1641c16c-1dc1-4d89-b031-651f7fc2f342.png)

y aquí como ves hay algunos ejemplos de cómo usar todo lo que se usa en SQL pero con HQL, existe otra técnica diferente llamada **Criteria** que es la que vamos a tratar debido a que hace ***consultas seguras*** como lo llama la documentación, debido a que no usamos lenguaje SQL sino usamos interfaces y métodos de interfaces.

## Consultando todos los registros con HQL 04:49

### Ejemplo para recuperar todos los Trámites de la tabla `Tramite`

Vamos a comenzar por realizar un ejemplo que recupere todos los Trámites de la tabla **`Tramite`**. La consulta necesaria para esto la vamos a poner en nuestro archivo de prueba **`Test`**, comentamos lo anterior para no ingresar más trámites.

```java
@SuppressWarnings("unchecked")
Query<Tramite> query = session.createQuery("from Tramite"); 
		
List<Tramite> tramites = query.getResultList();
System.out.println(tramites.toString());
```

* El **`Query`** que hay que importar es el de **`org.hibernate.query.Query;`**
* Estamos usando el metodo **`session.createQuery("from Tramite")`** para crear un objeto **`Query`**.
* Recuperamos la lista de resultados en una lista.
* Sacamos a la consola la lista de los tramites.

Observemos que la sentencia HQL **`from Tramite`** no es exactamente como una SQL es más reducida, cabe hacer notar que **`Tramite`** hace referencia a la Entidad NO a la tabla.

Probando la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127614582-db21b98c-f7b3-4d4b-947e-e9c4f99f5f61.png)

La salida nos muestra la sentencia SQL y despúes nos muestra dos objetos **`Tramite`**

#### Modificar Entidad `Tramite`

Para que nos muestre mejor los trámites vamos a ir a la Entidad **`Tramite`** y vamos a sobreescribir el método **`toString`**.

```java
   . . .
   @Override
   public String toString() {
      return "Tramite [idTramite=" + idTramite + ", tipoTramite=" + tipoTramite + ", fhcTram=" + fhcTramite + "]";
   }
```

Si ejecutamos nuevamente la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127615968-f46f4bd2-56bb-4ad1-8d5a-1238e9b8e3b8.png)

con esto ya vemos más claro cada trámite.

## Creación de una consulta personalizada con HQL 02:50

### Ejemplo para recuperar los Trámites de un determinado Tipo.

```java
. . .
@SuppressWarnings("unchecked")
Query<Tramite> queryTipo = session.createQuery("from Tramite where tipoTramite = :tipoTramite"); 
queryTipo.setParameter("tipoTramite", "Crédito");
		
List<Tramite> tramitesTipo = queryTipo.getResultList();
System.out.println(tramitesTipo.toString());
```

* Hemos tenido que añadir la clausula **`where`** con la propiedad que queremos buscar y no se asigna un valor fijo si no mediante **`= :tipoTramite`** se le indica que le vamos a pasar un valor.
* Con **`queryTipo.setParameter("tipoTramite", "Crédito");`** indicamos el valor del parámetro que necesita nuestro Query.

Con esto ya recuperamos solo los trámmites de tipo **`Crédito`**.

![image](https://user-images.githubusercontent.com/23094588/127763905-c9c6482e-3a55-4071-937d-a13db448d75f.png)

![image](https://user-images.githubusercontent.com/23094588/127764363-8bcc8b45-0065-49fa-bb7e-ba901f914ade.png)

## Consulta de todos los registros con Criteria 06:34

[Criteria](https://docs.jboss.org/hibernate/orm/5.0/userguide/html_single/Hibernate_User_Guide.html#criteria)

![image](https://user-images.githubusercontent.com/23094588/127764450-111beb78-8cc4-48d9-b8af-a220bf51e25e.png)

¿Qué es Criteria? son una alternativa a **HQL** para realizar consultas pero de tipo seguro, porque de tipo seguro, son de tipo seguro porque usan interfases y clases para representar varias partes de la estructura de la consulta, ¿Qué significa esto?  que aquí no vamos a usar lenguaje **HQL** si no vamos a usar interfaces y clases para representar operaciones, inclusive muy complejas como lo vamos a ver posteriormente cuando hagamos relaciones de tablas ***Uno a Uno***, ***Uno a Muchos*** y ***Muchos a Muchos***, **Criteria** nos vuelven la vida sumamente sencilla, aparentemente va a ser más difícil implementar, pero eso es sólo la primera impresión, la verdad es que es una opción muy cómoda para crear un desarrollo rápido.

La documentación también dice que básicamente es un grafo que vamos a ir desglosando y precisamente así se construye una consulta, te recomiendo que le eches un vistazo a la documentación, yo me voy a basar en este ejemplo:

![image](https://user-images.githubusercontent.com/23094588/127764647-59bba928-31c4-4b56-b997-83768f6edcdd.png)

lo que hace básicamente es una consulta una entidad personal, le dice a la consulta que va a retornar **`Person`** a través de la clase **`Root`**, lo que está haciendo es un **`select`** donde (**`where`**) el nombre de la persona sea **`John Doe`** eso es lo que está haciendo, está usando en vez de un lenguaje **SQL**, está usando clases y métodos, esto es mucho más sencillo de leer si es que la consulta se torna muy compleja. Y después simplemente obtiene una lista con todos los resultados.

Vamos a adaptar este ejemplo a nuestra APP.

Aparentemente puedo decir que es más código y es más complejo pero no es así, porque cuando hagamos consultas más complejas verás que es mucho mucho más sencillo.

```java
. . .
//USO DE CRITERIA
		
// Definir la Fábrica para las piezas individuales del criterio
CriteriaBuilder builder = session.getCriteriaBuilder();
CriteriaQuery<Tramite> criteria = builder.createQuery( Tramite.class );

// Definir el tipo de entidad que retorna la consulta
Root<Tramite> root = criteria.from( Tramite.class );
		
// Construyendo la consulta
criteria.select( root ); //Hace un select *

List<Tramite> tramites = session.createQuery( criteria ).getResultList();
		
System.out.println(tramites.toString());
. . .
```

* Primero vamos a importar **`CriteriaBuilder`** del paquete **`javax.persistence.criteria.CriteriaBuilder`**
* Importar **`CriteriaQuery`** del paquete **`javax.persistence.criteria.CriteriaQuery`**
* Importar **`Root`** del paquete **`javax.persistence.criteria.Root`**
* Aquí usa **`entityManager`** que es nuestro equivalente a **`session`**
* Nosotros usamos **`Tramite`** en lugar de **`Person`**

Básicamente estamos haciendo los siguientes pasos:

* Definir la Fábrica para las piezas individuales del criterio
* Definir el tipo de entidad que retorna la consulta
* Construir la consulta
* Recuperar el rusultado 
* Mostrarlo en pantalla

Probando la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127765198-5f3913ea-64e6-4ddd-8b67-32d0667f29c1.png)

![image](https://user-images.githubusercontent.com/23094588/127765294-b41f83d0-a2d2-4399-b5b5-b52c6d2f79a5.png)

## Consultas personalizadas con Criteria 04:52

En esta lección vamos a añadir una restricción a nuestra consulta con Criteria. Esto se puede hacer de dos formas:

### Usando el métod **`criteria.where(...)`**

Basta con añadir la siguiente sentencia a nuestro código:

```java
// Construyendo la consulta
criteria.select( root );
criteria.where(builder.equal(root.get("tipoTramite"), "Crédito"));
```

Si probamos la aplicación tenemos:

![image](https://user-images.githubusercontent.com/23094588/127766723-a52c6175-7cc6-4c35-9a50-ada97ade0b81.png)

La construcción de la consulta la podemos escribir de una forma diferente pero obteniendo los mismos resultados:

```java
// Construyendo la consulta
criteria.select( root )
        .where(builder.equal(root.get("tipoTramite"), "Crédito"));

```

El resultado es el mismo:

![image](https://user-images.githubusercontent.com/23094588/127767268-3de71fc6-a788-4e51-b711-51cc46004d7e.png)

Con esta última forma de trabajar podemos ir anidadando más criterios y es más facil de leer que un HQL.

## Hibernate JPA Metamodel Generator

La única desventaja que vemos es que estamos poniendo *hardcodeados* los nombres de las propiedades involucrados en la búsqueda en este caso **`tipoTramite`**, en el ejemplo de la documentación veíamos la técnica usada que nos lo hacía automáticamente **`root.get( Person_.name )`** esto se conoce como **Hibernate JPA Metamodel Generator**, básicamente a partir de una clase Anotada con JPA(Entidad) nos va a generar un archivo como:

![image](https://user-images.githubusercontent.com/23094588/127767465-ec13d35e-bfb1-48fa-81a2-3141015ca4ca.png)

Donde podemos tener acceso a cada uno de los campos para usarlo en Criteria y así ya no tenemos que tener el dato *hardcodeado*.

### Configurar el Hibernate JPA Metamodel Generator

#### Modificar **`pom.xml`**

Ir al archivo **`pom.xml`** y añadir la siguiente dependencia:

```xml
   . . .
   <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-jpamodelgen</artifactId>
      <version>5.2.1.Final</version>
   </dependency>
   . . .
```

#### Generar el archivo Metamodel Generator

Vamos ir a las propiedades del Proyecto

![image](https://user-images.githubusercontent.com/23094588/127768106-2058be5a-9dbb-437f-abef-8d2be96a42ae.png)

Vamos a Maven y seleccionamos ***Annotation Processing***

![image](https://user-images.githubusercontent.com/23094588/127768119-2ef23a76-5439-4720-a6cc-bd4209985719.png)

Aquí vamos a marcar las siguientes dos opciones:

* ***Enable project specific settings***
* ***Automatically configure JDT APT (builds faster, but outcome may differ from Maven buils)****

![image](https://user-images.githubusercontent.com/23094588/127768235-b44aa7ef-8c49-40b4-b098-141ea799d7a0.png)

Vamos a presionar en ***Apply***

![image](https://user-images.githubusercontent.com/23094588/127768255-69435b72-9e2b-43b0-af2a-940f5231680f.png)

Damos en ***Yes*** y ***OK***, con esto nos crea la carpeta:

![image](https://user-images.githubusercontent.com/23094588/127768501-23dfe6d1-b6bf-4b76-9e2c-e1e8f25721d6.png)

SE SUPONE QUE DENTRO CREARÍA UN ARCHIVO GRACIAS A QUE TENEMOS ANOTADA NUESTA ENTIDAD CON JPA PERO NO LO HIZO, LA HE METIDO MANUALMENTE.

![image](https://user-images.githubusercontent.com/23094588/127768809-d9edafae-554a-4a06-9385-e2821b3172bb.png)

#### Modificar la propiedad *harcodeada*

Vamos a camiar **`"tipoTramite"`** por **`Tramite_.tipoTramite`**, el código nos queda así:

```java
 . . .
// Construyendo la consulta
criteria.select( root )
        .where(builder.equal(root.get(Tramite_.tipoTramite), "Crédito"));

. . .
```

Si probamos la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127769018-5102db7a-c5c7-4953-a986-4ce50a01fda9.png)

Todo funciona igual pero aquí ya estamos usando las Metamodel Generator.

![image](https://user-images.githubusercontent.com/23094588/127772400-69d05523-8dd2-40c1-aa75-6b4efbb2d0ff.png)

![image](https://user-images.githubusercontent.com/23094588/127772420-71bca02c-b8ed-4fb9-a09a-366dc8a2d7ba.png)

## Uso de los métodos **`update`** y **`saveOrUpdate`** y **`delte`** para hacer un CRUD 09:09

Atualmente en nuestra tabla **`Tramite`** tenemos los dos registros siguientes:

![image](https://user-images.githubusercontent.com/23094588/127772821-4b64b21b-92b2-427c-b59a-1b2ec9478fe9.png)

Actualmente para probar nuestra APP hemos usado la clase **`Test`**, vamos a crear una segúnda clase **`Test2`** para hacer algunos cambios a como hemos trabajado actualmete añadiendo un **`try-catch`** para el posible control de errores si manejamos más de una operación de persistencia.

```java
package com.javaocio.test;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Tramite;
import com.javaocio.domain.Tramite_;
import com.javaocio.util.HibernateUtil;

public class Test2 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         //USO DE CRITERIA
         // Definir la Fábrica para las piezas individuales del criterio
         CriteriaBuilder builder = session.getCriteriaBuilder();
         CriteriaQuery<Tramite> criteria = builder.createQuery( Tramite.class );

         // Definir el tipo de entidad que retorna la consulta
         Root<Tramite> root = criteria.from( Tramite.class );
			
         // Construyendo la consulta
         criteria.select( root )
                 .where(builder.equal(root.get(Tramite_.tipoTramite), "Crédito"));

         List<Tramite> tramites = session.createQuery( criteria ).getResultList();
			
         System.out.println(tramites.toString());

         tx.commit();
      
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

* Creamos un objeto **`Transaction`**
* Añadimos bloque **`try-catch`**
* Dentro del **`try`** vamos a iniciar la transacción y hacer el commit y en caso de que exista algún error hacemos un rollback, al final cerramos la sesión. De esta forma controlamos que si hacemos varias operaciones y alguna falla ninguna se reflejara en la BD.
* Metemos la consulta anterior dentro del Try.

Al probar la APP todo sigue funcionando igual.

![image](https://user-images.githubusercontent.com/23094588/127773318-a43d3d1f-fad8-49c9-99be-f384ac6ceb8e.png)

### Retornar solo un resultado con `getSingleResult()`

Cuando estemos seguros que el resultado es solo uno podemos usar en lugar de:

```java
   . . .
   List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   . . .
```

usar:

```java
   . . .
   //List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   Tramite tramite = session.createQuery( criteria ).getSingleResult();
   
   System.out.println(tramite.toString());
   . . .
```

La salida es:

![image](https://user-images.githubusercontent.com/23094588/127773856-1f6dc64d-1758-4dd5-a52b-94651781b2c2.png)

### Actualizar el Estado de un Trámite mediante el **`set`** y **`session.update(...)`**

```java
   . . .
   Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         //USO DE CRITERIA
         // Definir la Fábrica para las piezas individuales del criterio
         CriteriaBuilder builder = session.getCriteriaBuilder();
         CriteriaQuery<Tramite> criteria = builder.createQuery( Tramite.class );

         // Definir el tipo de entidad que retorna la consulta
         Root<Tramite> root = criteria.from( Tramite.class );
			
         // Construyendo la consulta
         criteria.select( root )
                 .where(builder.equal(root.get(Tramite_.tipoTramite), "Crédito"));

	 //List<Tramite> tramites = session.createQuery( criteria ).getResultList();
         Tramite tramite = session.createQuery( criteria ).getSingleResult();
			
         System.out.println(tramite.toString());
					
         //Actualizar el estado del Trámite
         tramite.setTipoTramite("Crédito Mensual");
			
         session.update(tramite);

         tx.commit();
      } catch (Exception e) {
   . . .
   
```

* Consultamos un registro
* Lo recuperamos
* Lo actualizamos
* Lo persisto en la BD

Ejecutando la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127774138-ef637d11-8403-441e-8655-3c267c230aa1.png)

Nos indica que Hiberna ha realizado un **`update`**, vamos a revisar la BD.

![image](https://user-images.githubusercontent.com/23094588/127774178-7fe1d44b-7039-4b89-a5c2-76425545762d.png)

Como podemos observar a cambiado **`Crédito`** por **`Crédito Mensual`**. Vamos a regresar manualmente el valor a **`Crédito`**.

![image](https://user-images.githubusercontent.com/23094588/127774394-10d8c2eb-cf8e-45e7-a6b4-fd24fefee3dd.png)


Vamos ahora a realizar dos tareas, modificar el trámite igual que lo habíamos hecho y ademas crear un nuevo crédito, el código es el siguiente:

```java
   . . . 
   // Construyendo la consulta
   criteria.select( root )
           .where(builder.equal(root.get(Tramite_.tipoTramite), "Crédito"));

   //List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   Tramite tramite = session.createQuery( criteria ).getSingleResult();
			
   //Actualizar el estado del Trámite
   tramite.setTipoTramite("Crédito Mensual");
			
			
   // Crear un nuevo trámite
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
   Date date = new Date();
			
   // Crear una instancia de Tramite
   Tramite tramiteNew = new Tramite("Crédito Nuevo", new Timestamp(date.getTime()));
			
   // Salvar el tramite 
   session.save(tramiteNew);
   session.update(tramite);
   . . .
```

Al ejecutar la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127774634-fb53c9a1-0330-44bc-b5d1-b0f3851700cd.png)

Observamos como Hibernate a ejecutado un **`insert`** y un **`update`**, gracias a que hemos usado los métodos **`session.save(tramiteNew)`** y **`session.update(tramite)`** de Hibernate.

Si vemos lo que ha pasado en la BD tenemos:

![image](https://user-images.githubusercontent.com/23094588/127774703-72be745b-3cb4-436b-a43f-965dd217241c.png)

Vamos a poner nuevamente **`Crédito`** en el primer registro para la siguiente prueba.

![image](https://user-images.githubusercontent.com/23094588/127774729-18404e4c-869c-45ba-a331-6cf9b7902d44.png)

### Uso del método **`saveOrUpdate`** en lugar de **`save`** y **`update`**.

Podemos realizar la misma tarea pero usando el método **`saveOrUpdate`** en lugar de **`save`** y **`update`**, en caso de que el Objeto a persistir no exista lo insertara y si ya existe lo actualizara.

```java
   . . . 
   // Construyendo la consulta
   criteria.select( root )
           .where(builder.equal(root.get(Tramite_.tipoTramite), "Crédito"));

   //List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   Tramite tramite = session.createQuery( criteria ).getSingleResult();
			
   //Actualizar el estado del Trámite
   tramite.setTipoTramite("Crédito Mensual");
			
			
   // Crear un nuevo trámite
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
   Date date = new Date();
			
   // Crear una instancia de Tramite
   Tramite tramiteNew = new Tramite("Proyecto de Construcción", new Timestamp(date.getTime()));
			
   // Salvar el tramite 
   session.saveOrUpdate(tramiteNew);
   session.saveOrUpdate(tramite);
   . . .
```

Al ejecutar la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127775108-5a4c1978-285a-457f-aab1-09573ae971dd.png)

Hibernate sigue ejecutando un insert y un update pero en este caso nosotros hemos usado el método **`saveOrUpdate`** en lugar de **`save`** y **`update`** y Hibernate es tan inteligente de distinguir si debe insertar o actualizar.

Y al ver la BD tenemos.

![image](https://user-images.githubusercontent.com/23094588/127775128-23946598-301f-484f-b4b3-e4cd95308f2c.png)

### Eliminar un registro con `session.delete(OBJ)`.

Para eliminar un registro en la BD primero lo localizamos y después lo eliminamos con **`session.delete(OBJ)`**.

Vamos a eliminar el último registro insertado **`Proyecto de Construcción`**.

```java
   . . .
   // Construyendo la consulta
   criteria.select( root )
           .where(builder.equal(root.get(Tramite_.tipoTramite), "Proyecto de Construcción"));

   Tramite tramite = session.createQuery( criteria ).getSingleResult();
			
   session.delete(tramite);
   . . .			
```

Al ejecutar la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127775340-b087c53a-1182-41ba-b474-3519e845a53f.png)

Y en la BD:

![image](https://user-images.githubusercontent.com/23094588/127775370-817094c2-7afe-4d12-9352-10e1177f0da7.png)

Con esto ya hemos podido hacer un CRUD con Hibernate.

![image](https://user-images.githubusercontent.com/23094588/127775516-f6440ad6-b481-46eb-85ec-2e68e6fe901b.png)

## Consultas anidadas con Criteria 07:35

Es momento de ver un poco más a fondo Criteria, esto nos va a servir al momento de hacer las relaciones ***Uno a Uno***, ***Uno a Muchos*** etc. 

Vamos a empezar por crear una clase **`Test3`** donde vamos a realizar nuestros nuevos ejercicios.

### Hacer una consulta de todos los trámites que tengan el texto `Crédito` dentro del tipo de Crédito.

![image](https://user-images.githubusercontent.com/23094588/127828578-fa7ae12e-180e-4a9a-8ad8-4c8e7d02cbda.png)

Si quisieramos realizar esta operación en SQL estaríamos pensando en un **`like`**. Para realizarlo con Criteria se realiza dentro de la clausula **`where`** similar a como haciamos con **`equal`**.

```java
   . . . 
   // Construyendo la consulta
   criteria.select( root )
           .where(builder.like(root.get(Tramite_.tipoTramite), "Crédito"));

   List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   System.out.println(tramites.toString());
   . . .
```

Al probar la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127829851-61bebb9d-1389-4f0f-a829-3e6b64173fd1.png)

### Más de una condición

Si ademas de que tenga la palabra **`Crédito`** se haya creado antes de una fecha.

```java
   . . .
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
   Date parsedDate = dateFormat.parse("2021-08-01 14:26:25");
			
   // Construyendo la consulta
   criteria.select( root )
           .where(builder.and(
                     builder.like(root.get(Tramite_.tipoTramite), "%Crédito%"),
                     builder.lessThan(root.<Timestamp>get(Tramite_.fhcTramite), new Timestamp(parsedDate.getTime()))
                     )       		
            );

   List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   System.out.println(tramites.toString());
   . . .   
```

* Para meter más de una condición usamos **`builder.and(`**
* Para hacer una comparación menor que usamos **`builder.lessThan(`** 
* Creamos una fecha de referencia para comparar tipo **`Timestamp`**.
* Usamos **`root.<Timestamp>get`** para que no infiera el tipo de dato.
* Observece como meto el dato **`String`** y lo convierto a un **`Timestamp`** para comparar.
* La fecha comparada no se incluye por que no es menor que, es igual.

Al ejecutar la APP tenemos:

![image](https://user-images.githubusercontent.com/23094588/127838342-02a8e078-c779-4780-8192-4c885aea3db4.png)


**`buider`** tiene inmensidad de métodos que podemos usar para construir nuestra consulta.

![image](https://user-images.githubusercontent.com/23094588/127838796-563bb18c-35ff-4d43-a967-04b03324c77e.png)

![image](https://user-images.githubusercontent.com/23094588/127838868-29781de7-a30d-4d70-b5c3-1bd4e90ce207.png)

![image](https://user-images.githubusercontent.com/23094588/127838957-ed226450-1bea-4185-9cbd-50ae48227d00.png)

![image](https://user-images.githubusercontent.com/23094588/127839118-9be9b1b9-4910-4b83-b571-f91750ffed23.png)

![image](https://user-images.githubusercontent.com/23094588/127839172-fefa7be3-39fe-4e5e-9ecc-eacd091b5372.png)

![image](https://user-images.githubusercontent.com/23094588/127840574-e60bc42e-aa9f-40f0-a9c9-892f365ecefd.png)

## Consultando campos personalizados con `Tuple` 04:21

Qué tal si no queremos consultar un trámite entero, si no queremos obtener algunos de los campos de una consulta. Hibernate nos facilita esto mediante una clase que se llama **Tuple**.

Vamos a crear la clase **`Test4`** para probar esto.

Entonces lo que tenemos que hacer es lo siguiente:

```java
CriteriaQuery<Tramite> criteria = builder.createQuery( Tramite.class );
```

por

```java
CriteriaQuery<Tramite> criteria = builder.createQuery( Tramite.class );
```

Además vamos a cambiar el **`criteria.select`** por **`criteria.multiselect`** la cual ya no retorna objetos **`Tramite`** sino que va a retornar objetos **`Tuple`** del paquete **`javax.persistence.Tuple`** . Tenemos que crear los campos que queremos que nos localice mediante la clase **`Path`** del paquete **`javax.persistence.criteria.Path`** 

```java
   . . .
   Path<Integer> idTramitePath = root.get(Tramite_.idTramite);
   Path<Timestamp> fhcTramitePath = root.get(Tramite_.fhcTramite);
   . . .
```

Estos dos campos se los vamos a pasar al **`criteria.multiselect`** para indicar que quiero consultar estos dos campos:

```java
   . . .
   // Construyendo la consulta
   criteria.multiselect( idTramitePath,  fhcTramitePath)
               .where(builder.and(
                         builder.like(root.get(Tramite_.tipoTramite), "%Crédito%"),
                         builder.lessThan(root.<Timestamp>get(Tramite_.fhcTramite), new Timestamp(parsedDate.getTime()))
                         )       		
                     );
   . . .
```

Vamos a usar las mismas restriciones o condiciones. Debemos cambiar:

```java
   . . .
   List<Tramite> tramites = session.createQuery( criteria ).getResultList();
   System.out.println(tramites.toString());
   . . .   
```

por 

```java
   . . .
   List<Tuple> tuples = session.createQuery( criteria ).getResultList();
   for(Tuple tuple : tuples) {
      System.out.println("tupla: " + tuple.get(idTramitePath) + ", " + tuple.get(fhcTramitePath));
   }
   . . .			
```

El código completo de **`Test4`** es:

```java
package com.javaocio.test;

import java.sql.Timestamp;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Tuple;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Tramite;
import com.javaocio.domain.Tramite_;
import com.javaocio.util.HibernateUtil;

public class Test4 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         //USO DE CRITERIA
         // Definir la Fábrica para las piezas individuales del criterio
         CriteriaBuilder builder = session.getCriteriaBuilder();
         CriteriaQuery<Tuple> criteria = builder.createQuery( Tuple.class );

         // Definir el tipo de entidad que retorna la consulta
         Root<Tramite> root = criteria.from( Tramite.class );
	
	 // Crea campos a consultar
         Path<Integer> idTramitePath = root.get(Tramite_.idTramite);
         Path<Timestamp> fhcTramitePath = root.get(Tramite_.fhcTramite);
				
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
         Date parsedDate = dateFormat.parse("2021-08-01 14:26:25");
			
         // Construyendo la consulta
         criteria.multiselect( idTramitePath,  fhcTramitePath)
                 .where(builder.and(
                           builder.like(root.get(Tramite_.tipoTramite), "%Crédito%"),
                           builder.lessThan(root.<Timestamp>get(Tramite_.fhcTramite), new Timestamp(parsedDate.getTime()))
                           )       		
                       );

         List<Tuple> tuples = session.createQuery( criteria ).getResultList();
         for(Tuple tuple : tuples) {
            System.out.println("tupla: " + tuple.get(idTramitePath) + ", " + tuple.get(fhcTramitePath));
         }
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```
 
 Si ejecutamos la APP tenemos:
 
![image](https://user-images.githubusercontent.com/23094588/127915741-a5927c1e-0d25-4a4e-a165-16cb2fc0458a.png)

![image](https://user-images.githubusercontent.com/23094588/127916021-64abb980-834a-40c9-b17f-9068d231d3bf.png)

## Uso de **`@OneToOne`** 09:11

En esta lección vamos a ver cómo usar Hibernate para hacer la relación ***Uno a Uno*** entre dos tablas.

Recordando nuestro diagrama de Modelo de la BD que tenemos es el siguiente:

![image](https://user-images.githubusercontent.com/23094588/127916946-ac664961-426b-47e7-9efb-04ea166e8b76.png)

Vamos a realizar un campo en la tabla **`Avaluo`** en concreto en el campo **`Tramite_idTramite`** actualmente puede ser nulo, pero vamos a marcarlo para que sea no nulo:

![image](https://user-images.githubusercontent.com/23094588/127917165-2087964b-3af3-47f6-b712-99dddd13fdc9.png)

Con este cambio hecho vamos a:

![image](https://user-images.githubusercontent.com/23094588/127917307-619cd6c4-b32a-40aa-a525-3a7c6de57bda.png)

![image](https://user-images.githubusercontent.com/23094588/127917377-bdf60934-60b7-45a5-8630-0c5b4fdd2747.png)

Presionamos **Continue**

![image](https://user-images.githubusercontent.com/23094588/127917424-897b7319-89a3-43ef-a513-c97973886097.png)

![image](https://user-images.githubusercontent.com/23094588/127917458-dd112e25-acc3-4d2c-8df7-666b5641cab3.png)

![image](https://user-images.githubusercontent.com/23094588/127917498-34b659e4-6f8c-4947-b905-393a272d6475.png)

![image](https://user-images.githubusercontent.com/23094588/127917519-2b6cbaf9-554e-43c9-9166-fc145095598c.png)

Con esta acción nuestros datos se han eliminado, solo para tenerlo en cuenta.

![image](https://user-images.githubusercontent.com/23094588/127917657-f69654a5-acd4-45e2-bf7d-6d8e468d7db8.png)


### Relaciones Uno a Uno

En Hibernate básicamente hay dos hay dos tipos de relaciones ***Uno a Uno*** una es **unidireccional** y la otra **bidireccional** 

Basados en nuestro ejemplo básicamente lo que esto quiere decir es que el **Avalúo** va a saber a qué **Trámite** corresponde pero
yo también puedo hacer que el **Trámite** sepa qué **Avalúos** son los que lo contienen. Básicamente es una relación bidireccional que no solo una de las tablas es dueña de la otra o de la relación sino que ambas son conscientes y esto lo hace con anotaciones y con este mapping.

### Crear la Clase Avaluo

En el paquete **`domain`** creamos la clase **`Avaluo`**

```java
package com.javaocio.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Avaluo")
public class Avaluo {
	
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   
   private int idAvaluo;
   private String lugarAvaluo;
	
   @OneToOne
   @JoinColumn(name = "Tramite_idTramite")
   private Tramite tramite;

   public Avaluo() {
	
   }

   public Avaluo(String lugarAvaluo) {
      this.lugarAvaluo = lugarAvaluo;
   }

   public int getIdAvaluo() {
      return idAvaluo;
   }

   public void setIdAvaluo(int idAvaluo) {
      this.idAvaluo = idAvaluo;
   }

   public String getLugarAvaluo() {
      return lugarAvaluo;
   }

   public void setLugarAvaluo(String lugarAvaluo) {
      this.lugarAvaluo = lugarAvaluo;
   }

   public Tramite getTramite() {
      return tramite;
   }

   public void setTramite(Tramite tramite) {
      this.tramite = tramite;
   }

   @Override
   public String toString() {
      return "Avaluo [idAvaluo=" + idAvaluo + ", lugarAvaluo=" + lugarAvaluo + ", tramite=" + tramite + "]";
   }
	
}
```

![image](https://user-images.githubusercontent.com/23094588/127918749-c8bbe9a4-7dad-469e-ba28-eb67fda2f06f.png)

* La clase tiene dos propiedades principales de acuero a los capos de la tabla **`idAvaluo`** y **`lugarAvaluo`**
* Anotamos la clase (**`@Entity`** y **`@Table(name = "Avaluo")`**) y el campo ID (**`@Id`** y **`@GeneratedValue(strategy = GenerationType.IDENTITY)`**) con sus anotaciones correspondientes.
* Para realizar la relación ***Uno a Uno*** dentro de la clase **`Avaluo`** vamos a poner una propiedad de tipo **`Tramite`** y la vamos a anotar con **`@OneToOne`** y vamos a añadir la siguiente anotación para indicar la llave foranea **`@JoinColumn(name = "Tramite_idTramite")`** donde **`"Tramite_idTramite"`** es el nombre de la columna en la tabla **`Avaluo`** de la BD. **ESTO HACE QUE SEA UNA RELACIÓN UNIDIRECCIONAL**.
* Crear un Constructor vacio.
* Crear un Constructor con el lugar del Avalúo
* Crear Setters y Getter
* Crear método **`toString`**

Para hacer la **RELACIÓN BIDIRECCIONAL** vamos a la Entidad **`Tramite`** y vamos añadir la siguiente propiedad:

```java
   . . .
   @OneToOne(mappedBy = "tramite")
   private Avaluo avaluo;
   . . .
```

* Añado una propiedad del tipo de la Entidad, es decir **`Avaluo`** y la anoto con **`@OneToOne(mappedBy = "tramite")`** donde **`tramite`** es el atributo de la entidad **`Avaluo`** que esta sirviendo como relación.

Con esto ya tenemos una **RELACIÓN BIDIRECCIONAL**.

### Añadir la Entidad `Avaluo` en `hibernate.cfg.xml`.

Añadir en el archivo **`hibernate.cfg.xml`** la siguiente línea:

```xml
   ...
   <mapping class="com.javaocio.domain.Avaluo" />
   ...
```

### Crear clase `TestOneToOne`

Vamos crear un **`Tramite`** asociarlo a un **`Avaluo`** y hacer que persistan esos dos objetos en la BD.

```java
package com.javaocio.test;

import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Avaluo;
import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class TestOneToOne {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         // Crear y persistir Trámite
         Tramite tramite = new Tramite("Crédito rechazado", new Timestamp(new Date().getTime()) );
         session.save(tramite);
			
         // Crear Avalúo, asignar Trámite y persistir Avalúo
         Avaluo avaluo = new Avaluo("Hidalgo #102");
         avaluo.setTramite(tramite);
         session.save(avaluo);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Ejecutar la APP

![image](https://user-images.githubusercontent.com/23094588/128538342-ec1a73c0-ed84-4db3-961d-2baf3d00c7c1.png)

Me muestra los dos **`inserts`** que realiza.

### Ver la BD

![image](https://user-images.githubusercontent.com/23094588/128538554-1813ced7-4bc8-4bd0-b176-0e1a5f1cb17d.png)

![image](https://user-images.githubusercontent.com/23094588/128538653-b564e2a4-d701-4001-97f9-8092b1e687e3.png)

Se a creado el **`Tramite`** y también el **`Avaluo`** con la referencia del **`Tramite`**, es decir el campo **`Tramite_idTramite`** contiene **`1`** que es el **`idTramite`** del **`Tramite`** que insertamos.

## Segundo Ejemplo `TestOneToOne2`

Ya con un Trámite creado añadirle un Avalúo.

Primero creamos el Trámite.

![image](https://user-images.githubusercontent.com/23094588/128539500-502bc382-e81f-487d-996a-a62fcc2c2a9d.png)

![image](https://user-images.githubusercontent.com/23094588/128539606-33e35b92-bb41-40ff-ae5d-3f9c15989648.png)

### Cargar un `Tramite` con el método `session.load`

**`session.load`** necesita el nombre de la clase que se quiera recuperar y el ID, para nuestro ejemplo es:

```java
   . . .
   // Cargo un trámite ya existente
   Tramite tramite2 = session.load(Tramite.class, 2);
   . . .
```

### Vamos a crear un Avalúo y asignarle el Trámite cargado.

```java
package com.javaocio.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Avaluo;
import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class TestOneToOne2 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         // Crear y persistir Trámite
//       Tramite tramite = new Tramite("Proyecto de Construcción", new Timestamp(new Date().getTime()) );
//       session.save(tramite);
			
         // Cargo un trámite ya existente
         Tramite tramite2 = session.load(Tramite.class, 2);
			
         // Crear Avalúo, asignar Trámite y persistir Avalúo
         Avaluo avaluo2 = new Avaluo("Norte 2 #500");
         avaluo2.setTramite(tramite2);
         session.save(avaluo2);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Ejecutar la APP

![image](https://user-images.githubusercontent.com/23094588/128594227-623a2808-034c-4e12-8fb5-6686d75b28f6.png)

### Ver la BD

![image](https://user-images.githubusercontent.com/23094588/128594239-87927abc-72e2-49a4-ae45-bcc7fc98767c.png)

### GIT

![image](https://user-images.githubusercontent.com/23094588/128594432-dcdf605c-10cb-4481-8f14-ae68d401de39.png)

![image](https://user-images.githubusercontent.com/23094588/128594450-e3692b80-794b-4a5b-ab67-f7e5b28e50ca.png)

## Consulta de registros con clases anotadas con **`@OneToOne`** 04:16

Vamos a realizar otro ejercicio en **`TestOneToOne3`** donde vamos a consultar el Trámite de un Avalúo, ¿Qué es lo que tenemos que hacer? 

* Recuperar el Avalúo deseadp
* Obtener el Trámite de ese avaluo
* Mostrarlo en la consola

El código sería el siguiente:

```java
package com.javaocio.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Avaluo;
import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class TestOneToOne3 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         // Consulta del trámite de un avalúo
         Avaluo avaluo = session.load(Avaluo.class, 2);
         Tramite tramite = avaluo.getTramite();
         System.out.println("Trámite del Avalúo 2: " + tramite);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Ejecución de la APP

![image](https://user-images.githubusercontent.com/23094588/128594970-a9d0ffa0-1429-415e-b45e-14c42cf28eee.png)

### Segunda Consulta con Criteria

Ahora vamos a añadir otra consulta, vamos a recuperar todos los trámites que existen en todos los Avalúos.

```java
   . . .
   // Consulta de todos los trámites que aparecen en los avalúos
   CriteriaBuilder builder = session.getCriteriaBuilder();
   CriteriaQuery<Avaluo> criteria = builder.createQuery( Avaluo.class );
   Root<Avaluo> root = criteria.from( Avaluo.class );
   criteria.select( root );

   List<Avaluo> avaluos = session.createQuery( criteria ).getResultList();
   System.out.println("Todos los trámites contenidos en avalúos...");
   for(Avaluo avaluo2: avaluos) {
      System.out.println(avaluo2.getTramite());
   }
```

### Ejecución de la APP

![image](https://user-images.githubusercontent.com/23094588/128595451-a74aa72a-8c38-43d8-8597-74d39d894149.png)

### GIT

![image](https://user-images.githubusercontent.com/23094588/128595486-218f9a7c-135d-4155-a3b6-8858d261c95f.png)

## Actualizaciones en clases anotadas con **`@OneToOne`** 06:36

En esta lección vamos a hacer algunas operaciones en cascada y algunas actualizaciones con nuestras tablas que tenemos mapeados o asociadas en una relación ***Uno a Uno***.

Recordemos lo que tenemos en BD.

![image](https://user-images.githubusercontent.com/23094588/128595615-c134b4e1-5383-46c6-8d27-ca54bdc356a2.png)

![image](https://user-images.githubusercontent.com/23094588/128595627-66b8a1d4-4e9c-4f03-a496-73da29a9412d.png)

![image](https://user-images.githubusercontent.com/23094588/128595635-4af17890-3e55-4d95-ac95-9e00bdfa935a.png)

Tenemos dos Trámites y dos Avalúos cada uno con su Trámite asociado.

### Modificar un Avalúo

Lo primero que vamos a hacer como ejemplo **`TestOneToOne4`** es modificar la dirección de un Avalúo. 

```java
package com.javaocio.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Avaluo;
import com.javaocio.util.HibernateUtil;

public class TestOneToOne4 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         // Actualizar un avalúo
         Avaluo avaluo = session.load(Avaluo.class, 2);
         avaluo.setLugarAvaluo("Paseo de Reforma 255");
         session.update(avaluo);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Ejecutar APP

![image](https://user-images.githubusercontent.com/23094588/128596171-51e2aa38-f993-4d30-bc33-b0c1e00a4f85.png)

![image](https://user-images.githubusercontent.com/23094588/128596177-dd3b8549-71df-49d2-bb43-4cf9ac641e95.png)

### Eliminar un Avalúo

Lo que vamos a hacer ahora es eliminar el Avalúo 2. Otra operación del CRUD que ya habíamos visto, pero ahora lo estamos haciendo sobre Entidadas anotadas con **`@OneToOne`**.

```java
   . . .
   Avaluo avaluo = session.load(Avaluo.class, 2);
   session.delete(avaluo);
   . . .
```

### Ejecutando la APP

![image](https://user-images.githubusercontent.com/23094588/128596307-b041ab05-325a-4cbf-9ea8-a9e094f1b2e4.png)

### Revisando la BD

![image](https://user-images.githubusercontent.com/23094588/128596315-a4c9dbf8-6105-4b20-aa6f-2b4e43a79e39.png)

Ya no tenemos el Avalúo 2.

Si revisamos los Trámites seguimos teniendo los dos que teniamos.

![image](https://user-images.githubusercontent.com/23094588/128596333-ec46a53d-338a-4d10-a789-2ac1ad8881f7.png)


## Eliminación en Cascada.

Vamos a pensar que lo que queremos hacer es que cuando yo elimine un Trámite al mismo tiempo elimine su Avalúo asociado por ser una relación ***Uno a Uno***.

### Añadir la Eliminación de Cascada a `Tramite`.

Vamos a la Entidad **`Tramite`** y tenemos que añadir al código:

```java
   . . .
   @OneToOne(mappedBy = "tramite")
   private Avaluo avaluo;
   . . .
```

Lo siguiente

```java
   . . .
   @OneToOne(mappedBy = "tramite", cascade = CascadeType.REMOVE)
   private Avaluo avaluo;
   . . .
```

### Clase Test `TestOneToOne5`

En la clase **`TestOneToOne5`** vamos a meter el siguiente código para eliminar un Trámite. Recordemos lo que tenemos en la BD:

![image](https://user-images.githubusercontent.com/23094588/128596554-3be886b5-978b-4bfa-996a-3d824cdba7a7.png)

![image](https://user-images.githubusercontent.com/23094588/128596563-32ba3354-6b59-4653-a372-a706bb372a5c.png)

Tenemos el Avalúo 1 asociado al Trámite 1, por lo que eliminaremos el Trámite 1 y con lo que realizamos anteriormente se eliminara tabién el Avalúo 1.

El código es el siguiente:

```java
package com.javaocio.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class TestOneToOne5 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         // Eliminar un Trámite y en cascada elimina el Avalúo correspondiente 
         Tramite tramite = session.load(Tramite.class, 1);
         session.delete(tramite);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Ejecutar la APP

![image](https://user-images.githubusercontent.com/23094588/128596912-96dc6868-164b-475f-829a-9c3aea2f964e.png)

Hibernate a realizado dos **`deletes`** uno para Avalúo y otro para Trámite, lo que esperabamos.

### Viendo la BD

Si revizamos la BD tenemos:

![image](https://user-images.githubusercontent.com/23094588/128596968-a7c10fb9-09de-40b2-a51c-5df02dc888cd.png)


En Trámites se ha eliminado el Trámite 1.

![image](https://user-images.githubusercontent.com/23094588/128596976-6753a683-47c2-439e-bc65-1d00a3a8533a.png)

En Avalúos se ha eliminado el Avalúo 1 que era el asociado con el Trámite 1 y al aplicar la eliminación en Cascada se elimina automáticamente.

### GIT

![image](https://user-images.githubusercontent.com/23094588/128597043-a2747bfc-3e62-485e-a3c5-da7ca630d80c.png)

![image](https://user-images.githubusercontent.com/23094588/128597047-21a5ab22-08c1-43e3-a395-11427f297c9b.png)

## Actualización de la Base de Datos a V2 01:51

En esta lección vamos a actualizar nuestra base de datos y vamos a generar una nueva tabla para trabajar con las relaciones **Uno a Muchos***.

Recuerda el modelo original de la BD de una constructora.

![image](https://user-images.githubusercontent.com/23094588/128603862-d3ce50e6-fdb0-4b0a-a440-0ea121d4b0a5.png)

### Añadir tabla **`DiarioCliente`**

Vamos a añadir una tabla llamada **`DiarioCliente`**, tiene el propósito de poner el progreso de un proyecto y que el cliente los puede ver.

![image](https://user-images.githubusercontent.com/23094588/128604027-4269dd13-4d79-4f56-bee6-b9c5572e480c.png)

### Crear la relación Uno a Muchos de la tabla **`DiarioCliente`** con **`Tramite`**

Seleccionamos la relación ***Uno a Muchos*** y pulsamos en **`DiarioCliente`** y luego en **`Tramite`**.

![image](https://user-images.githubusercontent.com/23094588/128604129-c3cf71fa-8041-4dc0-99ae-377575dd6a89.png)

Al hacer esto genera una llave foranea **FK** en la tabla **`DiarioCliente`** llamada **`Tramite_idTramite`**

### Modificar la relación Uno a Muchos a Cero a Muchos

Vamos a dar Click derecho sobre la relación y vamos a dar en **`Edit Relation...`**

![image](https://user-images.githubusercontent.com/23094588/128604238-be6b0e1b-6912-4aef-b5d0-62bf560bd993.png)

![image](https://user-images.githubusercontent.com/23094588/128604257-e51d407a-5755-4d94-9139-51db29422b83.png)

Seleccionamos la pestaña **Foreing key** 

![image](https://user-images.githubusercontent.com/23094588/128604300-f64d9e8c-c251-4770-9dbc-263478dadf5c.png)

y vamos a desmarcar el Check **Mandatory**

![image](https://user-images.githubusercontent.com/23094588/128604331-103484bd-f3d7-4dca-885f-ca38b1c2fb2c.png)

Con esto la relación cambia a ***Cero o Muchos*** esto quiere decir que un Trámite tiene 0, 1 o Muchos Diarios de Clientes

La BD nos queda así:

![image](https://user-images.githubusercontent.com/23094588/128604415-a3be68f0-ab63-431d-b724-0559ffe2fa41.png)

Vamos a generar la BD con esta nueva tabla y relación, damos en ***Database / Forward Engineer...***

![image](https://user-images.githubusercontent.com/23094588/128604473-8771f263-91f2-4234-912d-dd83530236f0.png)

![image](https://user-images.githubusercontent.com/23094588/128604480-1671dc1d-a6f7-4084-855d-f329c49941e8.png)

![image](https://user-images.githubusercontent.com/23094588/128604503-e5b84266-18e7-47f4-bceb-9b4425716e85.png)

![image](https://user-images.githubusercontent.com/23094588/128604514-14ec8dfe-ad41-49a9-b49b-d59c2b581041.png)

![image](https://user-images.githubusercontent.com/23094588/128604523-647ced6c-af99-4b53-b19c-4a3666d7dcae.png)

![image](https://user-images.githubusercontent.com/23094588/128604531-0d317c5c-0f67-437f-a391-d83cf8bf1c1e.png)


### Revisando la BD

![image](https://user-images.githubusercontent.com/23094588/128604587-0e98d0c6-29dc-415e-b497-632ecfb9853a.png)

![image](https://user-images.githubusercontent.com/23094588/128604607-386e283e-5fdb-4ad4-b6f1-7874e06aeb7d.png)

![image](https://user-images.githubusercontent.com/23094588/128604618-903b8e5b-39b1-462a-bafe-eadc044dc60f.png)

![image](https://user-images.githubusercontent.com/23094588/128604631-229ef865-63f9-433a-b9d3-fed3adbb0466.png)

## Uso **`@OneToMany`** y **`@ManyToOne`** 10:13

### Crear la clase (Entidad) **`DiarioCliente`**

Vamos a crear en el paquete **`com.javaocio.domain`** la nueva clase para mapear la nueva tabla **`DiarioCliente`** que llamaremos **`DiarioCliente`**.

```java
package com.javaocio.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DiarioCliente")
public class DiarioCliente {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int idDiario;
	
   private String entradaDiario;
   private Timestamp fhcDiario;
	
   @ManyToOne
   @JoinColumn(name = "Tramite_idTramite")
   private Tramite tramite;

   public DiarioCliente() {

   }

   public DiarioCliente(String entradaDiario, Timestamp fhcDiario) {
      this.entradaDiario = entradaDiario;
      this.fhcDiario = fhcDiario;
   }

   public int getIdDiario() {
      return idDiario;
   }

   public void setIdDiario(int idDiario) {
      this.idDiario = idDiario;
   }

   public String getEntradaDiario() {
      return entradaDiario;
   }

   public void setEntradaDiario(String entradaDiario) {
      this.entradaDiario = entradaDiario;
   }

   public Timestamp getFhcDiario() {
      return fhcDiario;
   }

   public void setFhcDiario(Timestamp fhcDiario) {
      this.fhcDiario = fhcDiario;
   }

   public Tramite getTramite() {
      return tramite;
   }

   public void setTramite(Tramite tramite) {
      this.tramite = tramite;
   }

   @Override
   public String toString() {
      return "DiarioCliente [idDiario=" + idDiario + ", entradaDiario=" + entradaDiario + ", fhcDiario=" + fhcDiario
				+ ", tramite=" + tramite + "]";
   }
	
}
```

* Anotamos a la clase con las anotaciones **`@Entity`** y **`@Table(name = "DiarioCliente")`**
* Contiene las propiedades **`idDiario`**, **`entradaDiario`** y **`fhcDiario`**
* Anotamos la propiedad **`idDiario`** con **``** y **``** para indicar que es el ID y se genera automaticamente.
* Añadimos la propiedad **`tramite`** para crear la relación ***Uno a Muchos*** con la tabla **`Tramite`**, la anotamos con **`@ManyToOne`** para indicar que en esta Entidad esta el lado ***Muchos*** de la relación y también la anotamos con **`@JoinColumn(name="Tramite_idTramite"`** para indicar la llave foranea que en este caso es **`Tramite_idTramite`** 
* Generamos Construtor vacío
* Generamos Constructor para **`entradaDiario`** y **`fhcDiario`**
* Generamos los Getters y Setters para todas las propiedades
* Generar método **`toString`**

### Modificar `Tramite` para indicar la relación *Uno a Muchos*

Modificamos la clase **`Tramite`** añadiendo la siguiente propiedad:

```java
   . . .
   @OneToMany(mappedBy ="tramite")
   private Set<DiarioCliente> diarioClienteSet;
   . . .
```

* Añadimos una nueva propiedad **`diarioClienteSet`** la cual es un conjuto de objetos **`DiarioCliente`**
* Anotamos a la propiedad con **`@OneToMany(mappedBy ="tramite")`** para indicar que en la tabla **`Tramite`** tenemos el lado ***Uno*** de la relación como lo indica nuestro Modelo de Datos.
* ¿Tengo que crear su Getter y Setter y modificar el toString?
![image](https://user-images.githubusercontent.com/23094588/128605181-c9f6a7bc-76de-44bb-8b07-ebf4f2827e9c.png)

Con ambas anotaciones **`@OneToMany(mappedBy ="tramite")`** y **`@ManyToOne @JoinColumn(name = "Tramite_idTramite")`** logramos hacer el Mapping de las Tablas y tenemos una **RELACIÓN BIDIRECCIONAL**.

### Añadir la nueva Entidad **`DiarioCliente`** en **`hibernate.cfg.xml`**

Vamos a añadir la nueva Entidad en **`hibernate.cfg.xml`** añadiendo la siguiente línea de código:

```xml
   . . .
   <mapping class="com.javaocio.domain.DiarioCliente" />
   . . .
```

### Clase de Prueba `TestOneToMany` para probar la Relación Uno A Mucho 

* Vamos a crear 2 Trámites y los persistimos
* Creamos 3 Diarios del Cliente
* A cada Diario del Cliente le asignamos un Trámite (habra dos Diarios de Cliente con el mismo Trámite)

```java
package com.javaocio.test;

import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.DiarioCliente;
import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class TestOneToMany {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         Timestamp time = new Timestamp(new Date().getTime());
			
         // Crear 2 Trámites y persistirlos 
         Tramite tramite1 = new Tramite("Ampliación 1", time);
         Tramite tramite2 = new Tramite("Ampliación 2", time);
         session.save(tramite1);
         session.save(tramite2);
			
         // Crear 3 DiariosCliete, asignarle Trámites y persistirlos
         DiarioCliente diarioCliente1 = new DiarioCliente("Entrada 1", time);
         DiarioCliente diarioCliente2 = new DiarioCliente("Entrada 2", time);
         DiarioCliente diarioCliente3 = new DiarioCliente("Entrada 3", time);
			
         diarioCliente1.setTramite(tramite1);
         diarioCliente2.setTramite(tramite1);
         diarioCliente3.setTramite(tramite2);
			
         session.save(diarioCliente1);
         session.save(diarioCliente2);
         session.save(diarioCliente3);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Ejecutar la APP

![image](https://user-images.githubusercontent.com/23094588/128606209-99a41c89-4e72-4c4e-af33-e96bc522f8e0.png)

Ha hecho una serie de **`inserts`**

### Ver la BD

![image](https://user-images.githubusercontent.com/23094588/128606241-289107d1-378c-4bd0-96fc-3051034c56ac.png)

![image](https://user-images.githubusercontent.com/23094588/128606256-ba2b7654-c30f-44c5-9194-6c3c26e25647.png)

Con esto estamos asociando a un mismo Trámite varios Diarios de Cliente.

### Segundo Ejemplo `TestOneToMany2`

Si yo ya tengo un Trámite y le quiero asignar un nuevo Diario.

```java
package com.javaocio.test;

import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.DiarioCliente;
import com.javaocio.domain.Tramite;
import com.javaocio.util.HibernateUtil;

public class TestOneToMany2 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         Timestamp time = new Timestamp(new Date().getTime());
			
         // Recuperamos Trámite 
         Tramite tramite = session.load(Tramite.class, 2);
			
         // Crear nuevo DiariosCliete, asignarle Trámite y persistirlos
         DiarioCliente diarioCliente = new DiarioCliente("Entrada 4", time);
         diarioCliente.setTramite(tramite);
         session.save(diarioCliente);
			
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

### Probar APP

![image](https://user-images.githubusercontent.com/23094588/128606570-49d852ad-85d0-41e9-8708-126f464b7523.png)

### Ver BD

![image](https://user-images.githubusercontent.com/23094588/128606582-b625d45d-2531-4e1e-a3d0-ae354b18ebef.png)

Se añadio un nuevo Diario de Cliente con un Trámie ya existente.

### GIT

![image](https://user-images.githubusercontent.com/23094588/128606718-27ae33d2-5a97-4a5a-b5e4-130600510e65.png)

![image](https://user-images.githubusercontent.com/23094588/128606752-65840b3d-64c2-4d68-be58-a72e7379bceb.png)

## Creación de consultas para clases anotadas con **`@OneToMany`** 08:06

En esta lección vamos a realizar algunas consultas en nuestras tabla **`Tramite`** y **`DiarioCliente`** me tomé la libertad de poner un nuevo trámite y cambiar los tipos de los Trámites como se ve en la tabla.

![image](https://user-images.githubusercontent.com/23094588/128624043-9839dba8-4c08-44a6-847e-4ad0dc35a304.png)

La tabla **`DiarioCliente`** contiene lo siguiente:

![image](https://user-images.githubusercontent.com/23094588/128624064-b59a708a-8869-4862-a727-55dbc78bb2a5.png)

### Generar el archivo Metamodel Generator

Vamos ir a las propiedades del Proyecto 

![image](https://user-images.githubusercontent.com/23094588/128625535-389538e4-fccb-41e4-9c49-97a1b9d3870f.png)

Vamos a Maven y seleccionamos ***Annotation Processing***

![image](https://user-images.githubusercontent.com/23094588/128625562-3e278818-958e-4381-8d47-95c7f5a1fe12.png)

Aquí vamos a marcar las siguientes dos opciones:

* ***Enable project specific settings***
* ***Automatically configure JDT APT (builds faster, but outcome may differ from Maven buils)***

Vamos a presionar en ***Apply***

![image](https://user-images.githubusercontent.com/23094588/128625635-d698ac96-5b7f-4eb2-b4bf-b7f4843147a8.png)

Damos en ***Yes*** y ***OK***, con esto nos modifica la carpeta:

![image](https://user-images.githubusercontent.com/23094588/128625699-98975a9b-0281-4f8c-910c-cfa819b99b3a.png)

SE SUPONE QUE DENTRO CREARÍA UNOS ARCHIVOS GRACIAS A QUE TENEMOS ANOTADA NUESTA ENTIDAD CON JPA PERO NO LO HIZO, LAS HE METIDO MANUALMENTE.

![image](https://user-images.githubusercontent.com/23094588/128625887-ff473391-ec61-452c-948c-b2ccf13a72e8.png)

El contenido de los archivo son:

![image](https://user-images.githubusercontent.com/23094588/128625898-abb55894-e801-4a27-86ea-bcd3aa3970bb.png)

![image](https://user-images.githubusercontent.com/23094588/128625907-2b1650f4-c0b2-4c66-81b2-9d10c0877e9f.png)

![image](https://user-images.githubusercontent.com/23094588/128625915-5b5231c1-0cc8-4d01-9ac8-ab8b18db223a.png)


### Realizar la Consulta en `TestOneToMany3`

Vamos a realizar una Reunión Natural, eso lo hacemos muy sencillo con Criteria. En la documentación oficial hay un ejemplo de Criteria con **`Join`**

![image](https://user-images.githubusercontent.com/23094588/128624188-5be0eed0-84af-4915-8d6d-fe8295d25e36.png)

tal vez te resulta un poco complejo si es que no has trabajado antes con Criteria Hibernate. De hecho de la versión 4 a la versión 5 que es la que estamos trabajando cambió bastante el enfoque, me parece interesante sin embargo un poco más difícil de implementar. 

### Primera Consulta

Lo primero que vamos a consultar son todos los trámites que se encuentran en Diario del Cliente.

Del ejemplo copiamos las primeras 3 líneas y las adaptamos.

```java
package com.javaocio.test;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javaocio.domain.DiarioCliente;
import com.javaocio.domain.Tramite;
import com.javaocio.domain.Tramite_;
import com.javaocio.util.HibernateUtil;

public class TestOneToMany3 {

   /**
    * @param args
    */
   public static void main(String[] args) {
      Session session = HibernateUtil.getSessionFactory().openSession();
		
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
			
         //Consultar todos los Trámites que se encuentran en DiarioCliente
         CriteriaBuilder builder = session.getCriteriaBuilder();
         CriteriaQuery<Tramite> criteria = builder.createQuery( Tramite.class );
         Root<Tramite> root = criteria.from( Tramite.class );
			
         Join<Tramite, DiarioCliente> join = root.join(Tramite_.diarioClienteSet);
			
         criteria.select(root);
			
         List<Tramite> results = session.createQuery(criteria).getResultList();
         System.out.println("No Resultados: " + results.size());
         System.out.println(results);
					
         tx.commit();
      } catch (Exception e) {
         if(tx != null) {
            tx.rollback();
         }
         e.printStackTrace();
      } finally {
         session.close();
      }
   }
}
```

* Realizamos un **`Join`** el cual necesita dos parámetros que son las entidades necesarias para realizar esta "Reunión Natural" en este caso queda así **`Join<Tramite, DiarioCliente> join = root.join(Tramite_.diarioClienteSet)`**  el argumento **`Tramite_.diarioClienteSet`** es el objetivo para realizar el Join, con esta línea hemos realizado una reunión natural.
* Realizamos la consulta **`select`** de Criteria.
* Obtenemos la lista de resultados
* Imprimimos los resultados

### Ejecutar la APP

![image](https://user-images.githubusercontent.com/23094588/128626242-a2927ac8-d4a3-468c-812a-605e9b147710.png)

Simplemente sacamos el número de Trámites encontrados que son 4 y sus correspondientes valores:

```sh
No Resultados: 4
[Tramite [idTramite=1, tipoTramite=Ampliación, fhcTram=2021-08-07 17:59:21.0], 
 Tramite [idTramite=1, tipoTramite=Ampliación, fhcTram=2021-08-07 17:59:21.0], 
 Tramite [idTramite=2, tipoTramite=Crédito, fhcTram=2021-08-07 17:59:21.0], 
 Tramite [idTramite=2, tipoTramite=Crédito, fhcTram=2021-08-07 17:59:21.0]]
```

Me da 4 por que realmente esta haciendo una consulta de cada una de las filas de la tabla **`DiarioCliente`**

![image](https://user-images.githubusercontent.com/23094588/128626459-3e48715b-f1da-4563-88e0-57dc306332aa.png)

Si comentamos la sentencia **`Join`** solo me saca los 3 que existen en la tabla **`Tramite`**:

![image](https://user-images.githubusercontent.com/23094588/128626511-ed35cdf6-7b36-493d-bb2e-98dc6fa1e542.png)

```sh
No Resultados: 3
[Tramite [idTramite=1, tipoTramite=Ampliación, fhcTram=2021-08-07 17:59:21.0], 
 Tramite [idTramite=2, tipoTramite=Crédito, fhcTram=2021-08-07 17:59:21.0], 
 Tramite [idTramite=3, tipoTramite=Proyecto, fhcTram=2021-08-07 17:59:21.0]]
```

![image](https://user-images.githubusercontent.com/23094588/128626515-c7b8fa5f-caed-4cf2-b039-3d1b5255307d.png)

Con esto vemos la influencia de la sentencia **`Join`**.

### Evitar que los Trámites repetidos salgan

Volviendo al ejemplo del Join vamos a evitar que salgan los Trámites repetidos, esto se logra añadiendo a nuestra consulta **`.distinct(true)`**, nos queda así:

```java
criteria.select(root).distinct(true);
```

### Ejecutando la APP

![image](https://user-images.githubusercontent.com/23094588/128626660-458f34d6-3086-4c7f-9725-9576bba5e519.png)

Ya solo nos muestra los dos Trámites que aparecen en la tabla **`DiarioCliente`**.

```sh
No Resultados: 2
[Tramite [idTramite=1, tipoTramite=Ampliación, fhcTram=2021-08-07 17:59:21.0], 
 Tramite [idTramite=2, tipoTramite=Crédito, fhcTram=2021-08-07 17:59:21.0]]
```

### Consultar todos los Diarios de un Trámite en `TestOneToMany4`

Vamos a consultar todos los Diarios de un Trámite.

```java
```

* Ahora lo que vamos a consultar son **`DiarioCliente`**
* El Join va de **`DiarioCliente`** a **`Tramite`** y el Join lo hacemos a través de **`DiarioCliente_.tramite`**, la sentencia nos queda así **`Join<DiarioCliente, Tramite> join = root.join(DiarioCliente_.tramite);`**
* Aquí hay algo importante a considerar, necesitamos poner una clausula **`where`** donde el **`id`** sea al Trámite que deseamos ver en este caso 1 ó 2 que son los Trámites asociados a los Diarios de Clientes asociados. Pero recordar que en Hibernate no hablamos de columnas sino de objetos. La sentencia necesaria es:

   ```sh
      . . .
      criteria.where(
                   builder.equal(root.get(DiarioCliente_.tramite), session.load(Tramite.class, 1))
              );
      . . .	     
   ```
* Recuperamos el resultado 
* Imprimimos el resultado

### Ejecutar la APP

![image](https://user-images.githubusercontent.com/23094588/128627100-64c4dd8e-0869-4434-b9ba-c62da6b0884e.png)

En este caso obtenemos dos Diarios de Clientes cuyo Trámite asignado es el 1:

```sh
No Resultados: 2
[DiarioCliente [idDiario=1, entradaDiario=Entrada 1, fhcDiario=2021-08-07 17:59:21.0, tramite=Tramite [idTramite=1, tipoTramite=Ampliación, fhcTram=2021-08-07 17:59:21.0]], 
 DiarioCliente [idDiario=2, entradaDiario=Entrada 2, fhcDiario=2021-08-07 17:59:21.0, tramite=Tramite [idTramite=1, tipoTramite=Ampliación, fhcTram=2021-08-07 17:59:21.0]]]
```

### GIT

![image](https://user-images.githubusercontent.com/23094588/128627177-5c6da9ae-35af-4578-b35c-be3656b57354.png)

![image](https://user-images.githubusercontent.com/23094588/128627201-f3af45db-6dcd-4573-9112-b44f55697c99.png)

## Actualización de la B.D. a la V3 03:13

En esta lección vamos a actualizar nuevamente nuestra base de datos a la versión 3 esto con el propósito de crear una relación ***Muchos a Muchos***. Este tipo de relaciones se ocupan no tan frecuentemente como pensarías.

En nuestro Modelo vamos a añadir una tabla llamada **`Inmueble`** con los siguientes campos:

![image](https://user-images.githubusercontent.com/23094588/128627959-f3652a0f-0eee-485d-8c11-d1383bcebe0e.png)

Y vamos a crear otra tabla llamada **`Imagen`** que contendra los links de las imágenes de los Inmuebles, los campos son los siguientes:

![image](https://user-images.githubusercontent.com/23094588/128628051-677f8126-2dc5-4633-a28e-e34113898e4e.png)

Ahora vamos a crear la Relación entre ambas tablas, seleccionamos la relación ***N M*** y damos Click en  **`Inmueble`** y luego en **`Imagen`** y lo que tenemos es:

![image](https://user-images.githubusercontent.com/23094588/128628132-c7150d8b-2daf-462a-94df-a0225a84ae72.png)

Se nos ha creado una tabla que ayuda a realizar la Relación ***Muchos a Muchos***, esta tabla se conoce como "Mapa" y lo que indica es que Inmuebles estan asociados a que Imágenes o que Imágenes a que Inmuebles.

Vamos a cambiar el nombre que puso por default **`Inmueble_has_Imagen`** por **`InmuebleImagenMap`**.

También vamos a cambiar los campos que se crearon por defecto **`Inmueble_idInmueble`** por **`idInmueble`** y **`Imagen_idImagen`** por **`idImagen`**

![image](https://user-images.githubusercontent.com/23094588/128628298-8429027f-c166-443a-abd0-85c27f22d95b.png)

Finalmente seleccionamos la relación de la tabla **`Inmueble`** con **`InmuebleImagenMap`** y damos botón derecho y seleccionamos ***Edit Relationsship...***

![image](https://user-images.githubusercontent.com/23094588/128629273-ec88ad02-ff3b-4384-b010-f5b4fd2b8f9e.png)

Seleccionamos la pestaña ***Foreing Key***

![image](https://user-images.githubusercontent.com/23094588/128629294-789ba54e-8879-4ef4-aebd-f2513646f0c3.png)

Vamos a quitar la opción ***Mandatory***

![image](https://user-images.githubusercontent.com/23094588/128629331-86ca7b4c-ac0e-4a7f-800d-d9fb72d039b2.png)

Hacemos lo mismo para la relación entre la tabla **`Imagen`** con **`InmuebleImagenMap`**.

![image](https://user-images.githubusercontent.com/23094588/128629376-fd9341e1-1b44-4c18-a213-ae4070f20566.png)

Nuestra Relación ***Mucho a Mucho*** es:

![image](https://user-images.githubusercontent.com/23094588/128629427-8aa96d60-3293-47e4-a66c-1ebfacacf7f0.png)

Nuestro Modelo final nos queda así:

![image](https://user-images.githubusercontent.com/23094588/128629414-af607270-f712-4140-888e-1d47dfe5b002.png)

Vamos a seleccionar ***Database / Forward Engineer ...***

![image](https://user-images.githubusercontent.com/23094588/128629457-165affb0-5784-40ad-bf51-71936ce9a1ed.png)

![image](https://user-images.githubusercontent.com/23094588/128629494-c4810bd9-b25d-462b-9480-fd0cd994e354.png)

![image](https://user-images.githubusercontent.com/23094588/128629513-787e6e78-ec87-4c7c-9101-a3f3e6cef6f9.png)

![image](https://user-images.githubusercontent.com/23094588/128629521-18a07a17-dd6f-450b-a553-bd0833761830.png)

![image](https://user-images.githubusercontent.com/23094588/128629532-0046a0a5-1a51-4fa1-bc13-aaea2cf98594.png)

![image](https://user-images.githubusercontent.com/23094588/128629538-f4783ca5-2d92-4223-9591-1d00caef111f.png)

Las tablas se han creado:

![image](https://user-images.githubusercontent.com/23094588/128629563-30570101-8ae7-4fbb-b184-19f76d2adebb.png)

Todos los datos de las tablas se han eliminado.

## Uso de **`@@ManyToMany`** 13:19

**``**
**``**
**``**

## Creación de consultas para clases anotadas con **`@@ManyToMany`** 10:49
## Actualizaciones en clases anotadas con **`@@ManyToMany`** 10:49
