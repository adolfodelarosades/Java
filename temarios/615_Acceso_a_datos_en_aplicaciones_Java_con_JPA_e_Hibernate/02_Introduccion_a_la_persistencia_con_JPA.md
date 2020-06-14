# 2. Introducción a la persistencia con JPA 29:16

* 02 Introducción a la persistencia 04:49
* 03 Java persistence API 04:09
* 04 Instalación del software 05:36
* 05 Creación de una capa de persistencia con JPA parte 1 03:47
* 06 Creación de una capa de persistencia con JPA parte 2 10:14
* Autoevaluación I 00:41

## 02 Introducción a la persistencia 04:49

En esta primera lección del curso de persistencia con JPA voy a explicarte lo que es una capa de persistencia y qué beneficios nos va a aportar en la creación de aplicaciones.

En primer lugar nos preguntamos qué es exactamente una capa de persistencia pues es una capa que aparecería entre lo que es la lógica de negocio de una aplicación la lógica aplicación.

Las instrucciones de acceso a datos etcétera y la propia base de datos.

La idea es que a través de la capa de persistencia los datos de la base de datos las filas columnas las tablas en definitiva se expongan a la aplicación en forma de objetos de manera que el programador cuando quiera programar instrucciones para acceder a datos no tenga que cambiar de mentalidad y pasar del mundo de los objetos al mundo relacional.

El mundo de las tablas con sus filas y columnas sino que directamente los datos se han expuesto como objetos y pueda hacer las operaciones de manipulación de datos contra objetos no contra lo que sería la base de datos relacional.

El principal componente de una capa de persistencia es la entidad esos objetos que se exponen en la capa de persistencia y que realmente representan como ver la imagen fila de una tabla de la base de datos.

Se les conoce como entidades a la hora de definirlos lo definiremos mediante clases tipo Java Bean estándares es decir con sus atributos para almacenar cada uno de las columnas de la fila que representan en esa tabla y con sus métodos se Brighter para poder acceder a ellos.

Entonces las operaciones sobre la capa de persistencia que realizará la lógica de negocio consistirá no en mandar instrucciones SQL la base de datos sino en crear objetos entidades, modificar entidades, eliminar entidades, recuperar entidades, siempre trabajando con este tipo de objetos para trabajar con una capa de persistencia.

Existen los llamados Frentes de persistencia que no son más que utilidades creadas por terceros que nos facilitan tanto la creación de la capa de persistencia como su posterior manipulación desde una lógica de negocio en una aplicación entre los Frameworks de persistencia más populares.

Tenemos por ejemplo Hibernate e iBatis y el que nos ocupa en este curso que es JPA y que como vamos a ver más adelante pues no es exactamente un Frameworks sino más bien una especificación y qué nos ofrece esos Frameworks de persistencia en primer lugar nos van a ofrecer pues un motor de persistencia que es un software ya creado.

Las librerías Java que se encargan de todo lo que es lo que llamamos el mapeo ORM es decir estos datos realmente representan con filas reales de una tabla una base de datos quien se encarga de sincronizar esto, El motor de persistencia.

Cuando nosotros añadamos o modifiquemos entidades esas instrucciones se reflejarán en la base de datos a través del motor de persistencia que se encargará de todas las operaciones JDBC contra dicha tabla de la base de datos.

Además se nos proporciona un sistema de configuración para indicarle al motor de persistencia cómo tiene que trabajar y eso ya depende de cada tipo de Frameworks si es basado en XML en anotaciones y por supuesto un API es decir el modelo la lógica de negocio ya no va a utilizar JDBC para acceder a la base de datos porque no va a acceder directamente a la base de datos va a acceder a la capa de persistencia y eso implica utilizar un conjunto de clases e interfaces específicos para manipular esas entidades y que como ya verás a lo largo del curso mucho más sencillo que el clásico JDBC con sus instrucciones SQL en nuestro caso este curso lo vamos a centrar en JPA Java persistan API que es una especificación de Java para la configuración y gestión de una capa de persistencia.

