# 2 Hibernate 02:40:14

* Creación de la B.D. 06:25
* Creación del Proyecto en Eclipse 04:39
* Configuración previa de Hibernate 06:20
* Mapping Hibernate mediante XML 12:29
* Uso del método save 07:47
* Uso de anotaciones JPA en Hibernate 04:01
* Creación de una consulta personalizada con HQL 02:50
* Consultando todos los registros con HQL 04:49
* Consulta de todos los registros con Criteria 06:34
* Consultas personalizadas con Criteria 04:52
* Uso de los métodos update y saveOrUpdate 09:09
* Consultas anidadas con Criteria 07:35
* Consultando campos personalizados con Tuple 04:21
* Uso de @OneToOne 09:11
* Consulta de registros con clases anotadas con @OneToOne 04:16
* Actualizaciones en clases anotadas con @OneToOne 06:36
* Actualización de la Base de Datos a V2 01:51
* Uso @OneToMany y @ManyToOne 10:13
* Creación de consultas para clases anotadas con @OneToMany 08:06
* Actualización de la B.D. a la V3 03:13
* Uso de @ManyToMany 13:19
* Creación de consultas para clases anotadas con @ManyToMany 10:49
* Actualizaciones en clases anotadas con @ManyToMany 10:49

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
<hibernate-mapping package="com.novellius.domain">
   <class name="Tramite" table="Tramite">
      <!-- Mapping del id -->
      <id name="idTram" column="idTram">
         <generator class="native"/>
      </id>
		
      <!-- Mapping del resto de las filas -->
      <!-- <property name="tipoTram" type="string" column="tipoTram"/> -->
      <property name="tipoTram" type="string" />
      <property name="fhcTram" type="timestamp" />
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
      session.save(tramite);	// insert into Tramite (tipoTram, fhcTram) values (?, ?)
				
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





O sea el Jeunet ya sabe qué propiedad de nuestra clase IAVA está asociada a qué dato a qué fila de nuestra

base de datos entonces con esto es suficiente vamos a ejecutar esta clase concederla aquí en ejecutar

como ves lo que hizo fue ser tramité bla bla bla.

Es más voy a pegar esto aquí

de referencia.

Y ahora simplemente vamos a ir a nuestra base de datos y voy a abrir mi conexión de Chava persistes

y voy a buscar la tabla tramité y como ves se insertaron nuestros datos en la base de datos.

Esta es la magia de Jaime no podemos simplificaron más con las anotaciones y eso es lo que precisamente

haremos en nuestra próxima clase recuerda cualquier duda documentario.

Puedes buscarme en esta plataforma en nuestro correo de contacto.

Rubén nóveles puntocom y en mi correo Avram arroba en Nouvelles por lo cual hasta la próxima.
## Uso de anotaciones JPA en Hibernate 04:01
## Creación de una consulta personalizada con HQL 02:50
## Consultando todos los registros con HQL 04:49
## Consulta de todos los registros con Criteria 06:34
## Consultas personalizadas con Criteria 04:52
## Uso de los métodos **`update`** y **`saveOrUpdate`** 09:09
## Consultas anidadas con Criteria 07:35
## Consultando campos personalizados con Tuple 04:21
## Uso de **`@OneToOne`** 09:11
## Consulta de registros con clases anotadas con **`@OneToOne`** 04:16
## Actualizaciones en clases anotadas con **`@OneToOne`** 06:36
## Actualización de la Base de Datos a V2 01:51
## Uso **`@OneToMany`** y **`@ManyToOne`** 10:13
## Creación de consultas para clases anotadas con **`@OneToMany`** 08:06
## Actualización de la B.D. a la V3 03:13
## Uso de **`@@ManyToMany`** 13:19
## Creación de consultas para clases anotadas con **`@@ManyToMany`** 10:49
## Actualizaciones en clases anotadas con **`@@ManyToMany`** 10:49
