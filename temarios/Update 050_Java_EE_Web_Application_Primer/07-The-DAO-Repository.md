# 7. El DAO/Repository

Bullhorn requiere dos tablas, para usuarios y publicaciones(users and posts). Crearemos estas tablas en Oracle y las llamaremos **`Bhuser`** y **`Bhpost`**, respectivamente. La tabla de **user**(usuarios) necesitará los siguientes campos: **user name**(nombre de usuario), **user email**(correo electrónico del usuario), **password**(contraseña), **motto**(lema) y **join date**(fecha de inscripción). La tabla de **posts**(publicaciones) contendrá campos para el **post text**(texto de la publicación), la **post date**(fecha de la publicación) y la **ID of the user**(identificación del usuario) que creó la publicación. Cada tabla también contendrá un campo de **ID** para identificar de forma única cada registro. Podemos indicarle a SQL Developer que construya las tablas ejecutando scripts. Simplemente ingrese el texto que se ve en el Listado 7-1 en SQL Developer dentro de una nueva hoja de trabajo SQL.

**Listado 7-1 Definición de datos para la tabla Bhuser**

```sql
CREATE TABLE BHUSER
   ("BHUSERID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE,
        "USERNAME" VARCHAR2(50 BYTE) NOT NULL,
        "USERPASSWORD" VARCHAR2(50 BYTE),
        "MOTTO" VARCHAR2(100 BYTE) NOT NULL,
        "USEREMAIL" VARCHAR2(100 BYTE) NOT NULL,
        "JOINDATE" DATE NOT NULL,
         PRIMARY KEY ("BHUSERID")
   ) ;
```

Ahora que tenemos un lugar para almacenar a nuestros usuarios, podemos agregar otra tabla en la que almacenar las publicaciones. El SQL para crear la tabla **Bhpost** se muestra en el Listado 7-2. Lo ingresará en SQL Developer en una hoja de trabajo SQL. Muchos desarrolladores usan la misma hoja de trabajo SQL e ingresan cada tabla una debajo de la otra. Una vez que el SQL esté en una hoja de trabajo SQL, resalte las declaraciones y presione las teclas **CTRL + Enter** juntas. Primero cree la tabla **Bhuser** ya que la tabla **Bhpost** contiene una clave externa que representa el **BhuserId** en la tabla **Bhuser**.

**Listado 7-2 SQL para crear la tabla Bhpost**

```sql
CREATE TABLE BHPOST
   ("POSTID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE,
        "POSTDATE" DATE NOT NULL,
        "POSTTEXT" VARCHAR2(141 BYTE) NOT NULL,
        "BHUSERID" NUMBER NOT NULL,
         PRIMARY KEY ("POSTID")
   );
```

A continuación, es posible que desee ingresar algunos datos de prueba. Los Listados 7-3 y 7-4 muestran algunas declaraciones que puede ejecutar. Ingrese el SQL en SQL Developer, resalte las declaraciones y presione **CTRL + Enter**.

**Listado 7-3 Sentencias SQL para ingresar datos de prueba para la tabla Bhuser**

```sql
Insert into BHUSER (USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values ('user 1','password','motto for user 1','user1@domain.com',to_date('18-JUN-16','DD-MON-RR'));
Insert into BHUSER (USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values ('user 2','password','motto for user 2','user2@domain.com',to_date('22-JUL-15','DD-MON-RR'));
Insert into BHUSER (USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values ('user 3','password','motto for user 3','user3@domain.com',to_date('31-DEC-16','DD-MON-RR'));
Insert into BHUSER (USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values ('user 4','password','motto for user 4','user4@domain.com',to_date('22-JAN-17','DD-MON-RR'));

-- commit saves the data to the database
commit;
```

**Listado 7-4 Sentencias SQL para ingresar datos de prueba para la tabla Bhpost**

```sql
Insert into BHPOST (POSTDATE,POSTTEXT,BHUSERID) values (to_date('18-JUN-17','DD-MON-RR'),'This is a test post',1);
Insert into BHPOST (POSTDATE,POSTTEXT,BHUSERID) values (to_date('21-AUG-17','DD-MON-RR'),'Bullhorn is a fun program!',2);
Insert into BHPOST (POSTDATE,POSTTEXT,BHUSERID) values (to_date('30-JUL-17','DD-MON-RR'),'Hello, I am posting something',2);

-- commit saves the data to the database
commit;
```

Si necesita recrear las tablas, puede simplemente eliminarlas ejecutando las dos líneas siguientes en una hoja de cálculo SQL (Listado 7-5).

**Listado 7-5 Sentencias SQL para eliminar tablas y datos existentes**


```sql
DROP TABLE BHPOST;
DROP TABLE BHUSER;
```

Ahora que ha creado sus tablas y ha ingresado algunos datos de prueba en Oracle, es hora de volver a Eclipse y conectar su proyecto a la base de datos. Usaremos la API de persistencia de Java (JPA) **Java Persistence API (JPA)** para esto.

