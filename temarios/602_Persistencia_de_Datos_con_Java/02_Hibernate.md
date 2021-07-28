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



bajo vamos a dar Fáil Saif nos ha

pedido salvar nuestro modelo.

Yo le voy a poner aquí Java existence Versión 1.

Esta va a estar disponible en la clase claro y vamos a hacer ver nuevamente ahora es momento de insertar

nuestras tablas para eso es hacer click aquí en Pleiss nuevo y la primera que nos pide el cliente se

llama trámite.

Este es un trámite que está siendo persona que llega a la constructora.

Esto puede ser un avalúo puede ser un crédito y muchos más no nos vamos a poner en trámite.

Le pusimos hoy esta va a ser no es nula y es nuestra llave primaria.

Recuerda que esto es las reglas esto empaten las reglas que vimos anteriormente en la teoría.

No nos vamos a dejar dos campos tipo trámite marchar 45 y vamos a poner fecha y hora de creación de

este trámite y este va a ser tipo de

voy a dejar otra tabla que en esta primera versión para empezar con las relaciones uno a uno pero para

esto vamos a crear otra tabla que es avaluar que este es un avalúo comercial vamos a ponerle Heydi aval

y le decimos que no es Molo vamos a poner el lugar del avalúo.

Este parchar va a ser 100 y listo.

Ahora vamos a crear una relación entre estas dos tablas es decir yo quiero que quien avalúo aparezca

en la ID del trámite que corresponda.

Para eso vamos a dar click

al revés perdón desde Belu como ves hay una relación de uno a uno donde evaluó Yo voy a tener el aire

del trámite.

Claro que este puede ser nulo en base a las reglas que hemos visto para modificar esto vamos a ponerlo

aquí

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
