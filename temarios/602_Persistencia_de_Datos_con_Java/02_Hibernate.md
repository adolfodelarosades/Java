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

Vamos a abrir la vista de Maiven.

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

Y aquí vamos a buscar **`hibernate-core`**




s a dar Repilado índex esto es por si no te hace las búsquedas en los repositorios de la primera que vamos a usar es Hibernate Cord Hibernate aquí vamos a usar la versión 5 de Jaione y debe ser por Hibernate.

Puede haber otras pero nosotros vamos a usar la versión oficial es por Hibernate.

Vamos a darle la segunda va a ser Hibernate balita y otro Bernet y también va a ser en la versión 2.4 que es la estable también vamos a usar Bernet Entity manager igual de Android 5.1.1 y finalmente como vamos a trabajar con basaltos Esquivel y si usamos buscamos el conector de Maisí.

Entonces este debe ser el que dice Aquí Java y te recomiendo la versión 5 porque en la realidad a nosotros nos ha dado un poco de problemas la versión 6 no está muy seguro si son bugs pero nos da un poco de problemas en las implementaciones así que yo te recomiendo ampliamente por lo pronto hasta que se estabilice un poco más o hasta que puedas subir un vídeo de algunas soluciones que hemos propuesto usar la versión 5 ahora le vamos a dar Fael SOIB y en este momento Fijate que acá se parece a una barrita.

Yo ya las tengo descargadas pero esto es lo que va a hacer es descargar todas estas dependencias conector másico el conector y todas estas ya están en nuestro proyecto si ya están listas para usarse entonces con estas dependencias nosotros ya podemos ahora sí crear las clases para configurar Jailbreak en nuestras próximas elecciones.

Vamos a continuar con la configuración de Giverny y hacer algo así hasta la próxima.
## Configuración previa de Hibernate 06:20
## Mapping Hibernate mediante XML 12:29
## Uso del método **`save`** 07:47
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