## Implementar la Java Persistence (JPA)

**Java Persistence API (JPA)** es un conjunto de estándares que especifican cómo Java se conectará a una base de datos mediante entidades, también conocidas como **POJO** (**plain old Java objects**). Cada entidad representa una sola fila en nuestra tabla de base de datos. JPA trata los objetos de la base de datos como objetos Java. Nuestro programa simplemente interactúa con la entidad, que a su vez interactúa con la base de datos.

A veces tenemos una tabla que contiene datos de otras tablas. Por ejemplo, un **post**(publicación) en la tabla **Bullhorn** contendrá un **user ID** que identifica al usuario que envió la publicación. Con JPA, la **ID** se reemplaza con el objeto **`User`** completo, lo que le permite acceder a todos los datos sobre el usuario desde la entidad **`Post`**.

JPA le permite utilizar sus habilidades de programación orientada a objetos para trabajar con una base de datos. Además, hace que todas las bases de datos tengan el mismo aspecto para su programa. JPA es una especificación de mapeo relacional de objetos. Se encarga de los detalles de conexión a la base de datos. Usted establece los valores de varios parámetros para su base de datos existente y JPA hará el resto. Las herramientas Eclipse JPA examinan las tablas y crean una clase para cada una. El nombre de la clase se basa en el nombre de la tabla. Usaremos las herramientas **Eclipse JPA** para crear la clase y sus getters y setters. Los campos de clase se asignan a los campos de la tabla. Cada clase representa una tabla en su base de datos. Una instancia de una clase representa un registro o fila en la tabla. Las herramientas **Eclipse JPA** manejarán secuencias y claves de identidad. También manejarán las relaciones de las tablas. Cuando su tabla contiene una foreign key para otro registro en otra tabla de la base de datos, su clase contendrá una instancia del objeto que representa la tabla de la foreign key. Por ejemplo, una columna **`userID`** en su tabla **`Posts`** se convierte en un objeto **`User`** incrustado en su clase de **`Posts`**.

Una ventaja de usar JPA es que podemos cambiar la base de datos sin cambiar nuestro código Java. La información de la base de datos se almacena en un archivo XML, que se puede editar sin tener que volver a compilar la aplicación. Puede comenzar escribiendo su aplicación usando **MySQL** y luego, a medida que crezca, pasar a Oracle sin ningún cambio en el código de su aplicación.

Las consultas en JPA están escritas en un lenguaje llamado **JPQL (Java Persistence Query Language)**. Este idioma es el mismo para todas las bases de datos.

Para implementar JPA necesitamos configurar un archivo llamado **`persistence.xml`**. Este archivo debe encontrarse en la carpeta del código fuente de Java en una carpeta llamada **`META-INF`**. Eclipse usa esa configuración para generar las clases de entidad. Después de eso, crearemos clases auxiliares para nuestra aplicación.

El primer paso es copiar tres archivos **JAR** a la carpeta **`WEB-INF\lib`** de su proyecto. Los archivos **JAR** para este proyecto se incluyen con la descarga del código. También se pueden encontrar en la carpeta **`WEB-INF\lib`** de la aplicación **Bullhorn**. Los archivos **JAR** se denominan **`eclipselink.jar`**, **`javax.persistence_2.1.0.v201304241213.jar`** y **`ojdbc6.jar`**.

<img width="1252" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/8ebbf13c-1ddb-4c97-b86a-b5d0643eb6cc">

<hr>

**Nota**

Coloque los siguientes archivos **JAR** en la carpeta **`WEB-INF\lib`**: **`eclipselink.jar`**, **`javax.persistence_2.1.0.v201304241213.jar`** y **`ojdbc6.jar`**. Es posible que cualquier otra ubicación no funcione. Puedes incluir los otros archivos **JAR** que encuentres en Bullhorn al mismo tiempo. Los usaremos más tarde.

<hr>

## El archivo `Persistencia.xml`

Para configurar JPA, necesitamos crear el archivo **`persistence.xml`**. En Eclipse, hay algunas formas de crear dicho archivo, pero lo crearemos en el directorio **`src`** llamado **`META-INF`**. Esta ubicación particular es requerida por la especificación JPA. Puede ser cualquier archivo de texto, que completará con los valores que se muestran en la Tabla 7-1. ¿No tienes ganas de escribirlo todo? Puede copiar el archivo desde la descarga que acompaña a este libro. Los valores que necesita cambiar se detallan en la tabla. Es posible que deba modificarlos como se muestra.

**Tabla 7-1 Configuración de los elementos del archivo Bullhorn `persistence.xml`**

<img width="629" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/e1316055-caa3-4b27-b25f-6f45b1302a39">

El Listado 7-6 muestra el archivo `persistence.xml` completo.

**Listado 7-6 Ejemplo de archivo `persistence.xml` que detalla todas las configuraciones JPA**