La idea es que a diferencia de otros Framework que son muy específicos es decir por ejemplo Hibernate pues todo lo que proporciona es para trabajar con Hibernate pues JPA pretende ser universal es decir pretende ser compatible con otros Framework existentes de manera que por ejemplo nosotros podríamos tener un motor Hibernate o motor iBatis y trabajar con el mismo API el mismo API JPA cuya idea es que sea compatible con los diferentes Framework de persistencia existentes.

Es una pista vandalizado que ya digo forma parte de Java Enterprise Edition y nos va a proporcionar ese acceso estandarizado a la capa de persistencia independientemente del motor que nosotros queramos utilizar después ya posterior elecciones vamos a ir profundizando en cómo se crea la capa de persistencia y cómo utilizar este API dentro de nuestras aplicaciones.

## 03 Java persistence API 04:09

En esta elección vamos a ver los elementos software que necesitamos para poder trabajar con JPA tanto creación de capa de persistencia como su utilización desde las aplicaciones.

Aquí tenemos resumidos los tres bloques de programas que necesitamos en primer lugar el Java Development Kit que es el kit de desarrollo Java.

Cualquier aplicación JPA está basada en Java y por lo tanto vamos a necesitar este paquete básico un entorno de desarrollo que nos facilite la creación de los programas y por supuesto la base de datos con la que vamos a trabajar.

Al hablar de persistencia lógicamente estamos necesitamos una base de datos en la que se almacene dicha información además de un Reimer que va a ser el intermediario que utilice las aplicaciones para poder acceder a la base de datos Java Development Kit.

Como decíamos JDK es el kit básico que nos proporciona Oracle para trabajar con Java y además de la máquina virtual Java incluye la librería Java estándar por supuesto y herramientas para compilar y ejecución y ejecutar programas que se usan desde la línea de comandos pero para eso utilizaremos dos después de instalar esto un entorno de desarrollo que facilitará el uso de estas herramientas y no tengamos que bajar la línea de comandos para manejarlas.

En esta dirección vamos a poder descargar el JDK última versión como decía el JDK tenemos la base pero no lo vamos a manejar directamente nosotros necesitamos un entorno de desarrollo que lo maneje por nosotros y nos facilite la tarea de creación de los programas compilación pruebas entre los más utilizados.

Tenemos NetBeans y Eclipse ambos de libre distribución pero como digo no son los únicos en este curso vamos a centrarnos en Eclipse que es el más utilizado por la comunidad de desarrolladores Java también vamos a necesitar una base de datos y en este curso vamos a utilizar SQL.

Todo lo que vamos a estudiar sería aplicable a cualquier base de datos pero vamos a manejar a utilizar ese SQL por su sencillez y su potencia no solamente sencillos sino también la potencia va a ser muy sencillo crear bases de datos con mayor SQL poblarla inspeccionarlos etc..

Las herramientas para trabajar con mayor SQL en el caso de Windows las encontramos en esta dirección donde Aquí podrás encontrar el motor de base de datos y luego alguna herramienta gráfica como Wordpress que nos facilite la creación y la utilización de dichas bases de datos.

Cuántos sistemas operativos sería esta la dirección y también la web de Maya SQL.

Concretamente en esta dirección podríamos descargarnos en River para manejar la base de datos de conio.

A continuación podéis ver las direcciones que indicábamos antes en la presentación.

Aquí tenemos en primer lugar la dirección de descarga del JDK que sería pulsando este botón que tienes aquí y el proceso de instalación es muy sencillo sería siguiendo todos los pasos hasta el final.

Después nos iríamos a otra dirección para la descarga de Eclipse.

En esta dirección puedes encontrar muchos packs de instalación para descargar e instalar Eclipse.

Yo recomiendo el Eclipse de Java developers puesto que es el más completo.

Incluye todo lo necesario para construir aplicaciones web que es donde vamos a utilizar fundamentalmente la persistencia a continuación tenemos la dirección de descarga de mayo se cuele aquí.

Por un lado podríamos descargar el servidor de media SQL de base de datos y el Word que es una herramienta gráfica para manejar la base de datos.

