# UNIDAD 5: HIBERNATE

## Objetivos

Diseñar e implementar arquitecturas JAVA.

## Duración

120 minutos.

## Contenido

1. Introducción a Hibernate
   * 1.1 Explicación detallada del problema con la API estándar de Java para la conectividad con base de datos (JDBC)
   * 1.2 Desarrollo de una aplicación
   * 1.3 Mapeos o 'Mappings'
   * 1.4 Como configurar una conexión a la base de datos
   * 1.5 Crear las definiciones de mapeo
   * 1.6 Persistiendo los objetos
   * 1.7 Creando el método de Java para persistencia
   * 1.8 Probando que hemos persistido correctamente al objeto
2. Hibernate
   * 2.1 Arquitectura de Hibernate
   * 2.2 Modularidad en Hibernate
   * 2.3 Contenidos del paquete de instalación de Hibernate
   * 2.4 Tutorial de Hibernate usando su API nativa y mapeo objeto relacional a través del archivo hbm.xml
   * 2.5 El archivo XML de mapeo de una aplicación de Hibernate
   * 2.6 Estrategias para la generación de identificadores
   * 2.7 Persistencia de objetos con el API de Hibernate
   * 2.8 Transacciones
3. Clases mapeadas
4. Consultas contra la Base de datos
   * 4.1 Cláusula FROM
      * 4.1.1 Asociaciones explicitas
      * 4.1.2 Asociaciones Implícitas
   * 4.2 Clausula SELECT
5. Mapeo de asociaciones
   * 5.1 Uno a muchos o muchos a uno
   * 5.2 Uno a uno
   * 5.3 Muchos a Muchos
6. Mapeo de herencias
   * 6.1 Una tabla para toda la jerarquía de clases
   * 6.2 Una tabla para cada subclase
   * 6.3 Una tabla para cada clase
7. Trabajo con objetos
8. Mapeo de herencias
   * 8.1 El problema de las N + 1 selects
   * 8.2 Solución con left join fetch
   * 8.3 Usar cachés para evitar leer los mismos datos varias veces
   * 8.4 Realizar actualizaciones y eliminaciones en masa

## Introducción

Para llevar a cabo casi cualquier proyecto de programación que involucre el almacenamiento de información, necesitamos una base de datos relacional en la cual las entidades se representen como filas en una tabla, en especial para el desarrollo de proyectos web.  

Por otro lado, tenemos que el paradigma más usado para programar aplicaciones -conocido como programación orientada a objetos- es incompatible con el sistema de bases de datos relacionales, ya que los objetos no se pueden persistir directamente en una base de datos por la llamada incompatibilidad objeto-relacional u ORM.   

En la siguiente imagen se puede apreciar la representación del mapeo objeto-relacional: los atributos de la clase Usuario corresponden con una columna de la tabla asociada. Cada fila de la tabla es una instancia diferente del objeto Usuario.        
<img src="images/c5/5-mapeo.png">

La biblioteca de Java Hibernate se escribió para resolver este problema, al permitir la persistencia de objetos Java en bases de datos relacionales y a su vez al establecer una representación de las entidades en una base de datos relacional como objetos simples de Java con los que el programador pueda trabajar.   

En este sentido, Hibernate es una herramienta de mapeo objeto relacional u ORM.  

Además de Hibernate, Java ya cuenta con una herramienta para la persistencia de objetos conocida como la interfaz de programación de aplicaciones para la conectividad con bases de datos o Java Database Connectivity (JDBC), la cual también puede usarse para la persistencia de objetos.   

Sin embargo, la API JDBC utiliza cláusulas SQL y por tanto es una herramienta de bajo nivel, mientras que Hibernate utiliza solamente el lenguaje orientado a objetos para persistir, consultar y recuperar objetos de una base de datos relacional.        
### Mapa Conceptual


<img src="images/c5/5-mapa-1.png">

<img src="images/c5/5-mapa-2.png">

## 1. Introducción a Hibernate

Es necesaria la persistencia de objetos en cualquier aplicación. Las bases de datos relacionales son la herramienta más usada y con mayor trayectoria para este propósito. Por este motivo, si se desea realizar la persistencia de objetos con dicha herramienta, será necesario hablar con más profundidad acerca de la incompatibilidad entre el paradigma de la programación orientada a objetos y el de las bases de datos relacionales.        

<img src="images/c5/5-logo-hibernate.png">

Mencionaremos los elementos más importantes de esta incompatibilidad a continuación: 

1. La herencia, es aquella propiedad del paradigma orientado a objetos que nos permite construir nuevos objetos a partir de objetos similares ya existentes y no se puede implementar en el modelo relacional de las bases de datos.  

2. Es difícil representar un conjunto complejo de asociaciones entre objetos en una base de datos relacional. 

3. No se pueden plasmar completamente propiedades de los objetos, como su identidad, en una base de datos. 

La interfaz de programación de aplicaciones para la conectividad con bases de datos o Java Database Connectivity (JDBC), de la que hemos hablado anteriormente, no resuelve estos problemas, mientras que Hibernate está especialmente diseñado para tratar con los puntos antes mencionados.       

##### Recuerda

Una API (del inglés Application Programming Interface) o Interfaz de Programación de Aplicaciones es una librería de funciones que generalmente se usa para comunicar varios componentes de un software o para establecer comunicación entre dos o más programas escritos en lenguajes de programación diferentes. 

### 1.1 Explicación detallada del problema con la API estándar de Java para la conectividad con base de datos (JDBC)

Antes de pasar a explorar Hibernate en detalle, veamos un ejemplo del tipo de problema cuya resolución provocó el desarrollo de Hibernate.   Supongamos que tenemos una tienda, donde el objetivo es que tengamos un sistema informático en el cual podamos registrar el inventario de todos los artículos de nuestra tienda y que nuestro inventario se actualice cada vez que se vende un artículo.   Para esto creamos una aplicación Java que plasme nuestro inventario en una base de datos, y que nos permita modificar dicho inventario a través de operaciones sobre esta base de datos.        

<img src="images/c5/5-jdbc.png">

### 1.2 Desarrollo de una aplicación

Consideremos la aplicación de Java Inventario cuyo principal objetivo es guardar, encontrar y recuperar información de artículos de la base de datos correspondiente al inventario.  

Además de la aplicación de Java necesitamos una tabla de la base de datos para almacenar la información de los artículos. Esta tabla que llamaremos ARTÍCULOS almacenará los datos sobre los artículos como filas como se muestra en la tabla siguiente.  

El inventario se representa en nuestra base de datos por la tabla ARTÍCULOS:  

**Tabla ARTÍCULOS**

<img src="images/c5/5-tabla.png">

Cada fila representará una instancia de la clase Articulo en la aplicación Tienda.       

Supongamos que tenemos un objeto sin Hibernate. Escribiremos un código de ejemplo usando la API de Java para la conectividad con bases de datos (JDBC), que esperamos, satisfaga nuestras necesidades.  

Lo primero que debemos hacer para utilizar una base de datos en nuestra aplicación es establecer una conexión con la base de datos. Una conexión es nuestro medio de acceso a la base de datos para realizar las operaciones en los datos desde una aplicación Java.   

Como dijimos, queremos comparar la metodología estándar de Java para la persistencia de objetos a través de interfaz de programación de aplicaciones para la conectividad con bases de datos o JDBC con la metodología de Hibernate.  

##### Enlace de interés

En el siguiente enlace puedes comparar las ventajas e inconvenientes de JPA y JDBC. 