<img width="623" alt="image" src="https://github.com/adolfodelarosades/Java/assets/23094588/3bf055ac-eda9-47e8-9ce1-38fcbc370807">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.1" xmlns:=
"http://xmlns.jcp.org/xml/ns/persistence" xmlns:xsi=
"http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation=
"http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/
persistence_2_1.xsd">

<persistence-unit name="Bullhorn" transaction-type="RESOURCE_LOCAL">
<provider>
org.eclipse.persistence.jpa.PersistenceProvider                
</provider>
<class>model.Bhpost</class>
<class>model.Bhuser</class>
<exclude-unlisted-classes>
False                
</exclude-unlisted-classes>

<properties>
<property name="javax.persistence.jdbc.url" value="jdbc:oracle:thin:@localhost:1521:ora1"/>

<property name="javax.persistence.jdbc.user" value="system"/>

<property name="javax.persistence.jdbc.driver" value="oracle.jdbc.OracleDriver"/>

<property name="javax.persistence.jdbc.password" value="password"/>
</properties>
</persistence-unit>
</persistence>
```

<hr>

**Recordar**

El archivo **`peristence.xml`** pertenece al directorio **`META-INF`** que se encuentra debajo del directorio **`src`**. Esta ubicación es obligatoria.

<hr>

Una vez que haya configurado su archivo **`persistence.xml`**, estará listo para permitir que Eclipse genere automáticamente las entidades a partir de las tablas de su base de datos. Para hacer esto, haga clic derecho en el nombre del proyecto y seleccione "New". Luego, navegue hasta el menú JPA para **JPA Entities from Tables**. El cuadro de diálogo resultante utilizará la información de su archivo **`persistence .xml`** para conectarse a la base de datos y generar una clase Java para cada tabla. Su programa utilizará estas clases de Java (y el archivo **`persistence .xml`**) para buscar, agregar, editar y eliminar registros en la base de datos.

## Las JPA Entities

```java
package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@NamedQuery(name="Bhuser.findAll", query="SELECT b FROM Bhuser b")
public class Bhuser implements Serializable {
        private static final long serialVersionUID = 1L;

        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private long bhuserid;

        @Temporal(TemporalType.DATE)
        private Date joindate;

        private String motto;
        private String useremail;
        private String username;
        private String userpassword;

        //bi-directional many-to-one association to Bhpost
        @OneToMany(mappedBy="bhuser")
        private List<Bhpost> bhposts;

        public Bhuser() {
        }
        public long getBhuserid() {
                return this.bhuserid;
        }
        public void setBhuserid(long bhuserid) {
                this.bhuserid = bhuserid;                                                          
        }
        public Date getJoindate() {
                return this.joindate;
        }
        public void setJoindate(Date joindate) {
                this.joindate = joindate;
        }
        public String getMotto() {
                return this.motto;
        }
        public void setMotto(String motto) {
                this.motto = motto;
        }
        public String getUseremail() {
                return this.useremail;
        }
        public void setUseremail(String useremail) {
                this.useremail = useremail;
        }
        public String getUsername() {
                return this.username;
        }
        public void setUsername(String username) {
                this.username = username;
        }
        public String getUserpassword() {
                return this.userpassword;
        }
        public void setUserpassword(String userpassword) {
                this.userpassword = userpassword;
        }
        public List<Bhpost> getBhposts() {
                return this.bhposts;                                                          
        }
        public void setBhposts(List<Bhpost> bhposts) {
                this.bhposts = bhposts;
        }
        public Bhpost addBhpost(Bhpost bhpost) {
                getBhposts().add(bhpost);
                bhpost.setBhuser(this);

                return bhpost;
        }
        public Bhpost removeBhpost(Bhpost bhpost) {
                getBhposts().remove(bhpost);
                bhpost.setBhuser(null);
                return bhpost;
        }
}
```

```java
package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@NamedQuery(name="Bhpost.findAll",
     query="SELECT b FROM Bhpost b")
public class Bhpost implements Serializable {
        private static final long serialVersionUID = 1L;

        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private long postid;
        @Temporal(TemporalType.DATE)
        private Date postdate;
        private String posttext;

        //bi-directional many-to-one association to Bhuser
        @ManyToOne
        @JoinColumn(name="BHUSERID")
        private Bhuser bhuser;
        public Bhpost() {
        }

        public long getPostid() {
                return this.postid;
        }
        public void setPostid(long postid) {
                this.postid = postid;
        }
        public Date getPostdate() {
                return this.postdate;
        }
        public void setPostdate(Date postdate) {
                this.postdate = postdate;
        }
        public String getPosttext() {
                return this.posttext;
        }
        public void setPosttext(String posttext) {
                this.posttext = posttext;
        }
        public Bhuser getBhuser() {
                return this.bhuser;
        }

        public void setBhuser(Bhuser bhuser) {
                this.bhuser = bhuser;                                                           
        }
}
```