En esta última dirección es donde tendríamos la descarga de el driver de mayo SQL tienes la última versión que sería 5 1 42 sobre la descarga e instalación de malla SQL.

Si tienes algún problema a la hora de descargar estas versiones de servidor Worden yo te voy a proporcionar también un conjunto de archivos bueno por un lado aquí tenemos estos tres archivos que vienen ya te digo te lo voy a proporcionar dentro de lo que es el material adicional viene todo comprimido dentro de un archivo y tendrías estos tres por un lado tenemos el driver.

Vale te lo puedes descargar desde aquí te lo incluido.

Si no quieres descargar y con esto hay que hacer nada simplemente se utilizará cuando se nos vaya pidiendo las lecciones que va a seguir estudiando más adelante a lo largo del curso fundamentalmente para la configuración del motor de persistencia que es el que utiliza el driver para acceder a la base de datos.

Pero ya te digo con esto no hay que hacer nada simplemente lo tienes estos dos archivos corresponden a unos los programas de instalación de malla SQL por un lado teníamos SQL Essential que es para instalar el servidor de base de datos y el Windows que se instala posteriormente y que es una herramienta gráfica para manejar de forma sencilla el motor de base de datos y crear bases de datos de forma gráfica e inspeccionar las configurarlas etc. son un poquito más antiguos de los problemas que tenemos aquí en la página oficial pero bueno son perfectamente válidos para lo que vamos a ver en el curso y de hecho son los que yo voy a utilizar en esta versión de mayo SQL en la que voy a utilizar los ejercicios que voy a seguir viendo a lo largo de todas las lecciones que te voy a ir presentando.

Esto te lo voy a proporcionar como digo dentro material adicional y son también de libre distribución los podrías encontrar en Google escribiendo su nombre directamente en el Google los encontrarías y también los puedes descargar pero en cualquier caso te lo voy a proporcionar.

## 04 Instalación del software 05:36

En esta elección vamos a ver los elementos software que necesitamos para poder trabajar con JPA tanto creación de capa de persistencia como su utilización desde las aplicaciones.

Aquí tenemos resumidos los tres bloques de programas que necesitamos en primer lugar el Java Development

Kit que es el kit de desarrollo Java.

Cualquier aplicación JPA está basada en Java y por lo tanto vamos a necesitar este paquete básico un entorno de desarrollo que nos facilite la creación de los programas y por supuesto la base de datos con la que vamos a trabajar.

Al hablar de persistencia lógicamente estamos necesitamos una base de datos en la que se almacene dicha información además de un Reimer que va a ser el intermediario que utilice las aplicaciones para poder acceder a la base de datos Java Development Kit.

Como decíamos JDK es el kit básico que nos proporciona Oracle para trabajar con Java y además de la máquina virtual Java incluye la librería Java estándar por supuesto y herramientas para compilar y ejecución y ejecutar programas que se usan desde la línea de comandos pero para eso utilizaremos dos después de instalar esto un entorno de desarrollo que facilitará el uso de estas herramientas y no tengamos que bajar la línea de comandos para manejarlas.

En esta dirección vamos a poder descargar el JDK última versión como decía el JDK tenemos la base pero no lo vamos a manejar directamente nosotros necesitamos un entorno de desarrollo que lo maneje por nosotros y nos facilite la tarea de creación de los programas compilación pruebas entre los más utilizados.

Tenemos NetBeans y Eclipse ambos de libre distribución pero como digo no son los únicos en este curso vamos a centrarnos en Eclipse que es el más utilizado por la comunidad de desarrolladores Java también vamos a necesitar una base de datos y en este curso vamos a utilizar SQL.

Todo lo que vamos a estudiar sería aplicable a cualquier base de datos pero vamos a manejar a utilizar ese SQL por su sencillez y su potencia no solamente sencillos sino también la potencia va a ser muy sencillo crear bases de datos con mayor SQL poblarla inspeccionarlos etc..

Las herramientas para trabajar con mayor SQL en el caso de Windows las encontramos en esta dirección donde Aquí podrás encontrar el motor de base de datos y luego alguna herramienta gráfica como Wordpress que nos facilite la creación y la utilización de dichas bases de datos.