[Enlace de interés](https://www.oscarblancarteblog.com/2014/07/15/jpa-hibernate-vs-jdbc/)

Para lograr la conexión con la base de datos usando JDBC, cada proveedor de una base de datos implementa una clase que contiene el mecanismo de conexión a su base de datos; por ejemplo, para la base de datos MySQL, esta clase es com.mysql.jdbc.Driver y para la base de datos JavaDB (derby) es org.apache.derby.jdbc.EmbeddedDriver.

El método createConnection, que se usa en el siguiente snippet de código, demuestra el procedimiento para crear una conexión con una base de datos:

[Ver código](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/1.pdf)

El código se encuentra comentado para que sea más fácil de entender.

Continuando con el desarrollo de nuestra aplicación, añadiremos un par de métodos para guardar los artículos y recuperarlos de la base de datos. Llamamos a estos métodos como

[Ver código](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/2.pdf)

Esto es lo que hemos hecho en el código de ejemplo anterior:

1. Hemos creado una declaración preparada **PreparedStatement** a partir de la conexión con la cadena **insertSql**. 
2. Hemos establecido la declaración con valores (valores de columna contra números de columna: 1 es ID, 2 es título, etc.). 
3. Hemos ejecutado la declaración que debe insertar el artículo en la tabla.
4. Hemos consultado la base de datos de todos los artículos y los hemos sacado por pantalla. 

Los pasos son bastante auto explicativos. Creamos una declaración preparada PreparedStatement y la ejecutamos después de establecer los valores adecuados para cada columna. Una vez que sabemos que la ejecución funcionó, consultamos la base de datos con una instrucción SELECT para obtener todos los artículos disponibles e imprimirlos en la consola.      

Sin embargo, hay algunas otras cuestiones a tener en cuenta:  

* Utilizamos una declaración SQL predefinida para insertar (o seleccionar) valores de columna. 
* Establecemos los valores de columna uno por uno utilizando el número de posición (o nombre de columna). 
* Capturamos la excepción SQLException si el código no funciona bien.     

##### Artículo de interés

El artículo siguiente presenta una descripción de la tecnología Hibernate, señalando su importancia en el desarrollo de aplicaciones empresariales, como un medio eficiente de acceso a grandes bases de datos y también se centra, en las arquitecturas que ofrece Hibernate para su implementación. 

[Artículo de interés](pdfs/Dialnet-DesarrolloEficienteDeAplicacionesEmpresarialesUsan-6041579.pdf)

Ahora  veamos cómo hacemos el mismo proceso de persistencia del objeto Artículo usando Hibernate y lo simple que es hacerlo de este modo.  

Primero crearemos un objeto que represente al artículo.  

El objeto que representa a **Articulo** se define como un POJO aquí: 

<img src="images/c5/5-articulo.png">

##### Recuerda

POJO son las iniciales de «Plain Old Java Object». Un POJO es una instancia de una clase que no extiende ni implementa nada en especial  

Java, al ser un lenguaje orientado a objetos, trata con objetos. Por lo general, los objetos que representan estados de programa son bastante simples, contienen propiedades (o atributos) y métodos que alteran o recuperan esos atributos. En general, estos objetos pueden encapsular algún comportamiento con respecto a los atributos, pero generalmente su único propósito es contener un estado de programa. Estos se conocen normalmente como "objetos Java antiguos", o POJOs. 

En Hibernate para persistir este objeto en la base de datos solo creamos una clase llamada ArticuloPersistor:       

<img src="images/c5/5-articulo-2.png">

Ahora veamos lo fácil que es persistir cualquier artículo usando la clase de utilidad ArticuloPersistor. El código complicado de JDBC se convierte en el siguiente código mucho más sencillo y familiar para los programadores acostumbrados a objetos usando Hibernate:       

<img src="images/c5/5-articulo-3.png">

Tengamos en cuenta que guardamos la instancia del objeto Articulo en una base de datos ejecutando una sola línea de código: session.save(Articulo)  

La API de Hibernate contiene clases con múltiples métodos para persistir, manipular y consultar objetos Java con facilidad y comodidad, sin embargo, primero debemos configurar la base de datos y establecer las definiciones de mapeo. En los siguientes apartados analizaremos todo esto. 

Los  pasos estándar a seguir para crear una aplicación de Hibernate son:  

1. Configurar la conexión de la base de datos. 
2. Crear definiciones de mapeo. 
3. Persistir las clases.  

Estos son los pasos asociados para el desarrollo de la versión Java-Hibernate de nuestra aplicación Inventario:      

<img src="images/c5/5-pasos-0.png">

**Pasos asociados**

1. Creamos el objeto Articulo como un POJO.
2. Creamos archivos de configuración para configurar Hibernate apropiadamente.
3. Creamos un cliente de prueba que administre (inserte / actualice / elimine / encuentre) los artículos.

<img src="images/c5/5-pasos.png">

*Pasos de la creación de nuestra aplicación*

Como dijimos, antes de usar Hibernate debemos configurarlo. Para configurar Hibernate se requieren dos piezas o, más específicamente, dos archivos: uno crea las conexiones de base de datos y el otro crea el mapeo o asignación de clases a tablas de la base de datos. Al igual que con JDBC, necesitamos proporcionar la información de la base de datos a nuestra aplicación para que abra una conexión para manipular los datos.   Veremos los pasos comunes para crear una aplicación Hibernate en las siguientes secciones.        

### 1.3 Mapeos o 'Mappings'

Hibernate necesita algo para saber qué tablas se relacionan con qué clases. La configuración de mapeo define qué propiedades de objeto se asignan a qué columnas de la tabla. Esta asignación se puede proporcionar a través de anotaciones de Java o mediante un archivo de asignación XML. En este momento, nos centraremos en el uso de asignaciones XML.       

<img src="images/c5/5-mapping.png">

### 1.4 Como configurar una conexión a la base de datos

La  información para la configuración de la base de datos y para la asignación o mapeo se proporciona con un archivo XML (generalmente llamado hibernate.cfg.xml) o como un archivo de texto simple con pares de nombre / valor (generalmente llamado hibernate.properties). Para este ejercicio, usamos el estilo XML a través del archivo hibernate.cfg.xml.  

El siguiente fragmento de código describe dicho archivo de configuración. Si usamos MySQL como la base de datos, los detalles de conexión serian como sigue en el archivo hibernate.cfg.xml:    

<img src="images/c5/5-configuracion.png">

##### Enlace de interés

En el siguiente enlace puedes conocer más detalles sobre cómo utilizar los archivos hibernate properties y hibernate.cg.xml 

[Enlace de interés](https://www.adictosaltrabajo.com/2004/08/14/hibernate/)

Ahora debemos proporcionar los archivos de mapeo y sus ubicaciones. Como se mencionó anteriormente, un archivo de asignación indica la asignación de propiedades del objeto a cada columna de una tabla. Esta asignación se realiza en un archivo separado, generalmente con el sufijo .hbm.xml:    

<img src="images/c5/5-configuracion-2.png">

El atributo **resource** indica el nombre del archivo de mapeo que Hibernate debe cargar. En este caso, Articulo.hbm.xml es el archivo de asignación y consta de detalles sobre cómo se asigna un objeto Articulo a una tabla ARTICULO. También se pueden ver otros, como Venta.hbm.xml y Compra.hbm.xml. Veremos estos archivos de mapeo a continuación.   

El framework de Hibernate carga este archivo y usa una clase global para crear sesiones u objetos tipo **Session** llamada **SessionFactory**.   

El objetivo de **SessionFactory** es crear objetos tipo **Session**. La sesión es el medio de acceso a la base de datos.    

<img src="images/c5/5-video-1.png">

[Video](https://www.youtube.com/watch?v=z1b1v-h5DfE&feature=emb_logo)

### 1.5 Crear las definiciones de mapeo

Ahora debemos especificar el archivo Articulo.hbm.xml que consiste de las definiciones de mapeo. El siguiente fragmento de XML define el mapeo para nuestro objeto Articulo para la tabla ARTICULOS.      

<img src="images/c5/5-configuracion-3.png">

Hay muchos aspectos definidos en este archivo de mapeo. El elemento **hibernate-mapping** contiene todas las definiciones de asignación de clase-a-tabla. Cada etiqueta **class** se usa para especificar las definiciones de mapeo de una clase de nuestro modelo. El atributo **table** se refiere a la tabla ARTICULOS en la que se conservan los objetos.  

Las propiedades restantes indican el mapeo de las variables del objeto a las columnas de la tabla (por ejemplo, la identificación se asigna a ID, el nombre a NOMBRE, la descripción a DESCRIPCION, etc.). 

### 1.6 Persistiendo los objetos

Ahora que la configuración de Hibernate está resuelta, creamos un cliente que persista los objetos.  

Necesitamos una instancia de la clase SessionFactory de la cual creamos el objeto Session.   

El siguiente código muestra el setup inicial para crear la clase SessionFactory:     

<img src="images/c5/5-configuracion-4.png">

Hibernate busca por nombres de archivo predeterminados, como hibernate.cfg.xml o hibernate.properties en la ruta de clase y los carga. Si tenemos un nombre que no es el predeterminado, debemos asegurarnos de pasarlo como un argumento, como configure("my-hib-cfg.xml"), por ejemplo. 

### 1.7 Creando el método de Java para persistencia

El método de persistencia se define en la siguiente clase para persistir un objeto Articulo usando el método session.save(Articulo) como se muestra a continuación:   

<img src="images/c5/5-configuracion-5.png">

Tengamos en cuenta que primero creamos un objeto **session** de fábrica. Luego creamos un objeto tipo **Transaction** y persistimos el objeto **Articulo** entrante utilizando el método **session.save**. Finalmente, confirmamos la transacción y el artículo se almacena permanentemente en nuestra base de datos. 

<img src="images/c5/5-video-2.png">

[Video](https://www.youtube.com/watch?v=CfGDZmPj3Qw&feature=emb_logo)

### 1.8 Probando que hemos persistido correctamente al objeto

Tenemos dos maneras de probar que el objeto ha sido persistido: haciendo una consulta directa a la base de datos SQL o creando un cliente de prueba.  

Podemos hacer la consulta a la base de datos SQL usando una consulta como:  SELECT * FROM ARTICULOS  que devolverá todos los registros guardados por nuestra aplicación.  

Esta consulta devolvería algo como la salida mostrada en la tabla siguiente:  

Tabla **CONSULTA DE ARTICULOS**

ID	NOMBRE	  TIPO		   DESCRIPCION 
------------------------------------------------------------------------------ 
1	  Aceitunas	Alimentos	 Aceitunas negras enlatadas de 250gr 
2	  Cerillas	Ítems		   Caja de 250 cerillas       

Alternativamente , podemos crear otro método llamado cliente de prueba, por ejemplo **findArticulo**. Este método utilizará el método de **load** (que significa 'cargar') de la clase session para recuperar el registro de la base de datos. Invocamos el método findArticulo, pasando el ID del articulo como argumento, para recuperar el artículo.   

<img src="images/c5/5-configuracion-6.png">

El  método **load** en la API de sesión obtiene el objeto tipo **Articulo** apropiado para un identificador dado. Si en este momento estás pensando que Hibernate está usando una consulta SQL del tipo SELECT detrás de este método, estás en lo correcto.  

Si deseamos obtener todos los artículos de la tabla, entonces debemos crear un objeto de consulta con la cadena de consulta **"From Articulo"**  y ejecutarlo. El método **list** de la consulta (creado a través de **session.createQuery**) devuelve una lista de artículos, como se muestra aquí:  

<img src="images/c5/5-configuracion-7.png">

##### Enlace de interés

En el siguiente artículo puedes aprender más sobre la necesidad de Hibernate. los APIs principales de Hibernate y cómo configurar Hibernate en aplicaciones stand-alone.  

[Enlace de interés](http://www.jtech.ua.es/j2ee/2006-2007/doc/sesion03-apuntes.pdf)

<img src="images/c5/5-crusi-1.png">

<img src="images/c5/5-crusi-2.png">

## 2. Hibernate

Hibernate es el marco de persistencia y la herramienta ORM para aplicaciones Java más popular (disponible también para .Net con el nombre de NHibernate). El término mapeo objeto / relacional se refiere a la técnica de hacer una asignación entre datos de una representación de modelo de objetos a una representación de modelo de datos relacionales.   

Como herramientas similares, Hibernate soluciona la incompatibilidad entre los dos modelos de datos que generalmente son requeridos en una aplicación: el modelo orientado a objetos y el modelo relacional usado en las bases de datos.   

Con el fin de alcanzar este objetivo, Hibernate provee al desarrollador con formas para especificar cómo es su modelo de datos, cuáles son las relaciones existentes y su tipo. Con esta información, Hibernate permite que la aplicación Java manipule los datos en la base de datos operando con el paradigma de la programación orientada a objetos.         

<img src="images/c5/5-video-3.png">

[Video](https://www.youtube.com/watch?v=PbfJYGs56p4&feature=emb_logo)

Hibernate funciona haciendo una asignación o mapeo entre clases Java y tablas de la base de datos y entre datos de una representación a otra, al convertir tipos de datos utilizados por los objetos en la aplicación Java a tipos definidos por SQL.  

Hibernate también genera todas las sentencias SQL necesarias para la persistencia y consulta de la base de datos automáticamente, liberando al desarrollador del manejo manual de la base de datos, reduciendo así significativamente el tiempo de desarrollo que se invertiría con el manejo manual de datos con SQL y JDBC y, sobre todo, disminuyendo la posibilidad de errores o bugs en el código al usar estas sentencias. A su vez, Hibernate hace la aplicación portable a cualquier motor de bases de datos y optimiza la misma mejorando el tiempo de ejecución.       

Hibernate es por diseño flexible en cuanto al esquema de tablas que el usuario use, y así se puede adaptar a una base de datos ya existente.   

Puede ser utilizado en aplicaciones Java independientes o en aplicaciones Java de la edición ”Enterprise” o Java EE. En este último caso Hibernate no usa archivos XML para especificar el mapeo objeto relacional y la configuración, sino archivos de texto con un formato específico conocidos como  “Annotations” que implementan el estándar JPA (Java Persistence API), que es parte de la plataforma Java EE.    

<img src="images/c5/5-relacional.png">

Hibernate  también incorpora un lenguaje de consulta de datos propio llamado HQL (Hibernate Query Language), al mismo tiempo que una API para construir las consultas programáticamente (conocida como "criteria").  

Hibernate es un software libre, distribuido bajo los términos de la licencia GNULGPL2. 

##### Enlace de interés

Aquí puedes conocer más detalles sobre el funcionamiento de las licencias de software libre que afectan a Hibernate y a otros muchos software. 

[Enlace de interés](http://www.gnu.org/licenses/licenses.es.html)

##### ¿sabías que ...?

Aunque no es necesario tener una sólida formación en SQL para usar Hibernate, tener una comprensión básica de los conceptos puede ayudarte a comprender Hibernate de manera más rápida y completa. La comprensión de los principios de modelado de datos es especialmente importante. 

##### Para saber más ...

El siguiente artículo es un buen punto de partida para comprender los principios del modelado de datos. 

[Ir al artículo](https://www.tecnologias-informacion.com/modeladodatos.html)

### 2.1 Arquitectura de Hibernate

La arquitectura de Hibernate se puede visualizar en el siguiente gráfico

<img src="images/c5/5-arquitectura.png">

La funcionalidad o el flujo de Hibernate se puede describir de la siguiente manera: 

1.  Al iniciar la aplicación, Hibernate lee el archivo de configuración (Hibernate.cfg.xml o Hibernate.properties) que contiene la información necesaria para realizar la conexión con la base de datos subyacente y la información del mapeo o asignación entre clases y tablas. A partir de estos archivos, Hibernate crea un objeto del tipo Configuration, que a su vez crea otro objeto tipo SessionFactory que se usará para toda la aplicación. 

2. Posteriormente Hibernate crea instancias de clases tipo Entity (Entidad). Las clases de entidad son clases de Java que son mapeadas a tablas de la base de datos utilizando metadatos (los archivos XML mencionados previamente). Estas instancias se denominan objetos transitorios ya que aún no se conservan en la base de datos. 

3.  Para persistir un objeto, la aplicación solicita una session de SessionFactory, la cual representa una conexión física a la base de datos. 

4.  A continuación, la aplicación inicia la transacción usando la librería session para persistir las instancias u objetos de nuestra aplicación a la base de datos, haciendo a los objetos persistentes como una fila en la tabla de la base de datos. La aplicación luego cierra o confirma la transacción y finaliza la sesión. 

5. Una vez que la sesión se cierra, la instancia de la clase Entity que se creó para representar el objeto es desconectada de la base de datos y ya no es gestionada por Hibernate, pero aun contiene datos del objeto original así que es eliminada. Los objetos eliminados nuevamente pueden volverse persistentes cuando se asocian con una nueva sesión (objeto session), o se pueden recolectar como basura una vez que ya no se usan. 

##### ¿Sabías que...?

A lo largo de este curso leerás cosas como "SessionFactory es la fábrica de objetos tipo Session". El método "Factory" o "Factory Method" es un patrón de diseño que consiste en utilizar una clase constructora abstracta con unos cuantos métodos definidos y otro(s) abstracto(s).  

##### Enlace de interés

Puedes leer más en Patrones de Fabricación: Fábricas de Objetos - Leon Welicki

[Enlace de interés](https://docs.microsoft.com/es-es/previous-versions/bb972258(v=msdn.10)?redirectedfrom=MSDN)

Como un proveedor de la API de Persistencia de Java (JPA) Hibernate implementa las especificaciones de dicha API. Las asociaciones entre las interfaces JPA e implementaciones específicas de Hibernate pueden visualizarse del siguiente diagrama:       

<img src="images/c5/5-diagrama.png">

##### ¿Sabías que...?

La API de persistencia de Java, más conocida por sus siglas JPA, es la API de persistencia desarrollada para la plataforma Java EE. Es un framework del lenguaje de programación Java que gestiona datos relacionales en aplicaciones usando la Plataforma Java en sus ediciones Standard (Java SE) y Enterprise (Java EE). Hibernate es capaz de implementar el JPA. Puedes leer más en el siguiente enlace. 

[JPA](https://www.oscarblancarteblog.com/tutoriales/java-persistence-api-jpa/)

A continuación, se muestra una breve descripción de las clases que aparecen en este diagrama, así como de otras de uso común en una aplicación típica de Hibernate.       

**Configuration (org.Hibernate.cfg.Configuration)**

Permite que al iniciarse la aplicación Java, esta especifique los archivos XML con las propiedades y la configuración de mapeo que se utilizarán al crear una SessionFactory. El archivo de propiedades contiene la información necesaria para configurar la conexión con la base de datos, mientras que el archivo de mapeo tiene la asignación específica entre clases y tablas de la base de datos.

**SessionFactory (org.Hibernate.SessionFactory)**

Es un objeto inmutable, con capacidades multi-hilo (multi-threaded) y con propiedades de seguridad que se crea para cada base de datos y es utilizado principalmente para crear sesiones, es decir, objetos tipo session. Almacena en caché las cláusulas o consultas SQL generadas y otros metadatos de mapeo que Hibernate usa en tiempo de ejecución.

**Session (org.Hibernate.Session)**

Es un objeto de hilo único (single-threaded) utilizado para realizar operaciones de creación, lectura, actualización y eliminación para instancias de clases del tipo entity o entidad que han sido mapeadas. Como no es seguro para subprocesos, no debe ser de larga duración y cada subproceso/transacción debe obtener su propia instancia de una clase SessionFactory.

**Transaction (org.Hibernate.Transaction)**

Es un objeto de un único hilo utilizado por la aplicación para definir unidades de trabajo. Una transacción está asociada a una sesión o Session. Las transacciones abstraen a código de aplicación las implementaciones actuales de las transacciones en las API y JTA y JDBC, lo que permite que la aplicación controle los límites de las transacciones a través de una API consistente. Es una API opcional y la aplicación puede optar por no usarla.

**Query (org.Hibernate.Query)**

Un objeto de hilo único utilizado para realizar consultas en la base de datos subyacente. La Session es una fábrica para los objetos Query. Tanto HQL (Hibernate Query Language) como SQL se pueden usar con el objeto Query.

**Criteria (org.Hibernate.Criteria)**

Es una alternativa a HQL, muy útil para las consultas de búsqueda tipo Query que involucren múltiples condiciones.

### 2.2 Modularidad en Hibernate

En su última versión, la funcionalidad de Hibernate se divide en varios módulos/artefactos destinados a aislar dependencias (modularidad).       

**Hibernate-core**

El módulo principal (núcleo) de Hibernate. Define sus características ORM y API, así como las diversas SPI de integración.

**Hibernate-envers**

Entidad de versionado histórica de Hibernate.

**Hibernate-spatial**

Soporte para Sistemas de Información Geográfica (GIS) de Hibernate.

**Hibernate-osgi**

Soporte para contenedores OSGi de Hibernate.

**Hibernate-agroal**

Integra la librería Agrolar (http://agroal.github.io/)< en Hibernate.

**Hibernate-c3p0**

Integra la librería C3P0 (http://www.mchange.com/projects/c3p0/) en Hibernate.

**Hibernate-hikaricp**

Integra la librería HikariCP (https://github.com/brettwooldridge/HikariCP) en Hibernate.

**Hibernate-vibur**

Integra la librería Vibur DBCP (http://www.vibur.org/) en Hibernate.

**Hibernate-proxool**

Integra la librería Proxool (http://proxool.sourceforge.net/) en Hibernate.

**Hibernate-jcache**

Integra la especificacion JCache ( "https://jcp.org/en/jsr/detail?id=107$$") en Hibernate.

### 2.3 Contenidos del paquete de instalación de Hibernate

El  equipo de Hibernate proporciona paquetes de lanzamiento alojados en el sistema de lanzamiento de archivos SourceForge, en formatos TGZ y ZIP. Cada paquete de lanzamiento contiene archivos JAR, documentación, código fuente y otros elementos de interés.  

El paquete de lanzamiento está estructurado de la siguiente manera: 

**Directorio lib/required**

Contiene el jar Hibernate-core y todas sus dependencias. Se requiere que todos estos jar estén disponibles en el classpath del IDE o aplicación sin importar qué características de Hibernate se estén utilizando.

**directorio lib/envers**

Contiene el jar Hibernate-envers y todas sus dependencias (más allá de las de lib/required/ y lib/jpa/).

**directorio lib/spatial/**

Contiene el jar Hibernate-spatial space y todas sus dependencias (más allá de las de lib/required/)

**directorio lib/osgi/**

Contiene el jar Hibernate-osgi y todas sus dependencias (más allá de las de lib/required/ y lib/jpa/)

**lib/jpa-metamodel-generator/**

Contiene el jar necesario para generar el Metamodel de tipo seguro de Criteria API.

**lib/optional/**

Contiene los archivos jar necesarios para las diversas agrupaciones de conexiones e integraciones de caché de segundo nivel proporcionadas por Hibernate, junto con sus dependencias.

##### Para saber más ...

Hay múltiples tutoriales online sobre como instalar Hibernate en el IDE Eclipse. A continuación, te presentamos algunos: 

[Turorial 1](http://www.programandoapasitos.com/2016/01/instalacion-y-configuracion-de.html)

[Turorial 2](https://nvpadula.wordpress.com/2015/10/31/como-configurar-hibernate-usando-eclipse-y-jboss-tools/)

[Turorial 3](https://aitorsouto.wordpress.com/2011/07/25/configuracion-de-hibernate-en-eclipse/)

##### Enlace de interés

Puedes descargar versiones de Hibernate en el formato que elijas en:

[Enlace de interés](https://sourceforge.net/projects/hibernate/files/hibernate-orm/)

### 2.4 Tutorial de Hibernate usando su API nativa y mapeo objeto relacional a través del archivo hbm.xml

Veamos  ahora el uso de Hibernate usando su API nativa. Hablamos de la API nativa ya que en sus últimas versiones Hibernate tiene otras APIs que se pueden usar opcionalmente para la persistencia de objetos.  

Como hemos mencionado varias veces ya, es necesario configurar la conexión a la base de datos para usar Hibernate, lo cual se puede hacer usando un archivo XML. Nos referiremos a este archivo como Hibernate.cfg.xml.  

Los elementos connection.driver_class, connection.url, connection.username y connection.password 

##### Ejemplo práctico

Una aplicación java para persistir transacciones de un comercio. Parte A: el archivo de configuración. 

[Ejemplo práctico](pdfs/5-Ejemplo_practico_1.pdf)

### 2.5 El archivo XML de mapeo de una aplicación de Hibernate

Hibernate  utiliza los metadatos para determinar cómo persistir los objetos. Estos metadatos son específicamente la asignación entre clases y tablas en la base de datos, así como las relaciones entre los tipos de datos. El archivo de mapeo de Hibernate es una opción para proporcionarle a Hibernate estos metadatos.  

A continuación, se muestra un ejemplo de un elemento típico en el archivo de mapeo:   

<img src="images/c5/5-ventas.png">

Atributos  principales del elemento de mapeo `<class>`:

* El atributo **name** es el nombre de la clase que se definirá como una entidad para èrsistirse.
* El atributo **tabla** nombra la tabla de la base de datos que contiene los datos para esta entidad.

<img src="images/c5/5-atributos.png">

Las  instancias de la clase Ventas ahora se asignan a filas en la tabla de la base de datos VENTAS.  

Los elementos en el archivo de mapeo relacionado con identificadores o IDs tienen la siguiente forma:     

<img src="images/c5/5-ventas-2.png">

No es necesario que el elemento id sea mapeado directamente a la columna que contiene las claves primarias, pero es la convención. Las tablas asignadas en Hibernate ni siquiera necesitan definir claves primarias. Sin embargo, se recomienda encarecidamente que todos los esquemas definan la integridad referencial adecuada. Por lo tanto, la identificación y la clave principal se usan indistintamente en toda la documentación de Hibernate.  El elemento `<id>` aquí nombra la columna VENTAS_ID como la clave principal de la tabla VENTAS. También identifica la propiedad id de la clase Ventas como la propiedad que contiene el valor del identificador.      

El  elemento generator informa a Hibernate sobre qué estrategia se utiliza para generar valores de clave primaria para esta entidad. Este ejemplo utiliza un recuento incremental simple.  

A continuación, se muestra un ejemplo de un elemento típico en el archivo de mapeo relacionado con las propiedades:      

<img src="images/c5/5-ventas-3.png">

Los  dos elementos `<property/>` declaran las dos propiedades restantes de la clase Venta: fecha e importe. El mapeo de la propiedad fecha incluye el atributo column, pero la propiedad importe no. En ausencia del atributo column, Hibernate usa el nombre de la propiedad como el nombre de la columna. Esto es apropiado para el caso de importe, pero dado que date es una palabra clave reservada en la mayoría de las bases de datos, debe especificar una palabra no reservada para el nombre de la columna.

El mapeo de importe también carece de un atributo de tipo. Los tipos declarados y utilizados en los archivos de mapeo no son tipos de datos Java, ni tipos de bases de datos SQL. En cambio, son tipos de mapeo de Hibernate, que son convertidores que traducen entre tipos de datos Java y SQL. Hibernate intenta determinar la conversión correcta y el tipo de mapeo de forma autónoma si el atributo de tipo no se especifica en el mapeo, utilizando la reflexión de Java para determinar el tipo de Java de la propiedad declarada y usando un tipo de mapeo predeterminado para ese tipo de Java.  

En  algunos casos, esta detección automática podría no elegir el valor predeterminado que se espera o se necesita, como se ve con la propiedad fecha. Hibernate no puede saber si la propiedad, que es del tipo java.util.Date, debería correlacionarse con un tipo de datos SQL DATE, TIME o TIMESTAMP. La información completa de fecha y hora se conserva al mapear la propiedad al convertidor timestamp, que identifica la clase de convertidor org.Hibernate.type.TimestampType.       

##### Ejemplo práctico

Una aplicación java para persistir transacciones de un comercio. Parte B: el archivo de mapeo. 

[Ejemplo práctico](pdfs/5-Ejemplo_practico_2.pdf)

##### Bibliografía recomendada

Madhusudhan Konda, Just Hibernate. Editorial O’Reilly

### 2.6 Estrategias para la generación de identificadores

Cada objeto a persistir en una base de datos debe tener un identificador único. Podemos utilizar diferentes estrategias para generar estos identificadores automáticamente. Hibernate proporciona un conjunto amplio de tales estrategias, que veremos en esta sección.  

Como se ha visto en ejemplos anteriores, debemos definir una clase generator para configurar un elemento id de la siguiente manera:      

<img src="images/c5/5-generator-1.png">

**Generator** es el elemento clave que le permite a Hibernate conocer qué estrategia de generación de identificadores hemos escogido. El atributo class en el elemento **Generator** define la estrategia real que vamos a utilizar. Por ejemplo, en el fragmento anterior, estamos utilizando la estrategia assigned, lo que significa que se espera que nuestro código establezca un identificador único en cada uno de los objetos persistentes.  

**assigned** es una abreviación para la clase org.Hibernate.id.Assigned. En lugar de exigirnos que proporcionemos el nombre completo de la clase para el atributo generator, Hibernate nos permite usar una abreviación para mayor comodidad. Por ejemplo, el nombre “sequence" corresponde a org.Hibernate.id.SequenceGenerator, "identity" corresponde a org.Hibernate.id.IdentityGenerator, y así sucesivamente. Todas estas clases implementan una interfaz común, org.Hibernate.id.IdentifierGenerator.  

Podemos especificar los argumentos requeridos para estos generadores usando elementos tipo param en nuestro XML. Por ejemplo, cuando usamos la estrategia sequence, necesitamos que Hibernate sepa cuál es nuestra tabla para generar las secuencias:     

<img src="images/c5/5-generator-2.png">

En la documentación de Hibernate puedes conocer las múltiples estrategias que están disponibles. 

### 2.7 Persistencia de objetos con el API de Hibernate

Hibernate aporta una API amplia para la persistencia y recuperación de objetos que se puede conocer con más detalle consultando la documentación oficial. Sin embargo, no es necesario conocerla por completo para persistir objetos en nuestra aplicación Java con dicha API. Por tanto, vamos a estudiar las API de sesión más importantes y fundamentales que son necesarias para comprender los conceptos de Hibernate. 

Ya introdujimos las API más básicas de Hibernate anteriormente. SessionFactory, representada por la clase org.Hibernate.SessionFactory, es una clase Factory para producir nuestras instancias de sesión. Es un objeto seguro para subprocesos y, por lo tanto, se puede compartir en varias clases sin que tengamos que preocuparnos por la corrupción de los datos.   

Suministramos la información de mapeo a esta clase en el momento de la creación, por lo que contiene todos los datos de mapeo en una forma compilada.        

Si recordamos, creamos una instancia de SessionFactory proporcionando los datos de configuración. Por ejemplo:   

<img src="images/c5/5-generator-3.png">

Mientras SessionFactory permite el acceso a la base de datos, Session en sí misma es la que permite interactuar con la base de datos. Session es un objeto de un solo hilo y por lo tanto no debe compartirse entre varios componentes. Representa una sola unidad de trabajo. Usamos factory.getCurrentSession() para obtener una instancia de **SessionFactory**. Una vez que tenemos el objeto Session, podemos realizar nuestras operaciones en la base de datos con una transacción que se implementa en el objeto **Transaction**. Las clases **sesion** y **transaction** se utilizan siempre juntas.  

El ciclo de vida habitual de la sesión y una transacción se muestra en el siguiente fragmento de código:   

<img src="images/c5/5-generator-4.png">

Debemos tener en cuenta que todos los objetos que fueron recuperados desde la base de datos se mantendrán en la sesión hasta que la sesión se cierre. Lo ideal es que utilicemos la misma sesión para efectuar todas las operaciones o transacciones a base de datos en lugar de hacer una transacción por sesión. 

### 2.8 Transacciones

Uno de los conceptos centrales de Hibernate es el concepto de transacción y la clase que lo implementa es la clase Transaction.   

La idea de una transacción es agrupar un conjunto de operaciones sobre la base de datos que natural o lógicamente deberían ir juntas. Tomemos el ejemplo de la transacción que representa la compra de un objeto en una tienda online.   

Cuando un cliente compra un objeto en la tienda hay una serie de pasos (o más específicamente de operaciones sobre la base de datos) que se deben ejecutar juntos cuando se efectúa la compra:       

1. Verificar que el objeto está en inventario. 
2. Actualizar el número de objetos del inventario de acuerdo a los comprados. 
3. Añadir una dirección de envío. 
4. Ingresar los datos del cliente a la base de datos. si no están ya incluidos. 
5. Añadir una dirección de envío. 

Todos estos pasos deben ejecutarse juntos y comprenden una transacción y en caso de que uno falle, la transacción asociada a la venta no debe marcarse como satisfactoria.    

##### Enlace de interés

Este es el manual de referencia de Hibernate en el que se explican en detalle todas sus características. 

[Enlace de interés](https://docs.jboss.org/hibernate/orm/3.6/reference/es-ES/pdf/hibernate_reference.pdf)

Por lo general, existen dos modos de efectuar transacciones: un contenedor puede crear y administrar las transacciones, o podemos crear nuestra propia transacción. Obviamente, en el primer caso, no tenemos que preocuparnos por la semántica de las transacciones, como confirmar y deshacer las transacciones; Todos estos son atendidos por el contenedor.   

En una JVM independiente, necesitamos trabajar exclusivamente con la transacción. El siguiente fragmento de código persiste el objeto Curso en nuestra base de datos: 

<img src="images/c5/5-generator-5.png">

##### Recuerda

Con la operación persist() podemos insertar entidades en el almacén de datos, algo que debe hacerse dentro de transacciones para poder manipular las entidades. 

<img src="images/c5/5-video-4.png">

[Video](https://www.youtube.com/watch?v=SVBq7cooaTE&feature=emb_logo)

Iniciamos una transacción llamando el método session.beginTrasaction, que crea un nuevo objeto Transaction y nos devuelve la referencia. Se asocia con la sesión y se mantiene abierto hasta que la transacción se confirma o se revierte.  

Durante la transacción todas las entidades son persistidas en la base de datos. Una vez que se termina la transacción emitimos un commit para consolidar la transacción. Si mientras se efectúa la transacción se produce algún error, el runtime de Hibernate captura y lanza una HibernateException. Podemos devolver excepciones adicionales al cliente para fines de información o depuración.  

La clase org.Hibernate.tutorial.hbm.NativeApiIllustrationTest que está incluida en el código de Hibernate ilustra el uso de la API nativa de Hibernate.      

El código para levantar una sesión de conexión a la base de datos usandoSessionFactory se muestra en la imagen.  

A continuación, se explica el fragmento de código:    

<img src="images/c5/5-generator-6.png">

#### Explicación del Código

El método setUp primero crea una instancia org.Hibernate.boot.registry.StandardServiceRegistry que incorpora información de configuración en un conjunto de servicios de trabajo para que SessionFactory los use. Dado que estamos definiendo toda la información de configuración enHibernate.cfg.xml, no hay nada que añadir.  

Usando *StandardServiceRegistry* creamos org.Hibernate.boot.MetadataSources que es el punto de partida para informar a Hibernate sobre su modelo de dominio.  

org.Hibernate.boot.Metadata representa la vista completa y parcialmente validada del modelo de dominio de aplicación en el que se basará SessionFactory.  

SessionFactory es un objeto seguro para subprocesos que se instancia una vez para servir a toda la aplicación. SessionFactory actúa como una fábrica para instancias org.Hibernate.Session, que deben considerarse como un corolario de una "unidad de trabajo".  

<img src="images/c5/5-huecos-1.png">

## 3. Clases mapeadas

Una de las ventajas de Hibernate es la de abstraer un registro de la base de datos y ofrecernos la posibilidad de manipularlo a través de su representación mediante un objeto, el cual se conoce como entidad.  

Una entidad es el equivalente de un registro en base de datos, y es mediante ella que la aplicación debe interactuar con la base datos. Al hacer una comparación entre la clase que define a la entidad y la tabla en base de datos, la clase sería la tabla y los campos de dicha clase son las columnas de la tabla.  

En un principio Hibernate mapeaba las clases con archivos XML y aún sigue vigente, pero tiende a ser engorroso y poco práctico, por lo que se han tendido en las últimas versiones a priorizar las anotaciones. En caso de que prefieras continuar con el uso de archivos en vez de anotaciones, tampoco hay ningún problema.   

<img src="images/c5/5-video-5.png">

[Video](https://www.youtube.com/watch?v=YU-jIpkkjRI&feature=emb_logo)

Supongamos un ejemplo típico de una base de datos cuya estructura consiste en una tabla llamada header (cabecera). En nuestro ejemplo supongamos que se ha creado la tabla header como se muestra a continuación:

[Ver ejemplo](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/3.pdf)

En este ejemplo vamos a mapear la clase mediante anotaciones del paquete java.persistence o lo que se conoce como JPA (Java Persistence Annotation). Veamos una breve explicación de lo que significa cada anotación:       

**@Entity**

Indica que la clase es una entidad, por lo que Hibernate la procesa como tal. Esta anotación sólo puede ser utilizada en la definición de la clase y tiene el siguiente elemento:

* **name**: se utiliza para especificar un nombre distinto al de la clase para hacer “queries” en la base de datos. Un ejemplo puede ser @Entity(name=”header”)

**@Table**

Esta anotación indica la definición de la tabla en la base de datos que es representada por la entidad (Para nuestro ejemplo, la tabla “header”). La anotación cuenta con los siguientes elementos:

 * **name**: especifica el nombre de la tabla. Si se omite la tabla tendrá el nombre de la clase usando la convención de Hibernate.
 
* **catalog**: indica el catálogo en base de datos al que pertenece la tabla.

* **schema**: es el esquema en el que se encuentra la tabla.

* **uniqueConstraints**: solo es válida durante la generación de la base de datos y permite generar una constraint de unicidad en la tabla.

* **indexes**: crea índices en la tabla cuando se genera la base de datos.

**@Id**

Se utiliza para indicar la clave primaria de la tabla. Esta anotación no tiene elementos. Y solo es aplicable a campos de la clase.

**@Column**

Es tal vez la anotación de JPA más usada, ya que con ella se especifica que un campo de la clase es una columna en base de datos. Todos los elementos de esta anotación son opcionales. Son los siguientes:

* **name**: Es opcional y se utiliza para indicar el nombre de la columna. De no especificarse, la columna es nombrada tal y como se llama el campo que precede. Por ejemplo, aunque el campo del ejemplo anterior es “testcolumn”, en la base de datos dicho campo se llama “test”.

* **unique**: si se le asigna true, el valor de la columna no se puede repetir en la tabla. Si la tabla ya tiene una restricción de unicidad con “uniqueConstraints”, adicionalmente se añadirá esta restricción a la columna.

* **nullable**: indica si la columna tiene una restricción not null, es decir, si puede o no puede ser null su valor.

##### Enlace de interés

En el siguiente enlace se explica la importancia de @table a la hora de definir entidades 

[Enlace](https://www.oscarblancarteblog.com/2016/10/31/mapeo-tablas-table/)

En el siguiente enlace se explica en detalle cómo definir columnas con @Column y su importancia en Hibernate 

[Enlace](https://www.oscarblancarteblog.com/2016/11/10/definicion-columnas-column/)

<img src="images/c5/5-video-6.png">

[Video](https://www.youtube.com/watch?v=TFzcyi86o-w&feature=emb_logo)

Ahora, si ejecutamos nuestra aplicación y especificamos que Hibernate genere la base de datos podremos ver en el log el DDL generado para crear la tabla, tal y como se muestra a continuación: 

<img src="images/c5/5-table-header.png">

Como se puede observar, aunque un campo se llama “testcolumn” no tenemos ninguna columna. Esto se debe a que la anotación es @Column(name = "test") y para el caso de la columna number el not null se debe a que el elemento nullable está en false. 

##### Enlace de interés

En la siguiente presentación de la Universidad de Oviedo puedes ver muchos ejemplos del mapeo de clases.   

[Enlace](pdfs/5_Mapeo_de_clases.pdf)


<img src="images/c5/5-arrastrar-1.png">

<img src="images/c5/5-arrastrar-2.png">

## 4. Consultas contra la Base de datos

Hibernate utiliza un lenguaje de consultas llamado HQL, que se podría confundir con SQL estándar, pero HQL está orientado a objetos, por lo que soporta polimorfismo y herencia, lo que también evita el hecho de tener que realizar consultas complejas para obtener datos de una tabla.  

Para entender HQL hay que tener siempre en cuenta lo siguiente: 

1. No es SQL, por lo tanto, no se debe crear una consulta basada en lo que se encuentra en la base de datos. Las consultas se deben realizar en función de las entidades. 

2. Las palabras reservadas de SQL estándar (SELECT, FROM, WHERE) se pueden escribir en minúsculas o mayúsculas indistintamente, pero los nombres de entidades se deben escribir de la misma forma que están declaradas. 

3. Los elementos en una consulta son objetos y no registros, por tanto se pueden lanzar consultas como “select l.header.text from line as l” suponiendo que existe un tabla line, que tiene una relación con la entidad header. 

##### Enlace de interés

En la página oficial de la comunidad de Hibernate.org puedes aprender más sobre el lenguaje de consultas de Hibernate, HQL. 

[HQL](https://docs.jboss.org/hibernate/orm/3.5/reference/es-ES/html/queryhql.html)

<img src="images/c5/5-video-7.png">

[Video](https://www.youtube.com/watch?v=tsFpPn7DMt4&feature=emb_logo)

### 4.1 Cláusula FROM

Para comenzar con cualquier lenguaje de consulta a bases de datos se debe empezar por la sentencia más básica: el **SELECT**. En HQL un select sencillo a la tabla header, sería así:

**`>from Header`**  

La sentencia anterior es el equivalente en SQL estándar al conocido `select * from`.

HQL también permite realizar consultas con alias, por lo que la sentencia anterior podría ser:      

**`>from Header as h`**  

En HQL el as es opcional, por lo que es muy común que los desarrolladores no lo utilicen.  

Este lenguaje también soporta el *cross join*, en el cual la cláusula from es seguida de dos tablas. Esto genera como resultado todas las combinaciones posibles de cada registro de las tablas, por ejemplo:    

**`>from Perro as p, Gato as g`**        

#### 4.1.1 Asociaciones explicitas

Una asociación explicita en HQL consiste en relacionar las entidades mediante las cláusulas JOIN, tal y como se haría en una base de datos relacional.  

Ejemplo:

**`> from Cliente as c`**
**` join c.direccion`**

Este correspondería al inner join convencional en el cual se relaciona la entidad dirección con la entidad cliente. Es importante reseñar que en la entidad Cliente debe existir un campo llamado dirección que debe ser otra entidad, por ejemplo Direccion. La palabra Cliente comienza con mayúsculas porque es la entidad, pero dirección es un campo de la entidad Cliente. En SQL estándar esa consulta equivaldría

**`> SELECT * FROM Cliente as c`**
**` JOIN Direccion d on d.Cliente_ID = c. Cliente_ID`**

En este caso el resultado son todos los registros que se puedan relacionar entre la tabla cliente y dirección.         

En caso de que se quieran mostrar también aquellos clientes que no tienen dirección, se usa LEFT JOIN. También se puede decir que LEFT JOIN genera como resultado todos los registros de la entidad de la cláusula from (LEFT del inglés Izquierda).

**`> from Cliente as c`**       
**` left join c.direccion`**  

Si la relación entre cliente y dirección es de escritura demorada (Por ejemplo, con la anotación OneToMany(fetch = FetchType.LAZY)) y se quisiera consultar la dirección de cada cliente, se tendría que hacer otra consulta. Para evitar este segundo paso en caso de necesitar las direcciones, Hibernate nos ofrece la cláusula FETCH, la cual asigna el valor al campo dirección. Un ejemplo de esto sería:  

**`> from Cliente as c`**       
**` left join fetch c.direccion`**  

La cláusula fetch funciona con join y  left join.  

Si se quisiera tener condiciones adicionales en la cláusula join, podemos usar la cláusula with, la cual nos permite en este caso filtrar por alguna condición las direcciones del cliente. Por ejemplo:

**`> from Cliente as c`**       
**` left join c.direccion as d with d.zip = ‘2001’`** 

#### 4.1.2 Asociaciones Implícitas

Una asociación implícita consiste en basar la consulta en la relación que guardan las entidades en su definición.  Supongamos la consulta anterior:  

**`> from Cliente as c`**        
**`left join c.direccion as d with d.zip = ‘2001’`**   

Es la forma explícita de obtener información del cliente. Ahora bien, hacer esta asociación de manera implícita trae como resultado la siguiente consulta:  

**`> from Cliente as c where c.direccion.zip = ‘2001’`**   

Este tipo de asociación no es recomendada, ya que genera inner join  en el SQL generado.  

### 4.2 Clausula SELECT

Cuando una consulta contiene asociaciones, esta devuelve por cada registro un objeto de la entidad involucrada. La cláusula select nos permite indicar que entidades se quiere devolver o bien, si queremos un campo, o una nueva instancia de otra entidad. Por ejemplo:  


**`> select c from Cliente as c join c.direccion`**   

Solo devuelve los registros de tipo cliente.  

Las consultas pueden devolver cualquier campo de cualquier tipo.  

**`> select c.direccion from Cliente as c`**    

Esta cláusula devuelve un tipo Direccion.  

También pueden devolver varios tipos en un arreglo de objetos, por ejemplo:  

**`> select c , c.direccion from Cliente as c`**    

Lo que devuelve el cliente y la dirección en objetos separados.

También se puede instanciar un nuevo objeto, siempre y cuando tenga un constructor adecuado:     

**`> select new Factura(c.name) from Cliente as c`**     

Para el filtrado de los datos con la cláusula where, una consulta puede ser como se muestra a continuación:      

**`> from Header as h where h.text like ‘test text’`**   

Supongamos que existe la entidad Line, la cual contiene la entidad Header. Si queremos conseguir todas las líneas en función de la entidad Header, la consulta en HQL podría ser así:             

**`> from Line l where l.header.text like ‘test text’.`**   

Este es un claro ejemplo de los beneficios de HQL, ya que una consulta de este tipo con SQL estándar implicaría tener que utilizar la sentencia join para obtener el valor text.}  

En el siguiente ejemplo en Java se puede ver como se insertan y consultan datos desde la base de datos, utilizando la configuración de Hibernate mediante properties:

[Ver ejemplo](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/4.java.pdf)

En el ejemplo se muestra un caso sencillo de cómo hacer inserts y una consulta a la base de datos con Hibernate. Es importante recalcar que aunque parezca que la tabla se llama HeaderModel, en la base de datos no es así.  Hay que hacer énfasis en que la consulta no es SQL estándar, sino que es HQL.       

Otro punto que puede confundir al ver este ejemplo cuando estamos iniciando la transición de SQL a HQL es que no hay clausula select, ya que por defecto Hibernate entiende que va a devolver un objeto de clase HeaderModel.   

En caso de que prefieras incluir el select, se puede hacer lo siguiente: 

<img src="images/c5/5-select-1.png">

Importante: no es válido colocar select * from, dado que Hibernate no lo interpreta.  

Ahora bien, si ejecutamos el código y activamos el log, podemos ver lo siguiente:  

<img src="images/c5/5-select-2.png">

Se puede ver que aunque nuestra clase se llame HeaderModel, la tabla en la base de datos se llama header, ya que así se configuró con la etiqueta @Table. 
   
Hibernate de manera automática mapea la clase, por lo que el resultado debe ser coherente con la declaración de la variable en la que se va a guardar el resultado.  

Si queremos obtener solo un dato de una de las columnas podemos hacer lo siguiente: 

<img src="images/c5/5-select-3.png">

##### Enlace de interés

Para mayor información sobre cómo hacer consultas más avanzadas se puede consultar el siguiente link 

[Enlace de interés](https://docs.jboss.org/hibernate/orm/3.5/reference/es-ES/html/queryhql.html)

<img src="images/c5/5-crusi-3.png">

<img src="images/c5/5-crusi-4.png">

## 5. Mapeo de asociaciones

En una base de datos relacional, como sabemos, el principal problema a resolver es mantener la integridad de los datos al tiempo que el sistema en cuestión pueda leer de manera eficiente esos datos.  

El mapeo de asociaciones no es algo trivial y es necesario conocer los distintos casos que existen para poder abordar esta tarea exitosamente en Hibernate.  

Los mapeos los podemos clasificar en mapeos unidireccionales y mapeos bidireccionales.       

Existen tres tipos principales de relaciones en una base de datos, las cuales están también reflejadas en Hibernate. Estas son las que siguen a continuación.  

Posteriormente veremos cómo se modela esto con Hibernate. 

**Uno a muchos o muchos a uno**

En las que un registro dado puede estar relacionado con más de un registro en otra tabla mediante una clave foránea.

**Uno a uno**

En este caso un registro se relaciona con otro registro en otra tabla, pero además de la clave foránea, existe una restricción de unicidad.

**Muchos a muchos**

E este caso ninguna de las partes tiene clave foránea, sino que existe una tercera tabla que las relaciona y que se conoce como tabla relacional. 

<img src="images/c5/5-video-8.png">

[Video](https://www.youtube.com/watch?v=45CSkIlLq7A&feature=emb_logo)

### 5.1 Uno a muchos o muchos a uno

Un ejemplo básico de una relación de este tipo en una base de datos es el caso de una factura y las líneas o apuntes de cada factura.   

En un flujo normal lo primero en crearse es la factura en sí misma, en la que se guarda la información del cliente, totales y otras informaciones generales.  

Por otro lado, están las líneas de la factura, en las que se guarda información de cada producto, precio unitario y otros datos referentes a ese ítem en específico.  

Un ejemplo básico del modelo de una factura (y de sus líneas) es el siguiente:

[Modelo de una factura](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/5.pdf)

[Líneas de la factura](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/6.pdf)

Si vemos las sentencias SQL generadas por Hibernate tenemos lo siguiente:

<img src="images/c5/5-cod-factura-1.png">

Pero adicionalmente se genera la constraint que relaciona a FacturaLinea con Factura.  

<img src="images/c5/5-cod-factura-2.png">

<img src="images/c5/5-video-9.png">

[Video](https://www.youtube.com/watch?v=eAQr4G8YBTs&feature=emb_logo)

Otros dos elementos muy empleados en la anotación OneToMany son cascade y fetch:      

**Cascade**

Indica cómo persisten las entidades relacionadas. Toma como valores los de javax.persistence.CascadeType e indica que pasará con las entidades relacionadas cuando, por ejemplo, si borramos la clase principal también deberían o no borrarse las clases relacionadas. Los tipos de cascade son:

* PERSIST: Cuando una entidad es persistida, su entidad relacionada debe ser persistida también.
* REMOVE: Cuando una entidad es eliminada, las entidades relacionadas también lo serán.
* REFRESH: Cuando una entidad actualiza su estado, también lo actualizarán sus relacionadas.
* MERGE: Cuando una entidad es modificada, sus entidades relacionadas los serán.
* ALL: Aplica todos los supuestos anteriores

Pongamos como ejemplo el siguiente código:

<img src="images/c5/5-cod-factura-3.png">

Para el ejemplo de la factura, solo se guardaría la factura en sí misma, pero no las líneas. En cambio, si modificamos la clase y las líneas las definimos así:

<img src="images/c5/5-cod-factura-4.png">

En este caso las líneas se guardarán también.

**Fetch**

Este elemento indica cómo se leerán los datos desde la base de datos. Toma valores del enum javax.persistence.FetchType, @OneToMany y @ManyToOne tienen el valor LAZY, que significa que son de lectura demorada o retardada, y no serán cargados hasta que sea explícitamente requerido.

### 5.2 Uno a uno

La relación uno a uno se gestiona con la etiqueta @OneToOne que crea una restricción de clave foránea y adicionalmente otra de unicidad. Si creamos la entidad referencia como se muestra: 

[@OneToOne](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/7.pdf)

Y modificamos la entidad factura para que tenga una referencia añadiendo un nuevo campo:  

@OneToOne(optional=false) private Referencia referencia;  

Podemos ver que se añade una constraint de unicidad en la tabla de factura:  

`alter table factura add constraint UK_e5auarquqtdaq4gari23bv6ck  unique (referencia_referenciaId);`

<img src="images/c5/5-video-10.png">

[Video](https://www.youtube.com/watch?v=pf-n1WYMxOg&feature=emb_logo)

### 5.3 Muchos a Muchos

Con este tipo de relación en una base de datos es necesario utilizar una tercera tabla que relacione las entidades y se podría hacer con las relaciones de uno a muchos ya expuesta. Sin embargo, Hibernate nos proporciona una mejor alternativa con la anotación @ManyToMany.  

Supongamos el ejemplo de la entidad factura y la referencia, y que ahora una factura puede tener más de una referencia y una referencia más de una factura. Para ello hay que hacer una modificación en el campo referencia de la Factura así: 

```
@ManyToMany(cascade=CascadeType.ALL) 
private Set<Referencia> referencia;
```

Y en el campo factura de la entidad Referencia: 

```
@ManyToMany(cascade=CascadeType.ALL) 
private Set<factura> factura;
```

Se coloca CascadeType.ALL para que al guardar la referencia también lo haga con la factura.

Ambos campos ahora deben ser de tipo set, porque es una restricción de la anotación, y con mucho sentido, puesto que ambas entidades ahora guardan relación con una o más de sus contrapartes.

Cuando Hibernate genera la base de datos podemos ver lo siguiente:

`create table factura (facturaId int8 not null, documentNo varchar(255), primary key (facturaId))`

Como se puede ver, ya no está el campo referencia en la factura y la tabla de referencia se genera así:

`create table referencia (referenciaId int8 not null, primary key (referenciaId))`

Y tampoco tiene el id de la factura, ¿entonces cómo se relacionan? Es sencillo, Hibernate crea otra tabla con esta estructura:

`create table referencia_factura (referencia_referenciaId int8 not null, factura_facturaId int8 not null, primary key (referencia_referenciaId, factura_facturaId))`

Tiene una clave primaria compuesta y además sus claves foráneas. Ahora probemos como funciona esta relación con el siguiente código:

[Ver código](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/8.pdf)

Como las líneas se guardan en cascada con la factura y a su vez la factura se guarda en cascada con la referencia, solo se guarda la entidad Referencia. Estos son los inserts que se generan en la base de datos:  

```sql
insert into referencia (referenciaId) values (?) 
insert into factura (documentNo, facturaId) values (?, ?) 
insert into facturalinea (factura_facturaId, facturaLineaId) values (?, ?) 
insert into referencia_factura (referencia_referenciaId, factura_facturaId) values (?, ?)   
```

El último insert corresponde a la relación muchos a muchos.       

<img src="images/c5/5-asociaciones-1.png">

<img src="images/c5/5-asociaciones-2.png">

<img src="images/c5/5-asociaciones-3.png">

<img src="images/c5/5-asociaciones-4.png">

<img src="images/c5/5-rellena-3.png">

## 6. Mapeo de herencias

En Hibernate existen varias opciones posibles para mapear una relación de clases a las tablas de una base de datos.  

Las tres estrategias de herencia que soporta Hibernate son:  

* Una tabla por toda la jerarquía de clases 
* Una tabla por cada subclase (joins) 
* Una tabla por cada clase concreta (uniones)  

<img src="images/c5/5-herencia-1.png">

##### Enlace de interés

Documentación oficial de Hibernate sobre mapeo de herencia:

[Enlace de interés](https://docs.jboss.org/hibernate/core/3.5/reference/es-ES/html/inheritance.html)

### 6.1 Una tabla para toda la jerarquía de clases

La primera de ellas es utilizar una única tabla en la que almacenemos toda la jerarquía de las clases. Con esto se obtiene un muy buen rendimiento, porque los accesos se reducen a la única tabla existente, la cual se encuentra desnormalizada. 

Por el contrario, el problema que presenta esta solución es que los campos de las clases hijas deben admitir nulos en su totalidad porque al guardar un tipo, los campos que le correspondan a otros tipos de la jerarquía carecerán de valor.

A continuación, vemos un ejemplo:

[Ver ejemplo](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/9.pdf)

Como hemos indicado, se usa únicamente una tabla y las columnas de subclases, por ejemplo, CCTYPE, deben evitar las restricciones NOT NULL.

##### ¿Sabías que...?

Existen herramientas que nos ayudan a hacer el mapeo de herencias en Hibernate. Por ejemplo, el plugin HibernateTools para Eclipse, genera todo el mapeo y también crea las relaciones entre tablas. 

### 6.2 Una tabla para cada subclase

La segunda alternativa disponible es utilizar una tabla para el padre de la jerarquía y una segunda tabla para cada una de las clases hija. Al ser esta solución una alternativa totalmente normalizada obtenemos como beneficio primario una total flexibilidad lo que será muy interesante si nuestra aplicación presenta un modelo de clases con cambios frecuentes. 

Cuando tengamos nuevos tipos, simplemente tendremos que introducir tablas añadidas. Y si lo que queremos es tener nuevos atributos lo solucionamos modificando la tabla del tipo en la cual se añade el atributo en cuestión. 

La pérdida de rendimiento aparece cuando tenemos que hacer joins con las tablas de la clase padre que puede convertirse en una desventaja significativa

A continuación, un ejemplo:

[Ver ejemplos](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/10.pdf)

Por lo que estaremos necesitando cuatro tablas y las tres tablas de subclase tendrán asociaciones a la tabla superclase de clave principal. Por lo que en un modelo relacional se trataría de una asociación uno-a-uno.

##### Enlace de interés

Relaciones de herencia de JPA a Hibernate.

[Enlace de interés](http://www.jtech.ua.es/ayto/ayto2008/jpa/sesion08-apuntes.pdf)

### 6.3 Una tabla para cada clase

Finalmente, el tercer modo de enfocar el mapeo de herencia es utilizando tablas independientes para cada uno de los tipos presentes de modo que los atributos del padre y que por tanto con comunes a los hijos se verán repetidos en las tablas. 

Aquí los problemas de rendimiento surgen y se multiplican si haces un uso intensivo del polimorfismo lo que lo convierte en una solución poco recomendable.

A continuación, un ejemplo:

[Ver ejemplos](https://screpo.datacontrol.es/contenidos/Especialidades%20SEPE/IFCT034PO/IFCT034PO_UD5/11.pdf)

Donde tendríamos tres tablas y cada una establece columnas para todas las propiedades de clase, también para aquellas que son heredadas.

<img src="images/c5/5-crusi-5.png">

<img src="images/c5/5-crusi-6.png">

## 7. Trabajo con objetos

Hibernate cubre todas las necesidades en materia de mapeo objeto relacional de modo que el programador pueda abstraerse de la problemática a bajo nivel de la administración del sistema gestor de base de datos que haya optado por utilizar.  

Pero además de eso, Hibernate también proporciona la capacidad de administrar el estado de objetos de modo que se disponga de una visión orientada a objetos y no a sentencias SQL. Por tanto, al desarrollar apoyados en Hibernate debemos visualizar el estado de los objetos y no un conjunto de declaraciones en SQL.  

##### Enlace de interés

En el siguiente enlace puedes aprender más sobre el trabajo con objetos en Hibernate: 

[Enlace de interés](https://docs.jboss.org/hibernate/core/3.5/reference/es-ES/html/objectstate.html)

Los estados de objeto disponibles en Hibernate son los siguientes:

**Transitorio**

Este será el caso de un objeto que ha sido instanciado mediante el operador new pero que no está asociado a una sesión de Hibernate. Por tanto, este objeto no tiene una representación persistente en la base de datos ni tampoco un valor identificador asignado. Las instancias de este tipo serán destruidas por el recolector de basura si la aplicación no mantiene más una referencia. Mediante la Session de Hibernate podemos hacer el objeto persistente de forma sencilla dado que Hibernate gestionará el SQL necesario para dicho cambio.

**Persistente**

En este caso, la instancia ya tiene un valor identificador y una representación en la base de datos y se encuentra en el ámbito de una sesión. Cualquier cambio en este estado Hibernate lo detecta y sincroniza el estado con la base de datos. 

**Separado**

Se trata de un objeto persistente pero que su sesión se ha cerrado. Por tanto, la referencia al objeto es válida y dicha instancia separada se puede modificar. Las instancias separadas pueden ser persistidas de nuevo).

Las operaciones que podemos hacer con objetos son las siguientes:  

* Hacer un objeto persistente  
* Cargar un objeto 
* Consultar un objeto 
* Modificar un objeto 
* Borrado de un objeto 
* Replicar objeto     

<img src="images/c5/5-transitorio.png">

<img src="images/c5/5-rellenar-3.png">

## 8. Mapeo de herencias

Un problema que nos puede surgir al utilizar un ORM es la de que resulte más lento que un desarrollo utilizando JDBC. Esto se debe a que cuando creamos un aplicativo con JDBC es posible establecer el número de SQL que se lanzarán y de este modo optimizar cada una.   

Por lo contrario, dado que Hibernate se superpone en ese rol al ser el responsable de lanzar las sentencias SQL puede ocurrir que el rendimiento de la aplicación se reduzca.  

Si conocemos Hibernate con detalle podremos ajustar las SQLs que lanza para mejorar el rendimiento de la aplicación. 

##### Enlace de interés

En el siguiente enlace tienes un ejemplo de cómo optimizar las consultas en Hibernate 

[Enlace de interés](http://www.profesor-p.com/2019/04/05/optimizando-consultas-con-hibernate/)

### 8.1 El problema de las N + 1 selects

Un problema común a Hibernate y otros ORM es debido a que cuando lanzamos una consulta con HQL que devuelve N filas por lo contrario el ORM lanzará N + 1 select de SQL lo que acarrea una bajada de rendimiento importante.      

**Si partimos del siguiente modelo de clases**

<img src="images/c5/5-modelo-clases.png">

*Modelo de clases*

**Y del siguiente modelo de tablas**

<img src="images/c5/5-modelo-tablas.png">

*Modelo de tablas*

Vemos que el siguiente código va a listar todos los clientes y para cada cliente listará todas sus direcciones de correo electrónico mediante una única consulta de HQL a través de Hibernate. 

<img src="images/c5/5-lista-clientes.png">

Cuando lanzamos el código y verificamos las selects de SQL comprobamos que se ha lanzado una consulta inicial para obtener todos los clientes y después se lanza otra consulta para cada cliente y con ello poder conseguir los emails de cada uno de los clientes. Por tanto, se verifica lo que se introducía en el enunciado de que se han lanzado N + 1 selects, donde N corresponde al número de filas que nos ha devuelto la consulta inicial. 

##### Enlace de interés

Recomendaciones para una mayor eficiencia en el uso de Hibernate por la Junta de Andalucía. 

[Enlace de interés](http://www.juntadeandalucia.es/servicios/madeja/contenido/libro-pautas/46)

### 8.2 Solución con left join fetch

Una solución eficaz es que la consulta HQL también cargue las direcciones de correo electrónico. Esto lo conseguimos haciendo un LEFT JOIN FETCH entre los clientes y los correos electrónicos.

Mediante la siguiente consulta HQL conseguimos el efecto deseado del LEFT JOIN FETCH entre clientes y correos electrónicos:

**`SELECT c FROM Cliente c LEFT JOIN FETCH c.correosElectronicos`**

De este modo el LEFT JOIN FETCH se realiza entre nuestra tabla principal y la propiedad Clientes.correosElectronicos ya que es de la que queremos cargar todos los elementos.

El código sería este: 

<img src="images/c5/5-codigo-8-2.png">

Con solo modificar la primera línea la select resultante se habrá corregido el problema.

```
SELECT cliente0_.Id AS Id0_0_, correosele1_.IdCorreo AS IdCorreo1_1_, cliente0_.nombre AS nombre0_0_, cliente0_.apellido1 AS ape3_0_0_, profesor0_.apellido2 AS ape4_0_0_, correosele1_.direccionCorreo AS direccio2_1_1_, correosele1_.idCliente AS idCliente1_1_, correosele1_.idCliente AS idCLiente0_0__, correosele1_.IdCorreo AS IdCorreo0__ FROM Cliente cliente0_ LEFT OUTER JOIN CorreoElectronico correosele1_ ON cliente0_.Id=correosele1_.idCliente
```

Queda claro que se ha realizado un Left Outer Join entre la tabla Cliente y la tabla CorreoElectronico pero no soluciona el problema del todo. Porque los objetos Cliente todavía se repiten debido a que SQL no admite consultas jerárquicas. Debido a esto está devolviendo todos los clientes con todas las direcciones de correo electrónico, así que un mismo cliente se repite por igual número de veces que correos tenga. 

Al no ser capaz Hibernate de suprimir las repeticiones, será Java quien tendrá que eliminarlas. Para conseguir dicha eliminación lo que podemos hacer es pasarlos a un set (que no admite duplicidades en los objetos, algo que list si que permite). Posteriormente, de vuelta, los regresamos a la lista.

<img src="images/c5/5-codigo-8-2-2.png">

En la cuarta línea añadimos los elementos de la lista al Set. Con ello se eliminan duplicados. En la quinta línea eliminamos la lista y en la sexta trasladamos de nuevo a la lista ya depurada.

En el código presentado se ha optado por usar LinkedHashSet y no HashSet porque LinkedHashSet garantiza que la obtención de datos de la línea 6 se produce en el orden que estaban insertados.

Hibernate también incorpora un mecanismo de consultas nativas que permite saltarnos su propia generación de consultas de modo que el usuario pueda generar y lanzar sus propias SQL sin considera que puede realizar una mejor optimización.  

Igualmente, Hibernate dispone de SQL personalizadas, de modo que el desarrollador puede establecer las SQL a utilizar cuando se realizan inserciones, actualizaciones y borrados si las propias de Hibernate generasen problemas.  

Mediante el fichero de mapeo de Hibernate utilizando estos tags, es sencillo especificar las SQL personalizadas:     

```sql
<sql-insert>
<sql-update>
<sql-delete>
```  

A continuación vemos el ejemplo para la clase Cliente en el fichero Cliente.hbm.xml

<img src="images/c5/5-fichero-1.png">

Comprobamos que entre la línea 19 y la 21 se definen las 3 SQLs y que por ser nativas podrían utilizar cualquier especificidad con tal de que la base de datos que van a atacar lo pudiese soportar.

Ejecutando este código nos resultará sencillo visualizar las SQLs definidas.

<img src="images/c5/5-fichero-2.png">

Donde en la sexta línea se ha insertado una fila. En la línea 11 se ha actualizado y en la 15 se ha borrado.

El resultado por pantalla sería el siguiente:         

Hibernate: `select max(Id) from Cliente`         

Hibernate: `INSERT INTO Cliente (Nombre,Apellido1,Apellido2,Id) VALUES (?,?,?,?)`        

Hibernate: `UPDATE Cliente SET Nombre=?,Apellido1=?,Apellido2=? WHERE Id=?`        

Hibernate: `DELETE FROM Cliente WHERE Id=?`  

Como hemos visto hasta ahora, implementar la capa de persistencia con Hibernate es bastante fácil y dado que es la implementación JPA más difundida, es normal su uso común en las aplicaciones Java.   

Pero en ocasiones, cuando los requisitos de rendimiento que demandan las aplicaciones suben, es necesario optimizar Hibernate para poder dar respuesta a ello.  

Encontrar los problemas de rendimiento lo antes posible es clave para el éxito de una implantación con Hibernate. El problema principal es que la mayoría de los fallos de rendimiento apenas son detectables en un sistema de pruebas pequeño. Por eso, si el entorno de test no está correctamente definido, seguramente sea de poca utilidad. Por ejemplo, realizar pruebas de carga con una base de datos pequeña y sólo un usuario concurrente, está claro que dista mucho del entorno que nos encontraremos en producción.  

Aunque los problemas de rendimiento son difíciles de encontrar en un sistema de pruebas, analizar las estadísticas internas puede ayudar. Una forma de hacerlo es activar las estadísticas de Hibernate configurando la propiedad del sistema hibernate.generate_statistics a true y log level para org.hibernate.stat.

Hibernate recopilará algunas estadísticas internas sobre cada sesión, como el número de consultas realizadas y el tiempo invertido en ellas, o el número de aciertos y fallos de la caché.  

Puedes utilizar esta información durante el desarrollo y verificarla en función de tus expectativas. Haciendo esto regularmente, puedes evitar los problemas más comunes causados por consultas lentas, demasiadas consultas y fallos de caché.    
Las consultas lentas no son un problema específico de JPA o Hibernate. Este tipo de problemas de rendimiento ocurre con cualquier framework, incluso con SQL simple sobre JDBC y necesita ser analizado y corregido a nivel de SQL y de base de datos. Si lo haces, dejarás de reconocer a menudo que no puedes realizar estas consultas SQL más complejas u optimizadas con JPQL o la API de Criteria. En estos casos es necesario utilizar una consulta nativa para realizar una sentencia SQL nativa, en la que se pueden utilizar todas las funciones de SQL y de la base de datos.        

Otro problema común es el uso de un FetchType incorrecto. Usar el FetchType incorrecto puede resultar en un gran número de consultas que se realizan para cargar las entidades requeridas. El principal problema de la definición de FetchType es que sólo se puede definir un FetchType para una relación.   

Puede ser una buena idea trasladar a la base de datos operaciones no demasiado complejas y de gran volumen de datos. Hay múltiples maneras de hacerlo. Puedes realizar operaciones sencillas en consultas JPQL y SQL nativas. Y si necesitas operaciones más complejas, puedes llamar a los procedimientos almacenados a través de @NamedStoredProcedureQuery o la API Java correspondiente.   

##### Enlace de interés

Documentación oficial de Hibernate para la mejora de rendimiento.

[Mejora de rendimiento](https://docs.jboss.org/hibernate/orm/3.5/reference/es-ES/html/performance.html)

### 8.3 Usar cachés para evitar leer los mismos datos varias veces

El diseño modular de la aplicación y las sesiones de usuario paralelas a menudo dan como resultado la lectura de los mismos datos varias veces. Es bastante obvio que se trata de una sobrecarga que se debe tratar de evitar. Una manera de hacer esto es almacenar en caché los datos que se leen con frecuencia y no cambian mucho.  

Como se puede ver a continuación, Hibernate ofrece tres cachés diferentes que se pueden combinar entre sí:       

<img src="images/c5/5-cache.png">

La caché de primer nivel se activa de forma predeterminada y almacena en caché todas las entidades que se utilizaron en la sesión actual.  

La caché de segundo nivel independiente de la sesión también almacena entidades, pero necesita ser activada configurando la propiedad shared-cache-mode en el archivo persistence.xml. La caché de entidades específicas puede activarse añadiendo la anotación javax.persence.Cacheable o org.hibernate.annotations.Cache a la entidad.  

La caché de consulta es la única que no almacena entidades. Almacena en caché los resultados de la consulta y sólo contiene referencias de entidades y valores escalares. Debe activarse la caché configurando la propiedad hibernate.cache.use_query_cache en el archivo persistence.xml y configurar la propiedad cacheable en la consulta.

<img src="images/c5/5-video-11.png">

[Video](https://www.youtube.com/watch?v=v2CQmJ0Betw&feature=emb_logo)

### 8.4 Realizar actualizaciones y eliminaciones en masa

Actualizar o borrar una entidad tras otra parece bastante natural en Java, pero también es muy ineficiente. Hibernate crea una consulta SQL para cada entidad que se actualiza o elimina. El mejor enfoque sería realizar estas operaciones por lotes creando instrucciones de actualización o eliminación que afecten a varios registros a la vez.  

Esto se puede hacer mediante sentencias SQL utilizando las operaciones CriteriaUpdate y CriteriaDelete.    

<img src="images/c5/5-crusi-7.png">

<img src="images/c5/5-crusi-8.png">

### Resumen Final

En este módulo hemos considerado los problemas y requerimientos que han conducido al desarrollo de Hibernate. Hemos visto algunos ejemplos de una aplicación trivial con y sin la ayuda de Hibernate para aprender cuáles son los beneficios de utilizar un framework en las operaciones de persistencia.  

Además, hemos presentado los elementos fundamentales de Hibernate, así como analizado el desajuste del paradigma relacional de los objetos y las herramientas de ORM, como el marco Hibernate, para resolver este desajuste. También hemos profundizado en los detalles de la configuración de Hibernate, la asignación de las clases a las tablas de la base de datos y el diseño de entidades persistentes.  

Igualmente, nos hemos sumergido en aspectos mucho más avanzados como los que tienen que ver con la optimización del acceso a los datos, que daría mucho más de sí pero es un buen punto de partida para comenzar a introducirte en él y poder profundizar posteriormente.  

Con la finalización de este aprendizaje sobre Hibernate estarás ya en condiciones de desarrollar cualquier aplicación en la plataforma Java.        

### BIBLIOGRAFÍA

* Baeur, Christian (2015). Java persistence with Hibernate. Manning.
* Martín Sierra, Antonio (2016). Curso de Hibernate con Java. Grupo Syncrom.
* Pérez Martínez, Eugenia. (2015). Hibernate. Persistencia de objetos en JEE. Ra-Ma Editorial.
* Shach, S. (2005). Análisis y diseño Orientado a Objetos, con UML y el proceso unificado. México. Mc Graw Hill.
* Hibernate Everything data. Recuperado de: https://hibernate.org/
* Hibernate con Spring. Recuperado de: http://www.cursohibernate.es/doku.php
* La web del programador. Recuperado de: https://www.lawebdelprogramador.com/
* Thoughts on Java. Recuperado de: https://thoughts-on-java.org

