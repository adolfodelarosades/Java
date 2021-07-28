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




entonces esto nos va a quedar así.

Yo tengo un trámite que tiene un tipo de trámite y fecha de creación un avalúo que tiene su Heydi el

lugar donde se hizo el avalúo opcionalmente un trámite Un trámite.

Vamos a salvar nuestro modelo y lo que vamos a hacer ahora es irnos al menú

ingenié aquí nos va a pedir una conexión si no tienes una conexión hacemos Losilla

queremos una conexión y lo vas a poner por ejemplo conexión dejases total cual 33 06 127 001 Rut le

das ok desconexión para que te diga conexión.

Para mi chairs correct y ok entonces regreso aquí me voy otra vez a Junior y podría elegir test conexión

y ya tengo uno que se llama persistence precisamente para este curso.

Otra cosa importante es que el esquema o la base de datos por defecto es bidi que es la que acabamos

de crear.

Vamos a darle siguiente vamos a borrar la base antes de crearla porque vamos a ir modificando durante

el curso

y no existe despliegue porque apenas vamos a crear esta para generar el script que puedes copiar se

gustas si estás usando alguna otra tecnología también es válido y continúa

No existe Vidia entonces simplemente vamos si y le quitamos defaults Kimba a ser el siguiente viente

siguiente y ya creó nuestra base de datos como comprobamos saberle closely a mi conexión que yo ya tenía

Levada en este y de información si te das cuenta es lo mismo que tú tenías

la batería nuevamente entonces esta conexión se llama aullaban persistes y el esquema por donde estés

me deja

ok.

Si yo entro en Java persistent como ves aquí están tablas este caso claro que no tiene nada si lo de

aquí Inquiry no hay nada pero está comprobado que la base de datos está creada con esta base de datos

en las clases posteriores vamos a configurar Giverny que es el primer framework de persistencia de datos

que estás usando y hacer algunas operaciones.

Si tienes cualquier documentario puedes contactarme en esta plataforma en nuestro correo contacto arroba

nóbeles puntocom o en mi correo personal Avram arroba nobeles puntocom hasta la próxima.

## Creación del Proyecto en Eclipse 04:39
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