Cuántos sistemas operativos sería esta la dirección y también la web de Maya SQL.

Concretamente en esta dirección podríamos descargarnos en River para manejar la base de datos de conio.

A continuación podéis ver las direcciones que indicábamos antes en la presentación.

Aquí tenemos en primer lugar la dirección de descarga del JDK que sería pulsando este botón que tienes aquí y el proceso de instalación es muy sencillo sería siguiendo todos los pasos hasta el final.

Después nos iríamos a otra dirección para la descarga de Eclipse.

En esta dirección puedes encontrar muchos packs de instalación para descargar e instalar Eclipse.

Yo recomiendo el eclipse de Java developers puesto que es el más completo.

Incluye todo lo necesario para construir aplicaciones web que es donde vamos a utilizar fundamentalmente la persistencia a continuación tenemos la dirección de descarga de mayo se cuele aquí.

Por un lado podríamos descargar el servidor de media SQL de base de datos y el Word que es una herramienta gráfica para manejar la base de datos.

En esta última dirección es donde tendríamos la descarga de el driver de mayo SQL tienes la última versión que sería 5 1 42 sobre la descarga e instalación de malla SQL.

Si tienes algún problema a la hora de descargar estas versiones de servidor Worden yo te voy a proporcionar también un conjunto de archivos bueno por un lado aquí tenemos estos tres archivos que vienen ya te digo te lo voy a proporcionar dentro de lo que es el material adicional viene todo comprimido dentro de un archivo y tendrías estos tres por un lado tenemos el driver.

Vale te lo puedes descargar desde aquí te lo incluido.

Si no quieres descargar y con esto hay que hacer nada simplemente se utilizará cuando se nos vaya pidiendo las lecciones que va a seguir estudiando más adelante a lo largo del curso fundamentalmente para la configuración del motor de persistencia que es el que utiliza el driver para acceder a la base de datos.

Pero ya te digo con esto no hay que hacer nada simplemente lo tienes estos dos archivos corresponden a unos los programas de instalación de malla SQL por un lado teníamos SQL Essential que es para instalar el servidor de base de datos y el Windows que se instala posteriormente y que es una herramienta gráfica para manejar de forma sencilla el motor de base de datos y crear bases de datos de forma gráfica e inspeccionar las configurarlas etc. son un poquito más antiguos de los problemas que tenemos aquí en la página oficial pero bueno son perfectamente válidos para lo que vamos a ver en el curso y de hecho son los que yo voy a utilizar en esta versión de mayo SQL en la que voy a utilizar los ejercicios que voy a seguir viendo a lo largo de todas las lecciones que te voy a ir presentando.

Esto te lo voy a proporcionar como digo dentro material adicional y son también de libre distribución los podrías encontrar en Google escribiendo su nombre directamente en el Google los encontrarías y también los puedes descargar pero en cualquier caso te lo voy a proporcionar.

## 05 Creación de una capa de persistencia con JPA parte 1 03:47

En esta elección vamos a crear nuestra primera capa de persistencia con JPA y vamos a indicar el proceso que tenemos que seguir para ello básicamente son dos pasos que tendremos que hacer para crear una capa de persistencia es crear y configurar las entidades que configurarán esa configuración se realiza a través de unas anotaciones que ahora comentaremos.

Y en segundo lugar configurar el archivo persisten XML en el que se debe indicar que dentro de la Unidad de persistencia correspondiente qué proveedor de persistencia vamos a utilizar un motor de persistencia.

La lista de entidades que van a formar parte de esa unidad de persistencia y por supuesto las propiedades de conexión a la base de datos que necesitará dicho proveedor la base de datos con la que vamos a trabajar es una base datos que se suele llamar a contacto base datos como nombre agenda la tabla sobre la que vamos a trabajar los contactos en la lección anterior.

Uno de los archivos adicionales de contenido material adicional te explica el proceso para instalar y SQL precisamente para crear esta base de datos con la que vamos a trabajar ahora.

Tener la tabla cuatro campos identificador numérico nombre contacto email y teléfono.

Una vez que lleguemos al primer paso creación de la entidad la entidad como tal va a ser una clase tipo Java Bean como las que podemos utilizar para encapsular cualquier conjunto de datos en Java tendrá sus atributos que corresponderán con los diferentes campos de las columnas de la base de datos cuya información va a almacenar.

Recordemos que la entidad los objetos de la entidad lo que van a almacenar es el contenido de una fila.

Básicamente los métodos para acceder a dichos campos encontraremos efectivamente unas anotaciones a nivel de clase y a nivel de atributo que indicarán cierta información al motor de persistencia relativo a esta entidad.

Entre las más interesantes las más importantes por ejemplo arroba Entity indicará que se trata de una clase identidad.

Esta notación se utiliza durante la clase arroba table que mapea la entidad con la tabla de la base datos a la que va asociada y ya a nivel de atributo.

Por ejemplo arroba IDE que va delante del atributo que hace de clave primaria Toda entidad tiene que tener una clave primaria que le permita al motor de persistencia identificar cada objeto de la capa de persistencia de la Unidad de persistencia e identificar en este caso unos contactos de otros a través de este atributo y arroba generate value que es la estrategia de generación de esta clave primaria.

En este caso se trata de un campo identidad autogenerados una notación que no aparece en el ejemplo este listado es arroba Colom que sería una notación que habría que indicar delante de cada columna de cada atributo para indicar el nombre de la columna de la base de datos con la que está asociada.

Obviamente la tabla contactos como los atributos coinciden con los nombres de las columnas no es necesario utilizarlos y no coincidieran y habría que utilizar la notación arroba Column delante de cada atributo para indicar exactamente a qué columna está asociado.

Dicho atributo persiste en XML pues al final deberán quedar segunda parte del proceso.

Algo parecido a esto donde indicaremos la unidad de persistencia de persistencia dentro de ella.

El proveedor que se va a utilizar la clase de la lista de clase de entidades y como ver las propiedades de conexión a la base de datos.

Vamos a ver cómo generar todo esto con un ejemplo concreto.

## 06 Creación de una capa de persistencia con JPA parte 2 10:14

El ejercicio que vamos a desarrollar será una aplicación de consola donde vamos a crear una capa de persistencia para posteriormente en la siguiente elección empezar a utilizar la API JPA para acceder a ella.

Para ello vamos a utilizar el entorno de desarrollo Eclipse que instalamos en la elección anterior y nos vamos a situar dentro de la perspectiva Java si aparece otra perspectiva por defecto atrás de este botoncito elegiremos la perspectiva Java que es la más adecuada para este tipo de proyecto.

Una vez estemos en perspectiva Java vamos a crear nuestro proyecto con la opción free new Java prohibí por ejemplo 1.

Ejemplo JPA Es como lo vamos a llamar a nuestro proyecto JDK que hemos instalado también previamente a la instalación de Eclipse y aquí directamente vamos a finalizarã a partir de ahora vamos a crear ya la capa de persistencia.

Lo primero es preparar el proyecto para que pueda ser disponga de alguna de las plantillas y opciones de menú propios de JPA donde lo que vamos a hacer es a través del botón derecho nos vamos a ir a las propiedades del proyecto y en proyecto faites aparecerán o deberían aparecer una lista de propiedades de características que queramos añadir a nuestro proyecto.

Como es un proyecto Java estándar no suelen aparecer por defecto esas características hay que pulsar a este enlace para que ahora ya aparezcan una serie de características como digo que hará que Eclipse incorpore nuevos menus librerías etcétera en nuestro caso vamos a activar la opción JPA al activar la opción JPA aparece este enlace tanto antes de darle OK vamos a pulsar en este enlace para habilitar unas propiedades de JPA que concretamente van a consistir en indicarle Eclipse qué motor vamos a utilizar si no es un motor que lo incorpore el propio elipses.

Entonces aquí dedicaríamos nada en plataforma generic 2.1 que es la especificación de JPA actual y donde dice tipo simplemente deshabilita haríamos configuración de librería para luego posteriormente añadirla nosotros manualmente pero resulta que Eclipse incorpora ya un motor una librería de motor de proveedor de persistencia que es el eclipse Elim muy parecido a Tomlin de Oracle.

Entonces bueno vamos a elegir la opción user Library y si no nos aparece aquí ninguna librería ya marcada es porque aún no la ha descargado.

En mi caso como ya he utilizado crear un proyecto entre huesped podría la descarga una vez y desaparece pero si no le damos a este botoncito el disco y aparece las posibles librerías a descargar elegiríamos Eclipse Linh 2.5.

El paso siguiente aceptaríamos la licencia y procedería a descargar dicha librería que ya la tendríamos disponible para el resto del proyecto de alguna speaks una vez que ya la tengamos descargada.

Pulsamos okay aquí también pulsamos OK y como veremos en la lista de librerías aquí la tenemos Eclipso

Linh todas las librerías del motor de persistencia Eclipse.

Vale bien pues además ya se ha creado también lo podemos ver a quienes se aprece en metáis.

El archivo persiste en XML pero bueno esto simplemente es una plantilla está preparado para empezar el proceso de creación de las entidades y en segundo lugar la creación del archivo XML porque ya está creado pero si su configuración.

Vamos con la creación de las entidades con el botón derecho nos vamos a la acción JPA Tools generar entidades desde tablas aquí nos aparecerá una lista de posibles conexiones con base datos ya creadas por este asistente.

Asistente cada vez que queramos generar entidades habráque al propio asistente darle unos datos de conexión con la base de datos de la que quiere sacar las entidades.

Y si con Connecta alguna vez con la base de datos de SQL pues mi caso ha sido así porque aparecen aquí unas conexiones creadas.

Pero bueno si no es la primera vez pues entonces habrá creado este botón para crear una conexión contra mayor SQL indicaremos asociamos nombres a conexiones una colección propia de este asistente SQL prueba por ejemplo en el paso siguiente ya nos van a pedir los datos de conexión a la base de datos para que este asistente como digo pueda conectar con ella y extraer la información para generar las entidades en primer lugar debemos indicar el driver de mayor secuela que queremos utilizar este botoncito aquí elegimos la opción más SQL 5.1.1 le damos un nombre un nombre propio interno el del asistente y eso sí en Yarelis aparece un nombre de archivo que realmente no existe tenemos que eliminar y aquí lo que debemos incluir es la localización del archivo jar de nuestro driver que aunque queramos utilizar vamos que va a utilizar el asistente para conectarse con la base de datos en la elección anterior como recuerdas tuvimos que descargar un Reimer vamos a añadirlo vamos al botón de decir lo localizamos la carpeta donde lo tengamos porque no había que instalar nada con ese archivo.

Simplemente había que descargarlo y guardarlo en algún sitio pues no localizamos y ya lo tenemos pulsamos OK y ahora Rellenamos los datos de conexión a la base de datos con nuestra base de datos se llama agenda aquí también indicaremos agenda y los datos los credenciales Rut y Rut era también la contraseña.

Podemos hacer un test de conexión para probar que efectivamente conecta con la base de datos.

En el siguiente paso simplemente es un resumen y finalizamos y ahora se habrá localizado ya.

Efectivamente ahí el esquema parecerá la base de datos agenda la lista de tablas que la conforman.

En nuestro caso sólo nos interesa la tabla contactos que la única que tenemos es tarde usuarios la tengo yo ahí no se va a usar en este ejercicio.

En el siguiente paso que asociaciones entre tablas existen si solo hay una tabla no tienen sentido hablar de asociaciones así que nada.

Siguiente.

Y aquí nos va a preguntar por ejemplo sobre la primera y que va a ser autogenerados o autogenerados si no fuera autogenerados por aquí dejaríamos nuestro caso sí que lo es el tipo de identidad que sea la opción que elegiremos.

Esto se queda por defecto ya que indicaremos el nombre del paquete donde queremos guardar esa clase entidad en el siguiente paso nos va a dar un resumen de cómo se va a llamar la clase.

Normalmente suele llamarse igual que la tabla pero en singular y con la primera letra mayúscula.

En cualquier caso a través de la notación arroba tablet se asocia esta clase con esta tabla y ya está finalizamos y ahora veremos aquí nuestra entidad contacto ya creada.

Como vemos la notación arroba Entity arroba table que veíamos en la transparencia anterior asociada con el nombre de la tabla y arroba columna aparece porque como ya te decía las nombres de los atributos de los campos coinciden con los nombres de las columnas.

Aquí aparece también una notación arroba name Cuadri que introduce automáticamente al asistente pero en este caso no vamos a utilizar para nada ni sería necesario que estuviera ahí ya hablaremos de la escuelas en la lección dedicada a las consultas por lo que la entidad ya está.

Ahora falta rellenar los datos del persiste en XML.

Aquí habría que indicar ya ves que la unidad de persistencia se ha creado como un nombre por defecto y la lista de entidades al crear la entidad y al añadir aquí que forman esa unidad de persistencia faltaría por indicar el probare el Provider es el nombre del proveedor utilizado.

Bueno este dato no es necesario puesto que al utilizar Eclipse Link que es el que trae Eclipse pues el Provider ya viene predeterminado entonces lo obtiene directamente de las librerías.

En cualquier caso podríamos asociable el nombre de nombres asociados a proveedores el que tenemos aquí en la presentación que te enseñantes aquí lo ves o reflejé con Kartli se apunta que existen puntos JPA punto persisten Roballo pero es el proveedor predeterminado y si no se indica nombre pues este es el que va a buscar así que en este caso bueno como no es necesario pues no lo vamos a no lo vamos a utilizar no lo vamos a indicar pero podríamos indicar ese nombre a Eclipse y lo que sí que falta son los datos de conexión a la base de datos pero en vez de incluirlos aquí manualmente podemos hacer lo siguiente cuando vamos al archivo y vamos a abrir ese archivo XML Open width con el editor persisten XML que nos permite abrirlo con verlo de una forma más amigable a través de esta serie de pestañas y si nos vamos a la pestaña Connection pues aquí tendríamos que indicar los datos de conexión a la base de datos lo primero es que la manera en que vamos a conectar con la base de datos va a ser con conexiones directas.

Eso implica elegir alquilación Resource local.

La otra opción JSA es cuando vamos a utilizar lo que se conoce como un data show que ya lo veremos en los casos en los que utilicemos persistencia dentro de un contexto una aplicación.

Ahí veremos cómo utilizar un data pero en este caso son conexiones directas.

Por lo tanto hay que elegir la opción versión local y en vez de incluir los datos aquí como digo manualmente le vamos a decir que los tenga de una de las conexiones que le creamos al asistente que ya están ahí todos los datos SQL prueba ya que toda la información y con esto ya tendrían la información suficiente del proveedor para conectar con la base de datos.

Aquí en Shur vemos cómo quedaría la lista de propiedades cada propiedad con su nombre y su valor correspondiente y esto la capa de persistencia a partir de ahí ya podríamos empezar a utilizarla desde una aplicación a través de la JPA cosa que veremos en posteriores elecciones.

## Autoevaluación I 00:41

Autoevaluación I

1. Una capa de persistencia:

* Requiere del uso de JDBC para acceder a los datos
* Expone los registros de la base de datos en forma de objetos
* Requiere el uso de un navegador compatible
* Se gestiona desde la vista de una aplicación
 

2. Indica cuál de las siguientes tecnologías corresponde a un framework de persistencia

* EJB
* JSF
* Hibernate
* Spring

3. Una entidad es

* Un API de persistencia
* Un archivo de configuración XML
* Un framework de persistencia
* Una clase

4. ¿Dónde se configuran los datos de conexión a la base de datos en JPA?

* A través de anotaciones
* En el archivo de configuración persistence.xml
* A través del API JPA
* En ficheros de texto .cfg

5. La anotación `@Id` de JPA se utiliza para

* Indicar la primary key de una entidad
* Indicar que la clase es una entidad
* Indicar la tabla a la que se asocia una entidad
* Indicar el valor predeterminado de un atributo
 

SOLUCIONES:

1.- B

2.- C

3.- D

4.- B

5.- A
